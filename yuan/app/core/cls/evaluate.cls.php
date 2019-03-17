<?php

class evaluate_core
{
	public $G;
	public $session;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->sql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->ev = $this->G->make('ev');
		$this->session = $this->G->make('session');
	}

    /**
     * 物资类供应商评价方法
     * @param $args
     * @return mixed
     */
	public function insterGoodsEvaluate($args)
	{
		$data = array('evaluate',$args);
		$sql = $this->sql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

    /**
     * 根据关键字搜索供应商
     * @param $code
     * @return mixed
     */
    public function getCompanyByCode($code)
    {
        $data = array();
        $sql = "SELECT `userid`,`company_name` FROM `x2_user` where `company_name` LIKE '%". $code ."%' LIMIT 10";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }

    /**
     * 根据标段分类获取分类数据
     * @param $type
     * @return mixed
     */
    public function getCategoryByType($type)
    {
        $data = array();
        $sql = "SELECT * FROM `x2_evaluate_category` where `class_type` = '".$type."'";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }

    public function getEvaluateList($args)
    {
        $data = array(
            array('evaluate_category.company_type_name','evaluate_category.class_type_name','evaluate_category.cate_name','evaluate.contract_name','evaluate.supplier_name','evaluate.reserve1','evaluate.project_name','evaluate.reserve2','evaluate.reserve3','evaluate.reserve4','evaluate.reserve5','evaluate.reserve6','evaluate.reserve7','evaluate.total_score','evaluate.eval_level_name'),
            array('evaluate','evaluate_category'),
            $args
        );
        $sql = $this->sql->makeSelect($data);
        $r = $this->db->fetchALL($sql,false);
        return $r;
    }

}

?>
