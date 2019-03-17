<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>订单设置</title>
		<link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico">
		<!-- ziji -->
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="stylesheet" href="app/core/styles/admin/bootstrap.css" />
        <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
        <link rel="stylesheet" href="app/core/styles/admin/friendlink.css" />
        <link rel="stylesheet" href="app/core/styles/admin/indent.css" />
        <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
        <link rel="stylesheet" href="app/core/styles/admin/index.css">
        <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/layui/layui.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
        <!-- 弹窗 -->
        <!--  <link rel="stylesheet" type="text/css" href="app/core/styles/css/datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css" /> -->
    <!-- // <script src="app/core/styles/js/plugin.js"></script> -->
    <!-- // <script src="app/core/styles/js/jquery-ui.min.js"></script> -->
    <!-- // <script src="app/core/styles/js/bootstrap.min.js"></script> -->
	</head>
    <style>
		   body{
			color:#323232!important;
			font-family: "PingFangSC-Regular";
		   }
			input{
				background: #ffffff;
				border: 1px solid #cccccc;
				box-shadow: inset 0 2px 4px 0 rgba(0, 0, 0, 0.10);
				border-radius: 4px;
				width: 160px!important;
				padding-left: 10px;
			}
			ul.set{
				margin-top:10px;
			}
			ul.set li{
			    height:80px;
			}
			ul.set li span:first-child{
				display: inline-block;
				width:200px;
				text-align: right;
			}
			ul.set li i{
				color: #f00;
			}
			ul.set li span:last-child{
				margin-left:200px;
				display: block;
				height:30px;
				line-height: 30px;
				margin-top:6px;
				color: #999;
			}
		</style>
	<body>
		<header>{x2;include:nav2}</header>
		<div class="layui-row" id="content">
			<div class="layui-col-sm12">
				<div class="head">当前位置：<a href="index.php?core-master-audit-set">订单管理</a>&nbsp;>&nbsp;订单设置</div>
				<!-- <form action="index.php?core-master-audit-receiving" method="post"> -->
				<ul class="set">
					 <li>
						<span><i>*</i>显示几天内订单数：</span>
						<input type="text"  name="args[cfgorder]" value="{x2;$setli['cfgorder']}" id="ordernum">
						<span>后台发货查询中显示最近几天内的订单项</span>
					</li>
					<li>
						<span><i>*</i>卖家发货几天后自动收货：</span>
						<input type="text"  name="args[cfgsetting]" value="{x2;$setli['cfgsetting']}" id="cfgsetting" >&nbsp;(天)
						<span>卖家发货后多少天后，买家自动确认收货</span>
					</li>
					<li style="text-align:center;">
						<button class="layui-btn layui-btn-sm" id="tologin">提交</button>
						<button class="layui-btn layui-btn-sm">重置</button>
					</li>
				</ul>
				<!-- </form> -->
			</div>
		</div>
	</body>
	<script>
         $('#tologin').on('click',function(){
	        var days = $('#cfgsetting').val();
             var ordernum = $('#ordernum').val();
	        $.ajax({
	            type:'get',
	            url: 'index.php?core-master-audit-update&day='+days+'&ordernum='+ordernum,
	            dataType:'JSON',
	            async:true,
	            success:function(res){
	                if(res.statusCode == 200){
	                    alert("订单设置成功");
	                    window.location.href = 'index.php?core-master-audit-set';
	                    return false;
	                }else{
	                    alert('订单设置失败');
	                }
	            },
	            error: function(e){
	                console.log(e);
	            }
	        })
	    })
	</script>

</html>