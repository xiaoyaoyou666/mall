{x2;include:header}

<body>
	{x2;include:nav}
	<div class="zmm-zx-centent">
		<div class="container">
			<!-- 导航 start -->
			<div class="hln-zx-centent-title t20 b20">
				你所在的位置：
				<span><a href="index.php">企业中心</a> > <a>我的收藏</a> > <a>我收藏的供应商</a></span>
			</div>
			<!-- 导航 end -->
			<div class="qycenter-content">
				<!-- 左侧栏 start -->
				{x2;include:menu}
				<!-- 左侧栏 end -->

				<!-- 右侧  start -->
				<div class="right-content col10 pull-right">
					<div class="zmm_panel panel-default">
						<div class="zmm-qydt-title zmm-qydt-shsj1">
							<p><em class="title-triangle"></em>我收藏的供应商</p>
						
						</div>
						<div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
							<form action="index.php?user-company-items-lite" method="post">

								<fieldset>
									<table class="table table-hover table-bordered">
										<thead style="background:#f5f5f5;color:#333">
											<tr>
												<th>ID</th>
												<th>企业名称</th>
												<th>供应商编码</th>
												<th>注册手机</th>
												<th>收藏时间</th>
												<th>收藏数</th>
											</tr>
										</thead>
										<tbody>
										{x2;tree:$users,user,uid}
                                        <tr>
             								<td>{x2;v:user['userid']}</td>
             								<td>{x2;v:user['company_name']}</td>
             								<td>{x2;v:user['useropenid']}</td>
             								<td>{x2;v:user['company_mobile']}</td>
             								<td>{x2;date:v:user['createtime'],'Y-m-d'}</td>
             								<td>{x2;v:user['company_num']}</td>
                                        </tr>
                                        {x2;endtree}
										</tbody>
									</table>
								
								</fieldset>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	{x2;include:footer2}
	<script>
    $(function() {
        $('.submenu:eq(6)').delay(400).slideDown(700);
        $('.submenu:eq(6) li:eq(1)').addClass("active");
    });
    </script>
</body>

</html>