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
		//头部搜索
		$keyword = strip_tags($this->ev->get('keyword'));
		$stype = strip_tags($this->ev->get('stype'));
        $userId = $this->_user['sessionuserid'];//userid
		if($keyword){
            $args6[] = array("AND","xunjia_title LIKE :xunjia_title",'xunjia_title',"%{$keyword}%");
            $this->ppe->updateSearchLog(1, $keyword);
        }
        $contents = $this->content->getPurchaseNewContent($args6,$page,10);
		foreach ($contents['data'] as $key=>$val){
            $yaoqiaoren = explode(',',$val['xunjia_invitation']);
            //判断是否被邀请询价标识
            if(in_array($userId,$yaoqiaoren)){
                $contents['data'][$key]['is_show'] = 1;
			}else{
                $contents['data'][$key]['is_show'] = 0;
			}
            $xunjiaCompany = $this->user->getUserById($val['xunjia_ren']);
            $contents['data'][$key]['company_name'] = $xunjiaCompany['company_name'];
            $time = $val['end_time']-time();
            $contents['data'][$key]['time'] = $time<0?0:$time;
		}
		$userids = array();
		foreach($contents['data'] as $key => $p )
		{
            $userids[] = $p['user_id'];
		}
		$userids = implode(',',$userids);
		$users = $this->user->getUsersByArgs(array(array("AND","find_in_set(userid,:userids)","userids",$userids)));

		//底部的友情连接
		$args22[] = array("AND","status = :status",'status',1);
		$links = $this->link->getLinkList($args22,$page,10);
        //获取当前登录的用户信息
        $userinfoarr = $this->user->getUserById($this->_user['sessionuserid']);
        $this->tpl->assign('role',$userinfoarr['users_role']);
        $this->tpl->assign('users',$users);
        $this->tpl->assign('userId',$userId);
        $this->tpl->assign('page',$page);
        $this->tpl->assign('keyword',$keyword);
		$this->tpl->assign('contents',$contents);
		$this->tpl->assign('links',$links);
		$this->tpl->display('index');
	}

}


?>
