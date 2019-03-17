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
								<li><a href="index.php?{x2;$_app}-master-position">推荐位</a></li>
								<li class="active">修改推荐位</li>
							</ol>
						</div>
					</div>
					<div class="box itembox">
						<h4 class="title" style="padding:10px;">
							<a href="#">修改推荐位</a>
							<span>
								<a class="pull-right btn btn-primary" href="index.php?{x2;$_app}-master-position">推荐位列表</a>
							</span>
						</h4>
						<form action="index.php?{x2;$_app}-master-position-modify" method="post" class="form-horizontal">
							<fieldset>
								<div class="form-group">
								</div>
								<div class="form-group">
									<label for="modulename" class="control-label col-sm-2">推荐位名称</label>
									<div class="col-sm-9">
										<input class="form-control" name="args[posname]" type="text" value="{x2;$position['posname']}" needle="needle" min="2" max="40" alt="请输入推荐位名称" msg="推荐位名称为不超过40字的中英文字符且不能为空"/>
										<span class="help-block">请输入推荐位名称</span>
									</div>
								</div>
								<div class="form-group">
						            <label for="contenttitle" class="control-label col-sm-2">启用时间：</label>
						            <div class="col-sm-4">
									    <input class="form-control datetimepicker" data-minview="0" data-date="{x2;date:TIME,'Y-m-d H:i:s'}" data-date-format="yyyy-mm-dd hh:ii:ss" type="text" value="{x2;date:$position['goodsposstime'],'Y-m-d H:i:s'}" name="args[goodsposstime]" needle="needle" msg="您必须输入启用时间">
							        </div>
						        </div>
						        <div class="form-group">
						            <label for="contenttitle" class="control-label col-sm-2">结束时间：</label>
						            <div class="col-sm-4">
									    <input class="form-control datetimepicker" data-minview="0" data-date="{x2;date:TIME,'Y-m-d H:i:s'}" data-date-format="yyyy-mm-dd hh:ii:ss" type="text" value="{x2;date:$position['goodsposetime'],'Y-m-d H:i:s'}" name="args[goodsposetime]" needle="needle" msg="您必须输入结束时间">
							        </div>
						        </div>
								<div class="form-group">
									<label for="modulename" class="control-label col-sm-2"></label>
									<div class="col-sm-9">
										<button class="btn btn-primary" type="submit">提交</button>
										<input type="hidden" name="modifypos" value="1"/>
										<input type="hidden" name="posid" value="{x2;$position['posid']}"/>
										<input type="hidden" name="page" value="{x2;$page}"/>
										{x2;tree:$search,arg,aid}
										<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
										{x2;endtree}
									</div>
								</div>
							</fieldset>
						</form>
					</div>
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