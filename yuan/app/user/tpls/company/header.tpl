<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>天工e购</title>
<!--	<meta name="viewport" content="width=device-width, initial-scale=1">-->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
	<link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="app/core/styles/css/datetimepicker.css" />
	<link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="app/core/styles/css/peskin.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/why.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/hln.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/zmm.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/qycenter.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/footer.css"/>
	<link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery.mCustomScrollbar.min.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/corporateCentre.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/corporateCentre.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/play_for.css"/>
	<!--[if lt IE 9]>
	<script src="app/core/styles/js/html5shiv.min.js"></script>
	<script src="app/core/styles/js/respond.min.js"></script>
	<![endif]-->
	<script src="app/core/styles/js/jquery.min.js"></script>
	<script src="app/core/styles/js/jquery-ui.min.js"></script>
	<script src="app/core/styles/js/bootstrap.min.js"></script>
	<script src="app/core/styles/js/bootstrap-datetimepicker.js"></script>
	<script src="app/core/styles/js/bootstrap-datetimepicker.zh-CN.js"></script>

	<script src="app/core/styles/js/all.fine-uploader.min.js"></script>

	<script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
	<script src="app/core/styles/js/plugin.js"></script>
	<script src="app/core/styles/js/jquery.mCustomScrollbar.concat.min.js"></script>
	 <style>
        select{
          /*Chrome和Firefox里面的边框是不一样的，所以复写了一下*/
          /*很关键：将默认的select选择框样式清除*/
          appearance:none;
          -moz-appearance:none;
          -webkit-appearance:none;
        
          /*在选择框的最右侧中间显示小箭头图片*/
          background: url("app/core/styles/img/arrow.png") no-repeat right 7px center transparent!important;
          outline: none!important;
          border:solid 1px #ccc!important;
          /*为下拉小箭头留出一点位置，避免被文字覆盖*/
         padding-right: 18px!important;
         -webkit-tap-highlight-color: rgba(0, 0, 0, 0);    

          -webkit-user-modify: read-write-plaintext-only;
          box-shadow: none!important;
          background-size: 12px!important;
        }
        
        
        /*清除ie的默认选择框样式清除，隐藏下拉箭头*/
        select::-ms-expand { display: none; outline: none;}
    </style>
</head>