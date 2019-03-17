<?php
/**
 * @Author: zhangjianchao
 * @Date:   2018-11-15 10:37:06
 * @Last Modified by:   Marte
 * @Last Modified time: 2018-11-19 17:02:10
 */
class pricerecord_purchase
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
    }

    /*
    * 物资报价的添加方法
    * $args   array 数据数组
    * return  bool   布尔值
    * @author  zhangjianchao
    * @data    2018-11-15
    *
    */
    public function addPriceRecord($args)
    {
        return $this->db->insertElement(array('table' => 'purchase_pricerecord','query' => $args));
    }


    /*
    * 报价物资修改
    * $id     int       数据主键id
    * $args   array     修改的数据
    * @author  zhangjianchao
    * @data    2018-11-15
    *
    */
    public function updatePurchase($id,$args){
        $data = array(
            'table' => 'purchase_pricerecord',
            'value' => $args,
            'query' => array(array('AND',"pricerecordid = :pricerecordid",'pricerecordid',$id))
        );
        return $this->db->updateElement($data);
    }



    /**
     * [pricerecordAllList 查询所有的物资列表]
     * @Author    张建超
     * @DateTime  2018-11-15
     * @param     [int]      $purchase_id [询价ID]
     * @return    [array]   [某条询价下的物资列表]
     */
    public function pricerecordAllList($purchase_id){
        $data = array();
        $sql = "SELECT * FROM `x2_purchase_material` where `purchase_new_id`=".$purchase_id;
        $data['sql'] = $sql;
        $data['v'] = array();
        $arr = $this->db->fetchAll($data,false);
        return $arr;

    }


    /**
     * [materialinfo 查询某条物的详细信息]
     * @Author    张建超
     * @DateTime  2018-11-15
     * @param     [int]      $materialid [物资ID]
     * @return    [array]   [某条询价下的物资详情]
     */
    public function materialinfo($materialid){
        $data = array();
        $sql = "SELECT * FROM `x2_purchase_material` where `id`=".$materialid;
        $data['sql'] = $sql;
        $data['v'] = array();
        $arr = $this->db->fetch($data,false);
        return $arr;

    }




    /**
     * [pricerecordAllList 查询所有的报价的详细列表]
     * @Author    张建超
     * @DateTime  2018-11-15
     * @param     [int]      $ppid [报价主键ID]
     * @return    [array]   [某条询价下的物资列表]
     */
    public function pricerecordAllList1($ppid){
        $data = array();
        $sql = "SELECT * FROM `x2_purchase_pricerecord` where `ppid`=".$ppid;
        $data['sql'] = $sql;
        $data['v'] = array();
        $arr = $this->db->fetchAll($data,false);
        return $arr;

    }


    /**
     * [countMaterial 某条询价信息下的物资总数]
     * @Author    张建超
     * @DateTime  2018-11-15
     * @param     [int]      $purchase_id [询价信息ID]
     * @return    [int]                   [总数]
     */
    public function countMaterial($purchase_id){
        $data = array();
        $sql = "SELECT * FROM `x2_purchase_material` where `purchase_new_id`=".$purchase_id;
        $data['sql'] = $sql;
        $data['v'] = array();
        $arr = $this->db->fetchAll($data,false);
        return count($arr);

    }


    public function getBaojia($purchase_id,$userid)
    {
        $data = array(false,'purchase_price',array(array('AND',"purchase_new_id = :purchase_new_id",'purchase_new_id',$purchase_id),array('AND',"supplier_id = :supplier_id",'supplier_id',$userid),array('AND',"del = 0")));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }



}