<?php

class item_item
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }
    public function _init()
    {
        $this->sql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pdosql = $this->G->make('pdosql');
        $this->ev = $this->G->make('ev');
        $this->files = $this->G->make('files');
        $this->category = $this->G->make('category');
    }
    public function addAskitem($args)
    {
        return $this->db->insertElement(array('table' => 'askitem','query' => $args));
    }
    public function listAskitem($args,$page,$number = 10,$order = "askitemid desc")
    {
        $args[] = array("AND","askitemitemid = itemid");
        $args[] = array("AND","goodsid = itemgoodsid");
        $data = array(
            'select' => false,
            'table' => array('askitem','item','goods'),
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }
    public function getGoodsSystemProperty($id)
    {
        $this->module = $this->G->make('module');
        $this->category = $this->G->make('category');
        $goods = $this->getGoodsById($id);
        $items = $this->getItemsByArgs(array(array("AND","itemgoodsid = :itemgoodsid",'itemgoodsid',$id),array('AND','itemstatus = 1')));
        $cat = $this->category->getCategoryById($goods['goodscatid']);
        $moduleid = $cat['catmoduleid'];
        $module = $this->module->getModuleById($moduleid);
        $fields = $this->module->getMoudleFields($moduleid,1);
        $outfields = array();
        $outitems = array();
        foreach($fields as $p)
        {
            if($p['fieldsystem'])
            {
                $outfields[$p['field']] = $p;
                $outfields[$p['field']]['pars'] = array();
                foreach($items as $tmp)
                {
                    if(!in_array($tmp[$p['field']],$outfields[$p['field']]['pars']))
                    {
                        $outfields[$p['field']]['pars'][] = $tmp[$p['field']];
                        $outfields[$p['field']]['img'][] = $tmp['itemthumb'];
                    }
                }
            }
        }
        foreach($items as $tmp)
        {
            $tp = array();
            foreach($outfields as $key => $p)
            {
                $tp[$key] = $tmp[$key];
            }
            $outitems[$tmp['itemid']] = array('itemid' => $tmp['itemid'],'itemprice' => $tmp['itemprice'],'pars' => $tp,'number' => $tmp['itemnumber']);
        }
        return array('fields' => $outfields,'items' => $outitems);
    }
    public function getGoodsSystemPropertyApi($id)
    {
        $this->module = $this->G->make('module');
        $this->category = $this->G->make('category');
        $goods = $this->getGoodsById($id);
        $items = $this->getItemsByArgs(array(array("AND","itemgoodsid = :itemgoodsid",'itemgoodsid',$id),array('AND','itemstatus = 1')));
        $cat = $this->category->getCategoryById($goods['goodscatid']);
        $moduleid = $cat['catmoduleid'];
        $module = $this->module->getModuleById($moduleid);
        $fields = $this->module->getMoudleFields($moduleid,1);
        $outfields = array();
        $outitems = array();
        foreach($fields as $p)
        {
            if($p['fieldsystem'])
            {
                $outfields[$p['field']] = $p;
                $outfields[$p['field']]['pars'] = array();
                foreach($items as $tmp)
                {
                    if(!in_array($tmp[$p['field']],$outfields[$p['field']]['pars']))
                    {
                        $outfields[$p['field']]['pars'][] = $tmp[$p['field']];
                        $outfields[$p['field']]['img'][] = $tmp['itemthumb'];
                    }
                }
            }
        }
        foreach($items as $tmp)
        {
            $tp = array();
            foreach($outfields as $key => $p)
            {
                $tp[$key] = $tmp[$key];
            }
            $outitems[] = array('itemid' => $tmp['itemid'],'itemcusprice' => $tmp['itemcusprice'],'itemprice' => $tmp['itemprice'],'pars' => $tp,'number' => $tmp['itemnumber'],'limit_number' => $tmp['limit_number']);
        }
        return array('fields' => $outfields,'items' => $outitems);
    }
    public function getGoodsHistory($goodsid)
    {
    	$data = array('goodshistory,goodstitle','goods',array(array("AND","goodsid = :goodsid",'goodsid',$goodsid)));
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql,'goodshistory');
    }
	public function recordGoodsHistory($goodsid,$info)
	{
		$history = $this->getGoodsHistory($goodsid);
		$history = $history['goodshistory'];
		if(!$history)$history = array();
		$history[] = array('info' => $info,'time' => TIME);
		$data = array(
            'table' => 'goods',
            'value' => array('goodshistory' => $history),
            'query' => array(array("AND","goodsid = :goodsid",'goodsid',$goodsid))
        );
        return $this->db->updateElement($data);
	}
    public function addGoods($args)
    {
        return $this->db->insertElement(array('table' => 'goods','query' => $args));
    }
    //商品草稿添加
    public function addDraftGoods($args)
    {
        return $this->db->insertElement(array('table' => 'goods_draft','query' => $args));
    }
    public function modifyGoods($id,$args)
    {
        $data = array(
            'table' => 'goods',
            'value' => $args,
            'query' => array(array("AND","goodsid = :goodsid",'goodsid',$id))
        );
        return $this->db->updateElement($data);
    }
    //更新商品草稿信息
    public function modifyDraftGoods($id,$args)
    {
        $data = array(
            'table' => 'goods_draft',
            'value' => $args,
            'query' => array(array("AND","draftid = :draftid",'draftid',$id))
        );
        return $this->db->updateElement($data);
    }
    public function delGoods($id)
    {
        return $this->db->delElement(array('table' => 'goods','query' => array(array("AND","goodsid = :goodsid",'goodsid',$id))));
    }
    //商品草稿删除
    public function delDraftGoods($id)
    {
        return $this->db->delElement(array('table' => 'goods_draft','query' => array(array("AND","draftid = :draftid",'draftid',$id))));
    }
    public function listGoods($args,$page,$number = 10,$order = "goodssequence desc,goodsid desc")
    {
        //$args[] = array("AND","goodsminprice > 0");
        $data = array(
            'select' => false,
            'table' => 'goods',
            'query' => $args,
            'orderby' => $order,
            'serial' => array('goodsphotos','goodsproperty')
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }
    //获取草稿列表
    public function listDraftGoods($args,$page,$number = 10,$order = "goodssequence desc,goodsid desc")
    {
        $data = array(
            'select' => false,
            'table' => 'goods_draft',
            'query' => $args,
            'orderby' => $order,
            'serial' => array('goodsphotos','goodsproperty')
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }
    public function listBrandGoods($args,$page,$number = 20,$order = "goodsid desc")
    {
        $data = array(
            'select' => false,
            'table' => array('goods','brand'),
            'query' => $args,
            'orderby' => $order,
            'serial' => array('goodsphotos','goodsproperty')
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }
    //货品上架
    public function goodsUp($goodsid)
    {

    }
    public function getGoodsById($id)
    {
        $data = array(false,'goods',array(array("AND","goodsid = :goodsid",'goodsid',$id)));
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql,array('goodsphotos','goodsproperty'));
    }
    //根据商品标题和goodsid信息查询草稿表中是否存在 存在返回true 不存在返回false
    public function draftGoodsByTitleAndGid($title,$goodsid)
    {
        $data = array(false,'goods_draft',array(array('AND',"goodsid = :goodsid",'goodsid',$goodsid),array('AND',"goodstitle = :goodstitle",'goodstitle',$title)));
        $sql = $this->sql->makeSelect($data);
        return  $this->db->fetch($sql,array('goodsphotos','goodsproperty'));
    }
    //获取某条草稿信息
    public function getDraftGoodsById($id)
    {
        $data = array(false,'goods_draft',array(array("AND","draftid = :draftid",'draftid',$id)));
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql,array('goodsphotos','goodsproperty'));
    }
    public function getItemList($args,$page,$number = 20,$order = 'itemsequence DESC,itemid DESC')
    {
        $data = array(
            'select' => false,
            'table' => 'item',
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    public function setMaxAndMinPrice($goodsid)
    {
        $data = array("max(itemprice) as maxprice, min(itemprice) as minprice",'item',array(array("AND","itemprice > 0"),array("AND","itemgoodsid = :goodsid",'goodsid',$goodsid)));
        $sql = $this->sql->makeSelect($data);
        $r = $this->db->fetch($sql);
        $args = array('goodsminprice' => $r['minprice'],'goodsmaxprice' => $r['maxprice']);
        $this->modifyGoods($goodsid,$args);
        return true;
    }

    public function getItemsByArgs($args)
    {
        $data = array(false,'item',$args);
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetchAll($sql,'itemid',array('goodsphotos','goodsproperty'));
    }

    public function delItem($id)
    {
        return $this->db->delElement(array('table' => 'item','query' => array(array("AND","itemid = :itemid",'itemid',$id))));
    }

    public function modifyItem($id,$args)
    {
        $data = array(
            'table' => 'item',
            'value' => $args,
            'query' => array(array("AND","itemid = :itemid",'itemid',$id))
        );
        return $this->db->updateElement($data);
    }

    public function addItem($args)
    {
        return $this->db->insertElement(array('table' => 'item','query' => $args));
    }

    public function getBasicItemById($id)
    {
        $data = array(false,'item',array(array("AND","itemid = :itemid",'itemid',$id)));
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    public function modifyBasicItemById($id,$args)
    {
        $data = array('item',$args,array(array("AND","itemid = :itemid",'itemid',$id)));
        $sql = $this->sql->makeUpdate($data);
        return $this->db->exec($sql);
    }

    public function offItemStack($id,$number)
    {
    	$r = $this->getItemById($id);
    	$number = $r['itemnumber'] - $number;
    	return $this->modifyItem($id,array('itemnumber' => $number));
    }

    public function getItemById($id)
    {
        $data = array(false,'item',array(array("AND","itemid = :itemid",'itemid',$id)));
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    public function getNearItemById($id,$catid)
    {
        $r = array();
        $data = array(false,'item',array("itemid < '{$id}'","itemcatid = '{$catid}'"),false,"itemid DESC",5);
        $sql = $this->sql->makeSelect($data);
        $r['pre'] = $this->db->fetchAll($sql);
        $data = array(false,'item',array("itemid > '{$id}'","itemcatid = '{$catid}'"),false,"itemid ASC",5);
        $sql = $this->sql->makeSelect($data);
        $r['next'] = $this->db->fetchAll($sql);
        return $r;
    }

    public function outSaleItem($id,$number)
    {
        $p = $this->getItemById($id);
        $nnum = $p['itemnumber'] - $number;
        $data = array('item',array("itemnumber" => $nnum),array(array("AND","itemid = :itemid",'itemid',$id)));
        $sql = $this->sql->makeUpdate($data);

        return $this->db->exec($sql);
    }

    public function modifySaledItemById($sisid,$args)
    {
        $data = array('saleditems',$args,"sisid = '{$sisid}'");
        $sql = $this->sql->makeUpdate($data);
        return $this->db->exec($sql);
    }

    public function getSaledItemByOsn($ordersn)
    {
        $data = array(false,'saleditems',"sisordersn = '{$ordersn}'");
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetchAll($sql,'sisitemid');
    }

    public function getSaledItemById($sisid)
    {
        $data = array(false,'saleditems',"sisid = '{$sisid}'");
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql);
    }
    public function getGoodsInfoByItem($args,$page,$number = 20)
    {
        $args[] =array("AND","item.itemgoodsid = goods.goodsid") ;
        $data = array(
            'select'=> false,
            'table' => array("item","goods"),
            'query' => $args,
            'serial' => array('goodsphotos','goodsproperty')
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    public function addCommentItem($args)
    {
        $args['cmttime'] = TIME;
        return $this->db->insertElement(array('table' => 'comment','query' => $args));
    }

    public function getCommentItemByArgs($args)
    {
        $data = array(false,'comment',$args);
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    public function getSaledItemCommentList($args,$page,$number = 20,$order = 'cmtid DESC')
    {
        $args[] = "comment.cmtsisid = saleditems.sisid";
        $data = array(
            'select' => false,
            'table' => array('comment','saleditems'),
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    public function getItemCommentList($args,$page,$number = 20,$order = 'cmtid DESC')
    {
        $args[] = array("AND","comment.itemid = item.itemgoodsid");
        $args[] = array("AND"," item.itemgoodsid = goods.goodsid");
        $data = array(
            'select' => false,
            'table' => array('comment','item','goods'),
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    public function delComment($cmtid)
    {
        return $this->db->delElement(array('table' => 'comment','query' => "cmtid = '{$cmtid}'"));
    }

    public function getGoodsList($args,$page,$number = 20,$order = "goodssequence desc,goodsid desc")
    {
        $args[] = array("AND","goodsminprice > 0");
        $data = array(
            'select' => false,
            'table' => 'goods',
            'query' => $args,
            'orderby' => $order,
            'serial' => array('goodsphotos','goodsproperty')
        );
        return $this->db->listElements($page,$number,$data);
    }

    //累计浏览量
    public function updatepageviews($goodsid,$oldpv)
    {
        //$number = rand(1,10);
        $number = 1;
        $args = array("goodspv" =>$oldpv+$number);
        $data = array(
            'table' => 'goods',
            'value' => $args,
            'query' => array(array("AND","goodsid = :goodsid",'goodsid',$goodsid))
        );
        return $this->db->updateElement($data);
    }

    //ios接口
    public function getGoodsListApi($args,$page,$number = 32)
    {
        $data = array(
            'select' => array("goodsid","goodstitle","goodscatid","goodsminprice","goodsmaxprice","goodsthumb","goodstime"),
            'table' => 'goods',
            'query' => $args,
            'orderby' => "goodsmaxprice asc"
        );
        return $this->db->listElements(1,$number,$data);
    }

    //ios接口
    public function getGoodsDetailListApi($args,$page,$number = 32)
    {
        $data = array(
            'select' => array("goodsid","goodstitle","goodscatid","goodsminprice","goodsmaxprice","goodsthumb","goodsphotos","goodsproperty","goodsdescribe","goodsuserid"),
            'table' => 'goods',
            'query' => $args,
            'orderby' => "goodsmaxprice asc",
            'serial' => array('goodsphotos','goodsproperty')
        );

        return $this->db->listElements(1,$number,$data);
    }

    public function getGoodsSalerCategory($args,$page,$number=10)
    {
        $data = array(
            'select' => "distinct(goodssalercatid)",
            'table' => 'goods',
            'query' => $args
        );
        return $this->db->listElements($page,$number,$data);
    }

    //记录浏览最近商品,默认5条,7天缓存时间,$ID是商品id
    function RecentGoods($num=5,$day=7,$id)
    {
        $id = isset($id) ? $id : 0;
        if($id ==0) return false;
        if(isset($_COOKIE['goods']))
        {
            //直接替换
            if($num==1)
            {
                setcookie("goods",$id,time()+3600*$day);
                $datastr = $_COOKIE['goods'];
            }
            else
            {
                $datastr = $_COOKIE['goods'];
                $ids = explode('|',$datastr);
                //在限定记录数以内
                if(count($ids )< $num){
                    //id是否已经存在
                    if(!in_array($id,$ids)){
                        $datastr .= '|'.$id;
                        setcookie("goods",$datastr,time()+3600*$day);
                    }
                }
                else
                {
                    if(!in_array($id,$ids))
                    {
                        $datastr = str_replace($ids[0].'|','',$datastr);
                        $datastr .= '|'.$id;
                        setcookie("goods",$datastr,time()+3600*$day);
                    }
                }

            }
        }
        else
        {
            setcookie("goods",$id,time()+3600*$day);
            @$datastr = $_COOKIE['goods'];
        }
        return $datastr;
    }
    public function setPriceRange()
    {
        //0-29  30-59  60-99  100-149  150-199  200-300
        $arr1 = array(0,30,60,100,150,200);
        $arr2 = array(29,59,99,149,199,300);
        $pricerange = array();
        for($i = 0; $i < count($arr2); $i ++)
        {
            $pricerange[]['range'] = $arr1[$i].'-'.$arr2[$i];
        }
        return $pricerange;
    }

    //判断分类下面是否有商品
    public function judgeCatGoodsIsNull($userid,$catname="",$catid="")
    {
        if($catname != "")
        {
            $data = array("COUNT(*) AS number",'goodscategory',array(array("AND","userid = :userid",'userid',$userid),array("AND","categoryname = :categoryname","categoryname",$catname)));
        }
        else
        {
            $data = array("COUNT(*) AS number",'goods',array(array("AND","goodsuserid = :goodsuserid",'goodsuserid',$userid),array("AND","goodscatid = :goodscatid","goodscatid",$catid)));
        }

        $sql = $this->sql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    public function isMobile(){
        $useragent=isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : '';
        $useragent_commentsblock=preg_match('|\(.*?\)|',$useragent,$matches)>0?$matches[0]:'';
        function CheckSubstrs($substrs,$text){
            foreach($substrs as $substr)
                if(false!==strpos($text,$substr)){
                    return true;
                }
            return false;
        }
        $mobile_os_list=array('Google Wireless Transcoder','Windows CE','WindowsCE','Symbian','Android','armv6l','armv5','Mobile','CentOS','mowser','AvantGo','Opera Mobi','J2ME/MIDP','Smartphone','Go.Web','Palm','iPAQ');
        $mobile_token_list=array('Profile/MIDP','Configuration/CLDC-','160×160','176×220','240×240','240×320','320×240','UP.Browser','UP.Link','SymbianOS','PalmOS','PocketPC','SonyEricsson','Nokia','BlackBerry','Vodafone','BenQ','Novarra-Vision','Iris','NetFront','HTC_','Xda_','SAMSUNG-SGH','Wapaka','DoCoMo','iPhone','iPod');
        $found_mobile=CheckSubstrs($mobile_os_list,$useragent_commentsblock) ||
            CheckSubstrs($mobile_token_list,$useragent);
        if ($found_mobile){
            return true;
        }else{
            return false;
        }
    }

    //判断是否通过微信访问
    function is_weixin(){
        if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
            return true;
        }
        return false;
    }

    //获取指定的商品分类下的商品  徐原提，首页分类顺序的改变
    //$arr1,2,3  列出一级分类下二级分类（二维数组）
    public function getAppointCategoryGoodsList($arr1,$arr2,$arr3)
    {
        //$pcategory = $this->
    }

    /**
     * 商城首页根据分类查询商品
     * @param $args
     * @param $page
     * @param int $number
     * @param string $order
     * @return mixed
     */
    public function listGoodsByCateId($args,$page,$number = 10,$order = "goodssequence desc,goodsid desc")
    {
        $args[] = array("AND","goodsuserid = userid");
        $data = array(
            'select' => false,
            'table' => array('goods','user'),
            'query' => $args,
            'orderby' => $order,
            'serial' => array('goodsphotos','goodsproperty')
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }


    /**
     * 返还商品库存
     * @param int $number
     * @param int $id
     * @return bool
     */

    public function returnSaleItem($id,$number)
    {
        $p = $this->getItemById($id);
        $nnum = $p['itemnumber'] + $number;
        $data = array('item',array("itemnumber" => $nnum),array(array("AND","itemid = :itemid",'itemid',$id)));
        $sql = $this->sql->makeUpdate($data);

        return $this->db->exec($sql);
    }


    /**
     * 查询不同规格属性商品
     * @param $args
     * @param $page
     * @param int $number
     * @param string $order
     * @return mixed
     */
    public function listGoodsByItemField($args,$page,$number = 10,$order = "itemid desc")
    {
        $data = array(
            'select' => false,
            'table' => 'item',
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }


    /**
     * 导出excel
     * @param $strTable 表格内容
     * @param $filename 文件名
     */
    public function downloadExcel($strTable,$filename)
    {
         ob_end_clean();

        ob_start();
        header("Content-type: application/vnd.ms-excel");
        header("Content-Type: application/force-download");
        header("Content-Disposition: attachment; filename=".$filename."_".date('Y-m-d').".xls");
        header('Expires:0');
        header('Pragma:public');
        echo '<html><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />'.$strTable.'</html>';
    }


    /**
     * 导出excel
     * @param $strTable 表格内容
     * @param $filename 文件名
     */
    public function downloadExcelUsername($strTable,$filename,$username)
    {
        ob_end_clean();

        ob_start();
        header("Content-type: application/vnd.ms-excel");
        header("Content-Type: application/force-download");
        header("Content-Disposition: attachment; filename=".$filename."_".$username.".xls");
        header('Expires:0');
        header('Pragma:public');
        echo '<html><meta http-equiv="Content-Type" content="text/html; charset=utf-8" />'.$strTable.'</html>';
    }


   /*
    *  收藏商品列表
    *  @param   time   desc
    *  @param   num    desc
    *  @param   page   分页
    *  @param   data   array
    */
    public function collectlist($args,$page,$number = 10,$order = "goodsnum desc,goodstime desc")
    {
        $data = array(
            'select' => false,
            'table' => 'goods',
            'query' => $args,
            'orderby' => $order,
            'serial' => array('goodsphotos','goodsproperty')
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

    /**
     * [getGoodsAll 获取特定条件的所有商品]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-13
     * @returns  {array}
     * @param    [array]        $args [查询条件]
     * @return   [array]              [返回结果集]
     */
    public function getGoodsAll($args){
        $data = array(false,'goods',$args);
        $sql = $this->sql->makeSelect($data);
        return $this->db->fetchAll($sql);

    }
    /**
     * 获取商品总数或今日新增数 istody为false查总数 否则查今日新增数
     */
    public function getGoodsCount($istody=false)
    {
        $firttime = strtotime(date("Y-m-d 00:00:01"));
        $endtime =  strtotime(date("Y-m-d 23:59:59"));
        $data = array();
        if($istody){
            $sql = 'SELECT count(*) as aa FROM `x2_goods` where  goodstime >='.$firttime.' and goodstime <='. $endtime;
        }else{
            $sql = 'SELECT count(*) as aa FROM `x2_goods` ';
        }
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        if($r['0']['aa']==null){
            return 0;
        }else{
            return $r['0']['aa'];
        }
    }


    /**
     * 根据用户id获取商品及其规格
     * @param $goodsuserid
     * @return mixed
     */
    public function listGoodsAndItem($goodsuserid)
    {
        $data = array();
        $sql = 'SELECT * FROM `x2_goods` where `goodsuserid`='.$goodsuserid;
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        foreach($r as $key => &$val)
        {
            $val['goodsitem'] = $this->getItemsByArgs(array(array("AND","itemgoodsid = :itemgoodsid",'itemgoodsid',$val['goodsid'])));

        }

        return $r;
    }

    /**
     * 根据用户id获取商品，并通过协议id标注出已经加入协议的商品
     * @param $goodsuserid
     * @param $agreementid
     * @return mixed
     */
    public function getGoodsAndAgreementItem($goodsuserid,$agreementid)
    {
        $data = array();
        $sql = 'SELECT * FROM `x2_goods` where `goodsuserid`='.$goodsuserid.' AND `goodsstatus`=1';
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        foreach($r as $key => &$val)
        {
            $val['goodsitem'] = $this->getGoodItemByAgreement(array(array("AND","itemgoodsid = :itemgoodsid",'itemgoodsid',$val['goodsid'])),$agreementid);
        }

        return $r;
    }

    /**
     * 根据商品id获取商品规格，并通过规格id和协议id获取协议商品详情
     * @param $args
     * @param $agreementid
     * @return mixed
     */
    public function getGoodItemByAgreement($args,$agreementid)
    {
        $data = array(false,'item',$args);
        $sql = $this->sql->makeSelect($data);
        $r = $this->db->fetchAll($sql,'itemid');
        foreach($r as $key => &$val)
        {
            $agrItem = $this->getAgreementByItemid($agreementid,$val['itemid']);
            if($agrItem)
            {
                $val['is_agr'] = '1';
                $val['agreement_price'] = $agrItem['agreement_price'];
            }
            else
            {
                $val['is_agr'] = '0';
            }
            //var_dump($val);die;
        }
        return $r;

    }

    /**
     * 根据协议id和规格id取协议商品数据
     * @param $agreementid
     * @param $itemId
     * @return mixed
     */
    public function getAgreementByItemid($agreementid,$itemId)
    {
        $data = array(false,'agreement_goods',array(array("AND","agreementid = :agreementid",'agreementid',$agreementid),array("AND","itemid = :itemid",'itemid',$itemId)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
    }

    /**
     * [listUserGoods 商品用户表联查]
     * @Author    Zhangjianchao
     * @DateTime  2018-12-04
     * @copyright [copyright]
     * @license   [license]
     * @version   [version]
     * @param     [type]      $args   [description]
     * @param     [type]      $page   [description]
     * @param     integer     $number [description]
     * @param     string      $order  [description]
     * @return    [type]              [description]
     */
    public function listUserGoods($args,$page,$number = 10,$order = "goodssequence desc,goodsid desc")
    {

        $args[] = "goods.goodsuserid = user.userid";
        $data = array(
            'select' => false,
            'table' => array('goods','user'),
            'query' => $args,
            'orderby' => $order
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }

}

?>