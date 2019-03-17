<?php

require_once 'alisb/vendor/autoload.php';

use Aliyun\Core\Config;
use Aliyun\Core\Profile\DefaultProfile;
use Aliyun\Core\DefaultAcsClient;
use Aliyun\Api\Sms\Request\V20170525\SendSmsRequest;
/**
 * Created on 2018-10-29
 * Descript  询价详情表数据
 * @author yjc
 */
class action extends app
{
    public function display()
    {
        $this->category = $this->G->make('category');
        $this->content = $this->G->make('content','purchase');
        $this->ppe = $this->G->make('price','purchase');
        $this->link = $this->G->make('link','content');
        $this->clarify = $this->G->make('clarify','user');
        $this->orders = $this->G->make('orders','bank');
        $action = $this->ev->url(3);
        $this->link = $this->G->make('link','content');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,0,10);
        $this->item = $this->G->make('item','item');
        $this->cart = $this->G->make('cart','item');
        $this->user = $this->G->make('user','user');
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

    /**
     * @action  报价详情页数据
     * @param   $one  询价表
     * @param   $two  澄清表
     * @param   $baojia  报价表
     */
    public function index()
    {
        $args = $this->ev->get("id");
        $pid = $this->ev->get("pid");
        $type = $this->ev->get("type");
        $purchasestatus = array(1=>'邀请询价',2=>'公开询价');
        $one = $this->clarify->SelecteEnquirylist($args,0);
        if($one['end_time']-172800 >=TIME){
           $times=1;
        }else{
           $times=2;
        }

        if($one['end_time'] >= TIME){
            $dingbiao = 1;
        }else{
            $dingbiao = 2;
        }
        $cid = $one['id'];
        $qid = $one['xunjia_ren'];
        $demo = $this->_user['sessionuserid'];

        if ($type==1) {
            $two3 = $this->clarify->Selecteclarify($args);//clarify  澄清表  询价
            //根据澄清表查找详情表 有则返回200 无则300 状态不同
            foreach ($two3 as $k => $v) {
                $two3[$k]['clarifydetail']=$this->clarify->Selecteclardetail($v['clarify_id'],$demo);//澄清详情
            }
        } else {
            $useridstring = $qid.','.$demo;
            $two3 = $this->clarify->Selecteclarify($cid,$useridstring);//clarify  澄清表  询价
             //根据澄清表查找详情表 有则返回200 无则300 状态不同
            foreach ($two3 as $k => $v) {
                $two3[$k]['clarifydetail']=$this->clarify->Selecteclardetail($v['clarify_id'],$demo);//澄清详情
            }
        }

        $baojianame = $this->clarify->Selectebaoname($pid);//报价人表
        $baourl = $baojianame['url_name'];//上传文件名称 显示页面

        // 物资规格list
        $baojias =  $this->clarify->getInquiryGoodsPricByPid($pid);
        foreach ($baojias as $k => $val) {
            $baojias[$k]['keys'] = $k+1;//序号
        }

        $this->tpl->assign('type',$type);
        $this->tpl->assign('baourl',$baourl);
        $this->tpl->assign('one',$one);
        $this->tpl->assign('times', $times);
        $this->tpl->assign('baoid', $pid);
        $this->tpl->assign('dingbiao',$dingbiao);
        $this->tpl->assign('two3',$two3);
        $this->tpl->assign('demo',$demo);
        $this->tpl->assign('baojias',$baojias);
        $this->tpl->assign('purchasestatus',$purchasestatus);
        $this->tpl->display("xunjiadetail");
    }

