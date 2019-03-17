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
		if(!$this->_user['sessionuserid'])
        {
            $message = array(
                'statusCode' => 301,
                "message" => "请您先登录哦",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?user-app-login"
            );
            $this->G->R($message);
        }
		$action = $this->ev->url(3);
		$this->cart = $this->G->make('cart','item');
        $this->address = $this->G->make('address','user');
        $this->link = $this->G->make('link','content');
        $this->agreement = $this->G->make('agreement', 'agreement');
        $this->agreementgoods = $this->G->make('agreementgoods', 'agreement');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->tpl->assign('links',$links);

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

	private function updatecartstatus()
	{
		$cartid = $this->ev->get('cartid');
		$status = $this->ev->get('status');
		$this->cart->updateCartItem($cartid,array('cartstatus' => $status));
	}

	private function updatecart()
	{
		$cartid = $this->ev->get('cartid');
		$number = $this->ev->get('number');
		if($number >= 1)
		{
			$this->cart->updateCartItem($cartid,array('number' => $number));
		}
	}

	private function delcartitem()
    {
        $cartid = $this->ev->get('cartid');
        $this->cart->delCartItem($cartid);
        $message = array(
            'statusCode' => 200,
            "message" => "移出购物车成功",
            "callbackType" => "forward",
            "forwardUrl" => "reload"
        );
        $this->G->R($message);
    }

    /**
     * 加入购物车
     * itemid：商品id
     */
	private function addtocart()
	{
        $itemid = $this->ev->get('itemid');
        $number = $this->ev->get('number');
        $agreementid = $this->ev->get('agreementid');
//        if(empty($agreementid)){
//            $message = array(
//                'statusCode' => 300,
//                "message" => "尚未签署该商品相关采购合同！"
//            );
//            $this->G->R($message);
//        }

        $iteminfo = $this->item->getItemById($itemid);
        #商品详情
        $goodsinfoarr = $this->item->getGoodsById($iteminfo['itemgoodsid']);
        //判断当前加入的商品是否自己的商品
        $userInfo = $this->session->getSessionUser();
        if($userInfo['sessionuserid']==$goodsinfoarr['goodsuserid']){
            $message = array(
                'statusCode' => 300,
                "message" => "您不能购买自家的商品！"
            );
            $this->G->R($message);
        }
        $item_number = $iteminfo['itemnumber'];
        //下单库存数量判断
        if($number > $item_number){
            $message = array(
                'statusCode' => 300,
                "message" => "操作失败，产品库存不足"
            );
            $this->G->R($message);
        }
        //判断价格
        if($iteminfo['itemprice'] <= 0)
        {
            $message = array(
                'statusCode' => 300,
                "message" => "供应商未设置价格，请点击询价"
            );
            $this->G->R($message);
        }
        //起订量判断
        $limit_number = $iteminfo['itemlimitnumber'];
        if($number < $limit_number)
        {
            $message = array(
                'statusCode' => 300,
                "message" => "数量或金额不满足商家起订规则"
            );
            $this->G->R($message);
        }
        if($this->ev->get('saletype'))
        {
        	$this->cart->downCartItems();
        }
        //----判断个人购物车是否存在同样规格的产品----
        $mycart = $this->cart->getItemInCart($itemid);
        if ($mycart) {
            $newNumber = $mycart['number'] + $number;
            $args['number'] = $newNumber;
            $status = $this->cart->updateCartItem($mycart['cartid'],$args);
        }else{
           $status = $this->cart->addItem($itemid,$number,$goodsinfoarr['goodsuserid'],$agreementid);
        }
        $flag = $this->ev->get('flag');
        if($status)
        {
            if($this->ev->get('saletype'))
            {
            	$message = array(
	                'statusCode' => 200,
	                "message" => '操作成功!',
	                "callbackType" => "forward",
	                "forwardUrl" => "index.php?item-app-order"
	            );
            }
            else
            {
            	$message = array(
                    "statusCode" => 200,
	                "message" => '加入购物车成功!',
                    "ishide" =>1,
	                "callbackType" => "forward",
	                "forwardUrl" => "index.php?item-app-cart"
	            );
            }
        }
        else
        {
            $message = array(
                'statusCode' => 300,
                "message" => "操作失败，产品库存不足"
            );
        }
        $this->G->R($message);
	}

    private function tidy()
    {
        $args = $this->ev->get('args');
        $items = $this->cart->getCartItemList();
        if(is_array($args))
        {
            foreach($args as $key => $p)
            {
                if(array_key_exists('number',$p))
                {
                    $p['number'] = intval($p['number']);
                    $item = $this->item->getItemById($items[$key]['itemid']);
                    if($item['itemnumber'] < $p['number'])
                    {
                        $message = array(
                            'statusCode' => 300,
                            'errnum' => $items[$key]['number'],
                            "message" => $item['itemtitle']."库存仅剩".$item['itemnumber']."件，不能结算"
                        );
                        $this->G->R($message);
                    }
                }
                $this->cart->updateCartItem($key,$p);
            }
        }
        $this->cart->refreshCart();
        $items = $this->cart->getCartItemList();
        if($this->ev->get('gotidy'))
        {
            if(!$items)
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "请勾选商品"
                );
                $this->G->R($message);
            }
            $message = array(
                'statusCode' => 200,
                "message" => "购物车整理完毕，转向订单页面",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?item-app-order"
            );
        }
        else
        {
            $message = array(
                'statusCode' => 200,
                "message" => "修改成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?item-app-cart"
            );
        }
        $this->G->R($message);
    }

	private function index()
	{
        $carts = $this->cart->getCartItemList();
        $validCarts = $this->cart->getCartItemLists();  //取购物车选中的商品
        foreach($validCarts as $key => &$val)
        {
            if($this->ev->get('tidycart'))
            {
                $isValidAgreem = $this->agreement->getValidAgreementById($val['agreementid']);
                if($isValidAgreem == false)
                {
                    $message = array(
                        'statusCode' => 300,
                        "message" => "有商品所属框架协议已失效，将以公开价交易。"
                    );
                    $this->G->R($message);
                }
            }
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
                $this->G->R($message);
            }
           
            if(!$carts)
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "请勾选商品"
                );
                $this->G->R($message);
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
                    $this->G->R($message);
                }
                if($p['cartstatus'] && ($p['itemnumber'] < $p['number']))
                {
                    $message = array(
                        'statusCode' => 300,
                        'errnum' => $p['number'],
                        "message" => $p['itemtitle']."库存仅剩".$p['itemnumber']."件，不能结算，请调整您的进货量"
                    );
                    $this->G->R($message);
                }
                if($p['cartstatus'] == 1)
                {
                    $temp[] = $p['agreementid'];
                }
            }

            //判断要结算的购物车商品是否属于同一个协议
            $allsame = true;
            for($i = 1; $i < count($temp); ++$i)
            {
                if($temp[0] != $temp[$i])
                {
                    $allsame = false;
                    break;
                }
            }
            if($allsame == false)
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "当前商品分属不同协议，请按所属协议分别下单"
                );
                $this->G->R($message);
            }

            $message = array(
                'statusCode' => 200,
                'ishide' =>1,
                "message" => "购物车整理完成，正在结算",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?item-app-order"
            );
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
            foreach($carts as $key => $p)
            {
//                if($p['agreementid'] > 0)
//                {
//                    //查询该商品规格所属的协议是否失效，如果失效，将cart商品规格状态变成0
//                    $agreeData = $this->agreement->getValidAgreementById($p['agreementid']);
//                    //协议生效
//                    if($agreeData)
//                    {
//                        $p['isvalid'] = 1;
//                    }else{
//                        //协议不生效，修改购物车该规格商品状态
//                        $p['isvalid'] = 0;
//                        //$p['cartstatus'] = 0;
//                        //$this->cart->updateCartItem($key,array('cartstatus' => 0));
//                    }
//                    //$p['isvalid'] = $agreeData ? 1 : 0;
//                }

                if(!$susers[$p['goodsuserid']])
                {
                    $susers[$p['goodsuserid']] = $this->user->getUserById($p['goodsuserid']);
                }
                if($p['itemnumber'] >= $p['number'])
                    $scarts[$p['goodsuserid']][] = $p;
                else
                {
                    $p['cartstatus'] = 0;
                    $this->cart->updateCartItem($key,array('cartstatus' => 0));
                    $scarts[$p['goodsuserid']][] = $p;
                }
            }

            foreach ($susers as $k => &$v) {
                $istrueselect = $this->cart->getCartNumBySellerid($v['userid']);
                if ($istrueselect) {
                    $v['istrue'] = 1; 
                }else{
                    $v['istrue'] = 2;
                }
            }
            /*echo "<pre/>";
            print_r($susers);
            echo "<pre/>";*/

            #查询当前用户的所有商品的状态【用户是否进行全选显示-2018-8-27】
            $mycartall = $this->cart->getCartNumByStatus();
            $isNull = empty($scarts) ? 1 : 2;
            $this->tpl->assign('currentdate',strtotime(date('Y-m-d')));
            $this->tpl->assign('susers',$susers);
            $this->tpl->assign('mycartall',$mycartall);
            $this->tpl->assign('categories',$categories);
            $this->tpl->assign('addressinfo',$addressinfo);
            $this->tpl->assign('mfields',$mfields);
            $this->tpl->assign('scarts',$scarts);
            $this->tpl->assign('isNull',$isNull);
            $this->tpl->display('cart');
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
                "forwardUrl" => "index.php?item-app-cart"
            );
            $this->G->R($message);
        }
        else
        $this->tpl->display('addaddress');
    }

    private function addnewaddress()
    {
        $this->address = $this->G->make('address','user');
        $args = $this->ev->get('ads');

        //var_dump($args);die;
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

    /**
     * [selectall 购物车的全选和全不选的方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-27
     * @return   [bool]        [true or false]
     */
    private function selectall(){
        //接收参数进行判断
        $type = $this->ev->get('type');
        #声明一个空的数组
        $args = array();
        if ($type==1) {
            $args['cartstatus'] = 1;
            
        } else {
            $args['cartstatus'] = 0;
        }
        
        $result = $this->cart->updateCartStatusByUserid($args);
        if ($result) {
            $message = array(
                'statusCode' => 200,
                'message' => "成功"
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

    /**
     * [comselect 购物车点击商家进行全选和全不选]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-27
     * @return   [type]        [description]
     */
   private function comselect(){
        //接收参数进行判断
        $type = $this->ev->get('type');
        $sellerid = $this->ev->get('sellerid');
        //var_dump($type);
        //var_dump($sellerid);die;
        #声明一个空的数组
        $args = array();
        if ($type==1) {
            $args['cartstatus'] = 1;
            
        } else {
            $args['cartstatus'] = 0;
        }
        
        $result = $this->cart->updateCartStatusBySellerid($sellerid,$args);
        if ($result) {
            $message = array(
                'statusCode' => 200,
                'message' => "成功"
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
}


?>
