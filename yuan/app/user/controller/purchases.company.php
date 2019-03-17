<?php

require_once 'alisb/vendor/autoload.php';

use Aliyun\Core\Config;
use Aliyun\Core\Profile\DefaultProfile;
use Aliyun\Core\DefaultAcsClient;
use Aliyun\Api\Sms\Request\V20170525\SendSmsRequest;
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
        $this->ppe = $this->G->make('price','purchase');
		$this->tpl->assign('purchasestatus',array(0 => '开放','达成合作','关闭'));
		$this->cate = $this->G->make('category');
        $this->cate->app = 'item';
        $this->category->app = 'purchase';
        $this->content = $this->G->make('content','purchase');
        $this->con = $this->G->make('content','company');
        $this->ppe = $this->G->make('price','purchase');
        $this->pricerecord = $this->G->make('pricerecord','purchase');
        $this->clarify = $this->G->make('clarify','user');
        $modules = $this->module->getModulesByApp('purchase');
        $this->tpl->assign('modules',$modules);
        $this->msg = $this->G->make('msg','user');
        $this->user = $this->G->make('user','user');
        $this->item = $this->G->make('item','item');
		$action = $this->ev->url(3);
		$search = $this->ev->get('search');
        $this->collect = $this->G->make('collect','user');
		$this->u = '';
		if($search)
		{
			$this->tpl->assign('search',$search);
			foreach($search as $key => $arg)
			{
				$this->u .= "&search[{$key}]={$arg}";
			}
		}
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
		$this->tpl->assign('search',$search);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}
	private function catsmenu()
	{
        $catid = $this->ev->get('catid');
		$categories = $this->category->getAllCategory();
        $r = array();
        $this->category->selected = $catid;
        $this->category->hrefpre = 'index.php?user-company-purchases&catid=';
        $this->category->levelCategory($r,0,$this->category->tidycategories);
        $this->category->resetCategoryIndex($r);
        echo 'var treeData = '.json_encode($r);
        exit();
	}
	private function add()
	{
		if($this->ev->get('submit'))
		{
            //判断提交类型
            $submitType = $this->ev->get('submit');
			$args = $this->ev->get('args');
			$args['purchaseuserid'] = $this->_user['sessionuserid'];
			$args['purchaseusername'] = $this->_user['sessionusername'];
            //判断名称不能为空
            if (empty($args['purchasetitle'])) {
                $message = array(
                    'statusCode' => 300,
                    "message" => "采购标题不能为空"
                );
                exit(json_encode($message));
            }
			if (!$args['purchaseinputtime']) {
				$args['purchaseinputtime'] = TIME;
			} else {
				$args['purchaseinputtime'] = strtotime($args['purchaseinputtime']);
			}
			if (!$args['purchase_recivetime']) {
				$args['purchase_recivetime'] = '';
			} else {
				$args['purchase_recivetime'] = strtotime($args['purchase_recivetime']);
			}
			if (!$args['purchase_finishtime']) {
				$args['purchase_finishtime'] = '';
			} else {
				$args['purchase_finishtime'] = strtotime($args['purchase_finishtime']);
			}
			if ($args['purchase_recivetime'] && $args['purchase_finishtime'] ) {
				if ($args['purchase_recivetime'] < $args['purchase_finishtime']) {
					$message = array(
	                    'statusCode' => 300,
	                    "message" => "收货时间不能小于采购时间"
	                );
	                exit(json_encode($message));
				}
			}
			if($args['purchase_items']){
				$args['purchase_items'] = serialize($args['purchase_items']);
			}
			//项目的开工时间 和 截至时间
			if (!$args['service_endtime']) {
				$args['service_endtime'] = TIME;
			} else {
				$args['service_endtime'] = strtotime($args['service_endtime']);
			}
			if (!$args['service_starttime']) {
				$args['service_starttime'] = TIME;
			} else {
				$args['service_starttime'] = strtotime($args['service_starttime']);
			}
			if ($args['service_endtime'] && $args['service_starttime'] ) {
				if ($args['service_endtime'] < $args['service_starttime']) {
					$message = array(
	                    'statusCode' => 300,
	                    "message" => "项目截至时间不能小于开始时间"
	                );
	                exit(json_encode($message));
				}
			}
			if(!$args['purchasetemplate'])$args['purchasetemplate'] = $args['purchasetemplate'];

            if($submitType==1){
                //发布正式的采购信息保存采购信息表
                $res = $this->content->addContent($args);
            }else{
                //保存采购信息数据到采购草稿表
                $res = $this->content->addDraftContent($args);
            }
			if($res){
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => "forward",
				    "forwardUrl" => "index.php?user-company-purchases&catid={$args['purchasecatid']}"
				);
				exit(json_encode($message));
			}
		}
		else
		{
			$catid = intval($this->ev->get('catid'));
            $moduleid = intval($this->ev->get('moduleid'));
			$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
            $userid = $this->_user['sessionuserid'];
            $user = $this->user->getUserById($userid);
            $group = $this->user->getGroupById($user['usergroupid']);
            $fields = $this->module->getMoudleFields($moduleid,$this->user->getModuleUserInfo(),'purchase');
            $forms = $this->html->buildHtml($fields);
			$tpls = array();
			foreach(glob("app/content/tpls/app/content_*.tpl") as $p)
			{
				$tpls[] = substr(basename($p),0,-4);
			}
            //获取采购信息草稿数据
            $args = array();
            $args[] = array("AND","purchaseuserid = :purchaseuserid","purchaseuserid",$this->_user['sessionuserid']);
            $args[] = array("AND","purchase_status = :purchase_status","purchase_status",1);
            $purchasedraft = $this->content->getDraftContentList($args,1);
			$this->tpl->assign('moduleid',$moduleid);
            $this->tpl->assign('forms',$forms);
            $this->tpl->assign('tpls',$tpls);
			$this->tpl->assign('parentcat',$parentcat);
			$this->tpl->assign('catid',$catid);
            $this->tpl->assign('purchasedraft',$purchasedraft);
			$this->tpl->display('purchase_add');
		}
	}
	private function edit()
	{
		$page = intval($this->ev->get('page'))==0?1:intval($this->ev->get('page'));
        $edittype = intval($this->ev->get('edittype'));
		if($this->ev->get('submit'))
		{
			$contentid = intval($this->ev->get('purchaseid'));
            $submitType = $this->ev->get('submit');
			$args = $this->ev->get('args');
			if(!$args['purchaseinputtime']){
				$args['purchaseinputtime'] = TIME;
            }
			else{
                $args['purchaseinputtime'] = strtotime($args['purchaseinputtime']);
                $args['purchasemodifytime'] = TIME;
			}
			if (!$args['purchase_recivetime']) {
				$args['purchase_recivetime'] = '';
			} else {
				$args['purchase_recivetime'] = strtotime($args['purchase_recivetime']);
			}
			if (!$args['purchase_finishtime']) {
				$args['purchase_finishtime'] = '';
			} else {
				$args['purchase_finishtime'] = strtotime($args['purchase_finishtime']);
			}

			if (!$args['service_endtime']) {
				$args['service_endtime'] = TIME;
			} else {
				$args['service_endtime'] = strtotime($args['service_endtime']);
			}
			if (!$args['service_starttime']) {
				$args['service_starttime'] = TIME;
			} else {
				$args['service_starttime'] = strtotime($args['service_starttime']);
			}
            if($args['purchase_items']){
                $args['purchase_items'] = serialize($args['purchase_items']);
            }else{
                $args['purchase_items'] = '';
			}
			unset($args['purchasecatid']);
            if($submitType==1){
            	if($edittype==1){
					//更新采购表信息
					$this->content->modifyContent($contentid,$args);
				}else{
                    //将此草稿信息添加到采购表中

                    $draftContent = $this->content->getDraftContentById($contentid);
                    if($draftContent['purchaseid']==0){
                        $args['purchaseuserid'] = $draftContent['purchaseuserid'];
                        $args['purchaseusername'] = $draftContent['purchaseusername'];
                        $res = $this->content->addContent($args);
					}else{
                        $res =$this->content->modifyContent($draftContent['purchaseid'],$args);
					}
                    if($res){
                    	//修改草稿表信息状态
                        $args['purchase_status'] = 0;
                        $this->content->modifyDraftContent($contentid,$args);
					}
				}
            }else{
            	if($edittype==1){
					//将此发布的采购信息保存到草稿表中
                    $caigouInfo = $this->content->getContentById($contentid);
                    $res = $this->content->draftContentByTitleAndPid($caigouInfo['purchasetitle'],$caigouInfo['purchaseid']);
                    if(!$res){
                        $args['purchaseid'] = $caigouInfo['purchaseid'];
                        $args['purchaseuserid'] = $caigouInfo['purchaseuserid'];
                        $args['purchaseusername'] = $caigouInfo['purchaseusername'];
                        $args['purchaseinputtime'] = time();
                        $this->content->addDraftContent($args);
					}else{
                        $args['purchaseinputtime'] = time();

                        $this->content->modifyDraftContent($res['draftid'],$args);
					}
				}else{
                    //更新草稿信息
                    $this->content->modifyDraftContent($contentid,$args);
				}
            }
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?user-company-purchases&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		else
		{
			$catid = intval($this->ev->get('catid'));
			$cat = $this->category->getCategoryById($catid);
			$contentid = intval($this->ev->get('purchaseid'));
			if($edittype==2){
                $content = $this->content->getDraftContentById($contentid);
			}else{
                $content = $this->content->getContentById($contentid);
			}
			$userid = $this->_user['sessionuserid'];
			$user = $this->user->getUserById($userid);
			$group = $this->user->getGroupById($user['usergroupid']);
			$fields = $this->module->getMoudleFields($content['purchasemoduleid'],$this->user->getModuleUserInfo(),'purchase');
			$forms = $this->html->buildHtml($fields,$content);
			$tpls = array();
			foreach(glob("app/content/tpls/app/content_*.tpl") as $p)
			{
				$tpls[] = substr(basename($p),0,-4);
			}
           if(is_string($content['purchase_items'])){
               $content['purchase_items']= unserialize($content['purchase_items']);
		   }
			foreach ($content['purchase_items'] as $val){
				$purchaseinfo[] = $val;
			}
            $randid = TIME . rand(1111, 9999);
            $parm = '';
            $picparm = '';
            $purchaseinfostr = '';
            foreach ($purchaseinfo as $key => $p) {
                if (is_array($p)) {
                    foreach ($p as $tp) {
                        $parm .= '<input type="hidden" name="args[purchase_items][' . $randid . '][' . $key . '][]" value="' . $tp . '" />';
                    }
                } else {
                    $parm .= '<input type="hidden" name="args[purchase_items][' . $randid . '][' . $key . ']" value="' . $p . '" />';
                }
                foreach($p['pics'] as $key1 => $pic)
                {
                    $picparm .= '<a href="'.$pic.'" target="_blank">图'.intval($key1 + 1).'</a> &nbsp;';
                }
                $purchaseinfostr .= "<tr><td>{$parm}{$p['purchaseName']}</td><td>{$p['deviceModule']}</td><td>{$p['deviceBrand']}</td><td>{$p['summary']}</td><td>{$p['deviceCount']}</td><td><a href=\"{$p['attach']}\">下载</a></td><td>".$picparm."</td><td><a href=\"javascript:;\" onclick=\"javascript:$(this).parents('tr').first().remove();\">删除</a></td></tr>";
            }
            $this->tpl->assign('tpls',$tpls);
			$this->tpl->assign('fields',$fields);
			$this->tpl->assign('catid',$catid);
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('purchaseid',$contentid);
			$this->tpl->assign('purchase',$content);
            $this->tpl->assign('purchaseinfostr',$purchaseinfostr);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('forms',$forms);
            $this->tpl->assign('edittype',$edittype);
			$this->tpl->display('purchase_edit');
		}
	}
	//采购详情
	private function detail()
	{
		$page = intval($this->ev->get('page'));
		if(!$this->ev->get('purchaseid'))
		{
			$contentid = intval($this->ev->get('purchaseid'));
			$content = $this->content->getContentById($contentid);
			$args = $this->ev->get('args');
			if(!$args['purchaseinputtime'])$args['purchaseinputtime'] = TIME;
			else
			$args['purchaseinputtime'] = strtotime($args['purchaseinputtime']);
			$args['purchasemodifytime'] = TIME;

			if (!$args['purchase_recivetime']) {
				$args['purchase_recivetime'] = TIME;
			} else {
				$args['purchase_recivetime'] = strtotime($args['purchase_recivetime']);
			}
			if (!$args['purchase_finishtime']) {
				$args['purchase_finishtime'] = TIME;
			} else {
				$args['purchase_finishtime'] = strtotime($args['purchase_finishtime']);
			}

			if (!$args['service_endtime']) {
				$args['service_endtime'] = TIME;
			} else {
				$args['service_endtime'] = strtotime($args['service_endtime']);
			}
			if (!$args['service_starttime']) {
				$args['service_starttime'] = TIME;
			} else {
				$args['service_starttime'] = strtotime($args['service_starttime']);
			}
			unset($args['purchasecatid']);
			$this->content->modifyContent($contentid,$args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?user-company-purchases&catid={$content['purchasecatid']}&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		else
		{
			$catid = intval($this->ev->get('catid'));
			$cat = $this->category->getCategoryById($catid);
			$contentid = intval($this->ev->get('purchaseid'));
			$content = $this->content->getContentById($contentid);
			$userid = $this->_user['sessionuserid'];
			$user = $this->user->getUserById($userid);
			$group = $this->user->getGroupById($user['usergroupid']);
			$fields = $this->module->getMoudleFields($content['purchasemoduleid'],$this->user->getModuleUserInfo(),'purchase');
			$forms = $this->html->buildHtml($fields,$content);
			$tpls = array();
			foreach(glob("app/content/tpls/app/content_*.tpl") as $p)
			{
				$tpls[] = substr(basename($p),0,-4);
			}
            if(is_string($content['purchase_items'])){
                $content['purchase_items']= unserialize($content['purchase_items']);
            }
            foreach ($content['purchase_items'] as $val){
                $purchaseinfo[] = $val;
            }
            $randid = TIME . rand(1111, 9999);
            $parm = '';
            $picparm = '';
            $purchaseinfostr = '';
            foreach ($purchaseinfo as $key => $p) {
                if (is_array($p)) {
                    foreach ($p as $tp) {
                        $parm .= '<input type="hidden" name="args[purchase_items][' . $randid . '][' . $key . '][]" value="' . $tp . '" />';
                    }
                } else {
                    $parm .= '<input type="hidden" name="args[purchase_items][' . $randid . '][' . $key . ']" value="' . $p . '" />';
                }
                foreach($p['pics'] as $key1 => $pic)
                {
                    $picparm .= '<a href="'.$pic.'" target="_blank">图'.intval($key1 + 1).'</a> &nbsp;';
                }
                $purchaseinfostr .= "<tr><td>{$parm}{$p['purchaseName']}</td><td>{$p['deviceModule']}</td><td>{$p['deviceBrand']}</td><td>{$p['summary']}</td><td>{$p['deviceCount']}</td><td><a href=\"{$p['attach']}\">下载</a></td><td>".$picparm."</td></tr>";
            }
            $this->tpl->assign('purchaseinfostr',$purchaseinfostr);
			$this->tpl->assign('tpls',$tpls);
			$this->tpl->assign('fields',$fields);
			$this->tpl->assign('catid',$catid);
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('purchaseid',$contentid);
			$this->tpl->assign('purchase',$content);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('forms',$forms);
			$this->tpl->display('purchase_detail');
		}
	}
	private function del()
	{
		$page = intval($this->ev->get('page'));
		$contentid = intval($this->ev->get('purchaseid'));
		$content = $this->content->getContentById($contentid);
		$this->content->delContent($contentid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "callbackType" => "forward",
		    "forwardUrl" => "index.php?user-company-purchases&catid={$content['purchasecatid']}&page={$page}"
		);
		exit(json_encode($message));
	}
	//采购信息草稿删除
	public function draftDel(){
		$contentid = intval($this->ev->get('purchaseid'));
		$this->content->delDraftContent($contentid);
		$message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => "forward",
            "forwardUrl" => "index.php?user-company-purchases&page={$page}"
        );
		exit(json_encode($message));
	}
	private function lite()
	{
		$ids = $this->ev->get('ids');

		if ($ids) {
			foreach ($ids as $key => $value) {
				$this->content->modifyBasciContent($key,array('purchasesequence' => $value));
			}

			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "?user-company-purchases"
			);
			exit(json_encode($message));

		} else {
			$message = array(
				'statusCode' => 300,
				"message" => "无效提交"
			);
			exit(json_encode($message));
		}

	}
	private function addpage()
	{
		$this->tpl->display('addpurchase');
	}
	private function setpricestatus()
	{
        $ppeid = intval($this->ev->get('ppeid'));
        $ppe = $this->ppe->getPurchasePriceById($ppeid);
        $purchase = $this->content->getContentById($ppe['ppepurchaseid']);
        if($purchase['purchasestatus']==1)
		{
            $message = array(
                'statusCode' => 300,
                "message" => "该采购已经关闭，不能再接受意向"
            );
            exit(json_encode($message));
		}
        $status = intval($this->ev->get('status'));
        $this->ppe->modifyPurchasePrice($ppeid,array('ppestatus' => $status));
        if($status == 1)
		{
            $this->content->modifyContent($ppe['ppepurchaseid'],array('purchasestatus' => 1));
		}
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => "forward",
            "forwardUrl" => "reload"
        );
        exit(json_encode($message));
	}
	private function updatestatus()
	{

		$purchaseid = intval($this->ev->get('purchaseid'));
		$content = $this->content->getContentById($contentid);
		if($content['purchasestatus']==2)
		{
            $message = array(
                'statusCode' => 300,
                "message" => "该采购已经关闭，不能再接受意向"
            );
            exit(json_encode($message));
		}
		$this->content->modifyContent($purchaseid,array('purchasestatus' => 2));
		$message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => "forward",
            "forwardUrl" => "reload"
        );
        exit(json_encode($message));


		//$args = $this->ev->get('args');

		/*$this->content->modifyContent($purchaseid,array('purchasestatus' => 1));

        $ppeid = intval($this->ev->get('ppeid'));
        $ppe = $this->ppe->getPurchasePriceById($ppeid);
        $purchase = $this->content->getContentById($ppe['ppepurchaseid']);
        if($purchase['purchasestatus'])
		{
            $message = array(
                'statusCode' => 300,
                "message" => "该采购已经关闭，不能再接受意向"
            );
            exit(json_encode($message));
		}
        $status = intval($this->ev->get('status'));
        $this->ppe->modifyPurchasePrice($ppeid,array('ppestatus' => $status));
        if($status == 1)
		{
            $this->content->modifyContent($ppe['ppepurchaseid'],array('purchasestatus' => 1));
		}
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => "forward",
            "forwardUrl" => "reload"
        );
        exit(json_encode($message));*/
	}
	private function pricedetail()
	{
        $ppeid = intval($this->ev->get('ppeid'));
        $ppeuserid=$this->ev->get('ppeuserid');
        $userarr = $this->user->getUserById($ppeuserid);
        $companyname = $userarr['company_name'];
        $company_intro = strip_tags($userarr['company_intro']);

        //var_dump($company_intro);die;
        $ppe = $this->ppe->getPurchasePriceById($ppeid);

       /* echo "<pre/>";
        print_r($ppe['ppeinfo']['area']);
        echo "<pre/>";*/

        $this->tpl->assign('ppe',$ppe);
        $this->tpl->assign('companyname',$companyname);
        $this->tpl->assign('company_intro',$company_intro);
		$this->tpl->display('purchase_pricedetail');
	}
    private function pricelist()
	{
        $purchaseid = intval($this->ev->get('purchaseid'));
		$page = intval($this->ev->get('page'));
        $page = $page?$page:1;
        $args = array();
        $args[] = array("AND","ppepurchaseid = :ppepurchaseid","ppepurchaseid",$purchaseid);
        $prices = $this->ppe->getPurchasePriceList($args,$page);
        $purchase = $this->content->getContentById($purchaseid);
        $this->tpl->assign('purchase',$purchase);
        $this->tpl->assign('prices',$prices);
		$this->tpl->display('purchase_pricelist');
	}
	private function getpricednumber()
	{
        $purchaseid = intval($this->ev->get('purchaseid'));
        echo intval($this->ppe->getPricedNumber($purchaseid));
	}
	private function index()
	{
		//头部关键词 搜索
		$keyword = strip_tags($this->ev->get('keyword'));
		$search = $this->ev->get('search');
		$catid = intval($this->ev->get('catid'));
		$page = intval($this->ev->get('page'));
		$modifypurchasesequence = $this->ev->get('modifypurchasesequence');
		//var_dump($search);
		$page = $page?$page:1;
		if(!$catid)$catid = $search['purchasecatid'];
		$categories = $this->category->getAllCategory();
		$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0"),array("AND","catapp = 'purchase'")));
		if($catid)
		{
			$childstring = $this->category->getChildCategoryString($catid);
			$args = array(array("AND","find_in_set(purchasecatid,:purchasecatid)",'purchasecatid',$childstring));
		}
		else $args = array();
        $args[] = array("AND","purchaseuserid = :purchaseuserid","purchaseuserid",$this->_user['sessionuserid']);

        if($search['purchasestatus'])$args[] = array("AND","purchasestatus = :purchasestatus",'purchasestatus',$search['purchasestatus']);

        if($search['purchasetype'])$args[] = array("AND","purchasetype LIKE :purchasetype",'purchasetype',"%{$search['purchasetype']}%");

		if($search['purchaseid'])
		{
			$args[] = array("AND","purchaseid = :purchaseid",'purchaseid',$search['purchaseid']);
		}else{
			if($search['purchasecatid'])$args[] = array("AND","purchasecatid = :purchasecatid",'purchasecatid',$search['purchasecatid']);
			if($search['purchasemoduleid'])$args[] = array("AND","purchasemoduleid = :purchasemoduleid",'purchasemoduleid',$search['purchasemoduleid']);
			if($search['stime'])$args[] = array("AND","purchaseinputtime >= :scontentinputtime",'scontentinputtime',strtotime($search['stime']));
			if($search['etime'])$args[] = array("AND","purchaseinputtime <= :econtentinputtime",'econtentinputtime',strtotime($search['etime']));
			if($search['keyword'])$args[] = array("AND","purchasetitle LIKE :contenttitle",'purchasetitle',"%{$search['keyword']}%");

			//头部关键词搜索
			if($keyword)$args[] = array("AND","purchasetitle LIKE :contenttitle",'purchasetitle',"%{$keyword}%");
		}
		//仅显示发布的采购信息草稿不做展示
        $args[] = array("AND","purchase_status = :purchase_status","purchase_status",1);

		$contents = $this->content->getContentList($args,$page,5);
		$catlevel = 1;
		if($catid)
		{
            $pos = $this->category->getCategoryPos($catid);
            if(count($pos))
            $catlevel = count($pos) + 1;
		}

        $isHaveData = $contents['data'] ? 1 : 0;
        $this->tpl->assign('catlevel',$catlevel);
		$this->tpl->assign('catid',$catid);
		$this->tpl->assign('search',$search);
        $this->tpl->assign('isHaveData',$isHaveData);
		$this->tpl->assign('purchases',$contents);
		$this->tpl->assign('parentcat',$parentcat);
		$this->tpl->assign('categories',$categories);
		$this->tpl->assign('page',$page);
		$this->tpl->display('purchase');
	}
	private function follow()
	{

		$search = $this->ev->get('search');
		$page = intval($this->ev->get('page'));
		$page = $page ? $page : 1;

		if($search['purchasestatus'])$args1[] = array("AND","purchasestatus = :purchasestatus",'purchasestatus',$search['purchasestatus']);

		if($search['stime'])$args1[] = array("AND","purchaseinputtime >= :scontentinputtime",'scontentinputtime',strtotime($search['stime']));
		if($search['etime'])$args1[] = array("AND","purchaseinputtime <= :econtentinputtime",'econtentinputtime',strtotime($search['etime']));
		if($search['purchasetitle'])$args1[] = array("AND","purchasetitle LIKE :contenttitle",'purchasetitle',"%{$search['purchasetitle']}%");
		if($search['purchasetype'])$args1[] = array("AND","purchasetype LIKE :purchasetype",'purchasetype',"%{$search['purchasetype']}%");
		if($search['purchaseusername'])$args1[] = array("AND","purchaseusername LIKE :purchaseusername",'purchaseusername',"%{$search['purchaseusername']}%");


		$args1[] = array("AND","ppeuserid = :ppeuserid",'ppeuserid',$this->_user['sessionuserid']);//完成状态
		$contentlist = $this->ppe->getPurchaseFollowList($args1,$page,$number = 5,$order = 'ppeid DESC');

		//var_dump($contentlist );die;

		$search = $this->ev->get('search');
		$catid = intval($this->ev->get('catid'));
		$page = intval($this->ev->get('page'));
		$page = $page?$page:1;
		if(!$catid)$catid = $search['purchasecatid'];
		$categories = $this->category->getAllCategory();
		$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0"),array("AND","catapp = 'purchase'")));
		if($catid)
		{
			$childstring = $this->category->getChildCategoryString($catid);
			$args = array(array("AND","find_in_set(purchasecatid,:purchasecatid)",'purchasecatid',$childstring));
		}
		else $args = array();
        $args[] = array("AND","purchaseuserid = :purchaseuserid","purchaseuserid",$this->_user['sessionuserid']);
		if($search['purchaseid'])
		{
			$args[] = array("AND","purchaseid = :purchaseid",'purchaseid',$search['purchaseid']);
		}
		else
		{
			if($search['purchasecatid'])$args[] = array("AND","purchasecatid = :purchasecatid",'purchasecatid',$search['purchasecatid']);
			if($search['purchasemoduleid'])$args[] = array("AND","purchasemoduleid = :purchasemoduleid",'purchasemoduleid',$search['purchasemoduleid']);
			if($search['stime'])$args[] = array("AND","purchaseinputtime >= :scontentinputtime",'scontentinputtime',strtotime($search['stime']));
			if($search['etime'])$args[] = array("AND","purchaseinputtime <= :econtentinputtime",'econtentinputtime',strtotime($search['etime']));
			if($search['keyword'])$args[] = array("AND","purchasetitle LIKE :contenttitle",'purchasetitle',"%{$search['keyword']}%");
		}
		$contents = $this->content->getContentList($args,$page,10);
		$catlevel = 1;
		if($catid)
		{
            $pos = $this->category->getCategoryPos($catid);
            if(count($pos))
            $catlevel = count($pos) + 1;
		}
        $this->tpl->assign('catlevel',$catlevel);
		$this->tpl->assign('catid',$catid);
		$this->tpl->assign('purchases',$contentlist);
		$this->tpl->assign('parentcat',$parentcat);
		$this->tpl->assign('categories',$categories);
		$this->tpl->assign('page',$page);
		$this->tpl->display('follow');
	}
	private function ask()
	{

		$search = $this->ev->get('search');
		$page = intval($this->ev->get('page'));
		$page = $page ? $page : 1;
		$contents = $this->content->getContentList(array(),$page,20);
		$userids = array();

		//var_dump($search);die;

		if($search['ppestatus'])$args1[] = array("AND","ppestatus = :ppestatus",'ppestatus',$search['ppestatus']);

		if($search['stime'])$args1[] = array("AND","ppetime >= :scontentinputtime",'scontentinputtime',strtotime($search['stime']));
		if($search['etime'])$args1[] = array("AND","ppetime <= :econtentinputtime",'econtentinputtime',strtotime($search['etime']));
		if($search['purchasetitle'])$args1[] = array("AND","purchasetitle LIKE :contenttitle",'purchasetitle',"%{$search['purchasetitle']}%");
		if($search['purchasetype'])$args1[] = array("AND","purchasetype LIKE :purchasetype",'purchasetype',"%{$search['purchasetype']}%");
		if($search['purchaseusername'])$args1[] = array("AND","purchaseusername LIKE :purchaseusername",'purchaseusername',"%{$search['purchaseusername']}%");


		$args1[] = array("AND","purchaseuserid = :purchaseuserid",'purchaseuserid',$this->_user['sessionuserid']);
		//$args1[] = array("AND","ppestatus = :ppestatus",'ppestatus',3);
		$contentlist = $this->ppe->getPurchaseFollowList($args1,$page,$number = 5,$order = 'ppeid DESC');



		foreach($contentlist['data'] as $key => $p )
		{
            $userids[] = $p['ppeuserid'];
		}


		$userids = implode(',',$userids);
		$users = $this->user->getUsersByArgs(array(array("AND","find_in_set(userid,:userids)","userids",$userids)));

		$search = $this->ev->get('search');
		$catid = intval($this->ev->get('catid'));
		$page = intval($this->ev->get('page'));
		$page = $page?$page:1;
		if(!$catid)$catid = $search['purchasecatid'];
		$categories = $this->category->getAllCategory();
		$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0"),array("AND","catapp = 'purchase'")));
		if($catid)
		{
			$childstring = $this->category->getChildCategoryString($catid);
			$args = array(array("AND","find_in_set(purchasecatid,:purchasecatid)",'purchasecatid',$childstring));
		}
		else $args = array();
        $args[] = array("AND","purchaseuserid = :purchaseuserid","purchaseuserid",$this->_user['sessionuserid']);
		if($search['purchaseid'])
		{
			$args[] = array("AND","purchaseid = :purchaseid",'purchaseid',$search['purchaseid']);
		}
		else
		{
			if($search['purchasecatid'])$args[] = array("AND","purchasecatid = :purchasecatid",'purchasecatid',$search['purchasecatid']);
			if($search['purchasemoduleid'])$args[] = array("AND","purchasemoduleid = :purchasemoduleid",'purchasemoduleid',$search['purchasemoduleid']);
			if($search['stime'])$args[] = array("AND","purchaseinputtime >= :scontentinputtime",'scontentinputtime',strtotime($search['stime']));
			if($search['etime'])$args[] = array("AND","purchaseinputtime <= :econtentinputtime",'econtentinputtime',strtotime($search['etime']));
			if($search['keyword'])$args[] = array("AND","purchasetitle LIKE :contenttitle",'purchasetitle',"%{$search['keyword']}%");
		}
		$contents = $this->content->getContentList($args,$page,10);
		$catlevel = 1;
		if($catid)
		{
            $pos = $this->category->getCategoryPos($catid);
            if(count($pos))
            $catlevel = count($pos) + 1;
		}
		$this->tpl->assign('users',$users);
        $this->tpl->assign('catlevel',$catlevel);
		$this->tpl->assign('catid',$catid);
		$this->tpl->assign('purchases',$contentlist);
		$this->tpl->assign('parentcat',$parentcat);
		$this->tpl->assign('categories',$categories);
		$this->tpl->assign('page',$page);
		$this->tpl->display('ask');
	}
    /**
     * 询价发布2018-10-23
	 * @author zhuhongyu
     * 2018-11-22优化，这个方法变成old
     */
    private function xunJianPushold()
    {
        if($_POST)
        {
            $infos = $_POST;
            //判断提交类型
            $submitType = $_POST['submit'];
            $userInfo = explode(',',$_POST['xunjia_invitation']);//邀请的供应商
			$cgwz = $_POST['cgwz'];
            $infos['xunjia_ren']   = $this->_user['sessionuserid'];//询价发布者ID
            $infos['end_time']     = strtotime($_POST['end_time']);//报价截止时间
            $infos['expire_time']  = strtotime($_POST['expire_time']);//到货日期
            $infos['create_time']  = time();//到货日期
			//获取询价人信息
            $xunjiaCompany = $this->user->getUserById($this->_user['sessionuserid']);
            $company_name = $xunjiaCompany['company_name'];
            if(!empty($infos)){
                if($submitType==1){
                	//判断是否该用户一发过相同询价
                    $args[] = array("AND","xunjia_ren = :xunjia_ren","xunjia_ren",$this->_user['sessionuserid']);
                    $args[] = array("AND","xunjia_title = :xunjia_title","xunjia_title",$infos['xunjia_title']);
                    $args[] = array("AND","status != :status","status",4);
                    $dataXunjia = $this->content->getPurchaseList($args,1);
					if(!empty($dataXunjia['data'])){
                        $message = array(
                            'statusCode' => 300,
                            "message" => "您已发布过相同标题的询价！",
                            "callbackType" => "forward",
                            "forwardUrl" => "reload"
                        );
                        exit(json_encode($message));
					}
                    //保存正式询价信息到询价发布表
                    $infos['status']  = 1;
                    $res = $this->content->addXunjiaContent($infos);
                    if($res){
                        foreach ($cgwz as $k=>&$val){
                            $val['purchase_new_id'] = $res;
                            //添加采购物资到采购物资数据表
                            $this->content->addMaterialContent($val);
                        }
                    	foreach ($userInfo as $item){
                            //添加邀请的供应商
                            $args1['purchase_new_id'] = $res;
                            $args1['user_id'] = $item;
                            $this->content->addXunjiaUserContent($args1);
                            //发送一条定向消息
                            $args2['msg_userid'] = $item;
                            $args2['msg_title'] = '询价邀请函';
                            $args2['msg_time'] = time();
                            $args2['msg_url'] = 'index.php?user-company-message-messageinfo&msg_id=';
                            $args2['status'] = 0;
                            $args2['msg_type'] = 3;
                            $args2['msg_content'] = '天工e购电子询比价采购平台受 <a href="index.php?company-app-company-index&companyid='.$this->_user['sessionuserid'].'" style="color: #ff8a00">'.$company_name.'</a>（以下简称“询价人”）委托，将 <a href="index.php?purchase-app-content&id='.$res.'" style="color: #ff8a00">'.$infos['xunjia_title'].'</a> 项目采购进行邀请询价，现邀请潜在供应商参与报价。<br/>
                            <a style="color:#ff8a00;" target="_blank" href="http://10.72.8.42:8014/index.php?purchase-app-content-baoJiaXuZhi">报价人须知</a>';
                            $this->msg->systemSendMsg($args2);
                            $userData = $this->user->getUserById($item);
                            $this->sendphonemsg('SMS_151576857',$userData['company_mobile'],'createXun','{"company_name":"'.$company_name.'","infos":"'.$infos['xunjia_title'].'"}');
						}
                    }
                }else{
                    //保存询价信息到询价发布草稿表
                    $infos['status']  = 0;
                    $res = $this->content->addDraftXunjiaContent($infos);
                    if($res){
                        foreach ($cgwz as $k=>&$val){
                            $val['purchase_new_id'] = $res;
                            //添加采购物资到采购物资数据表
                            $this->content->addMaterialContent($val);
                        }
					}
                }
                if($res){
                    $message = array(
                        'statusCode' => 200,
                        "message" => "操作成功",
                        "callbackType" => "forward",
                        "forwardUrl" => "index.php?user-company-purchases-inquiry"
                    );
                    exit(json_encode($message));
                }
            }else{
                $message = array(
                    'statusCode' => 300,
                    "message" => "操作失败,发布信息不能为空！",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?user-company-purchases-xunJianPush"
                );
                exit(json_encode($message));
            }
		}else{
        	//获取草稿信息
            $args = array();
            $args[] = array("AND","xunjia_ren = :xunjia_ren","xunjia_ren",$this->_user['sessionuserid']);
            $args[] = array("AND","status = :status","status",0);
            //获取省级列表
            $provinceArr = $this->collect->getProvinceList();
            $purchasedraft = $this->content->getPurchaseNewDraftList($args,1);
            //获取一级分类
            $parentcat = $this->cate->getCategoriesByArgs(array(array("AND","catparent = 0")));
            $this->tpl->assign('parentcat',$parentcat);
            $this->tpl->assign('purchaseDraft',$purchasedraft);
            $this->tpl->assign('provinceArr', $provinceArr);
            $this->tpl->display('enquiry');
		}
    }

    /**
     * 询价发布2018-11-22优化
     * zhangpeng
     */
    private function xunJianPush()
    {
        if($_POST)
        {
            $infos = $_POST;
            //判断提交类型
            $submitType = $_POST['submit'];
            $userInfo = explode(',',$_POST['xunjia_invitation']);//邀请的供应商
            $cgwz = $_POST['cgwz'];
            $infos['xunjia_ren']   = $this->_user['sessionuserid'];//询价发布者ID
            $infos['end_time']     = strtotime($_POST['end_time']);//报价截止时间
            $infos['expire_time']  = strtotime($_POST['expire_time']);//到货日期
            $infos['create_time']  = time();//到货日期
            //获取询价人信息
            $xunjiaCompany = $this->user->getUserById($this->_user['sessionuserid']);
            $company_name = $xunjiaCompany['company_name'];
            if(!empty($infos)){
                if($submitType==1){
                    //判断是否该用户一发过相同询价
                    $args[] = array("AND","xunjia_ren = :xunjia_ren","xunjia_ren",$this->_user['sessionuserid']);
                    $args[] = array("AND","xunjia_title = :xunjia_title","xunjia_title",$infos['xunjia_title']);
                    $args[] = array("AND","status != :status","status",4);
                    $dataXunjia = $this->content->getPurchaseList($args,1);
                    if(!empty($dataXunjia['data'])){
                        $message = array(
                            'statusCode' => 300,
                            "message" => "您已发布过相同标题的询价！",
                            "callbackType" => "forward",
                            "forwardUrl" => "reload"
                        );
                        exit(json_encode($message));
                    }
                    //保存正式询价信息到询价发布表
                    $infos['status']  = 1;
                    $res = $this->content->addXunjiaContent($infos);
                    if($res){
                        $addMaterialRet = $this->content->batchAddMaterialContent($cgwz,$res); //添加采购物资到采购物资数据表
                        foreach ($userInfo as $item){
                            //添加邀请的供应商
                            $args1['purchase_new_id'] = $res;
                            $args1['user_id'] = $item;
                            $this->content->addXunjiaUserContent($args1);
                            //发送一条定向消息
                            $args2['msg_userid'] = $item;
                            $args2['msg_title'] = '询价邀请函';
                            $args2['msg_time'] = time();
                            $args2['msg_url'] = 'index.php?user-company-message-messageinfo&msg_id=';
                            $args2['status'] = 0;
                            $args2['msg_type'] = 3;
                            $args2['msg_content'] = '天工e购电子询比价采购平台受 <a href="index.php?company-app-company-index&companyid='.$this->_user['sessionuserid'].'" style="color: #ff8a00">'.$company_name.'</a>（以下简称“询价人”）委托，将 <a href="index.php?purchase-app-content&id='.$res.'" style="color: #ff8a00">'.$infos['xunjia_title'].'</a> 项目采购进行邀请询价，现邀请潜在供应商参与报价。<br/>
                            <a style="color:#ff8a00;" target="_blank" href="index.php?purchase-app-content-baoJiaXuZhi">报价人须知</a>';
                            $this->msg->systemSendMsg($args2);
                        }
                        //批量发送短信
                        $userData = $this->user->getUserListByUserIds($_POST['xunjia_invitation']);
                        $userMobileStr = implode(',',array_column($userData,'company_mobile'));
                        $this->sendphonemsg('SMS_151576857',$userMobileStr,'createXun','{"company_name":"'.$company_name.'","infos":"'.$infos['xunjia_title'].'"}');
                    }
                }else{
                    //保存询价信息到询价发布草稿表
                    $infos['status']  = 0;
                    $res = $this->content->addDraftXunjiaContent($infos);
                    if($res){
                        $addMaterialRet = $this->content->batchAddMaterialContent($cgwz,$res); //添加采购物资到采购物资数据表
                    }
                }
                if($res){
                    $message = array(
                        'statusCode' => 200,
                        "message" => "操作成功",
                        "callbackType" => "forward",
                        "forwardUrl" => "index.php?user-company-purchases-inquiry"
                    );
                    exit(json_encode($message));
                }
            }else{
                $message = array(
                    'statusCode' => 300,
                    "message" => "操作失败,发布信息不能为空！",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?user-company-purchases-xunJianPush"
                );
                exit(json_encode($message));
            }
        }else{
            //获取草稿信息
            $args = array();
            $args[] = array("AND","xunjia_ren = :xunjia_ren","xunjia_ren",$this->_user['sessionuserid']);
            $args[] = array("AND","status = :status","status",0);
            //获取省级列表
            $provinceArr = $this->collect->getProvinceList();
            $purchasedraft = $this->content->getPurchaseNewDraftList($args,1);
            //获取一级分类
            $parentcat = $this->cate->getCategoriesByArgs(array(array("AND","catparent = 0")));
            $this->tpl->assign('parentcat',$parentcat);
            $this->tpl->assign('purchaseDraft',$purchasedraft);
            $this->tpl->assign('provinceArr', $provinceArr);
            $this->tpl->display('enquiry');
        }
    }

    /**
     * 获取城市信息根据省ID
     */
    public function getcity(){
        $queryProvince = $this->ev->get('fatherId');
        $cityArr = $this->collect->getCityByFather($queryProvince);
        exit(json_encode($cityArr));
	}
    /**
     * 询价草稿编辑2018-10-25
	 * @author zhuhongyu
     */
	private function xunJianDraftEdit()
	{
        $id = intval($this->ev->get('id'));
        if($_POST)
        {
            //判断提交类型
            $submitType = $_POST['submit'];
            $id = $_POST['id'];
            $cgwz = $_POST['cgwz'];
            if(isset($_POST['xunjia_invitation'])){
                $infos['xunjia_invitation']  = $_POST['xunjia_invitation'];
                $userInfo = explode(',',$_POST['xunjia_invitation']);//邀请的供应商
            }
            $infos['xunjia_ren']   = $this->_user['sessionuserid'];//询价发布者ID
			if(isset($_POST['xunjia_title'])){
                $infos['xunjia_title']  = $_POST['xunjia_title'];
			}
            if(isset($_POST['taxrate'])){
                $infos['taxrate']  = $_POST['taxrate'];
            }
            if(isset($_POST['xunjia_explain'])){
                $infos['xunjia_explain']  = $_POST['xunjia_explain'];
            }
            if(isset($_POST['pay_num'])){
                $infos['pay_num']  = $_POST['pay_num'];
            }
            if(isset($_POST['end_time'])){
                $infos['end_time']  = strtotime($_POST['end_time']);//报价截止时间
            }
            if(isset($_POST['expire_time'])){
                $infos['expire_time']  = strtotime($_POST['expire_time']);//到货日期
            }
            if(isset($_POST['pay_type'])){
                $infos['pay_type']  = $_POST['pay_type'];
            }
            if(isset($_POST['technicalfile_url'])){
                $infos['technicalfile_url']  = $_POST['technicalfile_url'];
            }
            if(isset($_POST['technicalfile_title'])){
                $infos['technicalfile_title']  = $_POST['technicalfile_title'];
            }
            if(isset($_POST['businessfile_url'])){
                $infos['businessfile_url']  = $_POST['businessfile_url'];
            }
            if(isset($_POST['businessfile_title'])){
                $infos['businessfile_title']  = $_POST['businessfile_title'];
            }
            if(isset($_POST['other_url'])){
                $infos['other_url']  = $_POST['other_url'];
            }
            if(isset($_POST['other_title'])){
                $infos['other_title']  = $_POST['other_title'];
            }
            //获取询价人信息
            $xunjiaCompany = $this->user->getUserById($this->_user['sessionuserid']);
            $company_name = $xunjiaCompany['company_name'];
            if(!empty($infos)){
                if($submitType==1){
                    //判断是否该用户一发过相同询价
                    $args[] = array("AND","xunjia_ren = :xunjia_ren","xunjia_ren",$this->_user['sessionuserid']);
                    $args[] = array("AND","xunjia_title = :xunjia_title","xunjia_title",$infos['xunjia_title']);
                    $args[] = array("AND","status != :status","status",4);
                    $dataXunjia = $this->content->getPurchaseList($args,1);
                    if(!empty($dataXunjia['data'])){
                        $message = array(
                            'statusCode' => 300,
                            "message" => "您已发布过相同标题的询价！",
                            "callbackType" => "forward",
                            "forwardUrl" => "reload"
                        );
                        exit(json_encode($message));
                    }
                    //将草稿箱内容发布到正式
                    $infos['status']  = 1;
                    $infos['create_time'] = time();
                    $res = $this->content->addXunjiaContent($infos);
                    if($res){
                        $addMaterialRet = $this->content->batchAddMaterialContent($cgwz,$res); //添加采购物资到采购物资数据表
                        foreach ($userInfo as $item){
                            //添加邀请的供应商
                            $args1['purchase_new_id'] = $res;
                            $args1['user_id'] = $item;
                            $this->content->addXunjiaUserContent($args1);
                            //发送一条定向消息
                            $args2['msg_userid'] = $item;
                            $args2['msg_title'] = '询价邀请函';
                            $args2['msg_time'] = time();
                            $args2['msg_url'] = 'index.php?user-company-message-messageinfo&msg_id=';
                            $args2['status'] = 0;
                            $args2['msg_type'] = 3;
                            $args2['msg_content'] = '天工e购电子询比价采购平台受 <a href="index.php?company-app-company-index&companyid='.$this->_user['sessionuserid'].'" style="color: #ff8a00">'.$company_name.'</a>（以下简称“询价人”）委托，将 <a href="index.php?purchase-app-content&id='.$res.'" style="color: #ff8a00">'.$infos['xunjia_title'].'</a> 项目采购进行邀请询价，现邀请潜在供应商参与报价。
                            <a style="color:#ff8a00;" target="_blank" href="index.php?purchase-app-content-baoJiaXuZhi">报价人须知</a>';
                            $this->msg->systemSendMsg($args2);
                        }

                        $args3['status']  = 1;
                        $res = $this->content->modifyDraftXunjiaContent($id,$args3);
                        //批量发送短信
                        $userData = $this->user->getUserListByUserIds($_POST['xunjia_invitation']);
                        $userMobileStr = implode(',',array_column($userData,'company_mobile'));
                        $this->sendphonemsg('SMS_151576857',$userMobileStr,'createXun','{"company_name":"'.$company_name.'","infos":"'.$infos['xunjia_title'].'"}');
					}
                }else{
                    //更新草稿箱信息
                    $infos['create_time'] = time();
                    $res = $this->content->modifyDraftXunjiaContent($id,$infos);
                    if($res){
						$this->content->delMaterialContent($id);
                        $addMaterialRet = $this->content->batchAddMaterialContent($cgwz,$id); //添加采购物资到采购物资数据表
					}
                }
                if($res){
                    $message = array(
                        'statusCode' => 200,
                        "message" => "操作成功",
                        "callbackType" => "forward",
                        "forwardUrl" => "index.php?user-company-purchases-inquiry"
                    );
                    exit(json_encode($message));
                }
            }else{
                $message = array(
                    'statusCode' => 300,
                    "message" => "操作失败,发布信息不能为空！",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?user-company-purchases-xunJianPush"
                );
                exit(json_encode($message));
            }
        }else{
            //获取编辑的草稿信息
            $purchaseDraftInfo = $this->content->getDraftXunjiaContentById($id);
            //获取采购数据信息
            $materialInfo = $this->content->getMaterialContent($id);
            //获取搜索供应商回显数据并返回到页面
			$userArr = explode(',',$purchaseDraftInfo['xunjia_invitation']);
            $str = '';
			if(!empty($userArr[0])){
                foreach ($userArr as $item){
                    $user = $this->user->getUserById($item);
                    $str .= "<li name=".$item.">".$user['company_name']."</li>";
                }
			}
            //获取省级列表
            $provinceArr = $this->collect->getProvinceList();
            //获取一级分类
            $parentcat = $this->cate->getCategoriesByArgs(array(array("AND","catparent = 0")));
            $this->tpl->assign('parentcat',$parentcat);
            $this->tpl->assign('provinceArr', $provinceArr);
            $this->tpl->assign('infos',$purchaseDraftInfo);
            $this->tpl->assign('id',$id);
            $this->tpl->assign('materialInfo',$materialInfo);
            $this->tpl->assign('str',$str);
            $this->tpl->display('enquiry_edit');
        }
	}

    /**
     * 询价草稿删除
	 * @author zhuhongyu
     */
    private function xunJianDraftDel()
    {
        $id = intval($this->ev->get('id'));
        $this->content->delPurchaseNewDraftContent($id);
        $this->content->delMaterialContent($id);
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => "forward",
            "forwardUrl" => "reload"
        );
        exit(json_encode($message));
    }
    /**
     * 确认订单页面 公司模糊搜索
	 * @author zhuhongyu
     */
    private function getCompanyByCode()
    {
        $code = $this->ev->get('code');
        $city = $this->ev->get('city');
        $catid = $this->ev->get('catid');
        if($code)$args[] = array("AND","company_name LIKE :company_name",'company_name',"%{$code}%");//关键字搜索
        if($city)$args[] = array("AND","company_city =:company_city",'company_city',$city);
        if($catid)$args[] = array("AND","cate_id =:cate_id",'cate_id',$catid);
        $args[] = array("AND","users_role = :users_role","users_role",0);
        $is_lianbiao  = 0;
        if($catid){
           $is_lianbiao = 1;
		}
		if($is_lianbiao){
            $data = $this->content->getCompanyByCode($args,1);
		}else{
            $data = $this->content->getCompanyByCode2($args,1);
		}
        $html = '<ul>';
        foreach ($data['data'] as $key=>$val) {
            $html .= '<li name="'.$val['userid'].'">'.$val['company_name'].'</li>';
        }
        $html .= '</ul>';
        $message = array(
            "statusCode" => 200,
            "message" => "操作成功",
            "data" => $html,
        );
        exit(json_encode($message));

    }

    //询价管理2018-10-25  zhangjianchao
    private function inquiry()
    {
    	//头部关键词 搜索
		$keyword = strip_tags($this->ev->get('keyword'));
		$type = intval($this->ev->get('purchasetype'));
		$status = intval($this->ev->get('purchasestatus'));
		$stime = strtotime($this->ev->get('stime'));
		$etime = strtotime($this->ev->get('etime'));
        $pageType = $this->ev->get('t');    //点击搜索传过来的参数，用来区分展示搜索结婚还是列表数据
		$page = intval($this->ev->get('page'))?intval($this->ev->get('page')):1;

		//搜索条件
		if($keyword)$args[] = array("AND","xunjia_title LIKE :xunjia_title",'xunjia_title',"%{$keyword}%");//关键字搜索
        if($status)$args[] = array("AND","status = :status",'status',$status);//状态
        if($type)$args[] = array("AND","xunjia_type = :xunjia_type",'xunjia_type',$type);//类型

        if ($stime) {
        	if($stime)$args[] = array("AND","create_time >= '".$stime."'");//发布开始时间
        }

        if ($etime) {
            if($etime)$args[] = array("AND","create_time <= '".$etime."'");//发布结束时间
        }

        //var_dump($this->_user['sessionuserid']);
        $args[] = array("AND","xunjia_ren = :xunjia_ren",'xunjia_ren',$this->_user['sessionuserid']);
        $contentarr = $this->content->getPurchaseList($args,$page,10);

        $num = 1;
        foreach ($contentarr['data'] as $k => &$v) {
        	//某条询价信息过了截止日期并且有人报价则修改为待定标状态
        	$v['offernum'] = $this->content->getPurchseNumber($v['id']);
        	if($v['status']==1){
        		if ((time()>$v['end_time']) && $v['offernum']) {

	        		$args1['status'] = 2;
	        		$this->content->updatePurchase($v['id'],$args1);
	        	}elseif ((time()>$v['end_time']) && !$v['offernum']) {
	        		//【时间截止如果没人报价则修改为已终止4】
	        		$args1['status'] = 4;
	        		$this->content->updatePurchase($v['id'],$args1);
	        	}

        	}


        	$v['ordernum'] = ($page-1)*5+$num++;

        	if ($v['end_time']-172800 >=TIME) {
        		$v['lasttime'] = 1;
        	} else {
        		$v['lasttime'] = 2;
        	}

        }


      	$this->tpl->assign('keyword',$keyword);
      	$this->tpl->assign('type',$type);
      	$this->tpl->assign('status',$status);
      	if ($stime) {
      		$stime = date('Y-m-d H:i:s',$stime);
	      	if ($stime)$this->tpl->assign('stime',$stime);
      	}


        if ($etime) {
            $etime = date('Y-m-d H:i:s',$etime);
            if ($etime)$this->tpl->assign('etime',$etime);
        }

       	$this->tpl->assign('contentarr',$contentarr);
        $pageStatus = 1;
        //页面判断是搜索数据还是列表数据,true是搜索数据，false是列表数据
        if($pageType)
        {
            $pageStatus = empty($contentarr['data']) ? 2 : 1;
        }
        else
        {
            $pageStatus = empty($contentarr['data']) ? 3 : 1;
        }
        //合同数据
        $con = $this->con->getContractTemplate();
        $this->tpl->assign('pageStatus',$pageStatus);
        $this->tpl->assign('con',$con);
        $this->tpl->display('inquiry');
    }

    //询价删除
    private function delpurchase(){
		$id = intval($this->ev->get('id'));
		if ($id) {
			$args['status'] = 4;
			if ($this->content->updatePurchase($id,$args)) {
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => "forward",
				    "forwardUrl" => "index.php?user-company-purchases-inquiry"
				);

			} else {
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败，可能网络异常",
				    "callbackType" => "forward",
				    "forwardUrl" => "index.php?user-company-purchases-inquiry"
				);
			}
			exit(json_encode($message));

		} else {
			$message = array(
				'statusCode' => 103,
				"message" => "网络异常",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?user-company-purchases-inquiry"
			);
			exit(json_encode($message));
		}

    }

    //获取要澄清的数据ID
    private function ajaxComment(){
    	$id = $this->ev->get('id');
    	if ($id) {
    		$html .= '<input name="ordersn" type="hidden" value="' . $id . '" id="sn">';

            $message = array(
                'statusCode' => 201,
                'message' => "成功",
                'data' => $html
            );
            exit(json_encode($message));
    	} else {
    		$message = array(
                'statusCode' => 300,
                "message" => "数据不存在"
            );
            exit(json_encode($message));
    	}

    }

    //澄清数据的添加
    private function ajaxpost(){
    	$args = array();
    	$type = $this->ev->get('type');
    	$args['clarify_xid'] = $this->ev->get('sn');
        $args['clarify_des'] = $this->ev->get('text');
        $args['clarify_file'] = $this->ev->get('fileurl');
        $args['clarify_fillename'] = $this->ev->get('filename');
        $args['addtime'] = TIME;
        $args['clarify_uid'] = $this->_user['sessionuserid'];//userid
        //公司详细信息
        $userinfo = $this->user->getUserById($this->_user['sessionuserid']);
        $args['clarify_name'] = $userinfo['company_name'];

        $result =  $this->clarify->Addclarify($args);
        if ($result) {
        	//当从询价管理提交澄清时 则修改对这条信息的报价信息的状态为0【未确认状态】
        	if ($type!=1) {
        		$baojiastatus = $this->clarify->updateBaojia($args['clarify_xid']);//修改报价表status
        	}

            $message = array(
				'statusCode' => 200,
				"message" => "操作成功"

			);
            exit(json_encode($message));
        } else {
            $message = array(
				'statusCode' => 300,
				"message" => "操作失败，可能网络异常"

			);
			exit(json_encode($message));
        }
    }

    //报价管理2018-10-25  zhangjianchao
    private function offer()
    {
    	$xunjiaid = $this->ev->get('id');
    	$keyword = strip_tags($this->ev->get('keyword'));
    	$type = intval($this->ev->get('purchasetype'));
		$status = intval($this->ev->get('purchasestatus'));
		$stime = strtotime($this->ev->get('stime'));
		$etime = strtotime($this->ev->get('etime'));
        $pageType = $this->ev->get('t');    //点击搜索传过来的参数，用来区分展示搜索结婚还是列表数据
    	$page = intval($this->ev->get('page'))?intval($this->ev->get('page')):1;

    	$args  = array();
    	//某条询价信息的报价列表 或者是 某个供应商的报价列表
    	if ($xunjiaid) {
    		$args[] = array('AND',"purchase_new_id = :purchase_new_id",'purchase_new_id',$xunjiaid);
    	} else {
    		$args[] = array('AND',"supplier_id = :supplier_id",'supplier_id',$this->_user['sessionuserid']);
    	}

    	//搜索条件
		if($keyword)$args[] = array("AND","xunjia_title LIKE :xunjia_title",'xunjia_title',"%{$keyword}%");//关键字搜索
        if($status)$args[] = array("AND","status = :status",'status',$status);//状态
        if($type)$args[] = array("AND","xunjia_type = :xunjia_type",'xunjia_type',$type);//类型
        if ($stime) {
        	if($stime)$args[] = array("AND","create_time >= '".$stime."'");//发布开始时间

        }

        if ($etime) {

            if($etime)$args[] = array("AND","create_time <= '".$etime."'");//发布结束时间
        }


        $args[] = array('AND',"del = :del",'del',0);
    	$offerarr = $this->ppe->purchaseList($args,$page,5);
    	$num = 1;

    	//询价详情
    	foreach ($offerarr['data'] as $k => &$v) {
    		//触发修改询价信息的状态
    		$xunjianum = $this->content->getPurchseNumber($v['purchase_new_id']);
    		if($v['status']==1){
        		if ((time()>$v['end_time']) && $xunjianum) {

	        		$args1['status'] = 2;
	        		$this->content->updatePurchase($v['purchase_new_id'],$args1);
	        	}elseif ((time()>$v['end_time']) && !$xunjianum) {
	        		//【时间截止如果没人报价则修改为已终止4】
	        		$args1['status'] = 4;
	        		$this->content->updatePurchase($v['purchase_new_id'],$args1);
	        	}

        	}


    		$baonum = $this->clarify->countlist1($v['purchase_new_id'],$v['supplier_id']);
    		$xunjiarenid = $this->ppe->getPurchasePriceById($v['purchase_new_id']);
    		$xunjianum = $this->clarify->countlist($xunjiarenid,$v['purchase_new_id']);

    		//var_dump($xunjiarenid);die;
    		$v['ordernum'] = ($page-1)*5+$num++;
    		$v['istrue'] = $xunjianum == $baonum ? 1 : 2;
    		$v['painum'] = $this->ppe->ranking($v['purchase_new_id'],$v['pid']);

    	}



    	$this->tpl->assign('keyword',$keyword);
    	$this->tpl->assign('type',$type);
      	$this->tpl->assign('status',$status);
      	if ($stime) {
      		$stime = date('Y-m-d H:i:s',$stime);
	      	if ($stime)$this->tpl->assign('stime',$stime);
      	}

        if ($etime) {
            $etime = date('Y-m-d H:i:s',$etime);
            if ($etime)$this->tpl->assign('etime',$etime);
        }


        $this->tpl->assign('offerarr',$offerarr);
        $pageStatus = 1;
        //页面判断是搜索数据还是列表数据,true是搜索数据，false是列表数据
        if($pageType)
        {
            $pageStatus = empty($offerarr['data']) ? 2 : 1;
        }
        else
        {
            $pageStatus = empty($offerarr['data']) ? 3 : 1;
        }

        $this->tpl->assign('pageStatus',$pageStatus);
        $this->tpl->display('offer');
    }

    //更新某个报价单
    private function filepost(){
    	$id = $this->ev->get('id');
        $xunid = $this->ev->get('xunid');

    	//var_dump($id);die;
    	$xunjiainfo = $this->content->getXunjiaContentById($xunid);
    	//是否有人报价
    	$xunjianum = $this->content->getPurchseNumber($xunid);
		$time = $xunjiainfo['end_time']-time();
    	if($xunjiainfo['status']==1){
    		if ($time<=0 && $xunjianum) {

        		$args1['status'] = 2;
        		$this->content->updatePurchase($xunid,$args1);
        	}elseif ($time<=0 && !$xunjianum) {
        		//【时间截止如果没人报价则修改为已终止4】
        		$args1['status'] = 4;
        		$this->content->updatePurchase($xunid,$args1);
        	}

    	}


    	$xunjiainfo1 = $this->content->getXunjiaContentById($xunid);


    	if ($id && ($xunjiainfo1['status']==1 || $xunjiainfo1['status']==2)) {
    		$html .= '<input name="ordersn" type="hidden" value="' . $id . '" id="offersn">';

            $message = array(
                'statusCode' => 201,
                'message' => "成功",
                'data' => $html
            );
            exit(json_encode($message));
    	} else {
    		$message = array(
                'statusCode' => 300,
                "message" => "已不能更新报价"
            );
            exit(json_encode($message));
    	}

    }

    //更新报价单提交功能
    private function filecommit(){

    	$pid = $this->ev->get('pid');
    	$args = array();
        $args['file_url'] = $this->ev->get('fileurl');
        $args['total_price'] = $this->ev->get('totalNo');



        if ($pid && $args['file_url']) {
        	$result = $this->ppe->updatePurchase($pid,$args);

        	if ($result) {
	            $message = array(
					'statusCode' => 200,
					"message" => "操作成功"

				);
	            exit(json_encode($message));
	        } else {
	            $message = array(
					'statusCode' => 300,
					"message" => "操作失败，可能网络异常"

				);
				exit(json_encode($message));
	        }
        } else {
        	$message = array(
				'statusCode' => 300,
				"message" => "操作失败，可能网络异常"

			);
			exit(json_encode($message));
        }

    }

    //报价取消
    private function offerCancel(){
    	$pid = intval($this->ev->get('pid'));
		if ($pid) {
			$args['del'] = 1;
			if ($this->ppe->updatePurchase($pid,$args)) {
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => "forward",
				    "forwardUrl" => "index.php?user-company-purchases-offer"
				);

			} else {
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败，可能网络异常",
				    "callbackType" => "forward",
				    "forwardUrl" => "index.php?user-company-purchases-offer"
				);
			}
			exit(json_encode($message));

		} else {
			$message = array(
				'statusCode' => 300,
				"message" => "网络异常",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?user-company-purchases-offer"
			);
			exit(json_encode($message));
		}
    }


    //发送手机短信
    private function sendphonemsg($tmpcode,$phonenumber,$action,$content)
    {
        Config::load();
        $product = "Dysmsapi";
        // 短信API产品域名
        $domain = "dysmsapi.aliyuncs.com";
        // 暂时不支持多Region
        $region = "cn-hangzhou";
        // 服务结点
        $endPointName = "cn-hangzhou";
        // 初始化用户Profile实例
        $profile = DefaultProfile::getProfile($region, "LTAIXMKRJm4qcqZX", "0KJVckl0MmeH3UhMiEfSWhyYOoNJrA");
        // 增加服务结点
        DefaultProfile::addEndpoint($endPointName, $region, $product, $domain);
        // 初始化AcsClient用于发起请求
        $acsClient = new DefaultAcsClient($profile);
        //$phoneNumbers = $mobile;
        $request = new SendSmsRequest();

        // 必填，设置雉短信接收号码
        $request->setPhoneNumbers($phonenumber);

        // 必填，设置签名名称
        $request->setSignName("天工开物");

        // 必填，设置模板CODE
        $request->setTemplateCode($tmpcode);
        $templateParam = $content;
        if($templateParam) {
            //$request->setTemplateParam(json_encode($templateParam));
            $request->setTemplateParam($templateParam);
        }
        $acsResponse = $acsClient->getAcsResponse($request);
        //var_dump($acsResponse);die;
        if($acsResponse->Code == 'OK')
        {
            $insertRet = $this->user->batchAddSendSms($phonenumber,$action,time());
        }
        //创建询价给供应商发送邀请询价短信成功失败不做逻辑校验
        if($action != 'createXun'){
            if($acsResponse->Code == 'OK')
            {
                if($insertRet)
                {
                    $message = array(
                        'statusCode' => 200,
                        "message" => "短信发送成功"
                    );
                }else{
                    $message = array(
                        'statusCode' => 202,
                        "message" => "发送失败，请稍后重试"
                    );
                }
            }
            elseif($acsResponse->Code == 'isv.BUSINESS_LIMIT_CONTROL')
            {
                $message = array(
                    'statusCode' => 201,
                    "message" => "请勿频繁发送短信"
                );
            }
            else{
                $message = array(
                    'statusCode' => 300,
                    "message" => "短信发送失败"
                );
            }
            exit(json_encode($message));
        }

    }

    /**
	 * 询价公告
	 * @author zhuhongyu
	 */
    public function notice(){
        $userId = $this->_user['sessionuserid'];
        //头部关键词 搜索
        $type = $this->ev->get('t');
        $keyword = strip_tags($this->ev->get('keyword'));
        $stime = strtotime($this->ev->get('stime'));
        $etime = strtotime($this->ev->get('etime'));
        $page = intval($this->ev->get('page'));
        $page = $page?$page:1;
        $time = time();
        if($keyword)$args[] = array("AND","purchase_new.xunjia_title LIKE :xunjia_title",'xunjia_title',"%{$keyword}%");//关键字搜索
        if($stime)$args[] = array("AND","purchase_new.create_time >= '".$stime."'");//发布开始时间
        if($etime)$args[] = array("AND","purchase_new.create_time <= '".$etime."'");//发布结束时间
        $args[] = array("AND","purchase_invitation.user_id = :user_id","user_id",$userId);
//        $args[] = array("AND","status = :status","status",1);
        $dataInfo = $this->content->getNoticeInfo($args,$page,100);
        foreach ($dataInfo['data'] as $k => &$v) {
            //某条询价信息过了截止日期并且有人报价则修改为待定标状态
            $v['offernum'] = $this->content->getPurchseNumber($v['purchase_new_id']);
            //判断我是否对此询价报过价
            $isBaojia = $this->ppe->priceAllList($v['purchase_new_id'],$userId);
            if($isBaojia){
                unset($dataInfo['data'][$k]);
			}

        }
        $pageStatus = 1;
        //页面判断是搜索数据还是列表数据,true是搜索数据，false是列表数据
        if($type)
        {
            $pageStatus = empty($dataInfo['data']) ? 2 : 1;
        }
        else
        {
            $pageStatus = empty($dataInfo['data']) ? 3 : 1;
        }
        $this->tpl->assign('info',$dataInfo);//可以报价的数据
        $this->tpl->assign('pageStatus',$pageStatus);
        if($keyword){
            $this->tpl->assign('keyword',$keyword);
		}
        if($stime){
            $this->tpl->assign('stime',date('Y-m-d H:i:s',$stime));
        }
        if($etime){
            $this->tpl->assign('etime',date('Y-m-d H:i:s',$etime));
        }
        $this->tpl->display('notice');
	}
	/**
	 * 登录成功后弹框
	 * @author  zhuhongyu
	 */
	public function tips(){
        $userId = $this->_user['sessionuserid'];
        $time = time();
        $args[] = array("AND","purchase_invitation.user_id = :user_id","user_id",$userId);
        $args[] = array("AND","status = :status","status",1);
        $dataInfo = $this->content->getNoticeInfo($args,1,100);
        $userData = $this->user->getUserById($userId);
        foreach ($dataInfo['data'] as $k => &$v) {
            //判断我是否对此询价报过价
            $isBaojia = $this->ppe->priceAllList($v['purchase_new_id'],$userId);
            if($isBaojia){
                unset($dataInfo['data'][$k]);
            }
        }
        $is_show = 0;
        if(!empty($dataInfo['data']) && $userData['users_role']==0){
            $is_show = 1;
		}else{
            $is_show = 2;
		}
		$data = [
			'isOk'=>$is_show==1?true:false
		];
        exit(json_encode($data));
	}

    public function inquiryinfo()
    {
        $id = $this->ev->get("id");
        $purchasestatus = array(1=>'邀请询价',2=>'公开询价');
        $inquiryData = $this->clarify->SelecteEnquirylist($id,0);

        if($inquiryData['end_time'] >= TIME){
            $dingbiao = 1;
        }else{
            $dingbiao = 2;
        }
        $qid = $inquiryData['xunjia_ren'];
        $material = $this->pricerecord->pricerecordAllList($id);//获取询价物资
        $clarData = $this->clarify->Selecteclarify($id);//clarify  澄清表  询价

        $baojiaUser = $this->user->getUserListByUserIds($inquiryData['xunjia_invitation']);
        $baojiaData = array();
        $xunjianum = $this->clarify->countlist($qid,$id);
        $isApply = 0;   //页面判断该询价是否有供应商报价
        $winerData = array();   //定标凭证存放
        foreach($baojiaUser as $key => $val)
        {
            $baojiaData[$key]['company_name'] = $val['company_name'];   //报价人
            $baojiaData[$key]['company_mobile'] = $val['company_mobile'];   //报价人手机号，用于发送短信提醒
            $baojiaData[$key]['endtime'] = $inquiryData['end_time'];    //询价截止时间，用于发送短信提醒
            $baojiaData[$key]['isapply'] = 0;   //是否报价，默认未报价
            $baojiaData[$key]['total_price'] = 9999999999;
            $baonum = $this->clarify->countlist1($id,$val['userid']);
            $baojiaData[$key]['istrue']  = $xunjianum == $baonum ? 1 : 2;   //澄清是否确认
            $temp = $this->pricerecord->getBaojia($id,$val['userid']);
            //如果邀请的供应商已经报价
            if($temp)
            {
                $isApply = 1;
                $baojiaData[$key]['isapply'] = 1;
                $baojiaData[$key]['purchase_price_id'] = $temp['pid'];  //报价表id
                $baojiaData[$key]['supplier_id'] = $temp['supplier_id'];  //报价人id
                $baojiaData[$key]['total_price'] = $temp['total_price'];    //报价金额
                $baojiaData[$key]['file_url'] = $temp['file_url'];  //报价明细
                $baojiaData[$key]['addtime'] = $temp['addtime'];    //报价时间
                $baojiaData[$key]['baojia_status'] = $temp['baojia_status'];    //是否中标
                if(!empty($temp['based_file']))
                {
                    $winerData['based_reason'] = $temp['based_reason'];
                    $winerData['based_file'] = $temp['based_file'];
                }
            }
        }

        $t = array_column($baojiaData,'total_price');
        array_multisort($t,SORT_ASC,$baojiaData);
		//判断返回的定标内容是否是pdf
	    $is_pdf = 0;
        $result =  trim(strrchr($winerData['based_file'], './'),'.');
		if($result=='pdf'){
			$is_pdf = 1;
		}
        $this->tpl->assign('inquiryData',$inquiryData); //询价数据
        $this->tpl->assign('dingbiao',$dingbiao);   //是否可定标
        $this->tpl->assign('material',$material);   //询价物资
        $this->tpl->assign('clarData',$clarData);   //澄清数据
        $this->tpl->assign('baojiaData',$baojiaData);       //报价数据
        $this->tpl->assign('isApply',$isApply);       //页面判断该询价是否有供应商报价
        $this->tpl->assign('winerData',$winerData);   //定标凭证存放
        $this->tpl->assign('is_pdf',$is_pdf);   //定标凭证存放
        $this->tpl->assign('purchasestatus',$purchasestatus);
        $this->tpl->display("inquiry_info");
    }

    //导出某个供应商提交的报价详情
    private function export_inquiryt()
    {
        $pid = $this->ev->get('pid');

        #根据报价id获取报价物资详情company_name
        $goodsPriceArr = $this->clarify->getInquiryGoodsPricByPid($pid);

        #获取报价详情
        $priceinfoarr = $this->ppe->priceinfo($pid);

        $userinfo = $this->user->getUserById($priceinfoarr['supplier_id']);

        $strTable ='<table width="500" border="1">';
        $strTable .= '<tr>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">序号</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="100">物资名称</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="100">型号/规格</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">采购数量</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">单位</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">项目单位</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">说明</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">承诺到货日期</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">报价单价</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">报价金额</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">备注</td>';
        $strTable .= '</tr>';
        if(is_array($goodsPriceArr)){
            foreach($goodsPriceArr as $k=>$val){
                $strTable .= '<tr>';
                $strTable .= '<td style="text-align:center;font-size:12px;">&nbsp;'.($k+1).'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['material_title'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['material_norms'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['material_num'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['material_unit'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['xiangmuDanwei'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['material_explain'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.date("Y-m-d H:i",$val['addtime']).'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['single_price'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['total_price'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['remarks'].'</td>';
                $strTable .= '</tr>';
            }
        }
        $strTable .='</table>';
        unset($goodsPriceArr);



        $this->item->downloadExcelUsername($strTable,urlencode('报价明细'),urlencode($userinfo['company_name']));
        exit();


    }

    //询价方询价详情--提醒报价短信通知
    private function callprice()
    {
        $title = $this->ev->get("title");
        $mobile = $this->ev->get("mobile");
        $endtime = $this->ev->get("endtime");
        $endtime = date('Y-m-d H:i:s',$endtime);
        $this->sendphonemsg('SMS_151547400',$mobile,'callPrice','{"title":"'.$title.'","endtime":"'.$endtime.'"}');
        //var_dump($title,$mobile);die;
    }

}
?>
