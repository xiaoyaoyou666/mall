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
							<li><a href="index.php?{x2;$_app}-master-poster">快递管理</a></li>
							<li class="active">添加快递</li>
						</ol>
					</div>
				</div>
				<div class="box itembox">
					<h4 class="title" style="padding:10px;">
						<a href="#">添加快递</a>
						<a class="pull-right btn btn-primary" href="index.php?{x2;$_app}-master-poster">快递列表</a>
					</h4>
					<form action="index.php?{x2;$_app}-master-poster-add" method="post" class="form-horizontal">
						<fieldset>
							<div class="form-group">
							</div>
							<div class="form-group">
								<label for="modulename" class="control-label col-sm-2">快递英文名称</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="args[psid]" value="" datatype="english" needle="needle" msg="您必须输入中文品牌名称">
									<span class="help-block">请输入快递英文名称</span>
								</div>
							</div>
							<div class="form-group">
								<label for="modulename" class="control-label col-sm-2">品牌中文名称</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="args[psname]" value="" needle="needle" msg="您必须输入中文品牌名称">
									<span class="help-block">请输入品牌名称</span>
								</div>
							</div>
							<div class="form-group">
								<label for="catdes" class="control-label col-sm-2"></label>
								<div class="col-sm-9">
									<button class="btn btn-primary" type="submit">提交</button>
						            <input type="hidden" name="page" value="{x2;$page}">
						            <input type="hidden" name="addposter" value="1">
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
{x2;include:footer}
</body>
</html>
{x2;endif}