<?php


class price_purchase
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
	}

	/*
	* 报价的添加方法
	* $args   array 数据数组
	* return  bool   布尔值
	* @author  zhangjianchao
	* @data    2018-10-25
	*
	*/
	public function addPurchasePrice($args)
	{
		return $this->db->insertElement(array('table' => 'purchase_price','query' => $args));
	}


	/*
	* 报价列表
	* $args   array   查询条件
	* $page   int     当前页码
	* $number int     返回数据条目
	* $order  string  排序条件
	* return  array   数据列表
	* @author  zhangjianchao
	* @data    2018-10-25
	*
	*/
	public function purchaseList($args,$page,$number = 20,$order = 'create_time DESC')
	{

		$args[] = array("AND","purchase_price.purchase_new_id = purchase_new.id");
		$data = array(
			'select' => false,
			'table' => array('purchase_price','purchase_new'),
			'query' => $args,
			'orderby' => $order

		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}


	/*
	* 报价修改
	* $id     int       数据主键id
	* $args   array     修改的数据
	* @author  zhangjianchao
	* @data    2018-10-25
	*
	*/
	public function updatePurchase($id,$args){
		$data = array(
			'table' => 'purchase_price',
			'value' => $args,
			'query' => array(array('AND',"pid = :pid",'pid',$id))
		);
		return $this->db->updateElement($data);
	}


    /*
    * 根据企业用户ID修改企业名称
    * $supplierid     int       报价用户ID
    * $args           array     修改的数据
    * @author  zhangjianchao
    * @data    2018-10-25
    *
    */
    public function updatePurchaseCompanyname($supplierid,$args){
        $data = array(
            'table' => 'purchase_price',
            'value' => $args,
            'query' => array(array('AND',"supplier_id = :supplier_id",'supplier_id',$supplierid))
        );
        return $this->db->updateElement($data);
    }

	/*
	* 报价删除
	* $id       int       数据主键id
	* return   bool       修改的数据
	* @author  zhangjianchao
	* @data    2018-10-25
	*
	*/
	public function delPurchase($id){
		return $this->db->delElement(array('table' => 'purchase_price','query' => array(array('AND',"id = :id",'id',$id))));
	}



	/*
	* 当前报价信息的排名
	* $purchase_id    int   询价信息id
	* $id             int   报价信息id
	* return          int   排名顺序
	* @author  zhangjianchao
	* @data    2018-10-25
	*
	*/
	public function ranking($purchase_id,$id){
    	$data = array();
        $sql = "SELECT * FROM `x2_purchase_price` where `purchase_new_id`='".$purchase_id."' order by  cast(total_price as SIGNED INTEGER) asc";
        $data['sql'] = $sql;
        $data['v'] = array();
        $arr = $this->db->fetchALL($data,false);

        foreach ($arr as $k => $v) {
        	if ($v['pid']==$id) {
        		return $k+1;
        	}
        }

	}


	public function getPricedNumber($purchaseid)
	{
        $data = array('count(*) as number','purchaseprice',array(array('AND',"ppepurchaseid = :ppepurchaseid",'ppepurchaseid',$purchaseid)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r['number'];
	}

	public function isPricedPurchase($purchaseid,$userid)
	{
        $data = array(false,'purchaseprice',array(array('AND',"ppeuserid = :ppeuserid",'ppeuserid',$userid),array('AND',"ppepurchaseid = :ppepurchaseid",'ppepurchaseid',$purchaseid)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql,'ppeinfo');
	}

	public function getPurchasePriceById($id)
	{
        $data = array(false,'purchase_new',array(array('AND',"id = :id",'id',$id)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r['xunjia_ren'];

	}

    /**
     *根据询价ID和报价人ID获取一条报价记录信息
     */
    public function getPurchasePriceByXidAndUid($xid,$uid)
    {
        $data = array(false,'purchase_price',array(array('AND',"purchase_new_id = :purchase_new_id",'purchase_new_id',$xid),array('AND',"supplier_id = :supplier_id",'supplier_id',$uid)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r;

    }

	public function getPurchasePriceList($args,$page,$number = 20,$order = 'ppeid DESC')
	{
		$args[] = array("AND","ppeuserid = userid");
		$data = array(
			'select' => false,
			'table' => array('purchaseprice','user'),
			'query' => $args,
			'orderby' => $order,
            'serial' => 'ppeinfo'
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

	public function modifyPurchasePrice($id,$args)
	{
		$data = array(
			'table' => 'purchaseprice',
			'value' => $args,
			'query' => array(array('AND',"ppeid = :ppeid",'ppeid',$id))
		);
		return $this->db->updateElement($data);
	}



	//获取我报价的数量
	public function getMyNumber($ppeuserid)
	{
        $data = array('count(*) as number','purchaseprice',array(array('AND',"ppeuserid = :ppeuserid",'ppeuserid',$ppeuserid)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r['number'];
	}

	//获取别人报价的数量
	public function getOtherNumber($purchaseids)
	{
        $data = array('count(*) as number','purchaseprice',array(array("AND","find_in_set(ppepurchaseid,:purchaseids)","purchaseids",$purchaseids)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r['number'];
	}


	//采购表和报价表的关联
	public function getPurchaseFollowList($args,$page,$number = 20,$order = 'ppeid DESC')
	{
		$args[] = array("AND","ppepurchaseid = purchaseid");
		$data = array(
			'select' => false,
			'table' => array('purchaseprice','purchase'),
			'query' => $args,
			'orderby' => $order,
            'serial' => ''
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

    public function updateSearchLog($type,$keyword)
    {
        $data1 = array(false,'search_log',array(array('AND',"searchtype = :searchtype",'searchtype',$type),array('AND',"keyword = :keyword",'keyword',$keyword)));
        $isSetsql = $this->pdosql->makeSelect($data1);
        $isSet = $this->db->fetch($isSetsql);
        $args = array();
        if($isSet)
        {
            $args['num'] = $isSet['num'] + 1;
            $args['updatetime'] = time();
            $data2 = array(
                'table' => 'search_log',
                'value' => $args,
                'query' => array(array('AND',"id = ".$isSet['id']))
            );
            $this->db->updateElement($data2);
        } else {
            $args['searchtype'] = $type;
            $args['keyword'] = $keyword;
            $args['num'] = 1;
            $args['updatetime'] = time();
            $this->db->insertElement(array('table' => 'search_log','query' => $args));
        }
    }


    public function priceAllList($purchase_id,$userid){
    	$data = array();
        $sql = "SELECT * FROM `x2_purchase_price` where `purchase_new_id`='".$purchase_id."' and `supplier_id`='".$userid."' and del=0 LIMIT 1";
        $data['sql'] = $sql;
        $data['v'] = array();
        $arr = $this->db->fetch($data,false);

        return $arr['pid'];

	}


     public function priceinfo($id){

        $data = array();
        $sql = "SELECT * FROM `x2_purchase_price` where `pid`=".$id;
        $data['sql'] = $sql;
        $data['v'] = array();
        $arr = $this->db->fetch($data,false);

        return $arr;

    }


}
?>
