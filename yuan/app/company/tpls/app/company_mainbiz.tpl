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
                <li><a href="index.php?company-app-company-index&companyid={x2;$user['userid']}">企业简介1</a></li>
                <li><a href="index.php?company-app-company-news&companyid={x2;$user['userid']}">企业动态</a></li>
                <li class="navlist_on"><a href="index.php?company-app-company-product&companyid={x2;$user['userid']}">供货范围</a></li>
                <li><a href="index.php?company-app-company-qualification&companyid={x2;$user['userid']}" >荣誉资质</a></li>
                <li><a href="index.php?company-app-company-case&companyid={x2;$user['userid']}" >成功案例</a></li>
                <li><a href="index.php?company-app-company-contact&companyid={x2;$user['userid']}" >联系方式</a></li>
               <!--  <li><a href="index.php?company-app-company-companyMaterials&companyid={x2;$user['userid']}" >企业资质</a></li> -->
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
                            <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                                {x2;realhtml:$user['company_mainbusiness']}
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

    function toShop()
    {
        window.location.href = 'index.php?item-app-company&companyid={x2;$data['userid']}';
    }
</script>