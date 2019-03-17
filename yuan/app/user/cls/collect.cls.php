<?php
/**
  *  create   YJC
  *  @action  收藏功能
  *  @time    2018-8-6
  */
class collect_user
{
    public $G;
    public $docTypeMapping = [
        1 => 'comment', //评论
        2 => 'project',//项目
        3 => 'remark',//备注
    ];

    public $docNumNameMapping = [
        1 => 'comnum', //评论
        2 => 'projectnum',//项目
        3 => 'remarknum',//备注
    ];

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function _init()
    {
        $this->sql = $this->G->make('sql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
        $this->user = $this->G->make('user', 'office');
        $this->pdosql = $this->G->make('pdosql');
        $this->session = $this->G->make('session');
    }

    /*
     * @action   商品收藏列表  master
     * @param    uid    string
     * @param    $data  array
     * @param    type   商品
     */
    public function getUserByUserName($uid,$orderby="createtime DESC")
    {
        $data = array(false,
                array('goodscollect','goods'),
                array(
                    array('AND',"goodscollect.collectuid = ".$uid),
                    array('AND','goodscollect.collectgoodsid = goods.goodsid'),
                    array("AND","goodscollect.collecttype = ".'1')
                    ),$orderby);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql,false);
    }
    /*
     * @action   供应商收藏列表  master
     * @param    $data   array   return
     * @param    string  $uid
     * @param    type    供应商
    */
    public function getCompanycollect($uid,$orderby="createtime DESC")
    {
        $data = array(false,
                       array('goodscollect','user'),
                       array(
                           array('AND' , 'goodscollect.collectuid ='.$uid),
                           array('AND' , 'goodscollect.collectgoodsid = user.userid'),
                           array('AND','goodscollect.collecttype ='.'2')
                       ),$orderby);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql,false);
    }
    /*
     * @action   商品记录添加
     * @param    $args   array
     * @param    return     $r   array
     */
    public function addGoodsrecord($args)
    {
        $r = $this->db->insertElement(array('table' => 'goodscollect','query' => $args));
        return $r;
    }
    /*
     * @action   商品记录列表数据
     * @param    type   int      类型id区分
     * @param    uid    string   用户id
     * @param    goodid  int     商品id
     * @param    return    array   $r
     */
    public function getGoodsList($types,$uid,$goodid)
    {
        $data = array();
        $sql = "select * from `x2_goodscollect` where collecttype=$types and collectuid=$uid and collectgoodsid=$goodid limit 1";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data,false);
        return $r;
    }
//--------------------------商品收藏调用方法--------------------------- 

    /*
     * @action   删除 商品记录表 one
     * @param    $cid   int   记录主键id
     * @param    $type  int   区分类型  1代表商家/2代表供应商
     * @param    $sql   array   数据返回
     */
    public function delCollectById($cid,$type)
    {
        $data = array('goodscollect',
                      array(
                          array('AND',"collectid = :collectid",'collectid',$cid),
                          array('AND',"collecttype = :collecttype",'collecttype',$type)
                      ));
        $sql = $this->pdosql->makeDelete($data);
        return $this->db->exec($sql);
    }

    /*
     * @action  商品取消   数量减一
     * @param   $goodid   int
     * @param   $number   int
     * @param   return    $r  Goodscollectminus
     */
    public function Goodscollectminus($goodid,$number)
    {
        $p = $this->GoodsCollectnum($goodid);
        $nnum = $p['goodsnum'] - $number;
        $args = array("goodsnum" =>$nnum);
        $data = array(
            'table' => 'goods',
            'value' => $args,
            'query' => array(array("AND","goodsid = :goodsid",'goodsid',$goodid))
        );
        return $this->db->updateElement($data);
        // $data = array('goods',$argsd,array("goodsnum = : goodsnum",'goodsnum',$nnum),"goodsid = '{$goodid}'");
        // $sql = $this->pdosql->makeUpdate($data);
        // $r = $this->db->exec($sql);
        // return $r;
    }

    /*
     * @action  商品关注 数量加一
     * @param   $goodid   int
     * @param   $number   int
     * @param   return    $r  Goodscollectminus
     */
    public function Goodscollectadd($goodid,$number)
    {
        $p = $this->GoodsCollectnum($goodid);
        $nnum = $p['goodsnum'] + $number;
        $args = array("goodsnum" =>$nnum);
        $data = array(
            'table' => 'goods',
            'value' => $args,
            'query' => array(array("AND","goodsid = :goodsid",'goodsid',$goodid))
        );
        return $this->db->updateElement($data);
        // $data = array('goods',array("goodsnum"=>$nnum),"goodsid='{$goodid}'");
        // $sql = $this->pdosql->makeUpdate($data);
        // $r = $this->db->exec($sql);
        // return $r;
    }

    /*
     * @action   商品表  单条数据
     */
    public  function GoodsCollectnum($goodid)
    {
        $data = array();
        $sql = 'SELECT * FROM `x2_goods` where `goodsid`='.$goodid;
        $data['sql'] = $sql;
        $data['v'] = array();
        return $this->db->fetch($data,false);
    }

