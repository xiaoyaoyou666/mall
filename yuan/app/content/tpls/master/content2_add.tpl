<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
        <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
		<title>系统管理-新增banner位</title>
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
			.col-sm-9{padding: 0;}
			.control-label{padding-right: 0;}
		</style>
	</head>

	<body>
		<header>
		{x2;include:nav2}
		</header>
		<div class="layui-row" id="content" >
			<div class="head">当前位置：<a href="index.php?content-master-contents">banner位管理</a>&nbsp;>&nbsp;添加banner位</div>
			<form action="index.php?content-master-contents-add" method="post" class="form-horizontal">
						<div class="form-group">
				            <label for="contenttitle" class="control-label col-sm-2">标题：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="contenttitle" name="args[contenttitle]" needle="needle" msg="您必须输入标题">
					        </div>
				        </div>
				        
				        
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">缩略图：</label>
				            <div class="col-sm-9">
					            <script type="text/template" id="pe-template-contentthumb">
						    		<div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
						            	<div class="qq-upload-button-selector" style="clear:both;">
						                	<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;margin-bottom: 0 !important;">
								                <li class="text-center">
								                    <div class="thumbnail">
														<img class="qq-thumbnail-selector" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[contentthumb]" tabindex="0">
													</div>
								                </li>
								            </ul>
								            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;margin-bottom: 0 !important;">
									            <li class="text-center">
									                <div class="thumbnail">
														<img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[contentthumb]" tabindex="0" value="app/core/styles/images/noimage.gif">
						                			</div>
									            </li>
									        </ul>
						                </div>
						            </div>
						        </script>
						        <div class="fineuploader" attr-type="thumb" attr-template="pe-template-contentthumb"></div>
							</div>
				        </div>
				        <div class="form-group">
				            <label for="contentcatid" class="control-label col-sm-2">分类：</label>
				        	<div class="col-sm-9 form-inline">
							    <select id="contentcatid" msg="您必须选择一个分类" needle="needle" class="autocombox form-control" name="args[contentcatid]" refUrl="index.php?content-master-category-ajax-getchildcategory&catid={value}">
					            	<option value="">选择一级分类</option>
					            	{x2;tree:$parentcat,cat,cid}
					            	<option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
					            	{x2;endtree}
					            </select>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="contentlink" class="control-label col-sm-2">链接：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="contentlink" name="args[contentlink]">
					        </div>
				        </div>
                        {x2;tree:$forms,form,fid}
						<div class="form-group">
							<label for="{x2;v:form['id']}" class="control-label col-sm-2">{x2;v:form['title']}</label>
							<div class="col-sm-9">
                                {x2;v:form['html']}
							</div>
						</div>
                        {x2;endtree}
						
				        
				
				        <div class="form-group">
				            <label class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="layui-btn  layui-btn-sm" type="submit">提交</button>
					            <input type="hidden" name="submit" value="1">
								<input type="hidden" name="args[contentmoduleid]" value="{x2;$moduleid}">
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