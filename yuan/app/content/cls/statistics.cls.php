<?php

class statistics_content
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->statistics = NULL;
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->tpl = $this->G->make('tpl');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
	}

	
	
	public function modifyStatistics($id,$args)
	{
		if(!$args)return false;
		$data = array('statistics',$args,array(array('AND',"statisticsid = :statisticsid",'statisticsid',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function addStatistics($args)
	{
		return $this->db->insertElement(array('table' => 'statistics','query' => $args));
	}

	public function getStatisticsList()
	{
		$data = array();
		$sql = 'select * from `x2_statistics` where statisticsid=1 limit 1';
	    $data['sql'] = $sql;
	    $data['v'] = array();
	    $r = $this->db->fetchALL($data,false);
	    return $r['0'];
	}

}

?>
