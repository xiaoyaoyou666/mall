{x2;include:header}
<body>
{x2;include:nav}
<style>
    .control-label {
        width: 135px !important;
        font-weight: 500;
        color: #000;
        margin-left: 50px;
    }
    .control-label{text-align:right;padding-right:4px}
    .lxwm_table .table-td1{width:113px}
    .col-md-3{padding-left:0px}
    .table-td2{padding-left:12px}
    .zmm-panel-body{padding-top:0}
    .table-td2{padding-left: 7px;}
    .zmm_panel{margin-bottom: 0px;background-color: #fff;padding-bottom: 0px;}
    .zmm-qy-dtxx{line-height:40px}
</style>
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>联系我们</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->
            <!-- 右侧  start -->
            <div class="right-content col10 pull-right contact-us">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}
                <!--我的模块开始-->
                <div class="zmm_panel panel-default" >
                    <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                    <div class="zmm-qydt-title zmm-qydt-shsj1">
                        <p><em class="title-triangle"></em>联系我们</p >
                        <a href="index.php?{x2;$_app}-company-basic-contactedit" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">编辑</a>
                    </div>
                        <div class="zmm_panel panel-default" style="border:none;">
                        <div class="form-group row" style="margin-top: 30px">
                            <label class="control-label col-md-4">第一联系人：</label>
                            <div class="col-md-3">
                                <p>{x2;$data['company_contacter']}</p>
                            </div>
                            <label class="control-label col-md-4">第二联系人：</label>
                            <div class="col-md-3">
                                <p>{x2;$userContacts['contacts_name']}</p>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="control-label col-md-4">手机号：</label>
                            <div class="col-md-3">
                                <p>{x2;$data['company_phone']}</p>
                            </div>
                            <label class="control-label col-md-4">手机号：</label>
                            <div class="col-md-3">
                                <p>{x2;$userContacts['user_phone']}</p>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="control-label col-md-4">固定电话：</label>
                            <div class="col-md-3">
                                <p>{x2;$data['company_tel']}</p>
                            </div>
                            <label class="control-label col-md-4">固定电话：</label>
                            <div class="col-md-3">
                                <p>{x2;$userContacts['user_tel']}</p>
                            </div>
                        </div>
                        <div class="form-group row" style="margin-bottom: 0">
                            <label class="control-label col-md-4">邮箱：</label>
                            <div class="col-md-3">
                                <p>{x2;$data['company_email']}</p>
                            </div>
                            <label class="control-label col-md-4">邮箱：</label>
                            <div class="col-md-3">
                                <p>{x2;$userContacts['user_mail']}</p>
                            </div>
                        </div>
                    </div>
                    <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                        <table class="lxwm_table" style="margin-left:35px;margin-top: 5px">
                            <tbody>
                            <tr class="table-tr2">
                                <td class="table-td1">企业官网：</td>
                                <td class="table-td2">
                                    <a target="_blank" href="{x2;$data['company_url']}">{x2;$data['company_url']}</a>
                                </td>
                            </tr>
                            <tr class="table-tr2">
                                <td class="table-td1">企业地址：</td>
                                <td class="table-td2">{x2;$data['cityInfo']}{x2;$data['company_address']}</td>
                            </tr>
                            <tr class="table-tr2">
                                <td class="table-td1">企业邮箱：</td>
                                <td class="table-td2">{x2;$data['useremail']}</td>
                            </tr>
                            </tbody>
                        </table>
                        <p style="padding-left: 66px;"><span style="float: left">企业位置图：</span><img style="width: 396px;min-width:396px;height: auto;float:left;margin-bottom: 30px;padding-top: 10px" src="{x2;$data['company_map']}"></p>
                        <div style="clear:both"></div>
                    </div>
                </div>
                <!--我的模块结束-->
                </div>
            </div>
            <!-- 右侧  end -->
        </div>
    </div>
</div>
{x2;include:footer2}
<script>
    $(function() {
        $('.submenu:eq(0)').delay(400).slideDown(700);
        $('.submenu:eq(0) li:eq(6)').addClass("active");
    });
</script>
</body>
</html>
