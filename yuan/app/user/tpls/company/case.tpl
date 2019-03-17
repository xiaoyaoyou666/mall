{x2;include:header}
<body id="datacontent">
{x2;include:nav}
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>成功案例</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right success-example">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}


                    <div class="zmm_panel panel-default">
                        <div class="zmm-qydt-title zmm-qydt-shsj1"><p><em class="title-triangle"></em>成功案例</p>
                            <a href="index.php?user-company-basic-caseadd" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">添加案例</a>
                        </div>
                    <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                    <form action="index.php?user-company-items-lite" method="post">

                        <fieldset>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th>案例图片</th>
                                    <th>标题</th>
                                    <th>所属项目</th>
                                    <th width="180">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                {x2;tree:$data['data'],good,cid}
                                <tr>
                                    <td class="cell-align-center">
                                        <a target="_blank" href="index.php?company-app-company-caseinfo&case_id={x2;v:good['case_id']}">
                                            <img src="{x2;v:good['case_logo']}" style="width:100px;height: 50px;">
                                        </a>
                                    </td>
                                    <td class="table-text">
                                        {x2;v:good['case_title']}
                                    </td>
                                    <td>
                                        {x2;v:good['case_category']}
                                    </td>
                                    <td class="actions cell-align-center" style="padding: 0;">
                                        <div class="btn-group">
                                            <a class="btn yellow-text" href="index.php?user-company-basic-caseedit&case_id={x2;v:good['case_id']}" title="编辑"><em class="glyphicon glyphicon-edit"></em></a>
                                            <a class="btn yellow-text confirm" href="index.php?user-company-basic-casedel&case_id={x2;v:good['case_id']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                        </div>
                                    </td>
                                </tr>
                                {x2;endtree}
                                </tbody>
                            </table>
                            <ul class="pagination pull-right">{x2;$data['pages']}</ul>
                        </fieldset>
                    </form>
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
        $('.submenu:eq(0) li:eq(5)').addClass("active");
    });
</script>
</body>
</html>