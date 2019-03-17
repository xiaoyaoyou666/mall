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
        $this->link = $this->G->make('link', 'content');
        $this->brand = $this->G->make('brand', 'item');
        $this->user = $this->G->make('user', 'user');
        $this->item = $this->G->make('item', 'item');
        $this->agreementgoods = $this->G->make('agreementgoods', 'agreement');
        $this->agreement = $this->G->make('agreement', 'agreement');


        $args22[] = array("AND", "status = :status", 'status', 1);
        $links = $this->link->getLinkList($args22, $page, 10);
        $this->tpl->assign('links', $links);
        $this->cart = $this->G->make('cart','item');
        $cartNumArr = $this->cart->getCartUserNum();
        foreach ($cartNumArr as $k => $v) {
            $cartnums[] = $v['number'];
        }
        $cartNum = array_sum($cartnums)?array_sum($cartnums):0;
        $this->tpl->assign('cartNum',$cartNum);
        if (!method_exists($this, $action))
            $action = "index";
        $this->$action();
        exit;
    }

    private function index()
    {

        $page = intval($this->ev->get('page'));
        $parent = intval($this->ev->get('catid'));
        $price = intval($this->ev->get('price'));//价格筛选
        $applytype = intval($this->ev->get('applytype'));//机型筛选
        $brandid = $this->ev->get('brandid');//品牌筛选【单选】
        $brandids = $this->ev->get('brandids');//品牌筛选【多选】
        $agreement = $this->ev->get('agreement');//协议#非协议筛选

        $args1 = array();
        $menu_list = array();
        $page = $page ? $page : 1;
        $catid = $this->ev->get('catid');
        $cat = $this->category->getCategoryById($catid);
        $catstring = $this->category->getChildCategoryString($catid);
        $userarr = $this->user->getUserListByArgs(1, $args, 200000000000);


        $userinfoarr = $this->user->getUserById($this->_user['sessionuserid']);
        #根据公司的编码ID查询出所有的合同ID
        $where = array();
        $where[] = array("AND","salerid = :salerid",'salerid',$userinfoarr['sap_company_id']);//公司编码
        $where[] = array("AND","status = :status",'status',3);//生效状态
        $where[] = array("AND","endtime > :endtime",'endtime',time());//当前时间要小于协议失效时间
        $agreementarrinfos = $this->agreement->getAgreementListByCompanycode($where);

        foreach ($agreementarrinfos as $k => $v) {
            $agreementarrids[] = $v['agreementid'];
        }
        $agreementarridstring = implode(',',$agreementarrids);

        #根据合同ID查询出所有的商品ID
        $agreementgoodsarr = $this->agreementgoods->getAgreementgoodsByAgreementid($agreementarridstring);

        //---分类名称的展示
        if ($catid) {
            $categoryinfo = $this->category->getCategoryById($catid);
            $categorymenu = array();
            $categorymenu['href'] = urldecode('index.php?item-app-category&price=' . $price . '&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&agreement='.$agreement);
            $categorymenu['text'] = '分类:'.$categoryinfo['catname'];

            $menu_list[] = $categorymenu;
        }

        //---假如有价格筛选------
        if ($price) {
            $pricemenu = array();
            $pricemenu['href'] = urldecode('index.php?item-app-category&catid=' . $catid . '&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&agreement='.$agreement);
            if ($price == 1) {
                $args1[] = array("AND", "goodsminprice <= :goodsminprice", 'goodsminprice', 1000);
                $pricemenu['text'] = '价格:¥0 - ¥1000';
            } elseif ($price == 2) {
                $args1[] = array("AND", "goodsminprice >= :goodsminprice", 'goodsminprice', 1001);
                $args1[] = array("AND", "goodsminprice <= :goodsminprice", 'goodsminprice', 3000);
                $pricemenu['text'] = '价格:¥1001 - ¥3000';

            } elseif ($price == 3) {
                $args1[] = array("AND", "goodsminprice >= :goodsminprice", 'goodsminprice', 3001);
                $args1[] = array("AND", "goodsminprice <= :goodsminprice", 'goodsminprice', 5000);
                $pricemenu['text'] = '价格:¥3001 - ¥5000';

            } elseif ($price == 4) {
                $args1[] = array("AND", "goodsminprice >= :goodsminprice", 'goodsminprice', 5001);
                $pricemenu['text'] = '价格:¥5000以上';
            }

            $menu_list[] = $pricemenu;
        }

        //-----假如有适用机型筛选-----
        if ($applytype) {
            $applytypemenu = array();
            $applytypemenu['href'] = urldecode('index.php?item-app-category&catid=' . $catid . '&price=' . $price . '&brandid=' . $brandid . '&brandids=' . $brandids.'&agreement='.$agreement);

            if ($applytype == 1) {
                $args33[] = array("AND", "FJLSBJCL_SYJX = :FJLSBJCL_SYJX", 'FJLSBJCL_SYJX', '金风1500');
                $itemgoodsarr = $this->item->listGoodsByItemField($args33, $page, $number = 100000);
                foreach ($itemgoodsarr['data'] as $k => $v) {
                    $itemgoodsids[] = $v['itemgoodsid'];
                }
                $itemgoodsids = implode(',', $itemgoodsids);
                $args1[] = array("AND", "find_in_set(goodsid,:itemgoodsids)", "itemgoodsids", $itemgoodsids);

                $applytypemenu['text'] = '适用机型:金风1500';

            } elseif ($applytype == 2) {
                $aa = "2";
                //$args33[] = array("AND","FJLSBJCL_SYJX LIKE :FJLSBJCL_SYJX",'FJLSBJCL_SYJX',"%金风2X00%");
                $args33[] = array('AND', "FJLSBJCL_SYJX LIKE :FJLSBJCL_SYJX", 'FJLSBJCL_SYJX', '%' . $aa . '%');
                $itemgoodsarr = $this->item->listGoodsByItemField($args33, $page, $number = 1000000);
                foreach ($itemgoodsarr['data'] as $k => $v) {
                    $itemgoodsids[] = $v['itemgoodsid'];
                }
                $itemgoodsids = implode(',', $itemgoodsids);
                $args1[] = array("AND", "find_in_set(goodsid,:itemgoodsids)", "itemgoodsids", $itemgoodsids);
                $applytypemenu['text'] = '适用机型:金风2X00';

            } elseif ($applytype == 3) {
                $args33[] = array("AND", "FJLSBJCL_SYJX = :FJLSBJCL_SYJX", 'FJLSBJCL_SYJX', '金风3000');
                $itemgoodsarr = $this->item->listGoodsByItemField($args33, $page, $number = 100000);
                foreach ($itemgoodsarr['data'] as $k => $v) {
                    $itemgoodsids[] = $v['itemgoodsid'];
                }
                $itemgoodsids = implode(',', $itemgoodsids);
                $args1[] = array("AND", "find_in_set(goodsid,:itemgoodsids)", "itemgoodsids", $itemgoodsids);

                $applytypemenu['text'] = '适用机型:金风3000';
            } elseif ($applytype == 4) {
                $args33[] = array("AND", "FJLSBJCL_SYJX = :FJLSBJCL_SYJX", 'FJLSBJCL_SYJX', '金风6000');
                $itemgoodsarr = $this->item->listGoodsByItemField($args33, $page, $number = 100000);
                foreach ($itemgoodsarr['data'] as $k => $v) {
                    $itemgoodsids[] = $v['itemgoodsid'];
                }
                $itemgoodsids = implode(',', $itemgoodsids);
                $args1[] = array("AND", "find_in_set(goodsid,:itemgoodsids)", "itemgoodsids", $itemgoodsids);

                $applytypemenu['text'] = '适用机型:金风6000';
            }
            $menu_list[] = $applytypemenu;
        }

        //----假如有品牌筛选【单选】------
        if ($brandid) {
           // $args1[] = array("AND", "goodsbrand=:goodsbrand", "goodsbrand", $brandid);
            $brandmenu = array();
            $brandarr = $this->brand->getBrandById($brandid);
            $brandmenu['href'] = urldecode('index.php?item-app-category&catid=' . $catid . '&price=' . $price . '&applytype=' . $applytype.'&agreement='.$agreement);
            $brandmenu['text'] = '品牌:' . $brandid;
            $menu_list[] = $brandmenu;
        }
        //----假如有品牌筛选【多选】------
        if ($brandids) {
           // $args1[] = array("AND", "find_in_set(goodsbrand,:brandids)", "brandids", $brandids);
            $brandmenu = array();
            $brandmenu['href'] = urldecode('index.php?item-app-category&catid=' . $catid . '&price=' . $price . '&applytype=' . $applytype.'&agreement='.$agreement);
            $brandmenu['text'] = '品牌:';
            $brandmenu['text'] .= $brandids;
            $menu_list[] = $brandmenu;
        }

        #---假如有协议商品的筛选----
        if ($agreement) {

            $agreementmenu = array();
            $agreementmenu['href'] = urldecode('index.php?item-app-category&catid=' . $catid . '&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&price='.$price);

            if ($agreement==1) {

                $agreementmenu['text'] = '协议商品:全部';
                #需要将协议商品数组压入到商品列表中
            } elseif($agreement==2) {
                $agreementmenu['text'] = '协议商品:协议商品';
                #只需要展示协议商品
                foreach ($agreementgoodsarr as $k => $v) {
                    $goodsidarrs[] = $v['goodid'];
                }
                $goodsidstring = implode(',',$goodsidarrs);

                $args1[] = array("AND", "find_in_set(goodsid,:goodsidstring)", "goodsidstring", $goodsidstring);
            }elseif ($agreement==3) {
                $agreementmenu['text'] = '协议商品:非协议商品';
                #不做任何的处理  只展示普通商品
                foreach ($agreementgoodsarr as $k => $v) {
                    $goodsidarrs[] = $v['goodid'];
                }
                $goodsidstring = implode(',',$goodsidarrs);
                $args1[] = array("AND", "goodsid not in(".$goodsidstring.")");

            }
            $menu_list[] = $agreementmenu;
        }


        //价格筛选条件
        $pricearr = array();
        $pricearr['0'] = array('url' => urldecode('index.php?item-app-category&catid=' . $catid . '&price=1&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&agreement='.$agreement), 'txt' => '¥0 - ¥1000');
        $pricearr['1'] = array('url' => urldecode('index.php?item-app-category&catid=' . $catid . '&price=2&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&agreement='.$agreement), 'txt' => '¥1001 - ¥3000');
        $pricearr['2'] = array('url' => urldecode('index.php?item-app-category&catid=' . $catid . '&price=3&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&agreement='.$agreement), 'txt' => '¥3001 - ¥5000');
        $pricearr['3'] = array('url' => urldecode('index.php?item-app-category&catid=' . $catid . '&price=4&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&agreement='.$agreement), 'txt' => '¥5000以上');

        //适用机型的筛选条件
        $applytypearr = array();
        $applytypearr['0'] = array('url' => urldecode('index.php?item-app-category&catid=' . $catid . '&applytype=1&price=' . $price . '&brandid=' . $brandid . '&brandids=' . $brandids.'&agreement='.$agreement), 'txt' => '金风1500');
        $applytypearr['1'] = array('url' => urldecode('index.php?item-app-category&catid=' . $catid . '&applytype=2&price=' . $price . '&brandid=' . $brandid . '&brandids=' . $brandids.'&agreement='.$agreement), 'txt' => '金风2X00');
        $applytypearr['2'] = array('url' => urldecode('index.php?item-app-category&catid=' . $catid . '&applytype=3&price=' . $price . '&brandid=' . $brandid . '&brandids=' . $brandids.'&agreement='.$agreement), 'txt' => '金风3000');
        $applytypearr['3'] = array('url' => urldecode('index.php?item-app-category&catid=' . $catid . '&applytype=4&price=' . $price . '&brandid=' . $brandid . '&brandids=' . $brandids.'&agreement='.$agreement), 'txt' => '金风6000');


        //协议商品的筛选条件
        $agreementarr = array();
        $agreementarr['0'] = array('url' => urldecode('index.php?item-app-category&catid=' . $catid . '&agreement=1&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&price='.$price), 'txt' => '全部');
        $agreementarr['1'] = array('url' => urldecode('index.php?item-app-category&catid=' . $catid . '&agreement=2&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&price='.$price), 'txt' => '协议商品');
        $agreementarr['2'] = array('url' => urldecode('index.php?item-app-category&catid=' . $catid . '&agreement=3&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&price='.$price), 'txt' => '非协议商品');

        //-----重新拼接品牌所有数组-----------------
        if ($catid) {
            #查找模型对应的品牌
            $moduleArr = $this->module->getModuleById($cat['catmoduleid']);
            #模型对应品牌
            $moduleBrandsArr = implode(',', unserialize($moduleArr['modulebrands']));
            $args[] = array("AND", "find_in_set(brandid,:moduleBrandsArr)", "moduleBrandsArr", $moduleBrandsArr);
        }

        $brands = $this->brand->getBrandList($args, 1, 10000);
        foreach ($brands['data'] as $k => &$v) {
            $v['first'] = strtoupper(substr($v['brandid'], 0, 1));
            $v['href'] = urldecode('index.php?item-app-category&catid=' . $catid . '&applytype=' . $applytype . '&price=' . $price . '&brandid=' . $v['brandtitle'] . '&brandids=' . $brandids.'&agreement='.$agreement);
        }
        //-----品牌显示结束--------------------------

        $args1[] = array("AND", "goodsstatus = 1");
        if ($catid) {
            $args1[] = array("AND", "find_in_set(goodscatid,:goodscatid)", "goodscatid", $catstring);
        }

        $goods = $this->item->listGoods($args1, $page, 20);

        if ($agreementarrinfos) {
            foreach ($agreementarrinfos as $k => $v) {
                $agreementids[] = $v['agreementid'];
            }
            $agreementids = implode(',',$agreementids);


            foreach ($goods['data'] as $k => &$v) {
                $aa = $this->agreementgoods->getAgreementgoodsPrice($v['goodsid']);
                if($this->agreementgoods->isTrue($v['goodsid'],$agreementids)){
                    $v['type']=1;
                    $v['goodsminprice'] = $aa['agreement_price'];
                    $v['agreementid'] = $aa['agreementid'];
                }

            }
        }

        //--------当没有当前筛选条件的商品时进行商品推荐-----
        $args11 = array();
        $args11[] = array("AND", "goodsstatus = 1");
        $tuijiangoods = $this->item->listGoods($args11, $page, 12);

        //-----获取当前分类的详情-------------------
        $catearr = $this->category->getCateInfo($catid);
        $catename = $catearr['catname'];
        //var_dump($userarr);

        $cate = $this->category->getCateAll();
        $this->tpl->assign('cate', $cate);
        $this->tpl->assign('catid', $catid);
        $this->tpl->assign('catename', $catename);
        $this->tpl->assign('goods', $goods);
        $this->tpl->assign('tuijiangoods', $tuijiangoods);
        $this->tpl->assign('price', $price);
        $this->tpl->assign('applytype', $applytype);
        $this->tpl->assign('brandid', $brandid);
        $this->tpl->assign('brandids', $brandids);
        $this->tpl->assign('menu_list', $menu_list);
        $this->tpl->assign('brands', $brands);
        $this->tpl->assign('pricearr', $pricearr);
        $this->tpl->assign('userarr', $userarr);
        $this->tpl->assign('userAgreementGoods', $userAgreementGoods);
        $this->tpl->assign('agreementarrinfos', $agreementarrinfos);
        $this->tpl->assign('applytypearr', $applytypearr);
        $this->tpl->assign('agreementarr', $agreementarr);
        $this->tpl->assign('agreement', $agreement);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('cat', $cat);
        $this->tpl->display('category');
    }


    private function brand()
    {
        $page = intval($this->ev->get('page'));
        $brands = $this->brand->getBrandList($args, $page, 10);
        $this->tpl->assign('brands', $brands);
        $this->tpl->display('category_a');
    }


    private function search()
    {
        $this->tpl->display('searchGood');
    }

}


?>
