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
		$this->message = $this->G->make('message','content');
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;

	}

	//添加
	public function add()
	{	

		//发送系统所有的一个标识
		$args = $this->ev->get('args');

		if($this->ev->get('xxx')) {
			$message_content = $this->ev->get('desc');
			if (!$message_content) {
				$message = array(
					'statusCode' => 300,
					"message" => "请输入消息内容"
				   
				);
				exit(json_encode($message));
			}else{
				$args['msg_title'] = $message_content;
				$args['msg_userid'] = $message_content;
				$args['msg_time'] = time();
				$args['msg_url'] = 0;
				$args['status'] = 1;

				$this->message->addmessage($args);

				$message = array(
					'statusCode' => 200,
					"message" => "发送成功"
				   
				);
				exit(json_encode($message));



			}


		} else {
			//用户数组形式
			$userids = $this->ev->get('userids');


		}
		
		



		
	}
	



	

	

	

}


?>
