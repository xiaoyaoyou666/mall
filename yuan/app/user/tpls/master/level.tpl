<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>企业星级推荐</title>
		<link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/admin/start.css">
		<link rel="stylesheet" type="text/css" href="app/core/styles/admin/base.css">
        <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
        <link rel="stylesheet" href="app/core/styles/admin/index.css">
        <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
		<style>
		   #btn i{
		    	font-size:20px;
		    	color:#ccc;
		    	cursor: pointer;
		    }
		</style>
	</head>

	<body>
		<header>{x2;include:nav2}</header>
		<div class="layui-row" >
			<div class="layui-col-sm12">		
				<div id="content">
	                <div class="head">当前位置：<a href="index.php?user-master-user">供应商管理</a>&nbsp;>&nbsp;星级推荐</div>
					<p>企业黄页：<a target="_blank" href="index.php?company-app-company-index&companyid={x2;$data['userid']}">查看企业黄页内容</a></p>
                    <p>企业名称：{x2;$data['company_name']}</p>
					<p id="btn">
						推荐指数：
						<i class="layui-icon layui-icon-rate-solid" {x2;if:$data['company_level'] > 0}style="color: #ffff00"{x2;endif} ></i>
						<i class="layui-icon layui-icon-rate-solid" {x2;if:$data['company_level'] > 1}style="color: #ffff00"{x2;endif} ></i>
						<i class="layui-icon layui-icon-rate-solid" {x2;if:$data['company_level'] > 2}style="color: #ffff00"{x2;endif} ></i>
						<i class="layui-icon layui-icon-rate-solid" {x2;if:$data['company_level'] > 3}style="color: #ffff00"{x2;endif} ></i>
						<i class="layui-icon layui-icon-rate-solid" {x2;if:$data['company_level'] > 4}style="color: #ffff00"{x2;endif} ></i>
						<span>*请根据企业实力、信息完善程序、资质等级进行综合评估</span>
					</p>
					<p style="text-align: center;"><button style="height: 32px;line-height: 32px;" class="layui-btn">提交</button></p>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(function() {
				var level = {x2;$data['company_level']}; //设置一个全局的变量；
				$("#btn").find("i").click(function() {
					$(this).css("color","yellow");
					$(this).prevAll("i").css("color","yellow");
					$(this).nextAll("i").css("color","#ccc");
					var index = $("#btn i").index(this);
                    level = index+1;

				});

                $('.layui-btn').on('click',function(){
                    $.ajax({
                        type:'get',
                        url: "index.php?user-master-user-level&update=1&userid={x2;$data['userid']}&level="+level+"&page={x2;$page}{x2;$u}",
                        dataType:'JSON',
                        async:true,
                        success:function(res){
                            if(res.statusCode == 200){
                                alert('设置成功');
                                window.location.href = res.forwardUrl
                                return false;
                            }
                        },
                        error: function(e){
                            console.log(e);
                        }
                    })
                })

			})
		</script>
	</body>

</html>