     /**
     *  修改报价详情中  物资表 与  报价表
     */
    public function  updateofferwuzi()
    {
        $xunid = $this->ev->get('offerid');
        $one = $this->clarify->SelecteEnquirylist($xunid,0);

        if($one['end_time'] < TIME){
           $message = array(
                    'statusCode' => 300,
                    "message" => "报价已截至",
            );
            exit(json_encode($message));
        }

        $uid = $this->ev->get('userid_list');
        $list_num = count($uid);
        $single_price = $this->ev->get('price_list');
        if (!$single_price || count($single_price) != $list_num) {
            $message = array(
                    'statusCode' => 300,
                    "message" => "单价参数不全",
            );
            exit(json_encode($message));
        }
        $total_price = $this->ev->get('amount_list');
        if (count($total_price) != $list_num) {
            $message = array(
                    'statusCode' => 300,
                    "message" => "总价参数不全",
            );
            exit(json_encode($message));
        }
        $remarks = $this->ev->get('remark_list');
        $addtime = $this->ev->get('time_list');
        if (!$addtime || count($addtime) != $list_num) {
            $message = array(
                    'statusCode' => 300,
                    "message" => "到货时间参数不全",
            );
            exit(json_encode($message));
        }
        //----------------  上传报价文件
        $fileid = $this->ev->get('pp_id');//详情页ppid 关联 报价id
        $fileurl = $this->ev->get('file_urls');//改變路徑
        $urlname = $this->ev->get('url_name');//文件名称
        $sum_price = array_sum($total_price);
        $data = array();
        $result = $this->clarify->updateCompanyxuneds($fileid,$fileurl,$urlname,$sum_price);
        //开启事务管理
        $this->db->beginTransaction();
        for($i = 0; $i < $count = count($uid); $i++)
        {
            $userid=$uid[$i];
            $date['single_price'] = $single_price[$i];
            $date['total_price'] = $total_price[$i];
            $date['remarks'] = $remarks[$i];
            $date['addtime'] = strtotime($addtime[$i]);
            $res = $this->clarify->updateCompanyxuned($userid,$date);
        }
        if($result && $res){
            $this->db->commit();
            $message = array(
                    'statusCode' => 200,
                    "message" => "修改报价成功",
            );
            exit(json_encode($message));
        }else{
             $this->db->rollback();
             $message = array(
                    'statusCode' => 300,
                    "message" => "修改报价失败",
            );
            exit(json_encode($message));
        }
    }


    /**
     * @action  ADD  发布澄清
     * @param   $data    array
     * @param   updat    int  $baojiastatus
     */
    public function addclarifylists()
    {
        $data =array();
        $data['clarify_uid'] = $this->_user['sessionuserid'];//发布澄清人id
        $data['clarify_des'] = $this->ev->get("text");//文字描述
        $data['clarify_file'] = $this->ev->get("uds");//附件路径
        $data['clarify_fillename'] = $this->ev->get("title");//附件上传 名称
        $data['clarify_xid'] = $this->ev->get("xunid");//询价表id 记录澄清那个询价管理
        $data['addtime'] = TIME;
        $userinfo = $this->user->getUserById($this->_user['sessionuserid']);
        $data['clarify_name'] = $userinfo['company_name'];
        $result = $this->clarify->Addclarify($data);
        if ($result) {
            $message = array(
                'statusCode' => 200,
                "message" => "澄清发布成功",
                "callbackType" => "forward",
                "forwardUrl" => "?user-company-clarify-index"
            );
            exit(json_encode($message));
        }else{
            $message = array(
                'statusCode' => 300,
                "message" => "发布失败",
            );
            exit(json_encode($message));
        }
    }

    /**
     * @action   add  澄清记录表
     * @param   array  $data
     * @param   update
     * @param   array  $result
     */
    public function addclarify()
    {
       $data = array();
       $data['detail_uid'] = $this->_user['sessionuserid'];
       $data['detail_sid'] = $this->ev->get("uid");
       $data['detail_clar_id'] = $this->ev->get("xid");
       $data['clarify_id'] = $this->ev->get("bid");//记录询价id
       // $this->clarify->updateBaojiaone($data['clarify_id']);//修改报价表status 1
       $result = $this->clarify->Addclarifydetail($data);
       if ($result) {
            $message = array(
               'statusCode' => 200,
               "message" => "操作成功",
               "callbackType" => "forward",
               "forwardUrl" => "?user-company-clarify-index"
            );
            exit(json_encode($message));
       } else {
            $message = array(
                'statusCode' => 300,
                "message" => "操作失败",
            );
            exit(json_encode($message));
       }
    }


