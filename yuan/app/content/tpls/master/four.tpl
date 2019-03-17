<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
        <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
		<title>首页四个数据修改</title>
		
		
        <link rel="stylesheet" href="app/core/styles/admin/index.css">
        <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
		<link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/admin/start.css">
		<style>
		    label{
		    	width: 100px!important;
		    }
			input{
				width:400px!important;
				display:inline!important;
				margin-right:10px;
			}
		</style>
	</head>
  
	<body>
		<header>
		{x2;include:nav2}
		</header>
		<div class="layui-row" id="content">
			<div class="head">当前位置：<a style="color: #0078AD;" href="index.php?content-master-statistics">系统管理</a>&nbsp;>&nbsp;首页四个数据修改</div>
			<div style="padding:20px;width:760px;position: relative;left:50%;margin-left:-380px;">
				<form class="layui-form" action="index.php?content-master-statistics-update" method="post" >
					<div class="layui-form-item">
						<label class="layui-form-label">入驻商家:</label>
						<div class="layui-input-block">
							<input type="text" name="args[enter_business]"  autocomplete="off" class="layui-input" value="{x2;$statisticsarr['enter_business']}" id="enter">(个)
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">今日新增商家:</label>
						<div class="layui-input-block">
							<input type="text" name="args[add_business]"  autocomplete="off" class="layui-input" value="{x2;$statisticsarr['add_business']}" id="add">(个)
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">采购需求:</label>
						<div class="layui-input-block">
							<input type="text" name="args[purchase_need]"  autocomplete="off" class="layui-input" value="{x2;$statisticsarr['purchase_need']}" id="need">(个)
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">成交金额</label>
						<div class="layui-input-block">
							<input type="text" name="args[amount]"  autocomplete="off" class="layui-input" value="{x2;$statisticsarr['amount']}" id="amount">(万)
						</div>
					</div>

					<div style="padding-left:300px;"><button type="button" class="layui-btn layui-btn  layui-btn-sm" id="tologin"><i class="layui-icon">&#xe681;</i>提交</button></div>
				</form>
			</div>
		</div>
	</body>




	<script>
		$('#tologin').on('click',function(){
	        
	        var enter = $('#enter').val();
	        var add = $('#add').val();
	        var need = $('#need').val();
	        var amount = $('#amount').val();
	        

	        $.ajax({
	            type:'get',
	            url: 'index.php?content-master-statistics-update&en='+enter+'&ad='+add+'&ne='+need+'&am='+amount,
	            dataType:'JSON',
	            async:true,
	            success:function(res){
	                if(res.statusCode == 200){
	                
	                    window.location.href = 'index.php?content-master-statistics';
	                    return false;
	                }else{
	                    alert('失败了');
	                }
	            },
	            error: function(e){
	                console.log(e);
	            }
	        })
	    })

	</script>

</html>