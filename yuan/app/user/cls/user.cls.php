<?php

class user_user
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
		$this->module = $this->G->make('module');
		$this->session = $this->G->make('session');
	}

	public function autoLoginWxUser($openid)
	{
		$user = $this->getUserByArgs(array(array('AND','useropenid = :useropenid','useropenid',$openid)));
		if(!$user)return false;
		$this->session->setSessionUser(array('sessionuserid'=>$user['userid'],'sessionpassword'=>$user['userpassword'],'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$user['usergroupid'],'sessionlogintime'=>TIME,'sessionusername'=>$user['username']));
		return true;
	}

	public function getModuleUserInfo($userid = 0)
	{
		$user = $this->session->getSessionUser();
		$group = $this->getGroupById($user['sessiongroupid']);
		if($userid)
		return array('iscurrentuser'=> $userid == $user['sessionuserid'],'group' => $group);
		else
		return array('iscurrentuser'=> 0,'group' => $group);
	}

	//user function
	public function insertUser($args)
	{
		$args['userregip'] = $this->ev->getClientIp();
		$args['userregtime'] = TIME;
		$data = array('user',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}
	//用户第二联系人信息添加
	public function insertUserContact($args)
	{
        $data = array('user_contacts',$args);
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        return $this->db->lastInsertId();
	}
	//供应商分类表添加数据
	public function insertUserCategory($args)
	{
        $data = array('user_category',$args);
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        return $this->db->lastInsertId();
	}
    //供应商证书表添加数据
	public function insertUserCertificate($args){
        $data = array('user_certificate',$args);
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        return $this->db->lastInsertId();
	}
	public function modifyUserGroup($groupid,$userid)
	{
		$user = $this->getUserById($userid);
		if($groupid == $user['usergroupid'])return true;
		$group = $this->getGroupById($groupid);
		if($group['groupmoduleid'] == $user['groupmoduleid'])
		{
			$data = array('user',array('usergroupid'=>$groupid),array(array("AND","userid = :userid",'userid',$userid)));
			$sql = $this->pdosql->makeUpdate($data);
			$this->db->exec($sql);
			return true;
		}
		else
		{
			$args = array('usergroupid'=>$groupid);
			$fields = $this->module->getPrivateMoudleFields($user['groupmoduleid']);
			foreach($fields as $p)
			{
				$args[$p['field']] = NULL;
			}
			$data = array('user',$args,array(array("AND","userid = :userid",'userid',$userid)));
			$sql = $this->pdosql->makeUpdate($data);
			$this->db->exec($sql);
			return true;
		}
	}

	public function modifyUserPassword($args,$userid)
	{
		$data = array('user',array('userpassword'=>md5($args['password'])),array(array("AND","userid = :userid",'userid',$userid)));
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	public function modifyUserInfo($args,$userid)
	{
		if(!$args)return false;
		$data = array('user',$args,array(array('AND',"userid = :userid",'userid',$userid)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
		//return $this->db->affectedRows();
	}
    /**
     * 根据用户id删除其下证书
     * @param $id
     * @return mixed
     */
    public function delCertificate($id,$certificate_type)
    {
        return $this->db->delElement(array('table' => 'user_certificate','query' => array(array('AND',"user_id = :user_id",'user_id',$id),array('AND',"certificate_type = :certificate_type",'certificate_type',$certificate_type))));
    }
    /**
     *更新资料证书
     * @param $id
     * @return mixed
     */
    public function modifyUserCertificate($args,$userid,$certificate_type)
    {
    	if($certificate_type==5){
            $data = array('user_certificate',$args,array(array('AND',"id = :id",'id',$userid)));
		}else{
            $data = array('user_certificate',$args,array(array('AND',"user_id = :user_id",'user_id',$userid),array('AND',"certificate_type = :certificate_type",'certificate_type',$certificate_type)));
		}
        $sql = $this->pdosql->makeUpdate($data);
        return $this->db->exec($sql);
    }
    public function getUserCertificateById($userid,$certificate_type)
    {
        $data = array(false,'user_certificate',array(array('AND',"user_id = :user_id",'user_id',$userid),array('AND',"certificate_type = :certificate_type",'certificate_type',$certificate_type)),false,'user_id DESC',false);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchALL($sql);
    }

	public function delUserById($userid)
	{
		$data = array('user',array(array('AND',"userid = :userid",'userid',$userid)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
		//return $this->db->affectedRows();
	}

	public function delActorById($groupid)
	{
		$r = $this->getUserListByGroupid($groupid);
		if($r['number'])return false;
		else
		{
			$args = array(
				'table' => "user_group",
				'query' => array(array('AND',"groupid = :groupid",'groupid',$groupid))
			);
			return $this->db->delElement($args);
		}
	}

	public function getUserById($id)
	{
		$data = array(false,array('user','user_group'),array(array('AND',"user.userid = :id",'id',$id),array('AND','user.usergroupid = user_group.groupid')));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('userinfo','groupright'));
	}

	public function getUserByArgs($args)
	{
		$data = array(false,array('user','user_group'),$args);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('userinfo','groupright'));
	}

	public function getUsersByArgs($args)
	{
		$data = array(false,array('user','user_group'),$args,false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'userid',array('userinfo','groupright'));
	}

	public function getUserListByArgs($page,$args,$number = 10)
	{
		$args = array(
			'table' => array('user','user_group'),
			'query' => $args,
			'serial' => array('userinfo','groupright'),
			'index' => 'userid'
		);
		return $this->db->listElements($page,$number,$args);
	}

	public function getUserListByGroupid($groupid,$number = 10,$page = 1)
	{
		$args = array(
			'table' => array('user','user_group'),
			'query' => array(array('AND',"user.usergroupid = :usergroupid",'usergroupid',$groupid),array('AND','user.usergroupid = user_group.groupid')),
			'serial' => array('userinfo','groupright')
		);
		return $this->db->listElements($page,$number,$args);
	}

	public function getUserByUserName($username)
	{
		//$username = urldecode($username);
		$data = array(false,array('user','user_group'),array(array('AND',"user.username = :username",'username',$username),array('AND','user.usergroupid = user_group.groupid')));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('userinfo','groupright'));
	}

	public function getUserByEmail($email)
	{
		$data = array(false,array('user','user_group'),array(array('AND',"user.useremail = :email",'email',$email),array('AND','user.usergroupid = user_group.groupid')));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('userinfo','groupright'));
	}

	public function getUserList($page,$number = 20,$args = 1, $orderby = 'userid DESC')
	{
		$page = $page > 0?$page:1;
		$r = array();
		$data = array(false,'user',$args,false,$orderby,array(intval($page-1)*$number,$number));
		$sql = $this->pdosql->makeSelect($data);
		$r['data'] = $this->db->fetchALL($sql,false,'userinfo');
		$data = array('COUNT(*) AS number','user',$args,false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		$tmp = $this->db->fetch($sql);
		$r['number'] = $tmp['number'];
		$pages = $this->pg->outPage($this->pg->getPagesNumber($tmp['number'],$number),$page);
		$r['pages'] = $pages;
		return $r;
	}

	//user group functions
	public function getGroupById($groupid)
	{
		$data = array(false,'user_group',array(array('AND',"groupid = :groupid",'groupid',$groupid)),false,'groupid DESC',false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'groupright');
	}

	public function getGroupByArgs($args)
	{
		$data = array(false,'user_group',$args);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'groupright');
	}

	public function getUserGroups()
	{
		$data = array(false,'user_group',1,false,'groupid DESC',false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'groupid','groupright');
	}

	public function getUserGroupList($args,$number = 10,$page = 1)
	{
		$args = array(
			'table' => 'user_group',
			'query' => $args,
			'index' => 'groupid',
			'serial' => 'groupright'
		);
		return $this->db->listElements($page,10,$args);
	}

	public function getGroupsByModuleid($moduleid)
	{
		$data = array(false,'user_group',array(array('AND',"groupmoduleid = :groupmoduleid",'groupmoduleid',$moduleid)),false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'groupid','groupright');
	}

	public function getDefaultGroupByModuleid($moduleid)
	{
		$data = array(false,'user_group',array(array('AND',"groupmoduledefault = 1"),array('AND',"groupmoduleid = :groupmoduleid",'groupmoduleid',$moduleid)),false,'groupid DESC',false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function insertActor($args)
	{
		if($args['groupmoduledefault'])
		{
			$data = array('user_group',array('groupmoduledefault'=>0),array(array('AND',"groupmoduleid = :groupmoduleid",'groupmoduleid',$args['groupmoduleid'])));
			$sql = $this->pdosql->makeUpdate($data);
			$this->db->exec($sql);
		}
		$data = array('user_group',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	public function modifyActor($groupid,$args)
	{
		$g = $this->getGroupByArgs(array(array('AND',"groupname = :groupname",'groupname',$args['groupname']),array('AND',"groupid != :groupid",'groupid',$groupid)));
		if($g)return false;
		$data = array('user_group',$args,array(array('AND',"groupid = :groupid",'groupid',$groupid)));
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	public function selectDefaultActor($groupid)
	{
		$args = array("groupdefault" => 0);
		$data = array('user_group',$args);
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		$args = array("groupdefault" => 1);
		$data = array('user_group',$args,array(array('AND',"groupid = :groupid",'groupid',$groupid)));
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	public function getDefaultGroup()
	{
		$data = array(false,'user_group',array(array('AND',"groupdefault = 1")));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

    /**
     * 供应商页面随机获取案例
     */
    public function getCompanyCase()
    {
        $data = array();
        $sql = 'SELECT * FROM `x2_company_case` WHERE case_id >= ((SELECT MAX(case_id) FROM `x2_company_case`)-(SELECT MIN(case_id) FROM `x2_company_case`)) * RAND() + (SELECT MIN(case_id) FROM `x2_company_case`) LIMIT 5';
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }

    public function getUserByCompanyName($company_name)
	{
		//$username = urldecode($username);
		$data = array(false,array('user','user_group'),array(array('AND',"user.company_name = :company_name",'company_name',$company_name),array('AND','user.usergroupid = user_group.groupid')));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('userinfo','groupright'));
	}

    public function getUserList2($page,$number = 20,$args = 1, $orderby = 'company_level DESC,userid DESC')
    {
        $page = $page > 0?$page:1;
        $r = array();
        $data = array(false,'user',$args,false,$orderby,array(intval($page-1)*$number,$number));
        $sql = $this->pdosql->makeSelect($data);
        $r['data'] = $this->db->fetchALL($sql,false,'userinfo');
        $data = array('COUNT(*) AS number','user',$args,false,false,false);
        $sql = $this->pdosql->makeSelect($data);
        $tmp = $this->db->fetch($sql);
        $r['number'] = $tmp['number'];
        $pages = $this->pg->outPage($this->pg->getPagesNumber($tmp['number'],$number),$page);
        $r['pages'] = $pages;
        return $r;
    }


    //商家统计【商家总数】
    public function countUser()
	{
		$data = array();
        $sql = 'SELECT count(*) as aa FROM `x2_user`';
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r['0']['aa'];
		
	}

    public function addLoginLog($args)
    {
        return $this->db->insertElement(array('table' => 'login_log','query' => $args));
    }

	//商家统计【今日新增】
	public function countUserToday($firttime,$endtime)
	{
		$data = array();
        $sql = 'SELECT count(*) as aa FROM `x2_user` where  userregtime >='.$firttime.' and userregtime <='. $endtime;
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        if($r['0']['aa']==null){
            return 0;
		}else{
            return $r['0']['aa'];
		}

	}

    //登录日志
    public function getLoginlog($args,$page,$number = 20,$order = 'id DESC')
    {
        $data = array(
            'select' => false,
            'table' => 'login_log',
            'query' => $args,
            'orderby' => $order
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    //搜索关键字统计
    public function getSearchList($page,$number = 10,$args = 1, $orderby)
    {
        $data = array(
            'select' => false,
            'table' => 'search_log',
            'query' => $args,
            'orderby' => $orderby
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    //推荐位列表
    public function getPositionList($args,$page,$number = 10,$order = 'posid ASC')
    {
        $data = array(
            'select' => false,
            'table' => 'position',
            'query' => $args,
            'orderby' => $order
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    //添加推荐位
    public function addPosition($args)
    {
        return $this->db->insertElement(array('table' => 'position','query' => $args));
    }

    //取推荐位内容
    public function getPositionContent($args,$page,$number = 10,$order = 'id DESC')
    {
        $data = array(
            'select' => false,
            'table' => 'position_data',
            'query' => $args,
            'orderby' => $order
        );

        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    //推荐位添加内容
    public function addPosContent($args)
    {
        return $this->db->insertElement(array('table' => 'position_data','query' => $args));
    }


    //根据企业id获取他拥有的推荐位
    public function getPosByUserid($userid, $type)
    {
        $data = array();
        $sql = 'SELECT `posid` FROM `x2_position_data` where `dataid`='. $userid .' AND `datatype`='.$type;
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;

    }

    /**
     * 根据内容id和类型删除已有推荐位
     * @param $userid 内容id包括 采购信息的id，供应商的id，商品的id
     * @param $type
     * @return mixed
     */
    public function delPosContentByDataid($userid, $type)
    {
        $data = array('position_data',array(array('AND',"dataid = :dataid",'dataid',$userid),array('AND',"datatype = :datatype",'datatype',$type)));
        $sql = $this->pdosql->makeDelete($data);
        return $this->db->exec($sql);
    }

    /**
     * 根据推荐内容表id删除已有推荐内容
     * @param $id
     * @return mixed
     */
    public function delPosContentById($id)
    {
        $data = array('position_data',array(array('AND',"id = :id",'id',$id)));
        $sql = $this->pdosql->makeDelete($data);
        return $this->db->exec($sql);
    }

    /**
     * 根据推荐位id和类型查询数据
     * @param $posid
     * @param $type
     */
    public function getPositionById($posid, $type)
    {
        $data = array();
        $sql = 'SELECT `dataid` FROM `x2_position_data` where `posid`='. $posid .' AND `datatype`='.$type;
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }

    /**
     * 根据用户ids获取数据
     * @param $useridStr
     * @return mixed
     */
    public function getUserByPosition($useridStr)
    {
        $data = array();
        $sql = 'SELECT * FROM `x2_user` where `userid` IN ('.$useridStr.') and `company_istrue` = 1';
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }

    public function getUseridByGroup($groupid)
    {
        $data = array('userid','user',array(array('AND',"usergroupid = :usergroupid",'usergroupid',$groupid)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchALL($sql);
    }

    //根据注册手机号查找用户信息
    public function getUserByMobile($mobile)
    {
        $data = array(false,'user',array(array('AND',"company_mobile = :company_mobile",'company_mobile',$mobile)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    //添加发送短信记录
    public function addSendSms($args)
    {
        return $this->db->insertElement(array('table' => 'sms','query' => $args));
    }

    public function batchAddSendSms($phonenumber,$action,$time)
    {
        $phoneArr = explode(',',$phonenumber);
        $sql = 'INSERT INTO `x2_sms` (`mobile`,`action`,`code`,`addtime`)
                 VALUES ';
        $value = '';
        foreach($phoneArr as $key => $val)
        {
            $value .= "('".$val."','".$action."','0','".$time."'),";
        }
        $value = substr($value, 0, -1);
        $sql = $sql.$value;
        $data['sql'] = $sql;
        $data['v'] = array();
        $this->db->exec($data);
        return $this->db->lastInsertId();
    }

    //校验短信验证码
    public function checkCode($code,$mobile,$validTime = 60)
    {
        $data = array();
        $sql = 'SELECT * FROM `x2_sms` WHERE `mobile` = '.$mobile.' AND `code` = '.$code.' AND `addtime` >= (UNIX_TIMESTAMP(NOW()) - '.$validTime.')';
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }

    //根基供应商编号搜索
    public function getCompanyByCode($code)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_supplier` where `lifnr` LIKE '". $code ."%' LIMIT 10";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }

    public function getWuliaoByCode($code)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_material` WHERE `bwtar`='NORM' AND `matnr`='". $code ."' ORDER BY `material_id` ASC LIMIT 10";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }

   /*
    * @action  后台供应商排行榜
    * $data    return   array
    * $page    return   fenye
    */
    public function UsercollectList($page,$number = 10,$args = 1, $orderby = 'company_num DESC')
    {
        $page = $page > 0?$page:1;
        $r = array();
        $data = array(false,'user',$args,false,$orderby,array(intval($page-1)*$number,$number));
        $sql = $this->pdosql->makeSelect($data);
        $r['data'] = $this->db->fetchALL($sql,false,'userinfo');
        $data = array('COUNT(*) AS number','user',$args,false,false,false);
        $sql = $this->pdosql->makeSelect($data);
        $tmp = $this->db->fetch($sql);
        $r['number'] = $tmp['number'];
        $pages = $this->pg->outPage($this->pg->getPagesNumber($tmp['number'],$number),$page);
        $r['pages'] = $pages;
        return $r;
    }


    /**
     * [getSuplierAll 获取特定条件的所有供应商]
     * @Author   Zhangjianchao
     * @DateTime 2018-09-12
     * @returns  {array}
     * @param    [array]        $args [查询条件]
     * @return   [array]              [返回结果集]
     */
    public function getSuplierAll($args,$page,$number = 20,$order = 'userid DESC'){
    	/*$args[] = array("AND","user_id = userid");
		$data = array(
			'select' => false,
			'table' => array('user_category','user'),
			'query' => $args,
			'orderby' => $orderby
           
		);
        $sql = $this->sql->makeSelect($data);*/
        $args[] = array("AND","user_id = userid");
		$data = array(
			'select' => false,
			'table' => array('user_category','user'),
			'query' => $args,
			'orderby' => $order,
            'serial' => ''
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;


       // return 111;

    }

    /**
     * 根据id字符串获取多个用户
     * 按查询的顺序返回结果集
     * @param $ids
     * @return mixed
     */
    public function getUserListByUserIds($ids)
    {
        $data = array();
        $sql = "SELECT * FROM `x2_user` where FIND_IN_SET(`userid`,'".$ids."') GROUP BY FIND_IN_SET(`userid`,'".$ids."')";
        $data['sql'] = $sql;
        $data['v'] = array();
        return $this->db->fetchAll($data,false);
    }

}

?>
