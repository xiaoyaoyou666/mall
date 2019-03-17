{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
			{x2;include:menu}
		</div>
		<div class="span10" id="datacontent">
{x2;endif}
			<ul class="breadcrumb">
				<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a> <span class="divider">/</span></li>
				{x2;if:$catid}
				<li><a href="index.php?{x2;$_app}-master-items">商品管理</a> <span class="divider">/</span></li>
				<li class="active">{x2;$categories[$catid]['catname']}</li>
				{x2;else}
				<li class="active">商品管理</li>
				{x2;endif}
			</ul>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#">商品价格更改日志查看</a>
				</li>

			</ul>
			<h4>{x2;if:$catid}{x2;$categories[$catid]['catname']}{x2;else}所有商品{x2;endif}</h4>

			<form action="index.php?item-master-items-lite" method="post">
				<fieldset>
					<table class="table table-hover">
			            <thead>
			                <tr>
			                    <th>商品名称</th>
			                    <th>商品属性</th>
			                    <th>原始价格</th>
						        <th>更新价格</th>
						        <th>店铺名称</th>
                                <th>更改时间</th>
			                </tr>
			            </thead>
			            <tbody>
			            	{x2;tree:$goodslist['data'],good,cid}
			            	<tr>
			                    <td><a href="index.php?item-app-item&goodsid={x2;v:good['goodsid']}" target="_blank">{x2;v:good['goodstitle']}</a></td>
			                    <td>{x2;v:good['property']}</td>
			                    <td>{x2;v:good['oldprice']}</td>
			                    <td class="picture">{x2;v:good['newprice']}</td>
			                    <td>
			                       {x2;v:good['saler_name']}
			                    </td>
			                    <td>
                                    {x2;date:v:good['updatetime'],'Y-m-d H:i:s'}
			                    </td>

			                </tr>
			                {x2;endtree}
			        	</tbody>
			        </table>

					<div class="pagination pagination-right">
						<ul>{x2;$goodslist['pages']}</ul>
					</div>
				</fieldset>
			</form>
{x2;if:!$userhash}
		</div>
	</div>
</div>
</body>
</html>
{x2;endif}