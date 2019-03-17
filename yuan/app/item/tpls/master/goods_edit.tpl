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
							<li class="active">编辑商品</li>
						</ol>
					</div>
				</div>
				<div class="box itembox">
					<h4 class="title" style="padding:10px;">
						<a href="#">编辑商品</a>
						<a class="pull-right btn btn-primary" href="index.php?{x2;$_app}-master-items&catid={x2;$catid}&page={x2;$page}">商品管理</a>
					</h4>
					<form action="index.php?item-master-items-edit" method="post" class="form-horizontal">
						<div class="form-group">
				            <label for="itemtitle" class="control-label col-sm-2">标题：</label>
				            <div class="col-sm-9">
							    <input type="text" class="form-control" id="itemtitle" name="args[goodstitle]" needle="needle" msg="您必须输入标题" value="{x2;$goods['goodstitle']}">
							</div>
				        </div>
				        <div class="form-group">
				            <label for="itemtitle" class="control-label col-sm-2">广告语：</label>
				            <div class="col-sm-7">
							    <input type="text" class="form-control" id="goodsadv" name="args[goodsadv]" value="{x2;$goods['goodsadv']}">
							</div>
				        </div>
				        <div class="form-group">
				            <label for="itemtitle" class="control-label col-sm-2">邮费说明：</label>
				            <div class="col-sm-7">
							    <input type="text" class="form-control" id="goodspostinfo" name="args[goodspostinfo]" value="{x2;$goods['goodspostinfo']}">
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
									{x2;tree:$goods['goodsphotos'],photo,pid}
									<div class="thumbnail col-xs-3 listimgselector">
										<img class="qq-thumbnail-selector" alt="点击上传新图片" src="{x2;v:photo}">
										<input type="hidden" class="qq-edit-filename-selector" name="args[goodsphotos][]" tabindex="0" value="{x2;v:photo}">
									</div>
									{x2;endtree}
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
				            	<input type="text" class="form-control" name="args[goodscode]" needle="needle" msg="您必须输入货号" value="{x2;$goods['goodscode']}">
				            </div>
				        </div>
				        <!--
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">满免运费：</label>
				            <div class="col-sm-4">
				            	<input type="text" name="args[goodsfreenumber]" value="{x2;$goods['goodsfreenumber']}" class="form-control" needle="needle" datatype="number" msg="您必须输入满多少数量免运费">
				            </div>
				            <div class="col-sm-4">
				            	 单位
				            </div>
				        </div>
				        -->
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">品牌：</label>
				            <div class="col-sm-4">
								<select class="form-control" name="args[goodsbrand]">
				            	{x2;tree:$module['modulebrands'],brand,bid}
								<option value="{x2;v:brand}"{x2;if:$goods['goodsbrand'] == $brands[v:brand]['brandid']} selected{x2;endif}>{x2;substring:$brands[v:brand]['brandid'],1}{x2;$brands[v:brand]['brandtitle']}</option>
					            {x2;endtree}
								</select>
				            </div>
				        </div>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">原价：</label>
				            <div class="col-sm-4">
				            	<input type="text" name="args[goodsadvprice]" value="{x2;$goods['goodsadvprice']}" class="form-control" needle="needle" msg="您必须输入原价">
				            </div>
				        </div>
				        <!--
		                <div class="form-group">
		                    <label for="block" class="control-label col-sm-2">活动开始时间：</label>
		                    <div class="col-sm-4">
		                        <input type="text" name="args[goodsactivestime]"  class="form-control datetimepicker" data-date-format="yyyy-mm-dd hh:ii:ss" {x2;if:$goods['goodsactivestime']}value="{x2;date:$goods['goodsactivestime'],'Y-m-d H:i:s'}" {x2;endif}>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label for="block" class="control-label col-sm-2">活动结束时间：</label>
		                    <div class="col-sm-4">
		                        <input type="text" name="args[goodsactiveetime]"  class="form-control datetimepicker" data-date-format="yyyy-mm-dd hh:ii:ss" {x2;if:$goods['goodsactiveetime']}value="{x2;date:$goods['goodsactiveetime'],'Y-m-d H:i:s'}" {x2;endif}>
		                    </div>
		                </div>
		                -->
				    	<div id="itemforms">
				    		{x2;tree:$forms,form,fid}
							<div class="form-group">
								<label for="{x2;v:form['id']}" class="control-label col-sm-2">{x2;v:form['title']}</label>
								<div class="col-sm-9">{x2;v:form['html']}</div>
							</div>
							{x2;endtree}
				    	</div>
				    	<div class="form-group">
				            <label for="itemtext" class="control-label col-sm-2">商品介绍：</label>
				            <div class="col-sm-9">
							    <textarea id="itemtext" rows="7" cols="4" class="jckeditor" name="args[goodsdescribe]">{x2;$goods['goodsdescribe']}</textarea>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="itemtext" class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="btn btn-primary" type="submit">提交</button>
					            <a class="btn btn-default ajax" href="index.php?item-master-items" target="datacontent">取消</a>
					            <input type="hidden" name="page" value="{x2;$page}">
					            <input type="hidden" name="submit" value="1">
					            <input type="hidden" name="goodsid" value="{x2;$goods['goodsid']}">
					        </div>
				        </div>
					</form>
				</div>
{x2;if:!$userhash}
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}