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
							<li><a href="index.php?{x2;$_app}-master-items&page={x2;$page}">库存管理</a></li>
							<li class="active">添加库存</li>
						</ol>
					</div>
				</div>
				<div class="box itembox">
					<h4 class="title" style="padding:10px;">
						<a href="#">{x2;$goods['goodstitle']}</a>
						<a class="pull-right btn btn-primary" href="index.php?{x2;$_app}-master-items-stock&goodsid={x2;$goods['goodsid']}">库存信息</a>
					</h4>
					<form action="index.php?item-master-items-additem" method="post" class="form-horizontal">
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">图片：</label>
				            <div class="col-sm-9">
					            <script type="text/template" id="pe-template-itemthumb">
						    		<div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
						            	<div class="qq-upload-button-selector" style="clear:both;">
						                	<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
								                <li class="text-center">
								                    <div class="thumbnail">
														<img class="qq-thumbnail-selector" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[itemthumb]" tabindex="0">
													</div>
								                </li>
								            </ul>
								            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
									            <li class="text-center">
									                <div class="thumbnail">
														<img class="qq-thumbnail-selector" src="{x2;if:$item['itemthumb']}{x2;$item['itemthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[itemthumb]" tabindex="0" value="{x2;if:$item['itemthumb']}{x2;$item['itemthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
						                			</div>
									            </li>
									        </ul>
						                </div>
						            </div>
						        </script>
						        <div class="fineuploader" attr-type="thumb" attr-template="pe-template-itemthumb"></div>
							</div>
				        </div>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">价格：</label>
				            <div class="col-sm-4">
				            	<input type="text" class="form-control" name="args[itemprice]" needle="needle" msg="您必须输入批发价" value="{x2;$item['itemprice']}" datatype="price">
				            </div>
				        </div>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">库存：</label>
				            <div class="col-sm-4">
				            	<input type="text" name="args[itemnumber]" needle="needle" class="form-control" msg="您必须输入库存">
				            </div>
				        </div>
				        <div id="itemforms">
				    		{x2;tree:$forms,form,fid}
							<div class="form-group">
								<label for="{x2;v:form['id']}" class="control-label col-sm-2">{x2;v:form['title']}</label>
								<div class="col-sm-9">{x2;v:form['html']}</div>
							</div>
							{x2;endtree}
				    	</div>
				    	<div class="form-group">
				            <label for="block" class="control-label col-sm-2">状态：</label>
				            <div class="col-sm-9">
				            	<label class="radio-inline"><input type="radio" name="args[itemstatus]" value="1" /> 上架</label>
				            	<label class="radio-inline"><input type="radio" name="args[itemstatus]" value="0" checked /> 下架</label>
				            </div>
				        </div>
				        <div class="form-group">
				            <label class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="btn btn-primary" type="submit">提交</button>
					            <input type="hidden" name="args[itemgoodsid]" value="{x2;$goods['goodsid']}">
					            <input type="hidden" name="submit" value="1">
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