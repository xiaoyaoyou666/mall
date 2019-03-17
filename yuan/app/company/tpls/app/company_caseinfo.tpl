{x2;include:header}
<body>
	<style type="text/css">
		.heading{background: none!important;color: #595656!important;text-align: left!important;border-bottom: 1px solid #f2f2f2;font-weight: bold;}
	.pull-left ul li{border: none!important;}
	.heading img{width: 25px;height: 25px;margin: 0 20px;}
	.active{color: #333;
    	background: url(app/core/styles/img/menu_icon/active.png) no-repeat!important;
    	background-size: auto 50px!important;
    	background-color: rgba(83,181,126,0.08)!important;}
	</style>
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
		<div class="pull-left" style="border: 1px solid #f2f2f2;">
			<div class="heading" ><img src="app/core/styles/images/qyhy/header_sd.png"/>导&nbsp;&nbsp;&nbsp;&nbsp;航</div>
			<ul>
				<li><a href="index.php?company-app-company-index&companyid={x2;$user['userid']}">企业简介</a></li>
				<li><a href="index.php?company-app-company-news&companyid={x2;$user['userid']}">企业动态</a></li>
                <li><a href="index.php?company-app-company-product&companyid={x2;$user['userid']}">供货范围</a></li>
				<li><a href="index.php?company-app-company-qualification&companyid={x2;$user['userid']}" >荣誉资质</a></li>
				<li class="active"><a href="index.php?company-app-company-project&companyid={x2;$user['userid']}" class="select" >成功案例</a></li>
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
											<!--<li><span class="zmm-gs-title"></span>
												<a class="sc_a r20"><span><img src="app/core/styles/images/qyhy/sc_star.png"></span>收藏</a>
												<a class="sc_a sc_a_on r20"><span><img src="app/core/styles/images/qyhy/qy_star_on.png"></span>已收藏</a>
											</li>-->
                                            <li><span class="zmm-gs-title">{x2;$user['company_name']}</span></li>
                                            <li class="zmm-gs-dj">
												<span id="levelhtml">
                                                    <input type="hidden" id="level" value="{x2;$user['company_level']}">
												</span>
												<span class="zmm-gs-djl">点击量：<span class="zmm-font-bold">{x2;if:$user['click_num']}{x2;$user['click_num']}{x2;else}0{x2;endif}<span></span>
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
                        <div class="zmm_panel panel-default">
                            <div class="zmm-qydt-title zmm-qydt-shsj1"><p>成功案例</p></div>
                            <div class="dt_title">
                                <h2>{x2;$data['case_title']}</h2>
                                <p class="p1">{x2;$data['case_category']}</p>
                                <div class="box_t1 bor_bot"><span class="pull-left">发布时间：{x2;date:$data['create_time'],'Y-m-d'}</span><span class="pull-right">浏览次数：{x2;if:$user['click_num']}{x2;$user['click_num']}{x2;else}0{x2;endif}</span></div>
                                <p><span style="font-weight: bold;clear:both;">项目描述：</span>
                                    {x2;realhtml:$data['case_content']}
                                </p>
                                <p style="font-weight: bold;clear:both;">项目图片：</p>
                                <ul class="qual_box pull-left bor_bot">
                                    {x2;tree:$data['case_url'],vv,cid}
                                        <li class="pull-left">
                                            <img class="pull-left" src="{x2;v:vv}">
                                            <p class="pull-left">{x2;$data['case_title']}</p>
                                        </li>
                                    {x2;endtree}
                                </ul>
                                {x2;if:$uparr}<p class="w45 pull-left">上一篇：<a href="index.php?company-app-company-caseinfo&case_id={x2;$uparr['case_id']}">{x2;$uparr['case_title']}</a></p>{x2;endif}
                                {x2;if:$downarr}<p class="w45 text_r pull-right">下一篇：<a href="index.php?company-app-company-caseinfo&case_id={x2;$downarr['case_id']}">{x2;$downarr['case_title']}</a></p>{x2;endif}
                            </div>
                            <div style="clear:both"></div>
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
    function toShop()
    {
        window.location.href = 'index.php?item-app-company&companyid={x2;$data['userid']}';
    }
</script>