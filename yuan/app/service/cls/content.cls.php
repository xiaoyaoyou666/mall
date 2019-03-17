<?php


class content_purchase
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->categories = NULL;
		$this->tidycategories = NULL;
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
		$this->module = $this->G->make('module');
		$this->user = $this->G->make('user','user');
	}

	public function getContentList($args,$page,$number = 20,$order = 'purchasesequence DESC,contentinputtime DESC,contentid DESC')
	{
		$data = array(
			'select' => false,
			'table' => 'purchase',
			'query' => $args,
			'orderby' => $order
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

	public function delContent($id)
	{
		return $this->db->delElement(array('table' => 'purchase','query' => array(array('AND',"purchaseid = :contentid",'purchaseid',$id))));
	}

	public function modifyContent($id,$args)
	{
		if(isset($args['purchasemoduleid']))
		unset($args['purchasemoduleid']);
		$data = array(
			'table' => 'purchase',
			'value' => $args,
			'query' => array(array('AND',"purchaseid = :contentid",'purchaseid',$id))
		);
		return $this->db->updateElement($data);
	}

	public function addContent($args)
	{
		return $this->db->insertElement(array('table' => 'purchase','query' => $args));
	}

	private function _getBasicContentById($id)
	{
		$data = array(false,'purchase',array(array('AND',"purchaseid = :contentid",'purchaseid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	private function _modifyBasicContentById($id,$args)
	{
		$data = array('purchase',$args,array(array('AND',"purchaseid = :contentid",'purchaseid',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function modifyBasciContent($id,$args)
	{
		$this->_modifyBasicContentById($id,$args);
	}

	public function getBasicContentById($id)
	{
		return $this->_getBasicContentById($id);
	}

	public function getContentById($id)
	{
		$data = array(false,'purchase',array(array('AND',"purchaseid = :contentid",'purchaseid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getNearContentById($id,$catid)
	{
		$r = array();
		$data = array(false,'purchase',array(array('AND',"purchaseid < :contentid",'purchaseid',$id),array('AND',"purchasecatid = :catid",'catid',$catid)),false,"purchaseid DESC",5);
		$sql = $this->pdosql->makeSelect($data);
		$r['pre'] = $this->db->fetchAll($sql);
		$data = array(false,'purchase',array(array('AND',"purchaseid > :contentid",'purchaseid',$id),array('AND',"purchasecatid = :catid",'catid',$catid)),false,"purchaseid ASC",5);
		$sql = $this->pdosql->makeSelect($data);
		$r['next'] = $this->db->fetchAll($sql);
		return $r;
	}
}

?>
