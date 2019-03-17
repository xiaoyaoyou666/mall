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
		$this->item = $this->G->make('item','item');
        $this->sap = $this->G->make('sap','item');
        $this->sapinfo = $this->G->make('sapinfo','item');
		$this->address = $this->G->make('address','user');
		$this->order = $this->G->make('orders','bank');
        $this->msg = $this->G->make('msg','user');
        $this->invoice = $this->G->make('invoice','user');
        $this->link = $this->G->make('link','content');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->tpl->assign('links',$links);
        $this->cart = $this->G->make('cart','item');
        $this->agreement = $this->G->make('agreement', 'agreement');
        $this->agreementgoods = $this->G->make('agreementgoods', 'agreement');
       // $cartNum = $this->cart->getCartItemNumber();
        //$this->tpl->assign('cartNum',$cartNum);

        $this->cart = $this->G->make('cart','item');
        $cartNumArr = $this->cart->getCartUserNum();
        foreach ($cartNumArr as $k => $v) {
            $cartnums[] = $v['number'];
        }
        $cartNum = array_sum($cartnums)?array_sum($cartnums):0;
        $this->tpl->assign('cartNum',$cartNum);
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
       /* echo "<pre/>";
        print_r($addressinfo);
        echo "<pre/>";*/


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


    public function getWuliaoInfo($code){
        $data = $this->sap->getWuliaoInfo($code);
        return $data;
    }


    private function index()
    {
        //$this->sap->addSapOrder('201808011519371811000',18);  //测试
        //$this->sap->addSapStock('201807181817521836722',1);  //测试
        $this->address = $this->G->make('address','user');
        $args = $this->ev->get('args');
        $znumber = strip_tags($args['znumber']);
    
        if($this->ev->get('createorder'))
        {
            $user = $this->user->getUserById($this->_user['sessionuserid']);
            $args = $this->ev->get('args');
            $addressid = $args['orderaddress'];
            $caigou_code = $this->ev->get('caigou_code');
            //$dppct = $this->ev->get('dppct');
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
                        exit(json_encode($message));
                    }
                    //如果是协议商品，取协议价格
                    if($cart['agreementid'] != 0)
                    {
                        $agreementGoods = $this->agreementgoods->getItemByTtemidAndAgreementid($cart['itemid'],$cart['agreementid']);
                        $cart['itemprice'] = $agreementGoods['agreement_price'];
                    }
                    $items[$cart['goodsuserid']][] = $cart;
                    //$items[$cart['goodsuserid']]['agrid'][] = $cart['agreementid'];
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
                //var_dump($item['goods'],$item['agrid']);die;

                $order['ordersn'] = date('YmdHis').$userid.rand(10000,99999);
                $order['orderstatus'] = 1;//-------下单就为待发货状态为2----张建超--
                $order['orderuserid'] = $this->_user['sessionuserid'];
                $order['ordercreatetime'] = TIME;
                $order['ordersalerid'] = $userid;
                $order['orderprice'] = $price;
                $order['orderfee'] = $fee;
                $order['orderitems'] = $item;
                $order['orderaddress'] = $addressinfo;
                $order['buy_message'] = strip_tags($args['message']);   //买家留言
                $order['ordertitle'] = $znumber;
                if($args['orderpayfortype']) $order['orderpaytype'] = 1;

                $this->msg->sendMsg($order,1);
                $this->order->addOrder($order);

                //$goodsData = $this->ev->get('goods');
                $seller = $this->user->getUserById($userid);    //获取卖家信息，取卖家的供应商编号
                $agreementData = $this->agreement->getAgreementById($item[0]['agreementid']);
                $fukuan_code = $agreementData['payment_code'];

                //收集对接SAP采购订单接口数据
                $sapTemp['is_header']['ebeln'] = $order['ordersn'];  //平台单据号
                $sapTemp['is_header']['bukrs'] = $user['sap_company_id']; //公司代码，页面输入
                $sapTemp['is_header']['lifnr'] = $seller['useropenid']; //供应商编码，卖家
                $sapTemp['is_header']['ekorg'] = '6000'; //采购组织
                $sapTemp['is_header']['ekgrp'] = $caigou_code;  //采购组
                $sapTemp['is_header']['zterm'] = $fukuan_code;  //付款条件代码
                $sapTemp['is_header']['dppct'] = '0';  //预付款百分比
                $sapTemp['is_header']['bedat'] = date('Y-m-d',$order['ordercreatetime']);  //采购订单日期
                $sapTemp['is_header']['reserve_f1'] = sprintf("%.2f",$price);  //订单的含税含运总价，保留两位小数，单位是元

                foreach($item as $k => $val)
                {
                    $shuiData = $this->sap->getShuiByCode($val['shui']);//采购税码
                    $jingjia = $val['itemprice']/(1+$shuiData['kbetr']);
                    $sapGoodTemp[$k]['ebeln'] = $order['ordersn'];  //平台单据号
                    $sapGoodTemp[$k]['ebelp'] = $k+1 .'0';  //采购凭证的项目编号
                    $sapGoodTemp[$k]['pstyp'] = '0';  //采购凭证中的项目类别,写死 0
                    $sapGoodTemp[$k]['ewerk'] = $user['sap_factory_id'];  //工厂
                    $sapGoodTemp[$k]['ematn'] = $val['FJLSBJCL_WLBH'];  //物料编号
                    $sapGoodTemp[$k]['matkl'] = $val['FJLSBJCL_WLZ'];  //物料组
                    $sapGoodTemp[$k]['menge'] = $val['number'];  //数量
                    $sapGoodTemp[$k]['meins'] = $val['FJLSBJCL_WLDW'];  //基本计量单位
                    $sapGoodTemp[$k]['mwskz'] = $val['shui'];  //销售税/采购税代码
                    $sapGoodTemp[$k]['txz01'] = $val['goodstitle'];  //商品名称
                    $sapGoodTemp[$k]['netpr'] = sprintf("%.2f",$jingjia);  //净价

                    //------------增加商品的税码和工厂的详细记录，用以立即购买使用--
                    $sapinfoarr = array();
                    $sapinfoarr['ordersn'] = $order['ordersn'];
                    $sapinfoarr['goodsid'] = $val['goodsid'];
                    $sapinfoarr['sapinfoid'] = $val['goodsid'];//---表不设置主键---
                    $sapinfoarr['factory_value'] = $user['sap_factory_id'];
                    $sapinfoarr['data_value'] = $val['shui'];
                    $sapinfoarr['addtime'] = time();
                    $sapinfoarr['buyid'] = $this->_user['sessionuserid'];
                    $sapinfoarr['sellerid'] = $userid;
                    $sapinfoarr['data_desc'] = $shuiData['text1'];
                    $factoryinfo = $this->sap->getFactorysByCode($user['sap_factory_id']);//--查询出工厂信息
                    $sapinfoarr['factory_desc'] = $factoryinfo['name1'];
                    $sapinfoarr['fukuancode'] = $fukuan_code;
                    $sapinfoarr['wuliucode'] = $val['FJLSBJCL_WLBH'];   //物料编号
                    $sapinfoarr['wuliuzu'] = $val['FJLSBJCL_WLZMS'];  //物料组描述
                    $sapinfoarr['danwei'] = $val['FJLSBJCL_WLDW'];   //物料计量单位
                    $this->sapinfo->addSapOrder($sapinfoarr);
                    //------------增加商品的税码和工厂的详细记录结束--------------------

                }

                $sapTemp['it_item'] = $sapGoodTemp;
                $sapArr['ordersn'] = $order['ordersn'];
                $sapArr['buyerid'] = $order['orderuserid'];
                $sapArr['sellerid'] = $userid;
                $sapArr['param'] = json_encode($sapTemp);
                $sapArr['type'] = 1;    //1采购订单，2采购入库
                //var_dump($sapArr);die;

                $this->sap->insertSapOrder($sapArr);    //入sap_order记录表,sap采购订单接口需要在卖家确认订单的时候触发
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
                    "forwardUrl" => "index.php?user-company-ordersbuy"
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
            $invoiceData = $this->invoice->getInvoiceByUserid($this->_user['sessionuserid']);   //发票信息
            $this->tpl->assign('currentdate',strtotime(date('Y-m-d')));
            $this->tpl->assign('addressinfo',$addressinfo);
            $this->tpl->assign('invoiceData',$invoiceData);
            $this->tpl->assign('susers',$susers);
            $this->tpl->assign('categories',$categories);
            $this->tpl->assign('mfields',$mfields);
            $this->tpl->assign('scarts',$scarts);
            $this->tpl->display('order2');
        }
    }
    
    public function testadd()
    {
        
        $this->sap->sapTest();  //测试
    }


}


?>
