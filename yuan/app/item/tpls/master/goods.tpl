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
							{x2;if:$catid}
							<li><a href="index.php?{x2;$_app}-master-items">商品管理</a></li>
							<li class="active">{x2;$categories[$catid]['catname']}</li>
							{x2;else}
							<li class="active">商品管理</li>
							{x2;endif}
						</ol>
					</div>
				</div>
				<div class="box itembox">
					<h4 class="title" style="padding:10px;">
						<a href="#">{x2;if:$catid}{x2;$categories[$catid]['catname']}{x2;else}所有商品{x2;endif}</a>
						<span class="dropdown pull-right">
							<a data-toggle="dropdown" class="dropdown-toggle btn btn-primary" href="#">添加内容<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href="index.php?item-master-items-add">添加内容</a></li>
								<li><a href="index.php?item-master-items&catid={x2;$categories[$catid]['catparent']}&page={x2;$page}">上级分类</a></li>
							</ul>
						</span>
					</h4>
					<form action="index.php?item-master-items" method="post" class="form-inline">
						<table class="table">
					        <tr>
								<td style="border-top:0px;">
									内容ID：
								</td>
								<td style="border-top:0px;">
									<input name="search[goodsid]" class="form-control" size="15" type="text" class="number" value="{x2;$search['goodsid']}"/>
								</td>
								<td style="border-top:0px;">
									录入时间：
								</td>
								<td style="border-top:0px;">
									<input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>
								</td>
								<td style="border-top:0px;">
									关键字：
								</td>
								<td style="border-top:0px;">
									<input class="form-control" name="search[keyword]" size="15" type="text" value="{x2;$search['keyword']}"/>
								</td>
							</tr>
					        <tr>
								<td>
									分类：
								</td>
								<td colspan="3">
							  		<div class="form-inline control-group">
								  		<select msg="您必须选择一个分类" class="autocombox form-control" name="search[goodscatid]" refUrl="index.php?item-master-category-ajax-getchildcategory&catid={value}">
							            	<option value="">选择一级分类</option>
							            	{x2;tree:$parentcat,cat,cid}
							            	<option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
							            	{x2;endtree}
							            </select>
						            </div>
					        	</td>
					        	<td>
									<select class="form-control" name="search[goodstatus]">
						            	<option value="">状态不限</option>
						            	<option value="1"{x2;if:$search[goodstatus] == 1} selected{x2;endif}>已上架</option>
						            	<option value="-1"{x2;if:$search[goodstatus] == -1} selected{x2;endif}>未上架</option>
						            </select>
								</td>
					        	<td>
									<button class="btn btn-primary" type="submit">搜索</button>
								</td>
					        </tr>
						</table>
						<div class="input">
							<input type="hidden" value="1" name="search[argsmodel]" />
						</div>
					</form>
					<form action="index.php?item-master-items-lite" method="post">
						<fieldset>
							<table class="table table-hover table-bordered">
					            <thead>
					                <tr class="info">
					                    <th><input type="checkbox" class="checkall" target="delids"/></th>
					                    <th>权重</th>
					                    <th>ID</th>
					                    <th>缩略图</th>
								        <th>标题</th>
								        <th>分类</th>
		                                <th>上下架</th>
								        <th>发布时间</th>
								        <th width="180">操作</th>
					                </tr>
					            </thead>
					            <tbody>
					            	{x2;tree:$goods['data'],good,cid}
					            	<tr>
					                    <td><input type="checkbox" name="delids[{x2;v:good['goodsid']}]" value="1"></td>
					                    <td><input class="form-control" type="text" name="ids[{x2;v:good['goodsid']}]" value="{x2;v:good['goodssequence']}" style="width:36px;padding:2px 5px;"/></td>
					                    <td>{x2;v:good['goodsid']}</td>
					                    <td class="picture"><img src="{x2;if:v:good['goodsthumb']}{x2;v:good['goodsthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:24px;"/></td>
					                    <td>
					                        <a href="index.php?item-app-item&goodsid={x2;v:good['goodsid']}" target="_blank">{x2;v:good['goodstitle']}</a>
					                    </td>
					                    <td>
					                    	<a href="index.php?item-master-items&catid={x2;v:good['goodscatid']}" target="">{x2;$categories[v:good['goodscatid']]['catname']}</a>
					                    </td>
		                                <td>{x2;if:v:good['goodsstatus'] == 1}上架中 <a title="点击设置下架" class="ajax" href="index.php?item-master-items-goodsdown&goodsid={x2;v:good['goodsid']}"><em class="glyphicon glyphicon-import"></em></a>{x2;else}下架中 <a title="点击设置上架" class="ajax" href="index.php?item-master-items-goodsup&goodsid={x2;v:good['goodsid']}"><em class="glyphicon glyphicon-export"></em></a>{x2;endif}</td>
					                    <td>
					                    	{x2;date:v:good['goodstime'],'Y-m-d'}
					                    </td>
					                    <td class="actions">
					                    	<div class="btn-group">

					                    		<a class="btn" href="index.php?item-master-items-stock&goodsid={x2;v:good['goodsid']}{x2;$u}" title="库存管理"><em class="glyphicon glyphicon-briefcase"></em></a>
					                    		<a class="btn" target="_blank" href="index.php?item-master-items-edit&catid={x2;v:good['goodscatid']}&goodsid={x2;v:good['goodsid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
												<a class="btn" target="_blank" href="index.php?item-master-items-history&goodsid={x2;v:good['goodsid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-paperclip"></em></a>
												<a class="btn confirm" href="index.php?item-master-items-del&catid={x2;v:good['goodscatid']}&goodsid={x2;v:good['goodsid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
					                    	<!--    <a class="btn" href="index.php?item-master-items-setcuxiao&goodsid={x2;v:good['goodsid']}" title="设置为促销产品"><em class="icon-cog"></em></a>-->
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
						                <input type="radio" name="action" value="up" />上架
						            </label>
						            <label class="radio-inline">
						                <input type="radio" name="action" value="down" />下架
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
						            <input type="hidden" name="modifycontentsequence" value="1"/>
						            <input type="hidden" name="catid" value="{x2;$catid}"/>
						            <input type="hidden" name="page" value="{x2;$page}"/>
						        </div>
					        </div>
							<ul class="pagination pull-right">{x2;$goods['pages']}</ul>
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