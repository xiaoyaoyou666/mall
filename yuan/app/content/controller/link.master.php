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
		$this->link = $this->G->make('link','content');
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	//列表
	private function index()
	{
		$page = intval($this->ev->get('page'));
		$page = $page?$page:1;
		$links = $this->link->getLinkList(0,$page,10);
		$this->tpl->assign('links',$links);
		$this->tpl->display('links');
	}












	//修改
	private function modifylink()
	{

		
		$linkid = $this->ev->get('linkid');
		//var_dump($linkid);die;
		$page = $this->ev->get('page');
		if($this->ev->get('submit'))
		{
			$args = $this->ev->get('args');
			$this->link->modifyLink($linkid,$args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?content-master-link&page={$page}"
			);
			exit(json_encode($message));
		}
		else
		{
			
			$links = $this->link->getLinkById($linkid);
			//var_dump($links);
			$this->tpl->assign('linkid',$linkid);
			$this->tpl->assign('links',$links);
			$this->tpl->assign('page',$page);
			$this->tpl->display('link_edit');
		}

	}

	//添加
	private function add()
	{
		//var_dump($this->ev->get('args'));die;
		if($this->ev->get('args'))
		{
			$args = $this->ev->get('args');
			$args['addtime'] = time();
			$args['status'] = 1;


			$this->link->addLink($args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?content-master-link"
			);
			exit(json_encode($message));
		}
		else
		{
			$this->tpl->display('link_add');
		}
	}


	//删除
	private function del()
    {
        
        if($this->ev->get('linkid'))
        {
		
			$linkid = $this->ev->get('linkid');
			$this->link->delLink($linkid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
				"forwardUrl" => "reload"
			);
        }
        exit(json_encode($message));
    }


    private function updateStatus()
	{
		$linkid = $this->ev->get('id_value');
		$status = $this->ev->get('value');
		$args = array();
		$args['status'] = $status;
        $result = $this->link->modifyLink($linkid,$args);

        if ($result) {
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功"
				
			);
		} else {
			$message = array(
				'statusCode' => 300,
				"message" => "修改失败了"
			    
			);
		}

		exit(json_encode($message));
	}

}


?>
