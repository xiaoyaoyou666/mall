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
		$contents = $this->content->getContentList(array(array("AND","find_in_set(contentcatid,:contentcatid)",'contentcatid',$catstring)),$page);
		$catbrother = $this->category->getCategoriesByArgs(array(array('AND',"catparent = :catparent",'catparent',$cat['catparent']),array('AND',"catinmenu = '0'")));
		if($cat['cattpl'])$template = $cat['cattpl'];
		else $template = 'category_default';
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
