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
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function index()
	{
		$user = $this->user->getUserById($this->_user['sessionuserid']);
		$manager_apps = unserialize($user['manager_apps']);
		$subaction = $this->ev->url(3);
		$modules = $this->ev->url(0);
		/**
		if(!in_array($modules,$manager_apps))
		{
			$message = array(
				'statusCode' => 300,
				"message" => "您没有权限访问此模块,详情咨询超级管理员",
				"callbackType" => 'forward',
				"forwardUrl" => "index.php?core-master"
			);
			$this->G->R($message);
		}
		**/
		$this->tpl->display('index');
	}
}


?>
