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
		$this->statistics = $this->G->make('statistics','content');
		$this->price = $this->G->make('price','purchase');
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;

	}

	//列表
	private function index()
	{
		
		$statisticsarr = $this->statistics->getStatisticsList();
		$this->tpl->assign('statisticsarr',$statisticsarr);
		$this->tpl->display('four');
	}



	//修改
	private function update()
	{	
		$param['enter_business'] = $this->ev->get('en');
        $param['add_business'] = $this->ev->get('ad');
        $param['purchase_need'] = $this->ev->get('ne');
        $param['amount'] = $this->ev->get('am');
       
        if ($this->statistics->getStatisticsList()) {
        	$statisticsid = $this->ev->get('statisticsid') ?$this->ev->get('statisticsid'):1;
			$result = $this->statistics->modifyStatistics($statisticsid,$param);
        } else {
        	$result = $this->statistics->addStatistics($param);
        }
        

		

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