//--------------------------供应商收藏调用方法--------------------------- 

    /**
     * @action   供应商数据展示（用户表）
     * @param    $userid   
     * @param    $sql 
     */
    public function companyCollect($userid)
    {
        $data = array();
        $sql = 'SELECT * FROM `x2_user` where `userid`='.$userid;
        $data['sql'] = $sql;
        $date['v'] = array();
        return $this->db->fetch($data,false);
    }
    /**
     * @action  供应商关注 数量加一
     * @param   $goodid   int
     * @param   $number   int
     * @param   return    $r  companycollectadd
   */
    public function companycollectadd($userid,$number)
    {
        $p = $this->companyCollect($userid);
        $nnum = $p['company_num'] + $number;
        $args = array("company_num" => $nnum);
        $data = array(
            'table' => 'user',
            'value' => $args,
            'query' => array(array("AND","userid = :userid",'userid',$userid))
        );
        return $this->db->updateElement($data);
    }

    /**
     * @action  供应商关注 数量减一
     * @param   $goodid   int
     * @param   $number   int
     * @param   return    $r  Goodscollectminus
     */
    public function companycollectminus($userid,$number)
    {
        $p = $this->companyCollect($userid);
        $nnum = $p['company_num'] - $number;
        $args = array("company_num" => $nnum);
        $data = array(
            'table' => 'user',
            'value' => $args,
            'query' => array(array("AND","userid = :userid",'userid',$userid))
        );
        return $this->db->updateElement($data);
    }
    /**
     * @action  供应商省，市信息
     * @param   $goodid   int
     */
    public function getCityInfo($provinceid,$cityid,$areaid=null)
    {
        //获取省
        $sql = 'SELECT * FROM `x2_province` where `provinceid`='.$provinceid;
        $data['sql'] = $sql;
        $date['v'] = array();
        $provinceInfo = $this->db->fetch($data,false);
        //获取市
        $sql = 'SELECT * FROM `x2_city` where `cityid`='.$cityid;
        $data['sql'] = $sql;
        $date['v'] = array();
        $cityinfo = $this->db->fetch($data,false);
        //获取区
        if(!empty($areaid)){
            $sql = 'SELECT * FROM `x2_cityarea` where `areaid`='.$areaid;
            $data['sql'] = $sql;
            $date['v'] = array();
            $areainfo = $this->db->fetch($data,false);
        }
        $cityInfostr = '未填写';
        if(empty($areaid)){
            if(!empty($provinceInfo) && !empty($cityinfo)){
                $cityInfostr = $provinceInfo['province'].','.$cityinfo['city'];
            }
        }else{
            $cityInfostr = $provinceInfo['province'].''.$cityinfo['city'].''.$areainfo['area'];
        }
        return $cityInfostr;
    }

    /**
     *  @action  
     */
      /**
     * @action  供应商修改  update
     * @param   $uid  int
     * @param   $companyid   int
     */
    public function updateCompany($uid,$users_type)
    {
        $args['users_type'] = $users_type;
        $args['istrue_updatetime'] = time();
        $data = array(
            'table' => 'user',
            'value' => $args,
            'query' => array(array('AND','userid = :userid','userid',$uid))
        );
        return $this->db->updateElement($data);
    }
    /**
     *  @action
     */
    /**
     * @action  供应商修改  update
     * @param   $uid  int
     * @param   $companyid   int
     */
    public function updateCompanyStatus($uid,$status)
    {
        $args['company_istrue'] = $status;
        $args['istrue_time'] = time();
        $data = array(
            'table' => 'user',
            'value' => $args,
            'query' => array(array('AND','userid = :userid','userid',$uid))
        );
        return $this->db->updateElement($data);
    }

    /**
     * @action  select 现场评价 合作项目 备注
     */
    public function addDocment($args)
    {
        $r = $this->db->insertElement(array('table' => 'docment','query' => $args));
        return $r;
    }

    /**
     * @param $page
     * @param int $number
     * @param $args
     * @param string $orderby
     * @return array
     * 遍历获取三种文档的数量-xlh20180826
     */
    public function getUserList($page,$number = 20,$args, $orderby = 'userid DESC', $query = [])
    {
        $page = $page > 0?$page:1;
        $r = array();
        $data = array(false,'user',$args,false,$orderby,array(intval($page-1)*$number,$number));

        $sql = $this->pdosql->makeSelect($data);
        $r['data'] = $this->db->fetchALL($sql,false,'userinfo');

        foreach ($r['data'] as $key=> &$val)
        {
            foreach ($this->docNumNameMapping as $doctype => $typevalue)
            {
                $comunm = $this->getNumuser($doctype,$val['userid']);
                $comunm = $comunm[0]['compnum'];
                $val[$typevalue] = $comunm; 
            }
        }

        $data = array('COUNT(*) AS number','user',$args,false,false,false);
        $sql = $this->pdosql->makeSelect($data);
        $tmp = $this->db->fetch($sql);
        $r['number'] = $tmp['number'];
        $pages = $this->pg->outPageWithQuery($this->pg->getPagesNumber($tmp['number'],$number),$page, false, "&page=", $query);
        $r['pages'] = $pages;
//        $r['companynum']=$comnum;
        return $r;
    }

    /**
     * @param $page
     * @param int $number
     * @param $args
     * @param string $orderby
     * @return array
     * 遍历获取三种文档的数量-xlh20180826
     */
    public function getUserListWithQuery($page,$number = 20,$args, $orderby = 'userid DESC', $query = [], $joinTable = '')
    {
        $page = $page > 0?$page:1;
        $r = array();

        $data = array(false,"user",$args,false,$orderby,array(intval($page-1)*$number,$number));
        if (!empty($joinTable))
        {
            $data = array(false,array("$joinTable", 'user'),$args,'userid',$orderby,array(intval($page-1)*$number,$number));
        }

        $sql = $this->pdosql->makeSelectInJoin($data, NULL, 'right');
        $r['data'] = $this->db->fetchALL($sql,false,'userinfo');

        foreach ($r['data'] as $key=> &$val)
        {
            foreach ($this->docNumNameMapping as $doctype => $typevalue)
            {
                $comunm = $this->getNumuser($doctype,$val['userid']);
                $comunm = $comunm[0]['compnum'];
                $val[$typevalue] = $comunm;
            }
            if (!empty($val['istrue_updatetime']))
            {
                $val['istrue_updatetime'] = date('Y-m-d', $val['istrue_updatetime']);
            }
            else
            {
                $val['istrue_updatetime'] = date("Y-m-d", $val['userregtime']);
            }
        }

        $data = array('COUNT(*) AS number','user',$args,false,false,false);
        $sql = $this->pdosql->makeSelect($data);
        $tmp = $this->db->fetch($sql);
        $r['number'] = $tmp['number'];
        $pages = $this->pg->outPageWithQuery($this->pg->getPagesNumber($tmp['number'],$number),$page, false, "&page=", $query);
        $r['pages'] = $pages;
//        $r['companynum']=$comnum;
        return $r;
    }

    /**
     *  select count(*) from x2_docment where doc_uids = 60;
     * 设置状态-xlh20180828
     * 0：默认，正常文档
     * 9：删除文档
     */
     public function getNumuser($type,$uid)
     {
         $data = array();
         $sql = "select count(doc_id) as compnum  from x2_docment where doc_type=$type and doc_uids = $uid and doc_status = 0";
         $data['sql'] = $sql;
         $data['v'] = array();
         $r['comnum'] = $this->db->fetchAll($data,false);
         return $r['comnum'];
     }

    /**
     * 获取文章列表 - xlh-20180827
     * 对文章进行分类
     * @param $args
     * @param string $orderby
     * @return array
     */
    public function getDocuments($args, $orderby = 'doc_id DESC')
    {
        $result = [];
        
        $data = array(false,'docment',$args,false,$orderby);
        $sql = $this->pdosql->makeSelect($data);
        $documents = $this->db->fetchALL($sql,false,'userinfo');

        if (!empty($documents))
        {
            //获取doc_uid的值
            $uids = array_column($documents, 'doc_uid');
            $uids  = array_unique($uids);
            $userArr = $this->getUsersByUid($uids, ['userid', 'username']);
            $userArr = array_column($userArr, null, 'userid');

            //设置数组下标
            $documents = array_column($documents, null, 'doc_id');
            foreach ($documents as $key => $value)
            {
                if ($value['doc_type'] == 3)
                {
                    $value['doc_url'] = stripslashes($value['doc_url']);
                    $value['doc_title'] = $value['doc_url'];
                }
                $value['doc_time'] = date("Y-m-d H:i:s", $value['doc_time']);
                $value['username'] = $userArr[$value['doc_uid']]['username'];
                $result[$this->docTypeMapping[$value['doc_type']]][] = $value;
            }
        }

        return $result;
    }

    public function getUsersByUid($uids, $filters = [])
    {

        if (empty($uids))
        {
            return [];
        }
        if (is_array($filters))
        {
            $filters = implode(',', $filters);
        }
        if (is_array($uids))
        {
            $uids = implode(',', $uids);
        }

        $args = array();
        $args[] = array("AND", "userid in ({$uids})");
        $data = array("{$filters}",'user',$args,false,'userid DESC', false);
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchALL($sql,false);
    }

    /**
     * 根据cate_id获取指定供应商类型的用户记录-xlh20180828
     * @param array $usersTypeArr
     * @return null
     */
    public function getDataByUserstype($usersTypeArr)
    {
        if (empty($usersTypeArr))
        {
            return null;
        }
        if (is_array($usersTypeArr))
        {
            $usersTypeArr = implode(',', $usersTypeArr);
        }

        $args = array();
        $args[] = array("AND", "cate_id in ({$usersTypeArr})");
        $data = array(false,'user_category',$args,"id DESC");
        $sql = $this->pdosql->makeSelect($data);

        return $this->db->fetchALL($sql);
    }

    /**
     * 删除指定的文档 - xlh20180828
     * @param $docId
     * @return mixed
     */
    public function delDocments($docId)
    {
        $args['doc_status'] = 9;
        $data = array(
            'table' => 'docment',
            'value' => $args,
            'query' => array(array('AND','doc_id = :doc_id', 'doc_id', $docId))
        );
        return $this->db->updateElement($data);
    }

    /**
     * 获取省级信息列表-xiliheng-20180913
     * @param int $selectedId
     * @return
     */
    public function getProvinceList($selectedId = 0)
    {
        $data = array(false,'province');
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetchAll($sql);

        foreach ($r as &$value)
        {
            $value['isSet'] = $value['provinceid'] == $selectedId ? 1 : 9;
        }

        return $r;
    }

    /**
     * @param $parent
     * 获取指定省份得市信息-2018-09-13
     * @param int $selectedId
     * @return
     */
    public function getCityByFather($parent, $selectedId = 0)
    {
        $args = array();
        $args[] = array("AND","father = :father","father",$parent);
        $data = array(false,'city',$args);
        $sql = $this->pdosql->makeSelect($data);
        $result = $this->db->fetchAll($sql);

        foreach ($result as &$value)
        {
            $value['isSet'] = $value['cityid'] == $selectedId ? 1 : 9;
        }

        return $result;
    }

    /**
     *  获取指定城市区/县信息-2018-0913
     * @param $parent
     * @param int $selectedId
     * @return
     */
    public function getAreaByCity($parent, $selectedId = 0)
    {
        $args = array();
        $args[] = array("AND","father = :father","father",$parent);
        $data = array(false,'cityarea',$args);
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetchAll($sql);

        foreach ($r as &$value)
        {
            $value['isSet'] = $value['areaid'] == $selectedId ? 1 : 9;
        }

        return $r;
    }


    // 修改所属部门
    public function updateCompanybranch($uid,$checkbranch)
    {
        $args['users_branch'] = $checkbranch;
        $data = array(
            'table' => 'user',
            'value' => $args,
            'query' => array(array('AND','userid = :userid','userid',$uid))
        );
        return $this->db->updateElement($data);
    }

    // 修改综合评价
    public function updateSupliergrade($uid,$checkGrade)
    {
        $args['users_grade'] = $checkGrade;
        $data = array(
            'table' => 'user',
            'value' => $args,
            'query' =>array(array('AND' , 'userid = :userid' , 'userid' , $uid))
            );
        return  $this->db->updateElement($data);
    }

    //循环评分总之
    public function countNum($num)
    {   
        /**
          *大于等于95，五星；
          *85-94，四星；
          *75-84，三星；
          *65-74，二星；
          *60-64一星半；  
          *56-59一星；
          *小于等于55，半星
        */ 
        $n = '0';
        $a = '55';
        $b = '60';
        $c = '65';
        $d = '75';
        $e = '85';
        $f = '95';
        if($num==$n){
            return "0";
        }elseif($num<$a){ //半星
            return "1";
        } elseif($num-$a>=0 && $b-$num>0){  
            return "2";
        } elseif($num-$b>=0 && $c-$num>0){  
            return "3";
        } elseif($num-$c>=0 && $d-$num>0){
            return "4";
        } elseif($num-$d>=0 && $e-$num>0){
            return "5";
        } elseif($num-$e>=0 && $f-$num>0){
            return "6";
        } else{
            return '7';
        }
    }


}