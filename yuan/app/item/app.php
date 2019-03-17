<?php

class app
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->sql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');

        $this->ev = $this->G->make('ev');
        $this->tpl = $this->G->make('tpl');
        $this->module = $this->G->make('module');
        $this->category = $this->G->make('category');

        $this->item = $this->G->make('item','item');
        $this->cart = $this->G->make('cart','item');
        $this->brand = $this->G->make('brand','item');
        $this->pos = $this->G->make('position','content');
        $this->session = $this->G->make('session');
        $this->user = $this->G->make('user','user');
		$this->order = $this->G->make('orders','bank');
		$this->address = $this->G->make('address','user');
        $this->_user = $this->session->getSessionUser();
        $this->msg = $this->G->make('msg','user');
        $this->tpl->assign('_user',$this->user->getUserById($this->_user['sessionuserid']));
        $weekarray = array("日","一","二","三","四","五","六");
        $dateTime = date('Y-m-d',time()) . ' 星期' . $weekarray[date('w')];
        $this->tpl->assign('dateTime',$dateTime);
        $this->tpl->assign('userhash',$this->ev->get('userhash'));
        if($this->_user)
        {
            $user = $this->user->getUserById($this->_user['sessionuserid']);
            //var_dump($this->_user['sessionrandcode'],$user['session_id']);die;
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
    }
}

?>