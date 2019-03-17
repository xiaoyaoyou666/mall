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

	private function add()
	{
		if($this->ev->get('addbrand'))
		{
			$args = $this->ev->get('args');
			$r = $this->brand->getBrandById($args['brandid']);
			if($r)
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败，该品牌已经添加了"
				);
				exit(json_encode($message));
			}
			$id = $this->brand->addBrand($args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?item-master-brands"
			);
			exit(json_encode($message));
		}
		else
		{
			$this->tpl->display('brand_add');
		}
	}

	private function edit()
	{

		$brandid = $this->ev->get('brandid');


		if($this->ev->get('modifybrand'))
		{
			$brand = $this->brand->getBrandById($brandid);
			$args = $this->ev->get('args');
			if($brand['brandid'] != $args['brandid'])
			{
				$r = $this->brand->getBrandById($args['brandid']);
				if($r)
				{
					$message = array(
						'statusCode' => 300,
						"message" => "该品牌已经存在"
					);
					exit(json_encode($message));
				}
			}
			$args = $this->ev->get('args');

			
			$args['brandid'] = $brandid;
			$this->brand->modifyBrand($brandid,$args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?item-master-brands&page={$page}"
			);
			exit(json_encode($message));
		}
		else
		{
			$brand = $this->brand->getBrandById($brandid);
			$this->tpl->assign('brandid',$brandid);
			$this->tpl->assign('brand',$brand);
			$this->tpl->display('brand_edit');
		}
	}

	private function del()
	{
		$brandid = $this->ev->get('brandid');
		$page = intval($this->ev->get('page'));
		$this->brand->delbrand($brandid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "callbackType" => "forward",
		    "forwardUrl" => "reload"
		);
		exit(json_encode($message));
	}

	private function batdel()
	{
		$page = intval($this->ev->get('page'));
		$delids = $this->ev->get('delids');
		foreach($delids as $brandid => $p)
		$this->brand->delBrand($brandid);
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
		$page = intval($this->ev->get('page'));
		$this->tpl->assign('page',$page);
		
		$brandtitle = $this->ev->get('keyword');
		$brandid = $this->ev->get('brandid');

		$this->tpl->assign('u',$u);
		$this->tpl->assign('page',$page);
		$page = $page?$page:1;

		if($brandtitle)$args[] = array("AND","brandtitle LIKE '%{$brandtitle}%'");
		if($brandid) $args[] = array("AND","brandid LIKE '%{$brandid}%'");

		$brands = $this->brand->getBrandList($args,$page,10);
		$this->tpl->assign('brands',$brands);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('brandtitle',$brandtitle);
		$this->tpl->assign('brandid',$brandid);
		$this->tpl->display('brand');
	}
}


?>
