<?php

class sap_item
{
	public $G;
    protected $apiUrl;

	public function __construct(&$G)
	{
		$this->G = $G;
        //$this->apiUrl = 'http://10.72.14.86:8013'; //test内网
        $this->apiUrl = 'http://114.242.115.106:8013'; //test，映射地址
        //$this->apiUrl = 'http://10.72.3.34:8013';
	}

	public function _init()
	{
		$this->sql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->ev = $this->G->make('ev');
	}

    //sap采购订单
    public function addSapOrder($ordersn,$userid)
    {
        //return true;
        /*$data['ordersn'] = '201808011519371819028';
        $data['buyerid'] = '1';
        $data['sellerid'] = '18';
        $data['param'] = '{"is_header":{"ebeln":"201808011519371819028","bukrs":"6001","lifnr":"20000040","ekorg":"6000","ekgrp":"I58","zterm":"DP00","dppct":"0","bedat":"2018-08-01","reserve_f1":"1576.00"},"it_item":[{"ebeln":"201808011519371819028","ebelp":"10","pstyp":"0","ewerk":"A001","ematn":"10031098","matkl":"3200270","menge":"1","meins":"EA","mwskz":"D1","txz01":"\u6d4b\u8bd5\u5546\u54c12","netpr":"767.52"},{"ebeln":"201808011519371819028","ebelp":"20","pstyp":"0","ewerk":"A001","ematn":"10004443","matkl":"3200370","menge":"1","meins":"EA","mwskz":"D3","txz01":"\u6d4b\u8bd5\u5546\u54c133333","netpr":"610.81"}]}';
        $data['type'] = '1';*/
        //var_dump($data);die;
        $orderData = $this->getSapByOsAndSellerid($ordersn,$userid,1);
        if($orderData)
        {
            //调第三方api采购订单
            $apiRet = $this->sapOrderApi($orderData['param'],$ordersn);
            return $apiRet;
        }

    }

    //sap中间件采购订单接口api
    public function sapOrderApi($param,$ordersn){
        $url = $this->apiUrl . '/orderform';
        $res = $this->curlPost($url,$param,$ordersn,1);
        return $res;
    }

    //sap采购入库
    public function addSapStock($ordersn,$userid,$stockid='6001')
    {
        //return true;
        //$this->sapStockApi(1,2);    //测试
        $orderData = $this->getSapByOrdersn($ordersn,$userid);
        if($orderData)
        {
            $param = json_decode($orderData['param'], true);
            $sapStockTemp =array();
            foreach($param['it_item'] as $key => $val)
            {
                $pici = $this->getPici();
                $sapStockTemp[$key]['bstnr'] = $val['ebeln'];
                $sapStockTemp[$key]['ebelp'] = $key+1 .'0';
                $sapStockTemp[$key]['lfsnr'] = $val['ebeln'];
                $sapStockTemp[$key]['budat'] = date('Y-m-d',time()); //日期
                $sapStockTemp[$key]['menge'] = $val['menge'];
                $sapStockTemp[$key]['lgort'] = $stockid; //库存地点
                $sapStockTemp[$key]['charg'] = $pici; //批号
                $sapStockTemp[$key]['lichn'] = $orderData['sellerid'].time(); //供应商批次编号
                $sapStockTemp[$key]['bwtar'] = 'NORM';
            }

            //入sap_order库
            $sapArr['ordersn'] = $orderData['ordersn'];
            $sapArr['buyerid'] = $orderData['buyerid'];
            $sapArr['sellerid'] = $orderData['sellerid'];
            $sapArr['param'] = json_encode($sapStockTemp);
            $sapArr['type'] = 2;    //1采购订单，2采购入库
            $this->insertSapOrder($sapArr);
            //调第三方api采购入库
            $apiRet = $this->sapStockApi(json_encode($sapStockTemp),$sapArr['ordersn']);
            return $apiRet;
        }
    }

    //sap中间件采购入库接口api
    public function sapStockApi($param,$ordersn){
        //var_dump($param);die;
        //$ordersn = '201807241008081847595';
        //$param = '[{"bstnr":"201807241008081847595","ebelp":"10","lfsnr":"201807241008081847595","budat":"2018-07-24","menge":"1","lgort":"6001","charg":"T000000014","lichn":"181532403224","bwtar":"NORM"},{"bstnr":"201807241008081847595","ebelp":"20","lfsnr":"201807241008081847595","budat":"2018-07-24","menge":"1","lgort":"6001","charg":"T000000015","lichn":"181532403224","bwtar":"NORM"}]';
        $url = $this->apiUrl . '/beputinstorage';
        $res = $this->curlPost($url,$param,$ordersn,1);
        return $res;
    }


