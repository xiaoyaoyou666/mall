<?php


class content_company
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

	public function getContentList($args,$page,$number = 20,$order = 'purchasesequence DESC,contentinputtime DESC,contentid DESC')
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

	public function delContent($id)
	{
		return $this->db->delElement(array('table' => 'purchase','query' => array(array('AND',"purchaseid = :contentid",'purchaseid',$id))));
	}

	public function modifyContent($id,$args)
	{
		if(isset($args['purchasemoduleid']))
		unset($args['purchasemoduleid']);
		$data = array(
			'table' => 'purchase',
			'value' => $args,
			'query' => array(array('AND',"purchaseid = :contentid",'purchaseid',$id))
		);
		return $this->db->updateElement($data);
	}

	private function _getBasicContentById($id)
	{
		$data = array(false,'purchase',array(array('AND',"purchaseid = :contentid",'purchaseid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	private function _modifyBasicContentById($id,$args)
	{
		$data = array('purchase',$args,array(array('AND',"purchaseid = :contentid",'purchaseid',$id)));
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
		$data = array(false,'purchase',array(array('AND',"purchaseid = :contentid",'purchaseid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getNearContentById($id,$catid)
	{
		$r = array();
		$data = array(false,'purchase',array(array('AND',"purchaseid < :contentid",'purchaseid',$id),array('AND',"purchasecatid = :catid",'catid',$catid)),false,"purchaseid DESC",5);
		$sql = $this->pdosql->makeSelect($data);
		$r['pre'] = $this->db->fetchAll($sql);
		$data = array(false,'purchase',array(array('AND',"purchaseid > :contentid",'purchaseid',$id),array('AND',"purchasecatid = :catid",'catid',$catid)),false,"purchaseid ASC",5);
		$sql = $this->pdosql->makeSelect($data);
		$r['next'] = $this->db->fetchAll($sql);
		return $r;
	}

    /**
     * 用户中心-获取企业动态
     * @param $args
     * @param $page
     * @param int $number
     * @param string $order
     * @return mixed
     */
    public function getCompanyNewList($args,$page,$number = 20,$order = 'news_id DESC')
    {
        $data = array(
            'select' => false,
            'table' => 'company_news',
            'query' => $args,
            'orderby' => $order
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    /**
     * 添加企业动态
     * @param $args
     * @return mixed
     */
    public function addNews($args)
    {
        return $this->db->insertElement(array('table' => 'company_news','query' => $args));
    }

    /**
     * 根据id获取企业动态详情
     * @param $id
     * @return mixed
     */
    public function getNewsById($id)
    {
        $data = array(false,'company_news',array(array('AND',"news_id = :news_id",'news_id',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    /**
     * 修改企业动态
     * @param $args
     * @return mixed
     */
    public function modifyNews($args)
    {
        $data = array(
            'table' => 'company_news',
            'value' => $args,
            'query' => array(array('AND',"news_id = :news_id",'news_id',$args['news_id']))
        );
        return $this->db->updateElement($data);
    }

    /**
     * 删除企业动态
     * @param $id
     * @return mixed
     */
    public function delNews($id)
    {
        return $this->db->delElement(array('table' => 'company_news','query' => array(array('AND',"news_id = :news_id",'news_id',$id))));
    }

    /**
     * 根据企业id获取企业信息
     * @param $id
     * @return mixed
     */
    public function getCompanyById($id)
    {
        $data = array(false,'user',array(array('AND',"userid = :userid",'userid',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }
    /**
     * 根据企业id获取第二联系人
     * @param $id
     * @return mixed
     */
    public function getUserContactsById($id)
    {
        $data = array(false,'user_contacts',array(array('AND',"user_id = :user_id",'user_id',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }
    /**
     * 根据企业id获取企业证书信息信息
     * @param $id
     * @return mixed
     */
    public function getCertificateById($id)
    {
        $data = array(false,'user_certificate',array(array('AND',"user_id = :user_id",'user_id',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchALL($sql);
    }
    /**
     * 根据user_id获取供货范围
     * @param $id
     * @return mixed
     */
    public function getUserCategoryByUserId($id)
    {
        $data = array(false,'user_category',array(array('AND',"user_id = :user_id",'user_id',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchALL($sql);
    }
    /**
     * 合同模板信息 - zhy
     */
    public function getContractTemplate()
    {
        $sql = 'SELECT * FROM `x2_contract_template`';
        $data['sql'] = $sql;
        $date['v'] = array();
        $contract = $this->db->fetchAll($data,false);
        foreach ($contract as $k=>$v){
            $con[$v['kind']][$v['type']][] = $v;
        }
        return $con;
    }
    /**
     * 编辑公司简介/主营业务/联系我们
     * @param $args
     * @return mixed
    */
    public function modifyCompanyIntro($args)
    {
        $data = array(
            'table' => 'user',
            'value' => $args,
            'query' => array(array('AND',"userid = :userid",'userid',$args['userid']))
        );
        return $this->db->updateElement($data);
    }
    /**
     * 更新第二联系人信息
     * @param $args
     * @return mixed
     */
    public function modifyUserContactsIntro($args,$userid)
    {
        $data = array(
            'table' => 'user_contacts',
            'value' => $args,
            'query' => array(array('AND',"user_id = :user_id",'user_id',$userid))
        );
        return $this->db->updateElement($data);
    }

    /**
     * 删除供货范围
     * @param $id
     * @return mixed
     */
    public function delUserCategory($id)
    {
        return $this->db->delElement(array('table' => 'user_category','query' => array(array('AND',"user_id = :user_id",'user_id',$id))));
    }

    /**
     * 添加荣誉资质
     * @param $args
     * @return mixed
     */
    public function addHonour($args)
    {
        return $this->db->insertElement(array('table' => 'company_honor','query' => $args));
    }


    public function getHonorsById($args,$order = 'company_id DESC')
    {
        $data = array(
            'select' => false,
            'table' => 'company_honor',
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements(1,50,$data);
        return $r;
    }

    /**
     * 删除荣誉资质
     * @param $id
     * @return mixed
     */
    public function delHonor($id)
    {
        return $this->db->delElement(array('table' => 'company_honor','query' => array(array('AND',"honor_id = :honor_id",'honor_id',$id))));
    }

    /**
     * 添加案例
     * @param $args
     * @return mixed
     */
    public function addCase($args)
    {
        return $this->db->insertElement(array('table' => 'company_case','query' => $args));
    }
    /**
     * 删除案例
     * @param $id
     * @return mixed
     */
    public function delcase($id)
    {
        return $this->db->delElement(array('table' => 'company_case','query' => array(array('AND',"case_id = :case_id",'case_id',$id))));
    }

    public function getCompanyCaseList($args,$page,$number = 20,$order = 'case_id DESC')
    {
        $data = array(
            'select' => false,
            'table' => 'company_case',
            'query' => $args,
            'orderby' => $order
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    public function getCaseById($id)
    {
        $data = array(false,'company_case',array(array('AND',"case_id = :case_id",'case_id',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    public function modifyCase($args)
    {
        $data = array(
            'table' => 'company_case',
            'value' => $args,
            'query' => array(array('AND',"case_id = :case_id",'case_id',$args['case_id']))
        );
        return $this->db->updateElement($data);
    }

}

?>
