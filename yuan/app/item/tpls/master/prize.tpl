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
				<li><a href="index.php?{x2;$_app}-master-items">奖品管理</a> <span class="divider">/</span></li>
				<li class="active">{x2;$categories[$catid]['catname']}</li>
				{x2;else}
				<li class="active">奖品管理</li>
				{x2;endif}
			</ul>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#">奖品管理</a>
				</li>
				<li class="dropdown pull-right">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">添加奖品<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li><a href="index.php?item-master-prize-add&page={x2;$page}">添加奖品</a></li>
					</ul>
				</li>
			</ul>

			<form action="index.php?item-master-items-lite" method="post">
				<fieldset>
					<table class="table table-hover">
			            <thead>
			                <tr>
			                    <th>ID</th>
			                    <th>缩略图</th>
						        <th>奖品</th>
						        <th>操作</th>
			                </tr>
			            </thead>
			            <tbody>
			            	{x2;tree:$prizelist['data'],good,cid}
			            	<tr>
			                    <td>{x2;v:good['ID']}</td>
			                    <td class="picture"><img src="{x2;if:v:good['prizeimage']}{x2;v:good['prizeimage']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:24px;"/></td>
			                    <td>
			                        {x2;v:good['prizename']}
			                    </td>

			                    <td class="actions">
			                    	<div class="btn-group">
			                    		<a class="btn" target="_blank" href="index.php?item-master-prize-edit&id={x2;v:good['ID']}" title="修改"><em class="icon-edit"></em></a>
										<a class="btn confirm" href="index.php?item-master-prize-del&id={x2;v:good['ID']}" title="删除"><em class="icon-remove"></em></a>
                                    </div>
			                    </td>
			                </tr>
			                {x2;endtree}
			        	</tbody>
			        </table>
			        <div class="control-group">
			            <div class="controls">
				            <label class="radio inline">
				                <input type="radio" name="action" value="modify" checked/>排序
				            </label>
				            <label class="radio inline">
				                <input type="radio" name="action" value="moveposition" />推荐
				            </label>
							<!--
				            <label class="radio inline">
				                <input type="radio" name="action" value="copycategory"/>复制
				            </label>
				            -->
				            <label class="radio inline">
				                <input type="radio" name="action" value="movecategory" />移动
				            </label>

				            <label class="radio inline">
				                <input type="radio" name="action" value="delete" />删除
				            </label>
				            {x2;tree:$search,arg,sid}
				            <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
				            {x2;endtree}
				            <label class="radio inline">
				            	<button class="btn btn-primary" type="submit">提交</button>
				            </label>
				            <input type="hidden" name="modifycontentsequence" value="1"/>
				            <input type="hidden" name="catid" value="{x2;$catid}"/>
				            <input type="hidden" name="page" value="{x2;$page}"/>
				        </div>
			        </div>
					<div class="pagination pagination-right">
						<ul>{x2;$goods['pages']}</ul>
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