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
		$this->brand = $this->G->make('brand','item');
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
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
			/**
            if($args['itemlimitnumber'] < 1)
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "起订量最少为1"
                );
                exit(json_encode($message));
            }
            **/
			$goods = $this->item->getGoodsById($item['itemgoodsid']);
			$cat = $this->category->getCategoryById($goods['goodscatid']);
			$moduleid = $cat['catmoduleid'];
			$group = $this->user->getGroupById($this->_user['sessiongroupid']);
			$args = $this->module->tidyNeedFieldsPars($args,$moduleid,array('group' => $group));
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
			    "forwardUrl" => "reload"
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
			$fields = $this->module->getMoudleFields($moduleid,$this->user->getModuleUserInfo());
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
        exit(json_encode($message));
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
        exit(json_encode($message));
    }

	private function additem()
	{
		if($this->ev->get('submit'))
		{
			$args = $this->ev->get('args');
			/**
            if($args['itemlimitnumber'] < 1)
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "起订量最少为1"
                );
                exit(json_encode($message));
            }
            **/
			$goodsid = $args['itemgoodsid'];
			$goods = $this->item->getGoodsById($goodsid);
			$cat = $this->category->getCategoryById($goods['goodscatid']);
			$group = $this->user->getGroupById($this->_user['sessiongroupid']);
			$args = $this->module->tidyNeedFieldsPars($args,$cat['catmoduleid'],array('group' => $group));
			$id = $this->item->addItem($args);
			$this->item->setMaxAndMinPrice($goodsid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?item-master-items-stock&goodsid={$args['itemgoodsid']}"
			);
			exit(json_encode($message));
		}
		else
		{
			$goodsid = intval($this->ev->get('goodsid'));
			$goods = $this->item->getGoodsById($goodsid);
			$cat = $this->category->getCategoryById($goods['goodscatid']);
			$moduleid = $cat['catmoduleid'];
			$fields = $this->module->getMoudleFields($moduleid);

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
			$fields = $this->module->getMoudleFields($moduleid,$this->user->getModuleUserInfo());
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
		$goodsid = intval($this->ev->get('goodsid'));
		$goods = $this->item->getGoodsById($goodsid);
		if($this->ev->get('submit'))
		{
			$args = $this->ev->get('args');
			$inargs = array();
			$input = array('goodsuserid','goodscatid','goodsadvprice','goodspostinfo','goodsadv','goodstitle','goodsphotos','goodsthumb','goodscode','goodsbrand','goodsfee','goodsstyle','goodsdescribe','goodsposstime','goodsposetime','huodongstime','huodongetime');
			$user = $this->user->getUserById($args['goodsuserid']);
			$inargs['goodsusername'] = $user['username'];
			foreach($args as $key => $p)
			{
				if(in_array($key,$input))
				{
					$inargs[$key] = $p;
					unset($args[$key]);
				}
			}
			$inargs['goodsproperty'] = $args;
			$this->item->modifyGoods($goodsid,$inargs);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?item-master-items&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		else
		{
			$userid = $this->_user['sessionuserid'];
			$user = $this->user->getUserById($userid);
			$group = $this->user->getGroupById($user['usergroupid']);
			$cat = $this->category->getCategoryById($goods['goodscatid']);
			$moduleid = $cat['catmoduleid'];
			$module = $this->module->getModuleById($moduleid);
			$module['modulebrands'] = unserialize($module['modulebrands']);
			sort($module['modulebrands']);
			$fields = $this->module->getMoudleFields($moduleid,$this->user->getModuleUserInfo());
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
			$brands = $this->brand->getAllBrand();
			$this->tpl->assign('brands',$brands);
			$this->tpl->assign('module',$module);
			$this->tpl->assign('fields',$fields);
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('goodsid',$goodsid);
			$this->tpl->assign('goods',$goods);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('forms',$forms);
			$this->tpl->display('goods_edit');
		}
	}

	private function del()
	{
		$page = intval($this->ev->get('page'));
		$goodsid = intval($this->ev->get('goodsid'));
		$this->item->delGoods($goodsid);
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
		$fields = $this->module->getMoudleFields($moduleid);
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
				foreach($ids as $key => $id)
				{
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
				foreach($ids as $key => $id)
				{
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
				foreach($ids as $key => $id)
				{
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
			    "forwardUrl" => "index.php?{$this->G->app}-master-items&catid={$catid}&page={$page}{$u}"
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
				    "forwardUrl" => "?item-master-items&catid={$catid}&page={$page}{$u}"
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
			$args = $this->ev->get('args');
			$inargs = array();
			$input = array('goodsuserid','goodspostinfo','goodsadvprice','goodscatid','goodsadv','goodstitle','goodsphotos','goodsthumb','goodscode','goodsfee','goodsbrand','goodsstyle','goodsdescribe','goodsposstime','goodsposetime','goodsactivestime','goodsactiveetime');
			if(!$args['goodsuserid'])$args['goodsuserid'] = $this->_user['sessionuserid'];
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
			$id = $this->item->addGoods($inargs);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?item-master-items-additem&goodsid={$id}"
			);
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
				$fields = $this->module->getMoudleFields($moduleid);
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
			$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
			$this->tpl->assign('catid',$catid);
			$this->tpl->assign('parentcat',$parentcat);
			$this->tpl->display('goods_add');
		}
	}

	private function index()
	{
		$search = $this->ev->get('search');
        //var_dump($search);die;
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
		/*$catid = intval($this->ev->get('catid'));
		if(!$catid)$catid = $search['goodscatid'];
		$categories = $this->category->getAllCategory();
		$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0"),array("AND","catapp = 'item'")));


		if($catid)
		{
			$childstring = $this->category->getChildCategoryString($catid);
			$args = array(array("AND","find_in_set(goodscatid,:goodscatid)",'goodscatid',$childstring));
		}
		else $args = array();
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
			if($search['username'])
			{
				$user = $this->user->getUserByUserName($search['username']);
				$args[] = array("AND","goodsuserid = '{$user['userid']}'");
			}
			if($search['goodstatus'])
			{
				if($search['goodstatus'] == -1)
				$gstatus = 0;
				else
				$gstatus = $search['goodstatus'];
				
			}
		}*/

		$brandarr = $this->brand->getAllBrand();

		//----状态查询----------------------查询开始----------------------------------------------------
		if($search['goodsstatus']==1) {
			$args[] = array("AND","goodsstatus = :goodsstatus","goodsstatus",$search['goodsstatus']);
		}elseif($search['goodsstatus']==-1){
			$args[] = array("AND","goodsstatus = :goodsstatus","goodsstatus",0);
		}

		//----店铺查询------------
		if($search['username'])
		{
			$user = $this->user->getUserByUserName($search['username']);
			$args[] = array("AND","goodsuserid = '{$user['userid']}'");
		}

		//----商品的模糊查询--------
		if($search['keyword']){
			$args[] = array("AND","goodstitle LIKE '%{$search['keyword']}%'");
		}

		//--------添加时间的查询-----
		if ($search['stime'] && $search['etime']) {
			if($search['stime'])$args[] = array("AND","goodstime >= '".strtotime($search['stime'])."'");
			if($search['etime'])$args[] = array("AND","goodstime <= '".strtotime($search['etime'])."'");
		}

		$catid = intval($this->ev->get('catid'));
		if(!$catid)$catid = $search['goodscatid'];
		$categories = $this->category->getAllCategory();
		$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0"),array("AND","catapp = 'item'")));
		if($catid)
		{
			$childstring = $this->category->getChildCategoryString($catid);
			$args = array(array("AND","find_in_set(goodscatid,:goodscatid)",'goodscatid',$childstring));
		}
		//----分类查询--------------------------------------查询结束-------------------------------------
        //商品展示只展示发布的商品即商品类型为goodstype =1的
        $args[] = array("AND","goodstype = :goodstype",'goodstype',1);
		$goods = $this->item->listGoods($args,$page);
		$this->tpl->assign('u',$u);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('categories',$categories);
		$this->tpl->assign('catid',$catid);
		$this->tpl->assign('parentcat',$parentcat);
		$this->tpl->assign('goods',$goods);
		$this->tpl->assign('brandarr',$brandarr);
		$this->tpl->display('goods2');
	}

	/*
	*导出商品列表
	*/
	private function export_goods(){
		//搜索条件
        // $keyword = $this->ev->get('keyword');
        // $catid = $this->ev->get('goodscatid');
        // $username = $this->ev->get('username');
        // $goodsstatus = $this->ev->get('goodsstatus');
        // $etime = $this->ev->get('test2');
        // $stime = $this->ev->get('test1');

  //       if($goodsstatus==1) {
		// 	$args[] = array("AND","goodsstatus = :goodsstatus","goodsstatus",$goodsstatus);
		// }elseif(goodsstatus==-1){
		// 	$args[] = array("AND","goodsstatus = :goodsstatus","goodsstatus",0);
		// }

		//----店铺查询------------
		// if($username)
		// {
		// 	$user = $this->user->getUserByUserName($username);
		// 	$args[] = array("AND","goodsuserid = '{$user['userid']}'");
		// }

		// //----商品的模糊查询--------
		// if($keyword){
		// 	$args[] = array("AND","goodstitle LIKE '%{$keyword}%'");
		// }

		// //--------添加时间的查询-----
		// if ($stime && $etime) {
		// 	if($stime)$args[] = array("AND","goodstime >= '".strtotime($stime)."'");
		// 	if($etime)$args[] = array("AND","goodstime <= '".strtotime($etime)."'");
		// }

		//---分類查詢----
		// if($catid)
		// {
		// 	$childstring = $this->category->getChildCategoryString($catid);
		// 	$args = array(array("AND","find_in_set(goodscatid,:goodscatid)",'goodscatid',$childstring));
		// }
        $goodsList = $this->item->listGoods($args,$page,10000000000);
        $categories = $this->category->getAllCategory();
    	$strTable ='<table width="500" border="1">';
    	$strTable .= '<tr>';
    	$strTable .= '<td style="text-align:center;font-size:12px;width:220px;">名称</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="100">物料编码</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">产品类型</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">货号</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">品牌</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">发布时间</td>';
    	$strTable .= '<td style="text-align:center;font-size:12px;" width="*">所属商铺</td>';
    	$strTable .= '</tr>';
	    if(is_array($goodsList)){
	    	
	    	foreach($goodsList['data'] as $k=>$val){
	    		$strTable .= '<tr>';
	    		$strTable .= '<td style="text-align:center;font-size:12px;">&nbsp;'.$val['goodstitle'].'</td>';
	    		$strTable .= '<td style="text-align:left;font-size:12px;">'.$val['wuliaocode'].' </td>';	    		
	    		$strTable .= '<td style="text-align:left;font-size:12px;">'.$categories[$val['goodscatid']]['catname'].'</td>';
	    		$strTable .= '<td style="text-align:left;font-size:12px;">'.$val['goodscode'].'</td>';
	    		$strTable .= '<td style="text-align:left;font-size:12px;">'.$val['goodsbrand'].'</td>';
	    		$strTable .= '<td style="text-align:left;font-size:12px;">'.date("Y-m-d H:i",$val['goodstime']).'</td>';
	    		$strTable .= '<td style="text-align:left;font-size:12px;">'.$val['goodsusername'].'</td>';
	    		$strTable .= '</tr>';
	    	}
	    }
    	$strTable .='</table>';
    	unset($goodsList);
    	$this->item->downloadExcel($strTable,'goods');
    	exit();


	}



   /**
	* @action  商品收藏排行榜
	* @param   number   int
	* @param   page     int
	* @param   list     array
	*/
    private function collect()
    {
        $search = $this->ev->get('search');
        $page = intval($this->ev->get('page'));
        $categories = $this->category->getAllCategory();
        $goods = $this->item->collectlist(0,$page);
        $this->tpl->assign('page',$page);
        $this->tpl->assign('categories',$categories);
        $this->tpl->assign('goods',$goods);
        unset($goods);
        $this->tpl->display('collect');
    }

	/*
	*	修改字段的排序方法
	*/
	private function fieldslite(){

		if($this->ev->get('modifyfieldsequence')){
			$ids = $this->ev->get('ids');
			foreach($ids as $key => $id)
			{
				$this->item->modifyGoods($key,array('sourcestatus' => 1));
			}
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "reload"
			);
			exit(json_encode($message));
		}else{


		}

	}


}


?>
