<?php
//---订单记录表-------
class record_item
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

	
	public function addRecord($args)
	{
		return $this->db->insertElement(array('table' => 'order_record','query' => $args));
	}

	public function modifyRecord($id,$args)
	{
		
		$data = array(
			'table' => 'order_record',
			'value' => $args,
			'query' => array(array('AND',"recordid = :recordid",'recordid',$id))
		);
		return $this->db->updateElement($data);
	}

	public function delRecord($id)
	{
		return $this->db->delElement(array('table' => 'order_record','query' => array(array("AND","recordid = :recordid",'recordid',$id))));
	}


	public function getRecordById($id)
	{
		$data = array(false,'order_record',array(array("AND","recordid = :recordid",'recordid',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
	}



	public function getRecordList($args,$page,$number = 10)
    {
        $data = array(
            'select' => false,
            'table' => 'order_record',
            'query' => $args,
            'serial' => '',
            'orderby' => 'addtime DESC'
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
	}












}

?>
