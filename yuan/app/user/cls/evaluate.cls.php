<?php

class evaluate_user
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->sql = $this->G->make('sql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
        $this->pdosql = $this->G->make('pdosql');
	}


    public function getEvaluateList($args,$page,$limit)
    {
        $data = array(
            'select' => array('evaluate.*','evaluate_category.class_type','evaluate_category.cate_name','evaluate_category.company_type'),
            'table' => array('evaluate','evaluate_category'),
            'query' => $args,
            'serial' => '',
            'orderby' => 'evaluate.id DESC'
        );
        $r = $this->db->listElements($page,$limit,$data);
        return $r;
    }


    /**
     * 根据id查询评价数据
     * @param $id
     * @return mixed
     */
    public function getEvaluateByid($id)
    {
        $data = array(false,array('evaluate','evaluate_category'),array(array('AND',"evaluate.id = :id",'id',$id),array('AND','evaluate.eval_cate_id = evaluate_category.id')));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    /**
     * 根据标段分类获取分类数据
     * @param $type
     * @return mixed
     */
    public function getCategoryByType($type)
    {
        $data = array();
        $sql = "SELECT * FROM `x2_evaluate_category` where `class_type` = '".$type."' LIMIT 10";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }


    /**
     * 根据供应商id获取针对他的评价数据
     * @param $userid
     * @return mixed
     */
    public function getEvaluateByUserid($userid)
    {
        $data = array();
        $sql = "SELECT * FROM `x2_evaluate` where `supplier_id` = '".$userid."'";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }


}

?>