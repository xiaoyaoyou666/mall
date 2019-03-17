<?php
/**
 * 合同协议申请类
 */
class agreementapply_agreement
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
	}

	/**
	 * [addAgreementApply 添加方法]
	 * @Author    Zhangjianchao
	 * @DateTime  2018-08-13
	 * @param     $args  {array} 需要添加表的数据
	 * @returns   {array}   bool 返回true或者false      
	 */
	public function addAgreementApply($args)
	{
		return $this->db->insertElement(array('table' => 'apply','query' => $args));
	}


	/**
	 * [getAgreementApplyList 协议申请列表方法]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [array]         $args   [查询条件]
	 * @param    [int]           $page   [当前页码]
	 * @param    [int]       $number [当前页的数量]
	 * @return   [type]                [description]
	 */
	public function getAgreementApplyList($args,$page,$number = 10)
    {
        $data = array(
            'select' => false,
            'table' => 'apply',
            'query' => $args,
            'serial' => '',
            'orderby' => 'applyid DESC'
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
	}

	

	

	/**
	 * [getAgreementApplyListAll 展示出所有的协议申请列表]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-15
	 * @param    {array}  $args   搜索条件
	 * @return   [array]  reslut  [结果集]
	 */
	public function getAgreementApplyListAll($args){
		$data = array(false,'apply',$args);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql);
	}

	/**
	 * [modifyAgreementApply 修改方法]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-13
	 * @param    [int]       $id     [主键ID]
	 * @param    [array]     $args [修改数据]
	 * @return   [bool]       [true or false]
	 */
	public function modifyAgreementApply($id,$args)
	{
		
		$data = array(
			'table' => 'apply',
			'value' => $args,
			'query' => array(array('AND',"applyid = :applyid",'applyid',$id))
		);
		return $this->db->updateElement($data);
	}

	/**
	 * [modifyAgreementBygreementid 修改申请表申请by合同ID]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-21
	 * @returns  {array}
	 * @return   [BOOL]        [true 或者 false]
	 */
	public function modifyAgreementBygreementid($id,$args,$type){
		$data = array(
			'table' => 'apply',
			'value' => $args,
			'query' => array(array('AND',"agreementid = :agreementid",'agreementid',$id),array('AND',"type = :type",'type',$type))
		);
		return $this->db->updateElement($data);
	}

	/**
	 * [getAgreementApplyListNum 返回申请类型的数量]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-20
	 * @param    {array}  条件
	 * @return   [type]        [description]
	 */
	public function getAgreementApplyListNum($args){
		$data = array(false,'apply',$args);
        $sql = $this->pdosql->makeSelect($data);
        return count($this->db->fetchAll($sql));
	}

	/**
	 * [getAgreementApplyById 获取申请的详细信息方法]
	 * @Author   Zhangjianchao
	 * @DateTime 2018-08-21
	 * @param    {int}   applyid  申请ID
	 * @returns  {array}  详细信息的结果集
	 */
	public function getAgreementApplyById($id){
		$data = array(false,'apply',array(array("AND","applyid = :applyid","applyid",$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}
	

}

?>
