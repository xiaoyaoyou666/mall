<?php

class prize_item
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

    public function getPrizeById($id)
    {
	   $data = array(false,'prize', array(array("AND","id = :id",'id',$id)));
       $sql = $this->sql->makeSelect($data);
       return $this->db->fetch($sql);
    }

   


    public function addPrize($args)
    {
        return $this->db->insertElement(array('table' => 'prize','query' => $args));
    }

    public function modifyPrize($id,$args)
    {
        $data = array(
            'table' => 'prize',
            'value' => $args,
            'query' => array(array("AND","id = :id",'id',$id))
        );
        return $this->db->updateElement($data);
    }

    public function delPrize($id)
    {
        return $this->db->delElement(array('table' => 'Prize','query' => array(array("AND","id = :id",'id',$id))));
    }

    public function listPrize($args,$page,$number = 10,$order = "id desc")
    {
        //$args[] = array("AND","goodsminprice > 0");
        $data = array(
            'select' => false,
            'table' => 'prize',
            'query' => $args,
            'orderby' => $order
       
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }


    //兑换的也一并写道prize里了
    public function addExchangeInfo($args)
    {
        return $this->db->insertElement(array('table' => 'exchangehistory','query' => $args));
    }

    public function listExchangeRecord($args,$page,$number = 10,$order = "id desc")
    {
        $data = array(
            'select' => false,
            'table' => 'exchangehistory',
            'query' => $args,
            'orderby' => $order

        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    public function modifyExchangeStatus($id,$args)
    {
        $data = array(
            'table' => 'exchangehistory',
            'value' => $args,
            'query' => array(array("AND","id = :id",'id',$id))
        );
        return $this->db->updateElement($data);
    }

}

?>