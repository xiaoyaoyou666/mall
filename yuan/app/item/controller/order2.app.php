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
        $this->cart = $this->G->make('cart','item');
        $this->sap = $this->G->make('sap','item');
        $this->address = $this->G->make('address','user');
        $this->order = $this->G->make('orders','bank');
        $this->msg = $this->G->make('msg','user');
        $this->invoice = $this->G->make('invoice','user');
        if(!method_exists($this,$action))
        $action = "index";
        $this->$action();
        exit;
    }

    private function payfor()
    {
        $sn = $this->ev->get('sn');
        $order = $this->order->getOrderById($sn,$this->_user['sessionuserid']);
        $categories = $this->category->getCategoriesByArgs();
        $modules = $this->module->getModulesByApp('item');
        $mfields = array();
        foreach($modules as $p)
        {
            $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'],1);
        }
        $this->tpl->assign('order',$order);
        $this->tpl->assign('categories',$categories);
        $this->tpl->assign('mfields',$mfields);
        if($order['oderstatus'] < 2)
        {
            $this->wxpay = $this->G->make("wxpay");
            $jsApiParameters = $this->wxpay->outJsPay($order);
            $this->tpl->assign('jsApiParameters',$jsApiParameters);
            $this->tpl->display('order_payfor2');
        }
        else
        $this->tpl->display('order_payfor');
    }

    private function payfor2()
    {
        $sn = $this->ev->get('sn');
        $order = $this->order->getOrderById($sn,$this->_user['sessionuserid']);
        $categories = $this->category->getCategoriesByArgs();
        $modules = $this->module->getModulesByApp('item');
        $mfields = array();
        foreach($modules as $p)
        {
            $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'],1);
        }
        $this->tpl->assign('order',$order);
        $this->tpl->assign('categories',$categories);
        $this->tpl->assign('mfields',$mfields);
        $this->tpl->display('order_payfor');
    }

    private function createorder()
    {
        $user = $this->user->getUserById($this->_user['sessionuserid']);
        $addressid = $this->ev->get('addressid');
        $psid = $this->ev->get('psid');
        if(empty($addressid))
        {
            $message = array(
                'statusCode' => 300,
                "message" => "请填写并选择一个地址"
            );
            $this->G->R($message);
        }
        $addressinfo = $this->address->getAddressInfoById($addressid);
        $carts = $this->cart->getCartItemList();
        $items = array();
        $price = 0;
        $firstprice = 0;
        $secondprice = 0;
        $fee = 0;
        $isbaoshui = 0;
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
                    $this->G->R($message);
                }
                else
                {
                    /***库存扣减**/
                    $this->item->offItemStack($cart['itemid'],$cart['number']);
                    /*****/
                    $price = $price + $cart['number'] * $cart['itemprice'];
                    //$firstprice = $firstprice + $cart['number'] * $cart['itemfirstprice'];
                    //$secondprice = $secondprice + $cart['number'] * $cart['itemsecondprice'];
                    $firstprice = $firstprice + ($cart['number'] * $cart['itemprice']*$user['level'] - ($cart['itemprice'] - $cart['itemfirstprice'])*$cart['number'])*$user['level'];
                    $secondprice = $secondprice + ($cart['number'] * $cart['itemprice']*$user['level'] - ($cart['itemprice'] - $cart['itemsecondprice'])*$cart['number'])*$user['level'];
                    $items[$cart['itemid']] = $cart;
                    if($cart['itemisbaoshui'])$isbaoshui = 1;

                    if($cart['number'] < $cart['itemfreenumber'])
                    {
                        $poster = unserialize($cart['itemposter']);
                        if($fee > 0)
                        $fee += $cart['number']*$poster[$psid]['second'];
                        else
                        $fee += ($cart['number'] - 1)*$poster[$psid]['second'] + $poster[$psid]['first'];
                    }

                }

            }
        }
        if($price <= 0)
        {
            $message = array(
                'statusCode' => 300,
                "message" => "购物车内没有可结算商品"
            );
            $this->G->R($message);
        }
        if($price >= 99)$fee = 0;
        $args = $this->ev->get('args');
        if($isbaoshui)
        {
            if($args['orderbsinfo']['name'] && $args['orderbsinfo']['passport'])
            {}
            else
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "请补充保税信息"
                );
                $this->G->R($message);
            }
        }
        $poster = $this->cart->getPosterById($psid);
        $order['ordersn'] = date('YmdHis').rand(10000,99999);
        $order['orderstatus'] = 1;
        $order['orderfee'] = $fee;
        $order['orderuserid'] = $this->_user['sessionuserid'];
        $order['ordercreatetime'] = TIME;
        $order['ordersalerid'] = $this->G->shopid;
        $order['orderprice'] = $price * $user['level'] + $fee;
        //$order['orderfirstprice'] = $firstprice * $user['level'];
        //$order['ordersecondprice'] = $secondprice * $user['level'];
        $order['orderfirstprice'] = $firstprice;
        $order['ordersecondprice'] = $secondprice;
        $order['orderitems'] = $items;
        $order['orderuserposter'] = $poster['psname'];
        $order['orderaddress'] = $addressinfo;
        $order['orderbsinfo'] = $args['orderbsinfo'];
        $order['orderlevel'] = $user['level'];
        $this->order->addOrder($order);
        $this->cart->clearOrderedItem();
        $message = array(
            'statusCode' => 200,
            "message" => "下单成功,请尽快支付",
            "callbackType" => "forward",
            "forwardUrl" => "index.php?item-app-order-payfor&sn=".$order['ordersn']
        );
        $this->G->R($message);
    }

    private function addaddress()
    {
        if($this->ev->get('addaddress'))
        {
            $args = $this->ev->get('args');
            $args['userid'] = $this->_user['sessionuserid'];
            $this->address->addAddressInfo($args);
            $message = array(
                'statusCode' => 200,
                "message" => "添加成功",
                "callbackType" => 'forward',
                "forwardUrl" => "index.php?item-app-order-address"
            );
            $this->G->R($message);
        }
        else
        $this->tpl->display('addaddress');
    }


    //-------删除地址-------------------------
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
                "forwardUrl" => "index.php?item-app-order"
            );
            $this->G->R($message);
        }
        else
        $this->tpl->display('addaddress');
    }



    private function getcartfee()
    {
        $psid = $this->ev->get('psid');
        if(!$psid)exit('请选择您希望送货的快递公司');
        $psid = $this->ev->get('psid');
        $carts = $this->cart->getCartItemList();
        $fee = 0;
        $price = 0;
        foreach($carts as $p)
        {
            if($p['cartstatus'])
            {
                $price = $price + $p['number'] * $p['itemprice'];
                if(($p['number'] < $p['itemfreenumber']))
                {
                    $poster = unserialize($p['itemposter']);
                    if($fee > 0)
                    $fee += $p['number']*$poster[$psid]['second'];
                    else
                    $fee += ($p['number'] - 1)*$poster[$psid]['second'] + $poster[$psid]['first'];

                    //$fee += ($p['number'] - 1)*$poster[$psid]['second'] + $poster[$psid]['first'];
                }
            }
        }
        if($price >= 99)$fee = 0;
        echo '￥'.$fee.'元';
    }

    private function poster()
    {
        $posters = $this->cart->listPoster();
        $this->tpl->assign('posters',$posters);
        $this->tpl->display('poster');
    }

    private function address()
    {
        $addresses = $this->address->getAddressesByUserid($this->_user['sessionuserid']);
        $this->tpl->assign('addresses',$addresses);
        $this->tpl->display('address');
    }

    private function addnewaddress()
    {
        $this->address = $this->G->make('address','user');
        $args = $this->ev->get('ads');
        if(!$args['receiver'])
        {
            $message = array(
                'statusCode' => 300,
                "message" => "请填写收货人姓名"
            );
            $this->G->R($message);
        }

        if(!$args['cityid'])
        {
            $message = array(
                'statusCode' => 300,
                "message" => "请选择您所在的城市"
            );
            $this->G->R($message);
        }
        if(!$args['areaid'])
        {
            $message = array(
                'statusCode' => 300,
                "message" => "请选择您所在的县区"
            );
            $this->G->R($message);
        }
        if(!$args['addressinfo'])
        {
            $message = array(
                'statusCode' => 300,
                "message" => "请填写您的详细地址"
            );
            $this->G->R($message);
        }
        if(strlen($args['phone']) != 11 || !is_numeric($args['phone']))
        {
            $message = array(
                'statusCode' => 300,
                "message" => "电话不能为空或者电话格式不正确"
            );
            $this->G->R($message);
        }
        $args['userid'] = $this->_user['sessionuserid'];
        $this->address->addAddressInfo($args);
        $addressinfo = $this->address->getAddressInfoList(1,$this->_user['sessionuserid']);
        $this->tpl->assign('addressinfo',$addressinfo);
        $this->tpl->display('ajax_address');
    }

    private function index2()
    {
        $this->address = $this->G->make('address','user');
        $args = $this->ev->get('args');
        //----留言-----------
        $buy_message = strip_tags($args['message']);
        $znumber = strip_tags($args['znumber']);
       
        if($this->ev->get('createorder'))
        {
            $user = $this->user->getUserById($this->_user['sessionuserid']);
            $args = $this->ev->get('args');
            $addressid = $args['orderaddress'];
            if(empty($addressid))
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "请填写并选择一个地址"
                );
                $this->G->R($message);
            }
            $addressinfo = $this->address->getAddressInfoById($addressid);
            $carts = $this->cart->getCartItemList();
            $items = array();
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
                        $this->G->R($message);
                    }
                    $items[$cart['goodsuserid']][] = $cart;
                }
            }

            $sapArr = array();
            foreach($items as $userid => $item)
            {
                $sapTemp = [];
                $sapGoodTemp = [];
                $price = 0;
                $fee = 0;
                $order = $args;
                foreach($item as $key => $p)
                {
                    $itemprice = $p['itemprice'];
                    $price = $price + $p['number'] * $p['itemprice'];
                    $fee = $fee + $p['number'] * $p['goodsfee'];
                    $item[$key]['itemprice'] = $itemprice;
                    $this->item->outSaleItem($p['itemid'],$p['number']);
                }

                $order['ordersn'] = date('YmdHis').$userid.rand(10000,99999);
                $order['orderstatus'] = 1;//-------下单就为待卖家确认状态为1----张建超--
                //$order['status_qufen'] = 1;//-------下单就为待卖家确认状态为1----张建超--
                $order['orderuserid'] = $this->_user['sessionuserid'];
                $order['ordercreatetime'] = TIME;
                $order['ordersalerid'] = $userid;
                $order['orderprice'] = $price;
                $order['orderfee'] = $fee;
                $order['orderitems'] = $item;
                $order['orderaddress'] = $addressinfo;
                $order['buy_message'] = $buy_message;//--买家留言---
                $order['ordertitle'] = $znumber;//--商品数量---
                if($args['orderpayfortype']) $order['orderpaytype'] = 1;

                $this->msg->sendMsg($order,1);
                $this->order->addOrder($order);

                //收集对接SAP采购订单接口数据
                $sapTemp['is_header']['ebeln'] = $order['ordersn'];  //平台单据号
                $sapTemp['is_header']['bukrs'] = '6025'; //公司代码，页面输入
                $sapTemp['is_header']['lifnr'] = '6025'; //供应商编码，卖家
                $sapTemp['is_header']['ekorg'] = '6000'; //采购组织
                $sapTemp['is_header']['ekgrp'] = '580';  //采购组
                $sapTemp['is_header']['zterm'] = 'PJ07';  //付款条件代码
                $sapTemp['is_header']['dppct'] = '0';  //预付款百分比
                $sapTemp['is_header']['bedat'] = date('Ymd',$order['ordercreatetime']);  //采购订单日期
                $sapTemp['is_header']['reserve_f1'] = '88888';  //订单的含税含运总价，保留两位小数，单位是元

                foreach($item as $k => $val)
                {
                    $wuliao = $this->getWuliaoInfo($val['wuliaocode']);
                    $sapGoodTemp[$k]['ebeln'] = $order['ordersn'];  //平台单据号
                    $sapGoodTemp[$k]['ebelp'] = $k+1 .'0';  //采购凭证的项目编号
                    $sapGoodTemp[$k]['pstyp'] = '0';  //采购凭证中的项目类别,写死 0
                    $sapGoodTemp[$k]['ewerk'] = 'A130';  //工厂
                    $sapGoodTemp[$k]['ematn'] = $val['wuliaocode'];  //物料编号
                    $sapGoodTemp[$k]['matkl'] = $wuliao['matkl'];  //物料组
                    $sapGoodTemp[$k]['menge'] = $val['number'];  //数量
                    $sapGoodTemp[$k]['meins'] = $wuliao['meins'];  //基本计量单位
                    $sapGoodTemp[$k]['mwskz'] = 'EA';  //销售税/采购税代码
                    $sapGoodTemp[$k]['text1'] = $val['goodstitle'];  //商品名称
                    $sapGoodTemp[$k]['netpr'] = '79957.79';  //净价
                }

                $sapTemp['it_item'] = $sapGoodTemp;

                $sapArr['ordersn'] = $order['ordersn'];
                $sapArr['buyerid'] = $order['orderuserid'];
                $sapArr['sellerid'] = $userid;
                $sapArr['param'] = json_encode($sapTemp);
                //$this->sap->addSap($sapArr);
            }

            $this->cart->clearOrderedItem();
            if($args['orderpayfortype'])
            {
                $message = array(
                    'statusCode' => 200,
                    "message" => "下单成功,即将转到支付页面",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?item-app-orderonlinepay"
                );
            }
            else
            {
                $message = array(
                    'statusCode' => 200,
                    "message" => "下单成功",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?user-company-orders"
                );

            }
            $this->G->R($message);
        }
        else
        {
            $categories = $this->category->getCategoriesByArgs();
            $modules = $this->module->getModulesByApp('item');
            $mfields = array();
            $susers = array();
            $scarts = array();
            foreach($modules as $p)
            {
                $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'],1);
            }
            $carts = $this->cart->getCartItemList();
            foreach($carts as $p)
            {
                if(!$susers[$p['goodsuserid']])
                {
                    $susers[$p['goodsuserid']] = $this->user->getUserById($p['goodsuserid']);
                }
                $scarts[$p['goodsuserid']][] = $p;
            }
            $addressinfo = $this->address->getAddressInfoList(1,$this->_user['sessionuserid']);
            $this->tpl->assign('currentdate',strtotime(date('Y-m-d')));
            $this->tpl->assign('addressinfo',$addressinfo);
            $this->tpl->assign('susers',$susers);
            $this->tpl->assign('categories',$categories);
            $this->tpl->assign('mfields',$mfields);
            $this->tpl->assign('scarts',$scarts);
            $this->tpl->display('order');
        }
    }


    public function getWuliaoInfo($code){
        $data = $this->sap->getWuliaoInfo($code);
        return $data;
    }


    private function index()
    {
        $this->address = $this->G->make('address','user');
        $args = $this->ev->get('args');
        $znumber = strip_tags($args['znumber']);
        $ordersn = $this->ev->get('sn');
        $orders = $this->order->getOrderById($ordersn);
        if($this->ev->get('createorder'))
        {
            $user = $this->user->getUserById($this->_user['sessionuserid']);
            $args = $this->ev->get('args');
            $addressid = $args['orderaddress'];
            if(empty($addressid))
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "请填写并选择一个地址"
                );
                $this->G->R($message);
            }
            $addressinfo = $this->address->getAddressInfoById($addressid);
            $carts = $this->cart->getCartItemList();
            $items = array();
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
                        $this->G->R($message);
                    }
                    $items[$cart['goodsuserid']][] = $cart;
                }
            }

            foreach($items as $userid => $item)
            {
                $sapArr = array();
                $sapTemp = array();
                $sapGoodTemp = array();
                $price = 0;
                $fee = 0;
                $order = $args;
                foreach($item as $key => $p)
                {
                    $itemprice = $p['itemprice'];
                    $price = $price + $p['number'] * $p['itemprice'];
                    $fee = $fee + $p['number'] * $p['goodsfee'];
                    $item[$key]['itemprice'] = $itemprice;
                    $this->item->outSaleItem($p['itemid'],$p['number']);
                }

                //-------发票信息start-------------------
                $invoicearr = array();
                $invoicearr['title'] = $args['title'];
                $invoicearr['number'] = $args['number'];
                $invoicearr['mobile'] = $args['mobile'];
                $invoicearr['card_number'] = $args['card_number'];
                $invoicearr['addtime'] = time();

                $invoiceid = $this->invoice->addInvoice($invoicearr);
                //-------发票信息end----------------------

                $order['ordersn'] = date('YmdHis').$userid.rand(10000,99999);
                $order['orderstatus'] = 1;//-------下单就为待发货状态为2----张建超--
                //$order['status_qufen'] = 1;//-------下单就为待发货状态为2----张建超--
                $order['orderuserid'] = $this->_user['sessionuserid'];
                $order['ordercreatetime'] = TIME;
                $order['ordersalerid'] = $userid;
                $order['orderprice'] = $price;
                $order['orderfee'] = $fee;
                $order['orderitems'] = $item;
                $order['orderaddress'] = $addressinfo;
                $order['buy_message'] = strip_tags($args['message']);   //买家留言
                $order['ordertitle'] = $znumber;
                $order['invoiceid'] = $invoiceid;//--发票ID
                if($args['orderpayfortype']) $order['orderpaytype'] = 1;

                $this->msg->sendMsg($order,1);
                $this->order->addOrder($order);

                $comp_code = $this->ev->get('comp_code');
                $caigou_code = $this->ev->get('caigou_code');
                $fukuan_code = $this->ev->get('fukuan_code');
                $dppct = $this->ev->get('dppct');
                $goodsData = $this->ev->get('goods');
                $seller = $this->user->getUserById($userid);    //获取卖家信息，取卖家的供应商编号
                //收集对接SAP采购订单接口数据
                $sapTemp['is_header']['ebeln'] = $order['ordersn'];  //平台单据号
                $sapTemp['is_header']['bukrs'] = $comp_code; //公司代码，页面输入
                $sapTemp['is_header']['lifnr'] = $seller['useropenid']; //供应商编码，卖家
                $sapTemp['is_header']['ekorg'] = '6000'; //采购组织
                $sapTemp['is_header']['ekgrp'] = $caigou_code;  //采购组
                $sapTemp['is_header']['zterm'] = $fukuan_code;  //付款条件代码
                $sapTemp['is_header']['dppct'] = sprintf("%.2f",$dppct);  //预付款百分比
                $sapTemp['is_header']['bedat'] = date('Ymd',$order['ordercreatetime']);  //采购订单日期
                $sapTemp['is_header']['reserve_f1'] = sprintf("%.2f",$price);  //订单的含税含运总价，保留两位小数，单位是元

                foreach($item as $k => $val)
                {
                    $shuiCode = $goodsData['mwskz'][$val['goodsid']];   //采购税码
                    $factoryCode = $goodsData['ewerk'][$val['goodsid']];   //工厂码
                    $shuiData = $this->sap->getShuiByCode($shuiCode);
                    $jingjia = $val['itemprice']/(1+$shuiData['kbetr']);
                    $wuliao = $this->getWuliaoInfo($val['wuliaocode']);
                    $sapGoodTemp[$k]['ebeln'] = $order['ordersn'];  //平台单据号
                    $sapGoodTemp[$k]['ebelp'] = $k+1 .'0';  //采购凭证的项目编号
                    $sapGoodTemp[$k]['pstyp'] = '0';  //采购凭证中的项目类别,写死 0
                    $sapGoodTemp[$k]['ewerk'] = $factoryCode;  //工厂
                    $sapGoodTemp[$k]['ematn'] = $val['wuliaocode'];  //物料编号
                    $sapGoodTemp[$k]['matkl'] = $wuliao['matkl'];  //物料组
                    $sapGoodTemp[$k]['menge'] = $val['number'];  //数量
                    $sapGoodTemp[$k]['meins'] = $wuliao['meins'];  //基本计量单位
                    $sapGoodTemp[$k]['mwskz'] = $shuiCode;  //销售税/采购税代码
                    $sapGoodTemp[$k]['text1'] = $val['goodstitle'];  //商品名称
                    $sapGoodTemp[$k]['netpr'] = sprintf("%.2f",$jingjia);  //净价
                }

                $sapTemp['it_item'] = $sapGoodTemp;

                $sapArr['ordersn'] = $order['ordersn'];
                $sapArr['buyerid'] = $order['orderuserid'];
                $sapArr['sellerid'] = $userid;
                $sapArr['param'] = json_encode($sapTemp);
                $sapArr['type'] = 1;    //1采购订单，2采购入库
                $this->sap->addSapOrder($sapArr);
            }

            $this->cart->clearOrderedItem();
            if($args['orderpayfortype'])
            {
                $message = array(
                    'statusCode' => 200,
                    "message" => "下单成功,即将转到支付页面",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?item-app-orderonlinepay"
                );
            }
            else
            {
                $message = array(
                    'statusCode' => 200,
                    "message" => "下单成功",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?user-company-orders"
                );

            }
            exit(json_encode($message));
        }
        else
        {
            $categories = $this->category->getCategoriesByArgs();
            $modules = $this->module->getModulesByApp('item');
            $mfields = array();
            $susers = array();
            $scarts = array();
            foreach($modules as $p)
            {
                $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'],1);
            }
            $carts = $this->cart->getCartItemList();
            foreach($carts as $p)
            {
                if(!$susers[$p['goodsuserid']])
                {
                    $susers[$p['goodsuserid']] = $this->user->getUserById($p['goodsuserid']);
                }
                $scarts[$p['goodsuserid']][] = $p;
            }
            $addressinfo = $this->address->getAddressInfoList(1,$this->_user['sessionuserid']);
            $this->tpl->assign('currentdate',strtotime(date('Y-m-d')));
            $this->tpl->assign('addressinfo',$addressinfo);
            $this->tpl->assign('susers',$susers);
            $this->tpl->assign('categories',$categories);
            $this->tpl->assign('mfields',$mfields);
            $this->tpl->assign('scarts',$scarts);
            $this->tpl->display('order3');
        }
    }


}


?>
