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
            <div class="right-content col10 pull-right edit-success-example">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}


                    <div class="zmm_panel panel-default">
                        <div class="zmm-qydt-title zmm-qydt-shsj1"><p><em class="title-triangle"></em>编辑案例</p></div>
                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <form action="index.php?user-company-basic-caseedit" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="news_title" class="control-label col-sm-2">项目名称：</label>
                            <div class="col-sm-4">
                                <input class="form-control" type="text" id="news_title" name="args[case_title]" needle="needle" msg="您必须输入联系人" value="{x2;$data['case_title']}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="block" class="control-label col-sm-2">项目图片：</label>


                            <div class="col-sm-9">

                                <div class="sortable" id="pics-range">
                                    {x2;tree:$data['case_url'],vv,fid}
                                    <div class="thumbnail col-xs-3 listimgselector">
                                        <img class="qq-thumbnail-selector" alt="点击上传新图片" src="{x2;v:vv}">
                                        <input type="hidden" class="qq-edit-filename-selector" name="args[case_url][]" tabindex="0" value="{x2;v:vv}">
                                    </div>
                                    {x2;endtree}
                                </div>
                                <script type="text/template" id="pe-template-pics">
                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                        <div class="qq-upload-list-selector hide" aria-live="polite" aria-relevant="additions removals">
                                            <span></span>
                                        </div>
                                        <div class="listimg hide">
                                            <div class="thumbnail col-xs-3 listimgselector">
                                                <img class="qq-thumbnail-selector" alt="点击上传新图片" src="*value*">
                                                <input type="hidden" class="qq-edit-filename-selector" name="*name*" tabindex="0" value="*value*">
                                            </div>
                                        </div>
                                        <div class="qq-upload-button-selector qq-upload-button" style="clear:both;">
                                            <a class="btn btn-primary">添加图片</a>
                                        </div>
                                    </div>
                                </script>
                                <div class="fineuploader" attr-box="pics-range" attr-name="args[case_url][]" attr-type="list" attr-list="true" attr-template="pe-template-pics" attr-ftype="jpg,png,gif"></div>
                            </div>


                        </div>

                        <div class="form-group">
                            <label for="purchasecompsize" class="control-label col-sm-2">所属类别：</label>
                            <div class="col-sm-3">
                                <input class="form-control" type="text"  name="args[case_category]" id="purchasecompsize"  current="" value="{x2;$data['case_category']}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="purchasetext" class="control-label col-sm-2">项目描述：</label>

                            <div class="col-sm-9">
                                <textarea id="purchasetext" rows="7" cols="4" class="ckeditor" name="args[case_content]">{x2;realhtml:$data['case_content']}</textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="purchasetemplate" class="control-label col-sm-2"></label>
                            <div class="col-sm-9">
                                <button class="btn btn-primary" type="submit">提交</button>
                                <input type="hidden" name="args[case_id]" value="{x2;$data['case_id']}">
                                <input type="hidden" name="submit" value="1">
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
        $('.submenu:eq(0) li:eq(5)').addClass("active");
    });
</script>
</body>
</html>