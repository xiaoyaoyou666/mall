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
        $this->category = $this->G->make('category');
        $this->content = $this->G->make('content','company');
        $this->link = $this->G->make('link','content');
        $action = $this->ev->url(3);
        $this->link = $this->G->make('link','content');
        $this->agreementgoods = $this->G->make('agreementgoods', 'agreement');
        $this->agreement = $this->G->make('agreement', 'agreement');
        $this->agreementapply = $this->G->make('agreementapply', 'agreement');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->item = $this->G->make('item','item');
        $this->cart = $this->G->make('cart','item');
        $this->sap = $this->G->make('sap','item');
        $cartNumArr = $this->cart->getCartUserNum();
        foreach ($cartNumArr as $k => $v) {
            $cartnums[] = $v['number'];
        }
        $cartNum = array_sum($cartnums)?array_sum($cartnums):0;

        #协议状态
        $xieyistatus = array(1 =>'未生效',2 => '待生效', 3 => '生效', 4 => '已失效');
        #审核状态
        $lookstatus = array(1 =>'未提交',2 => '已申请', 3 => '已通过', 4 => '未通过');

        #查询所有的已通过未生效的协议 当开始时间大于当前的时间时使协议生效  结束时间大于当前时间使协议失效
        $args33 = array();
        $args33[] = array("AND","userid = :userid",'userid',$this->_user['sessionuserid']);//当前登录用户
        $args33[] = array("AND","status = :status",'status',2);//待生效
        $args33[] = array("AND","auditor_status = :auditor_status",'auditor_status',3);//已通过
        $agreementarrlists = $this->agreement->getAgreementListAll($args33);
        foreach ($agreementarrlists as $k => $v) {
           //当前时间
           $nowtime = time();
           if ($nowtime>=$v['starttime'] && $nowtime<=$v['endtime']) {
               $args66['status'] = 3;
               $this->agreement->modifyAgreement($v['agreementid'],$args66);
           }
           
        }

        #结束时间大于当前时间使协议失效
        $args44 = array();
        $args44[] = array("AND","userid = :userid",'userid',$this->_user['sessionuserid']);//当前登录用户
        $args44[] = array("AND","status = :status",'status',3);//待生效
        $args44[] = array("AND","auditor_status = :auditor_status",'auditor_status',2);//已申请
        $agreementarrlists1 = $this->agreement->getAgreementListAll($args44);
        foreach ($agreementarrlists1 as $k => $v) {
           //当前时间
           $nowtime = time();
           if ($nowtime>$v['endtime']) {
               $args88['status'] = 4;
               $this->agreement->modifyAgreement($v['agreementid'],$args88);
           }
           
        }

        $this->tpl->assign('links',$links);
        $this->tpl->assign('cartNum',$cartNum);
        $this->tpl->assign('xieyistatus',$xieyistatus);
        $this->tpl->assign('lookstatus',$lookstatus);
        if(!method_exists($this,$action))
            $action = "index";
        $this->$action();
        exit;
    }

    //协议详情
    private function agreementInfo()
    {
        $agreementid = $this->ev->get('agreementid');
        $agreement = $this->agreement->getAgreementById($agreementid);
        $payment = $this->sap->getFukuanById($agreement['payment_code']);
        $agreement['payment_text'] = $payment['text1'];
        $goods = $this->agreementgoods->getAgrgoodsAndItemByAgrid($agreementid);
        //var_dump($goods);die;
        $this->tpl->assign('goods',$goods);
        $this->tpl->assign('agreement',$agreement);
        $this->tpl->display('agreementinfo');
    }

    /**
     * [agreement 列表方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-15
     * @returns  {array}
     * @return   [array]        [返回结果集]
     */
    private function agreement()
    {

        #搜索条件
        $page = intval($this->ev->get('page'));
        $keyword = $this->ev->get('keyword');
        $type = $this->ev->get('t');
        $status = intval($this->ev->get('status'));
        $salername = $this->ev->get('salername');
        $endtime = strtotime($this->ev->get('endtime'));
        $addtime = strtotime($this->ev->get('addtime'));
        #声明空数组
        $args = array();
        $args[] = array("AND","userid = :userid",'userid',$this->_user['sessionuserid']);//当前登录用户
        $args[] = array("AND","del = :del",'del',0);//未删除的
        if($keyword)$args[] = array("AND","filename LIKE :filename",'filename',"%{$keyword}%");//关键字搜索
        if($status)$args[] = array("AND","status = :status",'status',$status);//状态
        if($salername)$args[] = array("AND","salername LIKE :salername",'salername',"%{$salername}%");//甲方
        if($endtime)$args[] = array("AND","endtime = :endtime",'endtime',$endtime);//有效日期至
        if($addtime)$args[] = array("AND","addtime = :addtime",'addtime',$addtime);//添加时间

        #获取当前用户的所有的框架协议
        $agreementarr = $this->agreement->getAgreementList($args,$page,$number = 10);
        #添加3次申请按钮变灰【查询同一个合同的申请类型是否超过了3次 重新组装数组】
        foreach ($agreementarr['data'] as $k => &$v) {
            $args1[] = array("AND","agreementid = :agreementid",'agreementid',$v['agreementid']);//状态
            $args1[] = array("AND","type = :type",'type',1);//类型【申请生效】
            $args2[] = array("AND","agreementid = :agreementid",'agreementid',$v['agreementid']);//状态
            $args2[] = array("AND","type = :type",'type',2);//类型【申请失效】

            $v['applytype1'] = $this->agreementapply->getAgreementApplyListNum($args1);
            $v['applytype2'] = $this->agreementapply->getAgreementApplyListNum($args2);
        }

        if ($endtime) $endtime = date("Y-m-d",$endtime);
        if ($addtime) $addtime = date("Y-m-d",$addtime);
        $pageStatus = 1;
        //页面判断是搜索数据还是列表数据,true是搜索数据，false是列表数据
        if($type)
        {
            $pageStatus = empty($agreementarr['data']) ? 2 : 1;
        }
        else
        {
            $pageStatus = empty($agreementarr['data']) ? 3 : 1;
        }
        $this->tpl->assign('page',$page);
        $this->tpl->assign('keyword',$keyword);
        $this->tpl->assign('status',$status);
        $this->tpl->assign('salername',$salername);
        $this->tpl->assign('endtime',$endtime);
        $this->tpl->assign('addtime',$addtime);
        $this->tpl->assign('pageStatus',$pageStatus);
        $this->tpl->assign('agreementarr',$agreementarr);
        $this->tpl->display('agreement');
    }


   /**
    * [export_agreement 导出方法]
    * @Author   Zhangjianchao
    * @DateTime 2018-08-15
    * @returns  {array}
    * @return   [type]        [description]
    */
    private function export_agreement(){

        #搜索条件
        $page = intval($this->ev->get('page'));
        $keyword = $this->ev->get('keyword');
        $status = intval($this->ev->get('status'));
        $salername = $this->ev->get('salername');
        $endtime = $this->ev->get('endtime');
        $addtime = $this->ev->get('addtime');

        #声明空数组
        $args = array();
        $args[] = array("AND","userid = :userid",'userid',$this->_user['sessionuserid']);//当前登录用户
        $args[] = array("AND","del = :del",'del',0);//未删除的
        if($keyword)$args[] = array("AND","filename LIKE :filename",'filename',"%{$keyword}%");//关键字搜索
        if($status)$args[] = array("AND","status = :status",'status',$status);//状态
        if($salername)$args[] = array("AND","salername LIKE :salername",'salername',"%{$salername}%");//甲方
        if($endtime)$args[] = array("AND","endtime = :endtime",'endtime',$endtime);//有效日期至
        if($addtime)$args[] = array("AND","addtime = :addtime",'addtime',$addtime);//添加时间


        #获取当前用户的所有的框架协议
        $agreementarr = $this->agreement->getAgreementListAll($args);
        #协议状态
        $xieyistatus = array(1 =>'未生效',2 => '待生效', 3 => '生效', 4 => '已失效');
        #审核状态
        $lookstatus = array(1 =>'未提交',2 => '已申请', 3 => '已通过', 4 => '未通过');

        $strTable ='<table width="500" border="1">';
        $strTable .= '<tr>';
        $strTable .= '<td style="text-align:center;font-size:12px;width:220px;">ID</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="100">协议名称</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="100">甲方</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">有效期至</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">上传时间</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">协议状态</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">审核状态</td>';
        $strTable .= '</tr>';
        if(is_array($agreementarr)){
            foreach($agreementarr as $k=>$val){
                $strTable .= '<tr>';
                $strTable .= '<td style="text-align:center;font-size:12px;">&nbsp;'.$val['agreementid'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['filename'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['salername'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.date("Y-m-d H:i",$val['endtime']).'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.date("Y-m-d H:i",$val['addtime']).'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$xieyistatus[$val['status']].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$lookstatus[$val['auditor_status']].'</td>';
                $strTable .= '</tr>';
            }
        }
        $strTable .='</table>';
        unset($agreementarr);
        $this->item->downloadExcel($strTable,'agreement');
        exit();


    }

    //协议添加
    private function agreementAdd()
    {
        if($this->ev->get('create'))
        {
//            var_dump($this->ev->get('goods'));die;
            $userData = $this->user->getUserById($this->_user['sessionuserid']);
            $args = $this->ev->get('args');
            $param = array();
            $param['salerid'] = $salerid = $args['comp_code'];  //甲方id
            $param['salername'] = $args['comp_name'];  //甲方名称
            $param['userid'] = $userData['userid'];  //乙方名称
            $param['username'] = $userData['username'];  //乙方名称
            $param['agreement_number'] = $args['agreement_number']; //协议编号
            $param['payment_code'] = $args['fukuan_code']; //付款条码
            $param['file'] = $args['pdf']; //协议pdf地址
            $param['filename'] = substr($args['pdf_name'],0,strrpos($args['pdf_name'],".")); //协议名称
            $param['addtime'] = strtotime(date('Y-m-d',time()));
            $param['starttime'] = strtotime($args['starttime']);    //协议开始时间
            $param['endtime'] = strtotime($args['endtime']);    //协议结束时间
            $param['status'] = 1;
            $param['auditor_status'] = 1;
            if($param['endtime'] < time())
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "截止日期必须大于当前日期",
                );
                exit(json_encode($message));
            }
            $resId = $this->agreement->addAgreement($param);
            if($resId)
            {
                $this->agreement->addLog($resId, $userData['userid'], 1);
                $checkedGoods = $this->ev->get('goods');
                foreach($checkedGoods as $goodsId => $goodsData)
                {
                    foreach($goodsData as $goodsItem => $itemData)
                    {
                        $temp = array();
                        if(isset($itemData['item']) && !empty($itemData['pric']))
                        {
                            $temp['agreementid'] = $resId;
                            $temp['goodid'] = $goodsId;
                            $temp['itemid'] = $goodsItem;
                            $temp['agreement_price'] = $itemData['pric'];
                            $temp['goodsname'] = $itemData['name'];
                            $temp['addtime'] = time();
                            $temp['salerid'] = $salerid;
                            $this->agreement->addAgreementGoods($temp);
                        }
                    }
                }
                $message = array(
                    'statusCode' => 200,
                    "message" => "创建成功",
                );
            }
            else
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "创建协议失败",
                );
            }
            exit(json_encode($message));

        }
        else
        {
            $userid = $this->_user['sessionuserid'];
            $goods = $this->item->listGoodsAndItem($userid);
            //var_dump($goods);die;
            $this->tpl->assign('goods',$goods);
            $this->tpl->display('agreement_add');
        }

    }

    /**
     * [agreementApply 操作申请]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-16
     * @return   [type]        [description]
     */
    private function agreementApply()
    {
        #条件
        $param = array();
        $param['agreementid'] = intval($this->ev->get('agreementid'));
        $param['type'] = intval($this->ev->get('type'));
        $param['userid'] = $this->_user['sessionuserid'];
        $param['addtime'] = time();
        $param['status'] = 2;//已申请状态同步协议表中的 【auditor_status 审核状态】

        #执行添加
        $result = $this->agreementapply->addAgreementApply($param);
        
        if ($result) {
            #修改协议申请状态
            $sqstatus['auditor_status'] = 2;//已申请状态
            $this->agreement->modifyAgreement($param['agreementid'],$sqstatus);

            $message = array(
                'statusCode' => 200,
                "message" => "申请成功，请等待回馈消息",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-company-agreement-agreement"
            );
            exit(json_encode($message));
        } else {

            $message = array(
                'statusCode' => 300,
                "message" => "申请失败，可能网络异常，请稍后重试！",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-company-agreement-agreement"
            );
            exit(json_encode($message));
        }

    }

    /**
     * [agreementDel 删除方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-20
     * @return   [type]        [description]
     */
    private function agreementDel(){
        #条件
        $agreementid = intval($this->ev->get('agreementid'));

        if ($agreementid) {
            #删除
            $del['del'] = 1;
            #执行删除
            $result = $this->agreement->modifyAgreement($agreementid,$del);
            if ($result) {
               $this->agreement->addLog($agreementid, $this->_user['sessionuserid'], 2);
               $message = array(
                    'statusCode' => 200,
                    "message" => "删除成功",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?user-company-agreement-agreement"
                );
                exit(json_encode($message));
            } else {
                $message = array(
                    'statusCode' => 300,
                    "message" => "删除失败，可能网络异常,请稍后重试！",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?user-company-agreement-agreement"
                );
                exit(json_encode($message));
            }
            
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "删除失败，可能网络异常,请稍后重试！",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-company-agreement-agreement"
            );
            exit(json_encode($message));
        }
        
       

    }

    //协议修改
    private function agreementEdit()
    {
        $agreementid = $this->ev->get('agreementid');
        $agreement = $this->agreement->getAgreementById($agreementid);
        if($this->ev->get('edit'))
        {
            //var_dump($this->ev->get('args'));die;
            //var_dump($this->ev->get('goods'));die;
            $userData = $this->user->getUserById($this->_user['sessionuserid']);
            $args = $this->ev->get('args');
            $param = array();
            $param['salerid'] = $args['comp_code'];  //甲方id
            $param['salername'] = $args['comp_name'];  //甲方名称
            $param['userid'] = $userData['userid'];  //乙方名称
            $param['username'] = $userData['username'];  //乙方名称
            $param['agreement_number'] = $args['agreement_number']; //协议编号
            $param['payment_code'] = $args['fukuan_code']; //付款条码
            $param['file'] = $args['pdf']; //协议pdf地址
            $param['filename'] = substr($args['pdf_name'],0,strrpos($args['pdf_name'],".")); //协议名称
            //$param['addtime'] = time();
            $param['starttime'] = strtotime($args['starttime']);    //协议开始时间
            $param['endtime'] = strtotime($args['endtime']);    //协议开始时间
            $param['status'] = 1;
            $param['auditor_status'] = 1;
            $ret = $this->agreement->modifyAgreement($agreementid,$param);
            if($ret)
            {
                $diff = array_diff($param,$agreement);  //取修改的字段
                $this->agreement->addLog($agreementid, $userData['userid'], 3, $diff);  //调协议日志接口
                $this->agreement->delAgreementGoodsByAgreementId($agreementid); //先删除所有旧协议商品
                $checkedGoods = $this->ev->get('goods');
                foreach($checkedGoods as $goodsId => $goodsData)
                {
                    foreach($goodsData as $goodsItem => $itemData)
                    {
                        $temp = array();
                        if(isset($itemData['item']) && !empty($itemData['pric']))
                        {
                            $temp['agreementid'] = $agreementid;
                            $temp['goodid'] = $goodsId;
                            $temp['itemid'] = $goodsItem;
                            $temp['agreement_price'] = $itemData['pric'];
                            $temp['goodsname'] = $itemData['name'];
                            $temp['addtime'] = time();
                            $this->agreement->addAgreementGoods($temp);
                        }
                    }
                }
                //var_dump(1111111);die;
                $message = array(
                    'statusCode' => 200,
                    "message" => "修改成功",
                );
            }
            else
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "修改协议失败",
                );
            }
            exit(json_encode($message));

        }
        else
        {
            $userid = $this->_user['sessionuserid'];
            $goods = $this->item->getGoodsAndAgreementItem($userid,$agreementid);
            $payment = $this->sap->getFukuanById($agreement['payment_code']);
            $agreement['payment_text'] = $payment['text1'];
            $this->tpl->assign('goods',$goods);
            $this->tpl->assign('agreement',$agreement);
            $this->tpl->assign('agreementid',$agreementid);
            $this->tpl->display('agreement_edit');
        }

    }


    /**
     * [agreementDel 删除方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-20
     * @return   [type]        [description]
     */
    private function agreementDelete(){
        #条件
        $agreementid = intval($this->ev->get('agreementid'));

        if ($agreementid) {
            #删除
            $del['del'] = 1;
            #执行删除
            $result = $this->agreement->modifyAgreement($agreementid,$del);
            if ($result) {
               $this->agreement->addLog($agreementid, $this->_user['sessionuserid'], 2);
               $message = array(
                    'statusCode' => 200,
                    "message" => "删除成功",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?agreement-master-agreement-agreement"
                );
                exit(json_encode($message));
            } else {
                $message = array(
                    'statusCode' => 300,
                    "message" => "删除失败，可能网络异常,请稍后重试！",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?agreement-master-agreement-agreement"
                );
                exit(json_encode($message));
            }
            
        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "删除失败，可能网络异常,请稍后重试！",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?agreement-master-agreement-agreement"
            );
            exit(json_encode($message));
        }
        
       

    }


   
}

?>
