{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">
				{x2;include:menu}
			</div>
			<div class="col-xs-10" id="datacontent">
{x2;endif}
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
							<li><a href="index.php?{x2;$_app}-master-brands">品牌管理</a></li>
							<li class="active">修改品牌</li>
						</ol>
					</div>
				</div>
				<div class="box itembox">
					<h4 class="title" style="padding:10px;">
						<a href="#">修改品牌</a>
						<a class="pull-right btn btn-primary" href="index.php?{x2;$_app}-master-brands">品牌列表</a>
					</h4>
					<form action="index.php?{x2;$_app}-master-brands-edit" method="post" class="form-horizontal">
						<fieldset>
							<div class="form-group">
							</div>
							<div class="form-group">
								<label for="modulename" class="control-label col-sm-2">品牌英文名称</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name="args[brandid]" value="{x2;$brand['brandid']}" datatype="english" needle="needle" msg="您必须输入英文品牌名称">
									<span class="help-block">请输入品牌英文名称</span>
								</div>
							</div>
							<div class="form-group">
								<label for="modulename" class="control-label col-sm-2">品牌中文名称</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name="args[brandtitle]" value="{x2;$brand['brandtitle']}" datatype="userName" needle="needle" msg="您必须输入中文品牌名称">
									<span class="help-block">请输入品牌名称</span>
								</div>
							</div>
							<div class="form-group">
								<label for="modulename" class="control-label col-sm-2">品牌所属国家</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="args[brandcountry]" value="{x2;$brands['brandcountry']}">
									<span class="help-block">请输入品牌所属国家</span>
								</div>
							</div>
							<div class="form-group">
								<label for="moduledescribe" class="control-label col-sm-2">品牌图片</label>
								<div class="col-sm-9">
									<script type="text/template" id="pe-template-brandthumb">
							    		<div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
							            	<div class="qq-upload-button-selector" style="clear:both;">
							                	<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
									                <li class="text-center">
									                    <div class="thumbnail">
															<img class="qq-thumbnail-selector" alt="点击上传新图片">
															<input type="hidden" class="qq-edit-filename-selector" name="args[brandthumb]" tabindex="0">
														</div>
									                </li>
									            </ul>
									            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
										            <li class="text-center">
										                <div class="thumbnail">
															<img class="qq-thumbnail-selector" src="{x2;if:$brand['brandthumb']}{x2;$brand['brandthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
															<input type="hidden" class="qq-edit-filename-selector" name="args[brandthumb]" tabindex="0" value="{x2;if:$brand['brandthumb']}{x2;$brand['brandthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
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
								<label for="catdes" class="control-label col-sm-2">品牌简介</label>
								<div class="col-sm-9">
									<textarea class="ckeditor" rows="7" id="branddescribe" name="args[branddescribe]">{x2;$brand['branddescribe']}</textarea>
									<span class="help-block">对这个品牌进行描述</span>
								</div>
							</div>
							<div class="form-group">
								<label for="catdes" class="control-label col-sm-2"></label>
								<div class="col-sm-9">
									<button class="btn btn-primary" type="submit">提交</button>
						            <input type="hidden" name="page" value="{x2;$page}">
						            <input type="hidden" name="modifybrand" value="1">
						            <input type="hidden" name="brandid" value="{x2;$brand['brandid']}">
									{x2;tree:$search,arg,aid}
									<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
									{x2;endtree}
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>