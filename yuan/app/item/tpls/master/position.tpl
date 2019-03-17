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
							<li class="active">推荐位</li>
						</ol>
					</div>
				</div>
				<div class="box itembox">
					<h4 class="title" style="padding:10px;">
						<a href="#">推荐位管理</a>
						<span>
							<a class="pull-right btn btn-primary" href="index.php?{x2;$_app}-master-position-add">添加推荐位</a>
						</span>
					</h4>
					<form action="index.php?{x2;$_app}-master-contents-lite" method="post">
						<fieldset>
							<table class="table table-hover table-bordered">
					            <thead>
					                <tr class="info">
					                    <th>ID</th>
					                    <th>名称</th>
								        <th>操作</th>
					                </tr>
					            </thead>
					            <tbody>
					            	{x2;tree:$positions['data'],position,pid}
					            	<tr>
					                    <td width="80">{x2;v:position['posid']}</td>
					                    <td>{x2;v:position['posname']}</td>
					                    <td class="actions" width="180">
					                    	<div class="btn-group">
					                    		<a class="btn " href="index.php?{x2;$_app}-master-position-content&posid={x2;v:position['posid']}" title="列表" ><em class="glyphicon glyphicon-search"></em></a>
		                                        <a class="btn " href="index.php?{x2;$_app}-master-position-modify&posid={x2;v:position['posid']}" title="修改" ><em class="glyphicon glyphicon-edit"></em></a>
		                                        <a class="btn confirm" href="index.php?{x2;$_app}-master-position-del&posid={x2;v:position['posid']}" title="删除" msg="删除推荐位后，推荐位中的内容会被同时删除，确定要删除吗？"><em class="glyphicon glyphicon-trash"></em></a>
					                    	</div>
					                    </td>
					                </tr>
					                {x2;endtree}
					        	</tbody>
					        </table>
							<div class="pagination pagination-right">
								<ul>{x2;$positions['pages']}</ul>
							</div>
						</fieldset>
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