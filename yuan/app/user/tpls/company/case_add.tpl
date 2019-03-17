{x2;include:header}
<body id="datacontent">
{x2;include:nav}
<style type="text/css">
	.btn_s{border: 1px solid rgb(204, 204, 204);
    border-radius: 4px;
    height: 30px;
    line-height: 17px;
    width: 120px;
    margin-top: 10px;
    padding-left: 40px;
    background: url(app/core/styles/images/upload.png) 15px center / 16px no-repeat;
    position: relative;
    overflow: hidden;
    direction: ltr;
    color: #333;
    }
</style>
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
            <div class="right-content col10 pull-right add-case">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}


                    <div class="zmm_panel panel-default">
                        <div class="zmm-qydt-title zmm-qydt-shsj1"><p><em class="title-triangle"></em>添加案例</p>
                        </div>

                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                        <form action="index.php?user-company-basic-caseadd" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="news_title" class="control-label col-sm-2">案例名称：</label>
                            <div class="col-sm-4">
                                <input class="form-control" type="text" id="news_title" name="args[case_title]" needle="needle" msg="您必须输入联系人">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="block" class="control-label col-sm-2">案例图片：</label>
                            <div class="col-sm-9">
                                <div class="sortable" id="pics-range"></div>
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
                                            <a class="btn btn-primary btn_s">添加图片</a>
                                        </div>
                                    </div>
                                </script>
                                <div class="fineuploader" attr-box="pics-range" attr-name="args[case_url][]" attr-type="list" attr-list="true" attr-template="pe-template-pics" attr-ftype="jpg,png,gif"></div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="purchasecompsize" class="control-label col-sm-2">所属项目：</label>
                            <div class="col-sm-3">
                                <!--<select class="form-control" name="args[case_category]" id="purchasecompsize"  current="">-->
                                    <!--<option value='投资'>投资</option>-->
                                <!--</select>-->
                                <input class="form-control" type="text" id="purchasecompsize" name="args[case_category]" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="purchasetext" class="control-label col-sm-2">项目描述：</label>

                            <div class="col-sm-9">
                                <textarea id="purchasetext" rows="7" cols="4" class="ckeditor" name="args[case_content]"></textarea>
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