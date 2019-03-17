<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
		<title>发送系统消息</title>
        <link rel="stylesheet" href="app/core/styles/admin/bootstrap.css" />
        <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
        <link rel="stylesheet" href="app/core/styles/admin/friendlink.css" />
        <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
        <link rel="stylesheet" href="app/core/styles/admin/index.css">
        <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/layui/layui.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
		<style>
		  label{
		  	width:100px!important;
		  }
		  textarea{
		  	margin-bottom: 20px;
		  	width:400px!important;
		  }
		  /*.list{
		  	position: absolute;
		  	top:0px;
		  }*/
		 form{
		 	float: left;
		 }
		</style>
	</head>

	<body>
    <header>{x2;include:nav2}</header>
		<div class="layui-row"  id="content">
            <div class="head">当前位置：<a href="index.php?user-master-user-systemmessage">系统消息</a>&nbsp;>&nbsp; 发送系统消息</div>
			<div class="layui-col-sm12">
				<form class="layui-form" action="" style="margin-top: 20px;">
					<!--发送-->
					<div class="layui-inline" >
						<label class="layui-form-label">平台公告：</label>
						<div class="layui-input-block" style="float: left;margin-left: -9px;">
							<input id="title_id1" placeholder="请输入标题" type="text" / style="margin-bottom: 24px;padding-left: 10px;width: 400px!important;border:1px solid #D2D2D2">
							<textarea name="desc" placeholder="请输入内容" class="layui-textarea" id="desc1"></textarea>
							<button type="button" class="layui-btn layui-btn-danger layui-btn-fluid" style="width:100%" id="sendall">确认发送</button>
						</div>
					</div>
			   </form>	
			   <form class="layui-form" action="" style="margin-top: 20px;">
					<div class="layui-inline" >
						<label class="layui-form-label">定向消息：</label>
						<div class="layui-input-block" style="float: left;margin-left: -9px;">
							<input id="title_id2" placeholder="请输入标题" type="text" / style="margin-bottom: 24px;padding-left: 10px;width: 100px;width: 400px!important;border:1px solid #D2D2D2">
							<textarea name="desc" placeholder="请输入内容" class="layui-textarea" id="desc2"></textarea>
							<a href="javascript:;" class="layui-btn layui-btn-fluid" style="width:100%" id="send">选择供应商</a>
						</div>
					</div>
					<!--弹出框-->
				 </form>		
			
			</div>
		</div>
	</body>
</html>
<script type="text/javascript">
    $(function() {
        //全员发送消息
        $('#sendall').on('click',function(){
            var title = $("#title_id1").val();
            var content = $("#desc1").val();
            if(title == '') {
                alert('请输入标题');return false;
            }
            if(content == '') {
                alert('请输入内容');return false;
            }
            $.ajax({
                type:'post',
                data: {type: 2,title: title,content: content},
                url: "index.php?user-master-user-sendmessage",
                dataType:'JSON',
                async:true,
                success:function(res){
                    if(res.statusCode == 200){
                        alert('发送成功');
                        window.location.reload();
                        return false;
                    }
                },
                error: function(e){
                    console.log(e);
                }
            })
        });
        //指定人员发送消息
        $('#send').on('click',function(){
            var title = $("#title_id2").val();
            var content = $("#desc2").val();
            if(title == '') {
                alert('请输入标题');return false;
            }
            if(content == '') {
                alert('请输入内容');return false;
            }
            window.location.href = "index.php?user-master-user-selectsendobj&type=3&title="+title+"&content="+content
        })

    })
</script>