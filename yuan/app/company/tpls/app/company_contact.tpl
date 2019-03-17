{x2;include:header}
<style>
    .control-label {
        width: 135px !important;
        font-weight: 500;
        color: #000;
        margin-left: 50px;
    }
    .control-label{text-align:right;padding-right:4px}
    .lxwm_table .table-td1{width:147px}
    .col-md-3{padding-left:0px}
    .table-td2{padding-left:12px}
    .zmm-panel-body{padding-top:0}
    .table-td2{padding-left: 7px;}
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
        <div class="pull-left" style="border: 1px solid #f2f2f2;">
            <div class="heading"><img src="app/core/styles/images/qyhy/header_sd.png"/>导&nbsp;&nbsp;&nbsp;&nbsp;航</div>
            <ul>
                <li>	<a href="index.php?company-app-company-index&companyid={x2;$user['userid']}">企业简介</a></li>
                <li><a href="index.php?company-app-company-news&companyid={x2;$user['userid']}">企业动态</a></li>
                <li><a href="index.php?company-app-company-product&companyid={x2;$user['userid']}" >供货范围</a></li>
                <li><a href="index.php?company-app-company-qualification&companyid={x2;$user['userid']}">荣誉资质</a></li>
                <li><a href="index.php?company-app-company-project&companyid={x2;$user['userid']}">成功案例</a></li>
                <li class="active"><a href="index.php?company-app-company-contact&companyid={x2;$user['userid']}" class="select">联系方式</a></li>
                {x2;if:in_array($role,[1,2])}
                <li><a href="index.php?company-app-company-companyMaterials&companyid={x2;$user['userid']}">企业资质</a>
                </li>
                {x2;endif}
            </ul>
        </div>
        <!-- 左侧栏 end -->
        <!-- 右侧  start -->
        <div class="pull-right">
            <!--公司简介-->
            <div>                <!--公司信息-->
                <div class="zmm_panel panel-default zmm-gsxi">
                    <div>
                        <div class="zmm-gs-pj">
                            <table style="width: 100%">
                                <tr>
                                    <td align="center" valign="top" width="240px">
                                        <div class="pull-left zmm-gs-pj-logo t20 l20">
                                            <img src="{x2;if:$user['company_logo_da']}{x2;$user['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}"
                                                 alt="" style="width: 100%;height: 100%;">
                                        </div>
                                    </td>
                                    <td>
                                        <ul class="pull-left">
                                            <li><span class="zmm-gs-title">{x2;$user['company_name']}</span>
                                            </li>
                                            <li class="zmm-gs-dj">
												<span id="levelhtml">
                                                    <input type="hidden" id="level" value="{x2;$user['company_level']}">
												</span>
                                                <span class="zmm-gs-djl">点击量：<span
                                                            class="zmm-font-bold">{x2;$user['userreferrer']}<span></span>
                                            </li>
                                            <button onclick="toShop();return false;" class="button_tt dw_tt pull-right"
                                                    autocomplete="off">进入网格超市
                                            </button>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="zmm_panel panel-default">
                    <div class="zmm-qydt-title zmm-qydt-shsj1">
                        <p>联系我们</p>
                         {x2;if:in_array($role,[1,2])}
                         <a href="index.php?company-app-company-contactedit&companyid={x2;$user['userid']}" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 40px;line-height: 40px;">编辑</a>
                          {x2;endif}
                    </div>
                    <div class="form-group row" style="margin-top:30px">
                        <label class="control-label col-md-4">第一联系人：</label>
                        <div class="col-md-3">
                            <p>{x2;$user['company_contacter']}</p>
                        </div>
                        <label class="control-label col-md-4">第二联系人：</label>
                        <div class="col-md-3">
                            <p>{x2;$userContacts['contacts_name']}</p>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="control-label col-md-4">手机号：</label>
                        <div class="col-md-3">
                            <p>{x2;$user['company_phone']}</p>
                        </div>
                        <label class="control-label col-md-4">手机号：</label>
                        <div class="col-md-3">
                            <p>{x2;$userContacts['user_phone']}</p>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="control-label col-md-4">固定电话：</label>
                        <div class="col-md-3">
                            <p>{x2;$user['company_tel']}</p>
                        </div>
                        <label class="control-label col-md-4">固定电话：</label>
                        <div class="col-md-3">
                            <p>{x2;$userContacts['user_tel']}</p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-4">邮箱：</label>
                        <div class="col-md-3">
                            <p>{x2;$user['company_email']}</p>
                        </div>
                        <label class="control-label col-md-4">邮箱：</label>
                        <div class="col-md-3">
                            <p>{x2;$userContacts['user_mail']}</p>
                        </div>
                    </div>
                    <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                        <table class="lxwm_table">
                            <tbody>
                            <tr class="table-tr2">
                                <td class="table-td1">企业官网：</td>
                                <td class="table-td2">
                                    <a target="_blank" href="http://{x2;$user['company_url']}">{x2;$user['company_url']}</a>
                                </td>
                            </tr>
                            <tr class="table-tr2" style="height:53px">
                                <td class="table-td1">企业地址：</td>
                                <td class="table-td2">{x2;$user['cityInfo']}{x2;$user['company_address']}</td>
                            </tr>
                            </tbody>
                        </table>
                        <p style="padding-left: 36px;"><span style="float: left">企业位置图：</span><img style="width: 396px;min-width:396px;height: auto;float:left;margin-bottom: 30px;padding-top: 10px" src="{x2;$user['company_map']}"></p>
                        <div style="clear:both"></div>
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
    $(function () {
        var level = $('#level').val();
        var htmla = '';
        var htmlb = '';
        var reshtml = '推荐指数：';
        for (var i = 0; i < level; i++) {
            htmla += "<img src='app/core/styles/images/qyhy/qy_star_on.png'>"
        }
        for (var j = 0; j < 5 - level; j++) {
            htmlb += "<img src='app/core/styles/images/qyhy/qy_star.png'>"
        }
        reshtml += htmla + htmlb;
        $('#levelhtml').html(reshtml);
    });
    function toShop() {
        window.location.href = 'index.php?item-app-company&companyid={x2;$data['userid']}';
    }
</script>