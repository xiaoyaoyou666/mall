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
		$this->ppe = $this->G->make('price','purchase');
		$this->statistics = $this->G->make('statistics','content');
		$this->link = $this->G->make('link','content');
        $this->purchase = $this->G->make('content','purchase');
        $this->content = $this->G->make('content','content');
        $this->user = $this->G->make('user','user');
        $this->msg = $this->G->make('msg','user');
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
        if($this->session->getSessionUser())
        {
            $userid = $this->session->getSessionUser();
            $args[] = array("AND","msg_userid = :msg_userid",'msg_userid',$userid['sessionuserid']);
            $args[] = array("AND","status = 0");
            $data = $this->msg->getCompanyMsgList($args,1,99);
            $this->tpl->assign('msgnum',$data['number']);
        }
		if($this->ev->isMobile())
		{
			header("location:index.php?content-phone");
			exit;
		}
		$action = $this->ev->url(3);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function index_oled()
	{
		$catids = array();
		$catids['index'] = $this->category->getCategoriesByArgs(array(array("AND","catindex > 0")));
		$contents = array();
		if($catids['index'])
		{
			foreach($catids['index'] as $p)
			{
				$catstring = $this->category->getChildCategoryString($p['catid']);
				$contents[$p['catid']] = $this->content->getContentList(array(array("AND","find_in_set(contentcatid,:catstring)",'catstring',$catstring)),1,$p['catindex']?$p['catindex']:10);
			}
		}
		$this->category->app = 'course';
		$coursecats = $this->category->getCategoriesByArgs(array(array("AND","catparent = '0'")));
		$topcourse = array();
		foreach($coursecats as $cat)
		{
			$catstring = $this->category->getChildCategoryString($cat['catid']);
			$topcourse[$cat['catid']] =  $this->course->getCourseList(array(array("AND","find_in_set(cscatid,:cscatid)",'cscatid',$catstring)),1,6);
		}
		$this->tpl->assign('topcourse',$topcourse);
		$courses = $this->course->getCourseList(1,1,8);
		$basic = $this->G->make('basic','exam');
		$basics = $basic->getBestBasics();
		$this->tpl->assign('coursecats',$coursecats);
		$this->tpl->assign('courses',$courses);
		$this->tpl->assign('basics',$basics);
		$this->tpl->assign('contents',$contents);
		$this->tpl->display('index');
	}

    private function index()
    {
    	header("Location: index.php?item");
    	die;
        $orderBy = 'company_level DESC';
        $shebei = $this->user->getUserList(1,4,array(array("AND","company_category LIKE :company_category",'company_category',"%设备商%")),$orderBy);
        $cailiao = $this->user->getUserList(1,4,array(array("AND","company_category LIKE :company_category",'company_category',"%材料商%")),$orderBy);
        $shigong = $this->user->getUserList(1,4,array(array("AND","company_category LIKE :company_category",'company_category',"%施工商%")),$orderBy);
        $fuwu = $this->user->getUserList(1,4,array(array("AND","company_category LIKE :company_category",'company_category',"%服务商%")),$orderBy);
        //采购信息
        $args9[] = array("AND","purchasestatus != :purchasestatus",'purchasestatus',2);
        $purchase = $this->purchase->getContentList($args9, 1, 6);

        //我的采购数量
		$purchaseuserid = $this->_user['sessionuserid'];
		$caigouNumber = $this->purchase->getNumber($purchaseuserid);

		//我收到的询价
		$args1[] = array("AND","purchaseuserid = :purchaseuserid",'purchaseuserid',$purchaseuserid);

		$contents5 = $this->purchase->getContentList($args1,$page,10000);
		$purchaseids = array();
		foreach($contents5['data'] as $key => $p )
		{
            $purchaseids[] = $p['purchaseid']; 
		}
		$purchaseids = implode(',',$purchaseids);
		$otherPriceNumber = $this->ppe->getOtherNumber($purchaseids);

		//我报价的商机
		$ppeuserid = $purchaseuserid;
		$myPriceNumber = $this->ppe->getMyNumber($ppeuserid);

		//首页banner
		$bannerargs = array();
		$bannerargs[] = array("AND","contentcatid = :contentcatid",'contentcatid',1);
		$bannerargs[] = array("AND","contentstatus = :contentstatus",'contentstatus',1);
		$bannerarr = $this->content->getContentList($bannerargs,$page,10);

		//----首页四个数据-------采购达成合作的统计
		$args11[] = array("AND","ppestatus = :ppestatus",'ppestatus',1);
		$aa = $this->ppe->getPurchasePriceList($args11,1,1000);
        $bb = array();
        foreach ($aa['data'] as $key => $val) {
            $bb[] = $val['ppeinfo'];
        }
        $count = 0;
		foreach ($bb as $k => $v) {
			$count += intval($v['price']);
		}
		$statisticsarr = $this->statistics->getStatisticsList();
		//采购总的额度为
		$zcount = $count + $statisticsarr['amount'];

		//----首页四个数据-------采购总的条数
		$zpurchase1 = $this->purchase->zcount();//真实的
		$zpurchase = $zpurchase1 + $statisticsarr['purchase_need'];


		//----首页四个数据-------今日新增商家
		$todayUser = $this->user->countUserToday();
		$ztodayUser = $todayUser + $statisticsarr['add_business'];

		//----首页四个数据-------入驻商家总数
		$zuser1 = $this->user->countUser();//真实的
		$zuser = $zuser1 + $statisticsarr['enter_business'];

		//底部的友情连接
		$args22[] = array("AND","status = :status",'status',1);
		$links = $this->link->getLinkList($args22,$page,10);
		/*echo "<pre/>";
		print_r($links);
		echo "<pre/>";*/
		$this->tpl->assign('caigouNumber',$caigouNumber);
		$this->tpl->assign('myPriceNumber',$myPriceNumber);
		$this->tpl->assign('otherPriceNumber',$otherPriceNumber);
		
        $this->tpl->assign('purchase',$purchase);
        $this->tpl->assign('shebei',$shebei);
        $this->tpl->assign('cailiao',$cailiao);
        $this->tpl->assign('shigong',$shigong);
        $this->tpl->assign('fuwu',$fuwu);

        //----首页banner----------------
        $this->tpl->assign('bannerarr',$bannerarr);
        //----首页四个数据--------------
        $this->tpl->assign('zcount',$zcount);
        $this->tpl->assign('zpurchase',$zpurchase);
        $this->tpl->assign('zuser',$zuser);
        $this->tpl->assign('ztodayUser',$ztodayUser);
        $this->tpl->assign('links',$links);
        $this->tpl->display('index');
    }

    private function updateStatus()
	{
		$linkid = $this->ev->get('id_value');
		$linkarr = $this->link->getLinkById($linkid);

		$args = array();
		$args['click'] = $linkarr['click']+1;
        $result = $this->link->modifyLink($linkid,$args);

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

}
?>
