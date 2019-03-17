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
        $this->brand = $this->G->make('brand','item');
		$action = $this->ev->url(3);
        $this->link = $this->G->make('link','content');
        $this->agreementgoods = $this->G->make('agreementgoods', 'agreement');
        $this->agreement = $this->G->make('agreement', 'agreement');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->tpl->assign('links',$links);
        $this->cont = $this->G->make('content','purchase');
        $this->cart = $this->G->make('cart','item');
        $this->ppe = $this->G->make('price','purchase');
        $cartNumArr = $this->cart->getCartUserNum();
        $this->updateXunJiaStatus();
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

	private function search()
	{
        $stype = intval($this->ev->get('stype'));   //搜索类型，1按商品2按供应商
		$page = intval($this->ev->get('page'));

        //-----------------搜索新加start-------------------------------
        $page = intval($this->ev->get('page'));
        $parent = intval($this->ev->get('catid'));
        $price = intval($this->ev->get('price'));//---------价格筛选
        $applytype = intval($this->ev->get('applytype'));//--机型筛选
        $brandid = $this->ev->get('brandid');//-------品牌筛选【单选】
        $brandids = $this->ev->get('brandids');//-----品牌筛选【多选】
        $agreement = $this->ev->get('agreement');//协议#非协议筛选

        $args1 = array();
        $menu_list = array();
        $catid = $this->ev->get('catid');
        $cat = $this->category->getCategoryById($catid);
        $catstring = $this->category->getChildCategoryString($catid);
        //-----------------搜索新加end-------------------------------
		$page = $page?$page:1;
		$search = array();
        $keyword = $this->ev->get('keyword');
        $template = 'search_list';

        $userinfoarr = $this->user->getUserById($this->_user['sessionuserid']);
        #根据公司的编码ID查询出所有的合同ID
        $where = array();
        $where[] = array("AND","salerid = :salerid",'salerid',$userinfoarr['sap_company_id']);//公司编码
        $where[] = array("AND","status = :status",'status',3);//生效状态
        $where[] = array("AND","endtime > :endtime",'endtime',time());//当前时间小于协议结束时间

        $agreementarrinfos = $this->agreement->getAgreementListByCompanycode($where);
        foreach ($agreementarrinfos as $k => $v) {
            $agreementarrids[] = $v['agreementid'];
        }
        $agreementarridstring = implode(',',$agreementarrids);

        #根据合同ID查询出所有的商品ID
        $agreementgoodsarr = $this->agreementgoods->getAgreementgoodsByAgreementid($agreementarridstring);
        //按商品名称查
        if($stype == 1)
        {
            if($keyword) $search['keyword'] = $keyword;
            if($search['keyword'])
            {
                $args1[] = array("AND","goodstitle LIKE :goodstitle","goodstitle","%{$search['keyword']}%");

                //----关键词展示--------
                $keywordmenu = array();
                $keywordmenu['text'] = $keyword;
                $keywordmenu['href'] = urldecode('index.php?item-app-index-search&stype=1&price='.$price.'&catid='.$catid.'&applytype='.$applytype.'&brandid='.$brandid.'&brandids='.$brandids);
                $menu_list[] = $keywordmenu;
            }



            //---假如有价格筛选------
            if($price) {
                $pricemenu = array();
                $pricemenu['href'] = urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&applytype='.$applytype.'&brandid='.$brandid.'&brandids='.$brandids);

                if ($price==1) {
                    $args1[] = array("AND","goodsminprice >= :goodsminprice",'goodsminprice',0);
                    $args1[] = array("AND","goodsminprice <= :goodsminprice",'goodsminprice',1000);
                    $pricemenu['text'] = '价格:¥0 - ¥1000';
                } elseif ($price==2) {
                    $args1[] = array("AND","goodsminprice >= :goodsminprice",'goodsminprice',1001);
                    $args1[] = array("AND","goodsminprice <= :goodsminprice",'goodsminprice',3000);
                    $pricemenu['text'] = '价格:¥1001 - ¥3000';
                }elseif ($price==3) {
                    $args1[] = array("AND","goodsminprice >= :goodsminprice",'goodsminprice',3001);
                    $args1[] = array("AND","goodsminprice <= :goodsminprice",'goodsminprice',5000);
                    $pricemenu['text'] = '价格:¥3001 - ¥5000';
                }elseif ($price==4) {
                    $args1[] = array("AND","goodsminprice >= :goodsminprice",'goodsminprice',5001);
                    $pricemenu['text'] = '价格:¥5000以上';
                }
                $menu_list[] = $pricemenu;
            }

            //-----假如有适用机型筛选-----
            if($applytype) {
                $applytypemenu = array();
                $applytypemenu['href'] = urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&price='.$price.'&brandid='.$brandid.'&brandids='.$brandids);
                if($applytype==1) {
                    $args33[] = array("AND","FJLSBJCL_SYJX = :FJLSBJCL_SYJX",'FJLSBJCL_SYJX','金风1500');
                    $itemgoodsarr = $this->item->listGoodsByItemField($args33,$page,$number = 100000);
                    foreach ($itemgoodsarr['data'] as $k => $v) {
                        $itemgoodsids[] = $v['itemgoodsid'];
                    }

                    $itemgoodsids = implode(',',$itemgoodsids);
                    $args1[] = array("AND","find_in_set(goodsid,:itemgoodsids)","itemgoodsids",$itemgoodsids);

                    $applytypemenu['text'] = '适用机型:金风1500';
                }elseif($applytype==2) {
                    $aa = "2";
                    $args33[] = array('AND',"FJLSBJCL_SYJX LIKE :FJLSBJCL_SYJX",'FJLSBJCL_SYJX','%'.$aa.'%');
                    $itemgoodsarr = $this->item->listGoodsByItemField($args33,$page,$number = 100000);
                    foreach ($itemgoodsarr['data'] as $k => $v) {
                        $itemgoodsids[] = $v['itemgoodsid'];
                    }

                    $itemgoodsids = implode(',',$itemgoodsids);
                    $args1[] = array("AND","find_in_set(goodsid,:itemgoodsids)","itemgoodsids",$itemgoodsids);
                    $applytypemenu['text'] = '适用机型:金风2X00';
                }elseif($applytype==3) {
                    $args33[] = array("AND","FJLSBJCL_SYJX = :FJLSBJCL_SYJX",'FJLSBJCL_SYJX','金风3000');
                    $itemgoodsarr = $this->item->listGoodsByItemField($args33,$page,$number = 100000);
                    foreach ($itemgoodsarr['data'] as $k => $v) {
                        $itemgoodsids[] = $v['itemgoodsid'];
                    }

                    $itemgoodsids = implode(',',$itemgoodsids);
                    $args1[] = array("AND","find_in_set(goodsid,:itemgoodsids)","itemgoodsids",$itemgoodsids);

                    $applytypemenu['text'] = '适用机型:金风3000';
                }elseif($applytype==4) {
                    $args33[] = array("AND","FJLSBJCL_SYJX = :FJLSBJCL_SYJX",'FJLSBJCL_SYJX','金风6000');
                    $itemgoodsarr = $this->item->listGoodsByItemField($args33,$page,$number = 100000);
                    foreach ($itemgoodsarr['data'] as $k => $v) {
                        $itemgoodsids[] = $v['itemgoodsid'];
                    }
                    $itemgoodsids = implode(',',$itemgoodsids);
                    $args1[] = array("AND","find_in_set(goodsid,:itemgoodsids)","itemgoodsids",$itemgoodsids);
                    $applytypemenu['text'] = '适用机型:金风6000';
                }

                $menu_list[] = $applytypemenu;
            }

            //----假如有品牌筛选【单选】------
            if($brandid) {
                //$args1[] = array("AND","goodsbrand","goodsbrand",$brandid);
                $brandmenu = array();
                $brandarr = $this->brand->getBrandById($brandid);
                $brandmenu['href'] = urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&price='.$price.'&applytype='.$applytype);
                $brandmenu['text'] = '品牌:'.$brandid;
                $menu_list[] = $brandmenu;
            }

            //----假如有品牌筛选【多选】------
            if($brandids) {
                //$args1[] = array("AND","find_in_set(goodsbrand,:brandids)","brandids",$brandids);
                $brandmenu = array();
                $brandmenu['href'] = urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&price='.$price.'&applytype='.$applytype);
                $brandmenu['text'] = '品牌:'.$brandids;
                $menu_list[] = $brandmenu;
            }

            #---假如有协议商品的筛选----
            if ($agreement) {

                $agreementmenu = array();
                $agreementmenu['href'] = urldecode('index.php?item-app-index-search&stype=1&catid=' . $catid . '&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&price='.$price.'&keyword='.$keyword);

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
            $pricearr['0'] = array('url'=>urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&price=1&applytype='.$applytype.'&brandid='.$brandid.'&brandids='.$brandids),'txt'=>'¥0 - ¥1000');
            $pricearr['1'] = array('url'=>urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&price=2&applytype='.$applytype.'&brandid='.$brandid.'&brandids='.$brandids),'txt'=>'¥1001 - ¥3000');
            $pricearr['2'] = array('url'=>urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&price=3&applytype='.$applytype.'&brandid='.$brandid.'&brandids='.$brandids),'txt'=>'¥3001 - ¥5000');
            $pricearr['3'] = array('url'=>urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&price=4&applytype='.$applytype.'&brandid='.$brandid.'&brandids='.$brandids),'txt'=>'¥5000以上');

            //适用机型的筛选条件
            $applytypearr = array();
            $applytypearr['0'] = array('url'=>urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&applytype=1&price='.$price.'&brandid='.$brandid.'&brandids='.$brandids),'txt'=>'金风1500');
            $applytypearr['1'] = array('url'=>urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&applytype=2&price='.$price.'&brandid='.$brandid.'&brandids='.$brandids),'txt'=>'金风2X00');
            $applytypearr['2'] = array('url'=>urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&applytype=3&price='.$price.'&brandid='.$brandid.'&brandids='.$brandids),'txt'=>'金风3000');
            $applytypearr['3'] = array('url'=>urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&applytype=4&price='.$price.'&brandid='.$brandid.'&brandids='.$brandids),'txt'=>'金风6000');

            //协议商品的筛选条件
            $agreementarr = array();
            $agreementarr['0'] = array('url' => urldecode('index.php?item-app-index-search&stype=1&catid=' . $catid . '&agreement=1&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&price='.$price.'&keyword='.$keyword), 'txt' => '全部');
            $agreementarr['1'] = array('url' => urldecode('index.php?item-app-index-search&stype=1&catid=' . $catid . '&agreement=2&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&price='.$price.'&keyword='.$keyword), 'txt' => '协议商品');
            $agreementarr['2'] = array('url' => urldecode('index.php?item-app-index-search&stype=1&catid=' . $catid . '&agreement=3&applytype=' . $applytype . '&brandid=' . $brandid . '&brandids=' . $brandids.'&price='.$price.'&keyword='.$keyword), 'txt' => '非协议商品');



            $args1[] = array("AND","goodsstatus = 1");
            if ($catid) {
                $args1[] = array("AND","find_in_set(goodscatid,:goodscatid)","goodscatid",$catstring);

                //----分类搜索筛选----
                $catemenu = array();
                $catemenu['href'] = urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&price='.$price.'&applytype='.$applytype.'&brandid='.$brandid.'&brandids='.$brandids);

                $catarr = $this->category->getCategoryById($catid);
                $catemenu['text'] = '分类:'.$catarr['catname'];
                $menu_list[] = $catemenu;

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

            $countgoodsnum = count($goods['data']);
            //------------重新拼接品牌所有数组--------------

            if ($catid) {
                #查找模型对应的品牌
                $moduleArr = $this->module->getModuleById($cat['catmoduleid']);
                #模型对应品牌
                $moduleBrandsArr = implode(',',unserialize($moduleArr['modulebrands']));
                $args55[] = array("AND","find_in_set(brandid,:moduleBrandsArr)","moduleBrandsArr",$moduleBrandsArr);
            } else {

               /*#模糊搜索出所有的商品对应的分类ID并且去重处理
               foreach ($goods['data'] as $k => $v) {
                   $catidsarr[] = $v['goodscatid'];
               }
               $catidstring = implode(',',array_unique($catidsarr));

               #查找所有分类下的对应的模型ID
               $args66[] = array("AND","find_in_set(catid,:catidstring)","catidstring",$catidstring);
               $categoryArr = $this->category->getCategoryList($args66,1,$number = 20000000000);

               #查找所有的分类对应的模型ID
               foreach ($categoryArr['data'] as $k => $v) {
                   $categoryMoudleArr[] = $v['catmoduleid'];
               }
               $categoryMoudlestring = implode(',',array_unique($categoryMoudleArr));

               #查询出模型列表
               $args77[] = array("AND","find_in_set(moduleid,:categoryMoudlestring)","categoryMoudlestring",$categoryMoudlestring);

               $modulearr =  $this->module->getModuleList($args77,$page,$number = 20);
               foreach ($modulearr['data'] as $k => $v) {
                   $moudlebrandidsarr[] = $v['modulebrands'];
               }
               #合并二维数组为一维数组
               $brandarrs = array_reduce($moudlebrandidsarr, 'array_merge', array());
               $brandstring = implode(',',$brandarrs);
               $args55[] = array("AND","find_in_set(brandid,:brandstring)","brandstring",$brandstring);*/

            }

            $brands = $this->brand->getBrandList($args55,1,100000);
            foreach ($brands['data'] as $k => &$v) {
                $v['first'] = strtoupper(substr($v['brandid'],0,1));
                $v['href'] = urldecode('index.php?item-app-index-search&stype=1&keyword='.$keyword.'&catid='.$catid.'&applytype='.$applytype.'&price='.$price.'&brandid='.$v['brandtitle'].'&brandids='.$brandids);
            }
            //-------------品牌展示结束-----------------------


            //--------当没有当前筛选条件的商品时进行商品推荐-----
            $args11 = array();
            $args11[] = array("AND","goodsstatus = 1");
            $tuijiangoods = $this->item->listGoods($args11,$page,12);
            $userarr = $this->user->getUserListByArgs(1,$args,200000000000);


        }else{
            header("location:index.php?company-app-index&stype=2&keyword=".$keyword."&page=".$page);die;

        }

        $cate = $this->category->getCateAll();
        $this->tpl->assign('cate',$cate);
        $this->tpl->assign('goods',$goods);
        $this->tpl->assign('tuijiangoods',$tuijiangoods);
        $this->tpl->assign('countgoodsnum',$countgoodsnum);
        $this->tpl->assign('price',$price);
        $this->tpl->assign('applytype',$applytype);
        $this->tpl->assign('brandid',$brandid);
        $this->tpl->assign('brandids',$brandids);
        $this->tpl->assign('menu_list',$menu_list);
        $this->tpl->assign('brands',$brands);
        $this->tpl->assign('pricearr',$pricearr);
        $this->tpl->assign('userarr',$userarr);
        $this->tpl->assign('userAgreementGoods', $userAgreementGoods);
        $this->tpl->assign('agreementarrinfos', $agreementarrinfos);
        $this->tpl->assign('agreementarr', $agreementarr);
        $this->tpl->assign('agreement', $agreement);
        $this->tpl->assign('applytypearr',$applytypearr);
        $this->tpl->assign('page',$page);
        $this->tpl->assign('cat',$cat);
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
        //$userall = $this->user->getUsersByArgs();
        //---最新分类下商品展示--------------张建超 7.20---
        $args = array();
        $args[] = array("AND","goodsstatus = :goodsstatus",'goodsstatus',1);
        $args[] = array("AND","goodscatid = :goodscatid",'goodscatid',125);
        $biaopin = $this->item->listGoodsByCateId($args,$page,8);
        $userinfoarr = $this->user->getUserById($this->_user['sessionuserid']);
        #根据公司的编码ID查询出所有的合同ID
        $where = array();
        $where[] = array("AND","salerid = :salerid",'salerid',$userinfoarr['sap_company_id']);//公司编码
        $where[] = array("AND","status = :status",'status',3);//生效状态
        $where[] = array("AND","endtime > :endtime",'endtime',time());//结束时间要大于当前时间
        $agreementarrinfos = $this->agreement->getAgreementListByCompanycode($where);
        if ($agreementarrinfos) {
            foreach ($agreementarrinfos as $k => $v) {
                $agreementarrids[] = $v['agreementid'];
            }
            $agreementarridstring = implode(',',$agreementarrids);

            #根据合同ID查询出所有的商品ID
            $agreementgoodsarr = $this->agreementgoods->getAgreementgoodsByAgreementid($agreementarridstring);
            $agreementgoodsarrTemp = array();
            foreach ($agreementgoodsarr as $k => $v) {
                $agreementgoodsarrTemp[$v['goodid']] = $v;
                $goodsidarrs[] =  $v['goodid'];
            }
            //var_dump($agreementgoodsarr,$agreementgoodsarrTemp);die;
            $goodsidstring = implode(',',$goodsidarrs);
            $args[] = array("AND", "find_in_set(goodsid,:goodsidstring)", "goodsidstring", $goodsidstring);
            $biaopin = $this->item->listUserGoods($args,$page,8);
            #重新组装商品列表 使商品价格等于上传的协议的价格
            if ($biaopin['data']) {
                foreach ($biaopin['data'] as $k1 => &$v1) {
                   //$aa = $this->agreementgoods->getAgreementgoodsPrice($v1['goodsid']);
                    $aa = $agreementgoodsarrTemp[$v1['goodsid']];
                    $v1['goodsminprice'] = $aa['agreement_price'];
                    $v1['agreementid'] = $aa['agreementid'];
                }
            }
            //var_dump($biaopin['data']);die;
        }


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
        //$this->tpl->assign('userall',$userall);
        $this->tpl->assign('biaopin',$biaopin);
        $this->tpl->assign('userAgreementGoods',$userAgreementGoods);
        $this->tpl->assign('agreementarrinfos',$agreementarrinfos);
        $this->tpl->assign('links',$links);
        $this->tpl->assign('bannerarr',$bannerarr);
        $this->tpl->assign('islogin',$islogin);
        $this->tpl->assign('role',$userinfoarr['users_role']);
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

    /**
     * 首页根据当前时间判断询价单状态更改
     * @author zhuhongyu
     * @time 2018/11/29
     */
    private function updateXunJiaStatus(){

        $userId = $this->_user['sessionuserid'];
        $time = time();
        $args[] = array("AND","purchase_invitation.user_id = :user_id","user_id",$userId);
        $args[] = array("AND","status = :status","status",1);
        $dataInfo = $this->cont->getNoticeInfo($args,1,100);
        //剔除报过价的数据
        foreach ($dataInfo['data'] as $k => &$v) {
            //判断我是否对此询价报过价
            $isBaojia = $this->ppe->priceAllList($v['purchase_new_id'],$userId);
            if($isBaojia){
                unset($dataInfo['data'][$k]);
            }
        }
        //遍历数据更改已过截止日期的询价单状态
        foreach ($dataInfo['data'] as $val){

            $t = $val['end_time'] -$time;
            $updatas['status'] = 4;
            if($t < 0){
                $this->cont->updatePurchase($val['purchase_new_id'],$updatas);
            }
        }
    }

}


?>
