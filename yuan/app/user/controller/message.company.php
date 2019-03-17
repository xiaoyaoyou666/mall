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
        $modules = $this->module->getModulesByApp('message');
        $this->msg = $this->G->make('msg','user');
        $this->tpl->assign('modules',$modules);
        $action = $this->ev->url(3);
        $this->link = $this->G->make('link','content');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->tpl->assign('links',$links);

        $this->cart = $this->G->make('cart','item');
        $cartNumArr = $this->cart->getCartUserNum();
        foreach ($cartNumArr as $k => $v) {
            $cartnums[] = $v['number'];
        }
        $cartNum = array_sum($cartnums)?array_sum($cartnums):0;
        $this->tpl->assign('cartNum',$cartNum);
        if(!method_exists($this,$action))
            $action = "index";
        $this->$action();
        exit;
    }

    private function message()
    {
        $page = intval($this->ev->get('page'));
        $page = $page?$page:1;
        $args = array();
        $userid = $this->_user['sessionuserid'];
        $args[] = array("AND","msg_userid = :msg_userid",'msg_userid',$userid);
        $data = $this->msg->getCompanyMsgList($args,$page,10);

        $this->tpl->assign('page',$page);
        $this->tpl->assign('data',$data);
        $this->tpl->display('message');
    }


    private function messageinfo()
    {
        $msg_id = intval($this->ev->get('msg_id'));
        if($msg_id)
        {
            $this->msg->modifyMsgStatus(array('msg_id' => $this->ev->get('msg_id'), 'status' => 1));
            $data = $this->msg->getMsgByid($msg_id);
            $this->tpl->assign('data',$data);
        }
        $this->tpl->display('messageinfo');
    }

    private function del()
    {
        $page = intval($this->ev->get('page'));
        $msgid = intval($this->ev->get('msg_id'));
        $this->msg->delMsg($msgid);
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => "forward",
            "forwardUrl" => "reload"
        );
        exit(json_encode($message));
    }

    private function delall()
    {
        $ids = $this->ev->get('delids');
        if($ids)
        {
            foreach($ids as $key => $id)
            {
                $this->msg->delMsg($key);
            }
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "请选择一个信息"
            );
            exit(json_encode($message));
        }

    }




}

?>
