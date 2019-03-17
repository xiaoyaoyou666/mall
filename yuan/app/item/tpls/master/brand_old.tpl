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
							<li class="active">品牌管理</li>
						</ol>
					</div>
				</div>
				<div class="box itembox">
					<h4 class="title" style="padding:10px;">
						<a href="#">品牌管理</a>
						<a class="pull-right btn btn-primary" href="index.php?item-master-brands-add&page={x2;$page}">添加品牌</a>
					</h4>
					<form action="index.php?item-master-brands" method="post" class="form-inline">
						<table class="table">
							<tr>
								<td style="border-top:0px;">
									品牌中文名称：
								</td>
								<td style="border-top:0px;">
									<input name="search[brandtitle]" class="form-control" size="15" type="text" class="number" value="{x2;$search['brandtitle']}"/>
								</td>
								<td style="border-top:0px;">
									品牌英文名称：
								</td>
								<td style="border-top:0px;">
									<input name="search[brandid]" class="form-control" size="15" type="text" class="number" value="{x2;$search['brandid']}"/>
								</td>
								<td style="border-top:0px;">
									<button class="btn btn-primary" type="submit">搜索</button>
								</td>
							</tr>

						</table>
						<div class="input">
							<input type="hidden" value="1" name="search[argsmodel]" />
						</div>
					</form>
					<form action="index.php?item-master-brands-batdel" method="post">
						<fieldset>
							<table class="table table-hover table-bordered">
					            <thead>
					                <tr class="info">
					                    <th><input type="checkbox" class="checkall" target="delids"/></th>
					                    <th>缩略图</th>
					                    <th>品牌英文名</th>
								        <th>品牌中文名</th>
								        <th>品牌所属国家</th>
								        <th width="120">操作</th>
					                </tr>
					            </thead>
					            <tbody>
					            	{x2;tree:$brands['data'],brand,bid}
					            	<tr>
					                    <td><input type="checkbox" name="delids[{x2;v:brand['brandid']}]" value="1"></td>
					                    <td class="picture"><img src="{x2;if:v:brand['brandthumb']}{x2;v:brand['brandthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="height:48px;"/></td>
					                    <td>{x2;v:brand['brandid']}</td>
					                    <td>
					                        {x2;v:brand['brandtitle']}
					                    </td>
					                    <td>
					                        {x2;v:brand['brandcountry']}
					                    </td>
					                    <td class="actions">
					                    	<div class="btn-group">
					                    		<a class="btn" href="index.php?item-master-brands-edit&brandid={x2;v:brand['brandid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
												<a class="btn confirm" href="index.php?item-master-brands-del&brandid={x2;v:brand['brandid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
					                    	</div>
					                    </td>
					                </tr>
					                {x2;endtree}
					        	</tbody>
					        </table>
					        <div class="control-group">
					        	<div class="controls">
						            <label class="radio-inline">
						                <input type="radio" name="action" class="btn confirm" value="delete" checked/>删除
						            </label>
						            {x2;tree:$search,arg,sid}
						            <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
						            {x2;endtree}
						            <label class="radio-inline">
						            	<button class="btn btn-primary confirm" type="submit">删除</button>
						            </label>
						            <input type="hidden" name="page" value="{x2;$page}"/>
						        </div>
					        </div>
							<ul class="pagination pull-right">
								{x2;$brands['pages']}
							</ul>
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