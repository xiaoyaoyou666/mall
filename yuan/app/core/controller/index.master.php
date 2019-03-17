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
        $this->orders = $this->G->make('orders','bank');
        $this->purchase = $this->G->make('content','purchase');
        $this->item = $this->G->make('item','item');
        $this->msg = $this->G->make('msg','user');
        $this->agreement = $this->G->make('agreement', 'agreement');
        if(!method_exists($this,$action))
            $action = "index";
        $this->$action();
        exit;
    }
    private function index()
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
        //订单管理
        $today = $this->orders->getOrderCountsd(0,0,$argsy);
        $count = $this->orders->getOrderCount(0,0,$args);
        //供应商管理
        $userTotal = $this->user->countUser();//用户总数
        $gysToday = $this->user->countUserToday($firttime,$endtime);//今日新增
        $gysYestoday = $this->user->countUserToday($beforeday,$endday);//昨日新增
        //采购信息管理
        $purchaseTotal = $this->purchase->zcount();//采购总数
        $purchaseToday = $this->purchase->zcount(true);//采购今日数
        //商品管理
        $goodsTotal = $this->item->getGoodsCount();//商品总数
        $goodsToday = $this->item->getGoodsCount(true);//商品今日数
        //系统管理
        $msgTotal = $this->msg->getMsgCount();//消息总数
        $msgToday = $this->msg->getMsgCount(true);//消息今日数
        //协议操作日志
        $agreementLogArr = $this->agreement->getAgreementLogList([],1,$number = 100);
        $this->tpl->assign("count",$count);
        $this->tpl->assign("today",$today);
        $this->tpl->assign("userTotal",$userTotal);
        $this->tpl->assign("gysToday",$gysToday);
        $this->tpl->assign("gysYestoday",$gysYestoday);
        $this->tpl->assign("purchaseToday",$purchaseToday);
        $this->tpl->assign("purchaseTotal",$purchaseTotal);
        $this->tpl->assign('agreementLogArr',$agreementLogArr);
        $this->tpl->assign("goodsTotal",$goodsTotal);
        $this->tpl->assign("goodsToday",$goodsToday);
        $this->tpl->assign("msgTotal",$msgTotal);
        $this->tpl->assign("msgToday",$msgToday);
        $this->tpl->display('main');
    }
    private function old()
    {
        $this->tpl->display('index');
    }

}


?>
