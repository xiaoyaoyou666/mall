<?php

class app
{
	public $G;
	public $data = array();
	public $sessionvars;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->tpl = $this->G->make('tpl');
		$this->sql = $this->G->make('sql');
		$this->pesql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->module = $this->G->make('module');
		$this->html = $this->G->make('html');
		$this->session = $this->G->make('session');
		$this->user = $this->G->make('user','user');
		$this->item = $this->G->make('agreement','agreement');
		$this->item = $this->G->make('agreementgoods','agreement');
		$groups = $this->user->getUserGroups();
		$this->tpl->assign('groups',$groups);
		$this->tpl->assign('userhash',$this->ev->get('userhash'));
		$this->_user = $_user = $this->session->getSessionUser();
        //头部时间日期星期几
        $weekarray = array("日","一","二","三","四","五","六");
        $dateTime = date('Y-m-d',time()) . ' 星期' . $weekarray[date('w')];
        $this->tpl->assign('dateTime',$dateTime);
        $this->tpl->assign('_user',$this->_user);
        $checkloginlist = array(
            0 => 'logout',
            1 => 'register',
        );
		if($_user['sessionuserid'] && !in_array($this->ev->url(2),$checkloginlist))
		{
			if($this->ev->get('userhash'))
			exit(json_encode(array(
				'statusCode' => 200,
				"message" => "您已经登录",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?".$this->G->defaultApp
			)));
			else
			{
				header("location:index.php?".$this->G->defaultApp);
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
	}
}

?>