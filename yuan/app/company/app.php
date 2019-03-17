<?php


class app
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->tpl = $this->G->make('tpl');
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');

		$this->db = $this->G->make('pdodb');
        $this->module = $this->G->make('module');
		$this->pg = $this->G->make('pg');
		$this->html = $this->G->make('html');
		$this->files = $this->G->make('files');
		$this->session = $this->G->make('session');
		$this->category = $this->G->make('category');
		$this->course = $this->G->make('course','course');
		$this->content = $this->G->make('content','content');
		$this->user = $this->G->make('user','user');
        $this->msg = $this->G->make('msg','user');
		$this->_user = $_user = $this->session->getSessionUser();
		$this->tpl->assign('_user',$this->user->getUserById($this->_user['sessionuserid']));
		$rcats = $this->category->getCategoriesByArgs(array(array("AND","catparent = '0'")));
        $weekarray = array("日","一","二","三","四","五","六");
        $dateTime = date('Y-m-d',time()) . ' 星期' . $weekarray[date('w')];
        $this->tpl->assign('dateTime',$dateTime);
		$this->tpl->assign('rcats',$rcats);
        if($this->_user)
        {
            $user = $this->user->getUserById($this->_user['sessionuserid']);
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
            $args[] = array("AND","msg_userid = :msg_userid",'msg_userid',$this->_user['sessionuserid']);
            $args[] = array("AND","status = 0");
            $data = $this->msg->getCompanyMsgList($args,1,99);
            $this->tpl->assign('msgnum',$data['number']);
        }
        // $args[] = array("AND","msg_userid = :msg_userid",'msg_userid',$_user['sessionuserid']);
        // $args[] = array("AND","status = 0");
        // $data = $this->msg->getCompanyMsgList($args,1,99);
        // $this->tpl->assign('msgnum',$data['number']);



	}
}

?>