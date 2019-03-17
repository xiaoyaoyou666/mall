<?php
/**
 * Created by PhpStorm.
 * User: 50165
 * Date: 2018-9-19
 * Time: 17:07
 * 易宝商户操作
 */
class action extends app
{
    /**
     * 构造函数
     */
    public function display()
    {
        $this->category = $this->G->make('category');
        $this->category->app = 'item';
        $this->content = $this->G->make('content','company');
        $this->purchase = $this->G->make('content','purchase');
        $this->ppe = $this->G->make('price','purchase');
        $this->user = $this->G->make('user', 'user');
        $this->meruser = $this->G->make('meruser', 'user');
        $this->item = $this->G->make('item','item');
        $action = $this->ev->url(3);
        $this->collect = $this->G->make('collect','user');
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

    /**
     * 注册页面-2018-09-19
     * 1、参数：用户userid
     * 2、逻辑：首先、如果用户第一次注册，那么没有任何数据。如果用户没有通过审核，或者修改数据，获取用户审核信息并且返回
     * 3、注册成功后跳转到指定页面-待定，需确认
     */
    public function index()
    {
        //获取用户id（也可以从session中获取）
        $userid =  $this->ev->get('userid');
        $meruserInfo = $this->meruser->getDataById(intval($userid));
        
        //供货商省市区
        $merProvince = $this->collect->getProvinceList($meruserInfo['merProvince']);

        $merCity = $this->collect->getCityByFather($meruserInfo['merProvince'], $meruserInfo['merCity']);
        $merDistrict = $this->collect->getAreaByCity($meruserInfo['merCity'], $meruserInfo['merDistrict']);

        //默认获取省级列表-开户银行使用
        $bankProvince = $this->collect->getProvinceList($meruserInfo['bankProvince']);
        $bankCity = $this->collect->getCityByFather($meruserInfo['bankProvince'], $meruserInfo['bankCity']);

        $this->tpl->assign('merProvince', $merProvince);
        $this->tpl->assign('merCity', $merCity);
        $this->tpl->assign('merDistrict', $merDistrict);
        $this->tpl->assign('bankProvince', $bankProvince);
        $this->tpl->assign('bankCity', $bankCity);
        
        $this->tpl->assign('meruser', $meruserInfo);
        $this->tpl->display('merregister');
    }

    /**
     * 商户入网、修改接口
     *
     */
    public function register()
    {
        $userId = $this->ev->get('userId');
        $requestNo = $this->ev->get('requestNo');
        $meruserInfo = $this->meruser->getDataById($userId);

        $otherMessage = [];
        $registerArr = [
            'merFullName' => $_REQUEST['merFullName'],
            'merShortName' => $_REQUEST['merShortName'],
            'merCertType' => $_REQUEST['merCertType'],
            'merCertNo' => $_REQUEST['merCertNo'],
            'legalName' => $_REQUEST['legalName'],
            'legalIdCard' => $_REQUEST['legalIdCard'],
            'merLevel1No' => $_REQUEST['merLevel1No'],
            'merLevel2No' => $_REQUEST['merLevel2No'],
            'merProvince' => $_REQUEST['merProvince'],
            'merCity' => $_REQUEST['merCity'],
            'merDistrict' => $_REQUEST['merDistrict'],
            'merAddress' => $_REQUEST['merAddress'],
            'merContactName' => $_REQUEST['merContactName'],
            'merContactPhone' => $_REQUEST['merContactPhone'],
            'merContactEmail' => $_REQUEST['merContactEmail'],
            'taxRegistCert' => $_REQUEST['taxRegistCert'],
            'accountLicense' => $_REQUEST['accountLicense'],
            'orgCode' => $_REQUEST['orgCode'],
            'isOrgCodeLong' => $_REQUEST['isOrgCodeLong'] == 1 ? true : false,
            'orgCodeExpiry' => $_REQUEST['orgCodeExpiry'],
            'cardNo' => $_REQUEST['cardNo'],
            'headBankCode' => $_REQUEST['headBankCode'],
            'bankCode' => $_REQUEST['bankCode'],
            'bankProvince' => $_REQUEST['bankProvince'],
            'bankCity' => $_REQUEST['bankCity'],
            'fileInfo' => $_REQUEST['fileInfo'],
            'businessFunction' => $_REQUEST['businessFunction'],
        ];
        $productInfo = "\"{\"payProductMap\":{\"B2B_PAY\":{\"dsPayBankMap\":{\"NET_BANK\":{\"rateType\":\"ONEPAY\",\"rate\":\"10\"}}}},\"payScenarioMap\":{\"WEB_ACCESS\":{\"webUrl\":\"http://114.242.115.109:8014\",\"icp\":\"18083013\"}}}\"";
        $businessFunction = "{\"SUBACCOUNT_IS_OPENED\":[\"YES\"],\"OP_SETTLE_TYPE\":[\"SETTLE_D1\"],\"SUBACCOUNT_TYPE\":[\"SUBACCOUNT_ORDER\"],\"FEE_TYPE\":[\"REALTIME\"],\"ACCESS_TYPE\":[\"ACCESS_NORMAL\"],\"TAG_WECHAT_USER_SCAN\":[\"REPORT\"],\"TAG_WECHAT_MERCHANT_SCAN\":[\"REPORT\"],\"WECHAT_H5_PRIORITY\":[\"WECHAT_H5\"],\"TAG_ALIPAY_MERCHANT_SCAN\":[\"REPORT\"],\"TAG_ALIPAY_USER_SCAN\":[\"REPORT\"]}";

        if (!$meruserInfo)
        {
            $registerArr['businessFunction'] = json_encode($businessFunction);
            //注册操作
            //生成requestNo
            //$registerArr['requestNo'] = 'DS180921_06303437';
            $registerArr['requestNo'] = $this->meruser->makeRequestNo($userId);
            $registerArr['createTime'] = date("Y-m-d H:i:s");
            $registerArr['updateTime'] = date("Y-m-d H:i:s");
            $res = $this->meruser->insertRecord($registerArr);
            if ($res)
            {
                $meg = $this->meruser->registerYee($registerArr);

                //调用接口

                if ($meg['state'] != 'SUCCESS')
                {

                    $statusCode = 300;
                    $returnMessage = "操作失败请重试！";
                    $otherMessage['returnMes'] = $meg;
                }
                else
                {
                    $statusCode = 200;
                    $returnMessage = "操作成功，信息审核中！";
                    $otherMessage['callbackType'] = 'forward';
                    $otherMessage['forwardUrl'] = '地址待定';
                }
            }
            else
            {
                $statusCode = 300;
                $returnMessage = "操作失败请重试！";
            }
        }
        else if ($meruserInfo)
        {
            if ($meruserInfo['status'] != 'PROCESS_SUCCESS')
            {
                //记录已经存在但是没有通过审核，可以进行修改操作，但是一下字段不能修改
                $checkField = ["requestNo","parentMerchantNo","merFullName","merCertType","merCertNo","legalName","legalIdCard"];
                $registerArr['updateTime'] = date("Y-m-d H:i:s");
                $errorField = [];
                foreach ($checkField as $field)
                {
                    if ($registerArr[$field] != $meruserInfo[$field])
                    {
                        $errorField[] = $field;
                    }
                }
                if (empty($errorField))
                {
                    $this->meruser->updateMerUserByRequestNo($registerArr, $requestNo);
                    //调用接口
                    $statusCode = 200;
                    $returnMessage = "操作成功，信息审核中！";
                    $otherMessage['callbackType'] = 'forward';
                    $otherMessage['forwardUrl'] = '地址待定';
                }
                else
                {
                    $statusCode = 300;
                    $returnMessage = "操作失败请重试！";
                    $otherMessage['errorField'] = $errorField;
                }
            }
            else
            {
                $statusCode = 200;
                $returnMessage = "审核通过无需操作";
            }
        }

        $message = [
            'statusCode' => $statusCode,
            "message" => $returnMessage,
        ];
        if (!empty($otherMessage))
        {
            $message = array_merge($message, $otherMessage);
        }

        exit(json_encode($message));
    }


    /**
     * 获取支行信息
     * 20180925 - xiliheng
     */
    public function bandBranchInfo()
    {
        echo '<option value="">请选择支行信息</option>';
        $headBankCode =   $_REQUEST['headBankCode'];
        $provinceCode = $_REQUEST['provinceCode'];
        $cityCode = $_REQUEST['cityCode'];
        $bankCode = $_REQUEST['bankCode'];

        $res = $this->meruser->getBankBranchInfo($headBankCode, $provinceCode, $cityCode);

        if ($res['state'] == 'SUCCESS')
        {
            $bancList = $res['result']['branchBankInfo'];
        }
        else
        {
            $bancList = [];
        }

        foreach ($bancList as $key => $value)
        {
            if ($bankCode == $key)
            {
                echo '<option value="'.$key.'"selected>'.$value.'</option>';
            }
            else
            {
                echo '<option value="'.$key.'">'.$value.'</option>';
            }
        }
    }

    /**
     * 资质文件上传接口
     */
    public function uploadFile()
    {
        $path = __DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）
        require_once ($path.'../../../yop-m/conf.php');//引入配置文件
        require_once ($path.'../../../yop-m/lib/YopClient3.php');

        $fileURI = $_REQUEST['fileURI'];
        $res = $this->meruser->uploadFile($fileURI);
        
        if ($res['result'] == NULL)
        {
            $message = [
                'statusCode' => 300,
                "message" => "文件上传失败",
                'error' => $res['error'],
            ];
            exit(json_encode($message));
        }
        else
        {
            $message = [
                'statusCode' => 200,
                "message" => "文件上传成功",
                'fileInfo' => $res['result'],
            ];

            exit(json_encode($message));
        }
    }

    /**
     * 利用phpexcel导入商户二级分类编码 - xiliheng 2018-09-25
     * 一级分类暂时手动导入
     * @throws PHPExcel_Exception
     * @throws PHPExcel_Reader_Exception
     * 单一功能操作，以后可以封装
     */
    public function addMerchantClassCode()
    {
        $inputFileName = './classCode.xlsx';
        $path = __DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）
        require_once ($path.'../../../PHPExcel/Classes/PHPExcel/IOFactory.php');//引入配置文件

        $reader = PHPExcel_IOFactory::createReader('Excel2007');
        $PHPExcel = $reader->load($inputFileName);
        $sheet = $PHPExcel->getSheet(0); // 读取第一個工作表
        $highestRow = $sheet->getHighestRow(); // 取得总行数
        $highestColumm = $sheet->getHighestColumn(); // 取得总列数
        $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumm);

        $data = [];
        for($row = 1; $row <= $highestRow; $row++)
        {
            for ($col = 0; $col <= ($highestColumnIndex - 1); $col++)
            {
                $data[$row][] = $sheet->getCellByColumnAndRow($col, $row)->getValue();
            }
        }
        $data = array_values($data);


        foreach ($data as $value)
        {
            $codeArr['classCode'] = $value[1];
            $codeArr['classType'] = 1;
            $codeArr['title'] = $value[2];
            $codeArr['parentcode'] = $codeArr[0];
            $this->meruser->addClassCode($codeArr);
        }
    }

