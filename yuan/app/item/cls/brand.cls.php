<?php

class brand_item
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->sql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->ev = $this->G->make('ev');
		$this->files = $this->G->make('files');
	}

	public function getBrandList($args,$page,$number = 20)
	{
		$data = array(
			'select' => false,
			'table' => 'brand',
			'index' => 'brandid',
			'query' => $args,
			'orderby' => "brandid asc"
		);
		return $this->db->listElements($page,$number,$data);
	}

	public function delBrand($id)
	{
		return $this->db->delElement(array('table' => 'brand','query' => array(array("AND","brandid = :brandid",'brandid',$id))));
	}

	public function modifyBrand($id,$args)
	{
		$data = array(
			'table' => 'brand',
			'value' => $args,
			'query' => array(array("AND","brandid = :brandid",'brandid',$id))
		);
		return $this->db->updateElement($data);
	}

	public function addBrand($args)
	{
		return $this->db->insertElement(array('table' => 'brand','query' => $args));
	}

	public function getBrandById($id)
	{
		$data = array(false,'brand',array(array("AND","brandid = :brandid",'brandid',$id)));
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getBrandByArgs($args)
	{
		$data = array(false,'brand',$args);
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getAllBrand()
	{
		$data = array(false,'brand',1);
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetchAll($sql,'brandid');
	}

	public function modifyBrandById($id,$args)
	{
		$data = array('brand',$args,array(array("AND","brandid = :brandid",'brandid',$id)));
		$sql = $this->sql->makeUpdate($data);
		return $this->db->exec($sql);
	}
}

?>
