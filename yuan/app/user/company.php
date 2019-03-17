<?php
session_start();
class app
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->tpl = $this->G->make('tpl');
		$this->sql = $this->G->make('sql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
        $this->pdosql = $this->G->make('pdosql');
		$this->html = $this->G->make('html');
		$this->module = $this->G->make('module');
		$this->session = $this->G->make('session');
		$this->files = $this->G->make('files');
		$this->user = $this->G->make('user','user');
		$this->order = $this->G->make('orders','bank');
        $this->msg = $this->G->make('msg','user');
		$this->attach = $this->G->make('attach','document');
		$this->_user = $_user = $this->session->getSessionUser();
		if(!$_user['sessionuserid'])
		{
			if($this->ev->get('userhash'))
			exit(json_encode(array(
				'statusCode' => 301,
				"message" => "请您重新登录",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?user-app-login"
			)));
			else
			{
				header("location:index.php?user-app-login");
				exit;
			}
		}
        // 单点登陆
        $user = $this->user->getUserById($_user['sessionuserid']);
//		if($this->_user)
//        {
//            if($this->_user['sessionrandcode'] != $user['session_id'])
//            {
//                $this->session->clearSessionUser();
//                session_destroy();
//                $message = array(
//                    'statusCode' => 201,
//                    "message" => "您已在别处登录如果不是本人，请及时修改密码",
//                    "callbackType" => 'forward',
//                    "forwardUrl" => "index.php?".$this->G->defaultApp
//                );
//                $this->G->R($message);
//                exit;
//            }
//        }
        // 结束
        if($user['groupmoduleid'] == 2)
        {
            header("location:index.php?user-center");
            exit;
        }
		$this->allowexts = $this->attach->getAllowAttachExts();

        $groups = $this->user->getUserGroups();
        //头部时间日期星期几
        $weekarray = array("日","一","二","三","四","五","六");
        $dateTime = date('Y-m-d',time()) . ' 星期' . $weekarray[date('w')];
        $msgList = $this->getCompanyMsg();

        $args[] = array("AND","msg_userid = :msg_userid",'msg_userid',$_user['sessionuserid']);
        $args[] = array("AND","status = 0");
        $data = $this->msg->getCompanyMsgList($args,1,99);
        $this->tpl->assign('msgnum',$data['number']);

        $this->tpl->assign('dateTime',$dateTime);
        $this->tpl->assign('groups',$groups);
        $this->tpl->assign('_user',$user);
        $this->tpl->assign('userhash',$this->ev->get('userhash'));
        $this->tpl->assign('msgList',$msgList);
	}

    private function getCompanyMsg()
    {
        $userid = $this->_user['sessionuserid'];
        $args[] = array("AND","msg_userid = :msg_userid",'msg_userid',$userid);
        $args[] = array("AND","status = 0");
        $data = $this->msg->getCompanyMsgList($args,1,4);
        return $data;
    }

}

?>