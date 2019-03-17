<?php
class address_user{
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
        $this->session = $this->G->make('session');
        $this->pg = $this->G->make('pg');
        $this->user = $this->G->make('user','office');
    }

    public function addAddressInfo($args)
    {

        return $this->db->insertElement(array('table' => 'address','query' => $args));
    }

    public function getAddressInfoList($page,$userid,$number = 20)
    {
        $args = array(array('AND','userid = :userid','userid',$userid),array("AND","address.provinceid = province.provinceid"),array("AND","address.cityid = city.cityid"),array("AND","address.areaid = cityarea.areaid"));
        $data = array(
            'select' => false,
            'table' => array('address','city','cityarea','province'),
            'query' => $args,
            //'groupby' => "receiver",
            'orderby' => "address.addressid DESC"
        );
        return $this->db->listElements($page,$number,$data);
    }

    //删除收货地址信息
    public function delAddressInfo($addressid,$userid)
    {
        $data = array("address",array(array("AND","addressid = :addressid",'addressid',$addressid),array("AND","userid = :userid","userid",$userid)));
        $sql = $this->sql->makeDelete($data);
        $this->db->exec($sql);
        return true;
    }
    //更改信息
    public function modifyAddressInfo($addressid,$userid,$args)
    {
        $data = array(
            'table' => 'address',
            'value' => $args,
            'query' => array(array('AND',"addressid = :addressid",'addressid',$addressid),array("AND","userid = :userid",'userid',$userid)),

        );
        return $this->db->updateElement($data);
    }
    public function getAddressInfoById($addressid)
    {
        $args = array(array('AND','addressid = :addressid','addressid',$addressid),array("AND","address.provinceid = province.provinceid"),array("AND","address.cityid = city.cityid"),array("AND","address.areaid = cityarea.areaid"));
        $data = array(false,array('address','city','cityarea','province'),$args);
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    public function getProvinceById($id)
    {
        $data = array(false,'province',array(array("AND","provinceid = :provinceid",'provinceid',$id)));
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql);
    }
    public function getAreaById($id)
    {
        $data = array(false,'cityarea',array(array("AND","areaid = :areaid",'areaid',$id)));
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    public function getCityById($id)
    {
        $data = array(false,'city',array(array("AND","cityid = :cityid",'cityid',$id)));
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql);
    }
    public function getAddressByUserId($userid)
    {
        $data = array(false,'address',array(array("AND","userid = :userid",'userid',$userid)));
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    //ios 接口所需
    public function getAddressIdByName($province,$city,$area,$page,$number=20)
    {
        $args = array(array("AND","province = :province","province",$province),array("AND","city = :city","city",$city),array("AND","area = :area","area",$area));
        $data = array(
            'select' => false,
            'table' => array('province','city','cityarea'),
            'query' => $args
        );
        return $this->db->listElements($page,$number,$data);
    }

    public function getAddressNameByids($provinceid,$cityid,$areaid,$page = 1,$number = 20)
    {
        $args = array(array("AND","provinceid = :provinceid","provinceid",$provinceid),array("AND","cityid = :cityid","cityid",$cityid),array("AND","areaid = :areaid","areaid",$areaid));
        $data = array(
            'select' => false,
            'table' => array('province','city','cityarea'),
            'query' => $args
        );
        return $this->db->listElements($page,$number,$data);
    }

}