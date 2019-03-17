{x2;include:header}
<style type="text/css">
    .zmm-panel-body {
        padding-top: 20px;
        padding-left: 20px;
        padding-right: 20px;
    }

    .zmm-gsjj table {
        width: 100%;
        margin-left: 0 !important;
        margin-bottom: 0 !important;
    }

    .conditions {
        background-color: #eee;
        border: 0 !important;
    }

    .conditions tbody tr, .conditions tbody td {
        border: 0 !important;
    }

    .conditions > tbody > tr > td {
        padding: 5px 2px !important;
    }

    .table > thead > tr > td.info, .table > tbody > tr > td.info, .table > tfoot > tr > td.info, .table > thead > tr > th.info, .table > tbody > tr > th.info, .table > tfoot > tr > th.info, .table > thead > tr.info > td, .table > tbody > tr.info > td, .table > tfoot > tr.info > td, .table > thead > tr.info > th, .table > tbody > tr.info > th, .table > tfoot > tr.info > th {
        background-color: #ededed;
    }

    .search-bar {
        margin: 10px 20px 0;
        border: 1px solid #ededed;
        padding: 20px;
    }

    .actions .btn {
        padding: 6px;
    }

    #remark-input {
        border-radius: 4px;
        border: 1px solid #ccc;
    }

    #clarify-modal .file-type-note {
        margin-bottom: 2px;
    }

    .iconfont {
        font-size: 14px;
    }

    #remark-input {
        padding: 3px;
    }

    #stime, #etime {
        width: 160px;
    }
    .form-group{
        margin-right: 15px;
    }
</style>
<body>
{x2;include:nav}

<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?{x2;$_app}-company">企业中心</a> > <a href="index.php?user-company-purchases-notice">询比价采购</a> > <a>询价公告</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right">
                <!--公司简介-->
                <div>
                    <!--我的模块开始-->
                    <div class="zmm_panel panel-default">
                        <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <p>
                                <em class="title-triangle"></em>
                                询价公告
                            </p>
                        </div>
                        <div class="search-bar">
                            <div class="condition-table form-inline">
                                <div class="form-group">
                                    询价单名称：
                                    <input style="width: 130px;" class="form-control" name="search[keyword]" size="6"
                                           type="text" value="{x2;$keyword}" id="keyword" placeholder=""/>
                                </div>
                                <div class="form-group">
                                    发布时间：
                                    <input class="form-control" type="text" name="search[stime]" size="10" id="stime"
                                           value="{x2;$stime}"/>-<input class="form-control" size="10" type="text"
                                                                        name="search[etime]" id="etime"
                                                                        value="{x2;$etime}"/>
                                </div>
                                <button class="btn btn-primary search-btn"
                                        style="background-color:#009944;margin-left: 20px" onclick="doSearch()">搜索
                                </button>
                            </div>
                        </div>

                        <div class="zmm-panel-body">
                            {x2;if:$pageStatus == '1'}
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr class="info">
                                    <th>序号</th>
                                    <th width="350px">询价单名称</th>
                                    <th>类型</th>
                                    <th>状态</th>
                                    <th>报价截止时间</th>
                                    <th>报价数量</th>
                                    <th width="120">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                {x2;tree:$info['data'],content,cid}
                                <tr>
                                    <td>{x2;eval:echo v:cid}</td>
                                    <td class="picture" style="line-height: 1.5em"><div class="line2-style">{x2;v:content['xunjia_title']}</div></td>
                                    {x2;if:v:content['xunjia_type']==1}
                                    <td>邀请询价</td>
                                    {x2;else}
                                    <td>公开询价</td>
                                    {x2;endif}


                                    {x2;if:v:content['status']==1}
                                    <td>询价中</td>
                                    {x2;elseif:v:content['status']==2}
                                    <td>待定标</td>
                                    {x2;elseif:v:content['status']==3}
                                    <td>已完成</td>
                                    {x2;elseif:v:content['status']==4}
                                    <td>已终止</td>
                                    {x2;endif}

                                    <td>{x2;date:v:content['end_time'],'Y-m-d H:i'}</td>
                                    <td><p class="btn">{x2;v:content['offernum']}</p></td>
                                    {x2;if:v:content['status']==1}
                                    <td class="actions">
                                        <div class="btn-group">
                                            <a class="btn yellow-text" href="index.php?purchase-app-content&id={x2;v:content['purchase_new_id']}" title="立即报价"><em class="iconfont">立即报价</em></a>
                                        </div>
                                    </td>
                                    {x2;else}
                                    <td class="actions">
                                        <div class="btn-group">
                                            <p class="btn">立即报价</p>
                                        </div>
                                    </td>
                                    {x2;endif}
                                </tr>
                                {x2;endtree}
                                </tbody>
                            </table>
                            {x2;endif}
                            <!--空警告-->
                            {x2;if:$pageStatus == '2'}
                            <div class="empty-box">
                                <div class="empty-item">
                                    <img src="app/core/styles/img/empty_offer.png" alt="">
                                </div>

                                <div class="empty-item">
                                    <p class="empty-title">非常抱歉，没有找到与搜索内容相符的内容</p>
                                    建议您：
                                    <ul>
                                        <li>1、判断输入的文字是否有误</li>
                                        <li>2、尝试一下其他相关字段</li>
                                        <li>3、拆分要搜索的关键词，分成几个词语再次搜索</li>
                                    </ul>
                                </div>
                            </div>
                            {x2;endif}
                            <!--空内容警告-->
                            {x2;if:$pageStatus == '3'}
                            <div class="empty-content-box">
                                <div class='empty-content-img'>
                                    <img src="app/core/styles/img/empty-content.png" alt="内容为空" style="width: 224px">
                                </div>
                                <p class="empty-content-title">尚未创建相关信息哦～</p>
                            </div>
                            {x2;endif}
                        </div>
                        <ul class="pagination pull-right">
                            {x2;$info['pages']}
                        </ul>
                    </div>
                </div>
                <!--我的模块结束-->

            </div>
        </div>
        <!-- 右侧  end -->
    </div>
