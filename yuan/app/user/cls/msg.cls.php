<?php

class msg_user
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->sql = $this->G->make('sql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
		$this->user = $this->G->make('user','office');
        $this->pdosql = $this->G->make('pdosql');
	}

	public function getMessageList($page,$userid)
	{
		$data = array(false,'message',"messageposter = '{$userid}' OR messagereciver = '{$userid}'",false,"messageid DESC",false);
		$sql = $this->sql->makeSelect($data);
		$data = array(
			'select' => false,
			'table' => "(".$sql.")",
			'index' => false,
			'serial' => false,
			'query' => 1,
			'orderby'=>'messageid DESC',
			'groupby' => 'messagerelative',
		);
		return $this->db->listElements($page,20,$data,0);
	}

	public function getMessageListContents($page,$relative)
	{
		$data = array(
			'select' => false,
			'table' => 'message',
			'index' => false,
			'serial' => false,
			'query' => "messagerelative = '{$relative}'",
			'orderby' => 'messageid DESC',
			'groupby' => false
		);
		return $this->db->listElements($page,20,$data);
	}

	public function getNewMessageByUserid($userid)
	{
		$data = array(false,'message',array("messagereciver = '{$userid}'","messagestatus = 0"));
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function readMessage($messagerelative,$userid)
	{
		$data = array('message',array('messagestatus'=>1),"messagereciver = '{$userid}'");
		$sql = $this->sql->makeUpdate($data);
		$this->db->exec($sql);
		return $this->db->affectedRows();
	}

	public function sendMessage($poster,$reciver,$content)
	{

		$users = $this->user->getUsersByArgs("userid IN (".$reciver.','.$poster.")");
		$args = array('messagetime'=>TIME,'messageposter'=>$poster,'messagepostername'=>$users[$poster]['username'],'messagereciver'=>$reciver,'messagerecivername'=>$users[$reciver]['username']);
		$args['messagecontent'] = $content;
		if($poster > $reciver)$args['messagerelative'] = $reciver.'-'.$poster;
		else $args['messagerelative'] = $poster.'-'.$reciver;
		$data = array('message',$args);
		$sql = $this->sql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

    public function sendMsg($data,$type)
    {
        switch ($type)
        {
            case 1:
                $url = 'index.php?user-company-orders-orderdetails&sn='.$data['ordersn'];
                $args = array(
                    'msg_userid' => $data['orderitems'][0]['goodsuserid'],
                    'msg_title' => '您有新的订单',
                    'msg_time' => time(),
                    'msg_url' => $url,
                    'status' => 0
                );
                break;
            case 2:
                $url = '';
                $args = array(
                    'msg_userid' => $data['seller_userid'],
                    'msg_title' => '您有发货提醒消息',
                    'msg_time' => time(),
                    'msg_url' => $url,
                    'msg_content' => $data['msg_content'],
                    'status' => 0
                );
                break;
            case 3:
                //卖家发货提醒买家
                $args = array(
                    'msg_userid' => $data['orderuserid'],
                    'msg_title' => '您的订单有发货提醒',
                    'msg_time' => time(),
                    'msg_url' => $data['msg_url'],
                    'msg_content' => $data['msg_content'],
                    'status' => 0
                );
                break;
            case 4:
                //买家收货提醒卖家
                $args = array(
                    'msg_userid' => $data['ordersalerid'],
                    'msg_title' => '您有收货提醒消息',
                    'msg_time' => time(),
                    'msg_url' => $data['msg_url'],
                    'msg_content' => $data['msg_content'],
                    'status' => 0
                );
                break;
            default:
                $url = 'index.php?purchase-app-content&purchaseid='.$data['purchaseid'];
                $args = array(
                    'msg_userid' => $data['purchaseuserid'],
                    'msg_title' => '您的采购信息有新的报价',
                    'msg_time' => time(),
                    'msg_url' => $url,
                    'status' => 0
                );
        }


        return $this->db->insertElement(array('table' => 'message','query' => $args));
    }

    public function getCompanyMsgList($args,$page,$limit)
    {
        $data = array(
            'select' => false,
            'table' => 'message',
            'query' => $args,
            'orderby' => 'msg_id DESC'
        );
        $r = $this->db->listElements($page,$limit,$data);
        return $r;
    }

    public function modifyMsgStatus($args)
    {
        $data = array(
            'table' => 'message',
            'value' => $args,
            'query' => array(array('AND',"msg_id = :msg_id",'msg_id',$args['msg_id']))
        );
        return $this->db->updateElement($data);
    }

    //系统消息发送
    public function systemSendMsg($args)
    {
        return $this->db->insertElement(array('table' => 'message','query' => $args));
    }

    public function getMsgByid($msg_id)
    {
        $data = array(false,'message',array(array('AND',"msg_id = :msg_id",'msg_id',$msg_id)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }


    //修改跳转地址
    public function modifyMsgUrl($id,$args)
    {
        $data = array(
            'table' => 'message',
            'value' => $args,
            'query' => array(array('AND',"msg_id = :msg_id",'msg_id',$id))
        );
        return $this->db->updateElement($data);
    }

    public function delMsg($id)
    {
        return $this->db->delElement(array('table' => 'message','query' => array(array("AND","msg_id = :msg_id",'msg_id',$id))));
    }

    /**
     * 获取商品总数或今日新增数 istody为false查总数 否则查今日新增数
     */
    public function getMsgCount($istody=false){
        $firttime = strtotime(date("Y-m-d 00:00:01"));
        $endtime =  strtotime(date("Y-m-d 23:59:59"));
        $data = array();
        if($istody){
            $sql = 'SELECT count(*) as aa FROM `x2_message` where  msg_time >='.$firttime.' and msg_time <='. $endtime;
        }else{
            $sql = 'SELECT count(*) as aa FROM `x2_message`';
        }
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        if($r['0']['aa']==null){
            return 0;
        }else{
            return $r['0']['aa'];
        }
    }

}

?>