    /**
     * @throws PHPExcel_Exception
     * @throws PHPExcel_Reader_Exception
     * phpexcel导入银行编码-xiliheng 2018-09-25
     * 单一功能操作，以后可以封装
     */
    public function addBankCode()
    {
        $inputFileName = './bankcode.xlsx';
        $path = __DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）
        require_once ($path.'../../../PHPExcel/Classes/PHPExcel/IOFactory.php');//引入配置文件

        $reader = PHPExcel_IOFactory::createReader('Excel2007');
        $PHPExcel = $reader->load($inputFileName);
        $sheet = $PHPExcel->getSheet(0); // 读取第一個工作表
        $highestRow = $sheet->getHighestRow(); // 取得总行数
        $highestColumm = $sheet->getHighestColumn(); // 取得总列数
        $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumm);

        $data = [];
        for($row = 1; $row <= $highestRow; $row++)
        {
            for ($col = 0; $col <= ($highestColumnIndex - 1); $col++)
            {
                $data[$row][] = $sheet->getCellByColumnAndRow($col, $row)->getValue();
            }
        }
        $data = array_values($data);

        foreach ($data as $value)
        {
            $codeArr['bankCode'] = $value[1];
            $codeArr['title'] = $value[0];
            $this->meruser->addBankCode($codeArr);
        }
    }

    /**
     * 获取银行总行编码列表- xiliheng - 2018-09-25
     */
    public function getBankCode()
    {
        echo '<option value="">请选择所属银行</option>';
        $bankCode = $_REQUEST['headBankCode'];

        $res = $this->meruser->getHeadBankCode();

        foreach ($res as $key => $value)
        {
            if ($bankCode == $value['bankCode'])
            {
                echo '<option value="'.$value['bankCode'].'"selected>'.$value['title'].'</option>';
            }
            else
            {
                echo '<option value="'.$value['bankCode'].'">'.$value['title'].'</option>';
            }
        }
    }

    /**
     * 准备批量获取支行信息然后写入sql，但是提示密钥不可用
     * 暂时不可用
     */
    public function addBrancBank()
    {
        $res = $this->meruser->getHeadBankCode();
        $provinceArr = $this->collect->getProvinceList();
        //获取相应市级信息

        foreach ($res as $key => $value)
        {
            //遍历所有的省
            foreach ($provinceArr as $pkey => $pvalue)
            {
                //获取这个省下面的所有市区
                $cityArr = $this->collect->getCityByFather($pvalue['provinceid']);

                foreach ($cityArr as $ckey => $cvalue)
                {
                    $data = $this->meruser->getBankBranchInfo($value['bankCode'], $pvalue['provinceid'], $cvalue['cityid']);
                }
            }
        }
    }
}