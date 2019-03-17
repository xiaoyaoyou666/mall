{x2;include:header}
<body>
	
{x2;include:nav}
<style>
	.company-introduction{
		margin-bottom: 10px;
	}

	.company-introduction.rows-style{
		position: relative; line-height: 20px; max-height: 40px;overflow: hidden;
	}
	.company-introduction.rows-style:after{
		content: "...更多"; position: absolute; bottom: 0; right: 0; padding-left: 40px;
		color: #009944;
		cursor: pointer;
		background: -webkit-linear-gradient(left, transparent, #fff 55%);
		background: -o-linear-gradient(right, transparent, #fff 55%);
		background: -moz-linear-gradient(right, transparent, #fff 55%);
		background: linear-gradient(to right, transparent, #fff 55%);
	}
	.zmm-qydt-shsj {
		text-indent: initial;
	}
	.heading{background: none!important;color: #595656!important;text-align: left!important;border-bottom: 1px solid #f2f2f2;font-weight: bold;}
	.pull-left ul li{border: none!important;}
	.heading img{width: 25px;height: 25px;margin: 0 20px;}
	.active{color: #333;
    	background: url(app/core/styles/img/menu_icon/active.png) no-repeat!important;
    	background-size: auto 50px!important;
    	background-color: rgba(83,181,126,0.08)!important;}
    .yellow-text {
          font-size: 14px;
         color: #ff8a00;
    }
</style>
<div class="zmm-zx-centent">
	<div class="container">
		<!-- 导航 start -->
		<div class="hln-zx-centent-title t20 b20">
			你所在的位置：
			<span><a>供应商展示</a> > <a>{x2;$data['company_name']}</a></span>
		</div>
		<!-- 导航 end -->

		<!-- 左侧栏 start -->
		<div class="pull-left" style="border: 1px solid #f2f2f2;">
			<div class="heading"><img src="app/core/styles/images/qyhy/header_sd.png"/>导&nbsp;&nbsp;&nbsp;&nbsp;航</div>
			<ul>
				<li class="active"><a href="index.php?company-app-company-index&companyid={x2;$data['userid']}" class="select">企业简介</a></li>
				<li><a href="index.php?company-app-company-news&companyid={x2;$data['userid']}">企业动态</a></li>
				<li><a href="index.php?company-app-company-product&companyid={x2;$data['userid']}">供货范围</a></li>
				<li><a href="index.php?company-app-company-qualification&companyid={x2;$data['userid']}" >荣誉资质</a></li>
				<li><a href="index.php?company-app-company-project&companyid={x2;$data['userid']}" >成功案例</a></li>
				<li><a href="index.php?company-app-company-contact&companyid={x2;$data['userid']}" >联系方式</a></li>
                {x2;if:in_array($role,[1,2])}
				<li><a href="index.php?company-app-company-companyMaterials&companyid={x2;$data['userid']}" >企业资质</a></li>
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
											<img src="{x2;if:$data['company_logo_da']}{x2;$data['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}" alt="" style="width:100%;height: 100%">
										</div>
									</td>
									<td>
										<ul class="pull-left">
											<li><span class="zmm-gs-title">{x2;$data['company_name']}</span>
												<!--<a class="t_c_on l20">修改企业资料</a>-->
                                                <!--<a class="sc_a r20"><span><img src="app/core/styles/images/qyhy/sc_star.png"></span>收藏</a>
												<a class="sc_a sc_a_on r20"><span><img src="app/core/styles/images/qyhy/qy_star_on.png"></span>已收藏</a>
												-->
											</li>
                                            <li class="zmm-gs-dj">
												<span id="levelhtml">
                                                    <input type="hidden" id="level" value="{x2;$data['company_level']}">
												</span>
												<span class="zmm-gs-djl">点击量：<span class="zmm-font-bold">{x2;$data['userreferrer']}<span></span>
                                            </li>
                                            <button onclick="toShop();return false;" class="button_tt dw_tt pull-right" autocomplete="off">进入网格超市</button>
										</ul>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!--企业简介-->
				<div class="zmm_panel panel-default">
					<div class="zmm-qydt-title zmm-qydt-shsj1"><p>企业简介</p>
                          {x2;if:in_array($role,[1,2])}
						  <a href="index.php?company-app-company-indexedit&companyid={x2;$data['userid']}" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 40px;line-height: 40px;">修改企业简介</a>
                          {x2;endif}
					</div>
					<div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">

						<div class="company-introduction">
							{x2;realhtml:$data['company_intro']}
						</div>

                        <table>
							<tr class="table-tr1">
								<td class="table-td1">
									企业全称
								</td>
								<td class="table-td2">
                                    {x2;$data['company_name']}
                                </td>
							</tr>
							<tr class="table-tr2">
								<td class="table-td1">
									公司地址
								</td>
								<td class="table-td2">
                                    {x2;$data['company_address']}
								</td>
							</tr>
							<tr class="table-tr2">
								<td class="table-td1">
									成立时间
								</td>
								<td class="table-td2">
                                    {x2;$data['company_createtime']}
                                </td>
							</tr>
							<tr class="table-tr2">
								<td class="table-td1">
									企业人数
								</td>
								<td class="table-td2">
                                    {x2;$data['company_members']} 人
								</td>
							</tr>
							<tr class="table-tr2">
								<td class="table-td1">
									注册资金
								</td>
								<td class="table-td2">
                                    {x2;$data['company_capital']} 万元
								</td>
							</tr>
							<tr class="table-tr2">
                                <td class="table-td1">
                                    企业法人
                                </td>
                                <td class="table-td2">{x2;$data['company_leader']}
                                </td>
                            </tr>
                            <tr class="table-tr2">
                                <td class="table-td1">
                                    经营范围
                                </td>
                                <td class="table-td2">{x2;$data['company_scope']}
                                </td>
                            </tr>
                            <tr class="table-tr2">
                                <td class="table-td1">
                                    联系人
                                </td>
                                <td class="table-td2">{x2;$data['company_contacter']}
                                </td>
                            </tr>
						</table>

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

        //判断企业简介是不是大于3行
        if($('.company-introduction p').length){
			if($('.company-introduction p').height() >= 90){
				// var html = '<span onlick="showMore(this)">...更多</span>';
                $('.company-introduction').addClass('rows-style');
                // $('.company-introduction p').append(html);
			}
		}

		$(document).on('click','.company-introduction.rows-style',function () {
            $(this).removeClass('rows-style');
        })
    });

    function toShop()
    {
        window.location.href = 'index.php?item-app-company&companyid={x2;$data['userid']}';
    }
</script>