</div>

<div class="modal fade" id="clarify-modal">
    <div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div>澄清</div>
            </div>
            <div id="test"></div>
            <div class="modal-body">
                <div class="form-group">
                    <div style="margin: 0 auto;">
                        <div class="form-group">
                            <span style="float: left">澄清内容：</span>
                            <textarea name="remark-input" id="remark-input" cols="40" rows="3" placeholder="请输入200个字以内澄清信息"
                                      maxlength="200" style="width: 355px"></textarea>
                        </div>

                        <div class="form-group">
                            <span style="float: left">澄清文件：</span>
                            <script type="text/template" id="pe-template-url2">
                                <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                        <div class="qq-upload-button-selector">
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals">
                                                <li>
                                                <span class="btn btn-default" style="border: 1px solid #009944;color: #009944">
                                                    <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>
                                                    上传文档
                                                </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" id="clarify-files" tabindex="0" value="">
                                                    <div style="position: relative" class="uploaded-show">
                                                        <span class="qq-upload-file-selector qq-upload-file upload-file-name" id="title" style="width: 200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"></span>
                                                        <span class="delete-file-btn yellow-text" style="float: right;">&times;</span>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions">
                                                <li style="text-align: left">
                                                    <span class="btn btn-default" style="border: 1px solid #009944;color: #009944">
                                                        <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
                                                    </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" tabindex="0" value="">
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </script>
                            <div class="fineuploader" attr-list="true" attr-template="pe-template-url2"
                                 attr-ftype="rar,zip" load-type="inner"></div>


                        </div>
                        <div class="row form-group file-type-note">仅支持zip,rar文档</div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="tocomment"> 确&nbsp;&nbsp;定
                </button>
                <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
            </div>
        </div>
    </div>
</div>
{x2;include:footer2}


<script>
    $(function () {
        //时间控件
        $('#stime').datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd hh:ii:00',
            todayHighlight: 1,
            forceParse: 0,
            showMeridian: 1,
            autoclose: 1
        });
        //时间控件
        $('#etime').datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd hh:ii:00',
            todayHighlight: 1,
            forceParse: 0,
            showMeridian: 1,
            autoclose: 1
        });
        $('.submenu:eq(2)').delay(400).slideDown(700);
        $('.submenu:eq(2) li:eq(0)').addClass("active");

        //点击弹出modal
        $('.clarify-btn').on('click', function () {
            $("#clarify-modal").modal('show');
        })

        //澄清上传文件
        $('.clarify-confirm-btn').on('click', function () {
            var file = $('#clarify-files').val();
        })
    });

    /**
     * [doSearch 搜索方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-15
     * @return   {[type]}      [description]
     */
    function doSearch() {
        var keyword = $("#keyword").val();
        var purchasetype = $("#purchasetype").val();
        var purchasestatus = $("#purchasestatus").val();
        var stime = $("#stime").val();//开始时间
        var etime = $("#etime").val();//结束时间*/

        var url = 'index.php?user-company-purchases-notice&t=1';
        if (keyword != '') {
            url += '&keyword=' + keyword;
        }
        if (purchasetype != '') {
            url += '&purchasetype=' + purchasetype;
        }
        if (purchasestatus != '') {
            url += '&purchasestatus=' + purchasestatus;
        }

        if (stime != '') {
            url += '&stime=' + stime;
        }
        if (etime != '') {
            url += '&etime=' + etime;
        }
        window.location.href = url;
    }


    function catComment(ordid) {
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-purchases-ajaxComment&id=' + ordid,
            dataType: 'JSON',
            async: true,
            success: function (res) {
                if (res.statusCode == 201) {
                    $("#test").html(res.data);
                } else {
                    var message = res.message;
                    return false;
                }
            },
            error: function (e) {
                console.log(e);
            }
        })
        //打开modal
        $('#remark-input').val('');
        if ($('#clarify-files').val()) {
            $('.clarify_name').html('');
        }
        $('#clarify-files').val('');
        $("#clarify-modal").modal();
    }

    var inquiryCommitBtnlock = 0;
    //---提交澄清----
    $('#tocomment').on('click', function () {
        //多次提交？
        if(inquiryCommitBtnlock === 1){
            return false;
        }

        var sn = $('#sn').val();//询价信息ID
        var text = $('#remark-input').val();
        var fileurl = $('#clarify-files').val();
        var filename = $("#title").text();
        if (!sn) {

            var data = {
                result: false,
                message: '请填写澄清信息'
            };
            $.zoombox.show('ajax', data);
            return false;
        }
        if (!fileurl) {
            var data = {
                result: false,
                message: '请上传文档'
            };
            $.zoombox.show('ajax', data);
            return false;
        }
        inquiryCommitBtnlock = 1;
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-purchases-ajaxpost&text=' + text + '&fileurl=' + fileurl + '&filename=' + filename + '&sn=' + sn,
            dataType: 'JSON',
            success: function (res) {
                inquiryCommitBtnlock = 0;
                if (res.statusCode == 200) {
                    //$("#myModal").modal('hide');
                    window.location.href = 'index.php?user-company-purchases-inquiry';
                } else {
                    alert('失败了');
                }
            },
            error: function (e) {
                console.log(e);
                inquiryCommitBtnlock = 0;
            }
        })
    })
</script>
</body>

</html>