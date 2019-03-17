<?php

class app
{
	public $G;

	//初始化信息
	public function __construct(&$G)
	{
		$this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->session = $this->G->make('session');
		$this->user = $this->G->make('user','user');
		$this->_user = $_user = $this->session->getSessionUser();
		$group = $this->user->getGroupById($_user['sessiongroupid']);
		if($group['groupmoduleid'] != 1)
		{
			if($this->ev->get('userhash'))
			exit(json_encode(array(
				'statusCode' => 301,
				"message" => "请您重新登录",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?core-master-login"
			)));
			else
			{
				header("location:?core-master-login");
				exit;
			}
		}

		// 单点登陆
        $user = $this->user->getUserById($_user['sessionuserid']);
        if($this->_user)
        {
            if($this->_user['sessionrandcode'] != $user['session_id'])
            {
                $this->session->clearSessionUser();
                session_destroy();
                $message = array(
                    'statusCode' => 201,
                    "message" => "您已在别处登录如果不是本人，请及时修改密码",
                    "callbackType" => 'forward',
                    "forwardUrl" => "index.php?".$this->G->defaultApp
                );
                $this->G->R($message);
                exit;
            }
        }
		//生产一个对象
		$this->tpl = $this->G->make('tpl');
		$this->pdosql = $this->G->make('pdosql');
		$this->sql = $this->G->make('sql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->html = $this->G->make('html');
		$this->files = $this->G->make('files');
		$this->apps = $this->G->make('apps','core');
		$this->basic = $this->G->make('basic','exam');
		$this->area = $this->G->make('area','exam');
		$this->section = $this->G->make('section','exam');
		$this->exam = $this->G->make('exam','exam');
		$this->favor = $this->G->make('favor','exam');
		$this->module = $this->G->make('module');
		$this->tpl->assign('action',$this->ev->url(2)?$this->ev->url(2):'exams');
		$user = $this->user->getUserById($_user['sessionuserid']);
		$user['manager_apps'] = unserialize($user['manager_apps']);
		$this->tpl->assign('_user',$user);
		$localapps = $this->apps->getLocalAppList();
		$apps = $this->apps->getAppList();
		if(!in_array($this->G->app,$user['manager_apps']) && $apps['user']['appsetting']['managemodel'])
		{
			header("location:index.php?core-master");
			exit();
		}
		$this->tpl->assign('sectionorder',array(1=>'第一章','第二章','第三章','第四章','第五章','第六章','第七章','第八章','第九章','第十章','第十一章','第十二章','第十三章','第十四章','第十五章','第十六章','第十七章','第十八章','第十九章','第二十章','第二十一章','第二十二章'));
		$this->tpl->assign('ols',array(1=>'一','二','三','四','五','六','七','八','九','十','十一','十二','十三','十四','十五','十六','十七','十八','十九','二十'));
		$this->tpl->assign('userhash',$this->ev->get('userhash'));
		$localapps = $this->apps->getLocalAppList();
		$apps = $this->apps->getAppList();
		$this->tpl->assign('localapps',$localapps);
		$this->tpl->assign('apps',$apps);
	}
}

?>