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
		$this->category = $this->G->make('category');
		$this->module = $this->G->make('module');
		$this->msg = $this->G->make('msg','user');
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function modifyorder()
	{
		$oid = $this->ev->get('ordersn');
		$order = $this->orders->getOrderById($oid);
		$orderstatus = $this->ev->get('orderstatus');
		$reason = $this->ev->get('reason');
		if($orderstatus && $reason)
		{
			$faq = array();
			$faq['reason'] = $reason;
			$faq['prestatus'] = $order['orderstatus'];
			$faq['status'] = $orderstatus;
			$faq['username'] = $this->_user['sessionusername'];
			$faq['time'] = TIME;
			$args = array();
			$args['orderstatus'] = $orderstatus;
			$args['orderfaq'] = $order['orderfaq'];
			$args['orderfaq'][] = $faq;
			if($orderstatus == 4)
			{
				if(!$order['orderfinishtime'])
				$args['orderfinishtime'] = TIME;
				$coin = 0;
				foreach($order['orderitems'] as $item)
				{
					$coin = $coin + $item['number']*$item['itemprice']*$item['goodsproperty']['itemcoin'];
				}
				$user = $this->user->getUserById($order['orderuserid']);
				$coin = $coin + $user['usercoin'];
				if($order['ordersalerid'] != 139)
				$this->user->modifyUserInfo(array('usercoin' => $coin),$order['orderuserid']);
				if(!$order['ordergivecoin'])
				$args['ordergivecoin'] = 1;
			}
			$this->orders->modifyOrderById($oid,$args);
			$message = array(
				'statusCode' => 200,
				"message" => "订单修改成功",
			    "callbackType" => 'forward',
			    "forwardUrl" => "reload"
			);
			exit(json_encode($message));
		}
		$message = array(
			'statusCode' => 300,
			"message" => "订单操作失败"
		);
		exit(json_encode($message));
	}

	private function sendorder()
	{
		$oid = $this->ev->get('ordersn');
		$order = $this->orders->getOrderById($oid);
		//---卖家的详细信息----
		$userinfo = $this->user->getUserById($order['ordersalerid']);

		if($order['orderstatus'] == 2)
		{
			$postname = $this->ev->get('postname');
			$postorder = $this->ev->get('postorder');
			$seller_message = $this->ev->get('seller_message');
			if($postname && $postorder)
			{
				$args = array();
				$args['orderpost'] = array('postname' => $postname,'postorder' => $postorder);
				$args['ordersendtime'] = TIME;
				$args['orderfactfee'] = $this->ev->get('orderfactfee');;
				$args['orderstatus'] = 3;
				$args['status_qufen'] = 3;
				$args['seller_message'] = $seller_message;
				$this->orders->modifyOrderById($oid,$args);

				//---------------插入发货消息start-----------------------
				$data  = array();
				$data['orderuserid'] = $order['orderuserid'];//买家
				$data['msg_content'] = '卖方'.$userinfo['company_name'].'已发货,订单号为:'.$oid;
				$messageid = $this->msg->sendMsg($data,3);


				$url = 'index.php?user-company-message-messageinfo&msg_id='.$messageid;
				$args1 = array();
				$args1['msg_url'] = $url;
				$this->msg->modifyMsgUrl($messageid,$args1);
				//---------------插入发货消息end-------------------------

				$message = array(
					'statusCode' => 200,
					"message" => "订单发货成功",
				    "callbackType" => 'forward',
				    "forwardUrl" => "reload"
				);
				exit(json_encode($message));
			}
		}
		$message = array(
			'statusCode' => 300,
			"message" => "订单操作失败"
		);
		exit(json_encode($message));
	}

	private function remove()
	{
		$oid = $this->ev->get('ordersn');
		$order = $this->orders->getOrderById($oid);
		if($order['orderstatus'] == 1 || $order['orderstatus'] == 99)
		{
			$this->orders->delOrder($oid);
			$message = array(
				'statusCode' => 200,
				"message" => "订单删除成功",
			    "callbackType" => 'forward',
			    "forwardUrl" => "reload"
			);
		}
		else
		$message = array(
			'statusCode' => 300,
			"message" => "订单操作失败"
		);
		exit(json_encode($message));
	}

	private function batremove()
	{
		$delids = $this->ev->get('delids');
		foreach($delids as $oid => $p)
		{
			$order = $this->orders->getOrderById($oid);
			if($order['orderstatus'] == 1 || $order['orderstatus'] == 99)
			{
				$this->orders->delOrder($oid);
			}
		}
		$message = array(
			'statusCode' => 200,
			"message" => "订单删除成功",
		    "callbackType" => 'forward',
		    "forwardUrl" => "reload"
		);
		exit(json_encode($message));
	}

	private function orderdetail()
	{
		$sn = $this->ev->get('sn');
		$order = $this->orders->getOrderById($sn);
		$this->category->app = 'item';
		$categories = $this->category->getCategoriesByArgs();
        $modules = $this->module->getModulesByApp('item');
        $mfields = array();
        foreach($modules as $p)
        {
            $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'],1);
        }
        $saler = $this->user->getUserById($order['ordersalerid']);
        if($saler['usergroupid'] == 3)
        {
        	$upline = $this->user->getUserById($saler['teacher_upline']);
        	$this->tpl->assign('upline',$upline);
        }
		$this->tpl->assign('saler',$saler);
		$this->tpl->assign('order',$order);
		$this->tpl->assign('categories',$categories);
        $this->tpl->assign('mfields',$mfields);
		$this->tpl->display('orderdetail');
	}

	private function index()
	{
		$search = $this->ev->get('search');
		$type = $this->ev->get('type');
		$page = intval($this->ev->get('page'));
		$u = '';
		if($search)
		{
			$this->tpl->assign('search',$search);
			foreach($search as $key => $arg)
			{
				$u .= "&search[{$key}]={$arg}";
			}
		}
		$this->tpl->assign('u',$u);
		$this->tpl->assign('page',$page);
		$args = array();
		if(!$type)
		{
			$time = strtotime(date('Y-m'));
			$args[] = array("AND","ordercreatetime >= :ordercreatetime","ordercreatetime",$time);
		}
		elseif($type == 1)
		{
			$time = strtotime(date('Y-m'));
			$stime = strtotime(date('Y-m',$time-3600));
			$args[] = array("AND","ordercreatetime >= :ordercreatetime","ordercreatetime",$stime);
			$args[] = array("AND","ordercreatetime < :eordercreatetime","eordercreatetime",$time);
		}
		else
		$args = 1;
		$this->category->app = 'item';
		$categories = $this->category->getCategoriesByArgs();
        $modules = $this->module->getModulesByApp('item');
        $mfields = array();
        foreach($modules as $p)
        {
            $mfields[$p['moduleid']] = $this->module->getMoudleFields($p['moduleid'],1);
        }
        $this->tpl->assign('type',$type);
		$this->tpl->assign('categories',$categories);
        $this->tpl->assign('mfields',$mfields);
		$orders = $this->orders->getOrderList($args,$page);
		$this->tpl->assign('orders',$orders);
		$this->tpl->display('orders');
	}
}


?>
