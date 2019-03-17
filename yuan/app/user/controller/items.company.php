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
        $this->item = $this->G->make('item','item');
        $this->sap = $this->G->make('sap','item');
        $this->brand = $this->G->make('brand','item');
        $this->module = $this->G->make('module');
        $this->collect = $this->G->make('collect','user');
        $this->category = $this->G->make('category');
        $this->category->app = 'item';
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

    private function ajax()
    {
        switch($this->ev->url(4))
        {
            case 'getchildcategory':
                $catid = $this->ev->get('catid');
                $out = '';
                if($catid)
                {
                    $child = $this->category->getCategoriesByArgs(array(array("AND","catparent = :catparent",':catparent',$catid)));
                    foreach($child as $c)
                    {
                        $out .= '<option value="'.$c['catid'].'">'.$c['catname'].'</option>';
                    }
                }
                if($out)
                {
                    $message = array(
                        'statusCode' => 200,
                        "html" => $out
                    );
                    exit(json_encode($message));
                }
                else
                {
                    $message = array(
                        'statusCode' => 300
                    );
                    exit(json_encode($message));
                }
                break;

            case 'getchilddata':
                $catid = $this->ev->get('catid');
                $child = $this->category->getCategoriesByArgs(array(array("AND","catparent = :catparent",':catparent',$catid)));
                exit(json_encode($child));
                $this->tpl->assign('child',$child);
                $this->tpl->assign('catid',$catid);
                $this->tpl->display('category_ajax_data');
                break;

            default:
                break;
        }
    }

	private function askitem()
	{
		$page = $this->ev->get('page');
		$args = array();
		$args[] = array('AND',"askitemcompanyid =  :askitemcompanyid","askitemcompanyid",$this->_user['sessionuserid']);
        $items = $this->item->listAskitem($args,$page);
        $this->tpl->assign('page',$page);
        $this->tpl->assign('items',$items);
        $this->tpl->display('askitem');
	}

	private function history()
	{
		$goodsid = $this->ev->get('goodsid');
		$history = $this->item->getGoodsHistory($goodsid);
		$this->tpl->assign('history',$history);
		$this->tpl->display('goods_history');
	}

	private function edititem()
	{
		$page = intval($this->ev->get('page'));
		if($this->ev->get('modifyitem'))
		{
			$itemid = intval($this->ev->get('itemid'));
			$item = $this->item->getItemById($itemid);
			$args = $this->ev->get('args');
            foreach($args as $key => $val)
            {
                //物料编码字段不是必填
                if($val == '' && $key != 'FJLSBJCL_WLBH')
                {
                    $message = array(
                        'statusCode' => 300,
                        "message" => "请填写必填字段"
                    );
                    exit(json_encode($message));
                }
            }
			$goods = $this->item->getGoodsById($item['itemgoodsid']);
			$cat = $this->category->getCategoryById($goods['goodscatid']);
			$moduleid = $cat['catmoduleid'];
			$group = $this->user->getGroupById($this->_user['sessiongroupid']);
			$args = $this->module->tidyNeedFieldsPars($args,$moduleid,array('group' => $group),'item');
            //如果有物料编号
            if($args['FJLSBJCL_WLBH'])
            {
                $wuliao = $this->user->getWuliaoByCode($args['FJLSBJCL_WLBH']);
                if( !empty($wuliao))
                {
                    $args['FJLSBJCL_WLZ'] = $wuliao[0]['matkl'];
                    $args['FJLSBJCL_WLZMS'] = $wuliao[0]['wgbez'];
                    $args['FJLSBJCL_WLDW'] = $wuliao[0]['meins'];
                }else{
                    $message = array(
                        'statusCode' => 300,
                        "message" => "请输入正确的物料编号"
                    );
                    exit(json_encode($message));
                }
            }
			$this->item->modifyItem($itemid,$args);

			if($item['itemprice'] != $args['itemprice'])
			{
				$info = $this->_user['sessionusername']."将产品id为{$itemid}的子商品价格由{$item['itemprice']}修改为{$args['itemprice']}";
        		$this->item->recordGoodsHistory($item['itemgoodsid'],$info);
			}
			
			if($item['itemfirstprice'] != $args['itemfirstprice'])
			{
				$info = $this->_user['sessionusername']."将产品id为{$itemid}的子商品一代价格由{$item['itemfirstprice']}修改为{$args['itemfirstprice']}";
        		$this->item->recordGoodsHistory($item['itemgoodsid'],$info);
			}
			if($item['itemsecondprice'] != $args['itemsecondprice'])
			{
				$info = $this->_user['sessionusername']."将产品id为{$itemid}的子商品二代价格由{$item['itemsecondprice']}修改为{$args['itemsecondprice']}";
        		$this->item->recordGoodsHistory($item['itemgoodsid'],$info);
			}

			if($item['itemstatus'] != $args['itemstatus'])
			{
				$info = $this->_user['sessionusername']."将产品id为{$itemid}的子商品状态由{$item['itemstatus']}修改为{$args['itemstatus']}，1为上架，0为下架";
        		$this->item->recordGoodsHistory($item['itemgoodsid'],$info);
			}

			$this->item->setMaxAndMinPrice($item['itemgoodsid']);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?user-company-items-stock&goodsid={$item['itemgoodsid']}"
			);
			exit(json_encode($message));
		}
		else
		{
			$itemid = intval($this->ev->get('itemid'));
			$item = $this->item->getItemById($itemid);
			$userid = $this->_user['sessionuserid'];
			$user = $this->user->getUserById($userid);
			$group = $this->user->getGroupById($user['usergroupid']);
			$goods = $this->item->getGoodsById($item['itemgoodsid']);
			$cat = $this->category->getCategoryById($goods['goodscatid']);
			$moduleid = $cat['catmoduleid'];
			$fields = $this->module->getMoudleFields($moduleid,$this->user->getModuleUserInfo(),'item',1);
			$forms = $this->html->buildHtml($fields,$item);
			$this->tpl->assign('fields',$fields);
			$this->tpl->assign('goods',$goods);
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('itemid',$itemid);
			$this->tpl->assign('item',$item);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('forms',$forms);
			$this->tpl->display('item_edit');
		}
	}

	private function delitem()
	{
		$page = intval($this->ev->get('page'));
		$itemid = intval($this->ev->get('itemid'));
		$this->item->delItem($itemid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "callbackType" => "forward",
		    "forwardUrl" => "reload"
		);
		exit(json_encode($message));
	}

	private function goodsup()
	{
//        $message = array(
//            'statusCode' => 200,
//            "message" => "设置成功<a href='http://www.baidu.com'>测试链接地址</a>",
//            "callbackType" => "forward",
//        );
//        $this->G->R($message);

        $goodsid = $this->ev->get('goodsid');
        $args['goodsstatus'] = 1;
        $flag = $this->item->modifyGoods($goodsid,$args);
        $info = $this->_user['sessionusername']."进行了上架操作";
        $this->item->recordGoodsHistory($goodsid,$info);
        if($flag)
        {
            $message = array(
                'statusCode' => 200,
                "message" => "设置成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "reload"
            );
        }
        $this->G->R($message);
	}

    private function goodsdown()
    {
	    $goodsid = $this->ev->get('goodsid');
	    $args['goodsstatus'] = 0;
	    $flag = $this->item->modifyGoods($goodsid,$args);
	    $info = $this->_user['sessionusername']."进行了下架操作";
        $this->item->recordGoodsHistory($goodsid,$info);
	    if($flag)
	    {
	        $message = array(
	            'statusCode' => 200,
	            "message" => "设置成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "reload"
	        );
	    }
	    $this->G->R($message);
    }

	private function additem()
	{
		if($this->ev->get('submit'))
		{
			$args = $this->ev->get('args');
            foreach($args as $key => $val)
            {
                //物料编码字段不是必填
                if($val == '' && $key != 'FJLSBJCL_WLBH')
                {
                    $message = array(
                        'statusCode' => 300,
                        "message" => "请填写必填字段"
                    );
                    exit(json_encode($message));
                }
            }
			$goodsid = $args['itemgoodsid'];
			$goods = $this->item->getGoodsById($goodsid);
			$cat = $this->category->getCategoryById($goods['goodscatid']);
			$group = $this->user->getGroupById($this->_user['sessiongroupid']);
			$args = $this->module->tidyNeedFieldsPars($args,$cat['catmoduleid'],array('group' => $group),'item');
            //如果有物料编号
            if($args['FJLSBJCL_WLBH'])
            {
                $wuliao = $this->user->getWuliaoByCode($args['FJLSBJCL_WLBH']);
                if( !empty($wuliao))
                {
                    $args['FJLSBJCL_WLZ'] = $wuliao[0]['matkl'];
                    $args['FJLSBJCL_WLZMS'] = $wuliao[0]['wgbez'];
                    $args['FJLSBJCL_WLDW'] = $wuliao[0]['meins'];
                }else{
                    $message = array(
                        'statusCode' => 300,
                        "message" => "请输入正确的物料编号"
                    );
                    exit(json_encode($message));
                }
            }
			$id = $this->item->addItem($args);
			$this->item->setMaxAndMinPrice($goodsid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?user-company-items-stock&goodsid={$args['itemgoodsid']}"
			);
			exit(json_encode($message));
		}
		else
		{
			$goodsid = intval($this->ev->get('goodsid'));
			$goods = $this->item->getGoodsById($goodsid);
			$cat = $this->category->getCategoryById($goods['goodscatid']);
			$moduleid = $cat['catmoduleid'];
			$fields = $this->module->getMoudleFields($moduleid,$this->user->getModuleUserInfo(),'item',1);
			$forms = $this->html->buildHtml($fields);
			$tmp = array();
			foreach($fields as $p)
			{
				if($p['fieldsystem'])$tmp[] = $p['field'];
			}

			foreach($forms as $key => $p)
			{
				if(!in_array($p['id'],$tmp))unset($forms[$key]);
			}
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('fields',$fields);
			$this->tpl->assign('forms',$forms);
			$this->tpl->assign('goods',$goods);
			$this->tpl->display('item_add');
		}
	}

	private function poster()
	{
		$this->cart = $this->G->make('cart','item');
		$this->address = $this->G->make('address','user');
		$page = intval($this->ev->get('page'));
		$itemid = intval($this->ev->get('itemid'));
		$item = $this->item->getItemById($itemid);
		if($this->ev->get('setitemposter'))
		{
			$args = $this->ev->get('args');
			$this->item->modifyItem($itemid,array('itemposter' => $args));
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "reload"
			);
			exit(json_encode($message));
		}
		else
		{
			$userid = $this->_user['sessionuserid'];
			$user = $this->user->getUserById($userid);
			$group = $this->user->getGroupById($user['usergroupid']);
			$goods = $this->item->getGoodsById($item['itemgoodsid']);
			$cat = $this->category->getCategoryById($goods['goodscatid']);
			$moduleid = $cat['catmoduleid'];
			$fields = $this->module->getMoudleFields($moduleid,$this->user->getModuleUserInfo(),'item');
			$item['itemposter'] = unserialize($item['itemposter']);
			$this->tpl->assign('fields',$fields);
			$this->tpl->assign('goods',$goods);
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('itemid',$itemid);
			$this->tpl->assign('item',$item);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('provinces',$this->address->getAllProvinces());
			$this->tpl->assign('posters',$this->cart->listPoster());
			$this->tpl->display('item_poster');
		}
	}

	private function edit()
	{
		$page = intval($this->ev->get('page'));
        $edittype = $this->ev->get('edittype');//编辑发布商品为1 编辑草稿为2
		if($this->ev->get('submit'))
		{
            $submitType = $this->ev->get('submit');
            $goodsid = intval($this->ev->get('goodsid'));
            $args = $this->ev->get('args');
            $args['goodstitle'] = stripslashes($args['goodstitle']);
            $args['goodscatid'] = intval($this->ev->get('catid'));
            $args['goodparameter'] = json_encode($args['goodparameter']);
            if($submitType==1) {
                if ($args['goodsthumb'] == 'app/core/styles/images/noimage.gif') {
                    $message = array(
                        'statusCode' => 300,
                        "message" => "请上传缩略图"
                    );
                    exit(json_encode($message));
                }
            }
			$inargs = array();
			$input = array('goodsuserid','goodscatid','goodsadvprice','goodspostinfo','goodsadv','goodstitle','goodsphotos','goodsthumb','goodscode','goodsbrand','goodsfee','goodsstyle','goodsdescribe','goodsposstime','goodsposetime','huodongstime','huodongetime','goodsunit','shui','goodparameter');
			$user = $this->user->getUserById($args['goodsuserid']);
			$inargs['goodsusername'] = $user['username'];
            $inargs['goodstime'] = TIME;
			foreach($args as $key => $p)
			{
				if(in_array($key,$input))
				{
					$inargs[$key] = $p;
					unset($args[$key]);
				}
			}
			$inargs['goodsproperty'] = $args;
			//提交添加商品表 保存更新草稿表
            if($submitType==1){
                if($edittype==1){
                    //更新商品表信息
                    $this->item->modifyGoods($goodsid,$inargs);
                    $info = $this->_user['sessionusername']."进行了修改操作";
                    $this->item->recordGoodsHistory($goodsid,$info);
                    $message = array(
                        'statusCode' => 200,
                        "message" => "操作成功",
                        "callbackType" => "forward",
                        "forwardUrl" => "index.php?user-company-items&page={$page}{$u}"
                    );
                }else{
                    //将此草稿信息添加到商品表中
                    $draftContent = $this->item->getDraftGoodsById($goodsid);
                    if($draftContent['goodsid']==0){
                        $id = $this->item->addGoods($draftContent);
                        //修改草稿表信息状态
                        $inargs['goodstype'] = 0;
                        $this->item->modifyDraftGoods($goodsid,$inargs);
                        $message = array(
                            'statusCode' => 200,
                            "message" => "操作成功",
                            "callbackType" => "forward",
                            "forwardUrl" => "index.php?user-company-items-additem&goodsid={$id}"
                        );
                    }else{
                        $res = $this->item->modifyGoods($draftContent['goodsid'],$inargs);
                        //修改草稿表信息状态
                        $inargs['goodstype'] = 0;
                        $this->item->modifyDraftGoods($goodsid,$inargs);
                        if($res){
                            $message = array(
                                'statusCode' => 200,
                                "message" => "操作成功",
                                "callbackType" => "forward",
                                "forwardUrl" => "index.php?user-company-items&page={$page}{$u}"
                            );
						}
                    }
                }
            }else{
                if($edittype==1){
                    //将此发布的商品信息保存到草稿表中
                    $goodsInfo = $this->item->getGoodsById($goodsid);
                    $res = $this->item->draftGoodsByTitleAndGid($goodsInfo['goodstitle'],$goodsInfo['goodsid']);
                    if(!$res){
                        $inargs['goodsid'] = $goodsInfo['goodsid'];
                        $inargs['goodsuserid'] = $goodsInfo['goodsuserid'];
                        $inargs['goodsusername'] = $goodsInfo['goodsusername'];
                        $inargs['goodstime'] = time();
                        $this->item->addDraftGoods($inargs);
                    }else{
                        $inargs['goodstime'] = time();
                        $this->item->modifyDraftGoods($res['draftid'],$inargs);
					}
                }else{
                    //更新草稿信息
                    $this->item->modifyDraftGoods($goodsid,$inargs);
                }
                $message = array(
                    'statusCode' => 200,
                    "message" => "操作成功",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?user-company-items&page={$page}{$u}"
                );
            }
            exit(json_encode($message));
		}
		else
		{
            $goodsid = intval($this->ev->get('goodsid'));
            if($edittype==2){
                $goods = $this->item->getDraftGoodsById($goodsid);
            }else{
                $goods = $this->item->getGoodsById($goodsid);
            }
            //商品参数
            $goodparameter = json_decode($goods['goodparameter'],true);
            $lenth = count($goodparameter);
            $goods['shui_text'] = $this->sap->getShuiByCode($goods['shui']);
            $goods['shui_text'] = $goods['shui_text']['text1'];
			$userid = $this->_user['sessionuserid'];
			$user = $this->user->getUserById($userid);
			$group = $this->user->getGroupById($user['usergroupid']);
			$cat = $this->category->getCategoryById($goods['goodscatid']);
			$moduleid = $cat['catmoduleid'];
			$module = $this->module->getModuleById($moduleid);
			$module['modulebrands'] = unserialize($module['modulebrands']);
			sort($module['modulebrands']);
			$fields = $this->module->getMoudleFields($moduleid,$this->user->getModuleUserInfo(),'item');
			$forms = $this->html->buildHtml($fields,$goods['goodsproperty']);
			$tmp = array();
			foreach($fields as $p)
			{
				if($p['fieldsystem'])$tmp[] = $p['field'];
			}
			foreach($forms as $key => $p)
			{
				if(in_array($p['id'],$tmp))unset($forms[$key]);
			}
			$currentCateName = $this->category->getCateInfo($goods['goodscatid']);//--当前分类信息---
			$catname = $currentCateName['catname'];

			if ($currentCateName['catparent']) {
				$parentCateName = $this->category->getCateInfo($currentCateName['catparent']);//--父类信息---
				$catname = $parentCateName['catname'].' > '.$catname;
			}
			if ($parentCateName['catparent']) {
				$grandpaName = $this->category->getCateInfo($parentCateName['catparent']);//--顶级父类---
				$catname = $grandpaName['catname'].' > '.$catname;
			}
            $parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
			$brands = $this->brand->getAllBrand();
			//供货范围复现信息
            $cateArr = [
				[
                    'catid'=>$grandpaName['catid'],
				    'catname'=>$grandpaName['catname']
				],
                [
                    'catid'=>$parentCateName['catid'],
                    'catname'=>$parentCateName['catname']
                ],
                [
                    'catid'=>$currentCateName['catid'],
                    'catname'=>$currentCateName['catname']
                ]
			];
			$this->tpl->assign('brands',$brands);
			$this->tpl->assign('module',$module);
			$this->tpl->assign('fields',$fields);
			$this->tpl->assign('catname',$catname);
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('goodsid',$goodsid);
			$this->tpl->assign('goods',$goods);
			$this->tpl->assign('goodparameter',$goodparameter);
            $this->tpl->assign('lenth',$lenth);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('forms',$forms);
            $this->tpl->assign('parentcat',$parentcat);
            $this->tpl->assign('edittype',$edittype);
			$this->tpl->assign('cateArr',$cateArr);
			$this->tpl->display('goods_edit');
		}
	}

	private function del()
	{
		$page = intval($this->ev->get('page'));
		$goodsid = intval($this->ev->get('goodsid'));

		$info = $this->_user['sessionusername']."进行了删除操作";
        $this->item->recordGoodsHistory($goodsid,$info);

		$this->item->delGoods($goodsid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "callbackType" => "forward",
		    "forwardUrl" => "reload"
		);
		exit(json_encode($message));
	}
	//商品草稿删除
	public function draftDel(){
        $goodsid = intval($this->ev->get('goodsid'));

        $this->item->delDraftGoods($goodsid);
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => "forward",
            "forwardUrl" => "reload"
        );
        exit(json_encode($message));
	}
	private function stock()
	{
		$page = $this->ev->get('page');
		$goodsid = $this->ev->get('goodsid');
		$goods = $this->item->getGoodsById($goodsid);
		$args = array();
		$args[] = array("AND","itemgoodsid = :itemgoodsid",'itemgoodsid',$goodsid);
		$items = $this->item->getItemList($args,$page);
		$cat = $this->category->getCategoryById($goods['goodscatid']);
		$moduleid = $cat['catmoduleid'];
		$fields = $this->module->getMoudleFields($moduleid,$this->user->getModuleUserInfo(),'item');
		foreach($fields as $key => $p)
		{
			if(!$p['fieldsystem'])unset($fields[$key]);
		}
		$this->tpl->assign('cat',$cat);
		$this->tpl->assign('fields',$fields);
		$this->tpl->assign('goods',$goods);
		$this->tpl->assign('items',$items);
		$this->tpl->display('item');
	}

	private function lite()
	{
		$page = $this->ev->get('page');
		$this->tpl->assign('page',$page);
		if($this->ev->get('modifycontentsequence'))
		{
			if($this->ev->get('action') == 'delete')
			{
				$ids = $this->ev->get('delids');
				if (!$ids) {
					$message = array(
						'statusCode' => 300,
						"message" => "请勾选商品"
						
					);
					exit(json_encode($message));
				}
				foreach($ids as $key => $id)
				{

					$info = $this->_user['sessionusername']."进行了删除操作";
       				$this->item->recordGoodsHistory($key,$info);
					$this->item->delGoods($key);
				}
			}
			elseif($this->ev->get('action') == 'movecategory')
			{
				$contentids = array();
				$ids = $this->ev->get('delids');
				foreach($ids as $key => $id)
				{
					if($key)$contentids[] = $key;
				}
				$contentids = implode(',',$contentids);
				$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
				$this->tpl->assign('parentcat',$parentcat);
				$this->tpl->assign('contentids',$contentids);
				$this->tpl->display('content_move');
				exit;
			}
			elseif($this->ev->get('action') == 'moveposition')
			{
				$contentids = array();
				$ids = $this->ev->get('delids');
				foreach($ids as $key => $id)
				{
					if($key)$contentids[] = $key;

				}
				$contentids = implode(',',$contentids);
				$poses = $this->position->getAllPosByApp('item');
				$this->tpl->assign('poses',$poses);
				$this->tpl->assign('contentids',$contentids);
				$this->tpl->display('item_position');
				exit;
			}
			elseif($this->ev->get('action') == 'up')
			{
				$contentids = array();
				$ids = $this->ev->get('delids');
				if (!$ids) {
					$message = array(
						'statusCode' => 300,
						"message" => "请勾选商品"
						
					);
					exit(json_encode($message));
				}


				foreach($ids as $key => $id)
				{
					$info = $this->_user['sessionusername']."进行了上架操作";
       				$this->item->recordGoodsHistory($key,$info);


					$args['goodsstatus'] = 1;
					$this->item->modifyGoods($key,$args);
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "reload"
				);
				exit(json_encode($message));
			}
			elseif($this->ev->get('action') == 'down')
			{
				$contentids = array();
				$ids = $this->ev->get('delids');
				if (!$ids) {
					$message = array(
						'statusCode' => 300,
						"message" => "请勾选商品"
						
					);
					exit(json_encode($message));
				}
				foreach($ids as $key => $id)
				{
					$info = $this->_user['sessionusername']."进行了下架操作";
       				$this->item->recordGoodsHistory($key,$info);

					$args['goodsstatus'] = 0;
					$this->item->modifyGoods($key,$args);
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "reload"
				);
				exit(json_encode($message));
			}
			elseif($this->ev->get('action') == 'status')
			{
				$ids = $this->ev->get('delids');
				foreach($ids as $key => $id)
				{
					$this->item->modifyGoods($key,array('sourcestatus' => 1));
				}
			}
			else
			{
				$ids = $this->ev->get('ids');
				foreach($ids as $key => $id)
				{
					$this->item->modifyGoods($key,array('goodssequence' => $id));
				}
			}
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "index.php?{$this->G->app}-company-items&catid={$catid}&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('movecategory'))
		{
			$contentids = explode(',',$this->ev->get('contentids'));
			$targetcatid = $this->ev->get('targetcatid');
			if($targetcatid)
			{
				foreach($contentids as $key => $id)
				{
					if($id)$this->item->modifyGoods($id,array('goodscatid' => $targetcatid));
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "?user-company-items&catid={$catid}&page={$page}{$u}"
				);
			}
			else
			$message = array(
				'statusCode' => 300,
				"message" => "操作失败"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('movecposition'))
		{
			$contentids = explode(',',$this->ev->get('contentids'));
			$position = $this->ev->get('position');
			if($position)
			{
				foreach($contentids as $key => $id)
				{
					if($id)
					{
						$args = array('pctime' => TIME,'pccontentid' => $id,'pcposid' => $position);
						$this->position->addPosContent($args);
					}
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "reload"
				);
			}
			else
			$message = array(
				'statusCode' => 300,
				"message" => "操作失败"
			);
			exit(json_encode($message));
		}
		else
		{
			$message = array(
				'statusCode' => 300,
				"message" => "无效访问"
			);
			exit(json_encode($message));
		}
	}

	private function add()
	{
		if($this->ev->get('submit'))
		{
            //判断提交类型 提交商品类型
            $submitType = $this->ev->get('submit');
			$args = $this->ev->get('args');
            $args['goodstitle'] = stripslashes($args['goodstitle']);
            $args['goodscatid'] = intval($this->ev->get('catid'));
            $args['goodparameter'] = json_encode($args['goodparameter']);
            if($submitType==1) {
                if ($args['goodsthumb'] == 'app/core/styles/images/noimage.gif') {
                    $message = array(
                        'statusCode' => 300,
                        "message" => "请上传缩略图"
                    );
                    exit(json_encode($message));
                }
            }
            //判断商品名称不能为空
            if (empty($args['goodstitle'])) {
                $message = array(
                    'statusCode' => 300,
                    "message" => "商品标题不能为空"
                );
                exit(json_encode($message));
            }
			$inargs = array();
			$input = array('goodsuserid','goodspostinfo','goodsadvprice','goodscatid','goodsadv','goodstitle','goodsphotos','goodsthumb','goodscode','goodsfee','goodsbrand','goodsstyle','goodsdescribe','goodsposstime','goodsposetime','goodsactivestime','goodsactiveetime','goodsunit','shui','goodparameter');
			//$user = $this->user->getUserById($args['goodsuserid']);
            $inargs['goodsuserid'] = $this->_user['sessionuserid'];
			$inargs['goodsusername'] = $this->_user['sessionusername'];
			$inargs['goodstime'] = TIME;
			foreach($args as $key => $p)
			{
				if(in_array($key,$input))
				{
					$inargs[$key] = $p;
					unset($args[$key]);
				}
			}
			$inargs['goodsproperty'] = $args;
            //提交添加商品 保存则作为草稿保存草稿表
            if($submitType==1){
                $id = $this->item->addGoods($inargs);
                $message = array(
                    'statusCode' => 200,
                    "message" => "操作成功",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?user-company-items-additem&goodsid={$id}"
                );
            }else{
                if($this->item->addDraftGoods($inargs)){
                    $message = array(
                        'statusCode' => 200,
                        "message" => "操作成功",
                        "callbackType" => "forward",
                        "forwardUrl" => "index.php?user-company-items"
                    );
				}
            }
			exit(json_encode($message));
		}
		else
		{
			$catid = intval($this->ev->get('catid'));
			$cat = $this->category->getCategoryById($catid);
			if($cat)
			{
				$moduleid = $cat['catmoduleid'];
				$module = $this->module->getModuleById($moduleid);
				$module['modulebrands'] = unserialize($module['modulebrands']);
				sort($module['modulebrands']);
				$fields = $this->module->getMoudleFields($moduleid,$this->user->getModuleUserInfo(),'item');
				$forms = $this->html->buildHtml($fields);
				$tmp = array();
				foreach($fields as $p)
				{
					if($p['fieldsystem'])$tmp[] = $p['field'];
				}
				foreach($forms as $key => $p)
				{
					if(in_array($p['id'],$tmp))unset($forms[$key]);
				}
				$brands = $this->brand->getAllBrand();
				$this->tpl->assign('brands',$brands);
				$this->tpl->assign('cat',$cat);
				$this->tpl->assign('module',$module);
				$this->tpl->assign('forms',$forms);
			}
			$currentCateName = $this->category->getCateInfo($catid);//--当前分类信息---
			$catname = $currentCateName['catname'];
			if ($currentCateName['catparent']) {
				$parentCateName = $this->category->getCateInfo($currentCateName['catparent']);//--父类信息---
				$catname = $parentCateName['catname'].' > '.$catname;
			}
			if ($parentCateName['catparent']) {
				$grandpaName = $this->category->getCateInfo($parentCateName['catparent']);//--顶级父类---
				$catname = $grandpaName['catname'].' > '.$catname;
			}
			$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
            //获取草稿商品
            $args[] = array("AND","goodsuserid = :goodsuserid","goodsuserid",$this->_user['sessionuserid']);
            $args[] = array("AND","goodstype = :goodstype","goodstype",1);
            $goodsdraft = $this->item->listDraftGoods($args,1);
			$this->tpl->assign('catid',$catid);
			$this->tpl->assign('catname',$catname);
			$this->tpl->assign('parentcat',$parentcat);
            $this->tpl->assign('goodsdraft',$goodsdraft);
			$this->tpl->display('goods_add');
		}
	}

	private function index()
	{
		$search = $this->ev->get('search');
		$page = intval($this->ev->get('page'));
		$u = '';
		if($search)
		{
			$this->tpl->assign('search',$search);
			foreach($search as $key => $arg)
			{
				$u .= "&search[{$key}]={$arg}";
			}
		}
		$args22[] = array("AND","status = :status",'status',1);
		$links = $this->link->getLinkList($args22,$page,10);
        $this->tpl->assign('links',$links);
		$this->tpl->assign('u',$u);
		$this->tpl->assign('page',$page);
		$catid = intval($this->ev->get('catid'));
		if(!$catid)$catid = $search['goodscatid'];
		$categories = $this->category->getAllCategory();
		$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
		if($catid)
		{
			$childstring = $this->category->getChildCategoryString($catid);
			$args = array(array("AND","find_in_set(goodscatid,:goodscatid)",'goodscatid',$childstring));
		}
		else $args = array();
        $args[] = array("AND","goodsuserid = :goodsuserid","goodsuserid",$this->_user['sessionuserid']);
		if($search['goodsid'])
		{
			$args[] = array("AND","goodsid = :goodsid",'goodsid',$search['goodsid']);
		}
		else
		{
			if($search['itemcatid'])$args[] = array("AND","goodscatid = '{$search['goodscatid']}'");
			if($search['stime'])$args[] = array("AND","goodstime >= '".strtotime($search['stime'])."'");
			if($search['etime'])$args[] = array("AND","goodstime <= '".strtotime($search['etime'])."'");
			if($search['keyword'])$args[] = array("AND","goodstitle LIKE '%{$search['keyword']}%'");
			if($search['goodstatus'])
			{
				if($search['goodstatus'] == -1)
				$gstatus = 0;
				else
				$gstatus = $search['goodstatus'];
				$args[] = array("AND","goodsstatus = :goodstatus","goodstatus",$gstatus);
			}
		}
		//商品展示只展示发布的商品即商品类型为goodstype =1的
        $args[] = array("AND","goodstype = :goodstype",'goodstype',1);
		$goods = $this->item->listGoods($args,$page);
        $pageStatus = 1;
        //页面判断是搜索数据还是列表数据,true是搜索数据，false是列表数据
        if($search)
        {
            $pageStatus = empty($goods['data']) ? 2 : 1;
        }
        else
        {
            $pageStatus = empty($goods['data']) ? 3 : 1;
        }
		$this->tpl->assign('categories',$categories);
		$this->tpl->assign('catid',$catid);
		$this->tpl->assign('parentcat',$parentcat);
		$this->tpl->assign('goods',$goods);
        $this->tpl->assign('pageStatus',$pageStatus);
        $this->tpl->display('goods');
	}

    /**
     * @action   商品收藏列表
	 * @param    page
	 * @param    getusername  return  array
     */
    public function  goods()
    {
        $page = intval($this->ev->get('page'));
        $categories = $this->category->getAllCategory();
        $goods = $this->collect->getUserByUserName($this->_user['sessionuserid']);
        $this->tpl->assign("page",$page);
        $this->tpl->assign("categories",$categories);
        $this->tpl->assign("goods",$goods);
        $this->tpl->display('goodscollect');
    }

    /*
     * @action   供应商列表
     */
    private function supplier()
    {
        $page = intval($this->ev->get('page'));
        $categories = $this->category->getAllCategory();
        $users = $this->collect->getCompanycollect($this->_user['sessionuserid']);
        $this->tpl->assign("page",$page);
        $this->tpl->assign("categories",$categories);
        $this->tpl->assign("users",$users);
        $this->tpl->display('suppliercollect');
    }
    public function protocolDetails()
	{
		 $this->tpl->display('protocolDetails');
	}
	
}
?>
