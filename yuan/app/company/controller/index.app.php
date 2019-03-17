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
		if($this->ev->isMobile())
		{
			header("location:index.php?content-phone");
			exit;
		}
		$action = $this->ev->url(3);
        $this->ppe = $this->G->make('price','purchase');
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

    //供应商列表页
    private function index()
    {

        $levelDataArr = $this->user->getPositionById(2,2);
        $levelDataArrId = array();
        foreach ($levelDataArr as $k => $v) {
            $levelDataArrId[] = $v['dataid'];
        }
        $levelData = $this->user->getUserByPosition(implode(',', $levelDataArrId));
//        var_dump($levelData);die;
        $keyword = $this->ev->get('keyword');   //搜索关键字
        $stype = $this->ev->get('stype');   //关键字搜索类型
        $category = $this->ev->get('cat');  //按分类查询
        $page = intval($this->ev->get('page'));
        $level = intval($this->ev->get('level'));   //按推荐指数排序
        $time = intval($this->ev->get('time'));   //按发布时间排序
        $page = $page ? $page : 1;
        $args = array();
        $orderBy = 'userid DESC';
        $args[] = array("AND","users_role = :users_role",'users_role',0);
        $args[] = array("AND","company_istrue = :company_istrue",'company_istrue',1);//审核通过的供应商

        if($keyword){
            $args[] = array("AND","company_name LIKE :company_name",'company_name',"%{$keyword}%");
            $this->ppe->updateSearchLog(2, $keyword);
        }
        if($category){
            $args[] = array("AND","company_category LIKE :company_category",'company_category',"%{$category}%");
        }
        if($level){
            $orderBy = 'company_level DESC,userid DESC';
        }
        if($time){
            $orderBy = 'userregtime DESC';
        }
       /* echo "<pre/>";
        print_r($args);
        echo "<pre/>";*/
        $companyData = $this->user->getUserList($page,10,$args,$orderBy);   //企业列表数据
        $caseData = $this->user->getCompanyCase();  //随机取案例

        //底部的友情连接
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        //获取当前登录的用户信息
        $userinfoarr = $this->user->getUserById($this->_user['sessionuserid']);
        $this->tpl->assign('role',$userinfoarr['users_role']);
        $this->tpl->assign('companyData',$companyData);
        $this->tpl->assign('levelData',$levelData);
        $this->tpl->assign('caseData',$caseData);
        $this->tpl->assign('category',$category);
        $this->tpl->assign('keyword',$keyword);
        $this->tpl->assign('stype',$stype);
        $this->tpl->assign('links',$links);
        $this->tpl->assign('page',$page);

        $this->tpl->display('index');
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
