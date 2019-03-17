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
							<li><a href="index.php?{x2;$_app}-master-purchases&page={x2;$page}">内容管理</a></li>
							<li class="active">添加内容</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<h4 class="title" style="padding:10px;">
						添加内容
						<a class="btn btn-primary pull-right" href="index.php?{x2;$_app}-master-purchases&catid={x2;$catid}&page={x2;$page}">内容管理</a>
					</h4>
					<form action="index.php?purchase-master-purchases-add" method="post" class="form-horizontal">
						<div class="form-group">
				            <label for="purchasetitle" class="control-label col-sm-2">标题：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="purchasetitle" name="args[purchasetitle]" needle="needle" msg="您必须输入标题">
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="purchasetitle" class="control-label col-sm-2">发布时间：</label>
				            <div class="col-sm-4">
							    <input class="form-control datetimepicker" data-minview="0" data-date="{x2;date:TIME,'Y-m-d H:i:s'}" data-date-format="yyyy-mm-dd hh:ii:ss" type="text" id="purchasetitle" name="args[purchaseinputtime]" needle="needle" msg="您必须输入发布时间">
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">采购物料：</label>
				            <div class="col-sm-9">
								<a href="javascript:;" onclick="javascript:$('#modal').modal();" class="btn btn-primary">添加</a>
								<table class="table">
									<thead>
									<tr>
										<th>物料名称</th>
										<th>型号</th>
										<th>品牌</th>
										<th>物料描述</th>
										<th>采购量</th>
										<th>图片/图纸(数量)</th>
										<th>操作</th>
									</tr>
									</thead>
									<tbody id="itemlists">
									</tbody>
								</table>
							</div>
				        </div>
				        <div class="form-group">
				            <label for="purchasecatid" class="control-label col-sm-2">分类：</label>
				        	<div class="col-sm-9 form-inline">
							    <select id="purchasecatid" msg="您必须选择一个分类" needle="needle" class="autocombox form-control" name="args[purchasecatid]" refUrl="index.php?purchase-master-category-ajax-getchildcategory&catid={value}">
					            	<option value="">选择一级分类</option>
					            	{x2;tree:$parentcat,cat,cid}
					            	<option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
					            	{x2;endtree}
					            </select>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="purchaselink" class="control-label col-sm-2">站外链接：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="purchaselink" name="args[purchaselink]">
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
							<label for="purchasedescribe" class="control-label col-sm-2">摘要：</label>
							<div class="col-sm-9">
								<textarea id="purchasedescribe" class="form-control" name="args[purchasedescribe]" rows="7" cols="4"></textarea>
							</div>
						</div>
				    	<div class="form-group">
				            <label for="purchasetext" class="control-label col-sm-2">内容</label>
				            <div class="col-sm-10">
							    <textarea id="purchasetext" rows="7" cols="4" class="ckeditor" name="args[purchasetext]"></textarea>
					        </div>
				        </div>
				        <div class="form-group">
				            <label for="purchasetemplate" class="control-label col-sm-2">模版：</label>
				            <div class="col-sm-3">
							    <select class="form-control" name="args[purchasetemplate]" id="purchasetemplate">
					            	{x2;tree:$tpls,tpl,tid}
					            	<option value="{x2;v:tpl}">{x2;v:tpl}</option>
					            	{x2;endtree}
					            </select>
					        </div>
				        </div>
				        <div class="form-group">
				            <label class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="btn btn-primary" type="submit">提交</button>
					            <input type="hidden" name="submit" value="1">
								<input type="hidden" name="args[purchasemoduleid]" value="{x2;$moduleid}">
					        </div>
				        </div>
					</form>
				</div>
			</div>
{x2;if:!$userhash}
		</div>
	</div>
</div>
{x2;include:purchasejs}
{x2;include:footer}
</body>
</html>
{x2;endif}