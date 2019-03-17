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
							<li><a href="index.php?{x2;$_app}-master-items&page={x2;$page}">商品管理</a> <span class="divider">/</span></li>
							<li class="active">添加商品</li>
						</ol>
					</div>
				</div>
				<div class="box itembox">
					<h4 class="title" style="padding:10px;">
						<a href="#">添加商品</a>
						<a class="pull-right btn btn-primary" href="index.php?{x2;$_app}-master-items&catid={x2;$catid}&page={x2;$page}">商品管理</a>
					</h4>
					{x2;if:!$catid}
					<form action="index.php?item-master-items-add" method="post" class="form-horizontal">
						<div class="form-group">
				            <label for="itemcatid" class="control-label col-sm-2">分类：</label>
				        	<div class="controls form-inline">
							    <select id="catid" msg="您必须选择一个分类" needle="needle" class="autocombox form-control" name="catid" refUrl="index.php?item-master-category-ajax-getchildcategory&catid={value}">
					            	<option value="">选择一级分类</option>
					            	{x2;tree:$parentcat,cat,cid}
					            	<option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
					            	{x2;endtree}
					            </select>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="itemcatid" class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="btn btn-primary" type="submit" id="catnextbutton">下一步</button>
					        </div>
				        </div>
					</form>
					{x2;else}
					<form action="index.php?item-master-items-add" method="post" class="form-horizontal">
						<div class="form-group">
				            <label for="itemtitle" class="control-label col-sm-2">标题：</label>
				            <div class="col-sm-7">
							    <input type="text" class="form-control" id="itemtitle" name="args[goodstitle]" needle="needle" msg="您必须输入标题">
							</div>
							<div class="col-sm-3">
							    <a class="btn btn-default ajax" href="index.php?item-master-items-add" target="datacontent">重选分类</a>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="itemtitle" class="control-label col-sm-2">广告语：</label>
				            <div class="col-sm-7">
							    <input type="text" class="form-control" id="goodsadv" name="args[goodsadv]">
							</div>
				        </div>
				        <div class="form-group">
				            <label for="itemtitle" class="control-label col-sm-2">邮费说明：</label>
				            <div class="col-sm-7">
							    <input type="text" class="form-control" id="goodspostinfo" name="args[goodspostinfo]">
							</div>
				        </div>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">缩略图：</label>
				            <div class="col-sm-9">
					            <script type="text/template" id="pe-template-goodsthumb">
						    		<div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
						            	<div class="qq-upload-button-selector" style="clear:both;">
						                	<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
								                <li class="text-center">
								                    <div class="thumbnail">
														<img class="qq-thumbnail-selector" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[goodsthumb]" tabindex="0">
													</div>
								                </li>
								            </ul>
								            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
									            <li class="text-center">
									                <div class="thumbnail">
														<img class="qq-thumbnail-selector" src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[goodsthumb]" tabindex="0" value="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
						                			</div>
									            </li>
									        </ul>
						                </div>
						            </div>
						        </script>
						        <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"></div>
							</div>
				        </div>
				        <div class="form-group">
							<label for="goodsphotos" class="control-label col-sm-2">组图：</label>
							<div class="col-sm-9">
								<div class="sortable" id="goodsphotos-range">
								</div>
								<script type="text/template" id="pe-template-goodsphotos">
						    		<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
						            	<div class="qq-upload-list-selector hide" aria-live="polite" aria-relevant="additions removals">
											<span></span>
										</div>
										<div class="listimg hide">
											<div class="thumbnail col-xs-3 listimgselector">
												<img class="qq-thumbnail-selector" alt="点击上传新图片" src="*value*">
												<input type="hidden" class="qq-edit-filename-selector" name="*name*" tabindex="0" value="*value*">
											</div>
										</div>
										<div class="qq-upload-button-selector qq-upload-button" style="clear:both;">
						                    <a class="btn btn-primary">添加文件</a>
						                </div>
						            </div>
						        </script>
						        <div class="fineuploader" attr-box="goodsphotos-range" attr-name="args[goodsphotos][]" attr-type="list" attr-list="true" attr-template="pe-template-goodsphotos"></div>
							</div>
						</div>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">货号：</label>
				            <div class="col-sm-4">
				            	<input type="text" class="form-control" name="args[goodscode]" needle="needle" msg="您必须输入货号">
				            </div>
				        </div>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">品牌：</label>
				            <div class="col-sm-4">
								<select name="args[goodsbrand]" class="form-control">
									<option value="0">请选择品牌</option>
									{x2;tree:$module['modulebrands'],brand,bid}
									<option value="{x2;v:brand}">{x2;substring:$brands[v:brand]['brandid'],1}{x2;$brands[v:brand]['brandtitle']}</option>
									{x2;endtree}
								</select>
				            </div>
				        </div>

				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">原价：</label>
				            <div class="col-sm-4">
				            	<input type="text" name="args[goodsadvprice]" class="form-control" needle="needle" msg="您必须输入原价">
				            </div>
				        </div>
				    	<div id="itemforms">
				    		{x2;tree:$forms,form,fid}
				    		{x2;if:!v:form['fieldsystem']}
							<div class="form-group">
								<label for="{x2;v:form['id']}" class="control-label col-sm-2">{x2;v:form['title']}</label>
								<div class="col-sm-9">{x2;v:form['html']}</div>
							</div>
							{x2;endif}
							{x2;endtree}
				    	</div>
				    	<div class="form-group">
				            <label for="itemtext" class="control-label col-sm-2">商品介绍：</label>
				            <div class="col-sm-9">
							    <textarea id="itemtext" rows="7" cols="4" class="jckeditor" name="args[goodsdescribe]"></textarea>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="itemtext" class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="btn btn-primary" type="submit">提交</button>
					            <a class="btn btn-default ajax" href="index.php?item-master-items-add" target="datacontent">取消</a>
					            <input type="hidden" name="submit" value="1">
					            <input type="hidden" name="args[goodscatid]" value="{x2;$catid}">
					        </div>
				        </div>
					</form>
					{x2;endif}
				</div>
			</div>
{x2;if:!$userhash}
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}