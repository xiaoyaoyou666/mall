<?php

require_once 'alisb/vendor/autoload.php';

use Aliyun\Core\Config;
use Aliyun\Core\Profile\DefaultProfile;
use Aliyun\Core\DefaultAcsClient;
use Aliyun\Api\Sms\Request\V20170525\SendSmsRequest;
use Aliyun\Api\Sms\Request\V20170525\QuerySendDetailsRequest;
/*
 * Created on 2016-5-19
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class action extends app
{
    public $_user;
	public function display()
	{
        $this->sql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->user = $this->G->make('user','user');
        $this->item = $this->G->make('item','item');
        $this->core = $this->G->make('setorder','core');
        $this->msg = $this->G->make('msg','user');
        $this->_user = $_user = $this->session->getSessionUser();
		$action = $this->ev->url(3);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

    private function getProvince()
    {
        echo '<option value="">请选择省</option>';
        $current = urldecode($this->ev->get('current'));
        $data = array(false,'province');
        $sql = $this->sql->makeSelect($data);
        $r = $this->db->fetchAll($sql);
        foreach($r as $p)
        {
            if($current == $p['provinceid'])
                echo '<option value="'.$p['provinceid'].'" selected>'.$p['province'].'</option>';
            else
                echo '<option value="'.$p['provinceid'].'">'.$p['province'].'</option>';
        }
    }

    private function getcity()
    {
        echo '<option value="">请先选择城市</option>';
        $current = urldecode($this->ev->get('current'));
        $parent = urldecode($this->ev->get('parent'));
        $args = array();
        if(!$parent)
		{
			$data = array(false,'city',array(array("AND","cityid = :cityid","cityid",$current)));
			$sql = $this->sql->makeSelect($data);
			$r = $this->db->fetch($sql);
			$args[] = array("AND","father = :father","father",$r['father']);
        }
        else
        $args[] = array("AND","father = :father","father",$parent);
        $data = array(false,'city',$args);
        $sql = $this->sql->makeSelect($data);
        $r = $this->db->fetchAll($sql);
        foreach($r as $p)
        {
            if($current == $p['cityid'])
                echo '<option value="'.$p['cityid'].'" selected>'.$p['city'].'</option>';
            else
                echo '<option value="'.$p['cityid'].'">'.$p['city'].'</option>';
        }
    }

    private function getarea()
    {
        echo '<option value="">请先选县区</option>';
        $current = urldecode($this->ev->get('current'));
        $parent = urldecode($this->ev->get('parent'));
        $args = array();
        if(!$parent)
        {
            $data = array(false, 'cityarea', array(array("AND", "areaid = :areaid", "areaid", $current)));
            $sql = $this->sql->makeSelect($data);
            $r = $this->db->fetch($sql);
            $args[] = array("AND", "father = :father", "father", $r['father']);
        }
        else
        $args[] = array("AND","father = :father","father",$parent);
        $data = array(false,'cityarea',$args);
        $sql = $this->sql->makeSelect($data);
        $r = $this->db->fetchAll($sql);
        foreach($r as $p)
        {
            if($current == $p['areaid'])
                echo '<option value="'.$p['areaid'].'" selected>'.$p['area'].'</option>';
            else
                echo '<option value="'.$p['areaid'].'">'.$p['area'].'</option>';
        }
    }

    private function sendphonemsg($tmpcode,$phonenumber,$content,$action)
    {
        Config::load();
        $product = "Dysmsapi";
        // 短信API产品域名
        $domain = "dysmsapi.aliyuncs.com";
        // 暂时不支持多Region
        $region = "cn-hangzhou";
        // 服务结点
        $endPointName = "cn-hangzhou";
        // 初始化用户Profile实例
        $profile = DefaultProfile::getProfile($region, "LTAIXMKRJm4qcqZX", "0KJVckl0MmeH3UhMiEfSWhyYOoNJrA");
        // 增加服务结点
        DefaultProfile::addEndpoint($endPointName, $region, $product, $domain);
        // 初始化AcsClient用于发起请求
        $acsClient = new DefaultAcsClient($profile);
        //$phoneNumbers = $mobile;
        $request = new SendSmsRequest();

        // 必填，设置雉短信接收号码
        $request->setPhoneNumbers($phonenumber);

        // 必填，设置签名名称
        $request->setSignName("天工开物");

        // 必填，设置模板CODE
        $request->setTemplateCode($tmpcode);
        $templateParam = $content;
        if($templateParam) {
            //$request->setTemplateParam(json_encode($templateParam));
            $request->setTemplateParam($templateParam);
        }
        $acsResponse = $acsClient->getAcsResponse($request);
//        var_dump($acsResponse,$_SESSION['phonerandcode']);die;
        if($acsResponse->Code == 'OK')
        {
            $param = array(
                'mobile' => $phonenumber,
                'action' => $action,
                'code'   => $_SESSION['phonerandcode'],
                'addtime'=> time(),
            );
            $insertRet = $this->user->addSendSms($param);
            if($insertRet)
            {
                $message = array(
                    'statusCode' => 200,
                    "message" => "短信发送成功"
                );
            }else{
                $message = array(
                    'statusCode' => 202,
                    "message" => "发送失败，请稍后重试"
                );
            }

        }
        elseif($acsResponse->Code == 'isv.BUSINESS_LIMIT_CONTROL')
        {
            $message = array(
                'statusCode' => 201,
                "message" => "请勿频繁发送短信"
            );
        }
        else{
            $message = array(
                'statusCode' => 300,
                "message" => "短信发送失败"
            );
        }
        exit(json_encode($message));
    }

    private function sendcode()
    {
        $mobile = $this->ev->get('mobile');
        $action = $this->ev->get('action');
        if(!$mobile)
        {
            $message = array(
                'statusCode' => 300,
                'message' => '请填写手机号'
            );
            exit(json_encode($message));
        }
        $user = $this->user->getUserByMobile($mobile);
        $_SESSION['phonerandcode'] = $randcode = rand(100000,999999);
        if($user)
        {
            if($action == 'findpassword')
            {
                $this->sendphonemsg('SMS_138475254',$mobile,'{"username":"'.$mobile.'","code":"'.$randcode.'"}','findpassword');
            }
            elseif($action == 'reply')  //供应商平台审核通过通知
            {
                $this->sendphonemsg('SMS_143860092',$mobile,'','reply');
            }
            else
            {
                $message = array(
                    'statusCode' => 300,
                    'message' => '该手机号已注册'
                );
                exit(json_encode($message));
            }
        }
        else
        {
            if($action == 'reg')
            {
                $this->sendphonemsg('SMS_138475255',$mobile,'{"username":"'.$mobile.'","code":"'.$randcode.'"}','reg');
            }
            elseif($action == 'changemobile')
            {
                $this->sendphonemsg('SMS_138475253',$mobile,'{"username":"'.$mobile.'","code":"'.$randcode.'"}','changemobile');
            }
        }
    }

    public function test()
    {
        $Con = mysqli_connect('10.72.3.251', 'mysqlroot', 'WgLrrC23');
        mysqli_select_db( $Con, 'yuan');
        mysqli_query( $Con, 'set names utf8');
        $sql = "SELECT * FROM `x2_user`";
        $result = mysqli_query( $Con, $sql);
        $data = array();
        while($row = mysqli_fetch_assoc($result)){
            $data[] = $row;
        }
        ;
        var_dump($data);die;
        return $data;
    }

    //根据供应商code查数据
    private function getCompanyByCode()
    {
        $code = $this->ev->get('code');
        $data = $this->user->getCompanyByCode($code);
        $html = '<ul>';
        foreach ($data as $key=>$val) {
            $html .= '<li value="'.$val['lifnr'].'">'.$val['lifnr'].'</li>';
        }
        $html .= '</ul>';
        $message = array(
            'statusCode' => 200,
            "message" => '查询成功',
            "data" => $html,
        );
        exit(json_encode($message));

    }

    //后台用户编辑供应商编码
    private function setCompCode()
    {
        $userid = $this->ev->get('userid');
        $code = $this->ev->get('code');
        if($code)
        {
            $args['useropenid'] = $code;
            $id = $this->user->modifyUserInfo($args,$userid);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
            );
            exit(json_encode($message));
        }

    }

    //根据物料编码查数据
    private function getWuliaoByCode()
    {
        $code = $this->ev->get('code');
        $data = $this->user->getWuliaoByCode($code);
        $html = '<ul>';
        foreach ($data as $key=>$val) {
            $html .= '<li value="'.$val['matnr'].'" matkl="'.$val['matkl'].'" wgbez="'.$val['wgbez'].'" meins="'.$val['meins'].'">'.$val['matnr'].'</li>';
        }
        $html .= '</ul>';
        $message = array(
            'statusCode' => 200,
            "message" => '查询成功',
            "data" => $html,
        );
        exit(json_encode($message));

    }

    //后台用户编辑商品编码
    private function setGoodCode()
    {
        $goodid = $this->ev->get('goodid');
        $code = $this->ev->get('code');
        $matkl = $this->ev->get('matkl');
        $wgbez = $this->ev->get('wgbez');
        $meins = $this->ev->get('meins');
        if($code&&$matkl&&$wgbez&&$meins)
        {
            $args['wuliaocode'] = $code;    //物料编码
            $args['wl_itemcode'] = $matkl;  //物料组编码
            $args['wl_itemname'] = $wgbez;  //物料组描述
            $args['wl_danwei'] = $meins;    //物料单位
            $id = $this->item->modifyGoods($goodid,$args);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
            );
            exit(json_encode($message));
        }
    }

    // /**
    //  *  页面上加一个判断，判断当前时间减去订单确认时间大于10天就，
    //  *  更新为发货状态   并把时间填入数据库
    //  */
    public function receiving()
    {
       $setli = $this->core->getStatisticsList();  
       $bcd = $setli['cfgsetting'];
       $settime = $bcd*86400;
       $orders =  $this->core->listordersn();//订单数据
       $onetime = time();//当前时间 
       foreach ($orders['data'] as $key => $val) 
       {
            if($onetime-$val['orderouttime'] > $settime && $val['orderstatus'] == 2)
            {
                // var_dump($onetime-$val['orderouttime'],$bcd,$val['ordersn']);
                $argsd['orderstatus']=3;
                $argsd['orderrecivetime']=time();
                $this->core->updeorder($argsd,$val['ordersn']);    
            }                
        }
    }

     //获取首页轮播展示的公告和消息数据
    public function getShowMessage(){

        $type = $this->ev->get('type'); //2公告 3消息
        $userid = $this->_user['sessionuserid'];
        if($type == 2){
            $args[] = array("AND","msg_type = :msg_type",'msg_type',2);
            $args[] = array("AND","msg_userid = :msg_userid",'msg_userid',-1);
        }else if($type == 3){
            $args[] = array("AND","msg_type = :msg_type",'msg_type',3);
            $args[] = array("AND","msg_userid = :msg_userid",'msg_userid',$userid);
        }else{
            $args[] = array("AND","msg_type = :msg_type",'msg_type',1);
            $args[] = array("AND","msg_userid = :msg_userid",'msg_userid',$userid);
        }
        $data = $this->msg->getCompanyMsgList($args,1,20);
        exit(json_encode($data));

    }


    //后台修改用户密码功能
    private function saveUserPwd()
    {
        $userid = $this->ev->get('userid');
        $param['userpassword'] = $this->ev->get('pwd');
        $pwdagain = $this->ev->get('pwdagain');
        if($param['userpassword'] != $pwdagain)
        {
            $message = array(
                'statusCode' => 300,
                "message" => "两次密码不一致",
            );
            exit(json_encode($message));
        }
        if($this->_user['sessiongroupid'] != 1)
        {
            $message = array(
                'statusCode' => 300,
                "message" => "权限错误",
            );
            exit(json_encode($message));
        }
        $param['userpassword'] = md5($param['userpassword']);
        $id = $this->user->modifyUserInfo($param,$userid);
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
        );
        exit(json_encode($message));


    }

}

?>
