<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
        <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
		<title>品牌管理-新增品牌</title>
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
			.control-label{padding-right: 0;}
			.col-sm-9{padding-left: 0;}
		</style>
	</head>

	<body>
		<header>
		{x2;include:nav2}
		</header>
		<div class="layui-row" id="content" >
			<div class="head">当前位置：<a href="index.php?item-master-brands">品牌管理</a>&nbsp;>&nbsp;添加品牌</div>
			<form action="index.php?item-master-brands-add" method="post" class="form-horizontal">
						<div class="form-group">
				            <label for="contenttitle" class="control-label col-sm-2">品牌英文名称：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="brandid" name="args[brandid]" datatype="english" needle="needle" msg="您必须品牌英文名称">
					        </div>
				        </div>

				        <div class="form-group">
				            <label for="contenttitle" class="control-label col-sm-2">品牌中文名称：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="brandtitle" name="args[brandtitle]"  needle="needle" msg="您必须品牌中文名称">
					        </div>
				        </div>

				        <div class="form-group">
				            <label for="contenttitle" class="control-label col-sm-2">品牌所属国家：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="brandcountry" name="args[brandcountry]"  needle="needle" msg="您必须输入品牌所属国家">
					        </div>
				        </div>
				        
				        
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">品牌图片：</label>
				            <div class="col-sm-9">
					            <script type="text/template" id="pe-template-brandthumb">
						    		<div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
						            	<div class="qq-upload-button-selector" style="clear:both;">
						                	<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;margin-bottom: 0 !important;">
								                <li class="text-center">
								                    <div class="thumbnail">
														<img class="qq-thumbnail-selector" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[brandthumb]" tabindex="0">
													</div>
								                </li>
								            </ul>
								            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;margin-bottom: 0 !important;">
									            <li class="text-center">
									                <div class="thumbnail">
														<img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[brandthumb]" tabindex="0" value="app/core/styles/images/noimage.gif">
						                			</div>
									            </li>
									        </ul>
						                </div>
						            </div>
						        </script>
						        <div class="fineuploader" attr-type="thumb" attr-template="pe-template-brandthumb"></div>
							</div>
				        </div>
				        <div class="form-group">
							<label for="catdes" class="control-label col-sm-2">品牌简介：</label>
							<div class="col-sm-9">
								<textarea class="ckeditor" rows="5" id="branddescribe" name="args[branddescribe]"></textarea>
								<span class="help-block">对这个品牌进行描述</span>
							</div>
						</div>
						
				        
				
				        <div class="form-group">
				            <label class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="layui-btn  layui-btn-sm" type="submit">提交</button>
					            <input type="hidden" name="page" value="{x2;$page}">
						        <input type="hidden" name="addbrand" value="1">
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