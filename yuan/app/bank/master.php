<?php

class app
{
	public $G;
	public $_user;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->session = $this->G->make('session');
		$this->tpl = $this->G->make('tpl');
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->files = $this->G->make('files');
		$this->apps = $this->G->make('apps','core');
		$this->user = $this->G->make('user','user');
		$this->_user = $_user = $this->session->getSessionUser();
		$group = $this->user->getGroupById($_user['sessiongroupid']);
		if(!$_user['sessionuserid'])
		{
			if($this->ev->get('userhash'))
			exit(json_encode(array(
				'statusCode' => 300,
				"message" => "请您重新登录",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?core-master-login"
			)));
			else
			header("location:index.php?core-master-login");
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
		$this->tpl->assign('_user',$this->user->getUserById($_user['sessionuserid']));
		$this->tpl->assign('action',$this->ev->url(2)?$this->ev->url(2):'user');
		$localapps = $this->apps->getLocalAppList();
		$apps = $this->apps->getAppList();
		$this->tpl->assign('localapps',$localapps);
		$this->tpl->assign('apps',$apps);
		$this->orders = $this->G->make('orders','bank');
		$orderstatus = array(1=>'待支付',2=>'待发货',3=>'待收货',4 => '已完成',99 =>'已取消');
		$this->tpl->assign('orderstatus',$orderstatus);
	}
}

?>