       //更新某个报价单
    private function filepost(){
        $id = $this->ev->get('id');
        $xunid = $this->ev->get('xunid');
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

    /**
     * 生成订单表
     * 通过报价表与询价表联表 显示出数据
     */
    public function priceOrder()
    {
        $mid = $this->ev->get('xid');
        $bid = $this->ev->get('bid');
        $based_file = $this->ev->get('urls');  //定标凭证url
        $based_reason = $this->ev->get('reason');  //定标说明
        $list = $this->clarify->addOrderpurase($mid,$bid);
        //var_dump(TIME,$list['end_time']);die;
        //$userinfo = $this->user->getUserById($this->_user['sessionuserid']);
        $ordersa = array();
        $ordersa['ordersn'] = date('YmdHis').$this->_user['sessionuserid'].rand(10000,99999);
        $ordersa['orderstatus'] = 1;//下单就为待发货状态为2
        $ordersa['order_type']  = 3;//询价订单类型为1
        $ordersa['orderuserid'] =  $list['xunjia_ren']; //买家
        $ordersa['ordersalerid'] = $list['supplier_id'];//卖家
        $ordersa['ordercreatetime'] = TIME;//创建时间
        $ordersa['orderprice'] = $list['total_price'];//金额
        $ordersa['bt_bankPaySuccessDate'] = date("Y-m-d H:i:s");
        $ordersa['bt_paySuccessDate'] = date("Y-m-d H:i:s");
        $ordersa['orderitems'] = serialize( array(array('goodstitle' => $list['xunjia_title'] , 'number' =>1 ,'itemprice'=> $ordersa['orderprice'],'pay_num' => $list['pay_num'],'danwei' => '批')));//询价标题
        //开启事务
        $this->db->beginTransaction();
        try
        {
            $updateXunRes = $this->clarify->updateXunjiastatus($list['id']);//改变询价表状态为3 已完成
            $insertOrdRes = $this->orders->addOrder($ordersa);  //添加order数据\
            $param = array();
            $param['based_file'] = $based_file;  //定标凭证url
            $param['based_reason'] = $based_reason;  //定标说明
            $param['baojia_status'] = 1;  //定标标志
            $updateBaoRes = $this->clarify->updateclarifyPrice($mid,$bid,$param);  //标记定标记录
            if (!$updateXunRes || !$updateBaoRes)
            {
                throw new Exception('下单失败');
            }
            $this->db->commit();
        }
        catch (Exception $e)
        {
            $ext = $e->getMessage();
            $this->db->rollback();
            $message = array(
                'statusCode' => 300,
                "message" => $ext,
                "callbackType" => "forward"
            );
            exit(json_encode($message));
        }
        //定标成功发送通知书
        //发送一条定向消息
        $args['msg_userid'] = $list['supplier_id'];
        $args['msg_title'] = $list['xunjia_title'].'项目成交通知书';
        $args['msg_time'] = time();
        $args['msg_url'] = 'index.php?user-company-message-messageinfo&msg_id=';
        $args['status'] = 0;
        $args['msg_type'] = 3;
        $args['msg_content'] = '<p style="text-align: left;font-weight: bold">'.$list['company_name'].'：</p><p style="text-align: left">根据我公司'.$list['xunjia_title'].'项目的采购文件以及贵公司提交的报价文件，经过专家评审，以及采购方确认，现通知您单位为'.$list['xunjia_title'].'项目的成交人。</p><p style="text-align: left;color: #666">项目名称：'.$list['xunjia_title'].'&nbsp;&nbsp;<br/>成交金额：'.$list['total_price'].'</p>';
        $this->msg->systemSendMsg($args);
        $userData = $this->user->getUserById($args['msg_userid']);
        $this->sendphonemsg('SMS_150572524',$userData['company_mobile'],'createXun','{"company_name":"'.$list['company_name'].'","xunjia_title":"'.$list['xunjia_title'].'","total_price":"'.$list['total_price'].'"}');
        $message = array(
            'statusCode' => 200,
            "message" => "定标成功,请尽快支付",
            "callbackType" => "forward",
            "forwardUrl" => "index.php?user-company-ordersbuy"
        );
        exit(json_encode($message));
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
            $param = array(
                'mobile' => $phonenumber,
                'action' => $action,
                'code'   => 0,
                'addtime'=> time(),
            );
            $insertRet = $this->user->addSendSms($param);

        }
    }


    //报价详情页面指向 11-14
    public function  offerdetail()
    {
        $this->tpl->display("offerdetails");
    }

    //询价详情页面指向 11-14
    public function  inquirydetail()
    {
        $this->tpl->display("xunjiadetail");
    }

}

?>
