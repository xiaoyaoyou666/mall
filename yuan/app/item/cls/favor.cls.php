<?php
/*
 * Created on 2011-11-21
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 * 对地区进行操作
 */
class favor_item
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
        $this->session = $this->G->make('session');
        $this->item = $this->G->make('item','item');
        $this->user = $this->G->make('user','user');
        $this->_user = $this->session->getSessionUser();
	}

	//通过用户ID获取收藏商品列表
	//参数：当前页码，单页显示数量，查询参数（数组或字符串）
	//返回值：商品列表数组
	public function getFavorListByUserid($page,$number = 20,$args = array(),$type = 0)
	{
        $page = $page > 0?$page:1;
        $r = array();
        $data = array(
            'select' => false,
            'table' => array('favor','goods'),
            'query' => $args

        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
	}

	//收藏商品
	//参数：商品ID，用户ID，考试ID
	//返回值：商品收藏后的插入ID
	public function favorItem($itemid,$userid)
	{
        $args = array("favorgoodsid" => $itemid,"favoruserid" => $userid,"favortime" => TIME );
		$data = array("favor",$args);
		$sql = $this->sql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//根据ID获取商品是否收藏
	//本函数暂不用
	public function getFavorById($id)
	{
		$data = array(false,'favor',"favorid = '{$id}'");
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql,'favorquestion');
	}

	//根据用户ID和商品ID获取商品是否收藏
	//参数：商品ID，用户ID
	//返回值：商品信息数组（无则为FALSE）
	public function getFavorByQuestionAndUserId($id,$userid)
	{
        $data = array(false,'favor',array(array("AND","favorgoodsid = :favorgoodsid",'favorgoodsid',$id),array("AND","favoruserid = :favoruserid",'favoruserid',$userid)));
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql,'favorquestion');
	}

	//根据ID删除商品
	public function delFavorById($id,$userid)
	{
        $data = array("favor",array(array("AND","favorgoodsid = :favorgoodsid",'favorgoodsid',$id),array("AND","favoruserid = :favoruserid","favoruserid",$userid)));
        $sql = $this->sql->makeDelete($data);
		$this->db->exec($sql);
		return true;
	}
    //根据用户查看一共有多少个收藏
    public function getFavorNum($userid)
    {

        $data = array("COUNT(*) AS number",'favor',array(array("AND","favoruserid = :favoruserid",'favoruserid',$userid)));
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql);
    }
}

?>
