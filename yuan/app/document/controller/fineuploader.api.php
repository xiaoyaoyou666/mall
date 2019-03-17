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
		$args = array();
		$path = 'files/attach/images/content/'.date('Ymd').'/';
		$upfile = $this->ev->getFile('qqfile');
		$args['attext'] = $this->files->getFileExtName($upfile['name']);
		if(!in_array(strtolower($args['attext']),$this->allowexts))
		exit(json_encode(array('status' => 'fail')));
		if($upfile)
		$fileurl = $this->files->uploadFile($upfile,$path,NULL,NULL,$this->allowexts);
		if($fileurl)
		{
			$args['attpath'] = $fileurl;
			$args['atttitle'] = $upfile['name'];

			$args['attsize'] = $upfile['size'];
			$args['attuserid'] = $this->_user['sessionuserid'];
			$args['attcntype'] = $upfile['type'];
			$this->attach->addAttach($args);
			if($this->ev->get('imgwidth') || $this->ev->get('imgheight'))
			{
				if($this->files->thumb($fileurl,$fileurl.'.png',$this->ev->get('imgwidth'),$this->ev->get('imgheight')))
				$thumb = $fileurl.'.png';
				else
				$thumb = $fileurl;
			}
			else
			$thumb = $fileurl;

			//如果是本地开发环境，则暂时不走文件存储服务器
			if (RUNTIME == 'local')
			{
                exit(json_encode(array('success' => true,'thumb' => $thumb,'title' => $upfile['name'])));
			}

			//上传文件到文件服务器
			$fastUrlArr = $this->fastdfs->applydfs($thumb);
			//保存文件到数据库
			$fileArr = [
				'path' => $fastUrlArr['path'],

				'url'  => $fastUrlArr['fileUrl']."?attname={$upfile['name']}",


				'localPath' => $thumb,
				'fileName' => $upfile['name'],
			];
			$this->fastdfs->addFileInfo($fileArr);
			if (!empty($fastUrlArr))
			{


				exit(json_encode(array('success' => true,'thumb' => $fileArr['url'],'title' => $upfile['name'])));

			}
			else
			{
				exit(json_encode(array('success' => true,'thumb' => $thumb,'title' => $upfile['name'])));
			}
		}
		else
		{
			exit(json_encode(array('status' => 'fail')));
		}
	}
}


?>
