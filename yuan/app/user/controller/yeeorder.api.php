<?php
/**
 * Created by PhpStorm.
 * User: 50165
 * Date: 2018-9-26
 * Time: 14:36
 * 主要用来接受易宝的回调，所以不能有登陆校验操作
 */
class action extends app
{
    public function display()
    {
        $this->sql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->user = $this->G->make('user','user');
        $this->orders = $this->G->make('orders','bank');
        $this->meruser = $this->G->make('meruser', 'user');
        $this->yeeorders = $this->G->make('yeeorder','user');
        $this->item = $this->G->make('item','item');
        $this->core = $this->G->make('setorder','core');
        $this->msg = $this->G->make('msg','user');
        $this->_user = $_user = $this->session->getSessionUser();
        $action = $this->ev->url(3);
        if(!method_exists($this,$action))
            $action = "index";
        $this->$action();
        exit;
    }


    /**
     * 如果结果异步通知接口
     * xiliheng-20180920
     * 考虑-暂时不使用事务
     * xiliheng-2018-1109
     * 增加事务处理操作
     */
    public function merchantNotify()
    {
        $path = __DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）
        require_once ($path.'../../../yop-api/conf.php');//引入配置文件
        require_once ($path.'../../../yop-api/lib/YopClient3.php');//引入配置文件
        require_once ($path.'../../../yop-api/lib/YopClient.php');
        require_once ($path.'../../../yop-api/lib/Util/YopSignUtils.php');

        $this->db->beginTransaction();

        //获取返回参数
        $requestData = $_REQUEST;//["response"];
        $requestData = $this->yeeorders->object_array($requestData);
        $this->meruser->addYeeNoticeLog('user-api-yeeorder-merchantNotify', 'merchantNotify', $requestData, '接收商户入网异步通知');
        /*try
        {*/
            //解密数据
            $decodeData = YopSignUtils::decrypt($requestData['response'],$private_key, $yop_public_key);
            $data = json_decode($decodeData, true);
            if ($data['status'] != 'SUCCESS')
            {
                throw new Exception("商户入网失败");
            }
            else
            {
                //更新注册商户状态
                $registerArr['merchantNo'] = $data['merNo'];
                $registerArr['externalId'] = $data['externalId'];
                $registerArr['updateTime'] = date("Y-m-d H:i:s");
                $registerArr['status'] = $data['merNetInStatus'];
                $registerArr['remark'] = $data['remark'];
                $this->meruser->updateMerUserByRequestNo($registerArr, $data['requestNo']);
            }

            //记录日志
            $this->meruser->addYeeNoticeLog('user-api-yeeorder-merchantNotify', 'merchantNotify', json_encode($data), '商户入网成功');
            //回写SUCCESS
            echo "SUCCESS";
        /*}
        catch (Exception $e)
        {
            $ext = "error:".$e->getMessage();;
            $this->db->rollback();
        }*/

        //$this->meruser->addYeeNoticeLog('user-api-yeeorder-merchantNotify', 'merchantNotify', $data, $ext);
    }


    /**
     * 下单同步通知地址 - xiliheng - 2018-09-26
     */
    public function redirectOrder()
    {
        echo "支付成功";
    }

