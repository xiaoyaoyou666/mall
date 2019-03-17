{x2;include:header}
<style>
	.three_menu {
		margin-right: 8px;
		padding-left: 8px;
		line-height: 30px;
	}
	
	.menu_list {
		margin-left: 40px;
		letter-spacing: 1px;
		color: #777;
	}
	
	.menu_list span {
		color: #777;
	}
	
	.first_menu {
		color: #323232!important;
	}
</style>

<body>

	{x2;include:nav}

	<div class="zmm-zx-centent">
		<div class="container">
			<!-- 导航 start -->
			<div class="hln-zx-centent-title t20 b20">
				你所在的位置：
				<span><a href="index.php?user-company">企业中心</a> > <a>主营业务</a></span>
			</div>
			<!-- 导航 end -->
			<div class="qycenter-content">
				<!-- 左侧栏 start -->
				{x2;include:menu}
				<!-- 左侧栏 end -->

				<!-- 右侧  start -->
				<div class="right-content col10 pull-right primary-business">
					<!--公司简介-->
					<div>
						{x2;include:companyinfo}

						<div class="zmm_panel panel-default">
							<div class="zmm-qydt-title zmm-qydt-shsj1">
								<p><em class="title-triangle"></em>供货范围</p>
								<a href="index.php?{x2;$_app}-company-basic-productedit" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">编辑</a>
							</div>
							<div>
								<ul class="menu_list">
									{x2;tree:$catnameArr,cat,cid}
									<li><span class="first_menu">{x2;v:cat['catparentname']}{x2;v:cat['catname']}</span></li>
									{x2;endtree}
								</ul>
							</div>
							<section class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
								{x2;realhtml:$data['company_mainbusiness']}
							</section>
							<div class="zmm-qydt-title zmm-qydt-shsj1">
								<p><em class="title-triangle"></em>发票类型</p>
							</div>
							<div style="margin-left: 20px;">
								<label class="checkbox-inline hln-checkbox-inline" style="display: inline-block;">
                                    
                                      <span>{x2;$company_invoice}</span>
                                </label>
                               
							</div>

						</div>

						<!-- 右侧  end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	{x2;include:footer2}
	<script>
		$(function() {
			$('.submenu:eq(0)').delay(400).slideDown(700);
			$('.submenu:eq(0) li:eq(3)').addClass("active");
		});
	</script>
</body>

</html>