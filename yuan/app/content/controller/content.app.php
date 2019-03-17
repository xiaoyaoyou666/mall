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
		$this->link = $this->G->make('link','content');
		$this->ppe = $this->G->make('price','purchase');
		$this->pcontent = $this->G->make('content','purchase');
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
		$contentid = $this->ev->get('contentid');
		$content = $this->content->getContentById($contentid);
		if($content['contentlink'])header("location:".html_entity_decode($content['contentlink'])."");

		




		else
		{
			//底部的友情连接
			$args22[] = array("AND","status = :status",'status',1);
			$links = $this->link->getLinkList($args22,$page,10);
			$catbread = $this->category->getCategoryPos($content['contentcatid']);
			$cat = $this->category->getCategoryById($content['contentcatid']);
			$catbrother = $this->category->getCategoriesByArgs(array(array('AND',"catparent = :catparent",'catparent',$cat['catparent']),array('AND',"catinmenu = '0'")));
			if($content['contenttemplate'])$template = $content['contenttemplate'];
			else $template = 'content_default';
			$nearContent = $this->content->getNearContentById($contentid,$content['contentcatid']);
			if(!$template)$template = 'content_default';
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('nearContent',$nearContent);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('catbread',$catbread);
			$this->tpl->assign('content',$content);
			$this->tpl->assign('catbrother',$catbrother);
			$this->tpl->assign('links',$links);

			$this->tpl->assign('caigouNumber',$caigouNumber);
			$this->tpl->assign('myPriceNumber',$myPriceNumber);
			$this->tpl->assign('otherPriceNumber',$otherPriceNumber);
			$this->tpl->display($template);
		}
	}


    private function wait()
    {
    	//底部的友情连接
		$args22[] = array("AND","status = :status",'status',1);
		$links = $this->link->getLinkList($args22,$page,10);
		$this->tpl->assign('links',$links);
        $this->tpl->display('404');
    }

}


?>
