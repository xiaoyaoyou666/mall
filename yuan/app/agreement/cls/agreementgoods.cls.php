<?php
/**
 * 协议商品类
 */
class agreementgoods_agreement
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->link = NULL;
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->tpl = $this->G->make('tpl');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
	}


	/**
	 * [addAgreementgoods 添加方法]
	 * @Author    Zhangjianchao
	 * @DateTime  2018-08-13
	 * @param     $args  {array} 需要添加表的数据
	 * @returns   {array}   bool 返回true或者false      
	 */
	public function addAgreementgoods($args)
	{
		return $this->db->insertElement(array('table' => 'agreement_goods','query' => $args));
	}


	/**
	 * [modifyAgreementgoods 修改方法]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [int]       $id     [主键ID]
	 * @param    [array]     $args [修改数据]
	 * @return   [bool]       [true or false]
	 */
	public function modifyAgreementgoods($id,$args)
	{
		
		$data = array(
			'table' => 'agreement_goods',
			'value' => $args,
			'query' => array(array('AND',"id = :id",'id',$id))
		);
		return $this->db->updateElement($data);
	}

	/**
	 * [delAgreementgoods 根据ID删除一条数据]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [int]        $id  [主键ID]
	 * @return   [bool]            [true or false]
	 */
	public function delAgreementgoods($id)
	{
		return $this->db->delElement(array('table' => 'agreement_goods','query' => array(array("AND","id = :id",'id',$id))));
	}

	/**
	 * [getAgreementgoodsById 根据ID查询详细信息]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [int]        $id  [主键ID]
	 * @return   [bool]            [true or false]
	 */
	public function getAgreementgoodsById($id)
	{
		$data = array(false,'Agreementgoods',array(array("AND","id = :id",'id',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
	}


	/**
	 * [getAgreementgoodsList 协议列表方法]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [array]         $args   [查询条件]
	 * @param    [int]           $page   [当前页码]
	 * @param    [int]       $number [当前页的数量]
	 * @return   [type]                [description]
	 */
	public function getAgreementgoodsList($args,$page,$number = 10)
    {
        $data = array(
            'select' => false,
            'table' => 'agreement_goods',
            'query' => $args,
            'serial' => '',
            'orderby' => 'addtime DESC'
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
	}

	/**
	 * [getAgreementgoodsByUserid 根据用户ID查询用户是存在协议]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [int]   $userid        用户ID
	 * @return   [bool]  true or false  结果  
	 */
	public function getAgreementgoodsByUserid($userid){
		$data = array(false,'agreement_goods',array(array("AND","userid = :userid",'userid',$userid)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql);

	}

	/**
	 * [getAgreementgoodsListByUserid 获取用户ID下的协议商品列表]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-14
	 * @param    [int]        $userid  [用户id]
	 * @return   [array]      $r       [结果集]
	 */
	public function getAgreementgoodsListByUserid($userid,$page,$number = 10){
		$args[] = array("AND","userid = :userid",'userid',$userid);
		$data = array(
            'select' => false,
            'table' => 'agreement_goods',
            'query' => $args,
            'serial' => '',
            'orderby' => 'addtime DESC'
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
	}


	/**
	 * [getAgreementgoodsByUserid 根据用户ID查询用户是存在协议]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [int]   $userid        用户ID
	 * @return   [bool]  true or false  结果  
	 */
	public function getAgreementgoodsByUseridOne($userid){
		$data = array(false,'agreement_goods',array(array("AND","userid = :userid",'userid',$userid)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);

	}


	public function getAgreementgoodsPrice($goodid){
		$data = array(false,'agreement_goods',array(array("AND","goodid = :goodid",'goodid',$goodid)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r;
	}


	/**
	 * [getAgreementgoodsByAgreementid description]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-14
	 * @param    [type]        $agreementid [合同ID]
	 * @return   [array]                    [结果集]
	 */
	public function getAgreementgoodsByAgreementid($agreementid){
		

        $data = array(false,'agreement_goods',array(array("AND", "find_in_set(agreementid,:agreementid)", "agreementid", $agreementid)));
        
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql);

	}

	/**
	 * [isTrue 查询该商品ID是否在协议商品表中]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-22
	 * @param    [int]        $goodid [商品ID]
	 * @return   boolean       [TRUE OR FALSE]
	 */
	public function isTrue($goodid,$agreementids){
		$data = array(false,'agreement_goods',array(array("AND","goodid = :goodid",'goodid',$goodid),array("AND", "find_in_set(agreementid,:agreementid)", "agreementid", $agreementids)));
		$sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r;
	}

    /**
     * 根据协议id查询协议商品以及商品名称，规格名称
     * @param $agreementid
     * @return mixed
     */
    public function getAgrgoodsAndItemByAgrid($agreementid)
    {
        $data = array("*",array('agreement_goods','item','goods'),array(array("AND","agreement_goods.itemid = item.itemid"),array("AND","item.itemgoodsid = goods.goodsid"),array("AND","agreement_goods.agreementid = :agreementid",'agreementid',$agreementid)),false,'goodsuserid ASC');
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql);
    }

    /**
     * 根据商品id，公司id，协议ids取协议商品和规格
     * @param $goodid
     * @param $companyid
     * @param $agreementidArr
     * @return mixed
     */
    public function getItemsByGoodsidAndAgreementid($goodid,$companyid,$agreementidArr)
    {
        $data = array(false,'agreement_goods',array(array("AND","goodid = :goodid",'goodid',$goodid),array("AND","salerid = :salerid",'salerid',$companyid),array("AND", "find_in_set(agreementid,:agreementidArr)", "agreementidArr", $agreementidArr)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetchAll($sql);
        return $r;
    }


    /**
     * 根据协议id和规格id获取数据
     * @param $itemid
     * @param $agreementid
     * @return mixed
     */
    public function getItemByTtemidAndAgreementid($itemid,$agreementid)
    {
        $data = array(false,'agreement_goods',array(array("AND","agreementid = :agreementid",'agreementid',$agreementid),array("AND","itemid = :itemid",'itemid',$itemid)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }






}

?>
