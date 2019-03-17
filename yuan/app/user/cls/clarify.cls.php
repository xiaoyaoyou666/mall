<?php
/**
 * 询价详情model逻辑查询
 * 查询报价表并价钱倒叙显示
 * @author 杨进昌
 * create date   2018-10-31
 * @see [clarify  user company]
 */
class clarify_user
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}
    
    /**
     * @action   配置CMS Model 方法
     * @param    clarify user  模块
     */
	public function _init()
	{
		$this->sql = $this->G->make('sql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
        $this->pdosql = $this->G->make('pdosql');
        $this->user = $this->G->make('user', 'office');
        $this->session = $this->G->make('session');
	}

    /**
     * @action  ADD    澄清表数据
     * @param   array  $args     表单传递数据
     * @param   table_name   clarify   数据库表明
     * @param   return arr
     */
    public function Addclarify($args)
    {
        $r = $this->db->insertElement(array('table' => 'clarify','query' => $args));
        return $r;
    }


    /**
     * @action  Add  澄清表状态记录表
     * @param   array   $args   点击确定按钮改变状态
     * @param   table_name   clar_detail  数据库表明
     * @param   return   array   $r       返回数组
     */
    public function Addclarifydetail($args)
    {
        $r = $this->db->insertElement(array('table' => 'clar_detail','query' => $args));
        return $r;
    }

    /** 
     * select   询价详情表
     * @param   int    $uid   询价人 id
     * @description  通过询价人id 进行联表操作 
     */    
    public function SelecteEnquirylist($uid,$orderby="clarify_id DESC")
    {
        $data = array(false,
        array('purchase_new'),
        array(
            array('AND',"purchase_new.id = ".$uid),
        ),$orderby);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql,false);
    }


    /**
     * 查询报价表并价钱倒叙显示
     * @param [$uid] [询价表连接id]
     * @param [$orderby] [金额升序]
     * @return [array]
     * @see [clarify-company-Selectebaojia]
     */
    public function Selectebaojia($uid,$orderby)
    {
        $data = array(false,
        array('purchase_price','purchase_new'),
        array(
            array('AND',"purchase_price.purchase_new_id=" .$uid),
            array('AND',"purchase_price.del=0"),
        ),$orderby);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql,false);
    }

    /**
     * 查询澄清表
     * @param [$uid] [澄清表连接id]
     * @param [$qid] [user表id]
     * @return [array]
     * @see [clarify-company-Selecteclarify]
     */
    public function Selecteclarify($uid,$qid='')
    {   
        $param = array();
        $param[] = array('AND',"clarify_xid=" .$uid);
        if(!empty($qid))
        {
           $param[] = array("AND","find_in_set(clarify_uid,:qid)",'qid',$qid);
        }

        $data = array(false,
        array('clarify'),
        $param);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql,false);
    }

    /**
     * 查询澄清记录表 返回 状态
     * @param [$xid] [询价表id]
     * @param [$uid] [session id]
     * @return [int 200/300] 
     * @see [clarify-company-Selecteclardetail]
     */
    public function Selecteclardetail($xid,$uid)
    {
        $data = array(false,
        array('clar_detail'),
        array(
            array('AND',"clar_detail.detail_clar_id=" .$xid),
            array('AND',"clar_detail.detail_uid=" .$uid),
        ));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetchAll($sql,false);
        if($r == true){
            return '200';
        }else{
            return '300';
        }
    }

    public function countlist($userid,$xunid)
    {
        $data = array();
        $sql = 'SELECT count(*) as aa FROM `x2_clarify` where clarify_uid ='.$userid.' and clarify_xid ='.$xunid ;
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r['0']['aa'];
    }

    public function countlist1($xunid,$userid)
    {
        $data = array();
        $sql = 'SELECT count(*) as aa FROM `x2_clar_detail` where clarify_id ='.$xunid.' and detail_uid='.$userid ;
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r['0']['aa'];
    }

    /**
     * 修改报价状态
     * 通过获取询价id 改变时全部修改未确定 0
     * @param [$uid] [询价id]
     * @return [int true/false] 
     * @see [clarify-company-updateBaojia]
     */
    public function updateBaojia($uid)
    {
        $args['baojia_status'] = 0;
        $data = array(
            'table' => 'purchase_price',
            'value' => $args,
            'query' =>array(array('AND' , 'purchase_new_id = :purchase_new_id' , 'purchase_new_id' , $uid))
            );
        return  $this->db->updateElement($data);
    }

    // 修改报价状态  确定操作 1
    public function updateBaojiaone($uid)
    {
        $args['baojia_status'] = 1;
        $data = array(
            'table' => 'purchase_price',
            'value' => $args,
            'query' =>array(array('AND' , 'purchase_new_id = :purchase_new_id' , 'purchase_new_id' , $uid))
            );
        return  $this->db->updateElement($data);
    }
    /**
     * 链表操作  报价表  询价表
     * 通过获取报价id  链接 询价表
     * @param [$args] [报价id]
     * @return [array] 
     * @see [clarify-company-addOrderpurase]
     */
    public function  addOrderpurase($args,$uid)
    {
        $data = array(false,
        array('purchase_price','purchase_new'),
        array(
            array('AND',"purchase_price.purchase_new_id=" .$args),
            array('AND' , 'purchase_price.supplier_id =' .$uid),
            array('AND' , 'purchase_price.purchase_new_id = purchase_new.id'),
        ));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql,false);
    }

    /**
     * 订单成功后修改报价表状态
     */
    public function updateclarifyPrice($newid,$bid,$param)
    {
        $data = array(
            'table' => 'purchase_price',
            'value' => $param,
            'query' =>array(
                          array('AND' , 'purchase_new_id = :purchase_new_id' , 'purchase_new_id' , $newid),
                          array('AND' , 'supplier_id = :supplier_id' , 'supplier_id' , $bid)
                          ));
        return  $this->db->updateElement($data);
    }


    /**
     * 定标与上传 按钮的if判断
     * 链接`x2_purchase_invitation` 通过询价表id与邀请企业id查询是否显示定标按钮与上传文档按钮
     * @param [$newid $userid]  int  return 
     */
    public function invitation($newid , $userid)
    {
        $data = array(false,
        array('purchase_price'),
        array(
            array('AND' , 'purchase_price.purchase_new_id =' .$newid),
            array('AND' , 'purchase_price.supplier_id = ' .$userid),
        ));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql,false);
        if($r == true){
            return '200';
        }else{
            return '300';
        }
    }
    

    // 修改报价状态  确定操作 4
    public function updateXunjiastatus($uid)
    {
        $args['status'] = 3;
        $data = array(
            'table' => 'purchase_new',
            'value' => $args,
            'query' =>array(array('AND' , 'id = :id' , 'id' , $uid))
            );
        return  $this->db->updateElement($data);
    }


    /**
     * 修改澄清表的企业名称
     */
    public function updateCompanyxun($userid,$companyname)
    {
        $args['clarify_name'] = $companyname;
        $data = array(
            'table' => 'clarify',
            'value' => $args,
            'query' =>array(array('AND' , 'clarify_uid = :clarify_uid' , 'clarify_uid' , $userid))
            );
        return  $this->db->updateElement($data);
    }

    /**
     *  批量修改
     */
    public function updateCompanyxuned($userid,$date)
    {
        $data = array(
            'table' => 'purchase_pricerecord',
            'value' => $date,
            'query' =>array(array('AND' , 'pricerecordid = :pricerecordid' , 'pricerecordid' , $userid))
            );
        return  $this->db->updateElement($data);
    }
    
    /**
     *  更新报价表 文件url  pid
     */ 
    public function updateCompanyxuneds($userid,$date,$urlname,$price)
    {
            if(empty($date) && empty($urlname)){
                $args['total_price'] = $price;  
            }else{
                $args['file_url'] = $date;
                $args['url_name'] = $urlname;
                $args['total_price'] = $price; 
            }
            
            $data = array(
                   'table' => 'purchase_price',
                   'value' => $args,
                   'query' =>array(array('AND' , 'pid = :pid' , 'pid' , $userid))
            );  
            return  $this->db->updateElement($data);                  
    }

    //查找报价表  urlname 显示 
    public function Selectebaoname($pid)
    {
        $data = array(false,
        array('purchase_price'),
        array(
            array('AND',"purchase_price.pid=" .$pid),
        ));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql,false);
    }


    /**
     * 根据报价id获取询价物资报价详情
     * @param $pid
     * @return mixed
     */
    public function getInquiryGoodsPricByPid($pid)
    {
        $data = array();
        $sql = 'SELECT * FROM `x2_purchase_pricerecord` AS pp LEFT JOIN `x2_purchase_material` AS pm ON pp.`materialid`=pm.`id` WHERE pp.`ppid`='.$pid;
        $data['sql'] = $sql;
        $data['v'] = array();
        return $this->db->fetchALL($data,false);
    }

}

?>