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
		$action = $this->ev->url(3);
        $this->link = $this->G->make('link','content');
        $this->category = $this->G->make('category');
        $this->category->app = 'item';
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->tpl->assign('links',$links);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function index2()
	{
		$appid = 'user';
		$app = $this->G->make('apps','core')->getApp($appid);
		$this->tpl->assign('app',$app);
		$fields = array();
		$tpfields = explode(',',$app['appsetting']['regfields']);
		foreach($tpfields as $f)
		{
			$tf = $this->module->getFieldByNameAndModuleid($f);
			if($tf && $tf['fieldappid'] == 'user')
			{
				$fields[$tf['fieldid']] = $tf;
			}
		}
		if($this->ev->get('userregister'))
		{
			if($app['appsetting']['closeregist'])
			{
				$message = array(
					'statusCode' => 300,
					"message" => "管理员禁止了用户注册"
				);
				$this->G->R($message);
			}
			$fob = array('admin','管理员','站长');
			$args = $this->ev->get('args');
			$defaultgroup = $this->user->getDefaultGroup();
			if(!$defaultgroup['groupid'] || !trim($args['username']))
			{
				$message = array(
					'statusCode' => 300,
					"message" => "用户不能注册"
				);
				exit(json_encode($message));
			}
			$username = $args['username'];
			foreach($fob as $f)
			{
				if(strpos($username,$f) !== false)
				{
					$message = array(
						'statusCode' => 300,
						'errorinput' => 'args[username]',
						"message" => "用户已经存在"
					);
					exit(json_encode($message));
				}
			}
			$user = $this->user->getUserByUserName($username);
			if($user)
			{
				$message = array(
					'statusCode' => 300,
					'errorinput' => 'args[username]',
					"message" => "用户已经存在"
				);
				exit(json_encode($message));
			}
			$email = $args['useremail'];
			$user = $this->user->getUserByEmail($email);
			if($user)
			{
				$message = array(
					'statusCode' => 300,
					'errorinput' => 'args[username]',
					"message" => "邮箱已经被注册"
				);
				exit(json_encode($message));
			}
			$fargs = array('username' => $username,'usergroupid' => $defaultgroup['groupid'],'userpassword' => md5($args['userpassword']),'useremail' => $email);
			foreach($fields as $key => $p)
			{
				$fargs[$p['field']] = $args[$p['field']];
			}
			$id = $this->user->insertUser($fargs);
			$this->session->setSessionUser(array('sessionuserid'=>$id,'sessionpassword'=>md5($args['userpassword']),'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$defaultgroup['groupid'],'sessionlogintime'=>TIME,'sessionusername'=>$username));
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "target" => "",
			    "rel" => "",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?".$this->G->defaultApp
			);
			exit(json_encode($message));
		}
		else
		{
			$forms = $this->html->buildHtml($fields);
			$this->tpl->assign('forms',$forms);
			if($app['appsetting']['registype'])
			$this->tpl->display('register_auto');
			else
			$this->tpl->display('register');
		}
	}

    //注册首页
    private function index()
    {
        if ($this->ev->get('userregister'))
        {
            $step1Data = array();
            $step1Data['username'] = $this->ev->get('username');
            $step1Data['company_mobile'] = $this->ev->get('company_mobile');
            $step1Data['userpassword'] = $this->ev->get('pwd');
            $step1Data['verCode'] = $this->ev->get('verCode');
            //判断用户是否存在
            $username = $step1Data['username'];
            $user = $this->user->getUserByUserName($username);
            if($user)
            {
              $message = array(
                  'statusCode' => 300,
                  'errorinput' => 'args[username]',
                  "message" => "用户已经存在"
              );
              exit(json_encode($message));
            }
            $checker = $this->user->checkCode($step1Data['verCode'],$step1Data['company_mobile']);
//          $checker = true;
            if(!$checker)
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "验证码错误或已失效"
                );
                exit(json_encode($message));
            }
            $_SESSION['regData'] = $step1Data;
            $message = array(
                'statusCode' => 200,
                "message" => "加载中...",
                //"callbackType" => "forward",
                "forwardUrl" => "index.php?user-app-register-step2"
            );
            exit(json_encode($message));

        } else {
            $this->tpl->assign('sessionData',$_SESSION['regData']);
            $this->tpl->display('register');
        }
    }

    //注册用户第二步
    private function step2()
    {
        if ($this->ev->get('userregister'))
        {
            $step2Data = $this->ev->get('args');
            //企业证书
            $certificatesArr = [
                1=>'资质等级证书',
                2=>'安全生产许可证',
                3=>'信誉等级证书',
                4=>'业绩报表及相关证明文件',
                5=>'管理体系认证证书',
                6=>'型式试验报告',
                7=>'财务报表',
                8=>'其他文件',
            ];
            //验证非空字段
            if(!isset($step2Data['contact_info'])||!isset($step2Data['company_contacter'])||!isset($step2Data['company_phone'])){
                $message = array(
                    'statusCode' => 300,
                    "message" => "联系人信息不能为空"
                );
                exit(json_encode($message));
            }
            //验证非空字段
            if(empty($step2Data['company_licence_pic'])){
                $message = array(
                    'statusCode' => 300,
                    "message" => "三证合一/五证合一/营业执照不能为空"
                );
                exit(json_encode($message));
            }
            if(!preg_match("/^1[345678]{1}\d{9}$/",$step2Data['company_phone'])){
                $message = array(
                    'statusCode' => 300,
                    "message" => "第一联系人手机号格式错误"
                );
                exit(json_encode($message));
            }
            if(!$step2Data['user_category']){
                $message = array(
                    'statusCode' => 300,
                    "message" => "供货范围不能为空"
                );
                exit(json_encode($message));
            }
            //判断用户是否存在
            $user = $this->user->getUserByUserName($step2Data['username']);
            if(!$user)
            {
                $company_invoice_count = count($step2Data['company_invoice']);
                if($company_invoice_count ==1){
                    $step2Data['company_invoice'] = $step2Data['company_invoice'][0];
                }else{
                    $step2Data['company_invoice'] = 0;
                }
                $step2Data['company_category'] = implode(',',$step2Data['company_category']);
                $step2Data['usergroupid'] = 3;
                $step2Data['userpassword'] = md5($step2Data['userpassword']);
                $step2Data['company_istrue'] = 0;
                $step2Data['company_logo_da'] = $step2Data['company_logo'];
                $step2Data['company_tel'] = $step2Data['company_quhao'].'-'.$step2Data['company_tel'];
                $step2Data['users_type'] = 1;

                $id = $this->user->insertUser($step2Data);
                if($id)
                {
                    //添加供货范围 存供应商分类表数据
                    foreach ($step2Data['user_category'] as $k=>$val){
                        $user_category['user_id'] = $id;
                        $user_category['cate_id'] = $k;
                        $user_category['year_num']= empty($val)?0:$val;
                        $userCategoryId = $this->user->insertUserCategory($user_category);
                        if(!$userCategoryId){
                            $message = array(
                                'statusCode' => 300,
                                "message" => "添加供应商分类数据失败"
                            );
                            exit(json_encode($message));
                        }
                    }
                    //保存第二联系人信息到第二联系人表
                    if(!preg_match("/^1[345678]{1}\d{9}$/",$step2Data['contact_info']['user_phone'])){
                        $message = array(
                            'statusCode' => 300,
                            "message" => "第二联系人手机号格式错误"
                        );
                        exit(json_encode($message));
                    }
                    $user_contacts['user_id'] = $id;
                    $user_contacts['contacts_name'] =$step2Data['contact_info']['contacts_name'];
                    $user_contacts['user_mail'] =$step2Data['contact_info']['user_mail'];
                    $user_contacts['user_phone'] =$step2Data['contact_info']['user_phone'];
                    $user_contacts['user_tel'] =$step2Data['contact_info']['user_quhao'].'-'.$step2Data['contact_info']['user_tel'];

                    $userContactId = $this->user->insertUserContact($user_contacts);
                    if(!$userContactId){
                        $message = array(
                            'statusCode' => 300,
                            "message" => "添加第二联系人失败"
                        );
                        exit(json_encode($message));
                    }
                    //添加企业证书操作insertUserCertificate
                    $user_certificate = array();
                    foreach ($step2Data['user_certificates'] as $k=>$v){
                        if(is_array($v)){
                            foreach ($v as $url){
                                $user_certificate[]=[
                                    'user_id'=>$id,
                                    'certificate_name'=>$certificatesArr[$k],
                                    'certificate_url'=>$url,
                                    'certificate_type'=>$k,
                                    'create_time'=>time(),
                                ];
                            }
                        }else{
                            $user_certificate[]=[
                                'user_id'=>$id,
                                'certificate_name'=>$certificatesArr[$k],
                                'certificate_url'=>$v,
                                'certificate_type'=>$k,
                                'create_time'=>time(),

                            ];
                        }
                    }
                    foreach ($user_certificate as $val){
                        $userCertificateId = $this->user->insertUserCertificate($val);
                        if(!$userCertificateId){
                            $message = array(
                                'statusCode' => 300,
                                "message" => "添加供应商证书失败"
                            );
                            exit(json_encode($message));
                        }
                    }
                    //$this->session->setSessionUser(array('sessionuserid'=>$id,'sessionpassword'=>$step2Data['userpassword'],'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>3,'sessionlogintime'=>TIME,'sessionusername'=>$step2Data['username']));
                    $message = array(
                        'statusCode' => 200,
                        "message" => "加载中...",
                        "target" => "",
                        "rel" => "",
                        "callbackType" => 'forward',
                        "forwardUrl" => "index.php?user-app-register-finish"
                    );
                    exit(json_encode($message));
                }else{
                    $message = array(
                        'statusCode' => 300,
                        "message" => "注册失败"
                    );
                    exit(json_encode($message));
                }

            }

        } else {
            $step1Data = $_SESSION['regData'];
            //如果第一步存的数据为空，跳到第一步重新输入
            if(empty($step1Data))
            {
                header("location:index.php?".$this->G->defaultApp);
                exit;
            }
            //省市区代码
            $fields = $this->module->getMoudleFields(3,$this->user->getModuleUserInfo());
            $forms = $this->html->buildHtml($fields);
            $html = array();
            $html[0] = $forms[11];
            $html[1] = $forms[10];
            $html[2] = $forms[9];
            //分类顶级分类
            $parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
            $this->tpl->assign('html',$html);
            $this->tpl->assign('step1Data',$step1Data);
            $this->tpl->assign('parentcat',$parentcat);
            $this->tpl->display('register_step2');
        }
    }
    //获取分类的数据 ajax请求
    public function ajaxCategory(){
        $catid = $this->ev->get('catid');
        if($catid)
        {
            $result= $this->category->getCategoriesByArgs(array(array("AND","catparent = :catparent",':catparent',$catid)));
            foreach ($result as $val){
                $res[]=[
                    'catid' => $val['catid'],
                    'catname' => $val['catname']
                ];
            }
            exit(json_encode($res));
        }
        return false;
    }

    //注册完成页
    private function finish()
    {
        $this->tpl->display('register_finish');
    }

    //关于我们
    private function aboutus()
    {
        $this->tpl->display('about_us');
    }

    //联系方式
    private function contactus()
    {
        $this->tpl->display('contact_us');
    }

    //购物手册
	private   function   shop(){
        $type = $this->ev->get('type');
        
        $this->tpl->assign('type',$type);
        $this->tpl->display('shop');
	}
	//培训手册
	private   function   shop_head(){
        $this->tpl->display('shop_head');
	}

    //常见问题
    private   function   pro(){
        $this->tpl->display('pro');
    }

    //底部
    private   function  footer(){
        $this->tpl->display('footer');
    }
}


?>
