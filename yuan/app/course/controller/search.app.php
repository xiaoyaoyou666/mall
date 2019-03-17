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
		if(!method_exists($this,$action))
		$action = "index";
		$this->cart = $this->G->make('cart','item');
        $cartNumArr = $this->cart->getCartUserNum();
        foreach ($cartNumArr as $k => $v) {
            $cartnums[] = $v['number'];
        }
        $cartNum = array_sum($cartnums);
		$this->$action();
		exit;
	}

	private function index()
	{
		$page = $this->ev->get('page');
		$keyword = $this->ev->get('keyword');
		$contents = $this->course->getCourseList(array(array("AND","cstitle LIKE :cstitle",'cstitle',"%{$keyword}%")),$page);
		$this->tpl->assign('contents',$contents);
		$this->tpl->display('search_default');
	}
}


?>
