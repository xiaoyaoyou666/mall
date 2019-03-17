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
        $this->purchase = $this->G->make('content','purchase');
        $this->ppe = $this->G->make('price','purchase');
        $this->user = $this->G->make('user', 'user');
        $this->item = $this->G->make('item','item');
		$action = $this->ev->url(3);
        $this->collect = $this->G->make('collect','user');
        $this->link = $this->G->make('link','content');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->tpl->assign('links',$links);
        $this->cart = $this->G->make('cart','item');
        $this->evaluate = $this->G->make('evaluate','user');
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
        $args = array();
        $args[] = array("AND","purchaseuserid = :purchaseuserid","purchaseuserid",$this->_user['sessionuserid']);

        $args[] = array("AND","purchasestatus != :purchasestatus",'purchasestatus',2);
        //仅显示发布的采购信息草稿不做展示
        $args[] = array("AND","purchase_status = :purchase_status","purchase_status",1);
        $fabucaigou = $this->purchase->getContentList($args,1,4); //发布的采购

        $args1[] = array("AND","ppeuserid = :ppeuserid",'ppeuserid',$this->_user['sessionuserid']);//完成状态
        $guanzhucaigou = $this->ppe->getPurchaseFollowList($args1,1,4,$order = 'ppeid DESC'); //关注的采购

        $args2[] = array("AND","purchaseuserid = :purchaseuserid",'purchaseuserid',$this->_user['sessionuserid']);
        $xunjia = $this->ppe->getPurchaseFollowList($args2,1,4,$order = 'ppeid DESC');  //收到的询价
        $userids = array();
        foreach($xunjia['data'] as $key => $p )
        {
            $userids[] = $p['ppeuserid'];
        }
        $userids = implode(',',$userids);
        $users = $this->user->getUsersByArgs(array(array("AND","find_in_set(userid,:userids)","userids",$userids)));
        //商品展示只展示发布的商品即商品类型为goodstype =1的
        $goods = $this->item->listGoods(array(array("AND","goodsuserid = :goodsuserid",'goodsuserid',$this->_user['sessionuserid']),array("AND","goodstype = :goodstype",'goodstype',1)),1,5);
        $categories = $this->category->getCategoriesByArgs('','item');

       //----------------------------我的询价-------------------------------
        $args44[] = array("AND","xunjia_ren = :xunjia_ren",'xunjia_ren',$this->_user['sessionuserid']);
        $args44[] = array("AND","purchase_status = :purchase_status","purchase_status",1);
        $contentarr44 = $this->purchase->getPurchaseList($args44,1,4);
        foreach ($contentarr44['data'] as $k => &$v) {
            if ((time()>intval($v['end_time'])) && $this->purchase->getPurchseNumber($v['id'])) {

                $args11['status'] = 2;
                $this->purchase->updatePurchase($v['id'],$args11);
            }elseif ((time()>intval($v['end_time']))) {
                //【时间截止如果没人报价则修改为已终止4】
                $args11['status'] = 4;
                $this->purchase->updatePurchase($v['id'],$args11);
            }
            $v['offernum'] = $this->purchase->getPurchseNumber($v['id']);
        }

        //----------------------------我的报价-------------------------------
        $args55[] = array('AND',"del = :del",'del',0);
        $args55[] = array('AND',"supplier_id = :supplier_id",'supplier_id',$this->_user['sessionuserid']);
        $offerarr = $this->ppe->purchaseList($args55,1,4);
        foreach ($offerarr['data'] as $k => &$v) {
            $v['painum'] = $this->ppe->ranking($v['purchase_new_id'],$v['pid']);
        }

        $purchasesType = array(0 => '开放',1 => '已达成合作',2 => '关闭');
        $this->tpl->assign('users',$users);
        $this->tpl->assign('contentarr44',$contentarr44);
        $this->tpl->assign('offerarr',$offerarr);
        $this->tpl->assign('purchases',$fabucaigou);
        $this->tpl->assign('follow',$guanzhucaigou);
        $this->tpl->assign('categories',$categories);
        $this->tpl->assign('xunjia',$xunjia);
        $this->tpl->assign('goods',$goods);
        $this->tpl->assign('purchasesType',$purchasesType);
        $this->tpl->display('index');
    }

    // 供应商角色修改
    private function updCompanyStatus()
    {
         $userid = $this->ev->get('id_value');
         $status = $this->ev->get('value');
         $result = $this->collect->updateCompanyStatus($userid,$status);
         if ($result) {
             if($status==1){
                 $message = array(
                     'statusCode' => 200,
                     'time'=>date('Y-m-d',time()),
                     "message" => "操作成功"
                 );
             }else{
                 $message = array(
                     'statusCode' => 201,
                     'time'=>date('Y-m-d',time()),
                     "message" => "操作成功"
                 );
             }

         } else {
             $message = array(
                 'statusCode' => 300,
                 "message" => "修改失败"
             );
         }
         exit(json_encode($message));
     }

    /**
     *  @action   供应商目录
     *  @param    xiliheng - 20180910
     */
    private function suplier_list()
    {
        $userstatus = array(0=>'未通过',1=>'已通过');
        $type = array(1=>'普通供应商',2=>'合格供应商',3=>'战略供应商',4=>'黑名单供应商',5=>'待复核供应商');
        $branch = array(0=>'未选择',1=>'资产管理公司',2=>'工程中心',3=>'技术服务公司',4=>'开发中心',5=>"光合加",6=>"其他");
        $page = $this->ev->get('page');
        $catid = $this->ev->get('catid');

        //获取查询字段 - xlh 2-18-828
        $query = $this->ev->get('query');//查询内容
        $queryTopcatId = $this->ev->get('topcateId');//供货范围-顶级id
        $queryfathercateId = $this->ev->get('fathcateId');//供货范围-二级id
        $queryCateId = $this->ev->get('catId');//供货范围，三级id
        $queryUserType = $this->ev->get('userType');//供货商类型
        $queryBranch = $this->ev->get('userBranch');//用户部门类型
//        var_dump($queryBranch,$queryUserType);
        $queryProvince = $this->ev->get("province");//省
        $queryCity = $this->ev->get("city");//市
        $queryCityArea = $this->ev->get("cityarea");//区/县信息

        //根据上一级获取相应的二级和三级列表-xiliheng-20180829
        $secondCateArr = [];
        $thirdCateArr = [];
        if (!empty($queryfathercateId))
        {
            //请求三级分类，判断参数为fathercateId
            //这时候要获取所有的二级，以及当前指定二级的三级
            $secondCateArr = $this->category->getCateByFatherId($queryTopcatId);
            //给当前选择的二级标签设置标志
            foreach ($secondCateArr as &$secondRecord)
            {
                $secondRecord['isSet'] = $secondRecord['catid']==$queryfathercateId ? 1 : 9;
            }

            $thirdCateArr = $this->category->getCateByFatherId($queryfathercateId);
            $secondCateArr = array_column($secondCateArr, NULL, 'catid');
            $thirdCateArr = array_column($thirdCateArr, NULL, 'catid');
        }
        elseif (!empty($queryTopcatId))
        {
            //请求二级分类，判断参数为顶级id
            $secondCateArr = $this->category->getCateByFatherId($queryTopcatId);
            $secondCateArr = array_column($secondCateArr, NULL, 'catid');
        }

        //获取一级分类 - xiliheng20180829
        $catname = '';
        $parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
        if (!empty($parentcat))
        {
            foreach ($parentcat as &$parentRecord)
            {
                $parentRecord['isSet'] = $parentRecord['catid']==$queryTopcatId ? 1 : 9;
            }
        }
        //获取当前登录的用户信息
        $userinfoarr = $this->user->getUserById($this->_user['sessionuserid']);

        //拼接查询字段-供货商类型
        $queryArr = [];
        $args = array();
        $args[] = array("AND","users_role = :users_role",'users_role',0);

        //拼接查询字段-供货商范围
        $userCategorys = null;
        $queryThirdCateIds = [];
        if (!empty($queryCateId) && !empty($queryfathercateId) && !empty($queryTopcatId))
        {
            $userCategorys = $this->collect->getDataByUserstype($queryCateId);
            $queryArr['topcateId'] = $queryTopcatId;
            $queryArr['fathcateId'] = $queryfathercateId;
            $queryArr['catId'] = $queryCateId;
            if (!empty($thirdCateArr))
            {
                foreach ($thirdCateArr as &$thirdRecord)
                {
                    $thirdRecord['isSet'] = $thirdRecord['catid']==$queryCateId ? 1 : 9;
                }
            }
            $queryThirdCateIds[] = $queryCateId;
        }
        elseif(!empty($queryfathercateId) && !empty($queryTopcatId))
        {
            //二级分类
            //获取下属的所有三级分类
            $fatherCate = $this->category->getCateByFatherId($queryfathercateId);
            $fatherIds = array_column($fatherCate, 'catid');
            $queryThirdCateIds = $fatherIds;
            $userCategorys = $this->collect->getDataByUserstype($fatherIds);
            $queryArr['topcateId'] = $queryTopcatId;
            $queryArr['fathcateId'] = $queryfathercateId;
        }
        elseif (!empty($queryTopcatId))
        {
            //获取二级分类
            $fatherCate = $this->category->getCateByFatherId($queryTopcatId);
            $fatherIds = array_column($fatherCate, 'catid');

            //获取三级分类信息
            $userCategorys = $this->category->getCateByFatherId($fatherIds);
            $catIdArr = array_column($userCategorys, 'catid');
            $queryThirdCateIds = $catIdArr;
            $userCategorys = $this->collect->getDataByUserstype($catIdArr);
            $queryArr['topcateId'] = $queryTopcatId;
        }

        //根据供货商查询
        $isJoin = '';
        if (!empty($queryThirdCateIds))
        {
            $isJoin = 'user_category';
            $queryThirdCateIds = implode(',', $queryThirdCateIds);
            $args[] = array('AND',"user_category.cate_id in ({$queryThirdCateIds})");
            $args[] = array('AND','user_category.user_id = user.userid');

            //查询供货商类型
            if ($queryUserType)
            {
                $args[] = array("AND", "user.users_type = {$queryUserType}");
                $queryArr['userType'] = $queryUserType;
            }

            //拼接查询字段-所属部门模糊查询
            if ($queryBranch)
            {
                $args[] = array("AND", "user.users_branch like '%{$queryBranch}%'");
                $queryArr['userBranch'] = $queryBranch;
            }

            //拼接省市 - 供货范围
            if (!empty($queryProvince))
            {
                $queryProString = "user.company_province = {$queryProvince} ";
                $queryArr['province'] = $queryProvince;
                if (!empty($queryCity))
                {
                    $queryProString .= " AND  user.company_city = {$queryCity} ";
                    $queryArr['city'] = $queryCity;
                }

                $args[] = array("AND", $queryProString);
            }

            //查询内容
            if (!empty($query))
            {
                $args[] = ["AND", "user.company_name like '%{$query}%'"];
                $queryArr['query'] = $query;
            }
        }
        else
        {
            //查询供货商类型
            if ($queryUserType)
            {
                $args[] = array("AND", "users_type = {$queryUserType}");
                $queryArr['userType'] = $queryUserType;
            }
            //拼接查询字段-所属部门模糊查询
            if ($queryBranch)
            {
                $args[] = array("AND", "users_branch like '%{$queryBranch}%'");
                $queryArr['userBranch'] = $queryBranch;
            }
            //拼接省市 - 供货范围
            if (!empty($queryProvince))
            {
                $queryProString = "company_province = {$queryProvince} ";
                $queryArr['province'] = $queryProvince;
                if (!empty($queryCity))
                {
                    $queryProString .= " AND  company_city = {$queryCity} ";
                    $queryArr['city'] = $queryCity;
                }

                $args[] = array("AND", $queryProString);
            }

            //查询内容
            if (!empty($query))
            {
                $args[] = ["AND", "company_name like '%{$query}%'"];
                $queryArr['query'] = $query;
            }
        }


        $users=$this->collect->getUserListWithQuery($page,10,$args, 'company_istrue ASC ,users_type DESC', $queryArr, $isJoin);

        $documents = [];
        $evaluateArr = [];  //供应商被评价数据
        foreach ($users['data'] as $k=>$val)
        {
            $cityInfo=$this->collect->getCityInfo($val['company_province'],$val['company_city']);
            $users['data'][$k]['cityName'] = $cityInfo;
            //获取文档列表
            $args2 = array();
            $args2[] = array("AND","doc_uids = {$val['userid']} and doc_status = 0");
            $docs = $this->collect->getDocuments($args2);

            if (!empty($docs))
            {
                $documents[$val['userid']] = $docs;
            }

            //获取供货范围信息
            $catNameArr = array();
            $userCategory = $this->content->getUserCategoryByUserId($val['userid']);
            foreach ($userCategory as $catekey=>$item)
            {
                $cateNameInfo = $this->category->getCateInfo($item['cate_id']);
                $catNameArr[] = $cateNameInfo['catname'];
            }

            $users['data'][$k]['cateName'] = empty($catNameArr)?'未添加':implode(',',$catNameArr);

            $users['data'][$k]['istrue_time']= $val['istrue_time']==0?date('Y-m-d',$val['userregtime']):date('Y-m-d',$val['istrue_time']);

            // 获取所属部门  branch
            $user_branch = explode(',', $val['users_branch']);
            $user_branch_temp = array();
            foreach ($user_branch as $kk => $vv) {
                # code...
                $user_branch_temp[] = $branch[$vv];
            }
            $users['data'][$k]['branch'] = implode(',',$user_branch_temp);
            $users['data'][$k]['user_grade'] = $this->collect->countNum($val['users_grade']);
            $users['data'][$k]['grade'] = $val['users_grade'];

            //取针对供应商的评价数据
            $evaluate = $this->evaluate->getEvaluateByUserid($val['userid']);
            $eval_cum = 0;
            if (!empty($evaluate))
            {
                $evaluateArr[$val['userid']] = $evaluate;
                $eval_cum = count($evaluate);
            }
            $users['data'][$k]['eval_cum'] = $eval_cum + $users['data'][$k]['projectnum'];
        }

        $isEmpty = 'no';

        if (empty($users['data']))
        {
            $isEmpty = 'yes';
        }

        //获取省级列表
        $provinceArr = $this->collect->getProvinceList($queryProvince);
        //获取相应市级信息
        $cityArr = $this->collect->getCityByFather($queryProvince, $queryCity);
        //合同数据
        $con = $this->content->getContractTemplate();
        //$this->tpl->assign('provinceId',$queryProvince);
        $this->tpl->assign('provinceArr', $provinceArr);
        $this->tpl->assign('cityArr', $cityArr);
        $this->tpl->assign('role',$userinfoarr['users_role']);
        $this->tpl->assign('catid',$catid);
        $this->tpl->assign('catname',$catname);
        $this->tpl->assign('parentcat',$parentcat);
        $this->tpl->assign('page',$page);
        $this->tpl->assign('type',$type);
        $this->tpl->assign("users",$users);
        $this->tpl->assign("isEmtpy",$isEmpty);
        $this->tpl->assign('userstatus',$userstatus);
        $this->tpl->assign('documents', $documents);
        $this->tpl->assign('evaluateArr', $evaluateArr);
        $this->tpl->assign('querystr', $queryArr);
        $this->tpl->assign('secondCateArr', $secondCateArr);
        $this->tpl->assign('thirdCateArr', $thirdCateArr);
        $this->tpl->assign('con', $con);
        $this->tpl->display('suplier');
    }

    // 所属部门修改
    private function upCompanybranch()
    {
        $userid =  $this->ev->get('userid');
        $branch = $this->ev->get('companybranch');
        $result = $this->collect->updateCompanybranch($userid,$branch);
        if($result){
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
            );
            exit(json_encode($message));
        }else{
            $message = array(
                'statusCode' => 300,
                "message" => "操作失败",
            );
            exit(json_encode($message));
        }
    }

    /*
     * @action   综合评价
     * @param    userid   int   用户id
     * @param    grade    int   评价分
     */
    private function upSupliergrade()
    {
        $userid = $this->ev->get('uid');
        $grade  = $this->ev->get('gid');
        $arr=explode('.',$grade);
        $num1=substr($arr[1],0,2);
        $number = $arr[0].'.'.$num1;
        $gradeNum = $this->collect->countNum($number);
        $result = $this->collect->updateSupliergrade($userid,$number);
        if($result){
            $message = array(
                'statusCode' => $gradeNum,
                "message" => "操作成功",
            );
            exit(json_encode($message));
        }else{
            $message = array(
                'statusCode' => 300,
                "message" => "操作失败",
            );
            exit(json_encode($message));
        }

    }

    /**
     * [export_suplier description]  导出供应商列表
     * @Author   Zhangjianchao
     * @DateTime 2018-09-12
     * @return   [array]        [返回供应商结果集]
     */
    private function export_suplier(){
        $userstatus = array(0=>'未通过',1=>'已通过');
        $type = array(1=>'普通供应商',2=>'合格供应商',3=>'战略供应商',4=>'黑名单供应商',5=>'待复核供应商');

        $branch = array(0=>'未选择',1=>'资管中心',2=>'工程中心',3=>'设计院',4=>'信息中心',5=>"风资源",6=>"其他");
        $page = $this->ev->get('page');
        #筛选条件
        $query = $this->ev->get('keyword');//查询内容
        $queryTopcatId = $this->ev->get('topcateId');//供货范围-顶级id
        $queryfathercateId = $this->ev->get('fathcateId');//供货范围-二级id
        $queryCateId = $this->ev->get('catId');//供货范围，三级id
        $queryUserType = $this->ev->get('purchasetype');//供货商类型
        $queryProvince = $this->ev->get("company_province");//省
        $queryCity = $this->ev->get("company_city");//市
        $queryBranch = $this->ev->get('userBranch');//用户部门类型

       //根据上一级获取相应的二级和三级列表-xiliheng-20180829
        $secondCateArr = [];
        $thirdCateArr = [];
        if (!empty($queryfathercateId))
        {
            //请求三级分类，判断参数为fathercateId
            //这时候要获取所有的二级，以及当前指定二级的三级
            $secondCateArr = $this->category->getCateByFatherId($queryTopcatId);
            //给当前选择的二级标签设置标志
            foreach ($secondCateArr as &$secondRecord)
            {
                $secondRecord['isSet'] = $secondRecord['catid']==$queryfathercateId ? 1 : 9;
            }
            $thirdCateArr = $this->category->getCateByFatherId($queryfathercateId);
            $secondCateArr = array_column($secondCateArr, NULL, 'catid');
            $thirdCateArr = array_column($thirdCateArr, NULL, 'catid');
        }
        elseif (!empty($queryTopcatId))
        {
            //请求二级分类，判断参数为顶级id
            $secondCateArr = $this->category->getCateByFatherId($queryTopcatId);
            $secondCateArr = array_column($secondCateArr, NULL, 'catid');
        }
        //获取一级分类 - xiliheng20180829
        $catname = '';
        $parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
        if (!empty($parentcat))
        {
            foreach ($parentcat as &$parentRecord)
            {
                $parentRecord['isSet'] = $parentRecord['catid']==$queryTopcatId ? 1 : 9;
            }
        }
        //获取当前登录的用户信息
        $userinfoarr = $this->user->getUserById($this->_user['sessionuserid']);

        //拼接查询字段-供货商类型
        $queryArr = [];
        $args = array();
        $args[] = array("AND","users_role = :users_role",'users_role',0);
        //拼接查询字段-供货商范围
        $userCategorys = null;
        $queryThirdCateIds = [];
        if (!empty($queryCateId) && !empty($queryfathercateId) && !empty($queryTopcatId))
        {
            $userCategorys = $this->collect->getDataByUserstype($queryCateId);
            $queryArr['topcateId'] = $queryTopcatId;
            $queryArr['fathcateId'] = $queryfathercateId;
            $queryArr['catId'] = $queryCateId;
            if (!empty($thirdCateArr))
            {
                foreach ($thirdCateArr as &$thirdRecord)
                {
                    $thirdRecord['isSet'] = $thirdRecord['catid']==$queryCateId ? 1 : 9;
                }
            }
            $queryThirdCateIds[] = $queryCateId;
        }
        elseif(!empty($queryfathercateId) && !empty($queryTopcatId))
        {
            //二级分类
            //获取下属的所有三级分类
            $fatherCate = $this->category->getCateByFatherId($queryfathercateId);
            $fatherIds = array_column($fatherCate, 'catid');
            $queryThirdCateIds = $fatherIds;
            $userCategorys = $this->collect->getDataByUserstype($fatherIds);
            $queryArr['topcateId'] = $queryTopcatId;
            $queryArr['fathcateId'] = $queryfathercateId;
        }
        elseif (!empty($queryTopcatId))
        {
            //获取二级分类
            $fatherCate = $this->category->getCateByFatherId($queryTopcatId);
            $fatherIds = array_column($fatherCate, 'catid');

            //获取三级分类信息
            $userCategorys = $this->category->getCateByFatherId($fatherIds);
            $catIdArr = array_column($userCategorys, 'catid');
            $queryThirdCateIds = $catIdArr;
            $userCategorys = $this->collect->getDataByUserstype($catIdArr);
            $queryArr['topcateId'] = $queryTopcatId;
        }

        //根据供货商查询
        $isJoin = '';
        if (!empty($queryThirdCateIds))
        {
            $isJoin = 'user_category';
            $queryThirdCateIds = implode(',', $queryThirdCateIds);
            $args[] = array('AND',"user_category.cate_id in ({$queryThirdCateIds})");
            $args[] = array('AND','user_category.user_id = user.userid');

            //查询供货商类型
            if ($queryUserType)
            {
                $args[] = array("AND", "user.users_type = {$queryUserType}");
                $queryArr['userType'] = $queryUserType;
            }

             //拼接查询字段-所属部门模糊查询
            if ($queryBranch)
            {
                $args[] = array("AND", "users_branch like '%{$queryBranch}%'");
                $queryArr['userBranch'] = $queryBranch;
            }
            //拼接省市 - 供货范围
            if (!empty($queryProvince))
            {
                $queryProString = "user.company_province = {$queryProvince} ";
                $queryArr['province'] = $queryProvince;
                if (!empty($queryCity))
                {
                    $queryProString .= " AND  user.company_city = {$queryCity} ";
                    $queryArr['city'] = $queryCity;
                }

                $args[] = array("AND", $queryProString);
            }

            //查询内容
            if (!empty($query))
            {
                $args[] = ["AND", "user.company_name like '%{$query}%'"];
                $queryArr['query'] = $query;
            }
        }
        else
        {
            //查询供货商类型
            if ($queryUserType)
            {
                $args[] = array("AND", "users_type = {$queryUserType}");
                $queryArr['userType'] = $queryUserType;
            }
            //拼接省市 - 供货范围
            if (!empty($queryProvince))
            {
                $queryProString = "company_province = {$queryProvince} ";
                $queryArr['province'] = $queryProvince;
                if (!empty($queryCity))
                {
                    $queryProString .= " AND  company_city = {$queryCity} ";
                    $queryArr['city'] = $queryCity;
                }

                $args[] = array("AND", $queryProString);
            }

            //查询内容
            if (!empty($query))
            {
                $args[] = ["AND", "company_name like '%{$query}%'"];
                $queryArr['query'] = $query;
            }
        }
        $users=$this->collect->getUserListWithQuery($page,1000000000,$args, 'userid DESC', $queryArr, $isJoin);

        $documents = [];
        foreach ($users['data'] as $k=>$val)
        {
            $cityInfo=$this->collect->getCityInfo($val['company_province'],$val['company_city']);
            $users['data'][$k]['cityName'] = $cityInfo;
            //获取文档列表
            $args2 = array();
            $args2[] = array("AND","doc_uids = {$val['userid']} and doc_status = 0");
            $docs = $this->collect->getDocuments($args2);

            if (!empty($docs))
            {
                $documents[$val['userid']] = $docs;
            }

            //获取供货范围信息
            $catNameArr = array();
            $userCategory = $this->content->getUserCategoryByUserId($val['userid']);
            foreach ($userCategory as $catekey=>$item)
            {
                $cateNameInfo = $this->category->getCateInfo($item['cate_id']);
                $catNameArr[] = $cateNameInfo['catname'];
            }

            $users['data'][$k]['cateName'] = empty($catNameArr)?'未添加':implode(',',$catNameArr);

            $users['data'][$k]['istrue_time']= $val['istrue_time']==0?date('Y-m-d',$val['userregtime']):date('Y-m-d',$val['istrue_time']);

            // 获取所属部门  branch
            $user_branch = explode(',', $val['users_branch']);
            $user_branch_temp = array();
            foreach ($user_branch as $kk => $vv) {
                # code...
                $user_branch_temp[] = $branch[$vv];
            }
            $users['data'][$k]['branch'] = implode(',',$user_branch_temp);
        }


        $strTable ='<table width="500" border="1">';
        $strTable .= '<tr>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">序号</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">企业名称</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">类别</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">现场评价</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">供货范围</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">合作项目</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">综合评价</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">第一联系人</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">所属部门</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">地域</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">备注</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">准入审核</td>';
        $strTable .= '</tr>';
        if(is_array($users)){
            foreach($users['data'] as $k=>$val){
                $strTable .= '<tr>';
                $strTable .= '<td style="text-align:center;font-size:12px;">&nbsp;'.$val['userid'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['company_name'].' </td>';
                $strTable .= '<td style="text-align:left;font-size:12px;color:#ff930e;">'.$type[$val['users_type']].'<br/><span style="display: block;line-height: 14px;color:#999">'.$val['istrue_updatetime'].'</span> </td>';

                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['comnum'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['cateName'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['projectnum'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;"></td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['company_contacter'].'<br/><span>'.$val['company_phone'].'</span><br/><span>'.$val['company_tel'].'</span><br/><span>'.$val['company_email'].'</span></td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['branch'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['cityName'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['remarknum'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;color:#009944">'.$userstatus[$val['company_istrue']].'<br/><span style="display: block;line-height: 14px;color:#009944">'.$val['istrue_time'].'</span></td>';
                $strTable .= '</tr>';
            }
        }
        $strTable .='</table>';
        unset($agreementarr);
        $this->item->downloadExcel($strTable,'suplier');
        exit();
    }

     //修改供应商类型
    private function companys()
    {
        $users_type =  $this->ev->get('company');
        $userid =  $this->ev->get('userid');
        $result = $this->collect->updateCompany($userid,$users_type);
        if($result){
           $message = array(
               'statusCode' => 200,
               "message" => "操作成功",
           );
           exit(json_encode($message));
        }else{
           $message = array(
               'statusCode' => 300,
               "message" => "操作失败",
           );
           exit(json_encode($message));
        }
    }

    //现场评论  添加文档
    /**
     * xiliheng-20180827
     * 1、增加内容：现场评论（doc_type=1），合作项目（doc_type=2），备注（doc_type=3）
     * 2、添加备注时doc_url的内容时文本内容，只有前两个时保存的是url
     *
     */
    private function addNew()
    {
       $data = array();
        $data['doc_type'] = $this->ev->get('doc_type');//现场评价
       //$data['doc_type'] = 1;//现场评价  title  usert  sessionuserid
       $data['doc_title'] = $this->ev->get('title');
       $data['doc_url'] = $this->ev->get('uds');
       $data['doc_uids'] = $this->ev->get('userid');
       $data['doc_uid'] = $this->_user['sessionuserid'];
       $data['doc_time'] = time();

        //增加判断-上传内容不能为空
        if ((in_array($data['doc_type'], [1, 2]) && !$data['doc_url']) || ($data['doc_type'] == 3 && !$data['doc_title']))
        {
            exit();
            $message = array(
                'statusCode' => 300,
                //"message" => "内容不能为空",
            );
            exit(json_encode($message));
        }

        //类型判断，校验类型是否在合法范围内
        if (!in_array($data['doc_type'],[1,2,3]))
        {
            $message = array(
                'statusCode' => 300,
                "message" => "文档类型错误！",
            );
            exit(json_encode($message));
        }

       $result = $this->collect->addDocment($data);
       if($result){
           $message = array(
               'statusCode' => 200,
               "message" => "上传成功",
           );
           exit(json_encode($message));
       }else{
           $message = array(
               'statusCode' => 300,
               "message" => "上传失败",
           );
           exit(json_encode($message));
       }
    }

    /**
     * 文档删除接口- xlh2-18-828
     */
    public function del_docment()
    {
        $id = $this->ev->get('doc_id');

        $res = $this->collect->delDocments($id);

        if($res){
            $message = array(
                'statusCode' => 200,
                "message" => "文件删除成功",
            );
            exit(json_encode($message));
        }else{
            $message = array(
                'statusCode' => 300,
                "message" => "文件删除失败",
            );
            exit(json_encode($message));
        }
    }

    /**
     * 补充省市表经纬度信息zhy20180918
     * http://localhost/yigou/index.php?user-company-index-insertLatOrLnt
     */
    public function insertLatOrLnt()
    {
        //获取省份信息
        $data = array(false,'province');
        $provincesql = $this->pdosql->makeSelect($data);
        $provinceInfo = $this->db->fetchAll($provincesql);
        foreach ($provinceInfo as $val){
            $curl = curl_init();
            //设置抓取的url
            curl_setopt($curl, CURLOPT_URL, "http://api.map.baidu.com/geocoder?address=".$val['province']."&output=json&key=37492c0ee6f924cb5e934fa08c6b1676&city=%E5%8C%97%E4%BA%AC%E5%B8%82");
            //设置头文件的信息作为数据流输出
            curl_setopt($curl, CURLOPT_HEADER, 0);
            //设置获取的信息以文件流的形式返回，而不是直接输出。
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
            //执行命令
            $data = curl_exec($curl);
            curl_close($curl);
            $latlnt = json_decode($data,true);
            $latlntUpdate = json_encode($latlnt['result']['location']);
//            $content = file_get_contents("http://api.map.baidu.com/geocoder?address='".$val['province']."'&output=json&key=37492c0ee6f924cb5e934fa08c6b1676&city=%E5%8C%97%E4%BA%AC%E5%B8%82");
//            $latlnt = json_decode($content,true);
//            $latlntUpdate = json_encode($latlnt['result']['location']);
            if($latlntUpdate!=null){
                $args['lat_lnt_Info'] = $latlntUpdate;
                $data = array(
                    'table' => 'province',
                    'value' => $args,
                    'query' => array(array('AND','id = :id', 'id', $val['id']))
                );
                if(!$this->db->updateElement($data)){
                    $message = array(
                        'statusCode' => 300,
                        "message" => "省经纬度更新出现问题！",
                    );
                }
            }
        }

        //获取市信息
        $data = array(false,'city');
        $citysql = $this->pdosql->makeSelect($data);
        $cityInfo = $this->db->fetchAll($citysql);
        foreach ($cityInfo as $val){
            $curl = curl_init();
            //设置抓取的url
            curl_setopt($curl, CURLOPT_URL, "http://api.map.baidu.com/geocoder?address=".$val['city']."&output=json&key=37492c0ee6f924cb5e934fa08c6b1676&city=%E5%8C%97%E4%BA%AC%E5%B8%82");
            //设置头文件的信息作为数据流输出
            curl_setopt($curl, CURLOPT_HEADER, 0);
            //设置获取的信息以文件流的形式返回，而不是直接输出。
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
            //执行命令
            $data = curl_exec($curl);
            curl_close($curl);
//            $content = file_get_contents("http://api.map.baidu.com/geocoder?address='".$val['city']."'&output=json&key=37492c0ee6f924cb5e934fa08c6b1676&city=%E5%8C%97%E4%BA%AC%E5%B8%82");
            $latlnt = json_decode($data,true);
            $latlntUpdate = json_encode($latlnt['result']['location']);
            if($latlntUpdate!=null){
                $args['lat_lnt_Info'] = $latlntUpdate;
                $data = array(
                    'table' => 'city',
                    'value' => $args,
                    'query' => array(array('AND','id = :id', 'id', $val['id']))
                );
                if(!$this->db->updateElement($data)){
                    $message = array(
                        'statusCode' => 300,
                        "message" => "市经纬度更新出现问题！",
                    );
                }
            }
        }
        $message = array(
            'statusCode' => 200,
            "message" => "省市经纬度更新成功！",
        );
        exit(json_encode($message));

    }

    /**
     * 供应商地图信息 - xiliheng-20180914
     * http://localhost/yigou/index.php?user-company-index-map_info
     */
    public function map_info()
    {
        $noData = $this->ev->get("noData");//请求不需要数据标识
        $queryTopcatId = $this->ev->get('topcateId');//供货范围-顶级id
        $queryfathercateId = $this->ev->get('fathcateId');//供货范围-二级id
        $queryCateId = $this->ev->get('catId');//供货范围，三级id
        $queryUserType = $this->ev->get('userType');//供货商类型
        $queryProvince = $this->ev->get("province");//省
        $queryCity = $this->ev->get("city");//市
        $page = $this->ev->get('page');
        if($noData == -1){
            $message = [
                'statusCode' => 200,
                "message" => "OK",
                "locationArr" => []
            ];
            echo json_encode($message);exit;
        }
        //根据上一级获取相应的二级和三级列表-xiliheng-20180829
        $secondCateArr = [];
        $thirdCateArr = [];
        if (!empty($queryfathercateId))
        {
            //请求三级分类，判断参数为fathercateId
            //这时候要获取所有的二级，以及当前指定二级的三级
            $secondCateArr = $this->category->getCateByFatherId($queryTopcatId);
            //给当前选择的二级标签设置标志
            foreach ($secondCateArr as &$secondRecord)
            {
                $secondRecord['isSet'] = $secondRecord['catid']==$queryfathercateId ? 1 : 9;
            }

            $thirdCateArr = $this->category->getCateByFatherId($queryfathercateId);
            $secondCateArr = array_column($secondCateArr, NULL, 'catid');
            $thirdCateArr = array_column($thirdCateArr, NULL, 'catid');
        }
        elseif (!empty($queryTopcatId))
        {
            //请求二级分类，判断参数为顶级id
            $secondCateArr = $this->category->getCateByFatherId($queryTopcatId);
            $secondCateArr = array_column($secondCateArr, NULL, 'catid');
        }

        //获取一级分类 - xiliheng20180829
        $catname = '';
        $parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
        if (!empty($parentcat))
        {
            foreach ($parentcat as &$parentRecord)
            {
                $parentRecord['isSet'] = $parentRecord['catid']==$queryTopcatId ? 1 : 9;
            }
        }
        //获取当前登录的用户信息
        $userinfoarr = $this->user->getUserById($this->_user['sessionuserid']);

        //拼接查询字段-供货商类型
        $queryArr = [];
        $args = array();
        $args[] = array("AND","users_role = :users_role",'users_role',0);
        //拼接查询字段-供货商范围
        $userCategorys = null;
        $queryThirdCateIds = [];
        if (!empty($queryCateId) && !empty($queryfathercateId) && !empty($queryTopcatId))
        {
            $userCategorys = $this->collect->getDataByUserstype($queryCateId);
            $queryArr['topcateId'] = $queryTopcatId;
            $queryArr['fathcateId'] = $queryfathercateId;
            $queryArr['catId'] = $queryCateId;
            if (!empty($thirdCateArr))
            {
                foreach ($thirdCateArr as &$thirdRecord)
                {
                    $thirdRecord['isSet'] = $thirdRecord['catid']==$queryCateId ? 1 : 9;
                }
            }
            $queryThirdCateIds[] = $queryCateId;
        }
        elseif(!empty($queryfathercateId) && !empty($queryTopcatId))
        {
            //二级分类
            //获取下属的所有三级分类
            $fatherCate = $this->category->getCateByFatherId($queryfathercateId);
            $fatherIds = array_column($fatherCate, 'catid');
            $queryThirdCateIds = $fatherIds;
            $userCategorys = $this->collect->getDataByUserstype($fatherIds);
            $queryArr['topcateId'] = $queryTopcatId;
            $queryArr['fathcateId'] = $queryfathercateId;
        }
        elseif (!empty($queryTopcatId))
        {
            //获取二级分类
            $fatherCate = $this->category->getCateByFatherId($queryTopcatId);
            $fatherIds = array_column($fatherCate, 'catid');

            //获取三级分类信息
            $userCategorys = $this->category->getCateByFatherId($fatherIds);
            $catIdArr = array_column($userCategorys, 'catid');
            $queryThirdCateIds = $catIdArr;
            $userCategorys = $this->collect->getDataByUserstype($catIdArr);
            $queryArr['topcateId'] = $queryTopcatId;
        }

        //根据供货商查询
        $isJoin = '';
        if (!empty($queryThirdCateIds))
        {
            $isJoin = 'user_category';
            $queryThirdCateIds = implode(',', $queryThirdCateIds);
            $args[] = array('AND',"user_category.cate_id in ({$queryThirdCateIds})");
            $args[] = array('AND','user_category.user_id = user.userid');

            //查询供货商类型
            if ($queryUserType)
            {
                $args[] = array("AND", "user.users_type = {$queryUserType}");
                $queryArr['userType'] = $queryUserType;
            }


            //拼接省市 - 供货范围
            if (!empty($queryProvince))
            {
                $queryProString = "user.company_province = {$queryProvince} ";
                $queryArr['province'] = $queryProvince;
                if (!empty($queryCity))
                {
                    $queryProString .= " AND  user.company_city = {$queryCity} ";
                    $queryArr['city'] = $queryCity;
                }

                $args[] = array("AND", $queryProString);
            }

            //查询内容
            if (!empty($query))
            {
                $args[] = ["AND", "user.company_name like '%{$query}%'"];
                $queryArr['query'] = $query;
            }
        }
        else
        {
            //查询供货商类型
            if ($queryUserType)
            {
                $args[] = array("AND", "users_type = {$queryUserType}");
                $queryArr['userType'] = $queryUserType;
            }
            //拼接省市 - 供货范围
            if (!empty($queryProvince))
            {
                $queryProString = "company_province = {$queryProvince} ";
                $queryArr['province'] = $queryProvince;
                if (!empty($queryCity))
                {
                    $queryProString .= " AND  company_city = {$queryCity} ";
                    $queryArr['city'] = $queryCity;
                }

                $args[] = array("AND", $queryProString);
            }

            //查询内容
            if (!empty($query))
            {
                $args[] = ["AND", "company_name like '%{$query}%'"];
                $queryArr['query'] = $query;
            }
        }
        $userInfo=$this->collect->getUserListWithQuery($page,1000000000,$args, 'userid DESC', $queryArr, $isJoin);
        //获取供应商信息
        $userLatLntInfo = array();
        foreach ($userInfo['data'] as $k=>$item){
            $sql = 'SELECT * FROM `x2_city` where `cityid`='.$item['company_city'];
            $data['sql'] = $sql;
            $date['v'] = array();
            $cityinfo = $this->db->fetch($data,false);
            if($cityinfo['lat_lnt_Info']!=null){
                $arr_info = json_decode($cityinfo['lat_lnt_Info'],true);
                $arr_info['name'] = $item['company_name'];
                $arr_info['id'] = $item['userid'];
                $jsonStr = json_encode($arr_info);
                $userLatLntInfo[] = json_decode($jsonStr);
            }
        }
        if($userLatLntInfo)
        {
            $message = [
                'statusCode' => 200,
                "message" => "Ok",
                'locationArr' => $userLatLntInfo
            ];

        }
        else
        {
            $message = [
                'statusCode' => 300,
                "message" => "获取供应商信息失败！",
                "locationArr" => []
            ];
        }
        echo json_encode($message);
    }

    /**
     * 供应商地图-xiliheng20180914
     */
    public function company_maps()
    {
        //供应商分类
        $suplier_fanwei = [
            ['text'=>'普通供应商', 'value'=>1],
            ['text'=>'合格供应商', 'value'=>2],
            ['text'=>'战略供应商', 'value'=>3],
            ['text'=>'黑名单供应商', 'value'=>4],
            ['text'=>'待复核供应商', 'value'=>5],

        ];
        //供应商顶级范围
        $parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
        //http://localhost/yigou/index.php?user-app-register-ajaxCategory&catid=111
        //获取当前登录用户信息
        $userid = $this->_user['sessionuserid'];
        $userInfo = $this->content->getCompanyById($userid);
        //获取省份信息
        $data = $this->collect->getProvinceList();
        $this->tpl->assign('suplier_fanwei', $suplier_fanwei);
        $this->tpl->assign('role',intval($userInfo['users_role']));
        $this->tpl->assign('parentcat', $parentcat);
        $this->tpl->assign('data', $data);
        $this->tpl->display('company_maps');
    }
    /**
     *  获取分类的数据 ajax请求
     *  zhy20180918
     */
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
    /**
     * 获取城市信息
     * zhy20180918
     */
    public function getCityByFather(){

        $fid = $this->ev->get('fid');
        $cityInfo = $this->collect->getCityByFather($fid);
        exit(json_encode($cityInfo));
    }

    /**
     * 供应商评论后台列表
     */
    private function evaluate_list()
    {
        $page = intval($this->ev->get('page'));
        $supplier_name = $this->ev->get('supplier_name');   //公司名称
        $project_name  = $this->ev->get('project_name');    //项目名称搜索
        $eval_level = intval($this->ev->get('eval_level'));   //评价等级
        $company_type = intval($this->ev->get('company_type'));   //供应商类别
        $contract_name = $this->ev->get('contract_name');   //标段名称
        $class_type  = $this->ev->get('class_type');   //一级分类
        $eval_cate  = $this->ev->get('eval_cate');   //二级分类

        $args = array();
        $args[] = array('AND','evaluate.eval_cate_id = evaluate_category.id');
        if($supplier_name)$args[] = array("AND","evaluate.supplier_name LIKE :supplier_name",'supplier_name',"%{$supplier_name}%");
        if($project_name)$args[] = array("AND","evaluate.project_name LIKE :project_name",'project_name',"%{$project_name}%");
        if($eval_level)$args[] = array("AND","evaluate.eval_level = :eval_level",'eval_level',$eval_level);
        if($contract_name)$args[] = array("AND","evaluate.contract_name LIKE :contract_name",'contract_name',"%{$contract_name}%");
        if($company_type)$args[] = array("AND","evaluate_category.company_type = :company_type",'company_type',$company_type);
        if($class_type)$args[] = array("AND","evaluate_category.class_type = :class_type",'class_type',$class_type);
        if($eval_cate)$args[] = array("AND","evaluate.eval_cate_id = :eval_cate_id",'eval_cate_id',$eval_cate);

        $data = $this->evaluate->getEvaluateList($args,$page,$number = 15);
        //如果有一级分类，取它下面的二级分类
        if($class_type)
        {
            $eval_cate_arr = $this->evaluate->getCategoryByType($class_type);
        }

        //供应商分类
        $company_type_arr = array(
            1 => '主要类',
            2 => '一般类',
            3 => '零星类'
        );
        //供应商评级
        $leval_arr = array(
            1 => 'A级供应商',
            2 => 'B级供应商',
            3 => 'C级供应商',
            4 => 'D级供应商',
        );
        //评价一级分类
        $class_type_arr = array(
            1 => '物资类',
            2 => '运检类',
            3 => '技术服务类',
            4 => '其他类',
        );

        $page = $page == 0 ? 1: $page;
        $this->tpl->assign('page',$page);
        $this->tpl->assign('data',$data);
        $this->tpl->assign('eval_level',$eval_level);
        $this->tpl->assign('class_type',$class_type);
        $this->tpl->assign('company_type',$company_type);
        $this->tpl->assign('contract_name',$contract_name);
        $this->tpl->assign('project_name',$project_name);
        $this->tpl->assign('supplier_name',$supplier_name);
        $this->tpl->assign('class_type_arr',$class_type_arr);
        $this->tpl->assign('leval_arr',$leval_arr);
        $this->tpl->assign('company_type_arr',$company_type_arr);
        $this->tpl->assign('eval_cate_arr',$eval_cate_arr);
        $this->tpl->assign('eval_cate',$eval_cate);
        $this->tpl->display('evaluate');
    }

    private function evaluateInfo()
    {
        $id = intval($this->ev->get('id'));
        $type = $this->ev->get('t');
        $data = $this->evaluate->getEvaluateByid($id);
        $data['data1'] = json_decode($data['data1']);
        $data['data'][0]['select_0'] = $data['data1'][0]->select_0;
        $data['data'][0]['input_0'] = $data['data1'][0]->input_0;
        $data['data'][1]['select_1'] = $data['data1'][1]->select_1;
        $data['data'][1]['input_1'] = $data['data1'][1]->input_1;
        $data['data'][2]['select_2'] = $data['data1'][2]->select_2;
        $data['data'][2]['input_2'] = $data['data1'][2]->input_2;
        $data['data'][3]['select_3'] = $data['data1'][3]->select_3;
        $data['data'][3]['input_3'] = $data['data1'][3]->input_3;
        $data['data'][4]['select_4'] = $data['data1'][4]->select_4;
        $data['data'][4]['input_4'] = $data['data1'][4]->input_4;
        $data['data'][5]['select_5'] = $data['data1'][5]->select_5;
        $data['data'][5]['input_5'] = $data['data1'][5]->input_5;
        if($type == 1) {
            $data['data'][6]['select_6'] = $data['data1'][6]->select_6;
            $data['data'][6]['input_6'] = $data['data1'][6]->input_6;
            $data['data'][7]['select_7'] = $data['data1'][7]->select_7;
            $data['data'][7]['input_7'] = $data['data1'][7]->input_7;
            $data['data'][8]['select_8'] = $data['data1'][8]->select_8;
            $data['data'][8]['input_8'] = $data['data1'][8]->input_8;
        }
        $data['cut_score'] = json_decode($data['cut_score']);

        $this->tpl->assign('data',$data);
        $this->tpl->assign('type',$type);
        $this->tpl->display('evaluate_info');
    }
    /**
     * 风场信息 - zhy
     * http://localhost/yigou/index.php?user-company-index-wind_info
     */
    public function wind_info()
    {
        $sql = 'SELECT * FROM `x2_wind_field`';
        $data['sql'] = $sql;
        $date['v'] = array();
        $windInfo = $this->db->fetchAll($data,false);
        $jsonStr = json_encode($windInfo);
        $wind_field_info = json_decode($jsonStr);

        echo json_encode($wind_field_info);

    }

}
?>
