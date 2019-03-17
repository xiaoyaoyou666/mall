<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
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
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/peskin.css" />
		<script src="app/core/styles/js/jquery.min.js"></script>
		<script src="app/core/styles/js/jquery-ui.min.js"></script>
		<script src="app/core/styles/js/bootstrap.min.js"></script>
		<script src="app/core/styles/js/bootstrap-datetimepicker.js"></script>
		<script src="app/core/styles/js/all.fine-uploader.min.js"></script>
		<script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
		<script src="app/core/styles/js/plugin.js"></script>
		<script src="app/core/styles/js/bootstrap-treeview.js"></script>
		<style>
			<style>
			#content input {
				width: 300px!important;
			}
			.col-sm-7{padding: 0;}
			.control-label{padding-right: 0;}
		</style>
	</head>

	<body>
		<header>
		{x2;include:nav2}
		</header>
		<div class="layui-row" id="content" >
			<div class="head">当前位置：<a href="index.php?content-master-contents">banner位管理</a>&nbsp;>&nbsp;修改banner位管理</div>
			<form action="index.php?content-master-contents-edit" method="post" class="form-horizontal">
						<div class="form-group">
				            <label for="contenttitle" class="control-label col-sm-5">标题：</label>
				            <div class="col-sm-7">
							    <input class="form-control" type="text" id="contenttitle" name="args[contenttitle]" needle="needle" msg="您必须输入标题" value="{x2;$content['contenttitle']}">
					        </div>
				        </div>
				        
				        
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-5">缩略图：</label>
				            <div class="col-sm-7">
								<script type="text/template" id="pe-template-contentthumb">
						    		<div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
						            	<div class="qq-upload-button-selector" style="clear:both;">
						                	<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
								                <li class="text-center">
								                    <div class="thumbnail">
														<img class="qq-thumbnail-selector" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[contentthumb]" tabindex="0">
													</div>
								                </li>
								            </ul>
								            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
									            <li class="text-center">
									                <div class="thumbnail">
														<img class="qq-thumbnail-selector" src="{x2;$content['contentthumb']}" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[contentthumb]" tabindex="0" value="{x2;$content['contentthumb']}">
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
				            <label for="contenttitle" class="control-label col-sm-5">排序：</label>
				            <div class="col-sm-7">
							    <input class="form-control" type="text" id="contentsequence" name="args[contentsequence]"  value="{x2;$content['contentsequence']}">
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="contentcatid" class="control-label col-sm-5">分类：</label>
				        	<div class="col-sm-7 form-inline">
							    <select id="contentcatid" msg="您必须选择一个分类" needle="needle" class="autocombox form-control" name="args[contentcatid]" refUrl="index.php?content-master-category-ajax-getchildcategory&catid={value}">
					            	<option value="">选择一级分类</option>
					            	{x2;tree:$parentcat,cat,cid}
					            	<option value="{x2;v:cat['catid']}" 
					            	{x2;if:$content['contentcatid']==v:cat['catid']}
					            	selected="true" ;
					            	{x2;endif}>

					            	{x2;v:cat['catname']}

					            	</option>
					            	{x2;endtree}
					            </select>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="contentlink" class="control-label col-sm-5">链接：</label>
				            <div class="col-sm-7">
							    <input class="form-control" type="text" id="contentlink" name="args[contentlink]" value="{x2;if:$content['contentlink']}{x2;realhtml:$content['contentlink']}{x2;endif}">
					        </div>
				        </div>
                        {x2;tree:$forms,form,fid}
						<div class="form-group">
							<label for="{x2;v:form['id']}" class="control-label col-sm-6">{x2;v:form['title']}</label>
							<div class="col-sm-6">
                                {x2;v:form['html']}
							</div>
						</div>
                        {x2;endtree}
						
				        
				
				        <div class="form-group">
				            <label class="control-label col-sm-5"></label>
				            <div class="col-sm-7">
					            <button class="layui-btn  layui-btn-sm" type="submit">提交</button>
					            <input type="hidden" name="submit" value="1">
					            <input type="hidden" name="contentid" value="{x2;$contentid}">
					            <input type="hidden" name="submit" value="1">
								<input type="hidden" name="args[contentmoduleid]" value="{x2;$moduleid}">
					        </div>
				        </div>
					</form>



		</div>
		<script>
			var fileInput = document.querySelector('input[type=file]'),
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
			})
		</script>
	</body>

</html>