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
							<li><a href="index.php?{x2;$_app}-company-basic-news&page={x2;$page}">企业动态</a></li>
							<li class="active">发布新动态</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<form action="index.php?user-company-basic-newsedit" method="post" class="form-horizontal">
						<div class="form-group">
				            <label for="news_title" class="control-label col-sm-2">标题：</label>
				            <div class="col-sm-9">
							    <input class="form-control" type="text" id="news_title" name="args[news_title]" needle="needle" msg="您必须输入标题" value="{x2;$data['news_title']}">
					        </div>
				        </div>
				    	<div class="form-group">
				            <label for="news_content" class="control-label col-sm-2">内容</label>
				            <div class="col-sm-10">
							    <textarea id="news_content" rows="7" cols="4" class="ckeditor" name="args[news_content]"  >{x2;$data['news_content']}</textarea>
					        </div>
				        </div>
					</form>
				</div>
			</div>
{x2;if:!$userhash}
		</div>
	</div>
</div>
{x2;include:footer2}
</body>
</html>
{x2;endif}