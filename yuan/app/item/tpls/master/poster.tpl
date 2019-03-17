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
							<li class="active">快递管理</li>
						</ol>
					</div>
				</div>
				<div class="box itembox">
					<h4 class="title" style="padding:10px;">
						<a href="#">快递管理</a>
						<a class="pull-right btn btn-primary" href="index.php?item-master-poster-add&page={x2;$page}">添加快递</a>
					</h4>
					<table class="table table-hover table-bordered">
			            <thead>
			                <tr class="info">
			                    <th>快递英文名</th>
						        <th>快递中文名</th>
						        <th width="120">操作</th>
			                </tr>
			            </thead>
			            <tbody>
			            	{x2;tree:$posters,poster,pid}
			            	<tr>
			                    <td>{x2;v:poster['psid']}</td>
			                    <td>
			                        {x2;v:poster['psname']}
			                    </td>
			                    <td class="actions">
			                    	<div class="btn-group">
			                    		<a class="btn confirm" msg="删除本快递后，用户将不能选择此快递作为收货快递" href="index.php?item-master-poster-del&psid={x2;v:poster['psid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
			                    	</div>
			                    </td>
			                </tr>
			                {x2;endtree}
			        	</tbody>
			        </table>
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