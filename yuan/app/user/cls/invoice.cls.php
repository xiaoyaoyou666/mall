<?php
//---发票记录表-------
class invoice_user
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

	
	public function addInvoice($args)
	{
		return $this->db->insertElement(array('table' => 'invoice','query' => $args));
	}

	public function modifyInvoice($id,$args)
	{
		
		$data = array(
			'table' => 'invoice',
			'value' => $args,
			'query' => array(array('AND',"invoiceid = :invoiceid",'invoiceid',$id))
		);
		return $this->db->updateElement($data);
	}

	public function delInvoice($id)
	{
		return $this->db->delElement(array('table' => 'invoice','query' => array(array("AND","invoiceid = :invoiceid",'invoiceid',$id))));
	}

	/**
     * 根据发票ID查询出发票信息
     * @param  $id         发票ID
     * @return 发票的信息
     */
	public function getInvoiceById($id)
	{
		$data = array(false,'invoice',array(array("AND","invoiceid = :invoiceid",'invoiceid',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
	}

	/**
     * 根据订单号查询出发票信息
     * @param  $ordersn      订单号
     * @return 发票的信息
     */
	public function getInvoiceBySn($ordersn)
	{
		$data = array(false,'invoice',array(array("AND","invoiceid = :invoiceid",'invoiceid',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
	}

	public function getInvoiceList($args,$page,$number = 10)
    {
        $data = array(
            'select' => false,
            'table' => 'invoice',
            'query' => $args,
            'serial' => '',
            'orderby' => 'addtime DESC'
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
	}

    /**
     * 根据用户ID查询出发票信息
     * @param  $userid
     * @return 发票的信息
     */
    public function getInvoiceByUserid($userid)
    {
        $data = array(false,'invoice',array(array("AND","userid = ".$userid)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }












}

?>
