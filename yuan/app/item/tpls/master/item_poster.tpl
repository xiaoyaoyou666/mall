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
							<li class="active">运费管理</li>
						</ol>
					</div>
				</div>
				<div class="box itembox">
					<h4 class="title" style="padding:10px;">
						<a>{x2;$goods['goodstitle']} {x2;tree:$fields,field,fid}
		            	{x2;if:v:field['fieldsystem']}
		            	{x2;v:field['fieldtitle']}:{x2;$item[v:field['field']]}&nbsp;
		            	{x2;endif}
		            	{x2;endtree}</a>
						<a class="pull-right btn btn-primary" href="index.php?{x2;$_app}-master-items-stock&goodsid={x2;$goods['goodsid']}">库存信息</a>
					</h4>
					<form action="index.php?item-master-items-poster" method="post">
						<table class="table table-hover table-bordered">
				            <thead>

				            </thead>
				            <tbody>
				            	{x2;tree:$posters,poster,psid}
				            	<tr class="info">
				                    <th colspan="2">{x2;v:poster['psname']}</th>
				                </tr>
				            	<tr>
				                    <td width="50%" class="form-inline">
				                    	首件费用 &nbsp;
				                    	<input type="text" class="form-control" name="args[{x2;v:poster['psid']}][first]" value="{x2;$item['itemposter'][v:poster['psid']]['first']}"/>
				                    </td>
				                    <td width="50%" class="form-inline">
				                    	第二件增加费用 &nbsp;
				                    	<input type="text" class="form-control" name="args[{x2;v:poster['psid']}][second]" value="{x2;$item['itemposter'][v:poster['psid']]['second']}"/>
				                    </td>
							    </tr>
				                {x2;endtree}
				        	</tbody>
				        </table>
				        <div class="control-group">
				            <div class="controls">
					            <label class="radio-inline">
					            	<button class="btn btn-primary" type="submit">提交</button>
					            </label>
					            <input type="hidden" name="setitemposter" value="1"/>
					            <input type="hidden" name="itemid" value="{x2;$item['itemid']}"/>
					            <input type="hidden" name="page" value="{x2;$page}"/>
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