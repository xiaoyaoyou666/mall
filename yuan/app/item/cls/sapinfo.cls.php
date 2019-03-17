<?php

class sapinfo_item
{
	public $G;
  

	public function __construct(&$G)
	{
		$this->G = $G;
       
	}

	public function _init()
    {
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
        $this->module = $this->G->make('module');
        $this->session = $this->G->make('session');
    }

    

    /**
     * 新增sap采购订单数据
     * @param $args
     * @return mixed
     */
    public function addSapOrder($args)
    {
        return $this->db->insertElement(array('table' => 'sap_orderinfo','query' => $args));
    }

    /**
     * 获取所有的sap订单
     * @param $ordersn
     * @return $ordersapall
     */

    public function getSapOrderInfoAll($ordersn)
    {
        $data = array();
        $sql = "SELECT * FROM `x2_sap_orderinfo` WHERE `ordersn`='".$ordersn;
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data);
        return $r;
    }


    //根据物料编码取数据
    public function getSapByOrdersn($ordersn,$userid)
    {
        $data = array();
        $sql = 'SELECT * FROM `x2_sap_orderinfo` WHERE `ordersn`='.$ordersn.' AND `buyerid`='.$userid;
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }

    public function getSapOrderByArgs($args)
    {
        $data = array(false,array('sap_orderinfo'),$args,false,false,false);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql,'goodsid');
    }

}

?>
