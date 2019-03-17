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
        $this->content = $this->G->make('content','company');
        $modules = $this->module->getModulesByApp('basic');
        $this->clarify = $this->G->make('clarify','user');
        $this->ppe = $this->G->make('price','purchase');
        $this->link = $this->G->make('link','content');
        $this->tpl->assign('modules',$modules);
        $action = $this->ev->url(3);
        $search = $this->ev->get('search');
        $this->collect = $this->G->make('collect','user');
        $this->u = '';
        if($search)
        {
            $this->tpl->assign('search',$search);
            foreach($search as $key => $arg)
            {
                $this->u .= "&search[{$key}]={$arg}";
            }
        }
        $this->link = $this->G->make('link','content');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);

        $this->cart = $this->G->make('cart','item');
        $cartNumArr = $this->cart->getCartUserNum();
        foreach ($cartNumArr as $k => $v) {
            $cartnums[] = $v['number'];
        }
        $cartNum = array_sum($cartnums)?array_sum($cartnums):0;

        $this->tpl->assign('links',$links);
        $this->tpl->assign('cartNum',$cartNum);
        $this->tpl->assign('search',$search);
        if(!method_exists($this,$action))
            $action = "index";
        $this->$action();
        exit;
    }
    //企业动态首页
    private function news()
    {
        $search = $this->ev->get('search');
        $page = intval($this->ev->get('page'));
        $page = $page?$page:1;
        $args = array();
        $userid = $this->_user['sessionuserid'];
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
        $data = $this->content->getCompanyNewList($args,$page,10);
        $user = $this->content->getCompanyById($userid);
        //var_dump($user);die;
        $this->tpl->assign('page',$page);
        $this->tpl->assign('data',$data);
        //$this->tpl->assign('_user',$user);
        $this->tpl->display('news_list');
    }
    //添加新动态
    private function newsadd()
    {
        if($this->ev->get('submit'))
        {
            $args = $this->ev->get('args');
            $args['company_id'] = $this->_user['sessionuserid'];
            $args['news_title'] = $args['news_title'];
            $args['news_content'] = $args['news_content'];
            $args['create_time'] = $args['update_time'] = time();
            $this->content->addNews($args);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-company-basic-news"
            );
            exit(json_encode($message));
        }
        else
        {
            $this->tpl->display('news_add');
        }
    }

    //编辑新动态
    private function newsedit()
    {
        if($this->ev->get('submit'))
        {
            $args = $this->ev->get('args');
            $result = $this->content->getNewsById($args['news_id']);
            //$args['company_id'] = $this->_user['sessionuserid'];
            $args['news_title'] = $args['news_title'];
            $args['news_content'] = $args['news_content'];
            $args['update_time'] = time();
            $this->content->modifyNews($args);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-company-basic-news"
            );
            exit(json_encode($message));
        }
        else
        {
            $newsid = intval($this->ev->get('news_id'));
            $data = $this->content->getNewsById($newsid);
            $this->tpl->assign('data',$data);
            $this->tpl->display('news_edit');
        }
    }

    //动态详情
    private function newsInfo()
    {
        $newsid = intval($this->ev->get('news_id'));
        $data = $this->content->getNewsById($newsid);
        $this->tpl->assign('data',$data);
        $this->tpl->display('news_info');
    }

    //删除动态
    private function newsdel()
    {
        $page = intval($this->ev->get('page'));
        $newsid = intval($this->ev->get('news_id'));
        $data = $this->content->getNewsById($newsid);
        //用户只能删除自己的企业动态
        if($data['company_id'] == $this->_user['sessionuserid'])
        {
            $this->content->delNews($newsid);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-company-basic-news&page={$page}"
            );
            exit(json_encode($message));
        }
    }

    //企业简介首页
    private function index()
    {
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->tpl->assign('links',$links);
        $companyId = $this->_user['sessionuserid'];
        $data = $this->content->getCompanyById($companyId);
        $cityInfo=$this->collect->getCityInfo($data['company_province'],$data['company_city'],$data['company_area']);
        $data['cityInfo'] = $cityInfo=='未填写'?'':$cityInfo;
        $this->tpl->assign('data',$data);
        $this->tpl->display('basic_index');
    }

    /**
     *  编辑企业简介
     *  update  2018-11-13  yjc   updateCompanyxun
     *  修改企业名称时 直接修改澄清表名称 避免原功能链表
     *  修改企业名称时 直接修改报价表名称 避免原功能链表
     */
    private function indexedit()
    {
        if($this->ev->get('submit'))
        {
            $args = $this->ev->get('args');
            $args['userid'] = $this->_user['sessionuserid'];
            $this->clarify->updateCompanyxun($args['userid'],$args['company_name']);
            #修改报价表中的企业名称
            $this->ppe->updatePurchaseCompanyname($args['userid'],$args['company_name']);
            $qiye = $this->content->modifyCompanyIntro($args);
            if($qiye){

                $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-company-basic"
            );
            exit(json_encode($message));

            }
        }
        else
        {
            $companyId = $this->_user['sessionuserid'];
            $data = $this->content->getCompanyById($companyId);
            $this->tpl->assign('data',$data);
            $this->tpl->display('basic_edit');
        }
    }

    //企业主营业务供货范围
    private function product()
    {
        $companyId = $this->_user['sessionuserid'];
        $data = $this->content->getCompanyById($companyId);
        $userCategory = $this->content->getUserCategoryByUserId($companyId);
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
        $this->tpl->assign('data',$data);
        $this->tpl->assign('catnameArr',$catnameArr);
        $this->tpl->assign('company_invoice',$company_invoice);
        $this->tpl->display('product');
    }

    //编辑主营业务
    private function productedit()
    {
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
            $stepData['userid'] = $this->_user['sessionuserid'];
            $company_invoice_count = count($args['company_invoice']);
            if($company_invoice_count ==1){
                $stepData['company_invoice'] = $args['company_invoice'][0];
            }else{
                $stepData['company_invoice'] = 0;
            }
            $this->content->modifyCompanyIntro($stepData);
            $args['userid'] = $this->_user['sessionuserid'];
            //删除原来的数据
            $this->content->delUserCategory($args['userid']);
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
                "forwardUrl" => "index.php?user-company-basic-product"
            );
            exit(json_encode($message));
        }
        else
        {
            $companyId = $this->_user['sessionuserid'];
            $data = $this->content->getCompanyById($companyId);
            $userCategory = $this->content->getUserCategoryByUserId($companyId);
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
            $this->tpl->assign('catnameArr',$catnameArr);
            $this->tpl->display('product_edit');
        }
    }

    //联系我们首页
    private function contact()
    {
        $companyId = $this->_user['sessionuserid'];
        $data = $this->content->getCompanyById($companyId);
        $cityInfo=$this->collect->getCityInfo($data['company_province'],$data['company_city'],$data['company_area']);
        $data['cityInfo'] = $cityInfo=='未填写'?'':$cityInfo;
        $userContacts = $this->content->getUserContactsById($companyId);
        $this->tpl->assign('userContacts',$userContacts);
        $this->tpl->assign('data',$data);
        $this->tpl->display('contact');
    }

    //编辑-联系我们
    private function contactedit()
    {
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
            $args['userid'] = $this->_user['sessionuserid'];
            $args['users_type'] = 5;//信息更新时修改供应商类别为待复核
            $args['company_tel'] = $args['company_quhao'].'-'.$args['company_tel'];
            $this->content->modifyCompanyIntro($args);
            //更新第二联系人
            $user_contacts['user_id'] =$args['userid'];
            $user_contacts['contacts_name'] =$args['contact_info']['contacts_name'];
            $user_contacts['user_mail'] =$args['contact_info']['user_mail'];
            $user_contacts['user_phone'] =$args['contact_info']['user_phone'];
            $user_contacts['user_tel'] =$args['contact_info']['user_quhao'].'-'.$args['contact_info']['user_tel'];

            $userContactInfo = $this->content->getUserContactsById($args['userid']);
            if($userContactInfo){
                $this->content->modifyUserContactsIntro($user_contacts,$args['userid']);
            }else{
                $this->user->insertUserContact($user_contacts);
            }
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-company-basic-contact"
            );
            exit(json_encode($message));
        }
        else
        {
            $companyId = $this->_user['sessionuserid'];
            $data = $this->content->getCompanyById($companyId);
            $userContacts = $this->content->getUserContactsById($companyId);
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
            $this->tpl->assign('userContacts',$userContacts);
            $this->tpl->display('contact_edit');
        }
    }

    //荣誉资质
    private function honour()
    {
        $companyId = $this->_user['sessionuserid'];
        $data = $this->content->getCompanyById($companyId);
        $honors = $this->content->getHonorsById(array(array('AND',"company_id = :company_id",'company_id',$companyId)));
        $this->tpl->assign('data',$data);
        $this->tpl->assign('honors',$honors['data']);
        $this->tpl->display('honour');
    }

    //添加荣誉资质
    private function honouredit()
    {
        if($this->ev->get('submit'))
        {
            $args = $this->ev->get('args');
            $args['company_id'] = $this->_user['sessionuserid'];
            $args['create_time'] = $args['update_time'] = time();
            $this->content->addHonour($args);
            $message = array(
                'statusCode' => 200,
                "message" => "上传资质成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-company-basic-honour"
            );
            exit(json_encode($message));
        }
        else {
            $companyId = $this->_user['sessionuserid'];
            $data = $this->content->getCompanyById($companyId);
            $this->tpl->assign('data', $data);
            $this->tpl->display('honour_edit');
        }
    }

    //删除荣誉资质
    private function honourdel()
    {
        $id = intval($this->ev->get('id'));
        $this->content->delHonor($id);
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => "forward",
            "forwardUrl" => "index.php?user-company-basic-honour"
        );
        exit(json_encode($message));
    }

    //编辑成功案例
    private function caseedit()
    {
        if($this->ev->get('submit'))
        {
            $args = $this->ev->get('args');
            $args['company_id'] = $this->_user['sessionuserid'];
            $args['case_logo'] = $args['case_url'][0];
            $args['case_url'] = serialize($args['case_url']);
            $args['create_time'] = $args['update_time'] = time();
            $this->content->modifyCase($args);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-company-basic-project"
            );
            exit(json_encode($message));
        }
        else {
            $id = $this->ev->get('case_id');
            $data = $this->content->getCaseById($id);
            $data['case_url'] = unserialize($data['case_url']);
            //var_dump($data);die;
            $this->tpl->assign('data', $data);
            $this->tpl->display('case_edit');
        }
    }

    //成功案例
    private function project()
    {
        $page = intval($this->ev->get('page'));
        $page = $page ? $page : 1;
        $args = array();
        $userid = $this->_user['sessionuserid'];
        $args[] = array("AND","company_id = :company_id",'company_id',$userid);
        $data = $this->content->getCompanyCaseList($args,$page,10);
        $companyId = $this->_user['sessionuserid'];
        $companyData = $this->content->getCompanyById($companyId);
        $this->tpl->assign('companyData', $companyData);
        $this->tpl->assign('data', $data);
        $this->tpl->display('case');
    }

    //添加案例
    private function caseadd()
    {
        if($this->ev->get('submit'))
        {
            $args = $this->ev->get('args');
            $args['company_id'] = $this->_user['sessionuserid'];
            $args['case_logo'] = $args['case_url'][0];
            $args['case_url'] = serialize($args['case_url']);
            $args['create_time'] = $args['update_time'] = time();
            $this->content->addCase($args);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?user-company-basic-project"
            );
            exit(json_encode($message));
        }
        else {
            $companyId = $this->_user['sessionuserid'];
            $data = $this->content->getCompanyById($companyId);
            $this->tpl->assign('data', $data);
            $this->tpl->display('case_add');
        }
    }
    /**
     * 删除案例
     */
    public function casedel(){
        $caseId = $this->ev->get('case_id');
        $this->content->delcase($caseId);
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => "forward",
            "forwardUrl" => "index.php?user-company-basic-project"
        );
        exit(json_encode($message));
    }

    /**
     * 企业中心合作资料
     */
     private function information(){
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
             $id = $this->_user['sessionuserid'];
             $step2Data = $this->ev->get('args');
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
             $stepData['userid'] = $this->_user['sessionuserid'];
             $stepData['users_type'] = 5;//信息更新时修改供应商类别为待复核
             $stepData['company_licence_pic'] = $step2Data['company_licence_pic'];
             $this->content->modifyCompanyIntro($stepData);
             $message = array(
                 'statusCode' => 200,
                 "message" => "加载中...",
                 //"callbackType" => "forward",
                 "forwardUrl" => "index.php?user-company-basic-information"
             );
             exit(json_encode($message));
         }else{
             $companyid = $this->_user['sessionuserid'];
             //获取企业证书信息
             $certificateData = $this->content->getCertificateById($companyid);
             $certificateJpg = array();
             foreach ($certificateData as $val){
                 $certificateJpg[$val['certificate_type']][] = $val;
             }
             $certificateInfo = array();
             foreach ($certificateJpg as $key=>$val){

                 foreach ($val as $k=>$v){
                     if(in_array($key,[4,7,8,6])){
                         $urlArr = explode('attname=',$v['certificate_url']);
                         if(count($urlArr)>1){
                             $v['fileName'] = trim(strrchr($v['certificate_url'], 'attname='),'attname=');
                         } else{
                             $v['fileName'] = trim(strrchr($v['certificate_url'], '/'),'/');
                         }
                     }
                     if($key==5){
                         $certificateInfo[$key][] = $v;
                     }else{
                         $certificateInfo[$key] = $v;
                     }

                 }
             }
             $companyId = $this->_user['sessionuserid'];
             $data = $this->content->getCompanyById($companyId);
             $this->tpl->assign('data', $data);
             $this->tpl->assign('certificateInfo', $certificateInfo);
             $this->tpl->display('information');
         }

	}
}

?>
