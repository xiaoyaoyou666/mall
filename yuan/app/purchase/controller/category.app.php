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

    private function company()
    {
        $page = $this->ev->get('page');
        $companyid = $this->ev->get('companyid');
        $user = $this->user->getUserById($companyid);
        $contents = $this->content->getContentList(array(array("AND","purchaseuserid = :purchaseuserid",'purchaseuserid',$companyid)),$page);


        //我的采购数量
		$purchaseuserid = $this->_user['sessionuserid'];
		$caigouNumber = $this->content->getNumber($purchaseuserid);

		//我收到的询价
		$args1[] = array("AND","purchaseuserid = :purchaseuserid",'purchaseuserid',$purchaseuserid);
		$contents5 = $this->content->getContentList($args1,$page,10000);
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


		//采购排行榜
		
		$contents1 = $this->content->getContentListUser();
		$userids1 = array();

		foreach($contents1 as $k => $v)
		{
            $userids1[] = $v['purchaseuserid'];
		}

		$userids1 = implode(',',$userids1);
		$users1 = $this->content->getContentListUser1();

		/*echo "<pre/>";
		print_r($users1);
		echo "<pre/>";*/



		//最新完成的交易
		$args[] = array("AND","ppestatus = :ppestatus",'ppestatus',1);//完成状态
		$contents2 = $this->ppe->getPurchasePriceList($args,$page,$number = 3,$order = 'ppetime DESC');
		$userids2 = array();
		foreach($contents2['data'] as $key => $p )
		{
            $userids2[] = $p['ppepurchaseid'];
		}
		$userids2 = implode(',',$userids2);
		$contents3 = $this->content->getContentList(array(array("AND","find_in_set(purchaseid,:userids2)","userids2",$userids2)));

		//采购排行榜
		
		$contents1 = $this->content->getContentListUser();
		$userids1 = array();

		foreach($contents1 as $k => $v)
		{
            $userids1[] = $v['purchaseuserid'];
		}

		$userids1 = implode(',',$userids1);
		$users1 = $this->content->getContentListUser1();


		$this->tpl->assign('caigouNumber',$caigouNumber);
		$this->tpl->assign('myPriceNumber',$myPriceNumber);
		$this->tpl->assign('otherPriceNumber',$otherPriceNumber);
		$this->tpl->assign('users1',$users1);
		$this->tpl->assign('contents3',$contents3);


        $this->tpl->assign('user',$user);
        $this->tpl->assign('page',$page);
        $this->tpl->assign('contents',$contents);
        $this->tpl->display('purchasecompany');
    }

	private function index()
	{

		$page = $this->ev->get('page');
		$catid = $this->ev->get('catid');
		$cat = $this->category->getCategoryById($catid);
		if($cat['catuseurl'] && $cat['caturl'])
		header("location:".html_entity_decode($cat['caturl']));
		if($cat['catparent'])$catparent = $this->category->getCategoryById($cat['catparent']);
		$catbread = $this->category->getCategoryPos($catid);
		$catstring = $this->category->getChildCategoryString($catid);
		$catchildren = $this->category->getCategoriesByArgs(array(array('AND',"catparent = :catparent",'catparent',$catid),array('AND',"catinmenu = '0'")));
		$contents = $this->content->getContentList(array(array("AND","find_in_set(purchasecatid,:purchasecatid)",'purchasecatid',$catstring)),$page);
		$catbrother = $this->category->getCategoriesByArgs(array(array('AND',"catparent = :catparent",'catparent',$cat['catparent']),array('AND',"catinmenu = '0'")));
		if($cat['cattpl'])$template = $cat['cattpl'];
		else $template = 'category_default';

		//我的采购数量
		$purchaseuserid = $this->_user['sessionuserid'];
		$caigouNumber = $this->content->getNumber($purchaseuserid);

		//我收到的询价
		$args1[] = array("AND","purchaseuserid = :purchaseuserid",'purchaseuserid',$purchaseuserid);
		$contents5 = $this->content->getContentList($args1,$page,10000);
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


		//采购排行榜
		
		$contents1 = $this->content->getContentListUser();
		$userids1 = array();

		foreach($contents1 as $k => $v)
		{
            $userids1[] = $v['purchaseuserid'];
		}

		$userids1 = implode(',',$userids1);
		$users1 = $this->user->getUsersByArgs(array(array("AND","find_in_set(userid,:userids1)","userids1",$userids1)));



		//最新完成的交易
		$args[] = array("AND","ppestatus = :ppestatus",'ppestatus',1);//完成状态
		$contents2 = $this->ppe->getPurchasePriceList($args,$page,$number = 3,$order = 'ppetime DESC');
		$userids2 = array();
		foreach($contents2['data'] as $key => $p )
		{
            $userids2[] = $p['ppepurchaseid'];
		}
		$userids2 = implode(',',$userids2);
		$contents3 = $this->content->getContentList(array(array("AND","find_in_set(purchaseid,:userids2)","userids2",$userids2)));

		//采购排行榜
		
		$contents1 = $this->content->getContentListUser();
		$userids1 = array();

		foreach($contents1 as $k => $v)
		{
            $userids1[] = $v['purchaseuserid'];
		}

		$userids1 = implode(',',$userids1);
		$users1 = $this->content->getContentListUser1();

		$this->tpl->assign('caigouNumber',$caigouNumber);
		$this->tpl->assign('myPriceNumber',$myPriceNumber);
		$this->tpl->assign('otherPriceNumber',$otherPriceNumber);
		$this->tpl->assign('users1',$users1);
		$this->tpl->assign('contents3',$contents3);




		$this->tpl->assign('cat',$cat);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('catbrother',$catbrother);
		$this->tpl->assign('catchildren',$catchildren);
		$this->tpl->assign('catparent',$catparent);
		$this->tpl->assign('catbread',$catbread);
		$this->tpl->assign('contents',$contents);
		$this->tpl->display($template);
	}
}


?>
