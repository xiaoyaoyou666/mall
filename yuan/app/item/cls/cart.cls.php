<?php

class cart_item
{
	public $G;
	public $session;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->sql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->ev = $this->G->make('ev');
		$this->session = $this->G->make('session');
		$this->item = $this->G->make('item','item');
		$this->user = $this->G->make('user','user');
		$this->_user = $this->session->getSessionUser();
	}

	public function addPoster($args)
	{
		$data = array('posts',$args);
		$sql = $this->sql->makeInsert($data);
		$this->db->exec($sql);
		return true;
	}

	public function delPoster($psid)
	{
		$data = array("posts",array(array("AND","psid = :psid",'psid',$psid)));
		$sql = $this->sql->makeDelete($data);
		$this->db->exec($sql);
		return true;
	}

	public function getPosterById($psid)
	{
		$data = array(false,"posts",array(array("AND","psid = :psid",'psid',$psid)));
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function modifyPoster($psid,$args)
	{
		$data = array("posts",$args,array(array("AND","psid = :psid",'psid',$psid)));
		$sql = $this->sql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	public function listPoster()
	{
		$data = array(false,'posts',1,false,false,false);
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetchAll($sql);
	}

	public function clearOrderedItem()
	{
		$data = array("cart",array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid']),array("AND","cartstatus = 1")));
		$sql = $this->sql->makeDelete($data);
		$this->db->exec($sql);
		return true;
	}

	public function getCartItemNumber()
	{
		//$data = array("SUM(number) AS number","cart",array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid'])));
		$data = array("COUNT(*) AS number","cart",array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid']),array("AND","cartstatus = 1")));
		$sql = $this->sql->makeSelect($data);
		$r = $this->db->fetch($sql);
		return intval($r['number']);
	}

    /**
     * 获取购物车商品（包括没有加入协议的商品）
     * @return mixed
     */
	public function getCartItemList()
	{
		$data = array("*",array('cart','item','goods'),array(array("AND","cart.itemid = item.itemid"),array("AND","item.itemgoodsid = goods.goodsid"),array("AND","cart.userid = :userid",'userid',$this->_user['sessionuserid'])),false,'goodsuserid ASC');
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetchAll($sql,'cartid',array('goodsphotos','goodsproperty'));
	}

	/**
     * 获取购物车商品（包括没有加入协议的商品）
     * @return mixed
     */
	public function getCartItemLists()
	{
		$data = array("*",array('cart','item','goods'),array(array("AND","cart.itemid = item.itemid"),array("AND","item.itemgoodsid = goods.goodsid"),array("AND","cart.cartstatus = :cartstatus",'cartstatus',1),array("AND","cart.userid = :userid",'userid',$this->_user['sessionuserid'])),false,'goodsuserid ASC');
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetchAll($sql,'cartid',array('goodsphotos','goodsproperty'));
	}



    /**
     * 获取购物车商品（不包括没有加入协议的商品）
     * @return mixed
     */
    public function getCartItemListByAgreement()
    {
        $data = array("*",array('cart','item','goods','agreement_goods'),array(array("AND","cart.itemid = item.itemid"),array("AND","item.itemgoodsid = goods.goodsid"),array("AND","cart.itemid = agreement_goods.itemid"),array("AND","cart.userid = :userid",'userid',$this->_user['sessionuserid'])),false,'goodsuserid ASC');
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetchAll($sql,'cartid',array('goodsphotos','goodsproperty'));
    }

    function refreshCart()
	{
		$data = array("cart",array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid']),array("AND","number < 1")));
		$sql = $this->sql->makeDelete($data);
		$this->db->exec($sql);
	}

	public function downCartItems()
	{
		$data = array("cart",array('cartstatus' => 0),array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid'])));
		$sql = $this->sql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function updateCartItem($cartid,$args)
	{
		$data = array("cart",$args,array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid']),array("AND","cartid = :cartid",'cartid',$cartid)));
		$sql = $this->sql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	function delCartItem($itemid)
	{
		$data = array("cart",array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid']),array("AND","itemid = :itemid",'itemid',$itemid)));
		$sql = $this->sql->makeDelete($data);
		$this->db->exec($sql);
		return true;
	}

    public function addItem($itemid,$number=1,$sellerid=0,$agreementid)
    {
    	if($number<1)return false;
    	else
    	{
	    	$item = $this->item->getItemById($itemid);
			if($item['itemnumber'] < $number)return false;
	    	$r = $this->getItemInCart($itemid);
	    	if($r)
			{
				$args = array('number'=>$number,'time' => TIME,'cartstatus' => 1);
				$data = array('cart',$args,array(array("AND","cartid = :cartid","cartid",$r['cartid'])));
				$sql = $this->sql->makeUpdate($data);
				$this->db->exec($sql);
				return true;
			}
			else
			{
				$args = array('userid'=>$this->_user['sessionuserid'],'itemid'=>$itemid,'number'=>$number,'time' => TIME,'cartstatus' => 1,'sellerid'=>$sellerid,'agreementid'=>$agreementid);
				$data = array('cart',$args);
				$sql = $this->sql->makeInsert($data);
				$this->db->exec($sql);
				return true;
			}
    	}
    }

	public function getItemInCart($itemid)
	{
		$data = array(false,"cart",array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid']),array("AND","itemid = :itemid",'itemid',$itemid)));
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function clearCartByuserid()
	{
		if(!$this->_user['sessionuserid'])return false;
		else
		{
			$data = array("cart",array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid'])));
			$sql = $this->sql->makeDelete($data);
			$this->db->exec($sql);
			return true;
		}
	}

	public function clearCart()
	{
		$data = array("cart",array(array("AND","time <= '".TIME."'")));
		$sql = $this->sql->makeDelete($data);
		$this->db->exec($sql);
		return true;
	}

	public function getAddressById($id,$userid = NULL)
	{
		if($userid)
		$data = array(false,"address",array(array("AND","adid = :adid",'adid',$id),array("AND","aduserid = :aduserid",'aduserid',$userid)));
		else
		$data = array(false,"address",array(array("AND","adid = :adid",'adid',$id)));
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql,'adinfo');
	}

	public function getAddressByUserid($userid)
	{
		$data = array(false,"address",array(array("AND","aduserid = :aduserid",'aduserid',$userid)),false,false,5);
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetchAll($sql,'adid','adinfo');
	}

	public function addAddress($args)
	{
		$data = array('address',$args);
		$sql = $this->sql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	public function delAddressById($id,$userid = NULL)
	{
		if($userid)
		$data = array("address",array(array("AND","adid = :adid",'adid',$id),array("AND","aduserid = :aduserid",'aduserid',$userid)));
		else
		$data = array("address",array(array("AND","adid = :adid",'adid',$id)));
		$sql = $this->sql->makeDelete($data);
		$this->db->exec($sql);
		return true;
	}

    public function getCartItemListiosapi()
    {
        $data = array("*",array('cart','item','goods'),array(array("AND","cart.itemid = item.itemid"),array("AND","item.itemgoodsid = goods.goodsid"),array("AND","cart.userid = :userid",'userid',$this->_user['sessionuserid'])),false,'goodsuserid ASC');
        $sql = $this->sql->makeSelect($data);
        $r = $this->db->fetchAll($sql,'cartid',array('goodsphotos','goodsproperty'));
        //查询出filed
        $data2 = array('field',array('module_fields'),array(array("AND","fieldappid = fieldappid",'fieldappid','item'),array("AND","fieldsystem = 1")));
        $sql2 = $this->sql->makeSelect($data2);
        $result = $this->db->fetchAll($sql2);

        foreach($r as $k => $v)
        {
            foreach($result as $v2)
            {
                $r[$k]['iosstyle'][$v2['field']] = $v[$v2['field']];
            }

        }
        return $r;
    }
    /**
     * [getCartUserNum description]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-08
     * @returns  {array} 返回购物车数量总和
     */
    public function getCartUserNum(){
    	$data = array(false,"cart",array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid'])));
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetchAll($sql);
    }

    /**
     * [getCartNumByStatus 根据状态查询]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-27
     * @return   [type]        [description]
     */
    public function getCartNumByStatus(){
    	$data = array(false,"cart",array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid']),array("AND","cartstatus = :cartstatus",'cartstatus',0)));
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
    }

    /**
     * [getCartNumBySellerid description]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-27
     * @param    [int]        $sellerid [卖家ID]
     * @return   [bool]          [TRUE OR FALSE]
     */
    public function getCartNumBySellerid($sellerid){
    	$data = array(false,"cart",array(array("AND","sellerid = :sellerid",'sellerid',$sellerid),array("AND","cartstatus = :cartstatus",'cartstatus',0)));
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);

    }

    /**
     * [getCartNumBySellerid description]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-27
     * @param    [int]        $sellerid [卖家ID]
     * @return   [bool]          [TRUE OR FALSE]
     */
    public function getCartNumBySellerids($sellerid){
    	$data = array(false,"cart",array(array("AND","sellerid = :sellerid",'sellerid',$sellerid),array("AND","cartstatus = :cartstatus",'cartstatus',1)));
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);

    }


    /**
     * [updateCartStatusByUserid 修改某个用户的购物车所有的商品]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-27
     * @param    [type]        $args [要修改数据]
     * @return   [bool]              [true or false]
     */
    public function updateCartStatusByUserid($args){
    	$data = array("cart",$args,array(array("AND","userid = :userid",'userid',$this->_user['sessionuserid'])));
		$sql = $this->sql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
    }

    /**
     * [updateCartStatusByUserid 修改某个卖家的购物车所有的商品]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-27
     * @param    [int]          $sellerid       [卖方的ID]
     * @param    [array]        $args         [要修改数据]
     * @return   [bool]                    [true or false]
     */
    public function updateCartStatusBySellerid($sellerid,$args){
    	$data = array("cart",$args,array(array("AND","sellerid = :sellerid",'sellerid',$sellerid)));
		$sql = $this->sql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
    }
}

?>
