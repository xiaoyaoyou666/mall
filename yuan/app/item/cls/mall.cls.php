<?php

class mall_item
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->sql = $this->G->make('sql');
		$this->db = $this->G->make('db');
		$this->ev = $this->G->make('ev');
		$this->files = $this->G->make('files');
	}

	public function getMallList($args,$page,$number = 20)
	{
		$data = array(
			'select' => false,
			'table' => 'mall',
			'query' => $args
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

	public function delMall($id)
	{
		return $this->db->delElement(array('table' => 'mall','query' => "mallid = '{$id}'"));
	}

	public function modifyMall($id,$args)
	{
		if(isset($args['mallmoduleid']))
		unset($args['mallmoduleid']);
		$data = array(
			'table' => 'mall',
			'value' => $args,
			'query' => "mallid = '{$id}'"
		);
		$this->db->updateElement($data);
		return $this->db->affectedRows();
	}

	public function addMall($args)
	{
		return $this->db->insertElement(array('table' => 'mall','query' => $args));
	}

	public function getMallById($id)
	{
		$data = array(false,'mall',"mallid = '{$id}'");
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getMallByArgs($args)
	{
		$data = array(false,'mall',$args);
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getAllMall()
	{
		$data = array(false,'mall',1);
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetchAll($sql,'mallid');
	}

	public function modifyMallById($id,$args)
	{
		$data = array('mall',$args,"mallid = '{$id}'");
		$sql = $this->sql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function getAllMallInArea()
	{
		$malls = $this->getAllMall();
		$m = array();
		foreach($malls as $mall)
		{
			$m[$mall['mallarea']][] = $mall;
		}
		return $m;
	}
}

?>
