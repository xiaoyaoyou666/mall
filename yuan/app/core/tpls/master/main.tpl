<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>后台管理</title>
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="app/core/styles/admin/index.css">
    <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>

    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/admin/main.css">
    <link rel="stylesheet" type="text/css" href="app/core/styles/admin/bootstrap.css"/>
</head>
<style type="text/css">
	.mks div{
		    padding: 10px 20px;
	}
	.mks{
		border: solid 1px #eee;
    	height: 160px;
    	color: #333;
	}
	.href_a{padding: 30px;display: block}
	.head_page{height: 210px;}
	.head_page a{display: block;width: 18%;height: 210px;float: left;margin-right: 2%;border-radius: 8px;background-image: url(app/core/styles/images/ge_bg.png);background-repeat: no-repeat;background-size:100% 100%;}
	.maessage_s{padding: 28px 20px 20px 20px;line-height: 29px;height: 29px;}
	.maessage_s img{width: 26px;float: right;padding-bottom: 20px;}
	.maessage_s span{float: left;font-size: 15px;color:#323232;}
	.mess_list{padding: 0 20px;font-size:14px;color:#666666;}
	.mess_list li{clear: both;line-height:20px ;height: 20px;margin-bottom: 20px;}
	.mess_list li .list_a{float: left;}
	.mess_list li .number_a{float: right;font-size:16px;color:#666;margin-left: 0;}
	.tody_size{line-height: 16px;font-size:14px;color:#323232;margin: 20px 0 15px 0;}
	.tody_size img{width: 15px;float: left;margin: 1px 10px 0 0;}
	/*.tab_cd{width: 500px;height: 270px;overflow: auto;border: 1px solid #ddd;}
	.tab_po thead{background:#eeeeee;}
	.tab_po  td{border:none!important;font-size: 12px;color:#323232}*/
	/**/
.tab_cd{width: 500px;border: 1px solid #ddd;}
.tab_po thead{background:#f5f5f5;}
.tab_po tr  td{border:none!important;word-wrap:break-word;}
.tab_po tr{border-bottom: 1px solid #ddd;padding-right: 20px;}
.original{font-size: font-size:14px;color:#323232;padding: 20px 0 20px 20px;}
.original img{width: auto;height: 17px;float: left;margin-top: 4px;}
.tbdy tr{height: 30px}
.overFlow{height:214px;overflow: auto;}
.ul_head{width: 100%;background:#f5f5f5;height: 28px;margin-bottom: 0;clear: both;}
.ul_head li{float: left;padding: 4px 8px;}
.table_content{width: 100%;}
#content1{position: absolute;left: 240px;top:100px}
</style>
<body>
	<script type="text/javascript">
			$(document).ready(function(){
//		console.log($(".tab_po").height()===214)
		 $("tbody tr:last").css("border-bottom","none");
		 if($(".tab_po").height()>214){
		 	$(".table_content").addClass("overFlow");
		 	$(".td_three").css("paddingLeft","15px");
		 	$(".td_fore").css("paddingLeft","20px");
		 }else{
		 	$(".table_content").removeClass("overFlow");
		 }
		 $("#content").width($(window).width()-220)
	})
	</script>
<header>
    {x2;include:index1}
</header>
<div id="content">
    <div class="head_page">
    	<a href="index.php?user-master-user">
    		<p class="maessage_s"><span>供应商管理</span><img src="app/core/styles/images/sz.png"/></p>
    		<ul class="mess_list">
    			<li><span class="list_a">今日新增</span><span class="number_a">{x2;$gysToday}</span></li>
    			<li><span class="list_a">昨日新增</span><span class="number_a">{x2;$gysYestoday}</span></li>
    			<li><span class="list_a">用户总数</span><span class="number_a">{x2;$userTotal}</span></li>
    		</ul>
    	</a>
    	<a href="index.php?item-master-items">
    		<p class="maessage_s"><span>商品管理</span><img src="app/core/styles/images/sz.png"/></p>
    		<ul class="mess_list">
    			<li><span class="list_a">今日新增</span><span class="number_a">{x2;$goodsToday}</span></li>
    			<li><span class="list_a">商品总数</span><span class="number_a">{x2;$goodsTotal}</span></li>
    		</ul>
    	</a>
    	<a href="">
    		<p class="maessage_s"><span>采购信息管理</span><img src="app/core/styles/images/sz.png"/></p>
    		<ul class="mess_list">
    			<li><span class="list_a">今日新增</span><span class="number_a">{x2;$purchaseToday}</span></li>
    			<li><span class="list_a">采购总数</span><span class="number_a">{x2;$purchaseTotal}</span></li>
    		</ul>
    	</a>
    	<a href="index.php?content-master-contents">
    		<p class="maessage_s"><span>系统管理</span><img src="app/core/styles/images/sz.png"/></p>
    		<ul class="mess_list">
    			<li><span class="list_a">新增消息</span><span class="number_a">{x2;$msgToday}</span></li>
    			<li><span class="list_a">消息总数</span><span class="number_a">{x2;$msgTotal}</span></li>
    		</ul>
    	</a>
    	<a style="margin: 0;" href="index.php?core-master-audit">
    		<p class="maessage_s"><span>订单管理</span><img src="app/core/styles/images/sz.png"/></p>
    		<ul class="mess_list">
    			<li><span class="list_a">今日订单总数</span><span class="number_a">{x2;$count['number']}</span></li>
    			<li><span class="list_a">昨日交易总额</span><span class="number_a">
						<?php if(empty($count['price'])){ ?>
						￥0万
						<?php }else{ ?>
						￥{x2;$count['price']}万
						<?php } ?>
				</span></li>
    			<li><span class="list_a">昨日销售总额</span><span class="number_a">
						<?php if(empty($today['price'])){ ?>
						￥0万
						<?php }else{ ?>
						￥{x2;$today['price']}万
						<?php } ?>
				</span></li>
    		</ul>
    	</a>
    </div>
    <p class="tody_size">
    	<img src="app/core/styles/images/timers.png"/>
    	<span>操作日志</span>
    </p>
    <div class="tab_cd">
            <ul class="ul_head">
                <li style="width:15%;">协议ID</li>
                <li style="width:30%">用户ID</li>
                <li style="width:20% ;">操作类型</li>
                <li style="width: 30%">字段</li>
            </ul>       			
            <div class="table_content">
	            <table  width="100%"  style="border: none;margin-bottom: 0;width: 100%;table-layout:fixed;" class="table table-hover table-bordered tab_po">
		            <tbody>
	                    {x2;tree:$agreementLogArr['data'],agreement,aid}
		                <tr>
			                <td width="15%">{x2;v:agreement['agreementid']}</td>
			                <td width="30%">{x2;v:agreement['userid']}</td>
			                <td class="td_three" width="20%">{x2;v:agreement['operation']}</td>
			                <td class="td_fore"  width="35%">{x2;v:agreement['modifiess']}</td>
		                </tr>
	                    {x2;endtree}	                      		                   		
		                
		            </tbody>
	            </table>
            </div>
        </div>
</div>
</body>

</html>