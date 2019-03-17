<?php
header("Content-type: text/html; charset=utf-8"); 	
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
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->tpl->assign('links',$links);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}
	private function index()
	{
		$appid = 'user';
		$app = $this->G->make('apps','core')->getApp($appid);
		$this->tpl->assign('app',$app);
		if($this->ev->get('userlogin'))
		{
			$tmp = $this->session->getSessionValue();
			if(TIME - $tmp['sessionlasttime'] < 1)
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败"
				);
				exit(json_encode($message));
			}
			$args = $this->ev->get('args');
			$user = $this->user->getUserByUserName($args['username']);

			if($user['userid'])
			{
				if($user['userpassword'] == md5($args['userpassword']))
				{
					if($app['appsetting']['loginmodel'] == 1)
					$this->session->offOnlineUser($user['userid']);
					$this->session->setSessionUser(array('sessionuserid'=>$user['userid'],'sessionpassword'=>$user['userpassword'],'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$user['usergroupid'],'sessionlogintime'=>TIME,'sessionusername'=>$user['username'],'sessionuserrole' => $user['users_role']));
					$message = array(
						'statusCode' => 201,
						"message" => "操作成功",
					    "callbackType" => 'forward',
					    "forwardUrl" => "index.php?".$this->G->defaultApp
					);
					$this->G->R($message);
				} else
				{
					$message = array(
						'statusCode' => 300,
						'errorinput' => 'args[username]',
						"message" => "登录失败，因为用户名或密码错误"
					);
					exit(json_encode($message));
				}
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					'errorinput' => 'args[username]',
					"message" => "登录失败，因为用户名不存在"
				);
				exit(json_encode($message));
			}
		}
		else
		{
            $type = $this->ev->get('t');
            $username =  $_COOKIE['username'];
            $pwd =  $_COOKIE['password'];
            $this->tpl->assign('type2',$type);
            $this->tpl->assign('username',$username);
            $this->tpl->assign('pwd',$pwd);
			$this->tpl->display('login');
		}
	}

    //ajax登陆
    public function login()
    {
    	//IE兼容判断
    	$isIE = strpos($_SERVER['HTTP_USER_AGENT'],"Triden");
    	$name = $_GET['un'];
    	if ($name != '') {
        	$encode = mb_detect_encoding ( $name, array ("ASCII", "UTF-8", "GB2312", "GBK", "BIG5" ) );
	        if ($encode != "UTF-8") {
	        		$name = iconv ( "gb2312", "UTF-8", $name );
	        }
        } 
        $param['type'] = $this->ev->get('t');
        $param['username'] = $isIE?$name:$this->ev->get('un');
        $param['userpassword'] = $this->ev->get('up');
        $param['remember'] = $this->ev->get('remember');
        
        $tmp = $this->session->getSessionValue();
        if(TIME - $tmp['sessionlasttime'] < 1)
        {
            $message = array(
                'statusCode' => 300,
                "message" => "操作失败"
            );
            exit(json_encode($message));
        }
        $user = $this->user->getUserByUserName($param['username']);
        if(!$user)
        {
            $user = $this->user->getUserByMobile($param['username']);
        }

        if($user['userid'])
        {
            //如果账户未审核
            if($user['company_istrue'] == 0){
                $message = array(
                    'statusCode' => 300,
                    "message" => "您的账号暂未审核，请您耐心等待！"
                );
                exit(json_encode($message));
            }

            if($user['userpassword'] == md5($param['userpassword']))
            {
                #重新定义单用户登录字段为随机token
                $args6['session_id'] = $this->session->setRandCode();
                $this->user->modifyUserInfo($args6,$user['userid']);

                $this->session->setSessionUser(array('sessionuserid'=>$user['userid'],'sessionpassword'=>$user['userpassword'],'sessionip'=>$this->ev->getClientIp(),'sessionrandcode'=>$args6['session_id'],'sessiongroupid'=>$user['usergroupid'],'sessionlogintime'=>TIME,'sessionusername'=>$user['username'],'sessionuserrole' => $user['users_role'],'sessionrandcode'=>$args6['session_id']));
                $data = array();
                $data['userid'] = $user['userid'];
                $data['username'] = $user['username'];
                $data['type'] = $param['type'] == 1 ? '供应链' : '网格超市';
                $data['actiontime'] = time();
                $this->user->addLoginLog($data);

                //---记住账号和密码-----
                if ($param['remember']==1) {
                    setcookie('username', $param['username'], time() + 3600 * 24 * 30);
                    setcookie('password', $param['userpassword'], time() + 3600 * 24 * 30);
                }else{
                    setcookie('username', '');
                    setcookie('password', '');
                }

                $ref_url = $user['users_role'] == 3 ? 'user-company-index-evaluate_list' : $this->G->defaultApp;
                $message = array(
                    'statusCode' => 201,
                    "message" => "登录成功",
                    "callbackType" => 'forward',
                    "forwardUrl" => "index.php?".$ref_url,
                    "userinfo" => [
                        'userid' => intval($user['userid']),
                        'username' => $user['username'],
                        'users_role' => intval($user['users_role'])
                    ],
                );
       
                exit(json_encode($message));
            }else{
                $message = array(
                    'statusCode' => 300,
                    "message" => "用户名或密码错误"
                );
                exit(json_encode($message));
            }
        }
        else
        {
            $message = array(
                'statusCode' => 300,
                "message" => "用户名不存在"
            );
            exit(json_encode($message));
        }

    }

    private function ajaxgetuser()
    {
        $username = $this->ev->get('username');
        if ($this->user->getUserByUserName($username)) {
            $user = $this->user->getUserByUserName($username);
        } else {
            $user = $this->user->getUserByMobile($username);
        }
        
        
        if($user)
        {
            $message = array(
                'statusCode' => 200,
                'message' => "查询成功",
                'data' => $user
            );
        }else{
            $message = array(
                'statusCode' => 300,
                "message" => "用户不存在"
            );
        }
        
        exit(json_encode($message));
    }

    //找回密码
    private function findpwd()
    {
        if ($this->ev->get('findpwd'))
        {
            $username = $this->ev->get('username');
            $mobile = $this->ev->get('company_mobile');
            $code = $this->ev->get('verCode');
            //判断用户是否存在
            if ($this->user->getUserByUserName($username)) {
                $user = $this->user->getUserByUserName($username);
            } else {
                $user = $this->user->getUserByMobile($username);
            }
            //var_dump($username,$mobile,$code,$user);die;
            if($mobile == $user['company_mobile'])
            {
                $checker = $this->user->checkCode($code,$user['company_mobile']);
                if(!$checker)
                {
                    $message = array(
                        'statusCode' => 300,
                        "message" => "验证码错误或已失效"
                    );
                    exit(json_encode($message));
                }
                $message = array(
                    'statusCode' => 200,
                    "message" => "身份验证成功",
                );
            }
            else{
                $message = array(
                    'statusCode' => 300,
                    "message" => "请刷新页面重试"
                );
            }
            exit(json_encode($message));

        } else {
            $this->tpl->display('findpwd');
        }
    }
    //重置密码
    private function changepwd()
    {
        $param = array();
        $param['username'] = $this->ev->get('username');
        $param['company_mobile'] = $this->ev->get('company_mobile');
        $param['verCode'] = $this->ev->get('verCode');
        $param['password'] = $this->ev->get('userpassword');
        //判断用户是否存在
        $user = $this->user->getUserByUserName($param['username']);
        if($param['company_mobile'] == $user['company_mobile'])
        {
            $checker = $this->user->checkCode($param['verCode'],$user['company_mobile'],300);
            if(!$checker)
            {
                $message = array(
                    'statusCode' => 300,
                    "message" => "验证码错误或已失效"
                );
                exit(json_encode($message));
            }
            $change = $this->user->modifyUserPassword($param,$user['userid']);
            if($change)
            {
                $message = array(
                    'statusCode' => 200,
                    "message" => "重置密码成功",
                );
            } else {
                $message = array(
                    'statusCode' => 300,
                    "message" => "重置密码失败",
                );
            }
        }
        else{
            $message = array(
                'statusCode' => 300,
                "message" => "请刷新页面重试"
            );
        }

        exit(json_encode($message));
    }

    //修改密码完成页
    private function finish()
    {
        $this->tpl->display('findpwd_finish');
    }

}

?>
