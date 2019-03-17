{x2;include:header}
<body id="datacontent">
{x2;include:nav}
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>荣誉资质</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->
            <!-- 右侧  start -->
            <div class="right-content col10 pull-right edit-honour">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}

                <div class="zmm_panel panel-default">
                    <form action="index.php?user-company-basic-honouredit" method="post" class="form-horizontal zmm-panel-body">

                        <div class="form-group">
                            <label for="block" class="control-label col-sm-2">资质照片：</label>
                            <div class="col-sm-5">
                                <script type="text/template" id="pe-template-purchasethumb">
                                    <div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                        <div class="qq-upload-button-selector" style="clear:both;">
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <div class="thumbnail">
                                                        <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                        <input type="hidden" class="qq-edit-filename-selector" name="args[honor_url]" tabindex="0">
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <div class="thumbnail">
                                                        <img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </script>
                                <div class="fineuploader" attr-type="thumb" attr-template="pe-template-purchasethumb"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="news_title" class="control-label col-sm-2">资质名称：</label>
                            <div class="col-sm-4">
                                <input class="form-control" type="text" id="news_title" name="args[honor_title]" needle="needle" msg="您必须输入资质名称" value="{x2;$data['honor_title']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="purchasetemplate" class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="submit" value="1">
                            </div>
                        </div>
                    </form>
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
        $('.submenu:eq(0) li:eq(4)').addClass("active");
    });
</script>
</body>
</html>