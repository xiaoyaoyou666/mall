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
        $this->content = $this->G->make('content','content');
        $this->user = $this->G->make('user','user');
		$action = $this->ev->url(3);
        $this->link = $this->G->make('link','content');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->tpl->assign('links',$links);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function search()
	{
        $stype = intval($this->ev->get('stype'));   //搜索类型，1按商品2按供应商
		$page = intval($this->ev->get('page'));
		$page = $page?$page:1;
		$search = array();
        $keyword = $this->ev->get('keyword');
        $template = 'search_list';
        //按商品名称查
        if($stype == 1)
        {
            if($keyword) $search['keyword'] = $keyword;

            $order = "goodsid desc";
            $args = array(array("AND","goodsstatus = 1"));
            if($search['keyword'])
            {
                $args[] = array("AND","goodstitle LIKE :goodstitle","goodstitle","%{$search['keyword']}%");
            }

            if($search['brandid'])
            {
                $args[] = array("AND","goodsbrand = :goodsbrandid","goodsbrandid",$search['brandid']);
            }
            $goodslist = $this->item->listGoods($args,$page,20,$order);
            $this->tpl->assign('goodslist',$goodslist);
        }
        else{
            //按供应商查
            $template = 'search';
            $args2[] = array("AND","company_name LIKE :company_name",'company_name',"%{$keyword}%");
            $companyData = $this->user->getUserList($page,10,$args2);   //企业列表数据
            $caseData = $this->user->getCompanyCase();  //随机取案例
            $this->tpl->assign('companyData',$companyData);
            $this->tpl->assign('caseData',$caseData);
        }
        $this->tpl->assign('stype',$stype);
        $this->tpl->assign('page',$page);
        $this->tpl->assign('keyword',$keyword);
		$this->tpl->display($template);
	}

	private function getcartnumber()
	{
		echo $this->G->make('cart','item')->getCartItemNumber();
	}

    private function index()
    {
        $cate = $this->category->getCateAll();

       /* $biaopin = $this->_getData(array(70,69));
        $shebei = $this->_getData(array(19,20,21,22));
        $cailiao = $this->_getData(array(23,25,24));
        $shigong = $this->_getData(array(26,27,28,29));
        $fuwu = $this->_getData(array(38,39,40,42));*/

        //---最新分类下商品展示--------------张建超 7.20---
        
        $args = array();
        $args[] = array("AND","goodsstatus = :goodsstatus",'goodsstatus',1);
        $args[] = array("AND","goodscatid = :goodscatid",'goodscatid',125);
        $biaopin = $this->item->listGoodsByCateId($args,$page,8);

        
        //网格超市banner
        $bannerargs = array();
        $bannerargs[] = array("AND","contentcatid = :contentcatid",'contentcatid',2);
        $bannerargs[] = array("AND","contentstatus = :contentstatus",'contentstatus',1);
        $bannerarr = $this->content->getContentList($bannerargs,$page,10);


        //底部的友情连接
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);

        $islogin = $this->_user ? 1 : 0;
        
        $this->tpl->assign('cate',$cate);
        $this->tpl->assign('biaopin',$biaopin);
        //$this->tpl->assign('shebei',$shebei);
        //$this->tpl->assign('cailiao',$cailiao);
        //$this->tpl->assign('shigong',$shigong);
        $this->tpl->assign('links',$links);
        //$this->tpl->assign('fuwu',$fuwu);
        $this->tpl->assign('bannerarr',$bannerarr);
        $this->tpl->assign('islogin',$islogin);
        $this->tpl->display('index');
    }

    private function _getData($idArr)
    {
        $shebei = array();
        $shebeiIds = array();
        $shebeiIds[1] = $this->category->getChildCategoryString($idArr[0]);
        $shebeiIds[2] = $this->category->getChildCategoryString($idArr[1]);
        $shebieIds[3] = $this->category->getChildCategoryString($idArr[2]);
        $shebeiIds[4] = $this->category->getChildCategoryString($idArr[3]);
        $shebei[1] = $this->item->listGoodsByCateId(array(array("AND","goodsstatus = 1"),array("AND","find_in_set(goodscatid,:goodscatid)","goodscatid",$shebeiIds[1])),1,8);
        $shebei[2] = $this->item->listGoodsByCateId(array(array("AND","goodsstatus = 1"),array("AND","find_in_set(goodscatid,:goodscatid)","goodscatid",$shebeiIds[2])),1,8);
        $shebei[3] = $this->item->listGoodsByCateId(array(array("AND","goodsstatus = 1"),array("AND","find_in_set(goodscatid,:goodscatid)","goodscatid",$shebeiIds[3])),1,8);
        $shebei[4] = $this->item->listGoodsByCateId(array(array("AND","goodsstatus = 1"),array("AND","find_in_set(goodscatid,:goodscatid)","goodscatid",$shebeiIds[4])),1,8);
        return $shebei;
    }


}


?>
