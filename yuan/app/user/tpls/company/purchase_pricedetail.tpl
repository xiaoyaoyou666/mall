{x2;include:header}
<body>
{x2;include:nav}
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php">企业中心</a> > <a href="index.php?enterprise">采购信息管理</a> > <a>意向列表</a></span>
        </div>
        <div class="qycenter-content">
            {x2;include:menu}
            <div class="right-content col10 pull-right">
                <div>
                    {x2;include:companyinfo}
    <!---公共头部结束-->




                    <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                        <table class="table table-hover table-bordered">
                            <tbody>
                                <tr>
                                    <td width="200">公司名称</td>
                                    <td>{x2;$companyname}</td>
                                </tr>
                                <tr>
                                    <td width="200">企业简介</td>
                                    <td>{x2;$company_intro}</td>
                                </tr>

                                <tr>
                                    <td width="200">报价金额（人民币.元）</td>
                                    <td>{x2;$ppe['ppeinfo']['price']}</td>
                                </tr>
                                <tr>
                                    <td>合作意向</td>
                                    <td>{x2;$ppe['ppeinfo']['intention']}</td>
                                </tr>
                                <tr>
                                    <td>联系人</td>
                                    <td>{x2;$ppe['ppeinfo']['contacter']}</td>
                                </tr>
                                <tr>
                                    <td>联系电话</td>
                                    <td>{x2;$ppe['ppeinfo']['phone']}</td>
                                </tr>
                                <tr>
                                    <td>公司邮箱</td>
                                    <td>{x2;$ppe['ppeinfo']['email']}</td>
                                </tr>
                                <tr>
                                    <td>联系地址</td>
                                    <td>

                                        <div class="col-sm-2">
                                            <select class="autoloaditem combox form-control" autoload="index.php?core-api-index-getProvince" target="service_city" refurl="index.php?core-api-index-getcity&amp;parent={value}" name="args[service_province]" id="service_province"  current="{x2;$ppe['ppeinfo']['province']}" disabled="disabled"></select>

                                        </div>

                                        <div class="col-sm-2">
                                            <select class="autoloaditem combox form-control" autoload="index.php?core-api-index-getcity" target="service_area" refurl="index.php?core-api-index-getarea&amp;parent={value}" parent="#service_province" name="args[service_city]" id="service_city"  current="{x2;$ppe['ppeinfo']['city']}" disabled="disabled">
                                            </select>

                                        </div>
                                        <div class="col-sm-2">
                                            <select class="autoloaditem form-control" autoload="index.php?core-api-index-getarea" parent="#service_city" name="args[service_area]" id="service_area"  current="{x2;$ppe['ppeinfo']['area']}" disabled="disabled"></select>

                                        </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td>上传文件</td>
                                    <td><a href="{x2;$ppe['ppeinfo']['attach']}">下载</a></td>
                                </tr>
                            </tbody>
                        </table>
                        <p>
                            <?php
                                if($_GET['follow']!=1){


                            ?>
                            {x2;if:!$ppe['ppestatus']}
                            <a href="index.php?user-company-purchases-setpricestatus&status=1&ppeid={x2;$ppe['ppeid']}" class="btn btn-primary confirm" msg="确定要接受吗？">接受意向</a>
                            <a href="index.php?user-company-purchases-setpricestatus&status=2&ppeid={x2;$ppe['ppeid']}" class="btn btn-danger confirm" msg="确定要拒绝吗？">拒绝意向</a>
                            {x2;elseif:$ppe['ppestatus'] == 1}
                            已接受意向
                            {x2;elseif:$ppe['ppestatus'] == 2}
                            已拒绝意向
                            {x2;endif}
                        <?php
                            }
                        ?>

                        </p>
                    </div>


    <!---公共尾部结束-->

               </div>
            </div>
        <!-- 右侧  end -->
        </div>
    </div>
</div>

{x2;include:footer2}

</body>
<script>
    $(function() {
        $('.submenu:eq(2)').delay(400).slideDown(700);
        $('.submenu:eq(2) li:eq(1)').addClass("active");
    });
   
</script>
</html>

