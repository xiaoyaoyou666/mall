<?php

class orders_bank
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	private function _autoFinishOrder()
	{
		$etime = TIME - 24*3600*10;
		$data = array(false,"orders",array(array("AND","orderstatus = 3"),array("AND","ordersendtime < :ordersendtime","ordersendtime",$etime)));
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetchAll($sql,false,array('orderitems','orderaddress','orderpost','orderfaq'));
		foreach($r as $o)
		{
			$coin = 0;
			foreach($o['orderitems'] as $item)
			{
				$coin = $coin + $item['number']*$item['itemprice']*$item['goodsproperty']['itemcoin'];
			}
			$user = $this->user->getUserById($o['orderuserid']);
			$coin = $coin + $user['usercoin'];
			if($o['ordersalerid'] != 139)
			$this->user->modifyUserInfo(array('usercoin' => $coin),$o['orderuserid']);
			$faq = array();
			$faq['reason'] = '自动收货';
			$faq['prestatus'] = $o['orderstatus'];
			$faq['status'] = 4;
			$faq['username'] = '系统自动';
			$faq['time'] = TIME;
			$o['orderfaq'][] = $faq;
			if($o['ordergivecoin'])
			$this->modifyOrderById($o['ordersn'],array('orderstatus' => 4,'orderfinishtime' => TIME,'orderfaq' => $o['orderfaq']));
			else
			$this->modifyOrderById($o['ordersn'],array('orderstatus' => 4,'ordergivecoin' => 1,'orderfinishtime' => TIME,'orderfaq' => $o['orderfaq']));
		}
		$etime = TIME - 24*3600;
		$data = array("orders",array("orderstatus" => 99),array(array("AND","orderstatus = 1"),array("AND","ordercreatetime < :ordercreatetime","ordercreatetime",$etime)));
		//$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
	}

	public function _init()
	{
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->ev = $this->G->make('ev');
		$this->pg = $this->G->make('pg');
		$this->user = $this->G->make('user','user');
		$this->files = $this->G->make('files');
        $this->setorder=$this->G->make('setorder','core');
		$this->meruser = $this->G->make('meruser', 'user');
		$this->yeeorder = $this->G->make('yeeorder', 'user');
		$this->session = $this->G->make('session');
		$this->_user = $_user = $this->session->getSessionUser();
		$this->_autoFinishOrder();
	}

	public function allUplineByUserid($salerid)
	{
		$data = array("sum(ulfirstprice) as sumulfirstprice,sum(ulsecondprice) as sumulsecondprice",'upline',array(array("AND","ulsalerid = :ulsalerid",'ulsalerid',$salerid)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getOrderAllotByMonth($year,$month,$salerid)
	{
		$smonth = $month;
		$stime = strtotime($year.'-'.$smonth.'-1');
		$emonth = $month + 1;
		if($emonth > 12)
		{
			$emonth = $emonth - 12;
			$year ++;
		}
		$etime = strtotime($year.'-'.$emonth.'-1');
		if(is_array($salerid))
		{
			$salerid = implode(",",$salerid);
			$data = array("count(*) as number,sum(orderfirstprice) as firstprice,sum(ordersecondprice) as secondprice,sum(orderfactfee) as factfee,sum(orderprice) as price",'orders',array(array("AND","orderfinishtime >= :sordersendtime",'sordersendtime',$stime),array("AND","orderfinishtime < :eordersendtime",'eordersendtime',$etime),array("AND","find_in_set(ordersalerid,:ordersalerid)",'ordersalerid',$salerid),array("AND","orderstatus = 4")));
		}
		else
		$data = array("count(*) as number,sum(orderfirstprice) as firstprice,sum(ordersecondprice) as secondprice,sum(orderfactfee) as factfee,sum(orderprice) as price",'orders',array(array("AND","orderfinishtime >= :sordersendtime",'sordersendtime',$stime),array("AND","orderfinishtime < :eordersendtime",'eordersendtime',$etime),array("AND","ordersalerid = :ordersalerid",'ordersalerid',$salerid),array("AND","orderstatus = 4")));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getOrderAllotListByMonth($year,$month,$salerid,$page,$number = 20)
	{
		$smonth = $month;
		$stime = strtotime($year.'-'.$smonth.'-1');
		$emonth = $month + 1;
		if($emonth > 12)
		{
			$emonth = $emonth - 12;
			$year ++;
		}
		$etime = strtotime($year.'-'.$emonth.'-1');
		if(is_array($salerid))
		{
			$salerid = implode(",",$salerid);
			$args = array(array("AND","orderfinishtime >= :sordersendtime",'sordersendtime',$stime),array("AND","orderfinishtime < :eordersendtime",'eordersendtime',$etime),array("AND","find_in_set(ordersalerid,:ordersalerid)",'ordersalerid',$salerid),array("AND","orderstatus = 4"));
		}
		else
		$args = array(array("AND","orderfinishtime >= :sordersendtime",'sordersendtime',$stime),array("AND","orderfinishtime < :eordersendtime",'eordersendtime',$etime),array("AND","ordersalerid = :ordersalerid",'ordersalerid',$salerid),array("AND","orderstatus = 4"));
		return $this->getOrderList($args,$page,$number);
	}

	public function getUserDownLine($salerid)
	{
		$users = $this->user->getUsersByArgs(array(array("AND","teacher_upline = :teacher_upline","teacher_upline",$salerid)));
		$salers = array();
		foreach($users as $p)
		{
			$salers[] = $p['userid'];
		}
		return $salers;
	}

	public function getUlById($ulid)
	{
		$data = array(false,'upline',array(array("AND","ulid = :ulid","ulid",$ulid)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	 //insert  order 详情表
	public function addOrderdetail($args)
	{
		return $this->db->insertElement(array('table' => 'orderdetail','query' => $args));
	}

	public function modifyUl($ulid,$args)
	{
		$data = array('upline',$args,array(array("AND","ulid = :ulid","ulid",$ulid)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function updateSecondAgentCount($year,$month,$salerid)
	{
		$nyear = date('Y');
		$nmonth = date('m');
		$data = array(false,'upline',array(array("AND","ulsalerid = :ulsalerid","ulsalerid",$salerid),array("AND","ulyear = :ulyear","ulyear",$year),array("AND","ulmonth = :ulmonth","ulmonth",$month)));
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		if(!$r)
		{
			$rs = $this->getOrderAllotByMonth($year,$month,$salerid);
			$args = array('ulsalerid' => $salerid,'ulyear' => $year,'ulmonth' => $month,'ulfirstprice' => $rs['firstprice'],'ulsecondprice' => $rs['secondprice'],'ulfactfee' => $rs['factfee'],'ulprice' => $rs['price'],'ulordernumber' => $rs['number']);
			if(($nyear == $year) && ($nmonth == $month))
			{
				//print_r($rs);
			}
			else
			{
				$id = $this->db->insertElement(array('table' => 'upline','query' => $args));
				$args['ulid'] = $id;
			}
			$r = $args;
		}
		return $r;
	}

	public function updateFirstAgentCount($year,$month,$salerid)
	{
		$nyear = date('Y');
		$nmonth = date('m');
		$data = array(false,'upline',array(array("AND","ulsalerid = :ulsalerid","ulsalerid",$salerid),array("AND","ulyear = :ulyear","ulyear",$year),array("AND","ulmonth = :ulmonth","ulmonth",$month)));
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		if(!$r)
		{
			$users = $this->user->getUsersByArgs(array(array("AND","teacher_upline = :teacher_upline","teacher_upline",$salerid)));
			$salers = array();
			foreach($users as $p)
			{
				$salers[] = $p['userid'];
			}
			$rs = $this->getOrderAllotByMonth($year,$month,$salers);
			$rps = $this->getOrderAllotByMonth($year,$month,$salerid);


			$args = array('ulsalerid' => $salerid,'ulyear' => $year,'ulmonth' => $month,'ulfirstprice' => $rps['firstprice'],'ulsecondprice' => $rs['secondprice'],'ulfactfee' => $rps['factfee'],'ulprice' => $rs['price'],'ulordernumber' => $rps['number'],'uluordernumber' => $rs['number']);
			if(($nyear == $year) && ($nmonth == $month))
			{
				//print_r($rs);
			}
			else
			{
				$id = $this->db->insertElement(array('table' => 'upline','query' => $args));
				$args['ulid'] = $id;
			}
			$r = $args;
		}
		return $r;
	}

	/**
	 * 获取订单列表
	 * @param $args
	 * @param $page
	 * @param int $number
	 * @param string $order
	 * @return mixed
	 * 获取订单列表
	 */
	public function getOrderList($args,$page,$number = 10,$order = 'ordercreatetime DESC')
	{
		$data = array(
			'select' => false,
			'table' => 'orders',
			'query' => $args,
			'orderby' => $order,
			'serial' => array('orderitems','orderaddress','orderpost','buy_comment','seller_comment')
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

	/**
	 * 获取订单列表 - 废弃
	 * 1、区分B2B订单和sap订单
	 * 2、对于B2B订单，需要把订单中每个商家的商品进行归类
	 * @param $args
	 * @param $page
	 * @param int $number
	 * @param string $order
	 * @return mixed
	 * 获取订单列表
	 */
	public function getOrderListNew($args,$page,$number = 10,$order = 'ordercreatetime DESC')
	{
		$result = [];
		$orderData = [];
		$data = array(
			'select' => false,
			'table' => 'orders',
			'query' => $args,
			'orderby' => $order,
			'serial' => array('orderitems','orderaddress','orderpost','buy_comment','seller_comment')
		);
		
		$r = $this->db->listElements($page,$number,$data);
		//$userId = $this->_user['sessionuserid'];
		$totalCount = $this->yeeorder->countOrderNumByUid($data);
		
		if (!empty($r))
		{
			$result['pages'] = $r['pages'];
			$result['number'] = $r['number'];
			
			foreach ($r['data'] as $key => $orderRecord)
			{
				//1、判断订单类型
				if (!$orderRecord['order_type'])
				{
					//sap订单
					$orderData[] = $orderRecord;
				}
				else
				{
					//获取指定ordersn的订单
					$detailList = $this->yeeorder->getDataByOrderId($orderRecord['ordersn']);
					$stampArr = [];
					//然后按商户分类，放在一个order下
					foreach ($detailList as $dkey => $detailRecord)
					{
						$detailRecord['itemDetail'] = unserialize($detailRecord['itemDetail']);
						$stampArr[$detailRecord['goodsuserid']][] = $detailRecord;
					}

					//根据商户，让每个商户下的所有商品归到一个订单，但是他们的ordersn相同
					foreach ($stampArr as $stampKey => $stampRecord)
					{
						$info = null;
						$info = $orderRecord;
						$info['orderitems'] = null;
						$priceArr[$stampKey] = 0;
						//计算你每一个商家下所有订单的总价格
						foreach ($stampRecord as $key1 => $onerecord)
						{
							$priceArr[$stampKey] += $onerecord['totalprice'];
						}

						foreach ($stampRecord as $key2 => $value)
						{
							$info['orderprice'] = round($priceArr[$stampKey], 2);
							$info['sellerId'] = $value['goodsuserid'];
							$info['orderstatus'] = $value['logisticsStatus'];
							$info['orderitems'][] = $value['itemDetail'];
						}
						$orderData[] = $info;
					}
				}
			}

			$pages = $this->pg->outPage($this->pg->getPagesNumber($totalCount,$number),$page);
			$result['pages'] = $pages;
			$result['number'] = $totalCount;
			$result['data'] = $orderData;
		}

		//重新计算分页链接
		return $result;
	}

	public function modifyOrder($id,$args)
	{
		$data = array(
			'table' => 'orders',
			'value' => $args,
			'query' => array(array("AND","ordersn = :ordersn",'ordersn',$id))
		);
		return $this->db->updateElement($data);
	}

	public function addOrder($args)
	{
		$args['bt_updatetime'] = date("Y-m-d H:i:s");
		$args['bt_requestdate'] = date("Y-m-d H:i:s");
		return $this->db->insertElement(array('table' => 'orders','query' => $args));
	}

	public function getOrderById($id,$userid = '')
	{
		if($userid)
		$data = array(false,'orders',array(array("AND","ordersn = :ordersn",'ordersn',$id),array("AND","orderuserid = :orderuserid",'orderuserid',$userid)));
		else
		$data = array(false,'orders',array(array("AND","ordersn = :ordersn",'ordersn',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('orderitems','orderaddress','orderpost','orderfaq','buy_comment','seller_comment'));
	}

	public function getOrderByArgs($page,$number,$args)
	{
		$data = array(false,'orders',array($args));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function modifyOrderById($id,$args)
	{
		$data = array('orders',$args,array(array("AND","ordersn = :ordersn",'ordersn',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function addSaledItem($args)
	{
		return $this->db->insertElement(array('table' => 'saleditems','query' => $args));
	}

	public function getOrderCount($userid,$saler = 0,$args = '')
	{
        //客服中心统计总订单
        if(empty($userid))
        {
            $data = array("COUNT(IF(`orderstatus` != 99,true ,null)) AS number , SUM(IF(`orderstatus`!=99,`orderprice`,0)) AS price","orders",$args);
            $sql = $this->pdosql->makeSelect($data);
            $r = $this->db->fetch($sql);
            return $r;
            // return intval($r['number']);
        }
		// if($saler == 1) //卖家统计
		// {
		// 	$data = array("COUNT(*) AS number","orders",$args);
		// }
		// else //买家个人统计
		// {
		// 	$data = array("COUNT(*) AS number","orders",array(array("AND","orderuserid = :orderuserid",'orderuserid',$userid),$args));
		// }

		// $sql = $this->pdosql->makeSelect($data);
		// $r = $this->db->fetch($sql);
		// return intval($r['number']);
	}
    
    // 昨日订单
	public function getOrderCountsd($userid,$saler = 0,$argsy = '')
	{
        if(empty($userid))
        {
            $data = array("COUNT(IF(`orderstatus` != 99 , `ordersn` , 0)) AS number , SUM(IF(`orderstatus`!=99,`orderprice`,0)) AS price","orders",$argsy);
            $sql = $this->pdosql->makeSelect($data);
            $r = $this->db->fetch($sql);
            return $r;
        }
	}

	public function modifyOrderStatus($args,$ordersn)
	{
		$data = array('orders',$args,array(array("AND","ordersn = :ordersn",'ordersn',$ordersn)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function tidyorders($orders)
	{
		$this->user = $this->G->make('user','user');
		foreach($orders['data'] as $key => $val)
		{
			$salerid = $val['ordersalerid'];
			$user = $this->user->getUserById($salerid);
			$orders['data'][$key]['userqq'] = $user['userqq'];
		}
		return $orders;
	}
	//在线支付,获取卖家订单金额,以便财务
	public function getOrderfee($userid)
	{
	   $data = array("SUM(orderprice) AS fee",'orders',array(array("AND","ordersalerid = :ordersalerid",'ordersalerid',$userid),array("AND","orderpaytype = 1"),array("AND","orderpaystatus = 1"),array("AND","orderstatus = 3"),array("AND","finance_check = 1")));
	   $sql = $this->pdosql->makeSelect($data);
	   return $this->db->fetch($sql);
	}

    /******************记录更改状态日志************************/
    //记录每一个更改状态到日志文件
    public function insertLog($orderinfo)
    {
        $file  = 'log.txt';
        if($orderinfo['orderstatus'] == 1) $orderstatus = "未发货";
        elseif($orderinfo['orderstatus'] == 2) $orderstatus = "已发货";
        elseif($orderinfo['orderstatus'] == 3) $orderstatus = "已收货";
        else $orderstatus = "作废";
        $content = '订单号:'.$orderinfo['ordersn']."状态更改为:".$orderstatus.",操作人:".$orderinfo['optionuser'].",操作时间：[".date("Y-m-d H:i:s",time())."]";
        if($f  = file_put_contents($file, $content.PHP_EOL,FILE_APPEND)){
            return true;
        }
        else
        {
            return false;
        }

    }

    //订单投诉入库
    public function insertOrderComplaint($args)
    {
        $data = array('complaint',$args);
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        return $this->db->lastInsertId();
    }

    //订单删除
    public function delOrder($id)
    {
        $data = array('orders',array(array('AND',"id = :id",'id',$id)));
        $sql = $this->pdosql->makeDelete($data);
        return $this->db->exec($sql);
    }

    /**
     * 根据用户id和状态查询出总数 我的采购
     * @param $userid      用户id
     * @param $orderstatus 订单状态,不传状态值时查询全部状态数
     * @return  总数
     */
    public function countOrderStatusOfOrderBuy($userid,$orderstatus=false,$type=false)
	{
		if(!$orderstatus){
            $sql = 'SELECT count(*) as aa FROM `x2_orders` where `orderuserid`='. $userid.' AND `del`=0';
		}else{
            $sql = 'SELECT count(*) as aa FROM `x2_orders` where `orderuserid`='. $userid .' AND `orderstatus`='.$orderstatus.' AND `isdel`=0';
		}
        if($type==2) {
            $time = strtotime(date('Y-m'));
            $sql .= ' AND `ordercreatetime`>='.$time.';';
        }elseif($type == 1){
            $time = strtotime(date('Y-m'));
            $stime = strtotime(date('Y-m',$time-3600));
            $sql .= ' AND `ordercreatetime`>='.$stime.' AND `ordercreatetime`<'.$time.';';
        }else{
            //后台控制前台时间订单的展示
//            $arr= $this->setorder->getStatisticsList();
//            $time = time();
//            $a=$arr['cfgorder'];
//            $outtime = strtotime(date('Y-m-d H:i:s', strtotime("-$a days")));
//            $sql .= ' AND `ordercreatetime`<'.$time.' AND `ordercreatetime`>'.$outtime.';';
        }
		$data = array();
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r['0']['aa'];
		
	}

    /**
	 * 卖家 我的销售
     * 根据用户id和状态查询出总数或用户id下所有状态总数
     * @param $userid      用户id
     * @param $orderstatus 订单状态 不传状态值时查询全部状态数
     * @return  总数
     */
    public function countOrderStatusOfMysale($userid,$orderstatus=false,$type=false)
    {
    	if(!$orderstatus){
            $sql = 'SELECT count(*) as aa FROM `x2_orders` where `ordersalerid`='. $userid.' AND `isdel`=0';
		}else{
            $sql = 'SELECT count(*) as aa FROM `x2_orders` where `ordersalerid`='. $userid .' AND `orderstatus`='.$orderstatus.' AND `isdel`=0';
		}
        if($type==2) {
            $time = strtotime(date('Y-m'));
            $sql .= ' AND `ordercreatetime`>='.$time.';';
        }elseif($type == 1){
            $time = strtotime(date('Y-m'));
            $stime = strtotime(date('Y-m',$time-3600));
            $sql .= ' AND `ordercreatetime`>='.$stime.' AND `ordercreatetime`<'.$time.';';
        }else{
            //后台控制前台时间订单的展示
//            $arr= $this->setorder->getStatisticsList();
//            $time = time();
//            $a=$arr['cfgorder'];
//            $outtime = strtotime(date('Y-m-d H:i:s', strtotime("-$a days")));
//            $sql .= ' AND `ordercreatetime`<'.$time.' AND `ordercreatetime`>'.$outtime.';';
        }
        $data = array();
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r['0']['aa'];

    }
	// 订单列表批量删除 
    public function delOrderaudit($ordersn)
	{
		$data = array('orders',array(array('AND',"ordersn = :ordersn",'ordersn',$ordersn)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
	}

	/**
	 * @param $id
	 * @param $args
	 * @return mixed
	 * xiliheng-20181109
	 * 1、根据yeeOrdersn修改订单数据
	 *
	 */
	public function modifyOrderByYeeSn($id,$args)
	{
		$data = array(
			'table' => 'orders',
			'value' => $args,
			'query' => array(array("AND","yeeOrdersn = :yeeOrdersn",'yeeOrdersn',$id))
		);
		return $this->db->updateElement($data);
	}

	/**
	 * xiliheng - 2018-11-15
	 * 根据yeeOrdersn获取订单信息
	 * @param $id
	 * @param string $userid
	 * @return mixed
	 */
	public function getByYeeOrderSn($id,$userid = '')
	{
		if($userid)
			$data = array(false,'orders',array(array("AND","yeeOrdersn = :yeeOrdersn",'yeeOrdersn',$id),array("AND","orderuserid = :orderuserid",'orderuserid',$userid)));
		else
			$data = array(false,'orders',array(array("AND","yeeOrdersn = :yeeOrdersn",'yeeOrdersn',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchALL($sql,false);
	}

}

?>
