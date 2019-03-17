<?php

class setorder_core
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
		$this->ev = $this->G->make('ev');
		$this->files = $this->G->make('files');
	}
    
    // 实例化congig表   拿到   value值 进行 区域查询所有表  判断当前时间-收货时间  进行修改状态
    public function setlist($args,$page,$number = 10)
    {
      $data = array(
			'select' => false,
			'table' => 'config',
			'query' => $args,
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
    }    

    public function getOrderList($args,$page,$number = 10,$order = 'ordercreatetime DESC')
	{
		$args[] = array("AND","orderuserid = userid");
		$data = array(
			'select' => false,
			'table' => array('orders','user'),
			'query' => $args,
			'orderby' => $order,
			'serial' => array('orderitems','orderaddress','orderpost','buy_comment','seller_comment')
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}
	
    // 修改订单状态
	public function updeorder($argsd,$ordersn)
	{
		$data = array('orders',$argsd,array(array("AND","ordersn = :ordersn",'ordersn',$ordersn)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}	


	// 实例化congig表   拿到   value值 进行 区域查询所有表  判断当前时间-收货时间  进行修改状态
    public function listordersn($arg,$page,$number=10,$order = 'ordercreatetime DESC')
	{
		$data = array(
			'select' => false,
			'table' => 'orders',
			'query' => $arg,
			'orderby' => $order,
			'serial' => array('orderitems','orderaddress','orderpost','buy_comment','seller_comment')
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

	public function getStatisticsList()
    {
        $data = array();
        $sql = 'select * from `x2_config` where cfgapp=1 limit 1';
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r['0'];
    }
	public function modifyStatistics($id,$args)
	{
		if(!$args)return false;
		$data = array('config',$args,array(array('AND',"cfgapp = :cfgapp",'cfgapp',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function addStatistics($args)
	{
		return $this->db->insertElement(array('table' => 'config','query' => $args));
	}
    /**
     *  根据用户name查找order id
     */
	public function getUserByUserName($company_name)
    {
        $data = array(false,
                      array('user','orders'),
                      array(array('AND',"user.company_name = :company_name",'company_name',$company_name),array('AND','user.userid = orders.orderuserid')));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }
   /**
    * @action 导出excel
    * @param  array   $strTable  表格内容
    * @param  string  $filename  文件名
    * 备注:   参考建超导出功能
    */
    public function downloadExcel($strTable,$filename)
    {
        header("Content-type: application/vnd.ms-excel");
        header("Content-Type: application/force-download");
        header("Content-Disposition: attachment; filename=".$filename."_".date('Y-m-d').".xls");
        header('Expires:0');
        header('Pragma:public');
        echo '<html><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />'.$strTable.'</html>';
    }


}

?>