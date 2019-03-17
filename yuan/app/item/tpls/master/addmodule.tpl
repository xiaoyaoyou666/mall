<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
        <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
		<title>模型管理-新增模型</title>
		<script src="app/core/styles/admin/js/jquery.min.js"></script>
		<script src="app/core/styles/admin/layui/layui.js"></script>
		<link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/admin/bootstrap.css" />
		<link rel="stylesheet" href="app/core/styles/admin/index.css">
        <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>

        <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap-treeview.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/datetimepicker.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css" />

        <script src="app/core/styles/js/jquery-ui.min.js"></script>
        <script src="app/core/styles/js/bootstrap.min.js"></script>
        <script src="app/core/styles/js/bootstrap-datetimepicker.js"></script>
        <script src="app/core/styles/js/all.fine-uploader.min.js"></script>
        <script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
        <script src="app/core/styles/js/plugin.js"></script>
        <script src="app/core/styles/js/bootstrap-treeview.js"></script>
		
		<style>
			input {
				width: 300px!important;
			}

		</style>
	</head>

	<body>
		<header>
		{x2;include:nav2}
		</header>
		<div class="layui-row" id="content" >
			<div class="head">当前位置：<a href="index.php?item-master-module">模型管理</a>&nbsp;>&nbsp;模型添加</div>
			<form action="index.php?item-master-module-add" method="post" class="form-horizontal">
				<div class="form-group">
		            <label for="contenttitle" class="control-label col-sm-2">模型名：</label>
		            <div class="col-sm-9">
					    <input class="form-control" type="text" id="modulename" name="args[modulename]"  needle="needle" min="2" max="40" alt="请输入模型名称" msg="模型名称为不超过40字的中英文字符且不能为空">
			        </div>
		        </div>

		        <div class="form-group">
		            <label for="contenttitle" class="control-label col-sm-2">模型代码：</label>
		            <div class="col-sm-9">
					    <input class="form-control" type="text" id="modulecode" name="args[modulecode]"  value="" needle="needle" datatype="english" max="12" alt="请输入模型代码" msg="模型代码为不超过12字的英文字符">
			        </div>
		        </div>

		        
		        <div class="form-group">
					<label for="catdes" class="control-label col-sm-2">模型描述</label>
					<div class="col-sm-4">
						<textarea class="form-control" rows="7" id="moduledescribe" name="args[moduledescribe]"></textarea>
					<span class="help-block">对这个模型进行描述</span>
					</div>
				</div>
				
		
		        <div class="form-group">
					<label for="moduledescribe" class="control-label col-sm-2"></label>
					<div class="col-sm-9">
						<button class="btn btn-primary" type="submit" style="background-color:#009688;">提交</button>
						<input type="hidden" name="insertmodule" value="1"/>
						<input type="hidden" name="page" value="{x2;$page}"/>
						{x2;tree:$search,arg,aid}
						<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
						{x2;endtree}
					</div>
				</div>
			</form>



		</div>
		<script>
			/*var fileInput = document.querySelector('input[type=file]'),
				previewImg = document.getElementById('img');
			fileInput.addEventListener('change', function() {
				var file = this.files[0];
				var reader = new FileReader();
				// 监听reader对象的的onload事件，当图片加载完成时，把base64编码賦值给预览图片
				reader.addEventListener("load", function() {
					previewImg.src = reader.result;
				}, false);
				// 调用reader.readAsDataURL()方法，把图片转成base64
				reader.readAsDataURL(file);
			}, false);
			$("#tj").click(function() {
				$("#img").attr("src", "");
				var file = $("#file")
				file.after(file.clone().val(""));
				file.remove();
			})*/
		</script>
    <style>
        .thumbnail{
            margin-bottom: 0 !important;
        }
        input[name='qqfile']{
            position: absolute;
            left: 50% !important;
            top: 0px;
            font-family: Arial;
            font-size: 30px !important;
            padding: 0px;
            cursor: pointer;
            opacity: 0;
            width: 200px !important;
            height: 100% !important;
            margin-left: -100px !important;
        }
    </style>
	</body>

</html>