    /**
     * CURL方法，增加记录日志
     * @param $url
     * @param $param
     * @param $ordersn
     * @param int $decode
     * @param int $timeout
     * @return bool|mixed
     */
    public function curlPost($url, $param = array(), $ordersn, $decode = 1, $timeout = 40)
    {
        $this_header = array(
            'Content-type: application/json;charset=utf-8',
            'Expect:'
        );
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $this_header);
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $param);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $result = curl_exec($ch);
        curl_close ($ch);
        unset($ch);

        //记录日志
        $this->addApiLog($url,$ordersn,$param,$result);

        $result = $decode ? json_decode($result,TRUE) : $result;
        if($result['status'] == 200){
            if($result['data']['item'][0]['type'] == 'S'){
                return true;
            }else{
                return false;
            }
        }
        else{
            return false;
        }
    }


    /**
     * API Log
     * @param $url  //api地址
     * @param $data //请求行
     * @param $ordersn  //订单号
     * @param $receive  //返回行
     */
    public function addApiLog($url,$ordersn,$data,$receive)
    {
        $args['ordersn'] = $ordersn;
        $args['url'] = $url;
        $args['send'] = $data;
        $args['receive'] = $receive;
        $args['create_time'] = time();
        return $this->db->insertElement(array('table' => 'api_log','query' => $args));
    }

    /**
     * 新增sap采购订单数据
     * @param $args
     * @return mixed
     */
    public function insertSapOrder($args)
    {
        $args['addtime'] = time();
        return $this->db->insertElement(array('table' => 'sap_order','query' => $args));
    }


    //根据订单号和买家id取sap订单表数据
    public function getSapByOrdersn($ordersn,$userid,$type=1)
    {
        $data = array();
        $sql = 'SELECT * FROM `x2_sap_order` WHERE `ordersn`='."'".$ordersn."'".' AND `buyerid`='.$userid.' AND `type`='.$type;
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }

    //根据物料编码取数据
    public function getWuliaoInfo($code)
    {
        $data = array();
        $sql = 'SELECT * FROM `sy_material` WHERE `matnr`='.$code.' limit 1';
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }


    public function getFactoryByCode($code)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_factory` WHERE `bukrs`='". $code ."' LIMIT 10";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }


    public function getCompanyByCode($code)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_company` where `bukrs` LIKE '". $code ."%' OR `butxt` LIKE '%". $code ."%' LIMIT 10";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }

    public function getCaigouByCode($code)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_purchase` where `ekorg` LIKE '". $code ."%' LIMIT 10";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }

    /**
     * 根据付款条款描述模糊搜索
     * @param $code
     * @return mixed
     */
    public function getFukuanByCode($code)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_payment_terms` where `text1` LIKE '%". $code ."%' LIMIT 10";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }

    /**
     * 根据付款条款标号精确搜索
     * @param $id
     * @return mixed
     */
    public function getFukuanById($id)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_payment_terms` where `zterm`='".$id."'";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }

    /**
     * 根据key模糊搜索税率
     * @param $key
     * @return mixed
     */
    public function getShuiByKey($key)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_tax_code` where `text1` LIKE '%". $key ."%' LIMIT 10";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }

    /**
     * 根据税码精确搜索税率
     * @param $code
     * @return mixed
     */
    public function getShuiByCode($code)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_tax_code` where `mwskz`='". $code ."'";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }


    /**
     * 根据公司编号和项目编号获取仓储地点
     * @param $compid
     * @param $facid
     * @return mixed
     */
    public function getCangByCompidAndFacid($compid,$facid)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_stock` WHERE `bukrs`='". $compid ."' AND `bwkey`='". $facid ."' LIMIT 5";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data,false);
        return $r;
    }


    public function getPici()
    {
        $sql = "SELECT * FROM `x2_good_charg` ORDER BY id DESC LIMIT 1";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        $args['charg'] = $r['charg'] + 1;
        $ret = $this->db->insertElement(array('table' => 'good_charg','query' => $args));
        if($ret)
        {
            return 'T'.substr($args['charg'],1);
        }else{
            return 'T000000001';
        }
    }

    /**
     * 根据公司编号查询公司的描述
     * @param $bukrs
     * @return bukrsdescription
     */
    public function getCompanyByBukrs($bukrs)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_company` WHERE `bukrs`='". $bukrs ."'  LIMIT 1";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }

    /**
     * 根据采购组编号查询采购组的描述
     * @param $ekgrp  采购组编号
     * @return bukrsdescription
     */
    public function getEkorgByEkgrp($ekgrp)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_purchase` WHERE `ekgrp`='". $ekgrp ."'  LIMIT 1";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }

   /**
     * 根据采购组编号查询采购组的描述
     * @param $zterm  采购组编号
     * @return ztermdescription
     */
    public function getFkuanByZterm($zterm)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_payment_terms` WHERE `zterm`='". $zterm ."'  LIMIT 1";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }

    /**
     * 根据税码编号查询税码的描述
     * @param $mwskz  税码编号
     * @return mwskzdescription
     */
    public function getMwskzByCode($mwskz)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_tax_code` WHERE `mwskz`='". $mwskz ."'  LIMIT 1";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }

    /**
     * 根据工厂码编号查询工厂name1
     * @param $werks  工厂码编号
     * @return mwskzdescription
     */
    public function getFactorysByCode($werks)
    {
        $data = array();
        $sql = "SELECT * FROM `sy_factory` WHERE `werks`='". $werks ."'  LIMIT 1";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }

    /**
     * 根据所有的采购详情sapinfo
     * @return all
     */
    public function getSapOrderInfoAll()
    {
        $data = array();
        $sql = "SELECT * FROM `x2_sap_orderinfo`";
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetchALL($data);
        return $r;
    }

    //根据订单号和卖家id取sap订单表数据
    public function getSapByOsAndSellerid($ordersn,$userid,$type=1)
    {
        $data = array();
        $sql = 'SELECT * FROM `x2_sap_order` WHERE `ordersn`='.$ordersn.' AND `sellerid`='.$userid.' AND `type`='.$type;
        $data['sql'] = $sql;
        $data['v'] = array();
        $r = $this->db->fetch($data);
        return $r;
    }

    /**
     * @param $ordersn
     * @param $userid
     * @return bool|mixed
     * sap退货中间件-xiliheng-20180816
     */
    public function returnSapOrder($ordersn,$userid)
    {
        $sapLocalOrder = $this->getSapByOsAndSellerid($ordersn,$userid,1);
        //$sapLocalOrder = $this->getSapByOrdersn($ordersn,$userid, 1);

        if($sapLocalOrder)
        {
            $sapParam = json_decode($sapLocalOrder['param'], true);

            //sap数据抬头
            $sapRequest['is_header']['ebeln'] = $sapParam['is_header']['ebeln'];
            $sapRequest['is_header']['ekorg'] = '6000'; //采购组织
            $sapRequest['is_header']['ekgrp'] = $sapParam['is_header']['ekgrp'];

            //sapItems字段数据
            $goodsItems = [];
            foreach ($sapParam['it_item'] as $key => $value)
            {
                $info['loekz'] = 'L';
                $info['ebeln'] = $value['ebeln'];
                $info['ebelp'] = $value['ebelp'];
                $info['menge'] = $value['menge'];
                $info['meins'] = $value['meins'];

                $goodsItems[] = $info;
            }
            $sapRequest['it_item'] = $goodsItems;

            //调第三方api采购订单
            $apiRet = $this->sapReturnApi(json_encode($sapRequest),$ordersn);
            
            return $apiRet;
        }

    }

    //——————sap中间件退货接口api—2018-08-15-xiliheng———————————
    //目前还差sap接口
    public function sapReturnApi($param,$ordersn){
        $url = $this->apiUrl . '/returnedgoods';
        $res = $this->curlPost($url,$param,$ordersn,1);
        return $res;
    }
    
    //测试
    public function sapTest()
    {
        $data['ordersn'] = '201808011519371819027';
        $data['buyerid'] = '1';
        $data['sellerid'] = '18';
        $data['param'] = '{"is_header":{"ebeln":"201808011519371819027","bukrs":"6001","lifnr":"20000040","ekorg":"6000","ekgrp":"I58","zterm":"DP00","dppct":"0","bedat":"2018-08-01","reserve_f1":"1576.00"},"it_item":[{"ebeln":"201808011519371819027","ebelp":"10","pstyp":"0","ewerk":"A001","ematn":"10031098","matkl":"3200270","menge":"1","meins":"EA","mwskz":"D1","txz01":"\u6d4b\u8bd5\u5546\u54c12","netpr":"767.52"},{"ebeln":"201808011519371819027","ebelp":"20","pstyp":"0","ewerk":"A001","ematn":"10004443","matkl":"3200370","menge":"1","meins":"EA","mwskz":"D3","txz01":"\u6d4b\u8bd5\u5546\u54c133333","netpr":"610.81"}]}';
        $data['type'] = '1';

        //var_dump($data);die;
        /*$orderData = $this->getSapByOsAndSellerid($ordersn,$userid,1);
        if($orderData)
        {*/
        //调第三方api采购订单
        $apiRet = $this->sapOrderApi($data['param'],$data['ordersn']);
        return $apiRet;
    }
}

?>
