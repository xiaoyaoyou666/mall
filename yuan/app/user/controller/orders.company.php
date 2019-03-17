<?php

/*
 * Created on 2016-5-19
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */

class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        $this->category = $this->G->make('category');
        $this->module = $this->G->make('module');
        $this->orders = $this->G->make('orders', 'bank');
        $this->link = $this->G->make('link', 'content');
        $args22[] = array("AND", "status = :status", 'status', 1);
        $links = $this->link->getLinkList($args22, $page, 10);
        $this->tpl->assign('links', $links);
        $this->msg = $this->G->make('msg', 'user');
        $this->user = $this->G->make('user', 'user');
        $this->invoice = $this->G->make('invoice', 'user');
        $this->sap = $this->G->make('sap', 'item');
        $this->sapinfo = $this->G->make('sapinfo', 'item');
        $this->setorder = $this->G->make('setorder', 'core');

        //---买方的状态值-----对应字段--orderstatus-----
        $orderstatus = array(1 => '待确认', 2 => '待发货', 3 => '已发货', 4 => '已完成', 5 => '已收货', 99 => '已取消', 8 => '已投诉');
        //---卖方的状态值------对应字段------status_qufen----
        $orderstatus1 = array(1 => '待确认', 2 => '待发货', 3 => '待收货', 4 => '已完成', 5 => '退换货', 6 => '已收款', 7 => '已评论', 99 => '已取消');


        $this->tpl->assign('orderstatus', $orderstatus);
        $this->tpl->assign('orderstatus1', $orderstatus1);

        $this->cart = $this->G->make('cart','item');
        $cartNumArr = $this->cart->getCartUserNum();
        foreach ($cartNumArr as $k => $v) {
            $cartnums[] = $v['number'];
        }
        $cartNum = array_sum($cartnums)?array_sum($cartnums):0;
        $this->tpl->assign('cartNum',$cartNum);
        if (!method_exists($this, $action))
            $action = "index";
        $this->$action();
        exit;
    }

    private function modifyorder()
    {
        $oid = $this->ev->get('ordersn');
        $order = $this->orders->getOrderById($oid);
        $orderstatus = $this->ev->get('orderstatus');
        $reason = $this->ev->get('reason');
        if ($orderstatus && $reason) {
            $faq = array();
            $faq['reason'] = $reason;
            $faq['prestatus'] = $order['orderstatus'];
            $faq['status'] = $orderstatus;
            $faq['username'] = $this->_user['sessionusername'];
            $faq['time'] = TIME;
            $args = array();
            $args['orderstatus'] = $orderstatus;
            $args['orderfaq'] = $order['orderfaq'];
            $args['orderfaq'][] = $faq;
            if ($orderstatus == 4) {
                if (!$order['orderfinishtime'])
                    $args['orderfinishtime'] = TIME;
                $coin = 0;
                foreach ($order['orderitems'] as $item) {
                    $coin = $coin + $item['number'] * $item['itemprice'] * $item['goodsproperty']['itemcoin'];
                }
                $user = $this->user->getUserById($order['orderuserid']);
                $coin = $coin + $user['usercoin'];
                if ($order['ordersalerid'] != 139)
                    $this->user->modifyUserInfo(array('usercoin' => $coin), $order['orderuserid']);
                if (!$order['ordergivecoin'])
                    $args['ordergivecoin'] = 1;
            }
            $this->orders->modifyOrderById($oid, $args);
            $message = array(
                'statusCode' => 200,
                "message" => "订单修改成功",
                "callbackType" => 'forward',
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        }
        $message = array(
            'statusCode' => 300,
            "message" => "订单操作失败"
        );
        exit(json_encode($message));
    }

    private function sendorder()
    {
        $oid = $this->ev->get('ordersn');
        $order = $this->orders->getOrderById($oid);
        if ($order['orderstatus'] == 2) {
            $postname = $this->ev->get('postname');
            $postorder = $this->ev->get('postorder');
            if ($postname && $postorder) {
                $args = array();
                $args['orderpost'] = array('postname' => $postname, 'postorder' => $postorder);
                $args['ordersendtime'] = TIME;
                $args['orderfactfee'] = $this->ev->get('orderfactfee');
                $args['orderstatus'] = 3;
                $args['status_qufen'] = 3;
                $args['orderouttime']=TIME;
				$this->orders->modifyOrderById($oid,$args);
                //给买家发送发货消息
                $data  = array();
                $data['orderuserid'] = $order['orderuserid']; //收信人   买家
                $data['msg_content'] = '';
                $data['msg_url'] = 'index.php?user-company-ordersbuy-orderBuydetail&ordertype=1&sn='.$oid;
                $this->msg->sendMsg($data,3);

				$message = array(
					'statusCode' => 200,
					"message" => "订单发货成功",
				    "callbackType" => 'forward',
				    "forwardUrl" => "reload"
				);
				exit(json_encode($message));
			}
            else
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "请填写物流信息"
                );
                exit(json_encode($message));
            }
		}

	}

    private function remove()
    {
        $oid = $this->ev->get('ordersn');
        $order = $this->orders->getOrderById($oid);
        if ($order['orderstatus'] == 4 || $order['orderstatus'] == 99) {
            $this->orders->delOrder($oid);
            $message = array(
                'statusCode' => 200,
                "message" => "订单删除成功",
                "callbackType" => 'forward',
                "forwardUrl" => "reload"
            );
        } else
            $message = array(
                'statusCode' => 300,
                "message" => "订单操作失败"
            );
        exit(json_encode($message));
    }

    private function batremove()
    {
        $delids = $this->ev->get('delids');
        foreach ($delids as $oid => $p) {
            $order = $this->orders->getOrderById($oid);
            if ($order['orderstatus'] == 4 || $order['orderstatus'] == 99) {
                $this->orders->delOrder($oid);
            }
        }
        $message = array(
            'statusCode' => 200,
            "message" => "订单删除成功",
            "callbackType" => 'forward',
            "forwardUrl" => "reload"
        );
        exit(json_encode($message));
    }

    private function orderdetail()
    {
        $sn = $this->ev->get('sn');
        $ordertype = $this->ev->get('ordertype');//订单类型【1我的采购  2我的销售】
        $order = $this->orders->getOrderById($sn);
        //--------买家和卖家的信息---------
        $buyuserinfo = $this->user->getUserById($order['orderuserid']);//--买家--
        $selleruserinfo = $this->user->getUserById($order['ordersalerid']);//--卖家--

        //----所有的商家店铺------------------
        $alluser = $this->user->getUsersByArgs();

        $this->category->app = 'item';
        $categories = $this->category->getCategoriesByArgs();
        $modules = $this->module->getModulesByApp('item');
        $mfields = array();
        foreach ($modules as $p) {
            $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'], 1);
        }
        $saler = $this->user->getUserById($order['ordersalerid']);
        if ($saler['usergroupid'] == 3) {
            $upline = $this->user->getUserById($saler['teacher_upline']);
            $this->tpl->assign('upline', $upline);
        }
        if ($this->ev->get('msg_id')) {
            $this->msg->modifyMsgStatus(array('msg_id' => $this->ev->get('msg_id'), 'status' => 1));
        }
        //---查询出发票的信息----
        $invoiceinfo = $this->invoice->getInvoiceById($order['invoiceid']);


        $this->tpl->assign('saler', $saler);
        $this->tpl->assign('ordertype', $ordertype);
        $this->tpl->assign('order', $order);
        $this->tpl->assign('categories', $categories);
        $this->tpl->assign('mfields', $mfields);
        $this->tpl->assign('buyuserinfo', $buyuserinfo);
        $this->tpl->assign('selleruserinfo', $selleruserinfo);
        $this->tpl->assign('alluser', $alluser);
        $this->tpl->assign('invoiceinfo', $invoiceinfo);
        $this->tpl->display('orderdetail');
    }

    //商品详情
    private function orderdetails()
    {
        $sn = $this->ev->get('sn');
        $ordertype = $this->ev->get('ordertype');//订单类型【1我的采购  2我的销售】
        $order = $this->orders->getOrderById($sn);
        //--------买家和卖家的信息---------
        $buyuserinfo = $this->user->getUserById($order['orderuserid']);//--买家--
        $selleruserinfo = $this->user->getUserById($order['ordersalerid']);//--卖家--

        //----所有的商家店铺------------------
        $alluser = $this->user->getUsersByArgs();

        $args22[] = array("AND", "ordersn = :ordersn", 'ordersn', $sn);
        $orderSapInfoAll = $this->sapinfo->getSapOrderByArgs($args22);


        $this->category->app = 'item';
        $categories = $this->category->getCategoriesByArgs();
        $modules = $this->module->getModulesByApp('item');
        $mfields = array();
        foreach ($modules as $p) {
            $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'], 2);
        }
        $saler = $this->user->getUserById($order['ordersalerid']);
        if ($saler['usergroupid'] == 3) {
            $upline = $this->user->getUserById($saler['teacher_upline']);
            $this->tpl->assign('upline', $upline);
        }
        if ($this->ev->get('msg_id')) {
            $this->msg->modifyMsgStatus(array('msg_id' => $this->ev->get('msg_id'), 'status' => 2));
        }

        //---查询出发票的信息----
        $invoiceinfo = $this->invoice->getInvoiceById($order['invoiceid']);


        $invoice_post = unserialize($order['invoice_post']);
        //var_dump($order);die;

        $this->tpl->assign('orderSapInfoAll', $orderSapInfoAll);
        $this->tpl->assign('saler', $saler);
        $this->tpl->assign('ordertype', $ordertype);
        $this->tpl->assign('order', $order);
        $this->tpl->assign('invoice', $invoice_post);
        $this->tpl->assign('categories', $categories);
        $this->tpl->assign('mfields', $mfields);
        $this->tpl->assign('buyuserinfo', $buyuserinfo);
        $this->tpl->assign('selleruserinfo', $selleruserinfo);
        $this->tpl->assign('alluser', $alluser);
        $this->tpl->assign('invoiceinfo', $invoiceinfo);
        $this->tpl->display('orders_a');
    }

    //卖方 ---我的销售控制器
    private function mysale()
    {
        $orderstatus = $this->ev->get('orderstatus');
        $ordersn = $this->ev->get('ordersn');
        $search = $this->ev->get('search');
        $type = $this->ev->get('type');
        $page = intval($this->ev->get('page'));
        $args22[] = array("AND", "status = :status", 'status', 1);
        $links = $this->link->getLinkList($args22, $page, 10);
        $u = '';
        if ($search) {
            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
                $u .= "&status_qufen[{$key}]={$arg}";
            }
        }
        $args = array();
        $args[] = array("AND", "ordersalerid = :ordersalerid", "ordersalerid", $this->_user['sessionuserid']);
        $args[] = array("AND", "isdel = :isdel", "isdel", 0);
        if ($search['status_qufen']) {
            $args[] = array("AND", "status_qufen = :status_qufen", 'status_qufen', $search['status_qufen']);
        }
        if ($orderstatus) {
            $args[] = array("AND", "orderstatus = :orderstatus", 'orderstatus', $orderstatus);
        }
        if ($ordersn) {
            $args[] = array("AND", "ordersn LIKE '%{$ordersn}%'");
        }
        if ($type == 2) {
            $time = strtotime(date('Y-m'));
            $args[] = array("AND", "ordercreatetime >= :ordercreatetime", "ordercreatetime", $time);
        } elseif ($type == 1) {
            $time = strtotime(date('Y-m'));
            $stime = strtotime(date('Y-m', $time - 3600));
            $args[] = array("AND", "ordercreatetime >= :ordercreatetime", "ordercreatetime", $stime);
            $args[] = array("AND", "ordercreatetime < :eordercreatetime", "eordercreatetime", $time);
        } else {
            //后台控制前台时间订单的展示
//            $arr = $this->setorder->getStatisticsList();
//            $time = time();
//            $a = $arr['cfgorder'];
//            $outtime = strtotime(date('Y-m-d H:i:s', strtotime("-$a days")));
//            $args[] = array("AND", "ordercreatetime < '" . $time . "'");
//            $args[] = array("AND", "ordercreatetime > '" . $outtime . "'");
        }
        $this->category->app = 'item';
        $categories = $this->category->getCategoriesByArgs();
        $modules = $this->module->getModulesByApp('item');
        $mfields = array();
        foreach ($modules as $p) {
            $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'], 1, 'item');
        }
        $userid = $this->_user['sessionuserid'];
        $orders = $this->orders->getOrderList($args, $page);
        $orderstatusall = $this->orders->countOrderStatusOfMysale($userid, $type);
        $orderstatus_1 = $this->orders->countOrderStatusOfMysale($userid, 1, $type);
        $orderstatus_2 = $this->orders->countOrderStatusOfMysale($userid, 2, $type);
        $orderstatus_3 = $this->orders->countOrderStatusOfMysale($userid, 3, $type);
        $orderstatus_4 = $this->orders->countOrderStatusOfMysale($userid, 4, $type);
        $orderstatus_5 = $this->orders->countOrderStatusOfMysale($userid, 5, $type);
        $orderstatus_99 = $this->orders->countOrderStatusOfMysale($userid, 99, $type);
        $this->tpl->assign('orderstatusall', $orderstatusall);
        $this->tpl->assign('orderstatus_1', $orderstatus_1);
        $this->tpl->assign('orderstatus_2', $orderstatus_2);
        $this->tpl->assign('orderstatus_3', $orderstatus_3);
        $this->tpl->assign('orderstatus_4', $orderstatus_4);
        $this->tpl->assign('orderstatus_5', $orderstatus_5);
        $this->tpl->assign('orderstatus_99', $orderstatus_99);
        $this->tpl->assign('u', $u);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('type', $type);
        $this->tpl->assign('links', $links);
        $this->tpl->assign('categories', $categories);
        $this->tpl->assign('mfields', $mfields);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('orders', $orders);
        $this->tpl->assign('ordersn', $ordersn);
        $this->tpl->display('orders_mysale');
    }

    private function index()
    {
        $orderstatus = $this->ev->get('orderstatus');
        $ordersn = $this->ev->get('ordersn');
        $search = $this->ev->get('search');
        $type = $this->ev->get('type');
        $page = intval($this->ev->get('page'));
        $args22[] = array("AND", "status = :status", 'status', 1);
        $links = $this->link->getLinkList($args22, $page, 10);
        $u = '';
        if ($search) {
            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
                $u .= "&status_qufen[{$key}]={$arg}";
            }
        }
        $args = array();
        $args[] = array("AND", "ordersalerid = :ordersalerid", "ordersalerid", $this->_user['sessionuserid']);
        $args[] = array("AND", "isdel = :isdel", "isdel", 0);
        if ($search['status_qufen']) {
            $args[] = array("AND", "status_qufen = :status_qufen", 'status_qufen', $search['status_qufen']);
        }
        if ($orderstatus) {
            $args[] = array("AND", "orderstatus = :orderstatus", 'orderstatus', $orderstatus);
        }
        if ($ordersn) {
            $args[] = array("AND", "ordersn LIKE '%{$ordersn}%'");
        }

        if ($type == 2) {
            $time = strtotime(date('Y-m'));
            $args[] = array("AND", "ordercreatetime >= :ordercreatetime", "ordercreatetime", $time);
        } elseif ($type == 1) {
            $time = strtotime(date('Y-m'));
            $stime = strtotime(date('Y-m', $time - 3600));
            $args[] = array("AND", "ordercreatetime >= :ordercreatetime", "ordercreatetime", $stime);
            $args[] = array("AND", "ordercreatetime < :eordercreatetime", "eordercreatetime", $time);
        } else {
            //后台控制前台时间订单的展示
            $arr = $this->setorder->getStatisticsList();
            $time = time();
            $a = $arr['cfgorder'];
            $outtime = strtotime(date('Y-m-d H:i:s', strtotime("-$a days")));
            $args[] = array("AND", "ordercreatetime < '" . $time . "'");
            $args[] = array("AND", "ordercreatetime > '" . $outtime . "'");
        }
        $this->category->app = 'item';
        $categories = $this->category->getCategoriesByArgs();
        $modules = $this->module->getModulesByApp('item');
        $mfields = array();
        foreach ($modules as $p) {
            $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'], 1, 'item');
        }
        $userid = $this->_user['sessionuserid'];
        $orders = $this->orders->getOrderList($args, $page);
        $orderstatusall = $this->orders->countOrderStatusOfMysale($userid);
        $orderstatus_0 = $this->orders->countOrderStatusOfMysale($userid, 0);
        $orderstatus_1 = $this->orders->countOrderStatusOfMysale($userid, 1);
        $orderstatus_2 = $this->orders->countOrderStatusOfMysale($userid, 2);
        $orderstatus_3 = $this->orders->countOrderStatusOfMysale($userid, 3);
        $orderstatus_4 = $this->orders->countOrderStatusOfMysale($userid, 4);
        $orderstatus_5 = $this->orders->countOrderStatusOfMysale($userid, 5);
        $orderstatus_99 = $this->orders->countOrderStatusOfMysale($userid, 99);
        $this->tpl->assign('orderstatusall', $orderstatusall);
        $this->tpl->assign('orderstatus_1', $orderstatus_1);
        $this->tpl->assign('orderstatus_2', $orderstatus_2);
        $this->tpl->assign('orderstatus_3', $orderstatus_3);
        $this->tpl->assign('orderstatus_4', $orderstatus_4);
        $this->tpl->assign('orderstatus_5', $orderstatus_5);
        $this->tpl->assign('orderstatus_99', $orderstatus_99);
        $this->tpl->assign('u', $u);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('type', $type);
        $this->tpl->assign('links', $links);
        $this->tpl->assign('categories', $categories);
        $this->tpl->assign('mfields', $mfields);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('orders', $orders);
        $this->tpl->assign('ordersn', $ordersn);
        $this->tpl->display('orders_mysale');
    }

    //ajax通过订单编号获取商品详情
    private function ajaxgetorder()
    {
        $ordersn = $this->ev->get('ordersn');
        $goods = $this->orders->getOrderById($ordersn);
        if ($goods) {
            $html = '';
            foreach ($goods['orderitems'] as $key => $val) {
                $id = $key + 1;
                $html .= '<tr>';
                $html .= '<td>' . $id . '</td>';
                $html .= '<td><img src="' . $val['itemthumb'] . '" style="width:20px;height: 20px;"/></td>';
                $html .= '<td><a target="_blank" href="index.php?item-app-item&goodsid=' . $val['itemgoodsid'] . '">' . $val['goodstitle'] . '</a></td>';
                $html .= '<td>' . $val['number'] . '</td>';
                $html .= '<td>￥' . $val['itemprice'] . '</td>';
                $html .= '</tr>';
            }
            $message = array(
                'statusCode' => 201,
                'message' => "成功",
                'data' => $html
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "数据不存在"
            );
            exit(json_encode($message));
        }

    }

    //ajax获取商品详情和对订单进行评价
    private function ajaxgetcomment()
    {
        $ordersn = $this->ev->get('ordersn');
        $goods = $this->orders->getOrderById($ordersn);
        if ($goods) {
            $html = '';
            /*foreach ($goods['orderitems'] as $key=>$val) {
            	$html .= '<div><img src="'.$val['itemthumb'].'"/></div>';
            	$html .= '<div>';
            		$html .= '<h4>'.$val['goodstitle'].'</h4>';
            		$html .= '<div>价格:'.$val['itemprice'].'</div>';
            	$html .= '</div>';
            }*/
            $html .= '<input name="ordersn" type="hidden" value="' . $ordersn . '" id="ordersn1">';

            $message = array(
                'statusCode' => 201,
                'message' => "成功",
                'data' => $html
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "数据不存在"
            );
            exit(json_encode($message));
        }
    }

    //ajax获取商品详情和对订单进行评价【买家】
    private function ajaxpostcomment()
    {
        $oid = $this->ev->get('ordersn');

        $goodstar = $this->ev->get('goodstar');
        $sellerstar = $this->ev->get('sellerstar');
        $wuliustar = $this->ev->get('wuliustar');

        if ($oid) {
            $args = array();
            $args['buy_comment'] = array('goodstar' => $goodstar, 'sellerstar' => $sellerstar, 'wuliustar' => $wuliustar);
            $args['orderstatus'] = 4;//已评论
            $this->orders->modifyOrderById($oid, $args);
            $message = array(
                'statusCode' => 200,
                'message' => "成功"
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "数据不存在"
            );
            exit(json_encode($message));
        }

    }

    //ajax获取商品详情和对订单进行评价【卖家】
    private function ajaxpostscomment()
    {
        $oid = $this->ev->get('ordersn');
        $paystar = $this->ev->get('paystar');//买方的付款速度
        $wuliustar = $this->ev->get('wuliustar');//物流服务态度

        if ($oid) {
            $args = array();
            $args['seller_comment'] = array('paystar' => $paystar, 'wuliustar' => $wuliustar);
            $args['status_qufen'] = 7;//卖方已评论
            $this->orders->modifyOrderById($oid, $args);
            $message = array(
                'statusCode' => 200,
                'message' => "成功"
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "数据不存在"
            );
            exit(json_encode($message));
        }

    }

    //确认接收买家订单
    private function orderque()
    {
        $oid = $this->ev->get('ordersn');
        $userid = $this->_user['sessionuserid'];
        if ($oid) {
            //采购订单
            $sapOrdRet = $this->sap->addSapOrder($oid, $userid);

            $args['orderstatus'] = 2;
            $args['status_qufen'] = 2;
            $args['orderpaytime'] = time();
            $args['sap_status'] = $sapOrdRet ? 2 : 1;   //SAP接口状态，1采购订单失败，2待采购入库，3SAP接口完成
            $args['status_qufen1'] = $sapOrdRet ? 0 : 1;   //SAP返回结果导致订单是否失效，0正常，1采购订单失败，2采购入库失败
            $ret = $this->orders->modifyOrderById($oid, $args);

            $message = array(
                'statusCode' => 200,
                "message" => "待收货",
                "callbackType" => "forward",
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));

        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "非法操作"
            );
            exit(json_encode($message));
        }
    }

    //--------取消订单弹出框------------------
    private function ajaxcacelorder()
    {
        $ordersn = $this->ev->get('ordersn');
        $goods = $this->orders->getOrderById($ordersn);


        if ($goods) {
            $html = '';
            /*foreach ($goods['orderitems'] as $key=>$val) {
            	$html .= '<div><img src="'.$val['itemthumb'].'"/></div>';
            	$html .= '<div>';
            		$html .= '<h4>'.$val['goodstitle'].'</h4>';
            		$html .= '<div>价格:'.$val['itemprice'].'</div>';
            	$html .= '</div>';
            }*/
            $html .= '<input name="ordersn" type="hidden" value="' . $ordersn . '" id="ordersn2">';

            $message = array(
                'statusCode' => 201,
                'message' => "成功",
                'data' => $html
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "数据不存在"
            );
            exit(json_encode($message));
        }

    }

    //订单取消
    private function ordercancel()
    {
        $oid = $this->ev->get('sn');
        $reason = $this->ev->get('reason');

        if ($oid) {
            $args['orderstatus'] = 99;
            $args['status_qufen'] = 99;
            $args['cancel_reason'] = $reason;//--取消订单的原因--
            $this->orders->modifyOrderById($oid, $args);

            //--------退换商品库存--------------------
            $orderarr = $this->orders->getOrderById($oid);
            foreach ($orderarr['orderitems'] as $k => $v) {
                $this->item->returnSaleItem($v['itemid'], $v['number']);
            }

            $message = array(
                'statusCode' => 200,
                "message" => "订单取消成功",
                "callbackType" => "forward",
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "非法操作"
            );
            exit(json_encode($message));
        }

        $message = array(
            'statusCode' => 300,
            "message" => "订单操作失败"
        );
        exit(json_encode($message));

    }

    //--------退货接口弹框- 2018-08-15-xiliheng------------------
    private function ajaxreturngoods()
    {
        $ordersn = $this->ev->get('ordersn');
        $goods = $this->orders->getOrderById($ordersn);


        if ($goods) {
            $html = '';
            /*foreach ($goods['orderitems'] as $key=>$val) {
            	$html .= '<div><img src="'.$val['itemthumb'].'"/></div>';
            	$html .= '<div>';
            		$html .= '<h4>'.$val['goodstitle'].'</h4>';
            		$html .= '<div>价格:'.$val['itemprice'].'</div>';
            	$html .= '</div>';
            }*/
            $html .= '<input name="ordersn" type="hidden" value="' . $ordersn . '" id="ordersn2">';

            //判断订单状态
            $message = array(
                'statusCode' => 201,
                'message' => "成功",
                'data' => $html
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "数据不存在"
            );
            exit(json_encode($message));
        }

    }


    /**
     * 暂时废弃-，逻辑转移到sap模块处理20180816
     * 1、退货接口拼接sap请求数据
     * 2、返回数组格式
     */
    public function makesapinfo($ordersn)
    {
        //$ordersn = '20180815102209172124';
        $goodsOrder = $this->orders->getOrderById($ordersn);

        //获取sap订单信息
        $sapLocalOrder = $this->sap->getSapByOrdersn($ordersn, $goodsOrder['orderuserid']);
        $sapParam = json_decode($sapLocalOrder['param'], true);

        //sap数据抬头
        $sapRequest['is_header']['ebeln'] = $sapParam['is_header']['ebeln'];
        $sapRequest['is_header']['ekorg'] = '6000'; //采购组织
        $sapRequest['is_header']['ekgrp'] = $sapParam['is_header']['ekgrp'];

        //sapItems字段数据
        $goodsItems = [];
        foreach ($sapParam['it_item'] as $key => $value)
        {
            $info['loekz'] = 'L';
            $info['eblen'] = $value['ebeln'];
            $info['ebelp'] = $value['ebelp'];
            $info['menge'] = $value['menge'];
            $info['meins'] = $value['meins'];

            $goodsItems[] = $info;
        }
         $sapRequest['it_item'] = $goodsItems;

        return $sapRequest;
    }
    
    /**
     * 退货接口-2018-08-15-xiliheng
     */
    private function returngoods()
    {
        $oid = $this->ev->get('sn');
        $reason = $this->ev->get('reason');
        //$oid = '201808211436102557005';
        //$reason = '退货';
        if ($oid) {
            $args['orderstatus'] = 99;
            $args['status_qufen'] = 99;
            $args['cancel_reason'] = $reason;//--取消订单的原因--
            $this->orders->modifyOrderById($oid, $args);

            //拼接sap请求数据并且发送sap取消清单请求
            //$sapRequest = $this->makesapinfo($oid);
            $goodsOrder = $this->orders->getOrderById($oid);
            $this->sap->returnSapOrder($oid, $goodsOrder['ordersalerid']);
            $message = array(
                'statusCode' => 200,
                "message" => "退货成功",
                "callbackType" => "forward",
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "非法操作"
            );
            exit(json_encode($message));
        }

        $message = array(
            'statusCode' => 300,
            "message" => "退货操作失败"
        );
        exit(json_encode($message));

    }
    //-------------订单的逻辑删除------------
    private function orderDel()
    {
        $oid = $this->ev->get('sn');
        if ($oid) {
            $args['isdel'] = 1;
            $this->orders->modifyOrderById($oid, $args);
            $message = array(
                'statusCode' => 200,
                "message" => "订单删除成功",
                "callbackType" => "forward",
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "非法操作"
            );
            exit(json_encode($message));
        }

        $message = array(
            'statusCode' => 300,
            "message" => "订单操作失败"
        );
        exit(json_encode($message));
    }

    //订单收货确认
    private function ordercollect()
    {
        $ordersn = $this->ev->get('ordersn');
        $stockid = $this->ev->get('stockid');
        $userid = $this->_user['sessionuserid'];
        $order = $this->orders->getOrderById($ordersn);

        //---买家的详细信息----
        $userinfo = $this->user->getUserById($order['orderuserid']);

        if ($order) {
            $args['orderstatus'] = 5;
            $args['status_qufen'] = 5;
            $this->orders->modifyOrderById($ordersn, $args);

            //--------收货通知部分start----------
            $data = array();
            $data['ordersalerid'] = $order['ordersalerid'];//---通知人【卖家】
            $data['msg_content'] = '买方' . $userinfo['company_name'] . '已收货,订单号为:' . $ordersn;
            $messageid = $this->msg->sendMsg($data, 4);

            $url = 'index.php?user-company-message-messageinfo&msg_id=' . $messageid;
            $args = array();
            $args['msg_url'] = $url;
            $this->msg->modifyMsgUrl($messageid, $args);

            //--------收货通知部分end------------


            $message = array(
                'statusCode' => 200,
                "message" => "订单确认成功",
                "callbackType" => 'forward',
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        }
        $message = array(
            'statusCode' => 300,
            "message" => "订单操作失败"
        );
        exit(json_encode($message));
    }

    //催单消息
    private function sendmessage()
    {
        $oid = $this->ev->get('sn');
        $order = $this->orders->getOrderById($oid);
        //---买家的详细信息----
        $userinfo = $this->user->getUserById($order['orderuserid']);
        $orderstatus = $this->ev->get('orderstatus');

        if ($oid) {
            $data = array();
            $data['seller_userid'] = $order['ordersalerid'];//卖家
            $data['msg_content'] = '买方' . $userinfo['company_name'] . '提醒您尽快发货,订单号为:' . $oid;
            $messageid = $this->msg->sendMsg($data, 2);


            $url = 'index.php?user-company-message-messageinfo&msg_id=' . $messageid;
            $args = array();
            $args['msg_url'] = $url;
            $this->msg->modifyMsgUrl($messageid, $args);

            $message = array(
                'statusCode' => 200,
                "message" => "提醒成功",
                "callbackType" => 'forward',
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        }
        $message = array(
            'statusCode' => 300,
            "message" => "提醒操作失败"
        );
        exit(json_encode($message));
    }

    //订单确认收款
    private function orderreceive()
    {
        $oid = $this->ev->get('sn');
        $order = $this->orders->getOrderById($oid);
        $orderstatus = $this->ev->get('orderstatus');
        if ($oid) {

            //$args['orderstatus'] = 6;
            $args['status_qufen'] = 6;
            $this->orders->modifyOrderById($oid, $args);
            $message = array(
                'statusCode' => 200,
                "message" => "确认收款成功",
                "callbackType" => 'forward',
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        }
        $message = array(
            'statusCode' => 300,
            "message" => "订单操作失败"
        );
        exit(json_encode($message));
    }

    //订单确认发货
    private function orderdelivery()
    {
        $oid = $this->ev->get('sn');
        $order = $this->orders->getOrderById($oid);
        $orderstatus = $this->ev->get('orderstatus');

        //---卖家的详细信息----
        $userinfo = $this->user->getUserById($order['ordersalerid']);

        if ($oid) {
            $args['orderstatus'] = 3;
            $args['status_qufen'] = 3;
            $args['orderouttime'] = time();
            $this->orders->modifyOrderById($oid, $args);

            //--------发货通知部分start----------
            $data = array();
            $data['orderuserid'] = $order['orderuserid'];//买家
            $data['msg_content'] = '卖方' . $userinfo['company_name'] . '已发货,订单号为:' . $oid;
            $messageid = $this->msg->sendMsg($data, 3);


            $url = 'index.php?user-company-message-messageinfo&msg_id=' . $messageid;
            $args = array();
            $args['msg_url'] = $url;
            $this->msg->modifyMsgUrl($messageid, $args);


            //--------发货通知部分end------------

            $message = array(
                'statusCode' => 200,
                "message" => "发货成功",
                "callbackType" => 'forward',
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        }
        $message = array(
            'statusCode' => 300,
            "message" => "订单操作失败"
        );
        exit(json_encode($message));
    }

    //退换货
    private function exchange()
    {
        $ordersn = $this->ev->get('sn');
        $search = $this->ev->get('search');
        $type = $this->ev->get('type');
        $page = intval($this->ev->get('page'));
        $args22[] = array("AND", "status = :status", 'status', 1);
        $links = $this->link->getLinkList($args22, $page, 10);

        $order = $this->orders->getOrderById($ordersn);
        $a = $order['orderitems'];
        $userinfo = $this->user->getUserById($order['orderuserid']); //买家信息
        $u = '';
        if ($search) {
            $this->tpl->assign('search', $search);

            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
                $u .= "&status_qufen[{$key}]={$arg}";
            }
        }
        $this->tpl->assign('u', $u);
        $this->tpl->assign('page', $page);
        $args = array();
        $args[] = array("AND", "ordersalerid = :ordersalerid", "ordersalerid", $this->_user['sessionuserid']);
        if ($search['status_qufen']) {
            $args[] = array("AND", "status_qufen = :status_qufen", 'status_qufen', $search['status_qufen']);
        }
        if ($ordersn) {
            $args[] = array("AND", "ordersn LIKE '%{$ordersn}%'");
        }
        if (!$type) {
            $time = strtotime(date('Y-m'));
            $args[] = array("AND", "ordercreatetime >= :ordercreatetime", "ordercreatetime", $time);
        } elseif ($type == 1) {
            $time = strtotime(date('Y-m'));
            $stime = strtotime(date('Y-m', $time - 3600));
            $args[] = array("AND", "ordercreatetime >= :ordercreatetime", "ordercreatetime", $stime);
            $args[] = array("AND", "ordercreatetime < :eordercreatetime", "eordercreatetime", $time);
        } else
            $args = 1;
        $this->category->app = 'item';
        $categories = $this->category->getCategoriesByArgs();
        $modules = $this->module->getModulesByApp('item');
        $mfields = array();
        foreach ($modules as $p) {
            $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'], 1, 'item');
        }
        $this->tpl->assign('type', $type);
        $this->tpl->assign('links', $links);
        $this->tpl->assign('categories', $categories);
        $this->tpl->assign('mfields', $mfields);
        $this->tpl->assign('search', $search);
        $orders = $this->orders->getOrderList($args, $page);
        $this->tpl->assign('orders', $orders);
        $this->tpl->assign('ordersn', $ordersn);
        $this->tpl->display('orders_a');
    }

    //商品详情物流信息修改
    private function invoices()
    {
        $ordersn = $this->ev->get('sn');
        $logistics_names = $this->ev->get('logistics_names');
        $logistics_nums = $this->ev->get('logistics_nums');
        if ($ordersn) {
            $args['orderpost'] = array('postname' => $logistics_names, 'postorder' => $logistics_nums);
            $this->orders->modifyOrderById($ordersn, $args);
            $message = array(
                'statusCode' => 200,
                "message" => "发票物流填写成功",
                "callbackType" => "forward",
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "非法操作"
            );
            exit(json_encode($message));
        }

        $message = array(
            'statusCode' => 300,
            "message" => "订单操作失败"
        );
        exit(json_encode($message));
    }

    //商品详情发票物流信息
    private function invoice()
    {
        $ordersn = $this->ev->get('sn');
        $logistics_name = $this->ev->get('logistics_name');
        $logistics_num = $this->ev->get('logistics_num');
        if ($ordersn) {
            $args['invoice_post'] = array('logistics_name' => $logistics_name, 'logistics_num' => $logistics_num);
            $args['invoice_status'] = 1;
            $this->orders->modifyOrderById($ordersn, $args);
            $message = array(
                'statusCode' => 200,
                "message" => "发票物流填写成功",
                "callbackType" => "forward",
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "非法操作"
            );
            exit(json_encode($message));
        }

        $message = array(
            'statusCode' => 300,
            "message" => "订单操作失败"
        );
        exit(json_encode($message));
    }


    //投诉反馈
    private function ordercomplaint()
    {
        $user = $this->user->getUserById($this->_user['sessionuserid']);
        $param = array();
        $param['complaint_name'] = $this->ev->get('name');
        $param['complaint_content'] = $this->ev->get('content');
        $param['ordersn'] = $this->ev->get('ordersn');
        $param['phone'] = $user['company_mobile'];
        $param['userid'] = $user['userid'];
        $param['username'] = $user['username'];
        $param['enterprise_name'] = $user['company_name'];
        $param['create_time'] = time();

        $orderData = $this->orders->getOrderById($param['ordersn']);

        $result = $this->orders->insertOrderComplaint($param);
        if ($result) {
//            $args['orderstatus'] = 8;
//            $this->orders->modifyOrderById($param['ordersn'],$args);
            $message = array(
                'statusCode' => 200,
                'message' => "成功"
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "数据不存在"
            );
            exit(json_encode($message));
        }

    }

}

?>
