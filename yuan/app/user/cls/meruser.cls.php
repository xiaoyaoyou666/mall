<?php
/**
 * Created by PhpStorm.
 * User: 50165
 * Date: 2018-9-20
 * Time: 14:08
 */
class meruser_user
{
    public $G;
    public $path = __DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）

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
    }

    /**
     * 插入数据-xiliheng-20180920
     * @param $args
     * @return mixed
     */
    public function insertRecord($args)
    {
        $data = array('meruser',$args);
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        return $this->db->lastInsertId();
    }

    /**
     * 更新入网信息-xiliheng20180920
     * 查询条件-requestNo
     * 注意：这里的requestNo必须放在单引号中，否在在进行update操作时会无法查询到对应记录
     * @param $args
     * @param $requestNo
     * @return bool
     * @internal param $userid
     */
    public function updateMerUserByRequestNo($args,$requestNo)
    {
        if(!$args)return false;
        $data = array('meruser',$args,array(array('AND',"requestNo = '{$requestNo}'")));
        $sql = $this->pdosql->makeUpdate($data);

        return $this->db->exec($sql);
        //return $this->db->affectedRows();
    }

    /**
     * @param $id
     * @return mixed
     * 获取用户的入网信息-xiliheng-20180920  
     */
    public function getDataById($id)
    {
        $data = array(false,'meruser',array(array('AND',"userId = {$id}")));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    /**
     * 生成requestNo - xiliheng -20180920
     * 开头前缀TR
     * 格式：TR+userid+randStr+time
     * @param $userid
     * @return string
     */
    public function makeRequestNo($userid, $totalLen)
    {
        $prefix_str = "TIANRUN";
        $time = time();
        $diffLen =  $totalLen - intval(strlen($prefix_str)) - intval(strlen($prefix_str)) - intval(strlen($time));
        $str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

        $requestNo = $prefix_str.$userid.$time;
        for ($i=0; $i < $diffLen; $i++)
        {
            $rand = mt_rand(0, $diffLen-1);
            $requestNo .= $str[$rand];
        }

        return $requestNo;
    }

    /**
     * 调用易宝注册接口
     * @param $regData
     * @return array
     * @internal param $data
     */
    public function registerYee($regData)
    {
        $classPath = $this->path.'../../../yop-api/lib/YopRequest.php';
        require_once ($this->path.'../../../yop-api/conf.php');//引入配置文件
        require_once ($this->path.'../../../yop-api/lib/YopClient3.php');//引入配置文件
        require_once ($classPath);//引入注册类文件
        $request = new YopRequest($appkey, $private_key, "https://open.yeepay.com/yop-center",$yop_public_key);

        $request->addParam("parentMerchantNo", $parentMerchantNo);
        $request->addParam("requestNo", $regData['requestNo']);
        $request->addParam("merFullName", $regData['merFullName']);
        $request->addParam("merShortName", $regData['merShortName']);
        $request->addParam("merCertType", $regData['merCertType']);
        $request->addParam("merCertNo", $regData['merCertNo']);
        $request->addParam("legalName", $regData['legalName']);
        $request->addParam("legalIdCard", $regData['legalIdCard']);

        $request->addParam("merLevel1No", $regData['merLevel1No']);
        $request->addParam("merLevel2No", $regData['merLevel2No']);
        $request->addParam("merProvince", $regData['merProvince']);
        $request->addParam("merCity", $regData['merCity']);
        $request->addParam("merDistrict", $regData['merDistrict']);
        $request->addParam("merAddress", $regData['merAddress']);
        $request->addParam("merContactName", $regData['merContactName']);
        $request->addParam("merContactPhone", $regData['merContactPhone']);
        $request->addParam("merContactEmail", $regData['merContactEmail']);
        $request->addParam("taxRegistCert", $regData['taxRegistCert']);
        $request->addParam("accountLicense", $regData['accountLicense']);
        $request->addParam("orgCode", $regData['orgCode']);
        $request->addParam("isOrgCodeLong", $regData['isOrgCodeLong'] ? 'true' : 'false');
        $request->addParam("orgCodeExpiry", $regData['orgCodeExpiry']);
        $request->addParam("merAuthorizeType", 'SMS_AUTHORIZE');

        $request->addParam("cardNo", $regData['cardNo']);
        $request->addParam("headBankCode", $regData['headBankCode']);
        $request->addParam("bankCode", $regData['bankCode']);
        $request->addParam("bankProvince", $regData['bankProvince']);
        $request->addParam("bankCity", $regData['bankCity']);
        $request->addParam("productInfo", $regData['productInfo']);
        $request->addParam("fileInfo", $regData['fileInfo']);
        $request->addParam("businessFunction", $regData['businessFunction']);
        $request->addParam("notifyUrl", $merchantRegisterNotify);
        //$request->addParam("merAuthorizeType", $regData['merAuthorizeType']);

        $response = YopClient3::post("/rest/v1.0/sys/merchant/enterprisereginfoadd", $request);
        
        //取得返回结果
        $data=$this->object_array($response);
        $this->addApiLog("/rest/v1.0/sys/merchant/enterprisereginfoadd", $regData['requestNo'], $regData['userId'], json_encode($regData), json_encode($data));
        
        return $data;
    }

    /**
     * 记录易宝接口请求记录
     * @param $url
     * @param $relatedId
     * @param int $userid
     * @param string $data
     * @param string $receive
     * @param string $exten
     * @return mixed
     */
    public function addApiLog($url,$relatedId,$userid = 0, $data = '',$receive = '',$exten = '')
    {
        $args['userid'] = $userid;
        $args['relatedId'] = $relatedId;
        $args['url'] = $url;
        $args['send'] = $data;
        $args['receive'] = $receive;
        $args['create_time'] = date("Y-m-d H:i:s");
        $args['exten'] = $exten;
        
        return $this->db->insertElement(array('table' => 'yeepay_log','query' => $args));
    }

    /**
     * 记录易宝通知日志-xiliheng-2018-09-28
     * 1、记录商户入网异步通知：regnotice
     * 2、记录商户下单同步通知：orderRedirect
     * 3、记录商户下单异步通知地址：orderNotify
     * @param $url
     * @param $noticeType
     * @param string $receive
     * @param string $exten
     * @return mixed
     */
    public function addYeeNoticeLog($url,$noticeType, $receive = '',$exten = '')
    {
        $args['url'] = $url;
        $args['noticeType'] = $noticeType;
        $args['receive'] = $receive;
        $args['create_time'] = date("Y-m-d H:i:s");
        $args['exten'] = $exten;

        return $this->db->insertElement(array('table' => 'yee_notice_log','query' => $args));
    }

    /**
     * @param $array
     * @return array
     * 获取对象属性并以数组形式返回
     */
    public  function object_array($array)
    {
        if(is_object($array)) {
            $array = (array)$array;
        } if(is_array($array)) {
            foreach($array as $key=>$value) {
                $array[$key] = $this->object_array($value);
            }
        }
        return $array;
    }

    /**
     * @param $headBankCode
     * @param $provinceCode
     * @param $cityCode
     * @return array
     * 获取支行信息
     * xiliheng - 20180925
     */
    public function getBankBranchInfo($headBankCode, $provinceCode, $cityCode)
    {
        $path = __DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）
        require_once ($path.'../../../yop-api/conf.php');//引入配置文件
        require_once ($path.'../../../yop-api/lib/YopClient3.php');
        require_once ($path.'../../../yop-api/lib/YopRequest.php');

        $request = new YopRequest($appkey, $private_key, "https://open.yeepay.com/yop-center",$yop_public_key);
        $request->addParam("headBankCode", $headBankCode);
        $request->addParam("provinceCode", $provinceCode);
        $request->addParam("cityCode", $cityCode);

        $response = YopClient3::post("/rest/v1.0/sys/merchant/bankbranchinfo", $request);

        //取得返回结果
        $data=$this->object_array($response);
        
        return $data;
    }

    /**
     * @param $fileURI
     * @return array
     * 文件上传
     */
    public function uploadFile($fileURI)
    {
        $path = __DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）
        require_once ($path.'../../../yop-api/conf.php');//引入配置文件
        require_once ($path.'../../../yop-api/lib/YopClient3.php');
        require_once ($path.'../../../yop-api/lib/YopRequest.php');
        
        $request = new YopRequest($appkey, $private_key, "https://open.yeepay.com/yop-center",$yop_public_key);

        $request->addParam("fileType", "IMAGE");
        $request->addParam("_file", $fileURI);

        $response = YopClient3::upload("/rest/v1.0/file/upload", $request);
        // print_r($response);
        //取得返回结果
        $data=$this->object_array($response);
        $this->addYeeNoticeLog("/rest/v1.0/sys/merchant/enterprisereginfoadd", 'fileUpload',json_encode($data), json_encode($request));

        return $data;
    }

    /**
     * @param $args
     * @return mixed
     * 导入商户二级分类编码
     */
    public function addClassCode($args)
    {
        $data = array('merchant_class',$args);
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        return $this->db->lastInsertId();
    }

    /**
     * @param $args
     * @return mixed
     * 导入银行分类编码
     */
    public function addBankCode($args)
    {
        $data = array('bank_code',$args);
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        return $this->db->lastInsertId();
    }

    /**
     * @param string $bankCode
     * @return mixed 获取银行总行信息 - xiliheng - 20180925
     * 获取银行总行信息 - xiliheng - 20180925
     */
    public function getHeadBankCode($bankCode = '')
    {
        $data = array(false,'bank_code');
        $sql = $this->pdosql->makeSelect($data);
        $result = $this->db->fetchAll($sql);

        foreach ($result as &$value)
        {
            $value['isSet'] = $bankCode == $value['bankCode'] ? 1 : 9;
        }
        
        return $result;
    }

    /**
     * 获取商户分类编码
     * @param $parentId
     * @param int $type
     */
    public function getMerchantCode($parentId, $type = 0)
    {
        $whereArr = [];
        $whereArr[] = ['AND', "classType = {$type}"];
        if ($type == 1 && $parentId > 0)
        {
            $whereArr[] = ['AND', "parentcode = '{$parentId}'"];
        }

        $data = array(false,'merchant_class',$whereArr);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql);
    }
}