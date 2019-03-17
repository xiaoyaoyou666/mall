{x2;include:header}
<body id="datacontent">
{x2;include:nav}
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>企业动态</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right edit-news">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}


                <div class="zmm_panel panel-default" id="datacontent">
                    <div class="zmm-qydt-title zmm-qydt-shsj1"><p>企业动态</p></div>
                    <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                        <form action="index.php?user-company-basic-newsedit" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label for="news_title" class="control-label col-sm-2">标题：</label>
                                <div class="col-sm-4">
                                    <input class="form-control" type="text" id="news_title" name="args[news_title]" needle="needle" msg="您必须输入标题" value="{x2;$data['news_title']}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="news_content" class="control-label col-sm-2">内容：</label>
                                <div class="col-sm-9">
                                    <textarea id="news_content" rows="7" cols="4" class="ckeditor" name="args[news_content]"  >{x2;$data['news_content']}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2"></label>
                                <div class="col-sm-9">
                                    <button class="button_tt pull-left" type="submit">提交</button>
                                    <input type="hidden" name="submit" value="1">
                                    <input type="hidden" name="args[news_id]" value="{x2;$data['news_id']}">
                                </div>
                            </div>
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
        $('.submenu:eq(0) li:eq(2)').addClass("active");
    });
</script>
</body>
</html>