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
        $this->agreementApply = $this->G->make('agreementapply', 'agreement');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->item = $this->G->make('item','item');
        $this->cart = $this->G->make('cart','item');
        $cartNumArr = $this->cart->getCartUserNum();
        foreach ($cartNumArr as $k => $v) {
            $cartnums[] = $v['number'];
        }
        $cartNum = array_sum($cartnums)?array_sum($cartnums):0;

        #协议状态
        $xieyistatus = array(1 =>'未生效',2 => '待生效', 3 => '生效', 4 => '已失效');
        #审核状态
        $lookstatus = array(1 =>'未提交',2 => '已申请', 3 => '已通过', 4 => '未通过');
        #申请类型
        $type = array(1 =>'申请生效',2 => '申请失效');

        #采购寻源类
        $this->purchase = $this->G->make('content','purchase');
        $this->ppe = $this->G->make('price','purchase');
        $this->clarify = $this->G->make('clarify','user');


        $this->tpl->assign('links',$links);
        $this->tpl->assign('cartNum',$cartNum);
        $this->tpl->assign('xieyistatus',$xieyistatus);
        $this->tpl->assign('lookstatus',$lookstatus);
        $this->tpl->assign('type',$type);
        if(!method_exists($this,$action))
            $action = "index";
        $this->$action();
        exit;
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
        $status = intval($this->ev->get('status'));
        $salername = $this->ev->get('salername');
        $username = $this->ev->get('username');
        $endtime = strtotime($this->ev->get('endtime'));
        $addtime = strtotime($this->ev->get('addtime'));
        $userid = intval($this->ev->get('userid'));
        $salerid = intval($this->ev->get('salerid'));




        #声明空数组
        $args = array();

        //---供应商列表协议数量跳转进行查询---【甲方或乙方都查询】-------
        if ($userid || $salerid) {
            $args[] = array("AND","del = :del",'del',0);//未删除的
            $args[] = array("AND","userid = :userid",'userid',$userid);
            $args[] = array("OR","salerid = :salerid",'salerid',$salerid);
        }else{
            $args[] = array("AND","del = :del",'del',0);//未删除的
            if($keyword)$args[] = array("AND","filename LIKE :filename",'filename',"%{$keyword}%");//关键字搜索
            if($status)$args[] = array("AND","status = :status",'status',$status);//状态
            if($salername)$args[] = array("AND","salername LIKE :salername",'salername',"%{$salername}%");//甲方
            if($username)$args[] = array("AND","username LIKE :username",'username',"%{$username}%");//乙方
            if($endtime)$args[] = array("AND","endtime = :endtime",'endtime',$endtime);//有效日期至
            if($addtime)$args[] = array("AND","addtime = :addtime",'addtime',$addtime);//添加时间
        }

        #获取当前用户的所有的框架协议
        $agreementarr = $this->agreement->getAgreementList($args,$page,$number = 10);
        if ($endtime) {
            # code...
            $endtime = date("Y-m-d",$endtime);
        }

        if ($addtime) {
            # code...
            $addtime = date("Y-m-d H:i",$addtime);
        }

        $this->tpl->assign('page',$page);
        $this->tpl->assign('keyword',$keyword);
        $this->tpl->assign('status',$status);
        $this->tpl->assign('salername',$salername);
        $this->tpl->assign('username',$username);
        $this->tpl->assign('endtime',$endtime);
        $this->tpl->assign('addtime',$addtime);
        $this->tpl->assign('agreementarr',$agreementarr);
        $this->tpl->display('agreement');
    }


    /**
     * [agreement 删除方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-15
     * @returns  {array}
     * @return   [array]        [bool]
     */
    private function agreementDel()
    {
        #搜索条件
        $agreementid = intval($this->ev->get('agreementid'));
        if ($agreementid) {
            //var_dump($agreementid);die;
            $args['del']  =1;
            $result1 = $this->agreement->modifyAgreement($agreementid,$args);
            if ($result1) {
                # code..
                $this->agreement->addLog($agreementid,$this->_user['sessionuserid'],2);
                $message = array(
                    'statusCode' => 200,
                    "message" => "操作成功",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?agreement-master-agreement-agreement"
                );
            } else {
                $message = array(
                    'statusCode' => 200,
                    "message" => "操作失败，可能网络异常",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?agreement-master-agreement-agreement"
                );
            }


        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "操作失败，可能网络异常",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?agreement-master-agreement-agreement"
            );
        }

    }

    /**
     * [agreementModify 总后台的协议失效方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-24
     * @return   [bool]        [true or false]
     */
    private function agreementModify(){
        #搜索条件
        $agreementid = intval($this->ev->get('agreementid'));

        if ($agreementid) {
            $args['status']  =4;
            $result1 = $this->agreement->modifyAgreement($agreementid,$args);
            if ($result1) {
                # code...
                $this->agreement->addLog($agreementid,$this->_user['sessionuserid'],5);
                $message = array(
                    'statusCode' => 200,
                    "message" => "操作成功",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?agreement-master-agreement-agreement"
                );
            } else {
                $message = array(
                    'statusCode' => 200,
                    "message" => "操作失败，可能网络异常",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?agreement-master-agreement-agreement"
                );
            }


        } else {
            $message = array(
                'statusCode' => 300,
                "message" => "操作失败，可能网络异常",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?agreement-master-agreement-agreement"
            );
        }
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
        $strTable .= '<td style="text-align:center;font-size:12px;" width="100">乙方</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">有效期至</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">上传时间</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">状态</td>';
        $strTable .= '</tr>';
        if(is_array($agreementarr)){
            foreach($agreementarr as $k=>$val){
                $strTable .= '<tr>';
                $strTable .= '<td style="text-align:center;font-size:12px;">&nbsp;'.$val['agreementid'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['filename'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['salername'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['username'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.date("Y-m-d H:i",$val['endtime']).'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.date("Y-m-d H:i",$val['addtime']).'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$xieyistatus[$val['status']].'</td>';
                $strTable .= '</tr>';
            }
        }
        $strTable .='</table>';
        unset($agreementarr);
        $this->item->downloadExcel($strTable,'agreement');
        exit();
    }


    /**
     * [agreementApply 协议申请方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-15
     * @return   [array]        [结果集]
     */
    private function agreementapply(){
        $page = intval($this->ev->get('page'));
        #声明空数组
        $args = array();
        #查询出所有的申请列表
        $agreementApplyList = $this->agreementApply->getAgreementApplyList($args,$page,$number = 10);
        $this->tpl->assign('agreementApplyList',$agreementApplyList);
    	$this->tpl->display('agreementApply');
    }

    /**
     * [modifyAgreementApply 申请操作方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-16
     * @return   [type]        [description]
     */
    private function modifyAgreementApply(){
        #条件
        $agreementid = intval($this->ev->get('agreementid'));
        $applyid = intval($this->ev->get('applyid'));
        $type = intval($this->ev->get('type'));//【生效操作type=1   失效操作type=2】

        #协议详情
        $agreementinfo = $this->agreement->getAgreementById($agreementid);

        if ($agreementid) {
            if ($type==1) {
                #判断当前时间是否在协议有效期内
                $nowtime = time();
                if ($nowtime>=$agreementinfo['starttime'] && $nowtime<=$agreementinfo['endtime']) {
                    $args = array('status'=>3,'auditor_status'=>3);//有效期内直接使合同生效
                } else {
                    $args = array('status'=>2,'auditor_status'=>3);//合同为待生效状态
                }

                $result1 = $this->agreement->modifyAgreement($agreementid,$args);
                #修改申请表中状态为已通过
                $args1 = array('status'=>3);
                $result2 = $this->agreementApply->modifyAgreementBygreementid($agreementid,$args1,$type);

                #生效记录
                $this->agreement->addLog($agreementid,$this->_user['sessionuserid'],4);
            } elseif($type==2) {
                #改变协议状态为 失效状态3  申请状态为已通过3
                $args = array('status'=>4,'auditor_status'=>3);
                $result1 = $this->agreement->modifyAgreement($agreementid,$args);
                #修改申请表中状态为已通过
                $args1 = array('status'=>3);
                $result2 = $this->agreementApply->modifyAgreementBygreementid($agreementid,$args1,$type);

                #失效记录
                $this->agreement->addLog($agreementid,$this->_user['sessionuserid'],5);
            }elseif ($type==3) {
                #改变协议状态为 失效状态3  申请状态为已通过3
                $args = array('status'=>4,'auditor_status'=>3);
                $result1 = $this->agreement->modifyAgreement($agreementid,$args);
                #修改申请表中状态为已通过
                /*$args1 = array('status'=>3);
                $result2 = $this->agreementApply->modifyAgreementBygreementid($agreementid,$args1,$type);*/

                #失效记录
                $this->agreement->addLog($agreementid,$this->_user['sessionuserid'],5);
            }

            if ($type==3) {
                $message = array(
                    'statusCode' => 200,
                    "message" => "操作成功",
                    "callbackType" => "forward",
                    "forwardUrl" => "index.php?agreement-master-agreement-agreement"
                );
            } else {
               if ($result1 && $result2) {
                   $message = array(
                        'statusCode' => 200,
                        "message" => "操作成功",
                        "callbackType" => "forward",
                        "forwardUrl" => "index.php?agreement-master-agreement-agreementApply"
                    );
                } else {
                    $message = array(
                        'statusCode' => 300,
                        "message" => "操作失败，可能网络异常",
                        "callbackType" => "forward",
                        "forwardUrl" => "index.php?agreement-master-agreement-agreementApply"
                    );
                }
            }

            exit(json_encode($message));
        } else {
           $message = array(
                'statusCode' => 300,
                "message" => "操作失败，可能网络异常",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?agreement-master-agreement-agreementApply"
            );
            exit(json_encode($message));
        }

    }



    /**
     * [agreementApply 协议日志]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-15
     * @return   [array]        [结果集]
     */
    public function agreementJournal(){
        #搜索条件
        $page = intval($this->ev->get('page'));
        #搜索条件
        $agreementid = intval($this->ev->get('agreementid'));
        $args = [];
        if ($agreementid) {
            $args[] = array("AND","agreementid = :agreementid",'agreementid',$agreementid);//当前登录用户
        }
        $agreementLogArr = $this->agreement->getAgreementLogList($args,$page,$number = 10);

        $this->tpl->assign('page',$page);
        $this->tpl->assign('agreementLogArr',$agreementLogArr);
    	$this->tpl->display('agreementJournal');
    }

    //--------弹出框------------------
    private function ajaxagreement()
    {
        $agreementid = $this->ev->get('agreementid');
        $applyid = $this->ev->get('applyid');

        if($agreementid)
        {
            $html = '';
            $html .= '<input name="ordersn" type="hidden" value="'.$agreementid.'" id="ordersn2">';
            $html .= '<input name="ordersn" type="hidden" value="'.$applyid.'" id="applyid">';

            $message = array(
                'statusCode' => 201,
                'message' => "成功",
                'data'  => $html
            );
            exit(json_encode($message));
        }
        else
        {
            $message = array(
                'statusCode' => 300,
                "message" => "数据不存在"
            );
            exit(json_encode($message));
        }

    }

    /**
     * [agreementcacel 申请不通过方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-20
     * @return   [type]        [description]
     */
    private function agreementcancel(){
        $agreementid = $this->ev->get('agreementid');
        $reason = $this->ev->get('reason');
        $applyid = $this->ev->get('applyid');

        if ($agreementid && $reason) {
           $args['reason'] = $reason;
           $args['auditor_status'] = 4;//不通过的状态为4
           $result = $this->agreement->modifyAgreement($agreementid,$args);
           #同步申请表中的申请状态
           $args1['status'] = 4;
           $typearr = $this->agreementApply->getAgreementApplyById($applyid);
           $result1 = $this->agreementApply->modifyAgreementBygreementid($agreementid,$args1,$typearr['type']);
           #判读结果
           if ($result && $result1) {
               $this->agreement->addLog($agreementid,$this->_user['sessionuserid']);
               $message = array(
                    'statusCode' => 200,
                    "message" => "操作成功",
                    "callbackType" => "forward",
                    "forwardUrl" => "reload"
                );
                exit(json_encode($message));
           } else {
               $message = array(
                    'statusCode' => 300,
                    "message" => "非法操作"
                );
                exit(json_encode($message));
           }

        } else {
           $message = array(
                'statusCode' => 300,
                "message" => "数据不存在"
            );
            exit(json_encode($message));
        }


    }


    /**
     * [offer 总后台报价管理]
     * @Author    张建超
     * @DateTime  2018-11-13
     * @return    [array]      [报价列表]
     */
    private function offer(){

        $xunjiaid = $this->ev->get('id');
        $keyword = strip_tags($this->ev->get('keyword'));
        $type = intval($this->ev->get('purchasetype'));
        $status = intval($this->ev->get('purchasestatus'));
        $stime = strtotime($this->ev->get('stime'));
        $etime = strtotime($this->ev->get('etime'));
        $companyname = strip_tags($this->ev->get('companyname'));

        $pageType = $this->ev->get('t');    //点击搜索传过来的参数，用来区分展示搜索结婚还是列表数据
        $page = intval($this->ev->get('page'))?intval($this->ev->get('page')):1;
        $args  = array();

        //搜索条件
        if($keyword)$args[] = array("AND","xunjia_title LIKE :xunjia_title",'xunjia_title',"%{$keyword}%");//关键字搜索
        if($companyname)$args[] = array("AND","company_name LIKE :company_name",'company_name',"%{$companyname}%");//关键字搜索
        if($status)$args[] = array("AND","status = :status",'status',$status);//状态
        if($type)$args[] = array("AND","xunjia_type = :xunjia_type",'xunjia_type',$type);//类型
        if($stime)$args[] = array("AND","create_time >= '".$stime."'");//发布开始时间
        if($etime)$args[] = array("AND","create_time <= '".$etime."'");//发布结束时间
        $args[] = array('AND',"del = :del",'del',0);
        $offerarr = $this->ppe->purchaseList($args,$page,5);
        //询价详情
        foreach ($offerarr['data'] as $k => &$v) {
            //触发修改询价信息的状态
            $xunjianum = $this->purchase->getPurchseNumber($v['purchase_new_id']);
            if($v['status']==1){
                if ((time()>$v['end_time']) && $xunjianum) {

                    $args1['status'] = 2;
                    $this->purchase->updatePurchase($v['purchase_new_id'],$args1);
                }elseif ((time()>$v['end_time']) && !$xunjianum) {
                    //【时间截止如果没人报价则修改为已终止4】
                    $args1['status'] = 4;
                    $this->purchase->updatePurchase($v['purchase_new_id'],$args1);
                }

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

        $this->tpl->assign('offerarr',$offerarr);
        $this->tpl->assign('pageStatus',$pageStatus);
        $this->tpl->display('offer');
    }


}

?>
