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
        $this->orders = $this->G->make('orders','bank');
        $this->link = $this->G->make('link','content');
        $this->msg = $this->G->make('msg','user');
        $this->user = $this->G->make('user','user');
        $this->invoice = $this->G->make('invoice','user');
        $this->sap = $this->G->make('sap','item');
        $this->tpl->assign('orderstatus',$orderstatus);
        $this->tpl->assign('orderstatus1',$orderstatus1);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}


	private function index()
	{
		$orderstatus = $this->ev->get('orderstatus');
		$ordersn = $this->ev->get('ordersn');
		//$search = $this->ev->get('search');
		$type = $this->ev->get('type');
		$page = intval($this->ev->get('page'));
		$u = '';
		$args22[] = array("AND","status = :status",'status',1);
		$links = $this->link->getLinkList($args22,$page,10);
		
        $this->tpl->assign('links',$links);
		$this->tpl->display('footer2');
	}


    

 //购物手册1
	private   function   shops(){
        $this->tpl->display('orders_a');
	}


}


?>
