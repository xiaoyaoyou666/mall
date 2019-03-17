<?php
/*
 * Created on 2016-5-19
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class action extends app
{
	public $merchantRegStatus = [
		'INIT' => 1,//待审核
		'PROCESSING' => 2,//审核中
		'PROCESS_SUCCESS' => 3,//审核通过
		'PROCESS_REJECT' => 4,//审核拒绝
		'PROCESS_BACK' => 5,//审核回退
		'PROCESSING_PRODUCT_INFO_SUCCESS' => 6,//审核中但是提前开通
	];
	public function display()
	{
		$action = $this->ev->url(3);
		$this->meruser = $this->G->make('meruser', 'user');
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

	private function index()
	{
		$page = $this->ev->get('page');
		$search = $this->ev->get('search');
		$u = '';
		if($search)
		{
			$this->tpl->assign('search',$search);
			foreach($search as $key => $arg)
			{
				$u .= "&search[{$key}]={$arg}";
			}
		}
		if($this->ev->get('modifyuserinfo'))
		{
			$args = $this->ev->get('args');
			$userid = $this->_user['sessionuserid'];
			$group = $this->user->getGroupById($this->_user['sessiongroupid']);
			$args = $this->module->tidyNeedFieldsPars($args,$group['groupmoduleid'],array('iscurrentuser'=> 1));
			$id = $this->user->modifyUserInfo($args,$userid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?user-center-privatement"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('modifyuserpassword'))
		{
			$args = $this->ev->get('args');
			$oldpassword = $this->ev->get('oldpassword');
			$userid = $this->_user['sessionuserid'];
			$user = $this->user->getUserById($userid);
			if(md5($oldpassword) != $user['userpassword'])
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败，原密码验证失败"
				);
				exit(json_encode($message));
			}
			if($args['password'] == $args['password2'] && $userid)
			{
				$id = $this->user->modifyUserPassword($args,$userid);
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => 'forward',
				    "forwardUrl" => "index.php?user-company-privatement&a=2"
				);
				exit(json_encode($message));
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败"
				);
				exit(json_encode($message));
			}
		}
		else
		{
			$userid = $this->_user['sessionuserid'];
			$user = $this->user->getUserById($userid);
			$group = $this->user->getGroupById($user['usergroupid']);
			$fields = $this->module->getMoudleFields($group['groupmoduleid'],array('iscurrentuser'=> $userid == $this->_user['sessionuserid'],'group' => null));
			$forms = $this->html->buildHtml($fields,$user);
			$actors = $this->user->getGroupsByModuleid($group['groupmoduleid']);
			$this->tpl->assign('moduleid',$group['groupmoduleid']);
			$this->tpl->assign('fields',$fields);
			$this->tpl->assign('forms',$forms);
			$this->tpl->assign('actors',$actors);
			$this->tpl->assign('user',$user);
			$this->tpl->assign('page',$page);
			$this->tpl->display('modifyuser');
		}
	}

	private function test(){
		$this->tpl->display('test');
	}
	private function test2(){
		$this->tpl->display('test2');
	}

	/**
	 * 钱包管理
	 * 当用户的审核被退的时候需要进行修改，这时候modify = true
	 */
	private function test3()
	{
		$modify = $this->ev->get('modify');
		$register = $this->ev->get('register');
		$userid = $this->_user['sessionuserid'];
		$meruserInfo = $this->meruser->getDataById(intval($userid));
		
		if (empty($meruserInfo) && !$register)
		{
			//用户没有注册并且没有点击开通
			$this->tpl->assign('status', '');
			$showView = 'pay_status';
			//$this->tpl->display('pay_status');
		}
		elseif ((empty($meruserInfo) && ($register == 'yes')) || (!empty($meruserInfo) && (in_array($meruserInfo['status'], ['PROCESS_REJECT', 'PROCESS_BACK']) && ($modify == 'yes'))))
		{
			//1、如果为空但是点击了注册；2、不为空但是用户没有通过审核，并且点击了修改
			//商户一级分类编码
			$merTopCode = $this->meruser->getMerchantCode();
			foreach ($merTopCode as &$record)
			{
				$record['isSet'] = $record['classCode'] == $meruserInfo['merLevel1No'] ? 1 : 9;
			}
			//获取银行总行信息
			$headBankCode = $this->meruser->getHeadBankCode($meruserInfo['headBankCode']);

			//默认获取省级列表-开户银行使用
			$bankProvince = $this->collect->getProvinceList(intval($meruserInfo['bankProvince']));

			$this->tpl->assign('bankProvince', $bankProvince);
			$this->tpl->assign('merTopCode', $merTopCode);
			$this->tpl->assign('headBankCode', $headBankCode);

			$this->tpl->assign('meruser', $meruserInfo);
			//$this->tpl->display('wallet_login');
			$showView = 'wallet_login';
		}
		else
		{
			//说明已经提交注册了，这时候要根据状态显示不同的页面
			$this->tpl->assign('status', $this->merchantRegStatus[$meruserInfo['status']]);
			//$this->tpl->display('pay_status');
			$showView = 'pay_status';
		}

		$this->tpl->display($showView);
	}
	private function test4(){
		$this->tpl->display('pay_status');
	}

	/**
	 * 返回商户编码-xiliheng-2018-09-26
	 * 主要获取二级编码
	 */
	public function getMerchantCode()
	{
		echo '<option value="">请选择所属银行</option>';
		$parentCode =  $this->ev->get('parentCode');
		//$classType =  $this->ev->get('classType');
		$currentCode = $this->ev->get('currentCode');
		$classType = 1;
		
		$codeList = $this->meruser->getMerchantCode($parentCode, $classType);

		foreach ($codeList as $key => $value)
		{
			if ($currentCode == $value['classCode'])
			{
				echo '<option value="'.$value['classCode'].'"selected>'.$value['title'].'</option>';
			}
			else
			{
				echo '<option value="'.$value['classCode'].'">'.$value['title'].'</option>';
			}
		}
	}

	/**
	 * 获取支行信息
	 * 20180925 - xiliheng
	 */
	public function bandBranchInfo()
	{
		echo '<option value="">请选择支行信息</option>';
		$headBankCode =   $_REQUEST['headBankCode'];
		$provinceCode = $_REQUEST['bankProvince'];
		$cityCode = $_REQUEST['bankCity'];
		$currentCode = $_REQUEST['currentCode'];

		$res = $this->meruser->getBankBranchInfo($headBankCode, $provinceCode, $cityCode);

		if ($res['state'] == 'SUCCESS')
		{
			$bankList = $res['result']['branchBankInfo'];
		}
		else
		{
			$bankList = [];
		}

		foreach ($bankList as $key => $value)
		{
			if ($currentCode == $key)
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
	 * 商户入网、修改接口
	 *
	 */
	public function register()
	{
		$userId = $this->_user['sessionuserid'];
		$requestNo = $this->ev->get('requestNo');
		$meruserInfo = $this->meruser->getDataById($userId);
		$otherMessage = [];
		//$this->meruser->addApiLog("/rest/v1.0/sys/merchant/enterprisereginfoadd", 123, 87, json_encode($_REQUEST), '');
		//拼接fileInfo
		$fileInfo = [];
		$fileInfoArr = [
			'IDCARD_FRONT' => $_REQUEST['IDCARD_FRONT'],
			'IDCARD_BACK' => $_REQUEST['IDCARD_BACK'],
			'CORP_CODE' => $_REQUEST['CORP_CODE'],
			'TAX_CODE' => $_REQUEST['TAX_CODE'],
			'ORG_CODE' => $_REQUEST['ORG_CODE'],
			'UNI_CREDIT_CODET' => $_REQUEST['UNI_CREDIT_CODET'],
			'OP_BANK_CODE' => $_REQUEST['OP_BANK_CODE'],
			'SETTLE_BANKCARD' => $_REQUEST['SETTLE_BANKCARD'],
			'HAND_IDCARD' => $_REQUEST['HAND_IDCARD'],
			'HAND_BANKCARD' => $_REQUEST['HAND_BANKCARD']
		];

		foreach ($fileInfoArr as $key => $kvalue)
		{
			if (empty($kvalue))
			{
				continue;
			}
			else
			{
				$info['quaType'] = $key;
				$info['quaUrl'] = $kvalue;
				$fileInfo[] = $info;
			}
		}

		$registerArr = [
			'userId' => $userId,
			'merFullName' => $_REQUEST['merFullName'],
			'merShortName' => $_REQUEST['merShortName'],
			'merCertType' => 'CORP_CODE',
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
			'fileInfo' => json_encode($fileInfo),
		];

		//$productInfo = "\"{\"payProductMap\":{\"B2B_PAY\":{\"dsPayBankMap\":{\"NET_BANK\":{\"rateType\":\"ONEPAY\",\"rate\":\"10\"}}}},\"payScenarioMap\":{\"WEB_ACCESS\":{\"webUrl\":\"http://114.242.115.109:8014\",\"icp\":\"18083013\"}}}\"";
		$businessFunction = "{\"SUBACCOUNT_IS_OPENED\":[\"YES\"],\"OP_SETTLE_TYPE\":[\"SETTLE_D1\"],\"SUBACCOUNT_TYPE\":[\"SUBACCOUNT_ORDER\"],\"FEE_TYPE\":[\"REALTIME\"],\"ACCESS_TYPE\":[\"ACCESS_NORMAL\"],\"TAG_WECHAT_USER_SCAN\":[\"REPORT\"],\"TAG_WECHAT_MERCHANT_SCAN\":[\"REPORT\"],\"WECHAT_H5_PRIORITY\":[\"WECHAT_H5\"],\"TAG_ALIPAY_MERCHANT_SCAN\":[\"REPORT\"],\"TAG_ALIPAY_USER_SCAN\":[\"REPORT\"]}";

		//$registerArr['productInfo'] = $productInfo;
		$registerArr['businessFunction'] = $businessFunction;

		if ($registerArr['isOrgCodeLong'])
		{
			$registerArr['orgCodeExpiry'] = '0000-00-00 00:00:00';
		}
		
		//开启事务
		$this->db->beginTransaction();
		try
		{
			if (!$meruserInfo)
			{
				//注册操作
				//生成requestNo
				$registerArr['requestNo'] = $this->meruser->makeRequestNo($userId);//上线之前要放开
				$registerArr['createTime'] = date("Y-m-d H:i:s");
				$registerArr['updateTime'] = date("Y-m-d H:i:s");
				$res = $this->meruser->insertRecord($registerArr);
				if ($res)
				{
					$meg = $this->meruser->registerYee($registerArr);
					$this->meruser->addYeeNoticeLog('/rest/v1.0/sys/merchant/enterprisereginfoadd', 'merchantadd', json_encode($meg), json_encode($registerArr));
					//调用接口
					if ($meg['state'] != 'SUCCESS')
					{
						throw new Exception('注册请求失败，请重试或者联系客服！');
					}
					else
					{
						if ($meg['result']['returnCode'] == 'REG00000')
						{
							$statusCode = 200;
							$returnMessage = "操作成功，信息审核中！";
							$otherMessage['callbackType'] = 'forward';
							$otherMessage['forwardUrl'] = 'index.php?user-company-privatement-test3';
						}
						else
						{
							throw new Exception($meg['result']['returnMsg']);
						}
					}
				}
				else
				{
					throw new Exception('注册请求失败，请重试或者联系客服！');
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
						$modifyMeg = $this->meruser->registerYee($registerArr);
						if ($modifyMeg['state'] != 'SUCCESS')
						{
							throw new Exception('修改信息失败，请重试或者联系客服！');
						}
						else
						{
							if ($modifyMeg['result']['returnCode'] == 'REG00000')
							{
								$statusCode = 200;
								$returnMessage = "更新成功成功，信息审核中！";
								$otherMessage['callbackType'] = 'forward';
								$otherMessage['forwardUrl'] = 'index.php?user-company-privatement-test3';
							}
							else
							{
								throw new Exception($modifyMeg['result']['returnMsg']);
							}
						}
					}
					else
					{
						throw new Exception('请确认更新内容！');
					}
				}
				else
				{
					$statusCode = 200;
					$returnMessage = "审核通过无需操作";
				}
			}

			$this->db->commit();
		}
		catch (Exception $e)
		{
			$ext = $e->getMessage();
			$this->db->rollback();
			$statusCode = 300;
			$returnMessage = $ext;
		}
		
		$message = [
			'statusCode' => $statusCode,
			"message" => $returnMessage,
		];
		
		if (!empty($otherMessage))
		{
			$message = array_merge($message, $otherMessage);
		}
		$this->meruser->addYeeNoticeLog('/rest/v1.0/sys/merchant/enterprisereginfoadd', 'bankbranchInfo', json_encode($message), '返回结果');

		exit(json_encode($message));
	}

	/**
	 * 资质文件上传接口
	 * update:20181128
	 * 接收文件并且上传文件到易宝服务器
	 */
	public function uploadFile()
	{
		$args = array();
		$path = 'files/attach/images/content/'.date('Ymd').'/';
		$upfile = $this->ev->getFile('qqfile');

		$args['attext'] = $this->files->getFileExtName($upfile['name']);
		if(!in_array(strtolower($args['attext']),$this->allowexts))
			exit(json_encode(array('status' => 'fail')));
		if($upfile)
			$fileurl = $this->files->uploadFile($upfile,$path,NULL,NULL,$this->allowexts);
		
		if ($fileurl)
		{
			$args['attpath'] = $fileurl;
			$args['atttitle'] = $upfile['name'];

			$args['attsize'] = $upfile['size'];
			$args['attuserid'] = $this->_user['sessionuserid'];
			$args['attcntype'] = $upfile['type'];
			$this->attach->addAttach($args);
			if($this->ev->get('imgwidth') || $this->ev->get('imgheight'))
			{
				if($this->files->thumb($fileurl,$fileurl.'.png',$this->ev->get('imgwidth'),$this->ev->get('imgheight')))
					$thumb = $fileurl.'.png';
				else
					$thumb = $fileurl;
			}
			else
				$thumb = $fileurl;
			
			//上传文件到易宝服务器
			$res = $this->meruser->uploadFile($thumb);
			if (!empty($res))
			{
				exit(json_encode(array('success' => true,'thumb' => $res['result']['files'][0]['fileLocation'],'title' => $upfile['name'])));
			}
			else
			{
				exit(json_encode(array('success' => true,'thumb' => $thumb,'title' => $upfile['name'])));
			}
		}
		else
		{
			exit(json_encode(array('status' => 'fail')));
		}
	}

    /**
     * 用户修改绑定手机
     */
    private function changeMobile()
    {
        $company_mobile = $this->ev->get('company_mobile');
        $verCode = $this->ev->get('verCode');
        $user = $this->user->getUserByMobile($company_mobile);
        if($user)
        {
            $message = array(
                'statusCode' => 300,
                "message" => "该手机号已经存在"
            );
            exit(json_encode($message));
        }
        $checker = $this->user->checkCode($verCode,$company_mobile);
        if(!$checker)
        {
            $message = array(
                'statusCode' => 300,
                "message" => "验证码错误或已失效"
            );
            exit(json_encode($message));
        }
        //修改注册手机
        $param = array();
        $param['company_mobile'] = $company_mobile;
        $changRet = $this->user->modifyUserInfo($param,$this->_user['sessionuserid']);
        if($changRet)
        {
            $message = array(
                'statusCode' => 200,
                "message" => "手机号变更成功"
            );
        }
        else{
            $message = array(
                'statusCode' => 300,
                "message" => "手机号变更失败"
            );
        }
        exit(json_encode($message));

    }


}


?>
