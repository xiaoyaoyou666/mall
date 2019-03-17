{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
			{x2;include:menu}
		</div>
		<div class="span10" id="dataitem">
{x2;endif}
			<ul class="breadcrumb">
				<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a> <span class="divider">/</span></li>
				<li><a href="index.php?{x2;$_app}-master-prize&page={x2;$page}">奖品管理</a> <span class="divider">/</span></li>
				<li class="active">添加奖品</li>
			</ul>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#">添加奖品</a>
				</li>

			</ul>
			<form action="index.php?item-master-prize-add" method="post" class="form-horizontal">
				<div class="control-group">
		            <label for="itemtitle" class="control-label"></label>
		            <div class="controls">
					    <h4>{x2;$goods['goodstitle']}</h4>
			        </div>
		        </div>
		        <div class="control-group">
		            <label for="block" class="control-label">奖品图片：</label>
		            <div class="controls">
			            <div class="thumbuper pull-left">
							<div class="thumbnail">
								<a href="javascript:;" class="second label""><em class="uploadbutton" id="itemthumb" exectype="thumb"></em></a>
								<div class="first" id="itemthumb_percent"></div>
								<div class="boot"><img src="app/core/styles/images/noimage.gif" id="itemthumb_view"/><input type="hidden" name="args[prizeimage]" value="" id="itemthumb_value"/></div>
							</div>
						</div>
					</div>
		        </div>
		        <div class="control-group">
		            <label for="block" class="control-label">奖品：</label>
		            <div class="controls">
		            	<input type="text" name="args[prizename]" needle="needle" msg="您必须输入奖品名字" value="{x2;$item['prizename']}" >
		            </div>
		        </div>
		        <div class="control-group">
		            <label for="block" class="control-label">所需兑换积分：</label>
		            <div class="controls">
		            	<input type="text" name="args[needcoin]" needle="needle" msg="您必须输入兑换积分" value="{x2;$item['needcoin']}">
		            </div>
		        </div>

		        <div class="control-group">
		            <div class="controls">
			            <button class="btn btn-primary" type="submit">提交</button>
			            <input type="hidden" name="submit" value="1">
			        </div>
		        </div>
			</form>
{x2;if:!$userhash}
		</div>
	</div>
</div>
</body>
</html>
{x2;endif}