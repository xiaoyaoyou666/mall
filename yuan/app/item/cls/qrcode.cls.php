<?php

/*

二维码生成类

*/

class qrcode_item

{

	public $G;



	public function __construct(&$G)
	{

		$this->G = $G;

	}



	public function _init()//框架里面的类初始化函数。执行一些初始化操作。类工厂生成一个对象的时候自动调用

	{

		//$this->code = $this->G->make('qrcode','lib');

	}

	

	public function QRcode($value='',$goodsid)

	{
		if(file_exists("app/item/styles/images/qrcode".$goodsid.".png"))return ;
		include_once "qrcode.php";

		//$value = 'http://m.gtmal.com'; //二维码内容

		$errorCorrectionLevel = 'H';//容错级别

		$matrixPointSize = 10;//生成图片大小 290*290

		//生成二维码图片

		QRcode::png($value, 'qrcode.png', $errorCorrectionLevel, $matrixPointSize, 2);

		$logo = "app/item/styles/images/logo_code.png";

		$QR = 'qrcode.png';//已经生成的原始二维码图

		if ($logo !== FALSE) {

			$QR = imagecreatefromstring(file_get_contents($QR));

			$logo = imagecreatefromstring(file_get_contents($logo));

			$QR_width = imagesx($QR);//二维码图片宽度

			$QR_height = imagesy($QR);//二维码图片高度

			$logo_width = imagesx($logo);//logo图片宽度

			$logo_height = imagesy($logo);//logo图片高度

			$logo_qr_width = $QR_width / 6;

			$scale = $logo_width/$logo_qr_width;

			$logo_qr_height = $logo_height/$scale;

			$from_width = ($QR_width - $logo_qr_width) / 2;

			//重新组合图片并调整大小

			imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width, $logo_qr_height, $logo_width, $logo_height);

		}

		//输出图片

		imagepng($QR, "app/item/styles/images/qrcode".$goodsid.".png");

		//echo '<img src="qrcode.png">';

	}

	public function QRcodeNoLogo($value='',$goodsid)

	{

		if(file_exists("app/item/styles/images/qrcode".$goodsid.".png"))return ;
		include_once "qrcode.php";

		//$value = 'http://m.gtmal.com'; //二维码内容

		$errorCorrectionLevel = 'H';//容错级别

		$matrixPointSize = 10;//生成图片大小 290*290

		//生成二维码图片

		QRcode::png($value, 'qrcode.png', $errorCorrectionLevel, $matrixPointSize, 2);

		//$logo = "http://attach.gtmal.com/app/item/styles/images/logo_code.png";

		$QR = 'qrcode.png';//已经生成的原始二维码图

		if ($logo !== FALSE) {

			$QR = imagecreatefromstring(file_get_contents($QR));

			$logo = imagecreatefromstring(file_get_contents($logo));

			$QR_width = imagesx($QR);//二维码图片宽度

			$QR_height = imagesy($QR);//二维码图片高度

			$logo_width = imagesx($logo);//logo图片宽度

			$logo_height = imagesy($logo);//logo图片高度

			$logo_qr_width = $QR_width / 5;

			$scale = $logo_width/$logo_qr_width;

			$logo_qr_height = $logo_height/$scale;

			$from_width = ($QR_width - $logo_qr_width) / 2;

			//重新组合图片并调整大小

			imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width,

				$logo_qr_height, $logo_width, $logo_height);

		}

		//输出图片

		imagepng($QR, "app/item/styles/images/qrcode".$goodsid.".png");

		//echo '<img src="qrcode.png">';

	}



}



?>

