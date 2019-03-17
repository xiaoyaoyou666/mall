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
        if(!$this->_user['sessionuserid'])
        {
            header("location:index.php?user-app-login");
            exit;
        }
        $this->ppe = $this->G->make('price','purchase');
		$this->precord = $this->G->make('pricerecord','purchase');
        $this->msg = $this->G->make('msg','user');
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
	/*
	* 最新版的报价功能
	* @author:zhangjianchao
	* @date：2018.10.26
	 */
	private function newPricePurchase(){

		$purchaseid = $this->ev->get('purchaseid');
		$purchaseuserid = $this->_user['sessionuserid'];
		$args = $this->ev->get('args');
		$userinfoarr = $this->user->getUserById($purchaseuserid);//获取用户的详细信息
        $purchaseDetial =$this->content->getXunjiaContentById($purchaseid);//获取询价详情信息
        $materialNum = $this->precord->countMaterial($purchaseid); #查看该询价下的物资列表总数
        $yaoqiaoren = explode(',',$purchaseDetial['xunjia_invitation']);

        if(!in_array($purchaseuserid,$yaoqiaoren)){
            $message = array(
                'statusCode' => 300,
                "message" => "您未被邀请此报价，请看看别的！",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?purchase-app-content&id=".$purchaseid
            );
            exit(json_encode($message));
		}

        $jiezhitime = $purchaseDetial['end_time'] - time();

        if ($jiezhitime<=0) {
            $message = array(
                'statusCode' => 300,
                "message" => '报价已终止',
                "callbackType" => "forward",
                "forwardUrl" => "index.php?purchase-app-content&id=".$purchaseid
            );
            exit(json_encode($message));
        }




        #首先进行判断是否已经报过价
        $isbaojiaid = $this->ppe->priceAllList($purchaseid,$purchaseuserid);

        //接收对报价物资的信息报价的参数
        $promisetimesarr = $this->ev->get('promisetimes');//承诺到货时间的数组
        $singlepricesarr = $this->ev->get('singleprices');//报价单价的数组
        $totalpricesarr = $this->ev->get('totalprices');//报价总价的数组
        $remarksarr = $this->ev->get('remarks');//备注说明的数组
        $materialidsarr = $this->ev->get('materialids');//对应的物资的ID的数组
        $materialnumsarr = $this->ev->get('materialnums');//对应的物资的数量的数组
        $pricerecordidsarr = $this->ev->get('pricerecordids');//对应报价详细表中的记录ID【进行更新操作】

        /*echo "<pre/>";
        print_r($pricerecordidsarr);die;
        echo "<pre/>";*/

        //接收报价基本表所需要的参数
        $args1['purchase_new_id'] = $purchaseid;
        $args1['supplier_id'] = $purchaseuserid;
        $args1['company_name'] = $userinfoarr['company_name'];
        $args1['total_price'] = array_sum($totalpricesarr);
        $args1['file_url'] = $args['attach'];
        $args1['url_name'] = $args['url_name'];
        $args1['addtime'] = TIME;


        if ($isbaojiaid) {
            #更新报价基本表
            $args3['total_price'] = array_sum($totalpricesarr);
            $args3['file_url'] = $args['attach'];
            $args3['url_name'] = $args['url_name'];
            $result = $this->ppe->updatePurchase($isbaojiaid,$args3);

            #更新报价详细表
            for ($i=0; $i <$materialNum ; $i++) {
                $arr2['single_price'] = $singlepricesarr[$i];//提交报价的单价
                $arr2['total_price'] = $singlepricesarr[$i]*$materialnumsarr[$i];//计算出来的总价
                $arr2['remarks'] = $remarksarr[$i];//对每条的物资报价的备注说明
                $arr2['addtime'] = strtotime($promisetimesarr[$i]);//对每条物资的承诺的到货时间
                #执行更新
                $res2 = $this->precord->updatePurchase($pricerecordidsarr[$i],$arr2);
            }

            if ($result) {
                $message = array(
                    'statusCode' => 200,
                    "message" => "更新报价成功了",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?user-company-purchases-offer"
                );
                exit(json_encode($message));
            } else {
                $message = array(
                    'statusCode' => 300,
                    "message" => '服务器开小差了,请稍后重试',
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?purchase-app-content&id=".$purchaseid
                );
                exit(json_encode($message));
            }



        } else {
            #开启事务管理
            $this->db->beginTransaction();
            try{

                #报价基本表添加操作
                $result = $this->ppe->addPurchasePrice($args1);

                #报价详情表的添加
                for ($i=0; $i <$materialNum ; $i++) {
                    $arr2['ppid'] = $result;//报价基本表ID
                    $arr2['materialid'] = $materialidsarr[$i];//物资的ID
                    $arr2['single_price'] = $singlepricesarr[$i];//提交报价的单价
                    $arr2['total_price'] = $singlepricesarr[$i]*$materialnumsarr[$i];//计算出来的总价
                    $arr2['remarks'] = $remarksarr[$i];//对每条的物资报价的备注说明
                    $arr2['addtime'] = strtotime($promisetimesarr[$i]);//对每条物资的承诺的到货时间
                    #执行添加
                    $res2 = $this->precord->addPriceRecord($arr2);
                }


                if($result && $res2){
                    $this->db->commit();
                    $message = array(
                        'statusCode' => 200,
                        "message" => "报价成功了",
                        "callbackType" => "forward",
                        "forwardUrl" => "index.php?user-company-purchases-offer"
                    );
                    exit(json_encode($message));
                }else{
                    $this->db->rollback();
                    $message = array(
                        'statusCode' => 300,
                        "message" => '服务器开小差了,请稍后重试',
                        "callbackType" => "forward",
                        "forwardUrl" => "index.php?purchase-app-content&id=".$purchaseid
                    );
                    exit(json_encode($message));
                }
            } catch (Exception $e) {
                $ext = $e->getMessage();
                $this->db->rollback();
                $message = array(
                    'statusCode' => 300,
                    "message" => $ext,
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?purchase-app-content&id=".$purchaseid
                );
                exit(json_encode($message));
            }
        }

	}

	private function pricepurchase()
	{
        $purchaseid = $this->ev->get('purchaseid');
        $purchase = $this->content->getContentById($purchaseid);

        $purchasemoneyarr = $this->content->getNumberMoney($purchaseid);
        $purchasemoney = $purchasemoneyarr['purchasecapital'];

        //我的采购数量
		$purchaseuserid = $this->_user['sessionuserid'];
		$caigouNumber = $this->content->getNumber($purchaseuserid);

		//我收到的询价
		$args1[] = array("AND","purchaseuserid = :purchaseuserid",'purchaseuserid',$purchaseuserid);
		$args1[] = array("AND","purchasestatus != :purchasestatus",'purchasestatus',2);
		$contents5 = $this->content->getContentList($args1,$page,10000);
		$purchaseids = array();
		foreach($contents5['data'] as $key => $p )
		{
            $purchaseids[] = $p['purchaseid'];
		}
		$purchaseids = implode(',',$purchaseids);
		$otherPriceNumber = $this->ppe->getOtherNumber($purchaseids);

		//我报价的商机
		$ppeuserid = $purchaseuserid;
		$myPriceNumber = $this->ppe->getMyNumber($ppeuserid);

		//采购排行榜

		$contents1 = $this->content->getContentListUser();
		$userids1 = array();

		foreach($contents1 as $k => $v)
		{
            $userids1[] = $v['purchaseuserid'];
		}

		$userids1 = implode(',',$userids1);
		$users1 = $this->content->getContentListUser1();

		//最新完成的交易
		$args[] = array("AND","ppestatus = :ppestatus",'ppestatus',1);//完成状态
		$contents2 = $this->ppe->getPurchasePriceList($args,$page,$number = 3,$order = 'ppetime DESC');
		$userids2 = array();
		foreach($contents2['data'] as $key => $p )
		{
            $userids2[] = $p['ppepurchaseid'];
		}
		$userids2 = implode(',',$userids2);
		$contents3 = $this->content->getContentList(array(array("AND","find_in_set(purchaseid,:userids2)","userids2",$userids2)));

		//采购排行榜

		$contents1 = $this->content->getContentListUser();
		$userids1 = array();

		foreach($contents1 as $k => $v)
		{
            $userids1[] = $v['purchaseuserid'];
		}
		$userids1 = implode(',',$userids1);
		$users1 = $this->content->getContentListUser1();
		$this->tpl->assign('users1',$users1);
		$this->tpl->assign('purchasemoney',$purchasemoney);
		$this->tpl->assign('contents',$contents);
		$this->tpl->assign('contents3',$contents3);
		$this->tpl->assign('caigouNumber',$caigouNumber);
		$this->tpl->assign('myPriceNumber',$myPriceNumber);
		$this->tpl->assign('otherPriceNumber',$otherPriceNumber);

		if($this->ev->get('pricepurchase'))
		{

			$ispriced = $this->ppe->isPricedPurchase($purchaseid,$this->_user['sessionuserid']);
			if($ispriced)
			{
                $message = array(
                    'statusCode' => 300,
                    "message" => "您已经报过价了"
                );
                exit(json_encode($message));
			}
			$args = $this->ev->get('args');
            $args['ppeuserid'] = $this->_user['sessionuserid'];
            $args['ppepurchaseid'] = $purchaseid;
			$args['ppetime'] = TIME;
            $purchaseData = $this->content->getContentById($purchaseid);
            $this->msg->sendMsg($purchaseData,2);  //发送站内信
            $this->ppe->addPurchasePrice($args);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功，请等待回馈消息",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?purchase-app-content&purchaseid=".$purchaseid
            );
            exit(json_encode($message));
		}
		else
		{

            $this->tpl->assign('purchaseid',$purchaseid);
            $this->tpl->display('pricepurchase');
		}
	}

	private function indexOld()
	{
		$page = $this->ev->get('page');
		$purchaseid = $this->ev->get('purchaseid');
        $purchase = $this->content->getContentById($purchaseid);
		$catbread = $this->category->getCategoryPos($purchase['purchasecatid']);
		$cat = $this->category->getCategoryById($purchase['purchasecatid']);
		$catbrother = $this->category->getCategoriesByArgs(array(array('AND',"catparent = :catparent",'catparent',$cat['catparent']),array('AND',"catinmenu = '0'")));
		if($purchase['purchasetemplate'])$template = $purchase['purchasetemplate'];
		else $template = 'purchase_default';
		$nearContent = $this->content->getNearContentById($purchaseid,$purchase['purchasecatid']);

		$args9[] = array("AND","purchasestatus != :purchasestatus",'purchasestatus',2);
		$contents = $this->content->getContentList($args9,$page,2,$order = 'purchaseinputtime DESC');
		foreach($contents['data'] as $key => $p )
		{
            $userids[] = $p['purchaseuserid'];
		}
		$userids = implode(',',$userids);
		$users = $this->user->getUsersByArgs(array(array("AND","find_in_set(userid,:userids)","userids",$userids)));

		//我的采购数量
		$purchaseuserid = $this->_user['sessionuserid'];
		$caigouNumber = $this->content->getNumber($purchaseuserid);

		//我收到的询价
		$args1[] = array("AND","purchaseuserid = :purchaseuserid",'purchaseuserid',$purchaseuserid);
		$contents5 = $this->content->getContentList($args1,$page,10000);
		$purchaseids = array();
		foreach($contents5['data'] as $key => $p )
		{
            $purchaseids[] = $p['purchaseid'];
		}
		$purchaseids = implode(',',$purchaseids);
		$otherPriceNumber = $this->ppe->getOtherNumber($purchaseids);

		//我报价的商机
		$ppeuserid = $purchaseuserid;
		$myPriceNumber = $this->ppe->getMyNumber($ppeuserid);

		//采购排行榜
		$contents1 = $this->content->getContentListUser();
		$userids1 = array();

		foreach($contents1 as $k => $v)
		{
            $userids1[] = $v['purchaseuserid'];
		}

		$userids1 = implode(',',$userids1);
		$users1 = $this->content->getContentListUser1();

		//最新完成的交易
		$args[] = array("AND","ppestatus = :ppestatus",'ppestatus',1);//完成状态
		$contents2 = $this->ppe->getPurchasePriceList($args,$page,$number = 3,$order = 'ppetime DESC');
		$userids2 = array();
		foreach($contents2['data'] as $key => $p )
		{
            $userids2[] = $p['ppepurchaseid'];
		}
		$userids2 = implode(',',$userids2);
		$contents3 = $this->content->getContentList(array(array("AND","find_in_set(purchaseid,:userids2)","userids2",$userids2)));

		//采购排行榜

		$contents1 = $this->content->getContentListUser();
		$userids1 = array();

		foreach($contents1 as $k => $v)
		{
            $userids1[] = $v['purchaseuserid'];
		}

		$userids1 = implode(',',$userids1);
		$users1 = $this->content->getContentListUser1();

        if($this->ev->get('msg_id'))
        {
            $this->msg->modifyMsgStatus(array('msg_id' => $this->ev->get('msg_id'), 'status' => 1));
        }
		$this->tpl->assign('users1',$users1);
		$this->tpl->assign('contents',$contents);
		$this->tpl->assign('contents3',$contents3);
		$this->tpl->assign('caigouNumber',$caigouNumber);
		$this->tpl->assign('myPriceNumber',$myPriceNumber);
		$this->tpl->assign('otherPriceNumber',$otherPriceNumber);
		$this->tpl->assign('users',$users);
		if(!$template)$template = 'purchase_default';
		$this->tpl->assign('cat',$cat);
		$this->tpl->assign('nearContent',$nearContent);
		$this->tpl->assign('page',$page);
        $this->tpl->assign('user',$this->user->getUserById($purchase['purchaseuserid']));
		$this->tpl->assign('catbread',$catbread);
		$this->tpl->assign('purchase',$purchase);
		$this->tpl->assign('purchaseid',$purchaseid);
		$this->tpl->assign('catbrother',$catbrother);
		$this->tpl->display($template);
	}

    /**
     * 采购寻源报价页面
	 * @author zhuhongyu
     */
	private function index()
	{

        $id = $this->ev->get('id');
		//获取询价详情信息
		$purchaseDetial =$this->content->getXunjiaContentById($id);
        $userId = $this->_user['sessionuserid'];//userid
		//根据截至日期算出的倒计时秒数
		$time = $purchaseDetial['end_time']-time();
       // var_dump($time);
		if($purchaseDetial['status']==4){
            $time = 0;
		}
        $yaoqiaoren = explode(',',$purchaseDetial['xunjia_invitation']);
        if(in_array($userId,$yaoqiaoren)){
            $is_show = 1;
        }else{
            $is_show = 0;
        }

        #首先进行判断是否已经报过价
        $isbaojiaid = $this->ppe->priceAllList($id,$userId);
        if ($isbaojiaid) {
            $isbaojiastatus = 1;
        } else {
            $isbaojiastatus = 0;
        }





        #2018-11-15 zhangjianchao 新加  【询价信息下的物资列表】
        if ($isbaojiaid) {
            //报价详情
            $baojiaarr = $this->ppe->priceInfo($isbaojiaid);

            //已经报过价的
            $materialarr = $this->precord->pricerecordAllList1($isbaojiaid);
            foreach ($materialarr as $k => &$v) {
               $materialarrinfo = $this->precord->materialinfo($v['materialid']);
               $v['ordernum'] = $k+1;
               $v['material_title'] = $materialarrinfo['material_title'];
               $v['material_norms'] = $materialarrinfo['material_norms'];
               $v['material_num'] = $materialarrinfo['material_num'];
               $v['material_unit'] = $materialarrinfo['material_unit'];
               $v['xiangmuDanwei'] = $materialarrinfo['xiangmuDanwei'];
               $v['material_explain'] = $materialarrinfo['material_explain'];
               $v['addtime'] = date("Y-m-d",$v['addtime']);

            }

        } else {
            //为报价的
            $materialarr = $this->precord->pricerecordAllList($id);
            foreach ($materialarr as $k => &$v) {
                $v['ordernum'] = $k+1;
            }
        }



        $this->tpl->assign('materialarr',$materialarr);//询价信息下的物资列表
        $this->tpl->assign('detial',$purchaseDetial);
        $this->tpl->assign('purchaseid',$id);
        $this->tpl->assign('time',$time);
        $this->tpl->assign('is_show',$is_show);
        $this->tpl->assign('isbaojiastatus',$isbaojiastatus);
        $this->tpl->assign('baojiaarr',$baojiaarr);
        $this->tpl->display('purchase_default');
	}


	/**
	 * 报价须知页面
	 * @author zhuhongyu
	 */
	public function baoJiaXuZhi(){

        $this->tpl->display('baojiaxuzhi');
	}

}

?>
