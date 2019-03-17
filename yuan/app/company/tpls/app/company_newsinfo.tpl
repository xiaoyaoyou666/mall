{x2;include:header}
<body>
{x2;include:nav}
<div class="zmm-zx-centent">
	<div class="container">
		<!-- 导航 start -->
		<div class="hln-zx-centent-title t20 b20">
			你所在的位置：
			<span><a>供应商展示</a> > <a>{x2;$user['company_name']}</a></span>
		</div>
		<!-- 导航 end -->

		<!-- 左侧栏 start -->
		<div class="pull-left">
			<div class="heading">导航</div>
			<ul>
				<li><a href="index.php?company-app-company-index&companyid={x2;$user['userid']}">企业简介</a></li>
				<li><a href="index.php?company-app-company-news&companyid={x2;$user['userid']}" class="select">企业动态</a></li>
				<li><a href="index.php?company-app-company-mainbiz&companyid={x2;$user['userid']}" >主营业务</a></li>
				<li><a href="index.php?company-app-company-qualification&companyid={x2;$user['userid']}" >荣誉资质</a></li>
				<li><a href="index.php?company-app-company-project&companyid={x2;$user['userid']}" >成功案例</a></li>
				<li><a href="index.php?company-app-company-contact&companyid={x2;$user['userid']}" >联系方式</a></li>
                {x2;if:in_array($role,[1,2])}
                <li><a href="index.php?company-app-company-companyMaterials&companyid={x2;$user['userid']}" >企业资质</a></li>
                {x2;endif}
            </ul>
		</div>
		<!-- 左侧栏 end -->

		<!-- 右侧  start -->
		<div class="pull-right">
			<!--公司简介-->
			<div>				<!--公司信息-->
				<div class="zmm_panel panel-default zmm-gsxi">
					<div>
						<div class="zmm-gs-pj">
							<table style="width: 100%">
								<tr>
									<td align="center" valign="top" width="240px">
										<div class="pull-left zmm-gs-pj-logo t20 l20">
											<img src="{x2;if:$user['company_logo_da']}{x2;$user['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}" alt="" style="width: 100%;height: 100%;">
										</div>
									</td>
									<td>
                                        <ul class="pull-left">
                                            <li><span class="zmm-gs-title">{x2;$user['company_name']}</span>
                                                <!--<a class="t_c_on l20">修改企业资料</a>-->
                                                <!--<a class="sc_a r20"><span><img src="app/core/styles/images/qyhy/sc_star.png"></span>收藏</a>
												<a class="sc_a sc_a_on r20"><span><img src="app/core/styles/images/qyhy/qy_star_on.png"></span>已收藏</a>
												-->
                                            </li>
                                            <li class="zmm-gs-dj">
												<span id="levelhtml">
                                                    <input type="hidden" id="level" value="{x2;$user['company_level']}">
												</span>
												<span class="zmm-gs-djl">点击量：<span class="zmm-font-bold">{x2;$user['userreferrer']}<span></span>
                                            </li>
                                            <button onclick="toShop();return false;" class="button_tt dw_tt pull-right" autocomplete="off">进入网格超市</button>
                                        </ul>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>

                <div>
                    <!--成功案例-->
                    <div>
                        <!--成功案例-->
                        <div class="zmm_panel panel-default pull-left" style="width: 100%;">
                            <div class="zmm-qydt-title zmm-qydt-shsj1"><p>动态详情</p></div>
                            <div class="dt_title pull-left">
                                <h2>{x2;$data['news_title']}</h2>
                                <div class="box_t1 bor_bot"><span class="pull-left">发布时间：{x2;date:$data['create_time'],'Y-m-d'}</span><span class="pull-right">浏览次数：23333</span></div>
                                <p><span style="font-weight: bold;">项目概况：</span>
                                    {x2;realhtml:$data['news_content']}
                                </p>
                                <div style="clear: both;float: right;">
                                    {x2;if:$uparr}
                                      <p>上一篇：<a href="index.php?company-app-company-newsInfo&news_id={x2;$uparr['news_id']}">{x2;$uparr['news_title']}</a></p>
                                        {x2;endif}

                                      {x2;if:$downarr}
                                      <p style="clear: both;">下一篇：<a href="index.php?company-app-company-newsInfo&news_id={x2;$downarr['news_id']}">{x2;$downarr['news_title']}</a></p>{x2;endif}
                                </div>
                                <div style="clear:both"></div>
                            </div>
                        </div>
                    </div>
                </div>



			</div>
		</div>
		<!-- 右侧  end -->
	</div>
</div>
{x2;include:footer2}
</body>
</html>

<script>
    $(function(){
        var level = $('#level').val();
        var htmla = '';
        var htmlb = '';
        var reshtml = '推荐指数：';
        for (var i=0;i<level;i++)
        {
            htmla += "<img src='app/core/styles/images/qyhy/qy_star_on.png'>"
        }
        for (var j=0;j<5-level;j++)
        {
            htmlb += "<img src='app/core/styles/images/qyhy/qy_star.png'>"
        }
        reshtml += htmla + htmlb;
        $('#levelhtml').html(reshtml);
    });

    function doSearch()
    {
        var stime = $("#stime").val();
        var etime = $("#etime").val();
        var searchKeyword = $("#keyword").val();
        var url = 'index.php?company-app-company-news&page={x2;$page}&companyid={x2;$companyid}';
        if(searchKeyword != ''){
            url += '&search[keyword]='+searchKeyword;
        }
        if(stime != ''){
            url += '&search[stime]='+stime;
        }
        if(etime != ''){
            url += '&search[etime]='+etime;
        }
        window.location.href = url;
    }

    function toShop()
    {
        window.location.href = 'index.php?item-app-company&companyid={x2;$data['userid']}';
    }

</script>