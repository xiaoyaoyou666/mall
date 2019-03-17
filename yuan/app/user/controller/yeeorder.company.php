<?php
/**
 * Created by PhpStorm.
 * User: 50165
 * Date: 2018-9-26
 * Time: 10:56
 */
class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        $this->category = $this->G->make('category');
        $this->module = $this->G->make('module');
        $this->orders = $this->G->make('orders','bank');
        $this->item = $this->G->make('item','item');
        $this->link = $this->G->make('link','content');
        $this->msg = $this->G->make('msg','user');
        $this->user = $this->G->make('user','user');
        $this->meruser = $this->G->make('meruser', 'user');
        $this->yeeorder = $this->G->make('yeeorder', 'user');
        $this->invoice = $this->G->make('invoice','user');
        $this->sap = $this->G->make('sap','item');
        $this->sapinfo = $this->G->make('sapinfo','item');
        $this->setorder=$this->G->make('setorder','core');
        $orderstatus = array(0=>'未支付',1=>'已支付');
        $this->tpl->assign('orderstatus',$orderstatus);
        $this->tpl->assign('orderstatus1',$orderstatus1);

        $this->link = $this->G->make('link','content');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        
        $this->address = $this->G->make('address','user');
        $this->agreement = $this->G->make('agreement', 'agreement');
        $this->agreementgoods = $this->G->make('agreementgoods', 'agreement');

        $this->cart = $this->G->make('cart','item');
        $cartNumArr = $this->cart->getCartUserNum();
        foreach ($cartNumArr as $k => $v) {
            $cartnums[] = $v['number'];
        }
        $cartNum = array_sum($cartnums)?array_sum($cartnums):0;
        $this->tpl->assign('links',$links);
        $this->tpl->assign('cartNum',$cartNum);
        if(!method_exists($this,$action))
            $action = "index";
        $this->$action();
        exit;
    }


    // 
    private function index()
    {
        $carts = $this->cart->getCartItemList();
        foreach($carts as $key => &$val)
        {
            //如果是协议商品
            if($val['agreementid'] != 0)
            {
                $agreementGoods = $this->agreementgoods->getItemByTtemidAndAgreementid($val['itemid'],$val['agreementid']);
                $val['itemprice'] = $agreementGoods['agreement_price'];

            }
        }
        $addressinfo = $this->address->getAddressInfoList(1,$this->_user['sessionuserid']);

        if($this->ev->get('tidycart'))
        {
            if(!$this->ev->get('pnumber')) {
                $message = array(
                    'statusCode' => 300,
                    "message" => "请勾选商品"
                );
                exit(json_encode($message));
            }
            if(!$carts)
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "请勾选商品"
                );
               exit(json_encode($message));
            }
            $temp = array();
            foreach($carts as $key => $p)
            {
                //如果购买的数量少于起订量，提示不能购买
                if($p['number'] < $p['limit_number'])
                {
                    $message = array(
                        'statusCode' => 300,
                        'errnum' => $p['number'],
                        "message" => "数量或金额不满足商家起订规则"
                    );
                   $this->G->R($messages);
                }
                if($p['cartstatus'] && ($p['itemnumber'] < $p['number']))
                {
                    $message = array(
                        'statusCode' => 300,
                        'errnum' => $p['number'],
                        "message" => $p['itemtitle']."库存仅剩".$p['itemnumber']."件，不能结算，请调整您的进货量"
                    );
                    $this->G->R($messages);
                }
                if($p['cartstatus'] == 1)
                {
                    $temp[] = $p['agreementid'];
                }
            }
            
            if($this->ev->get('pnumber') != 'null') {
                $message = array(
                    'statusCode' => 200,
                    "message" => "成功"
                );
                exit(json_encode($message));
            }
            // $messages = array(
            //     'statusCode' => 200,
            //     'ishide' =>1,
            //     // "message" => "购物车整理完成，正在结算",
            //     "callbackType" => "forward",
            //     // "forwardUrl" => "index.php?user-company-yeeorder-orders"
            // );
            // $this->G->R($messages);
        }
    }


    /**
     * B2B下单-2018-09-27
     * 1、根据商家进行分类，每个商家对应一个order记录
     * 2、当前用户的一次下单中，有一个共同的yeeOrdersn，该订单号主要用来调用易宝支付
     * 3、调用易宝下单接口，并且调用sdk生成标准收银台url，然后返回跳转
     * 4、B2B订单设置order_type = 1,sap订单order_type = 0
     */
    private function orders()
    {   
        $args = $this->ev->get('args');
        $znumber = strip_tags($args['znumber']);
        if($this->ev->get('createorder'))
        {
            $args = $this->ev->get('args');
            $addressid = $args['orderaddress'];
            if(empty($addressid))
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "请填写并选择一个地址"
                );
                exit(json_encode($message));
            }
            $addressinfo = $this->address->getAddressInfoById($addressid);

            //如果要编辑发票信息
            if($this->ev->get('isedit')){
                $invoiceData = $this->invoice->getInvoiceByUserid($this->_user['sessionuserid']);   //发票信息
                $invoicearr = array();
                $invoicearr['title']  = $args['title'];
                $invoicearr['number'] = $args['number'];
                $invoicearr['mobile'] = $args['mobile'];
                $invoicearr['card_number'] = $args['card_number'];
                $invoicearr['userid'] = $this->_user['sessionuserid'];
                $invoicearr['addtime'] = time();
                //如果有发票信息就修改，没有就添加
                if($invoiceData){
                    $this->invoice->modifyInvoice($invoiceData['invoiceid'],$invoicearr);
                }else{
                    $this->invoice->addInvoice($invoicearr);
                }
            }

            //连表查询：x2_cart,x2_item,x2_goods
            $carts = $this->cart->getCartItemList();

            //遍历购物车数据，进行库存以及协议判断
            foreach($carts as $cart)
            {
                if($cart['cartstatus'])
                {
                    if($cart['itemnumber'] < $cart['number'])
                    {
                        $message = array(
                            'statusCode' => 300,
                            "message" => $cart['itemtitle']."库存仅剩".$cart['itemnumber']."件，不能结算，请调整您的进货量"
                        );
                        exit(json_encode($message));
                    }
                    //如果是协议商品，取协议价格
                    if($cart['agreementid'] != 0)
                    {
                        $agreementGoods = $this->agreementgoods->getItemByTtemidAndAgreementid($cart['itemid'],$cart['agreementid']);
                        $cart['itemprice'] = $agreementGoods['agreement_price'];
                    }

                    //这一步对商品按用户商家进行了分类
                    $items[$cart['goodsuserid']][] = $cart;
                }
            }

            //开启事务
            $this->db->beginTransaction();
            try
            {
                //1、先生成一个order订单
                $yeeOrderPrice = 0;//易宝订单总价格
                $yeeordersn = $this->yeeorder->yeeOrderGen($this->_user['sessionuserid']);

                //判断用户是否开通易宝支付
                /*$unBuyData = [];
                foreach($items as $userid => $item)
                {
                    //校验商家是否存在
                    $salerInfo = $this->meruser->getDataById($userid);
                    if (empty($salerInfo) || !in_array($salerInfo['status'], ['PROCESS_SUCCESS', 'PROCESSING_PRODUCT_INFO_SUCCESS']))
                    {
                        $userInfo = $this->user->getUserById($userid);
                        $unBuyData[] = $userInfo['company_name'];
                    }
                }

                if (!empty($unBuyData))
                {
                    $unBuyStr = implode(',', $unBuyData);
                    throw new Exception("用户:{$unBuyStr} 尚未开通支付功能，暂不支持购买！");
                }*/

                $fee = 0;
                $order = $args;
                foreach($items as $userid => $item)
                {
                    $price = 0;
                    foreach($item as $key => $p)
                    {
                        //订单数量
                        $itemprice = $p['itemprice'];
                        $price = $price + $p['number'] * $p['itemprice'];
                        $yeeOrderPrice = $yeeOrderPrice + $p['number'] * $p['itemprice'];
                        $fee = $fee + $p['number'] * $p['goodsfee'];
                        $item[$key]['itemprice'] = $itemprice;
                        $this->item->outSaleItem($p['itemid'],$p['number']);//信息
                    }

                    $ordersn = date('YmdHis').$this->_user['sessionuserid'].rand(10000,99999);
                    $order=$item[$userid];
                    $userids = $userid;// 商家id
                    $ordersa['ordersn'] = $ordersn;
                    $ordersa['orderstatus'] = 0;//-------下单成功为-待支付，付款成功后为待确认-席力恒--
                    $ordersa['orderuserid'] = $this->_user['sessionuserid'];
                    $ordersa['ordercreatetime'] = TIME;
                    $ordersa['ordersalerid'] = $userids;
                    $ordersa['orderprice'] = $price;
                    $ordersa['orderfee'] = $fee;
                    $ordersa['orderitems'] = $item;
                    $ordersa['orderaddress'] = $addressinfo;
                    $ordersa['buy_message'] = strip_tags($args['message']);   //买家留言
                    $ordersa['ordertitle'] = $znumber;
                    $ordersa['order_type'] = 1;//B2B订单类型为1
                    $ordersa['yeeOrderPrice'] = $yeeOrderPrice;//易宝订单总价格
                    $ordersa['yeeOrdersn'] = $yeeordersn;
                    $ordersa['bt_bankPaySuccessDate'] = date("Y-m-d H:i:s");
                    $ordersa['bt_paySuccessDate'] = date("Y-m-d H:i:s");
                    $ordersa['bt_bankTrxId'] = '';
                    $ordersa['bt_bankOrderId'] = '';
                    $ordersa['bt_bankId'] = '';
                    $ordersa['bt_paymentProduct'] = '';
                    $ordersa['bt_platformType'] = '';
                    $orderd = array_merge($ordersa);
                    $resa = $this->orders->addOrder($orderd);//add 本地订单
                    $this->msg->sendMsg($orderd,1);//消息通知
                    //记录易宝通知日志
                    $this->meruser->addYeeNoticeLog($ordersn, 'orderNotify', json_encode($orderd), "结果：{$resa}");
                }

                //调用易宝order
                $ordersa['yeeOrderPrice'] = $yeeOrderPrice;
                $this->yeeorder->modifyByYeeOrder($yeeordersn, ['yeeOrderPrice' => $yeeOrderPrice]);//修改根据yeeorder修改order信息
                $cashUrl = $this->yeeorder->sendOrder($ordersa);//发送订单，调用易宝下单接口

                $this->cart->clearOrderedItem();

                if (!$cashUrl)
                {
                    throw new Exception('下单失败');
                }
                //$this->db->commit();
                $message = array(
                    'statusCode' => 200,
                    "message" => "下单成功,即将转到支付页面",
                    "callbackType" => "forward",
                    "forwardUrl" => $cashUrl//与易宝order一同取消注释
                );
                exit(json_encode($message));
            }
            catch  (Exception $e)
            {
                $ext = $e->getMessage();
                $this->db->rollback();
                $message = array(
                    'statusCode' => 300,
                    "message" => $ext,
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?user-company-yeeorder-orders"
                );
                exit(json_encode($message));
            }
        }
       else
       {
        $categories = $this->category->getCategoriesByArgs();
        $modules = $this->module->getModulesByApp('user');
        $mfields = array();
        $susers = array();
        $scarts = array();
        foreach($modules as $p)
        {
            $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'],1);
        }
        $carts = $this->cart->getCartItemLists();

           foreach($carts as $key => &$val)
           {
               //如果是协议商品
               if($val['agreementid'] != 0)
               {
                   $agreementGoods = $this->agreementgoods->getItemByTtemidAndAgreementid($val['itemid'],$val['agreementid']);
                   $val['itemprice'] = $agreementGoods['agreement_price'];

               }
           }
        foreach($carts as $p)
        {
            if(!$susers[$p['goodsuserid']])
            {
                $susers[$p['goodsuserid']] = $this->user->getUserById($p['goodsuserid']);
            }
                $scarts[$p['goodsuserid']][] = $p;
            }

            $addressinfo = $this->address->getAddressInfoList(1,$this->_user['sessionuserid']);
            $invoiceData = $this->invoice->getInvoiceByUserid($this->_user['sessionuserid']);   
            //发票信息
            $a = $this->tpl->assign('currentdate',strtotime(date('Y-m-d')));
            $b = $this->tpl->assign('addressinfo',$addressinfo);
            $c = $this->tpl->assign('invoiceData',$invoiceData);
            $d = $this->tpl->assign('susers',$susers);
            $e = $this->tpl->assign('categories',$categories);
            $f = $this->tpl->assign('mfields',$mfields);
            $g = $this->tpl->assign('scarts',$scarts);
            unset($a);
            unset($b);
            unset($c);
            unset($d);
            unset($e);
            unset($f);
            unset($g);
            $this->tpl->display("btorder");      
        }         
    }

    //添加收货地址
    private function addaddress()
    {
        $args = array();
        $args['receiver'] = $this->ev->get('receiver');
        $args['provinceid'] = $this->ev->get('provinces');
        $args['cityid'] = $this->ev->get('cities');
        $args['areaid'] = $this->ev->get('areas');
        $args['zipcode'] = $this->ev->get('zipcode');
        $args['addressinfo'] = $this->ev->get('addressinfo');
        $args['phone'] = $this->ev->get('phone');
        $args['userid'] = $this->_user['sessionuserid'];
        $addressid = $this->address->addAddressInfo($args);
        $addressinfo = $this->address->getAddressInfoById($addressid);
        if ($addressid) {
            $message = array(
                'statusCode' => 200,
                'message' => "成功",
                'data' => $addressinfo
            );
            exit(json_encode($message));
        } else {
           $message = array(
                'statusCode' => 301,
                'message' => "失败"
            );
            exit(json_encode($message));
        }
    }

    //删除 收获地址
    private function deladdress()
    {
        if($this->ev->get('addressid'))
        {
            $addressid = $this->ev->get('addressid');
            $userid = $this->_user['sessionuserid'];
            $this->address->delAddressInfo($addressid,$userid);
            $message = array(
                'statusCode' => 200,
                "message" => "删除成功",
                "callbackType" => 'forward',
                "forwardUrl" => "index.php?user-company-yeeorder-orders"
            );
            $this->G->R($message);
        }
        else
        $this->tpl->display('addaddress');
    }

    public function test()
    {
        var_dump(strlen('TIANRUN1187165880864314899'));die;
    }

}