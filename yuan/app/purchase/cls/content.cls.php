<?php


class content_purchase
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->categories = NULL;
		$this->tidycategories = NULL;
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
		$this->module = $this->G->make('module');
		$this->user = $this->G->make('user','user');
	}

	public function getContentList($args,$page,$number = 20,$order = 'purchasesequence DESC,purchaseinputtime DESC,purchaseid DESC')
	{
		$data = array(
			'select' => false,
			'table' => 'purchase',
			'query' => $args,
			'orderby' => $order
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}
	/**
	 * [getPurchaseList description]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-10-29
	 * @version  [version]
	 * @param    {string}
	 * @param    {array}
	 * @param    {int}
	 * @returns  {array}
	 * @return   [type]        [description]
	 */
	public function getPurchaseList($args,$page,$number = 20,$order = 'create_time DESC'){

		$data = array(
			'select' => false,
			'table' => 'purchase_new',
			'query' => $args,
			'orderby' => $order
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;

	}

	//获取采购信息草稿数据
    public function getDraftContentList($args,$page,$number = 20,$order = 'purchasesequence DESC,purchaseinputtime DESC,purchaseid DESC')
    {
        $data = array(
            'select' => false,
            'table' => 'purchase_draft',
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

	public function getContentListUser()
	{

		$data = array('count(*) as number,purchaseuserid','purchase',1,"purchaseuserid","number desc",array(0,10));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql);
	}

	public function getContentListUser1()
	{
	    $data = array();
		$sql = 'select u.company_name,u.userid,count(p.purchaseid) as num from `x2_user` u,`x2_purchase` p where u.userid=p.purchaseuserid group by p.purchaseuserid order by num desc limit 5';


	    $data['sql'] = $sql;
	    $data['v'] = array();
	    $r = $this->db->fetchALL($data,false);
	    return $r;
	}

	public function delContent($id)
	{
		return $this->db->delElement(array('table' => 'purchase','query' => array(array('AND',"purchaseid = :purchaseid",'purchaseid',$id))));
	}
	//采购信息删除操作
    public function delDraftContent($id)
    {
        return $this->db->delElement(array('table' => 'purchase_draft','query' => array(array('AND',"draftid = :draftid",'draftid',$id))));
    }
	public function modifyContent($id,$args)
	{
		if(isset($args['purchasemoduleid']))
		unset($args['purchasemoduleid']);
		$data = array(
			'table' => 'purchase',
			'value' => $args,
			'query' => array(array('AND',"purchaseid = :purchaseid",'purchaseid',$id))
		);
		return $this->db->updateElement($data);
	}
	//更新草稿表信息
    public function modifyDraftContent($id,$args)
    {
        if(isset($args['purchasemoduleid']))
            unset($args['purchasemoduleid']);
        $data = array(
            'table' => 'purchase_draft',
            'value' => $args,
            'query' => array(array('AND',"draftid = :draftid",'draftid',$id))
        );
        return $this->db->updateElement($data);
    }


    //修改询价
    public function updatePurchase($id,$args){
    	if(isset($args['purchasemoduleid']))
            unset($args['purchasemoduleid']);
        $data = array(
            'table' => 'purchase_new',
            'value' => $args,
            'query' => array(array('AND',"id = :id",'id',$id))
        );
        return $this->db->updateElement($data);
    }

    //添加采购信息
	public function addContent($args)
	{
		return $this->db->insertElement(array('table' => 'purchase','query' => $args));
	}
	//添加采购信息草稿
    public function addDraftContent($args)
    {
        return $this->db->insertElement(array('table' => 'purchase_draft','query' => $args));
    }
    //添加询价发布信息
    public function addXunjiaContent($args)
    {
        return $this->db->insertElement(array('table' => 'purchase_new','query' => $args));
    }
    //添加询价发布邀请的供应商表
    public function addXunjiaUserContent($args)
    {
        return $this->db->insertElement(array('table' => 'purchase_invitation','query' => $args));
    }
    //添加采购信息数据到采购数据表
    public function addMaterialContent($args)
    {
        return $this->db->insertElement(array('table' => 'purchase_material','query' => $args));
    }

    /**
     * 批量添加采购物资到采购物资数据表
     * @param $args
     * @param $purchase_new_id
     * @return mixed
     */
    public function batchAddMaterialContent($args,$purchase_new_id)
    {
        $sql = 'INSERT INTO `x2_purchase_material` (`purchase_new_id`,`material_title`,`material_norms`,`material_num`,`material_unit`,`xiangmuDanwei`,`material_explain`)
                 VALUES ';
        $value = '';
        foreach($args as $key => $val)
        {
            $value .= "('".$purchase_new_id."','".$val['material_title']."','".$val['material_norms']."','".$val['material_num']."','".$val['material_unit']."','".$val['xiangmuDanwei']."','".$val['material_explain']."'),";
        }
        $value = substr($value, 0, -1);
        $sql = $sql.$value;
        $data['sql'] = $sql;
        $data['v'] = array();
        $this->db->exec($data);
        return $this->db->lastInsertId();
    }

    //添加询价发布信息草稿
    public function addDraftXunjiaContent($args)
    {
        return $this->db->insertElement(array('table' => 'purchase_new_draft','query' => $args));
    }
    //更新询价发布草稿表信息
    public function modifyDraftXunjiaContent($id,$args)
    {
        $data = array(
            'table' => 'purchase_new_draft',
            'value' => $args,
            'query' => array(array('AND',"id = :id",'id',$id))
        );
        return $this->db->updateElement($data);
    }
    //搜索供应商
    public function getCompanyByCode($args,$page,$number = 100,$order = 'user.userid ASC',$group='userid'){
        $args[] = array("AND","user.userid = user_category.user_id");
        $data = array(
            'select' => false,
            'table' => array('user','user_category'),
            'query' => $args,
            'orderby' => $order,
			'groupby' =>$group
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }
    //搜索供应商
    public function getCompanyByCode2($args,$page,$number = 100,$order = 'userid ASC'){
        $data = array(
            'select' => false,
            'table' => 'user',
            'query' => $args,
            'orderby' => $order,
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }
    //获取ID 询比价草稿信息
    public function getDraftXunjiaContentById($id)
    {
        $data = array(false,'purchase_new_draft',array(array('AND',"id = :id",'id',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }
    //获取采购物资信息
    public function getMaterialContent($id)
    {
        $data = array(false,'purchase_material',array(array('AND',"purchase_new_id = :purchase_new_id",'purchase_new_id',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql);
    }
    //获取ID 询价数据
    public function getXunjiaContentById($id)
    {
        $data = array(false,'purchase_new',array(array('AND',"id = :id",'id',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }
    //获取询价发布信息
    public function getPurchaseNewDraftList($args,$page,$number = 20,$order = 'id DESC')
    {
        $data = array(
            'select' => false,
            'table' => 'purchase_new_draft',
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }
    //询价发布草稿记录删除
    public function delPurchaseNewDraftContent($id)
    {
        return $this->db->delElement(array('table' => 'purchase_new_draft','query' => array(array('AND',"id = :id",'id',$id))));
    }
    //采购物资记录删除
    public function delMaterialContent($id)
    {
        return $this->db->delElement(array('table' => 'purchase_material','query' => array(array('AND',"purchase_new_id = :purchase_new_id",'purchase_new_id',$id))));
    }
    public function getPurchaseNewContent($args,$page,$number = 20,$order = 'id DESC,status ASC')
    {
        $data = array(
            'select' => false,
            'table' => 'purchase_new',
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }
	private function _getBasicContentById($id)
	{
		$data = array(false,'purchase',array(array('AND',"purchaseid = :purchaseid",'purchaseid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'purchase_items');
	}

	private function _modifyBasicContentById($id,$args)
	{
		$data = array('purchase',$args,array(array('AND',"purchaseid = :purchaseid",'purchaseid',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function modifyBasciContent($id,$args)
	{
		$this->_modifyBasicContentById($id,$args);
	}

	public function getBasicContentById($id)
	{
		return $this->_getBasicContentById($id);
	}

	public function getContentById($id)
	{
		$data = array(false,'purchase',array(array('AND',"purchaseid = :purchaseid",'purchaseid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'purchase_items');
	}
	//根据草稿ID获取草稿信息
    public function getDraftContentById($id)
    {
        $data = array(false,'purchase_draft',array(array('AND',"draftid = :draftid",'draftid',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql,'purchase_items');
    }
	//根据采购标题和purchaseid信息查询草稿表中是否存在 存在返回true 不存在返回false
    public function draftContentByTitleAndPid($title,$purchaseid)
    {
        $data = array(false,'purchase_draft',array(array('AND',"purchaseid = :purchaseid",'purchaseid',$purchaseid),array('AND',"purchasetitle = :purchasetitle",'purchasetitle',$title)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql,'purchase_items');
    }
	public function getNearContentById($id,$catid)
	{
		$r = array();
		$data = array(false,'purchase',array(array('AND',"purchaseid < :purchaseid",'purchaseid',$id),array('AND',"purchasecatid = :catid",'catid',$catid)),false,"purchaseid DESC",5);
		$sql = $this->pdosql->makeSelect($data);
		$r['pre'] = $this->db->fetchAll($sql);
		$data = array(false,'purchase',array(array('AND',"purchaseid > :purchaseid",'purchaseid',$id),array('AND',"purchasecatid = :catid",'catid',$catid)),false,"purchaseid ASC",5);
		$sql = $this->pdosql->makeSelect($data);
		$r['next'] = $this->db->fetchAll($sql);
		return $r;
	}

	//返回用户询价发布的数量
	public function getPurchseNumber($id)
	{
        $data = array('count(*) as number','purchase_price',array(array('AND',"purchase_new_id = :purchase_new_id",'purchase_new_id',$id),array('AND',"del = :del",'del',0)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r['number'];
	}

	//返回用户发布的数量
	public function getNumber($purchaseuserid)
	{
        $data = array('count(*) as number','purchase',array(array('AND',"purchaseuserid = :purchaseuserid",'purchaseuserid',$purchaseuserid),array("AND","purchasestatus != :purchasestatus",'purchasestatus',2)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r['number'];
	}

	//合作要求的资本
	public function getNumberMoney($purchaseid)
	{
        $data = array(false,'purchase',array(array('AND',"purchaseid = :purchaseid",'purchaseid',$purchaseid)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r;
	}

	//采购信息条数【总数】 istody为false查总数 否则查今日新增数
	public function zcount($istody=false)
	{
        $firttime = strtotime(date("Y-m-d 00:00:01"));
        $endtime =  strtotime(date("Y-m-d 23:59:59"));
		$data = array();
		if($istody){
            $sql = 'SELECT count(*) as aa FROM `x2_purchase` where  purchaseinputtime >='.$firttime.' and purchaseinputtime <='. $endtime;
		}else{
            $sql = 'SELECT count(*) as aa FROM `x2_purchase` ';
		}
		$data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        if($r['0']['aa']==null){
            return 0;
		}else{
            return $r['0']['aa'];
		}

	}


    /**
     * 后台管理--询价管理（与user表连接查询）
     * @param $args
     * @param $page
     * @param int $number
     * @param string $order
     * @return mixed
     */
    public function getPurchaseListJoin($args,$page,$number = 20,$order = 'create_time DESC'){

        $data = array(
            'select' => false,
            'table' => array('purchase_new','user'),
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;

    }
    /**
	 * 询价公告数据查询
	 * @author zhuhongyu
	 */
    public function getNoticeInfo($args,$page,$number = 20,$order = 'purchase_new.id DESC'){
        $args[] = array("AND","purchase_new.id = purchase_invitation.purchase_new_id");
        $data = array(
            'select' => false,
            'table' => array('purchase_new','purchase_invitation'),
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
	}

}

?>