    /**
     * 下单异步通知 - xiliheng - 2018-09-26
     * 1、修改x2_orderdetail中所有订单的状态，设置支付结果
     * 2、给卖家发送通知
     * 3、记录交易信息，用于后期分账
     * 注意：
     * 1、orderId：这里的orderId是x2_orders中的yeeOrdersn字段
     */
    public function notifyYeePay()
    {
        $path = __DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）
        require_once ($path.'../../../yop-api/conf.php');//引入配置文件
        require_once ($path.'../../../yop-api/lib/YopClient3.php');//引入配置文件
        require_once ($path.'../../../yop-api/lib/YopClient.php');
        require_once ($path.'../../../yop-api/lib/Util/YopSignUtils.php');

        $this->db->beginTransaction();

        //获取返回参数
        $requestData = $_REQUEST;//["response"];
        $requestData = $this->yeeorders->object_array($requestData);
        $this->meruser->addYeeNoticeLog('user-api-yeeorder-notifyYeePay', 'orderNotify', json_encode($requestData), '接收易宝下单异步通知');

        try
        {
            //解密数据
            $decodeData = YopSignUtils::decrypt($requestData['response'],$private_key, $yop_public_key);
            $notifyData = json_decode($decodeData, true);
            if ($notifyData['status'] != 'SUCCESS')
            {
                throw new Exception("交易失败");
            }
            else
            {
                //更新orders订单状态
                $registerArr['orderstatus'] = 1;//--付款成功-待确认-席力恒------
                $registerArr['bt_orderstatus'] = $notifyData['status'] == 'SUCCESS' ? 1 : 0;
                $registerArr['bt_uniqueOrderNo'] = $notifyData['uniqueOrderNo'];
                $registerArr['bt_updatetime'] = date("Y-m-d H:i:s");
                $registerArr['bt_bankTrxId'] = $notifyData['bankTrxId'];
                $registerArr['bt_bankOrderId'] = $notifyData['bankOrderId'];
                $registerArr['bt_paySuccessDate'] = $notifyData['paySuccessDate'];
                $registerArr['bt_platformType'] = $notifyData['platformType'];
                $registerArr['bt_bankPaySuccessDate'] = $notifyData['bankPaySuccessDate'];
                $registerArr['bt_customerFee'] = $notifyData['customerFee'];
                //$registerArr['bt_mechantFee'] = $notifyData['mechantFee'];
                $registerArr['bt_bankId'] = $notifyData['bankId'];
                $registerArr['bt_paymentProduct'] = $notifyData['paymentProduct'];
                $registerArr['bt_parentMerchantNo'] = $notifyData['parentMerchantNo'];//主商户编号(平台商编号)
                $registerArr['bt_merchantNo'] = $notifyData['merchantNo'];//收款商户编号
                $this->orders->modifyOrderByYeeSn($notifyData['orderId'], $registerArr);

                //这里应该是循环发送
                //发送买家付款成功通知给卖家
                $orderInfo = $this->orders->getByYeeOrderSn($notifyData['orderId']);
                $orderUserId = 0;
                $amount = 0;
                if (!empty($orderInfo))
                {
                    foreach ($orderInfo as $key => $orderRecord)
                    {
                        $orderUserId = $orderRecord['orderuserid'];
                        $amount = $orderRecord['yeeOrderPrice'];
                        $msgData  = array();
                        $msgData['orderitems'][0]['goodsuserid'] = $orderInfo['ordersalerid'];//卖家
                        $msgData['ordersn'] = $orderInfo['ordersn'];
                        $this->msg->sendMsg($msgData,1);
                    }
                }

                //记录订单交易信息
                $this->yeeorders->addPaymentInfo($orderUserId, $notifyData['orderId'], $amount, $amount);
            }
            //记录日志
            $this->meruser->addYeeNoticeLog('user-api-yeeorder-notifyYeePay', 'orderNotify', json_encode($notifyData), '下单异步操作成功');
            $this->db->commit();
            echo "SUCCESS";//回写SUCCESS
        }
        catch (Exception $e)
        {
            $ext = "error:".$e->getMessage();
            $this->db->rollback();
        }

        $this->meruser->addYeeNoticeLog('user-api-yeeorder-notifyYeePay', 'orderNotify', $notifyData, $ext);
    }
    
    public function echoInfo()
    {
        $path = __DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）
        require_once ($path.'../../../fastDFS/FastDFS.php');//引入注册类文件
        
        $dfs=new FastDFS();
        $tracker = $dfs->tracker_get_connection();

        $location = "";
        $fileurl = '/home/www/yigou/files/attach/images/content/20181122/15428842484626.jpg';

        if($dfs->active_test($tracker)){
            $storaged = $dfs->tracker_query_storage_store("group1",$tracker);
            if(!empty($sizes)){
                $count = 0;
                $filename = $dfs->storage_upload_by_filename($fileurl);
                if(isset($filename['group_name'])&&isset($filename['filename'])){
                    $location =$filename['group_name']."/".$filename['filename'];
                }
                foreach($sizes as $key=>$val){
                    $snapshot_file_info =$dfs->storage_upload_slave_by_filename($val,"group1",$filename['filename'],$key);
                    if($snapshot_file_info){
                        $count++;
                    }
                }
                if($count <> count($sizes)){
                    $location = "";
                }
            }else{
                $filename = $dfs->storage_upload_by_filename($fileurl);
                if(isset($filename['group_name'])&&isset($filename['filename'])){
                    $location =$filename['group_name']."/".$filename['filename'];
                }
            }
            //var_dump($filename);die;
        }

        var_dump($location);die;
        /*echo "<pre>";
        print_r($snapshot_file_info);
        echo $location;*/
    }

    public function updateInfo()
    {
        //记录分账请求
        $divideInfoArr = [
            'userId' => 87,
            'divideUserId' => 54,
            'divideRequestId' => 'TIANRUN11872018111513252876607',
            'orderId' => 'TIANRUN11872018111513252876607',
            'uniqueOrderNo' => 'TIANRUN11872018111513252876607' ,
            'ledgerAmount' => 10,
            'orderBalance' => 5,
            'amount' => 200,
            'contractNo' => 'TIANRUN11872018111513252876607',
            'ledgerNo' => '10015393195',
            'create_time' => date('Y-m-d H:i:s'),
            'status' => 'FAIL'
        ];
        $this->db->insertElement(array('table' => 'divide_info','query' => $divideInfoArr));
    }
}