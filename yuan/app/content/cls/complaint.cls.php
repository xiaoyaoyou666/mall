<?php


class complaint_content
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->complaint = NULL;
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->tpl = $this->G->make('tpl');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
    }

//投诉内容
    public function getcomplaintList($args,$page,$number = 10)
    {
        $data = array(
            'select' => false,
            'table' => 'complaint',
            'query' => $args,
            'serial' => '',
            'orderby' => 'create_time DESC'
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }





}