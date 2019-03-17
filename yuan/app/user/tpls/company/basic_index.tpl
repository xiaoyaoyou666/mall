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
</style>
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>企业简介</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right corporate-description">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}
                    <!--企业简介-->
                    <div class="zmm_panel panel-default">
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <p><em class="title-triangle"></em>企业简介</p>
                            <a href="index.php?{x2;$_app}-company-basic-indexedit" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">修改企业资料</a>
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
                                        {x2;$data['cityInfo']}{x2;$data['company_address']}
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
                                        企业人数(人)
                                    </td>
                                    <td class="table-td2">
                                        {x2;$data['company_members']}
                                    </td>
                                </tr>
                                <tr class="table-tr2">
                                    <td class="table-td1">
                                        注册资金(万元)
                                    </td>
                                    <td class="table-td2">
                                        {x2;$data['company_capital']}
                                    </td>
                                </tr>
                                <tr class="table-tr2">
                                    <td class="table-td1">
                                        企业法人
                                    </td>
                                    <td class="table-td2">{x2;$data['company_leader']}
                                    </td>
                                </tr>
                                <!--
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
                                -->
                            </table>

                        </div>
                    </div>

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
        $('.submenu:eq(0) li:eq(1)').addClass("active");

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
</script>

</body>

</html>
