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
								<li class="active">推荐位内容管理</li>
							</ol>
						</div>
					</div>
					<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
						<h4 class="title" style="padding:10px;">
							{x2;$position['posname']}
							<a class="pull-right btn btn-primary" href="index.php?{x2;$_app}-master-position">推荐位列表</a>
						</h4>
			            <form action="index.php?item-master-position-content" method="post" class="form-inline">
			                <table class="table">
			                    <tr>
			                        <td style="border-top:0px;">
			                            商品ID：
			                        </td>
			                        <td style="border-top:0px;">
			                            <input name="search[goodsid]" class="form-control" size="15" type="text" class="number" value="{x2;$search['goodsid']}"/>
			                        </td>
			                        <td style="border-top:0px;">
			                            商品名字：
			                        </td>
			                        <td style="border-top:0px;">
			                            <input name="search[goodsname]" class="form-control" size="15" type="text" class="number" value="{x2;$search['goodsname']}"/>
			                        </td>
			                        <td style="border-top:0px;">
			                            <input class="btn btn-primary" type="submit" name="submit" value="搜索" />
			                            <input type="hidden" value="1" name="search[argsmodel]" />
			                            <input type="hidden" value="{x2;$posid}" name="posid" />
			                        </td>
			                    </tr>
			                </table>
			            </form>
						<form action="index.php?{x2;$_app}-master-position-lite" method="post">
							<fieldset>
								<table class="table table-hover table-bordered">
						            <thead>
						                <tr class="info">
						                    <th width="40"><input type="checkbox" class="checkall" target="delids"/></th>
						                    <th width="60">排序</th>
											<th width="60">推荐ID</th>
						                    <th width="60">商品ID</th>
						                    <th width="60">缩略图</th>
						                    <th>商品名称</th>
						                    <th width="100">上下架状态</th>
									        <th width="140">操作</th>
						                </tr>
						            </thead>
						            <tbody>
						            	{x2;tree:$contents['data'],item,cid}
						            	<tr>
						                    <td><input type="checkbox" name="delids[{x2;v:item['pcid']}]" value="1"></td>
						                    <td><input class="form-control" type="text" name="ids[{x2;v:item['pcid']}]" value="{x2;v:item['pcsequence']}" style="width:24px;padding:2px 5px;"/></td>
											<td>{x2;v:item['pcid']}</td>
						                    <td>{x2;v:item['goodsid']}</td>
											<td class="picture"><img src="{x2;if:v:item['goodsthumb']}{x2;v:item['goodsthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:24px;"/></td>
						                    <td>
						                        <a href="index.php?item-app-item&goodsid={x2;v:item['goodsid']}" target="_blank">{x2;v:item['goodstitle']}</a>
						                    </td>
											<td>{x2;if:v:item['goodsstatus'] == 1}上架中 <a title="点击设置下架" class="ajax" href="index.php?item-master-items-goodsdown&goodsid={x2;v:item['goodsid']}"><em class="glyphicon glyphicon-import"></em></a>{x2;else}下架中 <a title="点击设置上架" class="ajax" href="index.php?item-master-items-goodsup&goodsid={x2;v:item['goodsid']}"><em class="glyphicon glyphicon-export"></em></a>{x2;endif}</td>
						                    <td class="actions">
						                    	<div class="btn-group">
						                    		<a class="btn" href="index.php?item-master-items-stock&goodsid={x2;v:item['goodsid']}&page={x2;$page}{x2;$u}" title="库存管理"><em class="glyphicon glyphicon-briefcase"></em></a>
						                    		<a class="btn" target="_blank" href="index.php?item-master-items-edit&catid={x2;v:item['goodscatid']}&goodsid={x2;v:item['goodsid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
													<a class="btn confirm" href="index.php?{x2;$_app}-master-position-delcontent&pcid={x2;v:item['pcid']}" title="删除"><em class="glyphicon glyphicon-trash"></em></a>
			                                   </div>
						                    </td>
						                </tr>
						                {x2;endtree}
						        	</tbody>
						        </table>
						        <div class="control-group">
						            <div class="controls">
							            <label class="radio-inline">
							                <input type="radio" name="action" value="modify" checked/>排序
							            </label>
							            <label class="radio-inline">
							                <input type="radio" name="action" value="delete" />删除
							            </label>
							            {x2;tree:$search,arg,sid}
							            <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
							            {x2;endtree}
							            <label class="radio-inline">
							            	<button class="btn btn-primary" type="submit">提交</button>
							            </label>
							            <input type="hidden" value="{x2;$posid}" name="posid" />
							            <input type="hidden" name="modifycontentsequence" value="1"/>
							            <input type="hidden" name="page" value="{x2;$page}"/>
							        </div>
						        </div>
								<div class="pagination pagination-right">
									<ul>{x2;$contents['pages']}</ul>
								</div>
							</fieldset>
						</form>
					</div>
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