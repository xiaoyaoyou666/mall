<?php
/*
 * Created on 2016-5-19
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class action extends app
{
	public function display()
	{
		$action = $this->ev->url(3);
		$search = $this->ev->get('search');
        $this->msg = $this->G->make('msg','user');
        $this->company = $this->G->make('content','company');
        $this->content = $this->G->make('content','purchase');
        $this->agreement = $this->G->make('agreement','agreement');
        $this->session = $this->G->make('session');
		$this->u = '';
		if($search)
		{
			$this->tpl->assign('search',$search);
			foreach($search as $key => $arg)
			{
				$this->u .= "&search[{$key}]={$arg}";
			}
		}
		$this->tpl->assign('search',$search);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function del()
	{
		$page = $this->ev->get('page');
		$userid = $this->ev->get('userid');
		$this->user->delUserById($userid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "navTabId" => "",
		    "rel" => "",
		    "callbackType" => "forward",
		    "forwardUrl" => "index.php?user-master-user&page={$page}{$this->u}"
		);
		exit(json_encode($message));
	}

	private function batdel()
	{
		if($this->ev->get('action') == 'delete')
		{
			$page = $this->ev->get('page');
			$delids = $this->ev->get('delids');
			foreach($delids as $userid => $p)
			$this->user->delUserById($userid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "navTabId" => "",
			    "rel" => "",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?user-master-user&page={$page}{$this->u}"
			);
			exit(json_encode($message));
		}
	}

	private function modify()
	{
		$page = $this->ev->get('page');
		if($this->ev->get('modifyusergroup'))
		{
			$groupid = $this->ev->get('groupid');
			$userid = $this->ev->get('userid');
			$this->user->modifyUserGroup($groupid,$userid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?user-master-user&page={$page}{$this->u}"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('modifyuserinfo'))
		{
			$args = $this->ev->get('args');
			$userid = $this->ev->get('userid');
			$user = $this->user->getUserById($userid);
			$group = $this->user->getGroupById($user['usergroupid']);
			$args = $this->module->tidyNeedFieldsPars($args,$group['groupmoduleid'],array('iscurrentuser'=> $userid == $this->_user['sessionuserid'],'group' => $group));
			$id = $this->user->modifyUserInfo($args,$userid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?user-master-user&page={$page}{$this->u}"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('modifyuserpassword'))
		{
			$args = $this->ev->get('args');
			$userid = $this->ev->get('userid');
			if($args['password'] == $args['password2'] && $userid)
			{
				$id = $this->user->modifyUserPassword($args,$userid);
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => "forward",
				    "forwardUrl" => "index.php?user-master-user&page={$page}{$this->u}"
				);
				exit(json_encode($message));
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败",
				    "navTabId" => "",
				    "rel" => ""
				);
				exit(json_encode($message));
			}
		}
		else
		{
			$userid = $this->ev->get('userid');
			$user = $this->user->getUserById($userid);
			$group = $this->user->getGroupById($user['usergroupid']);
			$fields = $this->module->getMoudleFields($group['groupmoduleid'],array('iscurrentuser'=> $userid == $this->_user['sessionuserid'],'group' => $this->user->getGroupById($this->_user['sessiongroupid'])));
			$forms = $this->html->buildHtml($fields,$user);
			$this->tpl->assign('moduleid',$group['groupmoduleid']);
			$this->tpl->assign('fields',$fields);
			$this->tpl->assign('forms',$forms);
			$this->tpl->assign('user',$user);
			$this->tpl->assign('page',$page);
			$this->tpl->display('modifyuser');
		}
	}

	private function batadd()
	{
		if($this->ev->post('insertUser'))
		{
			$uploadfile = $this->ev->get('uploadfile');
			if(!file_exists($uploadfile))
			{
				$message = array(
					'statusCode' => 300,
					"message" => "上传文件不存在"
				);
				exit(json_encode($message));
			}
			else
			{
				setlocale(LC_ALL,'zh_CN');
				$handle = fopen($uploadfile,"r");
				$defaultgroup = $this->user->getDefaultGroup();
				$strings = $this->G->make('strings');
				while ($data = fgetcsv($handle,200))
				{

				    if($data[0] && $data[1])
				    {
					    $args = array();
					    $args['username'] = iconv("GBK","UTF-8",$data[0]);
					    if($strings->isUserName($args['username']))
					    {
						    $u = $this->user->getUserByUserName($args['username']);
						    if(!$u)
						    {
							    $args['useremail'] = $data[1];
							    if($strings->isEmail($args['useremail']))
							    {
								    $u = $this->user->getUserByEmail($args['useremail']);
								    if(!$u)
								    {
								    	if(!$data[2])$data[2] = '111111';
								    	$args['userpassword'] = md5($data[2]);
								    	$args['usergroupid'] = $defaultgroup['groupid'];
								    	$this->user->insertUser($args);
								    }
							    }
						    }
					    }
				    }
				}
				fclose($handle);
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => "forward",
				    "forwardUrl" => "index.php?user-master-user"
				);
				exit(json_encode($message));
			}
		}
		else
		{
			$this->tpl->display('batadduser');
		}
	}

	private function add()
	{
		if($this->ev->post('insertUser'))
		{
			$args = $this->ev->post('args');
			if($args['userpassword'] == $args['userpassword2'])
			{
				$userbyname = $this->user->getUserByUserName($args['username']);
				$userbyemail = $this->user->getUserByEmail($args['useremail']);
				if($userbyname)
				$errmsg = "这个用户名已经被注册了";
				if($userbyemail)
				$errmsg = "这个邮箱已经被注册了";
				if($errmsg)
				{
					$message = array(
						'statusCode' => 300,
						"message" => "{$errmsg}",
					    "navTabId" => "",
					    "rel" => ""
					);
					exit(json_encode($message));
				}
				$args['userpassword'] = md5($args['userpassword']);
				$search = $this->ev->get('search');
				$u = '';
				if($search)
				{
					foreach($search as $key => $arg)
					{
						$u .= "&search[{$key}]={$arg}";
					}
				}
				unset($args['userpassword2']);
				$id = $this->user->insertUser($args);
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => "forward",
				    "forwardUrl" => "index.php?user-master-user&page={$page}{$this->u}"
				);
				exit(json_encode($message));
			}
		}
		else
		{
			$this->tpl->display('adduser');
		}
	}

	private function index()
	{

		$page = $this->ev->get('page')?$this->ev->get('page'):1;
		$search = $this->ev->get('search');
		$u = '';
		if($search)
		{
			foreach($search as $key => $arg)
			{
				$u .= "&search[{$key}]={$arg}";
			}
		}
		$args = array();

       /* echo "<pre/>";
        print_r($search);
        echo "<pre/>";*/
		if($search['username'])$args[] = array('AND',"username LIKE :username",'username','%'.$search['username'].'%');
		if($search['company_name'])$args[] = array('AND',"company_name  LIKE :company_name",'company_name','%'.$search['company_name'].'%');
		if($search['company_mobile'])$args[] = array('AND',"company_mobile = :company_mobile",'company_mobile',$search['company_mobile']);
        if($search['company_category'])$args[] = array('AND',"company_category = :company_category",'company_category',$search['company_category']);
         if($search['users_role'])$args[] = array('AND',"users_role = :users_role",'users_role',$search['users_role']);



		$users = $this->user->getUserList($page,10,$args);
		foreach ($users['data'] as $k => &$v) {
			$args2[] = array('AND',"userid = :userid",'userid',$v['userid']);
			$args1[] = array('AND',"salerid = :salerid",'salerid',$v['sap_company_id']);
			$v['agreementnums'] = ($this->agreement->getAgreementNumsByArgs($args2)+$this->agreement->getAgreementNumsByArgs($args1));
		}

        //推荐位数据
        $positionData = $this->user->getPositionList(array(), 1, 50);
        $this->tpl->assign('positionData',$positionData);
		$this->tpl->assign('users',$users);
		$this->tpl->assign('search',$search);
		$this->tpl->assign('u',$u);
		$this->tpl->assign('page',$page);
		$this->tpl->display('user2');
	}

    private function info()
    {
        $userid = $this->ev->get('userid');
        $data = $this->company->getCompanyById($userid);
        $this->tpl->assign('data',$data);
        $this->tpl->display('userinfo');
    }

    //登录日志
    private function loginlog()
    {
        $page = intval($this->ev->get('page'));
        $page = $page?$page:1;
        $args = array();
        $data = $this->user->getLoginlog($args,$page,10);

        $this->tpl->assign('page',$page);
        $this->tpl->assign('data',$data);
        $this->tpl->display('loginlog');
    }

    //搜索关键字统计
    private function searchcount()
    {
        $page = $this->ev->get('page')?$this->ev->get('page'):1;
        $search = $this->ev->get('search');
        $u = '';
        if($search)
        {
            foreach($search as $key => $arg)
            {
                $u .= "&search[{$key}]={$arg}";
            }
        }
        $args = array();
        if($search['keyword'])$args[] = array('AND',"keyword LIKE :keyword",'keyword','%'.$search['keyword'].'%');
        if($search['searchtype'])$args[] = array('AND',"searchtype = :searchtype",'searchtype',$search['searchtype']);
        $orderby = $search['orderby'] ? ($search['orderby'] == 0 ? 'num DESC' : 'num ASC') : 'num DESC';
        $data = $this->user->getSearchList($page, 10, $args, $orderby);
        $this->tpl->assign('data',$data);
        $this->tpl->assign('search',$search);
        $this->tpl->assign('u',$u);
        $this->tpl->assign('page',$page);
        $this->tpl->display('searchcount');
    }

    //编辑企业推荐
    private function level()
    {
        $userid = $this->ev->get('userid');
        $update = $this->ev->get('update');
        if($update)
        {
            $page = intval($this->ev->get('page'));
            $args['company_level'] = $this->ev->get('level');
            $id = $this->user->modifyUserInfo($args,$userid);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-master-user&page={$page}{$this->u}"
            );
            exit(json_encode($message));
        }
        else
        {
            $data = $this->company->getCompanyById($userid);
            $this->tpl->assign('data',$data);
            $this->tpl->display('level');
        }

    }

    /**************推荐位管理*************/
    //推荐位列表
    private function position()
    {
        $page = $this->ev->get('page')?$this->ev->get('page'):1;
        $data = $this->user->getPositionList(array(), $page, 10);
        $this->tpl->assign('data',$data);
        $this->tpl->assign('page',$page);
        $this->tpl->display('position');
    }

    //添加推荐位
    private function positionadd()
    {
        if($this->ev->get('submit'))
        {
            $args = array();
            $args['posname'] = $this->ev->get('name');
            $args['descs'] = $this->ev->get('desc');
            $ret = $this->user->addPosition($args);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-master-user-poscontentset&posid=".$ret
            );
            exit(json_encode($message));
        }
        else
        {
            $this->tpl->display('position_add');
        }
    }

    //推荐位内容管理页面
    private function poscontentset()
    {
        $posid = $this->ev->get('posid');
        $args = array();
        $args[] = array('AND',"posid = :posid",'posid',$posid);
        $page = $this->ev->get('page')?$this->ev->get('page'):1;
        $data = $this->user->getPositionContent($args, $page, 10);
        $this->tpl->assign('data',$data);
        $this->tpl->assign('page',$page);
        $this->tpl->display('position_data');
    }

    //企业用户设置推荐位
    private function poscontentadd()
    {
        $userid = intval($this->ev->get('userid'));
        $uname = $this->ev->get('uname');
        $posid = $this->ev->get('posid');
        $type = $this->ev->get('t');
        //先删除已有的推荐内容
        $this->user->delPosContentByDataid($userid,$type);
        $posidArr = explode(',', $posid);
        $args = array();
        foreach($posidArr as $k => $v)
        {
            $args['posid'] = intval($v);
            $args['dataid'] = $userid;
            $args['title'] = $uname;
            $args['datatype'] = $type;
            $args['createtime'] = time();
            $this->user->addPosContent($args);
        }
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
        );
        exit(json_encode($message));

    }

    //查询企业用户已经设置的推荐位
    private function getPosByUserid()
    {
        $userid = intval($this->ev->get('userid'));
        $type = $this->ev->get('t');
        $userPosition = $this->user->getPosByUserid($userid,$type);
        $userPosiId = array();
        foreach ($userPosition as $k => $v) {
            $userPosiId[] = $v['posid'];
        }
        //推荐位数据
        $positionData = $this->user->getPositionList(array(), 1, 50);
        $html = '';
        foreach ($positionData['data'] as $key=>$val) {
            $checked = in_array($val['posid'], $userPosiId) ? 'checked' : '';
            $html .= '<tr>';
            $html .= '<td><input type="checkbox" '.$checked.' value="'.$val['posid'].'" name="posids"></td>';
            $html .= '<td>'.$val['posname'].'</td>';
            $html .= '<td>'.$val['descs'].'</td>';
            $html .= '</tr>';
        }
        $message = array(
            'statusCode' => 200,
            "message" => $html,
        );
        exit(json_encode($message));

    }

    //推荐位内容管理页面删除内容
    private function delposcontbyid()
    {
        $id = $this->ev->get('id');
        $this->user->delPosContentById($id);
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
        );
        exit(json_encode($message));
    }

    /**************推荐位管理end*************/

    /**************系统消息*************/
    private function systemmessage()
    {
        //var_dump($this->user->getUseridByGroup(3));die;
        $this->tpl->display('message');
    }
    //发送消息
    private function sendmessage()
    {
        $type = $this->ev->get('type');     //发送类型
        $title = $this->ev->get('title');   //消息标题
        $content = $this->ev->get('content');//消息内容
        $userids = $this->ev->get('uid');   //定向发送用户信息
        $args = array();
        if($type == 2)//全员消息
        {
                $args['msg_userid'] = -1;
                $args['msg_title'] = $title;
                $args['msg_time'] = time();
                $args['msg_url'] = 'index.php?user-company-message-messageinfo&msg_id=';
                $args['status'] = 0;
                $args['msg_type'] = $type;
                $args['msg_content'] = $content;
                $this->msg->systemSendMsg($args);
        }
        else//定向消息
        {
            $useridArr = explode(',', $userids);
            foreach ($useridArr as $key => $val)
            {
                $args['msg_userid'] = $val;
                $args['msg_title'] = $title;
                $args['msg_time'] = time();
                $args['msg_url'] = 'index.php?user-company-message-messageinfo&msg_id=';
                $args['status'] = 0;
                $args['msg_type'] = $type;
                $args['msg_content'] = $content;
                $this->msg->systemSendMsg($args);
            }
        }
        $message = array(
            'statusCode' => 200,
            "message" => "发送成功",
        );
        exit(json_encode($message));
    }
    //公告信息列表
	public function messageList(){
        $page = $this->ev->get('page')?$this->ev->get('page'):1;
        $args[] = array("AND","msg_type != :msg_type",'msg_type',1);
        $messageInfo = $this->msg->getCompanyMsgList($args,$page,10);
        foreach ($messageInfo['data'] as $k=>$val){
        	if($val['msg_userid'] > 0) {
                $sql = 'SELECT company_name FROM `x2_user` WHERE userid = '.$val['msg_userid'];
                $data['sql'] = $sql;
                $date['v'] = array();
                $userInfo = $this->db->fetch($data,false);
                $messageInfo['data'][$k]['company_name'] = $userInfo['company_name'];
                $messageInfo['data'][$k]['msg_time'] = date('Y-m-d H:i:s',$val['msg_time']);
            }else{
                $messageInfo['data'][$k]['company_name'] = '公告';
                $messageInfo['data'][$k]['msg_time'] = date('Y-m-d H:i:s',$val['msg_time']);
			}
            $messageInfo['data'][$k]['msg_type'] = $val['msg_type']==2?'公告':'定向消息';

		}
        $this->tpl->assign('messageInfo',$messageInfo);
        $this->tpl->display('messagelist');
	}
	//删除公告
	public function delMessage(){
        $msgId = $this->ev->get('msgId');
        $this->msg->delMsg($msgId);
        header("Location: index.php?user-master-user-messageList");
        exit;
	}

    private function selectsendobj()
    {
        $page = $this->ev->get('page')?$this->ev->get('page'):1;
        $search = $this->ev->get('search');
        $title = $this->ev->get('title');
        $content = $this->ev->get('content');
        $type = $this->ev->get('type');
        $u = '';
        if($search)
        {
            foreach($search as $key => $arg)
            {
                $u .= "&search[{$key}]={$arg}";
            }
        }
        $args = array();
        if($search['username'])$args[] = array('AND',"username LIKE :username",'username','%'.$search['username'].'%');
        if($search['company_name'])$args[] = array('AND',"company_name  LIKE :company_name",'company_name','%'.$search['company_name'].'%');
        if($search['company_mobile'])$args[] = array('AND',"company_mobile = :company_mobile",'company_mobile',$search['company_mobile']);
        if($search['company_category'])$args[] = array('AND',"company_category = :company_category",'company_category',$search['company_category']);
        $users = $this->user->getUserList($page,10,$args);
        //推荐位数据
        $positionData = $this->user->getPositionList(array(), 1, 50);
        $this->tpl->assign('positionData',$positionData);
        $this->tpl->assign('users',$users);
        $this->tpl->assign('search',$search);
        $this->tpl->assign('u',$u);
        $this->tpl->assign('page',$page);
        $this->tpl->assign('title',$title);
        $this->tpl->assign('content',$content);
        $this->tpl->assign('type',$type);
        $this->tpl->display('selectsendobj');
    }

    private function test()
    {
    	$this->tpl->display('indent');
    }

	private function test1()
    {
    	$this->tpl->display('statistics');
    }

    private function updateStatus()
	{
		$userid = $this->ev->get('id_value');
		$status = $this->ev->get('value');
		$args = array();
		$args['company_istrue'] = $status;
        $result = $this->user->modifyUserInfo($args,$userid);

        if ($result) {
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功"

			);
		} else {
			$message = array(
				'statusCode' => 300,
				"message" => "修改失败了"

			);
		}
		exit(json_encode($message));
	}

   /*
	* @action   供应商管理
	* @param    list  array
	* @number   int
	* @$page    分页
	*/
    private function sisters()
    {
        $page = $this->ev->get('page')?$this->ev->get('page'):1;
        $args = array();
        $args[] = 'company_num desc';
        $users = $this->user->UsercollectList($page,10,0);
        $this->tpl->assign('page',$page);
        $this->tpl->assign('users',$users);
        $this->tpl->display('sisters');
    }

    /**
	 * 用户角色修改
	 * 功能更新：时间：20180829，xiliheng，
	 * 更新内容：修改用户角色时，同时修改session中的sessionuserrole字段
	 */
    public function editRole(){
        $role = $this->ev->get('role');
        $userid = $this->ev->get('user_id');
        $args['users_role'] = $role;
        $id = $this->user->modifyUserInfo($args,$userid);
		$userSession = $this->session->getSessionByUserId($userid);
		if (!empty($userSession))
		{
			$this->session->updateSessionRoleByUid($userid, $role);
		}

        if($id){
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
            );
            exit(json_encode($message));
		}else{
            $message = array(
                'statusCode' => 300,
                "message" => "操作失败",
            );
            exit(json_encode($message));
		}

	}

    private function inquiry()
    {
        //头部关键词 搜索
        $keyword = strip_tags($this->ev->get('keyword'));
        $type = intval($this->ev->get('purchasetype'));
        $status = intval($this->ev->get('purchasestatus'));
        $stime = strtotime($this->ev->get('stime'));
        $etime = strtotime($this->ev->get('etime'));
        $companyname = strip_tags($this->ev->get('companyname'));
        $page = intval($this->ev->get('page'))?intval($this->ev->get('page')):1;
        //搜索条件
        $args[] = array("AND","purchase_new.xunjia_ren = user.userid");
        if($keyword)$args[] = array("AND","purchase_new.xunjia_title LIKE :xunjia_title",'xunjia_title',"%{$keyword}%");//关键字搜索
        if($status)$args[] = array("AND","purchase_new.status = :status",'status',$status);//状态
        if($type)$args[] = array("AND","purchase_new.xunjia_type = :xunjia_type",'xunjia_type',$type);//类型
        if($stime)$args[] = array("AND","purchase_new.create_time >= '".$stime."'");//发布开始时间
        if($etime)$args[] = array("AND","purchase_new.create_time <= '".$etime."'");//发布结束时间
        if($companyname)$args[] = array("AND","user.company_name LIKE :company_name",'company_name',"%{$companyname}%");

        $contentarr = $this->content->getPurchaseListJoin($args,$page,10);
        $num = 1;
        foreach ($contentarr['data'] as $k => &$v) {
            //某条询价信息过了截止日期并且有人报价则修改为待定标状态
            $v['offernum'] = $this->content->getPurchseNumber($v['id']);
            if($v['status']==1){
                if ((time()>$v['end_time']) && $v['offernum']) {

                    $args1['status'] = 2;
                    $this->content->updatePurchase($v['id'],$args1);
                }elseif ((time()>$v['end_time']) && !$v['offernum']) {
                    //【时间截止如果没人报价则修改为已终止4】
                    $args1['status'] = 4;
                    $this->content->updatePurchase($v['id'],$args1);
                }

            }

            $v['ordernum'] = ($page-1)*5+$num++;

            if ($v['end_time']-172800 >=TIME) {
                $v['lasttime'] = 1;
            } else {
                $v['lasttime'] = 2;
            }
        }
        if ($stime && $etime) {
            $stime = date('Y-m-d H:i:s',$stime);
            $etime = date('Y-m-d H:i:s',$etime);
            if ($stime)$this->tpl->assign('stime',$stime);
            if ($etime)$this->tpl->assign('etime',$etime);
        }

        $this->tpl->assign('contentarr',$contentarr);
        $this->tpl->assign('companyname',$companyname);
        $this->tpl->assign('keyword',$keyword);
        $this->tpl->assign('type',$type);
        $this->tpl->assign('status',$status);
        if ($stime) {
            $stime = date('Y-m-d H:i:s',$stime);
            if ($stime)$this->tpl->assign('stime',$stime);
        }

        if ($etime) {
            $etime = date('Y-m-d H:i:s',$etime);
            if ($etime)$this->tpl->assign('etime',$etime);
        }

        $this->tpl->display('inquiry');
    }

}

?>
