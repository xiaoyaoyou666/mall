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
        $this->category->app = 'item';
        $this->company = $this->G->make('content','company');
        $this->clarify = $this->G->make('clarify','user');
        $this->link = $this->G->make('link','content');
        $this->ppe = $this->G->make('price','purchase');
        $this->collect = $this->G->make('collect','user');
        $modules = $this->module->getModulesByApp('baisc');
        $this->tpl->assign('modules',$modules);
		$action = $this->ev->url(3);
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
        //获取当前登录用户角色
        $userid = $this->_user['sessionuserid'];
        $userinfo = $this->company->getCompanyById($userid);
        $this->tpl->assign('role',$userinfo['users_role']);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

    private function news()
    {
        $companyid = $this->ev->get('companyid');
        $search = $this->ev->get('search');
        $page = intval($this->ev->get('page'));
        $page = $page?$page:1;
        $args = array();
        $user_id = $this->_user['sessionuserid'];
        $userid = $companyid ? $companyid : $user_id;
        $user = $this->company->getCompanyById($userid); //当前企业信息
        //获取当前登录用户角色信息
        $userrole = $this->company->getCompanyById($user_id);
        $args[] = array("AND","company_id = :company_id",'company_id',$userid);
        if($search['keyword']){
            $args[] = array("AND","news_title LIKE :news_title",'news_title',"%{$search['keyword']}%");
        }
        if($search['stime']){
            $args[] = array("AND","create_time >= :create_time",'create_time',strtotime($search['stime']));
        }
        if($search['etime']){
            $args[] = array("AND","create_time <= :create_time",'create_time',strtotime($search['etime']));
        }
        $data = $this->company->getCompanyNewList($args,$page,10);
        //获取当前登录的用户信息
        $this->tpl->assign('page',$page);
        $this->tpl->assign('data',$data);
        $this->tpl->assign('role',intval($userrole['users_role']));
        $this->tpl->assign('user',$user);
        $this->tpl->assign('search',$search);
        $this->tpl->assign('companyid',$companyid);
    	$this->tpl->display('company_news');
    }

    //动态详情
    private function newsInfo()
    {
        $newsid = intval($this->ev->get('news_id'));
        $userid = $this->_user['sessionuserid'];
        $user = $this->company->getCompanyById($userid);
        $data = $this->company->getNewsById($newsid);

        $args = array();
        $args[] = array('AND',"company_id = :company_id",'company_id',$userid);
        $args[] = array('AND',"news_id < :news_id",'news_id',$newsid);

        $args1[] = array('AND',"company_id = :company_id",'company_id',$userid);
        $args1[] = array('AND',"news_id > :news_id",'news_id',$newsid);
        $data1 = $this->company->getCompanyNewList($args,$page,$number = 100,$order = 'news_id ASC');
        $data2 = $this->company->getCompanyNewList($args1,$page,$number = 100,$order = 'news_id DESC');
        
        #上一扁
        $uparr = $data1['data']['0'];
        #下一扁
        $downarr = $data2['data']['0'];
        
        $this->tpl->assign('data',$data);
        $this->tpl->assign('uparr',$uparr);
        $this->tpl->assign('downarr',$downarr);
        $this->tpl->assign('user',$user);
        $this->tpl->assign('role',intval($user['users_role']));
        $this->tpl->display('company_newsinfo');
    }

    //企业简介
	private function index()
	{
		$companyid = $this->ev->get('companyid');
        $userid = $this->_user['sessionuserid'];
        $companyid = $companyid ? $companyid : $userid;
		$data = $this->company->getCompanyById($companyid);
        //获取当前登录用户角色信息
        $userrole = $this->company->getCompanyById($userid);
        $this->tpl->assign('data',$data);
        $this->tpl->assign('role',intval($userrole['users_role']));
		$this->tpl->display('company_index');
	}
	//合作资料
    public function companyMaterials(){
        $companyid = $this->ev->get('companyid');
        $userid = $this->_user['sessionuserid'];
        $companyid = $companyid ? $companyid : $userid;
        $data = $this->company->getCompanyById($companyid);
        //获取当前登录用户角色信息
        $userrole = $this->company->getCompanyById($userid);
        //获取企业证书信息
        $certificateData = $this->company->getCertificateById($companyid);
        $certificateJpg = array();
        $certificatePdf = array();
        foreach ($certificateData as $val){
            if(in_array($val['certificate_type'],[1,2,3,5])){
                $certificateJpg[$val['certificate_type']][] = $val;
            }else{
                $certificatePdf[] = $val;
            }
        }
        $newArr = array();
        foreach ($certificateJpg[5] as $k=>$item){
            $urlArr[$item['id']]=$item['certificate_url'];
            $newArr[0] =[
                'user_id' => $item['user_id'],
                'certificate_name' => $item['certificate_name'],
                'certificate_url' =>$urlArr ,
                'create_time' => $item['create_time'],
                'certificate_type' => $item['certificate_type'],
            ];
        }
        $certificateJpg[5] =$newArr;
        foreach ($certificatePdf as $k=>$item){
            $certificatePdf[$k]['file_name']=trim(strrchr($item['certificate_url'], '/'),'/');
        }
        $certificateJpgcount = count($certificateJpg);
        $certificateJpg = array_values($certificateJpg);
        $this->tpl->assign('data',$data);
        $this->tpl->assign('role',intval($userrole['users_role']));
        $this->tpl->assign('certificateJpg',$certificateJpg);
        $this->tpl->assign('certificatePdf',$certificatePdf);
        $this->tpl->assign('certificateJpgcount',$certificateJpgcount);
        $this->tpl->display('company_materials');
    }

    //企业主营业务
    private function mainbiz()
    {
        $companyid = $this->ev->get('companyid');
        $userid = $this->_user['sessionuserid'];
        $companyid = $companyid ? $companyid : $userid;
        $user = $this->company->getCompanyById($companyid);
        //获取当前登录用户角色信息
        $userrole = $this->company->getCompanyById($userid);
        $this->tpl->assign('user',$user);
        $this->tpl->assign('role',intval($userrole['users_role']));
        $this->tpl->display('company_mainbiz');
    }
    //企业主营业务供货范围
    private function product()
    {
        $companyid = $this->ev->get('companyid');
        $userid = $this->_user['sessionuserid'];
        $companyId = $companyid ? $companyid : $userid;
        $data = $this->company->getCompanyById($companyid);
        //获取当前登录用户角色信息
        $userrole = $this->company->getCompanyById($userid);
        $userCategory = $this->company->getUserCategoryByUserId($companyid);
        foreach ($userCategory as $k=>$item){
            $currentCateName = $this->category->getCateInfo($item['cate_id']);//--当前分类信息---
            $catname = $currentCateName['catname'];
            if ($currentCateName['catparent']) {
                $parentCateName = $this->category->getCateInfo($currentCateName['catparent']);//--父类信息---
                $catparentName = $parentCateName['catname'];
            }
            if ($parentCateName['catparent']) {
                $grandpaName = $this->category->getCateInfo($parentCateName['catparent']);//--顶级父类---
                $catparentName = $grandpaName['catname'].' > '.$catparentName.' > ';
            }
            $userCategory[$k]['catname'] = $catname;
            $userCategory[$k]['catparentname'] = $catparentName;
        }
        $newUserCategory = array();
        foreach($userCategory as $k=>$v){
            $newUserCategory[$v['catparentname']][]  = $v;
        }
        $newUserCategory = array_values($newUserCategory);
        $catnameArr = array();
        foreach ($newUserCategory as $k=>$val){
            $strArr = [];
            foreach ($val as $v1){
                $strArr[] = $v1['catname'];
                $catnameArr[$k]=[
                    'catname' => implode(' | ',$strArr),
                    'catparentname' => $v1['catparentname'],
                ];
            }
        }
        //获取供应商发票类型
        $company_invoice_arr =[0=>'增值税专用发票、增值税普通发票',1=>'增值税专用发票',2=>'增值税普通发票'];
        $company_invoice = $company_invoice_arr[$data['company_invoice']];
        $this->tpl->assign('company_invoice',$company_invoice);
        $this->tpl->assign('data',$data);
        $this->tpl->assign('role',intval($userrole['users_role']));
        $this->tpl->assign('catnameArr',$catnameArr);
        $this->tpl->display('product');
    }

    //荣誉资质
    private function qualification()
    {
        $companyid = $this->ev->get('companyid');
        $userid = $this->_user['sessionuserid'];
        $companyid = $companyid ? $companyid : $userid;
        $user = $this->company->getCompanyById($companyid);
        //获取当前登录用户角色信息
        $userrole = $this->company->getCompanyById($userid);
        $honors = $this->company->getHonorsById(array(array('AND',"company_id = :company_id",'company_id',$companyid)));
        $this->tpl->assign('honors',$honors['data']);
        $this->tpl->assign('user',$user);
        $this->tpl->assign('role',intval($userrole['users_role']));
        $this->tpl->display('company_honour');
    }

    //成功案例
    private function project()
    {
        $page = intval($this->ev->get('page'));
        $page = $page ? $page : 1;
        $args = array();
        $userid = $this->_user['sessionuserid'];
        $companyId = $this->ev->get('companyid') ? $this->ev->get('companyid') : $userid;
        $companyId = $this->ev->get('companyid');
        $args[] = array("AND","company_id = :company_id",'company_id',$companyId);
        $data = $this->company->getCompanyCaseList($args,$page,10);
        $user = $this->company->getCompanyById($companyId);
        //获取当前登录用户角色信息
        $userrole = $this->company->getCompanyById($userid);
        $this->tpl->assign('user', $user);
        $this->tpl->assign('data', $data['data']);
        $this->tpl->assign('role',intval($userrole['users_role']));
        $this->tpl->display('company_case');
    }

    //案例详情
    private function caseInfo()
    {
        $id = intval($this->ev->get('case_id'));
        $userid = $this->_user['sessionuserid'];
        $companyId = $this->ev->get('companyid') ? $this->ev->get('companyid') : $userid;
        $user = $this->company->getCompanyById($companyId);
        //获取当前登录用户角色信息
        $userrole = $this->company->getCompanyById($userid);

        //下一遍的id
        $args = array();
        $args[] = array("AND","company_id = :company_id",'company_id',$userid);
        $args[] = array("AND","case_id > :case_id",'case_id',$id);
        $data1 = $this->company->getCompanyCaseList($args,$page,$number = 2000,$order = 'case_id DESC');
        $downarr = $data1['data']['0'];
        

        //上一遍的id
        $args1 = array();
        $args1[] = array("AND","company_id = :company_id",'company_id',$userid);
        $args1[] = array("AND","case_id < :case_id",'case_id',$id);
        $data2 = $this->company->getCompanyCaseList($args1,$page,$number = 2000,$order = 'case_id ASC');
        $uparr = $data1['data']['0'];


        $data = $this->company->getCaseById($id);
        $data['case_url'] = unserialize($data['case_url']);
        $this->tpl->assign('user', $user);
        $this->tpl->assign('data', $data);
        $this->tpl->assign('role',intval($userrole['users_role']));
        $this->tpl->assign('downarr', $downarr);
        $this->tpl->assign('uparr', $uparr);
        $this->tpl->display('company_caseinfo');
    }

    //联系方式
    private function contact()
    {
        $companyid = $this->ev->get('companyid');
        $userid = $this->_user['sessionuserid'];
        $companyid = $companyid ? $companyid : $userid;
        $user = $this->company->getCompanyById($companyid);
        //获取当前登录用户角色信息
        $userrole = $this->company->getCompanyById($userid);
        $userContacts = $this->company->getUserContactsById($companyid);
        $cityInfo=$this->collect->getCityInfo($user['company_province'],$user['company_city'],$user['company_area']);
        $user['cityInfo'] = $cityInfo=='未填写'?'':$cityInfo;
        $this->tpl->assign('userContacts',$userContacts);
        $this->tpl->assign('role',intval($userrole['users_role']));
        $this->tpl->assign('user',$user);
        $this->tpl->display('company_contact');
    }

    //编辑主页简介
    public function indexedit(){

        if($this->ev->get('submit'))
        {
            $args = $this->ev->get('args');
            $this->clarify->updateCompanyxun($args['userid'],$args['company_name']);
            #修改报价表中的企业名称
            $this->ppe->updatePurchaseCompanyname($args['userid'],$args['company_name']);
            $qiye = $this->company->modifyCompanyIntro($args);

            if($qiye){
                $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?company-app-company-index&companyid=".$args['userid']
            );
            exit(json_encode($message));

            }
        }
        else
        {
            $companyid = $this->ev->get('companyid');
            $userid = $this->_user['sessionuserid'];
            $companyid = $companyid ? $companyid : $userid;
            $data = $this->company->getCompanyById($companyid);
            $userrole = $this->company->getCompanyById($userid);
            $this->tpl->assign('data',$data);
            $this->tpl->assign('role',$userrole['users_role']);
            $this->tpl->display('basic_edit');//指向页面
        }
    }


    //编辑供应范围
    public function productedit(){

        if($this->ev->get('submit'))
        {
            $args = $this->ev->get('args');
            if(!$args['user_category']){
                $message = array(
                    'statusCode' => 300,
                    "message" => "供货范围不能为空"
                );
                exit(json_encode($message));
            }
            $stepData['userid'] = $this->ev->get($args['userid']);//传递修改企业id
            $company_invoice_count = count($args['company_invoice']);
            if($company_invoice_count ==1){
                $stepData['company_invoice'] = $args['company_invoice'][0];
            }else{
                $stepData['company_invoice'] = 0;
            }
            $this->company->modifyCompanyIntro($stepData);
            //删除原来的数据
            $this->company->delUserCategory($args['userid']);
            //添加供货范围 存供应商分类表数据
            foreach ($args['user_category'] as $k=>$val){
                $user_category['user_id'] = $args['userid'];
                $user_category['cate_id'] = $k;
                $user_category['year_num']= $val;
                $userCategoryId = $this->user->insertUserCategory($user_category);
                if(!$userCategoryId){
                    $message = array(
                        'statusCode' => 300,
                        "message" => "添加供应商分类数据失败"
                    );
                    exit(json_encode($message));
                }
            }
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?company-app-company-product&companyid=".$args['userid']
            );
            exit(json_encode($message));
        }
        else
        {
            $companyId = $this->ev->get('companyid');//链接把点击企业id传递过来
            $userid = $this->_user['sessionuserid'];
            $companyId = $companyId ? $companyId : $userid;
            $userrole = $this->company->getCompanyById($userid);
            $data = $this->company->getCompanyById($companyId);
            $userCategory = $this->company->getUserCategoryByUserId($companyId);
            foreach ($userCategory as $k=>$item){
                $currentCateName = $this->category->getCateInfo($item['cate_id']);//--当前分类信息---
                $catname = $currentCateName['catname'];
                if ($currentCateName['catparent']) {
                    $parentCateName = $this->category->getCateInfo($currentCateName['catparent']);//--父类信息---
                    $parentName = $parentCateName['catname'];
                    $catparentName = $parentCateName['catname'];
                }
                if ($parentCateName['catparent']) {
                    $grandpaName = $this->category->getCateInfo($parentCateName['catparent']);//--顶级父类---
                    $grandpaNamestr = $grandpaName['catname'];
                    $catparentName = $grandpaName['catname'].' > '.$catparentName.' > ';
                }
                $userCategory[$k]['catname'] = $catname;
                $userCategory[$k]['parentName'] = $parentName;
                $userCategory[$k]['grandpaNames'] = $grandpaNamestr;
                $userCategory[$k]['catparentname'] = $catparentName;
            }

            $newUserCategory = array();
            foreach($userCategory as $k=>$v){
                $newUserCategory[$v['catparentname']][]  = $v;
            }
            $newUserCategory = array_values($newUserCategory);
            $catnameArr = array();
            foreach ($newUserCategory as $k=>$val){
                $catArr = [];
                foreach ($val as $v1){
                    $catArr[] = [
                        'catname' => $v1['catname'],
                        'year_num'=>$v1['year_num'],
                        'cate_id'=>$v1['cate_id']
                        ];
                    $catnameArr[$k]=[
                        'parentName'=>$v1['parentName'],
                        'grandpaNames'=>$v1['grandpaNames'],
                        'catArr'=>$catArr
                    ];
                }
            }

            //分类顶级分类
            $parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
            $this->tpl->assign('parentcat',$parentcat);
            $this->tpl->assign('data',$data);
            $this->tpl->assign('role',$userrole['users_role']);
            $this->tpl->assign('catnameArr',$catnameArr);
            $this->tpl->display('product_edit');
        }
    }


    //编辑联系方式
    public function contactedit(){

        if($this->ev->get('submit'))
        {
            $args = $this->ev->get('args');
            if(!$args['company_province']){
                $message = array(
                    'statusCode' => 300,
                    "message" => "企业所在省份不能为空"
                );
                exit(json_encode($message));
            }
            if(!$args['company_city']){
                $message = array(
                    'statusCode' => 300,
                    "message" => "企业所在城市不能为空"
                );
                exit(json_encode($message));
            }
            if(!$args['company_area']){
                $message = array(
                    'statusCode' => 300,
                    "message" => "企业所在地区不能为空"
                );
                exit(json_encode($message));
            }
            $args['users_type'] = 5;//信息更新时修改供应商类别为待复核
            $args['company_tel'] = $args['company_quhao'].'-'.$args['company_tel'];
            $this->company->modifyCompanyIntro($args);
            //更新第二联系人
            $user_contacts['user_id'] = $args['userid'];
            $user_contacts['contacts_name'] =$args['contact_info']['contacts_name'];
            $user_contacts['user_mail'] =$args['contact_info']['user_mail'];
            $user_contacts['user_phone'] =$args['contact_info']['user_phone'];
            $user_contacts['user_tel'] =$args['contact_info']['user_quhao'].'-'.$args['contact_info']['user_tel'];
            $userContactInfo = $this->company->getUserContactsById($args['userid']);
            if($userContactInfo){
                $this->company->modifyUserContactsIntro($user_contacts,$args['userid']);
            }else{
                $this->user->insertUserContact($user_contacts);
            }
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?company-app-company-contact&companyid=".$args['userid']
            );
            exit(json_encode($message));
        }
        else
        {
            $companyId = $this->ev->get('companyid');//当前企业用户id
            $userid = $this->_user['sessionuserid'];
            $companyId = $companyId ? $companyId : $userid;
            $userrole = $this->company->getCompanyById($userid);
            $data = $this->company->getCompanyById($companyId);
            $userContacts = $this->company->getUserContactsById($companyId);
            $fields = $this->module->getMoudleFields(3,$this->user->getModuleUserInfo());
            $forms = $this->html->buildHtml($fields);
            $html = array();
            $html[0] = $forms[11];
            $html[1] = $forms[10];
            $html[2] = $forms[9];
            //获取第一 、第二联系人固话信息
            $contentInfo1 =explode('-', $data['company_tel']);
            $data['quhao'] = empty($contentInfo1)?'':$contentInfo1[0];
            $data['company_tel'] = empty($contentInfo1)?$data['company_tel']:$contentInfo1[1];
            $contentInfo2 =explode('-', $userContacts['user_tel']);
            $userContacts['quhao'] = empty($contentInfo2)?'':$contentInfo2[0];
            $userContacts['user_tel'] = empty($contentInfo2)?$userContacts['user_tel']:$contentInfo2[1];
            $this->tpl->assign('html',$html);
            $this->tpl->assign('data',$data);
            $this->tpl->assign('role',$userrole['users_role']);
            $this->tpl->assign('userContacts',$userContacts);
            $this->tpl->display('contact_edit');
        }
    }


    //编辑企业纸质
    public function information(){
         if ($this->ev->get('categoryedit'))
         {
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
             // $id = $this->_user['sessionuserid'];
             $step2Data = $this->ev->get('args');
             $id = $step2Data['userid'];
             $args = array();
             foreach ($step2Data['user_certificates'] as $key=>$val){
                 if($key==5){
                     //删除原来证书记录
                     $this->user->delCertificate($id,$key);
                     $user_certificate = [];
                    foreach ($val as $k=>$v){
                        $user_certificate[]=[
                            'user_id'=>$id,
                            'certificate_name'=>$certificatesArr[$key],
                            'certificate_url'=>$v,
                            'certificate_type'=>$key,
                            'create_time'=>time(),
                        ];
                    }
                     foreach ($user_certificate as $vv){
                         $userCertificateId = $this->user->insertUserCertificate($vv);
                         if(!$userCertificateId){
                             $message = array(
                                 'statusCode' => 300,
                                 "message" => "添加供应商证书数据失败"
                             );
                             exit(json_encode($message));
                         }
                     }
                 }else{
                     $rse = $this->user->getUserCertificateById($id,$key);
                     if(!$rse){
                         $user_certificate=[
                             'user_id'=>$id,
                             'certificate_name'=>$certificatesArr[$key],
                             'certificate_url'=>$val,
                             'certificate_type'=>$key,
                             'create_time'=>time(),
                         ];
                         $userCertificateId = $this->user->insertUserCertificate($user_certificate);
                         //var_dump($userCertificateId);die;
                         if(!$userCertificateId){
                             $message = array(
                                 'statusCode' => 300,
                                 "message" => "添加供应商证书数据失败"
                             );
                             exit(json_encode($message));
                         }
                     }else{
                         //更新证书
                         $args['certificate_url'] = $val;
                         $this->user->modifyUserCertificate($args,$id,$key);
                     }

                 }
             }
             //更新三证合一证书
             $stepData['userid'] = $id;
             $stepData['users_type'] = 5;//信息更新时修改供应商类别为待复核
             $stepData['company_licence_pic'] = $step2Data['company_licence_pic'];
             $this->company->modifyCompanyIntro($stepData);
             $message = array(
                 'statusCode' => 200,
                 "message" => "加载中...",
                 "callbackType" => "forward",
                 "forwardUrl" => "index.php?company-app-company-companyMaterials&companyid=".$id
             );
             exit(json_encode($message));
         }else{
             $companyid = $this->ev->get('companyid');
             $userid = $this->_user['sessionuserid'];
             $companyid = $companyid ? $companyid : $userid;
             //获取企业证书信息
             $certificateData = $this->company->getCertificateById($companyid);
             $certificateJpg = array();
             foreach ($certificateData as $val){
                 $certificateJpg[$val['certificate_type']][] = $val;
             }
             $certificateInfo = array();
             foreach ($certificateJpg as $key=>$val){

                 foreach ($val as $k=>$v){
                     if(in_array($key,[4,7,8,6])){
                         $v['fileName'] = trim(strrchr($v['certificate_url'], '/'),'/');
                     }
                     if($key==5){
                         $certificateInfo[$key][] = $v;
                     }else{
                         $certificateInfo[$key] = $v;
                     }

                 }
             }
             $data = $this->company->getCompanyById($companyid);
             $userrole = $this->company->getCompanyById($userid);
             $this->tpl->assign('role',$userrole['users_role']);
             $this->tpl->assign('data', $data);
             $this->tpl->assign('certificateInfo', $certificateInfo);
             $this->tpl->display('information');
         }
    }

}


?>
