<?php
class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        $this->module = $this->G->make('module');
        $this->user = $this->G->make('user','user');
        $this->category = $this->G->make('category');
        $this->orders = $this->G->make('orders','bank');
        $this->core = $this->G->make('setorder','core');
        $this->sap = $this->G->make('sap','item');
        //---买方的状态值-----对应字段--orderstatus-----
        $orderstatus = array(1=>'待确认',2=>'待发货',3=>'待收货',4 => '已完成',5 => '退换货',7 =>'已评论',99 =>'已取消');
        $this->category->app = 'item';
        $categories = $this->category->getCategoriesByArgs();
        $this->tpl->assign('categories',$categories);
        $this->tpl->assign('orderstatus',$orderstatus);
        if(!method_exists($this,$action))
        $action = "index";
        $this->$action();
        exit;
    }
    /**
     * @action   订单列表
     * @param    arr   $search
     * @param    int   $orderstatus
     * @param    int   $historyorder 上月订单
     */
    private function index()
    {
        $page = intval($this->ev->get('page'));
        $search = $this->ev->get('search');//搜索值
        $orderstatus = $this->ev->get('orderstatus');//搜索订单状态
        $historyorder = $this->ev->get('historyorder');//历史订单
        $u = '';
        if($search)
        {
            foreach($search as $key => $args)
            {
               $u .= "&search[{$key}]={$args}";
            }
        }
        $args = array();
        // 订单id
        if($search['ordersn']) $args[] = array("AND","ordersn = :ordersn","ordersn",$search['ordersn']);
        // 时间段
        if ($search['stime'] && $search['etime']) {
            if($search['stime'])$args[] = array("AND","ordercreatetime >= '".strtotime($search['stime'])."'");
            if($search['etime'])$args[] = array("AND","ordercreatetime <= '".strtotime($search['etime'])."'");
        }elseif($search['stime'] != "" && $search['etime'] == ""){
            if($search['stime'])$args[] = array("AND","ordercreatetime >= '".strtotime($search['stime'])."'");
        }elseif($search['stime'] == "" && $search['etime'] != ""){
            if($search['etime'])$args[] = array("AND","ordercreatetime <= '".strtotime($search['etime'])."'");
        }
        // 买方
        if($search['company_name'])
        {
          $user = $this->user->getUserByCompanyName($search['company_name']);
          $args[] = array("AND","orderuserid = :orderuserid",'orderuserid',$user['userid']);
        }
        //卖方
        if($search['company_names'])
        {
            $user1 = $this->user->getUserByCompanyName($search['company_names']);
            $args[] = array("AND","ordersalerid = :ordersalerid",'ordersalerid',$user1['userid']);
        }
        // 订单状态订单
        if($orderstatus['orderstatus'])$args[] = array('AND',"orderstatus = :orderstatus",'orderstatus',$orderstatus );
        // 历史订单
        if ($historyorder == 1) {
            $time = strtotime(date('Y-m'));
            $stime = strtotime(date('Y-m',$time-1));
            $args[] = array("AND","ordercreatetime >= :ordercreatetime","ordercreatetime",$stime);
            $args[] = array("AND","ordercreatetime < :eordercreatetime","eordercreatetime",$time);
        }
        // user  select
        $users = $this->user->getUsersByArgs();
        // order list  All
        $orders = $this->orders->getOrderList($args, $page, 10, 'status_qufen1 DESC,ordercreatetime DESC');
        $this->tpl->assign('u',$u);
        $this->tpl->assign('page',$page);
        $this->tpl->assign("users",$users);
        $this->tpl->assign('orders',$orders);
        $this->tpl->assign('search',$search);
        $this->tpl->display("orderlist");
    }

    public function xqing()
    {
        // 通过订单号查找订单
        $oid = $this->ev->get('ordersn');
        $order = $this->orders->getOrderById($oid);
        //--------买家和卖家的信息---------
        $buyuserinfo = $this->user->getUserById($order['orderuserid']);//--买家--
        $selleruserinfo = $this->user->getUserById($order['ordersalerid']);//--卖家--
        //--------所有的商家店铺-----------
        $alluser = $this->user->getUsersByArgs();
        $create = date("Y-m-d H:i:s",$order['ordercreatetime']);
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
        if($this->ev->get('msg_id'))
        {
            $this->msg->modifyMsgStatus(array('msg_id' => $this->ev->get('msg_id'), 'status' => 1));
        }
        $this->tpl->assign('order',$order);
        $this->tpl->assign('create',$create);
        $this->tpl->assign('saler',$saler);
        $this->tpl->assign('alluser',$alluser);
        $this->tpl->assign('mfields',$mfields);
        $this->tpl->assign('categories',$categories);
        $this->tpl->assign('buyuserinfo',$buyuserinfo);
        $this->tpl->assign('selleruserinfo',$selleruserinfo);
        $this->tpl->display('orderdetails');
    }

    /**
     * action  批量删除
     * @param  $delids
     * @param  orderstatus 
     * @param  delOrderById
     */
    private function delall()
    {
        $delids = $this->ev->get('delids');
        if($delids)
        {
        //将提交过来的字符串转换为数组
        $delids= explode(',', $delids);
            foreach($delids as $oid )
            {
            $order = $this->orders->getOrderById($oid);
            if($order['orderstatus'] == 99)
             {
               $this->orders->delOrderaudit($order['ordersn']);//传入订单编号
             }
            }
            $message = array(
                'statusCode' => 200,
                "message" => "已取消订单删除成功,其他状态订单不予删除！",
                "callbackType" => 'forward',
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        } else{
            $message = array(
                 'statusCode' => 300,
                 "message" => "请选择一个信息"
            );
            exit(json_encode($message));
        } 
    }

  /**
    * @action  save order state
    * @param   $oid
    * @param   ordermodify  
    */ 
    private function saveorder()
    {
        $oid = $this->ev->get('ordersn');
        $order = $this->orders->getOrderById($oid);
        $orderstatus = $this->ev->get('orderstatus');
        $reason = $this->ev->get('ordermodify');
        if(empty($orderstatus)){
            $message = array(
            'statusCode' => 300,
            "message" => "请选择一个状态"
        );
           exit(json_encode($message));
        }elseif(empty($reason)){
            $message = array(
            'statusCode' => 300,
            "message" => "备忘录不能为空"
        );
        exit(json_encode($message));
        }
        //如果修改状态为已确认订单或者已完成订单，调sap对应接口
        if($orderstatus == 2)
        {
            $sapOrdRet = $this->sap->addSapOrder($oid,$order['ordersalerid']);
            if($sapOrdRet)
            {
                $args['status_qufen1'] = 0; //SAP返回结果导致订单是否失效，0正常，1采购订单失败，2采购入库失败
                $args['sap_status'] = 2;    //SAP接口状态，0默认，1采购订单失败，2待采购入库，3SAP接口完成
            }else{
                $args['status_qufen1'] = 1;
                $args['sap_status'] = 1;
                $this->orders->modifyOrderById($oid,$args);
                $message = array(
                    'statusCode' => 300,
                    "message" => "SAP采购订单失败"
                );
                exit(json_encode($message));
            }
        }
        if($orderstatus == 4)
        {
            $sapOrdRet = $this->sap->addSapStock($oid,$order['orderuserid']);
            if($sapOrdRet)
            {
                $args['status_qufen1'] = 0; //SAP返回结果导致订单是否失效，0正常，1采购订单失败，2采购入库失败
                $args['sap_status'] = 3;    //SAP接口状态，0默认，1采购订单失败，2待采购入库，3SAP接口完成
            }else{
                $args['status_qufen1'] = 2;
                $args['sap_status'] = 2;
                $this->orders->modifyOrderById($oid,$args);
                $message = array(
                    'statusCode' => 300,
                    "message" => "SAP采购入库失败"
                );
                exit(json_encode($message));
            }
        }
        $faq = array();
        $faq['ordermodify'] = $reason;
        $faq['prestatus'] = $order['orderstatus'];
        $faq['status'] = $orderstatus;
        $faq['username'] = $this->_user['sessionusername'];
        $faq['time'] = TIME;
        $args['orderstatus'] = $orderstatus;
        $args['orderfaq'] = $order['orderfaq'];
        $args['orderfaq'][] = $faq;
        $this->orders->modifyOrderById($oid,$args);
        $message = array(
            'statusCode' => 200,
            "message" => "订单修改成功",
            "callbackType" => 'forward',
            "forwardUrl" => "reload"
        );
        exit(json_encode($message));
        $this->tpl->display('orderlist');
    }
     
    /**
     * 订单统计 number  monty  monty
     * @param   time  $firttime
     * @param   time  $endtime
     * @param   array  $count
     * @param   array  $today  
     * @param   sql    $args[]
     */ 
    private function statistics()
    {
        //今日订单金额/数量
        $firttime = strtotime(date("Y-m-d 00:00:01"));
        $endtime =  strtotime(date("Y-m-d 23:59:59"));
        $args[] = array("AND","ordercreatetime >= '".$firttime."'");
        $args[] = array("AND","ordercreatetime <= '".$endtime."'");
        // 昨日订单金额
        $beforeday = strtotime(date("Y-m-d 00:00:01",time()-86400));
        $endday = strtotime(date("Y-m-d 23:59:59",time()-86400));
        $argsy[] = array("AND","ordercreatetime >= '".$beforeday."'");
        $argsy[] = array("AND","ordercreatetime <= '".$endday."'");
        $count = $this->orders->getOrderCount(0,0,$args);
        $today = $this->orders->getOrderCountsd(0,0,$argsy);
        $this->tpl->assign("count",$count);
        $this->tpl->assign("today",$today);
        $this->tpl->display("statistics");
    }


    /**
     * @action  订单设置 指向页面
     * @param   array  $setli
     * @param   model  core   getStatisticsList
     */ 
    private function set()
    {  
        $setli = $this->core->getStatisticsList();
        $this->tpl->assign("setli",$setli);
        $this->tpl->display("set"); 
    }

    /**
     *  @action  ajax   时间设置 
     *  @param   int    $param 
     *  @param   model  core
     *  @means   getStatisticsList  select
     *  @means   modifyStatistics   updat
     *  @meanss  addStatistics      insert
     *  @param   $message 
     */
    private function update()
    {   
        $param['cfgsetting'] = $this->ev->get('day');
        $param['cfgorder'] = $this->ev->get('ordernum');
        if ($this->core->getStatisticsList()) {
            $statisticsid = $this->ev->get('cfgapp') ?$this->ev->get('cfgapp'):1;
            $result = $this->core->modifyStatistics($statisticsid,$param);
        } else {
            $result = $this->core->addStatistics($param);
        }
        
        if ($result) {
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功"
                
            );
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "修改失败了"
                
            );
        }
        exit(json_encode($message));
    }

    /**
     * @action 导出订单数据表
     * @param  array  orderstatus  状态
     * @param  array  qufen        状态
     * @param  array  orders       订单数据
     * @param  array  users        用户数据
     */
    private function export_goods()
    {
        $qufen = array(0=>'正常',1=>'订单失败',2=>'入库失败');
        $orderstatus = array(1=>'待确认',2=>'待发货',3=>'待收货',4 => '已完成',5 => '退换货',99 =>'已取消');
        $users = $this->user->getUsersByArgs();//用户表
        $orders = $this->orders->getOrderList($args=0, $page=0, 10000000, 'status_qufen1 DESC,ordercreatetime DESC');
        $strTable ='<table width="500" border="1">';
        $strTable .= '<tr>';
        $strTable .= '<th style="text-align:center;font-size:12px;width:220px;">订单编号</th>';
        $strTable .= '<th style="text-align:center;font-size:12px;" width="100">提交时间</th>';
        $strTable .= '<th style="text-align:center;font-size:12px;" width="*">买方</th>';
        $strTable .= '<th style="text-align:center;font-size:12px;" width="*">卖方</th>';
        $strTable .= '<th style="text-align:center;font-size:12px;" width="*">商品名称</th>';
        $strTable .= '<th style="text-align:center;font-size:12px;" width="*">是否正常</th>';
        $strTable .= '<th style="text-align:center;font-size:12px;" width="*">订单总额</th>';
        $strTable .= '<th style="text-align:center;font-size:12px;" width="*">订单状态</th>';
        $strTable .= '</tr>';
        if(is_array($orders)){
            foreach($orders['data'] as $k=>$val){
                $strTable .= '<tr>';
                $strTable .= '<td style="text-align:center;font-size:12px;">&nbsp;'.$val['ordersn'].'</td>';
                $strTable .= '<td style="text-align:center;font-size:12px;">'.date("Y-m-d H:i:s",$val['ordercreatetime']).' </td>';                
                $strTable .= '<td style="text-align:center;font-size:12px;">'.$users[$val['orderuserid']]['company_name'].'</td>';
                $strTable .= '<td style="text-align:center;font-size:12px;">'.$users[$val['ordersalerid']]['company_name'].'</td>';
                $strTable .= '<td style="text-align:center;font-size:12px;">'.$val['orderitems'][0]['goodstitle'].'</td>';
                $strTable .= '<td style="text-align:center;font-size:12px;">'.$qufen[$val['status_qufen1']].'</td>';
                $strTable .= '<td style="text-align:center;font-size:12px;">'.'￥'.$val['orderprice'].'</td>';
                $strTable .= '<td style="text-align:center;font-size:12px;">'.$orderstatus[$val['orderstatus']].'</td>';
                $strTable .= '</tr>';
            }
        }
        $strTable .='</table>';
        unset($orders);
        $this->core->downloadExcel($strTable,'订单列表');
        $this->tpl->display('orderlist');
    }

   

}











