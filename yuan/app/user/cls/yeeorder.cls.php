<?php
/**
 * Created by PhpStorm.
 * User: 50165
 * Date: 2018-9-26
 * Time: 11:32
 * 订单详情：x2_orderdetail
 */
class yeeorder_user
{
    public $G;
    public $path =__DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
        $this->module = $this->G->make('module');
        $this->session = $this->G->make('session');
        $this->meruser = $this->G->make('meruser', 'user');
    }

    /**
     * 插入数据-xiliheng-20180920
     * @param $args
     * @return mixed
     */
    public function insertRecord($args)
    {
        $data = array('orderdetail',$args);
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        return $this->db->lastInsertId();
    }

    /**
     * 获取指定订单的订单详情 - xiliheng-2018-09-27
     * @param $ordersn
     * @return mixed
     */
    public function getDataByOrderId($ordersn)
    {
        $data = array(false,'orderdetail',array(array('AND',"ordersn = {$ordersn}")));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql);
    }

    /**
     * 修改订单详情内容-xiliheng-2018-09-26
     * @param $id
     * @param $args
     * @return mixed
     */
    public function modifyOrder($id,$args)
    {
        $data = array(
            'table' => 'orderdetail',
            'value' => $args,
            'query' => array(array("AND","ordersn = :ordersn",'ordersn',$id))
        );
        return $this->db->updateElement($data);
    }

    /**
     * 处理请求元素获取签名字符串-xiliheng-2018-09-27
     * @param $response
     * @return string
     */
    public function getString($response){

        $str="";

        foreach ($response as $key => $value) {
            $str .= $key . "=" . $value . "&";
        }
        $getSign = substr($str, 0, strlen($str) - 1);
        return $getSign;
    }

    /**
     * 获取请求的url-xiliheng-2018-09-27
     * @param $response
     * @param $private_key
     * @return string
     */
    public function  getUrl($response,$private_key)
    {
        $content=$this->toString($response);
        $sign=YopSignUtils::signRsa($content,$private_key);
        $url=$content."&sign=".$sign;
        return  $url;
    }

    /**
     * 获取对象属性并且以数组的形式返回-xiliheng2018-09-27
     * @param $array
     * @return array
     */
    public function object_array($array) {
        if(is_object($array)) {
            $array = (array)$array;
        } if(is_array($array)) {
            foreach($array as $key=>$value) {
                $array[$key] = $this->object_array($value);
            }
        }
        return $array;
    }
    #将参数转换成k=v拼接的形式
    public function toString($arraydata){
        $Str="";
        foreach ($arraydata as $k=>$v){
            $Str .= strlen($Str) == 0 ? "" : "&";
            $Str.=$k."=".$v;
        }
        return $Str;
    }

    /**
     * 发送订单，调用易宝下单接口
     * @param $order
     * @return string
     */
    public function sendOrder($order)
    {
        $path = __DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）
        require_once ($path.'../../../yop-api/lib/YopRequest.php');//引入注册类文件
        require_once ($path.'../../../yop-api/conf.php');//引入配置文件
        require_once ($path.'../../../yop-api/lib/YopClient3.php');//引入请求类
        require_once ($path.'../../../yop-api/lib/Util/YopSignUtils.php');//引入请求类

        $goodsParamExt = [
            'goodsName' => '产品',
            'goodsDesc' => '描述'
        ];

        $dmacData=array();
        $dmacData['parentMerchantNo']=$parentMerchantNo;
        $dmacData['merchantNo']=$merchantNo;
        $dmacData['orderId']=$order['yeeOrdersn'];
        $dmacData['orderAmount']= '0.01';
        $dmacData['notifyUrl']=$notifyOrderURL;
        $str = $this->toString($dmacData);
        $hmacstr = hash_hmac('sha256', $str, $hmacKey, true);
        $hmac = bin2hex($hmacstr);

        $this->meruser->addYeeNoticeLog("order", 'order',$str, $hmacKey);

        $request = new YopRequest($appkey, $private_key, "https://open.yeepay.com/yop-center",$yop_public_key);
        $request->addParam("parentMerchantNo", $parentMerchantNo);
        $request->addParam("merchantNo", $merchantNo);
        $request->addParam("orderId", $order['yeeOrdersn']);
        //$request->addParam("orderAmount", $order['yeeOrderPrice']);
        $request->addParam("orderAmount", '0.01');//测试情况下默认订单金额为0.01
        $request->addParam("timeoutExpress", '1440');//默认订单有效期是一天
        $request->addParam("requestDate", date("Y-m-d H:i:s"));
        $request->addParam("redirectUrl", $redirectURL);//同步回调地址
        $request->addParam("notifyUrl", $notifyOrderURL);
        $request->addParam("goodsParamExt", json_encode($goodsParamExt));
        $request->addParam("fundProcessType", 'DELAY_SETTLE');
        $request->addParam("hmac",$hmac);

        $this->meruser->addYeeNoticeLog("order", 'order',json_encode($request), '步骤1');
        $response = YopClient3::post("/rest/v1.0/sys/trade/order", $request);
        $this->meruser->addYeeNoticeLog("order", 'order',json_encode($response), '步骤2');

        //取得返回结果
        $data=$this->object_array($response);
        $this->meruser->addYeeNoticeLog("order", 'order',json_encode($data), '步骤3');

        $token=$data['result']['token'];
        $cashter = array(
            "merchantNo" => $parentMerchantNo ,
            "token" => $token,
            "timestamp" => time(),
            "directPayType" => '',//默认不传
            "cardType" => '',//默认不传
            "userNo" => $order['orderuserid'],//用户表示
            "userType" => 'USER_ID',//用户标识类型：用户id
            "ext" => '',
        );

        $getUrl = $this->getUrl($cashter, $private_key);

        $url = "https://cash.yeepay.com/cashier/std?" . $getUrl;

        $extData = [
            'appkey' => $appkey,
            'private_key' => $private_key,
            'yop_public_key' => $yop_public_key,
            'parentMerchantNo' => $parentMerchantNo,
            'merchantNo' => $merchantNo
        ];
        $this->meruser->addApiLog("/rest/v1.0/sys/trade/order", $order['ordersn'],$order['orderuserid'], json_encode($request), json_encode($data), json_encode($extData));

        return $url ;
    }

    /**
     * 分账功能-xiliheng-2018-09-27
     * @param $divideDetail
     * @return array
     */
    public function divideMerchantAccount($divideDetail)
    {
        require_once ($this->path.'../../../yop-api/lib/YopRequest.php');//引入注册类文件
        require_once ($this->path.'../../../yop-api/conf.php');//引入配置文件
        require_once ($this->path.'../../../yop-api/lib/YopClient3.php');//引入请求类

        $request = new YopRequest($appkey, $private_key, "https://open.yeepay.com/yop-center",$yop_public_key);
        $request->addParam("parentMerchantNo", $parentMerchantNo);
        $request->addParam("merchantNo", $merchantNo);
        $request->addParam("divideRequestId", $divideDetail['divideRequestId']);
        $request->addParam("orderId", $divideDetail['orderId']);
        $request->addParam("uniqueOrderNo", $divideDetail['uniqueOrderNo']);
        $request->addParam("divideDetail", $divideDetail['divideDetail']);
        //$request->addParam("infoParamExt", $divideDetail['infoParamExt']);
        //$request->addParam("isUnfreezeResidualAmount", $divideDetail['isUnfreezeResidualAmount']);
        $request->addParam("contractNo", $divideDetail['contractNo']);

        $response = YopClient3::post("/rest/v1.0/sys/trade/divide", $request);

        //取得返回结果
        $data=$this->object_array($response);
        $this->meruser->addApiLog("/rest/v1.0/sys/trade/divide", $divideDetail['orderId'], $divideDetail['userId'],json_encode($divideDetail),json_encode($data), '分账');

        return $data;
    }

    /**
     * 统计某个一用户下sap+B2B全部订单数据
     * @param $args
     * @param string $tablepre
     * @return int
     */
    public function countOrderNumByUid($args, $tablepre = DTH)
    {
        $data = array($args['select'],$args['table'],$args['query'],$args['groupby'],$args['orderby']);
        $sql = $this->pdosql->makeSelect($data,$tablepre);
        $result = $this->db->fetchAll($sql,$args['index'],$args['serial']);
        $original = count($result);
        foreach ($result as $key => $value)
        {
            $data = array(false,'orderdetail',array(array('AND',"ordersn = {$value['ordersn']}")));
            $sql = $this->pdosql->makeSelect($data);
            $data = $this->db->fetchAll($sql);
            $original += (intval(count($data)) - 1);
        }
        
        return $original;
    }

    /**
     * @param $ordersn
     * @return mixed
     */
    public function getDataByUserId($ordersn)
    {
        $data = array(false,'orders',array(array('AND',"ordersn = {$ordersn}")));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    public function modifyOrderWithSeller($orderId,$goodsuserid,$args)
    {
        $data = array(
            'table' => 'orderdetail',
            'value' => $args,
            'query' => array(array("AND","ordersn = :ordersn",'ordersn',$orderId), array("AND","goodsuserid = :goodsuserid",'goodsuserid',$goodsuserid))
        );
        return $this->db->updateElement($data);
    }

    /**
     * @param $yeeorderId
     * @param $args
     * @return mixed
     * 修改根据yeeorder修改order信息
     */
    public function modifyByYeeOrder($yeeorderId, $args)
    {
        $data = array(
            'table' => 'orders',
            'value' => $args,
            'query' => array(array("AND","yeeOrdersn = :yeeOrdersn",'yeeOrdersn',$yeeorderId))
        );
        return $this->db->updateElement($data);
    }

    /**
     * 生成易宝统一订单
     */
    public function yeeOrderGen($userId)
    {
        //自动生成订单
        //$this->orderId = ORDER_PREFIX;//新增前缀-20170713
        $orderId = 'TIANRUN'.$this->orderIdGen(1, 1, $userId);
        $orderIdLen = strlen($orderId);
        if ($orderIdLen > 32)
        {
            $orderId = substr($orderId, 0,32);
        }

        return $orderId;
    }

    /**
     * @param $no
     * @param $type
     * @param $userId
     * @return string
     * 生成订单id
     */
    public function orderIdGen($no, $type, $userId){
        return $no.$type.$userId.date('YmdHis').rand(10000,99999);
    }


    /**
     * 易宝交易记录表
     * x2_payment
     * 席力恒 2018-11-15
     * @param $userId
     * @param $yeeOrderSn
     * @param $amount
     * @param $orderBalance
     * @return
     */
    public function addPaymentInfo($userId, $yeeOrderSn, $amount, $orderBalance)
    {
        $args['userId'] = $userId;
        $args['yeeOrdersn'] = $yeeOrderSn;
        $args['amount'] = $amount;
        $args['orderBalance'] = $orderBalance;
        $args['create_time'] = date('Y-m-d H:i:s');
        $args['update_time'] = date('Y-m-d H:i:s');

        return $this->db->insertElement(array('table' => 'payment','query' => $args));
    }

    /**
     * @param $yeeOrderSn
     * @return mixed
     * 获取交易信息
     * xiliheng-2018-11-15
     */
    public function getPayment($yeeOrderSn)
    {
        $data = array(false,'payment',array(array('AND',"yeeOrdersn = {$yeeOrderSn}")));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    public function updatePayment($yeeorderId, $args)
    {
        $data = array(
            'table' => 'payment',
            'value' => $args,
            'query' => array(array("AND","yeeOrdersn = :yeeOrdersn",'yeeOrdersn',$yeeorderId))
        );
        return $this->db->updateElement($data);
    }
}