<?php

class link_content
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

	
	public function addLink($args)
	{
		return $this->db->insertElement(array('table' => 'link','query' => $args));
	}

	public function modifyLink($id,$args)
	{
		
		$data = array(
			'table' => 'link',
			'value' => $args,
			'query' => array(array('AND',"linkid = :linkid",'linkid',$id))
		);
		return $this->db->updateElement($data);
	}

	public function delLink($id)
	{
		return $this->db->delElement(array('table' => 'link','query' => array(array("AND","linkid = :linkid",'linkid',$id))));
	}


	public function getLinkById($id)
	{
		$data = array(false,'link',array(array("AND","linkid = :linkid",'linkid',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
	}



	public function getLinkList($args,$page,$number = 10)
    {
        $data = array(
            'select' => false,
            'table' => 'link',
            'query' => $args,
            'serial' => '',
            'orderby' => 'addtime DESC'
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
	}












}

?>
