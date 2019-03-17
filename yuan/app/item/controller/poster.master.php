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
		$this->cart = $this->G->make('cart',"item");
		$action = $this->ev->url(3);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function add()
	{
		if($this->ev->get('addposter'))
		{
			$args = $this->ev->get('args');
			$r = $this->cart->getPosterById($args['psid']);
			if($r)
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败，该快递已经添加了"
				);
				exit(json_encode($message));
			}
			$id = $this->cart->addPoster($args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?item-master-poster"
			);
			exit(json_encode($message));
		}
		else
		{
			$this->tpl->display('poster_add');
		}
	}

	private function del()
	{
		$psid = $this->ev->get('psid');
		$this->cart->delPoster($psid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "callbackType" => "forward",
		    "forwardUrl" => "reload"
		);
		exit(json_encode($message));
	}

	private function index()
	{
		$posters = $this->cart->listPoster();
		$this->tpl->assign('posters',$posters);
		$this->tpl->display('poster');
	}
}


?>
