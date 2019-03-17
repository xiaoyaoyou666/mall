<?php
/**
 * 合同协议类
 */
class agreement_agreement
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
        #协议表字段说明
        $this->column = array(
            'salerid' => '甲方', 'agreement_number' => '协议编号', 'payment_code' => '付款条码', 'file' => '合同文件',
            'filename' => '协议名称', 'starttime' => '有效期开始时间', 'endtime' => '有效期结束时间'
        );
	}


	/**
	 * [addAgreement 添加方法]
	 * @Author    Zhangjianchao
	 * @DateTime  2018-08-13
	 * @param     $args  {array} 需要添加表的数据
	 * @returns   {array}   bool 返回true或者false      
	 */
	public function addAgreement($args)
	{
		return $this->db->insertElement(array('table' => 'agreement','query' => $args));
	}


	/**
	 * [modifyAgreement 修改方法]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [int]       $id     [主键ID]
	 * @param    [array]     $args [修改数据]
	 * @return   [bool]       [true or false]
	 */
	public function modifyAgreement($id,$args)
	{
		
		$data = array(
			'table' => 'agreement',
			'value' => $args,
			'query' => array(array('AND',"agreementid = :agreementid",'agreementid',$id))
		);
		return $this->db->updateElement($data);
	}

	/**
	 * [delAgreement 根据ID删除一条数据]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [int]        $id  [主键ID]
	 * @return   [bool]            [true or false]
	 */
	public function delAgreement($id)
	{
		return $this->db->delElement(array('table' => 'agreement','query' => array(array("AND","agreementid = :agreementid",'agreementid',$id))));
	}

	/**
	 * [getAgreementById 根据ID查询详细信息]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [int]        $id  [主键ID]
	 * @return   [bool]            [true or false]
	 */
	public function getAgreementById($id)
	{
		$data = array(false,'agreement',array(array("AND","agreementid = :agreementid",'agreementid',$id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
	}


	/**
	 * [getAgreementList 协议列表方法]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [array]         $args   [查询条件]
	 * @param    [int]           $page   [当前页码]
	 * @param    [int]       $number [当前页的数量]
	 * @return   [type]                [description]
	 */
	public function getAgreementList($args,$page,$number = 10)
    {
        $data = array(
            'select' => false,
            'table' => 'agreement',
            'query' => $args,
            'serial' => '',
            'orderby' => 'addtime DESC'
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
	}

	/**
	 * [getAgreementByUserid 根据用户ID查询用户是存在协议]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [int]   $userid        用户ID
	 * @return   [bool]  true or false  结果  
	 */
	public function getAgreementByUserid($userid){
		$data = array(false,'agreement',array(array("AND","userid = :userid",'userid',$userid)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);

	}

	/**
	 * [getAgreementListByCompanycode 根据公司的编码查询多有的合同ID]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-14
	 * @param     [int]   $salerid   公司编码
	 * @return   [array]              [结果集]
	 */
	public function getAgreementListByCompanycode($args){

		$data = array(false,'agreement',$args);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql);

	}

	/**
	 * [getAgreementListAll 展示出所有的协议列表]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-15
	 * @param    {array}  $args   搜索条件
	 * @return   [array]  reslut  [结果集]
	 */
	public function getAgreementListAll($args){
		$data = array(false,'agreement',$args);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql);
	}


    /**
     * 添加协议商品
     * @param $args
     * @return mixed
     */
    public function addAgreementGoods($args)
    {
        return $this->db->insertElement(array('table' => 'agreement_goods','query' => $args));
    }


    /**
     * 根据协议id删除协议商品
     * @param $Agreementid
     * @return mixed
     */
    public function delAgreementGoodsByAgreementId($Agreementid)
    {
        return $this->db->delElement(array('table' => 'agreement_goods','query' => array(array("AND","agreementid = :agreementid",'agreementid',$Agreementid))));
    }

    /**
     * [getAgreementNums 获取条件下的协议数量]
     * @Author   Zhangjianchao
     * @param    {array}  $args   搜索条件
     * @DateTime 2018-08-21
     * @return   [int]              [协议数量]
     */
    public function getAgreementNums($args){
    	$data = array(false,'apply',$args);
        $sql = $this->pdosql->makeSelect($data);
        return count($this->db->fetchAll($sql));
    }


    /**
     * 协议操作日志
     * @param $agreementid
     * @param $userid
     * @param $type 1新增，2删除，3修改，4生效，5失效，defaule不通过
     * @param array $data
     * @return mixed
     */
    public function addLog($agreementid, $userid, $type, $data=array())
    {
        $args = array(
            'userid' => $userid,
            'agreementid' => $agreementid,
            'addtime' => time(),
        );
        switch ($type)
        {
            case 1:
                $args['operation'] = '新增';
                break;
            case 2:
                $args['operation'] = '删除';
                break;
            case 3:
                $args['operation'] = '修改';
                if( !empty($data))
                {
                    $modifiess = $value = array();
                    foreach($data as $key => $val)
                    {
                        $modifiess[] = $this->column[$key];
                        //如果修改了有效期，因为有效期是时间戳，所以要转日期类型
                        if($key == 'starttime' || $key == 'endtime')
                        {
                            $val = date('Y-m-d', $val);
                        }
                        $value[] = $val;
                    }
                    $modifiestr = implode('-|-',$modifiess);
                    $valuestr = implode('-|-',$value);
                }
                $args['modifiess'] = $modifiestr;
                $args['value'] = $valuestr;
                break;
            case 4:
                //协议生效
                $args['operation'] = '生效';
                break;
            case 5:
                //协议失效
                $args['operation'] = '失效';
            default:
                //协议不通过
                $args['operation'] = '不通过';
        }

        return $this->db->insertElement(array('table' => 'agreement_log','query' => $args));

    }


    /**
     * 协议操作日志list
     * @param $args
     * @param $page
     * @param int $number
     * @return mixed
     */
    public function getAgreementLogList($args,$page,$number = 10)
    {
        $data = array(
            'select' => false,
            'table' => 'agreement_log',
            'query' => $args,
            'serial' => '',
            'orderby' => 'addtime DESC'
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    /**
     * [getAgreementNumsByArgs 根据条件得出协议总数]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-25
     * @param    [array]        $args [查询条件]
     * @return   [int]           [协议数量]
     */
    public function getAgreementNumsByArgs($args){
        $data = array(false,'agreement',$args);
        $sql = $this->pdosql->makeSelect($data);
        return count($this->db->fetchAll($sql));
    }

    /**
     * 根据协议id获取有效的协议
     * @param $id
     * @return mixed
     */
    public function getValidAgreementById($id)
    {
        $data = array(false,'agreement',array(array("AND","agreementid = :agreementid",'agreementid',$id),array("AND","status = :status",'status',3),array("AND","endtime > :endtime",'endtime',time())));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }


    /**
     * 根据甲方id获取甲方有效协议idArr
     * @param $companyId
     * @return mixed
     */
    public function getValidAgreementidArrByCompId($companyId)
    {
        $data = array();
        $time = time();
        $sql = "SELECT `agreementid` FROM `x2_agreement` WHERE `salerid`='". $companyId ."' AND `status`=3 AND `endtime`>'". $time ."'";
        $data['sql'] = $sql;
        $data['v'] = array();
        return $this->db->fetchALL($data,false);
    }


}

?>
