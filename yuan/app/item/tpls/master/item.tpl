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
							<li><a href="index.php?{x2;$_app}-master-items&page={x2;$page}">商品管理</a></li>
							<li class="active">库存管理</li>
						</ol>
					</div>
				</div>
				<div class="box itembox">
					<h4 class="title" style="padding:10px;">
						<a target="_blank" href="index.php?item-app-item&goodsid={x2;$goods['goodsid']}">{x2;$goods['goodstitle']}</a>
						<a class="pull-right btn btn-primary" href="index.php?item-master-items-additem&goodsid={x2;$goods['goodsid']}">添加库存</a>
					</h4>
					<table class="table table-hover table-bordered">
			            <thead>
			                <tr class="info">
			                    <th>ID</th>
			                    <th>缩略图</th>
						        {x2;tree:$fields,field,fid}
						        <th>{x2;v:field['fieldtitle']}</th>
						        {x2;endtree}
								<th>价格</th>
						        <th>库存</th>
						        <th>状态</th>
						        <th width="140">操作</th>
			                </tr>
			            </thead>
			            <tbody>
			            	{x2;tree:$items['data'],item,cid}
			            	<tr>
			                    <td>{x2;v:item['itemid']}</td>
			                    <td class="picture"><img src="{x2;if:v:item['itemthumb']}{x2;v:item['itemthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="height:18px;"/></td>
			                    {x2;tree:$fields,field,fid}
						        <td>{x2;v:item[v:field['field']]}</td>
						        {x2;endtree}
						        <td>{x2;v:item['itemprice']}</td>
						        <td>{x2;v:item['itemnumber']}</td>
						        <td>{x2;if:v:item['itemstatus']}上架{x2;else}<em class="text-warning">下架</em>{x2;endif}</td>
			                    <td class="actions">
			                    	<div class="btn-group">
			                    		<a class="btn" href="index.php?item-master-items-edititem&itemid={x2;v:item['itemid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
										<a class="btn confirm" href="index.php?item-master-items-delitem&itemid={x2;v:item['itemid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
			                    	</div>
			                    </td>
			                </tr>
			                {x2;endtree}
			        	</tbody>
			        </table>
					<ul class="pagination pagination-right">
						{x2;$items['pages']}
					</ul>
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