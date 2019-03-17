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

    select {
        background: url(app/core/styles/img/arrow.png) no-repeat right 2px center transparent !important;
    }

</style>
<body>
{x2;include:nav}

<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?{x2;$_app}-company">企业中心</a> > <a href="index.php?user-company-purchases-offer">询比价采购</a>> <a>报价管理</a></span>
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
                                报价管理
                            </p>
                        </div>
                        <div class="search-bar">
                            <div class="condition-table form-inline">
                                <div class="form-group">
                                    标题：
                                    <input style="width: 93px;" class="form-control" name="search[keyword]" size="6"
                                           type="text" value="{x2;$keyword}" id="keyword" placeholder=""/>
                                </div>
                                <div class="form-group">
                                    采购类型：
                                    <select class="form-control" name="search[purchasetype]" id="purchasetype">
                                        <option value=''>请选择</option>
                                        <option value='1' {x2;if:$type== 1} selected="selected" {x2;endif}>邀请询价</option>
                                        <option value='2' {x2;if:$type== 2} selected="selected" {x2;endif}>公开询价</option>


                                    </select>
                                </div>
                                <div class="form-group">
                                    状态：
                                    <select class="form-control" name="search[purchasetype]" id="purchasestatus">
                                        <option value=''>请选择</option>
                                        <option value='1' {x2;if:$status== 1} selected="selected" {x2;endif}>询价中
                                        </option>
                                        <option value='2' {x2;if:$status== 2} selected="selected" {x2;endif}>待定标
                                        </option>
                                        <option value='3' {x2;if:$status== 3} selected="selected" {x2;endif}>已完成
                                        </option>
                                        <option value='4' {x2;if:$status== 4} selected="selected" {x2;endif}>已终止
                                        </option>

                                    </select>
                                </div>
                                <div class="form-group">
                                    发布时间：
                                    <input class="form-control" type="text" name="search[stime]"
                                           id="stime" value="{x2;$stime}"/>-<input class="form-control" type="text"
                                                                                   name="search[etime]" id="etime"
                                                                                   value="{x2;$etime}"/>

                                </div>
                                <button class="btn btn-primary search-btn"
                                        style="background-color:#009944;margin-left: 15px" onclick="doSearch()">搜索
                                </button>
                            </div>
                        </div>
                        <div class="zmm-panel-body">
                            {x2;if:$pageStatus == '1'}
                            <table class="table table-hover table-bordered">

                                <thead>
                                    <tr class="info">
                                        <th width="44px">序号</th>
                                        <th width="190px">询价单名称</th>
                                        <th>类型</th>
                                        <th>状态</th>
                                        <th width="90px">报价截止时间</th>
                                        <th width="90px">报价金额(元)</th>
                                        <th>报价明细</th>
                                        <th>报价附件</th>
                                        <th width="70px">澄清确认</th>
                                        <th width="70px">报价排名</th>
                                        <th width="160">操作</th>
                                    </tr>
                                </thead>
                                <tbody>

                                {x2;tree:$offerarr['data'],content,cid}
                                <tr>
                                    <td>{x2;v:content['ordernum']}</td>
                                    <td><div class="line2-style">{x2;v:content['xunjia_title']}</div></td>

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
                                    <td>{x2;v:content['total_price']}</td>
                                    <td><a href="index.php?user-company-purchases-export_inquiryt&pid={x2;v:content['pid']}" class="btn yellow-text">下载</a></td>
                                    <td>
                                        {x2;if:v:content['file_url']}
                                        <a href="{x2;v:content['file_url']}" class="btn yellow-text"
                                           download="{x2;v:content['file_url']}">下载</a>
                                        {x2;else}
                                        <span class="btn">下载</span>
                                        {x2;endif}
                                    </td>
                                    {x2;if:v:content['istrue']==1}
                                    <td>已确认</td>
                                    {x2;else}
                                    <td>未确认</td>
                                    {x2;endif}

                                    <td>
                                    {x2;if:v:content['status']==1}
                                        *
                                    {x2;else}
                                        {x2;v:content['painum']}
                                    {x2;endif}
                                    </td>

                                    <td class="actions">
                                        <div class="btn-group">
                                            {x2;if:v:content['status']==1}
                                            <a class="btn yellow-text  clarify-btn"
                                               onclick="catComment('{x2;v:content[purchase_new_id]}')" title="澄清"><em
                                                    class="iconfont ">&#xe616;</em></a>
                                            {x2;endif}

                                            <a class="btn yellow-text"
                                               href="index.php?user-company-clarify&id={x2;v:content['purchase_new_id']}&pid={x2;v:content['pid']}"
                                               title="详情"><em class="iconfont">&#xe63c;</em></a>

                                            {x2;if:v:content['end_time']>=time() && v:content['status']!=4}
                                            <!-- <a class="btn yellow-text file-btn"
                                               onclick="filepost('{x2;v:content[pid]}','{x2;v:content[purchase_new_id]}')"
                                               title="更新报价"><em
                                                    class="iconfont">&#xe612;</em></a> -->
                                               <a class="btn yellow-text file-btn" href="index.php?user-company-clarify&id={x2;v:content['purchase_new_id']}&pid={x2;v:content['pid']}#offerinfo" title="更新报价"><em class="iconfont">&#xe612;</em></a>
                                            {x2;endif}


                                            {x2;if:v:content['end_time']>=time() || v:content['status']==4}
                                            <!--<a class="btn yellow-text bcancel"-->
                                               <!--href="index.php?user-company-purchases-offerCancel&pid={x2;v:content[pid]}"-->
                                               <!--title="取消"><em class="iconfont">&#xe672;</em></a>-->
                                            {x2;endif}
                                        </div>
                                    </td>
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
                            {x2;$offerarr['pages']}
                        </ul>

                    </div>
                </div>
                <!--我的模块结束-->

            </div>
        </div>
        <!-- 右侧  end -->
    </div>
</div>
</div>
<div class="modal fade" id="clarify-modal">
    <div class="lodin">
        <div class="log">
            <img src="app/core/styles/images/qio.png" />
        </div>
    </div>
    <div class="modal-dialog" style="width: 460px;margin-top: 160px;border-radius: 5px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div style="font-size: 16px">澄清</div>
            </div>
            <div id="test"></div>
            <div class="modal-body">
                <div class="form-group">
                    <div style="margin: 0 auto;">
                        <div class="form-group">
                            <span style="float: left">澄清内容：</span>
                            <textarea name="remark-input" id="remark-input" cols="40" rows="3" placeholder="请输入200个字以内澄清信息"
                                      maxlength="200" style="width: 355px;resize:none" ></textarea>
                        </div>

                        <div class="form-group" style="margin-bottom: 0">
                            <span style="float: left">澄清文件：</span>
                            <script type="text/template" id="pe-template-url">
                                <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                        <div class="qq-upload-button-selector">
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals">
                                                <li>
                                                <span class="btn btn-default" style="color: #009944">
                                                    <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>
                                                    上传文档
                                                </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" id="clarify-files" tabindex="0" value="">
                                                    <div style="position: relative;float: right;margin-top: 4px;margin-left: 5px;" class="uploaded-show">
                                                        <span class="qq-upload-file-selector qq-upload-file upload-file-name" id="clarify-title" style="width: 200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"></span>
                                                        <span class="delete-file-btn yellow-text" style="float: right;">&times;</span>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions">
                                                <li style="text-align: left">
                                                    <span class="btn btn-default" style="border:1px solid #009944;color: #009944">
                                                        <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
                                                    </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" tabindex="0" value="">
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </script>
                            <div class="fineuploader" attr-list="true" attr-template="pe-template-url"
                                 attr-ftype="rar,zip" load-type="inner" style="display: inline-block" ></div>


                        </div>
                        <div class="form-group file-type-note" style="padding-left: 70px;color: #999999">支持zip,rar文件</div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="offerconfirm"> 确&nbsp;&nbsp;定
                </button>
                <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
            </div>
        </div>
    </div>
</div>
<!--<div class="modal fade" id="offer-modal">
    <div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div>更新报价单</div>
            </div>

            <div id="filecontent">
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <span style="float: left;">报价金额：</span>
                    <input type="text" class="form-control offer-total-money"
                           style="width: 200px;display: inline-block;margin-right: 3px;">元
                </div>

                &lt;!&ndash; <textarea name="remark-input" cols="40" rows="5"></textarea> &ndash;&gt;

                <div class="form-group">
                    <span style="float: left">澄清文件：</span>
                    <script type="text/template" id="pe-template-url2">
                        <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                            <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                <div class="qq-upload-button-selector">
                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                        aria-relevant="additions removals">
                                        <li>
                                                <span class="btn btn-default"
                                                      style="border: 1px solid #009944;color: #009944">
                                                    <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>
                                                    上传文档
                                                </span>
                                            <input size="60" class="form-control qq-edit-filename-selector"
                                                   type="hidden" name="urls" id="offer-files" tabindex="0" value="">
                                            <div style="position: relative" class="uploaded-show">
                                                <span class="qq-upload-file-selector qq-upload-file upload-file-name"
                                                      id="offer-title"
                                                      style="width: 200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"></span>
                                                <span class="delete-file-btn yellow-text"
                                                      style="float: right;">&times;</span>
                                            </div>
                                        </li>
                                    </ul>
                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                        aria-relevant="additions">
                                        <li style="text-align: left">
                                                    <span class="btn btn-default"
                                                          style="border: 1px solid #009944;color: #009944">
                                                        <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
                                                    </span>
                                            <input size="60" class="form-control qq-edit-filename-selector"
                                                   type="hidden" name="urls" tabindex="0" value="">
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </script>
                    <div class="fineuploader" attr-list="true" attr-template="pe-template-url2" attr-ftype="rar,zip"
                         load-type="inner"></div>

                </div>
                <div class="row form-group file-type-note" style="padding-left: 87px">仅支持zip,rar文档</div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="tocomment"> 确&nbsp;&nbsp;定
                </button>
                <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
            </div>
        </div>
    </div>
</div>-->

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
        $('.submenu:eq(2) li:eq(1)').addClass("active");

        //点击弹出modal
        $('.clarify-btn').on('click', function () {
            $("#clarify-modal").modal('show');
        })

        //增加上传文件点击后颜色
        $('.qq-upload-button-selector input').change(function () {
            $('.qq-upload-button-selector').find('.btn-default').css('border','1px solid #009944');
        })

    });

    //搜索功能
    function doSearch() {
        var keyword = $("#keyword").val();
        var purchasetype = $("#purchasetype").val();
        var purchasestatus = $("#purchasestatus").val();
        var stime = $("#stime").val();//开始时间
        var etime = $("#etime").val();//结束时间*/

        var url = 'index.php?user-company-purchases-offer&t=1';
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


    //--------------更新报价单start--------------------------------------------
    function filepost(id, xunid) {
        //alert(id);return false;
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-purchases-filepost&id=' + id + '&xunid=' + xunid,
            dataType: 'JSON',
            async: true,
            success: function (res) {
                if (res.statusCode == 201) {
                    $("#filecontent").html(res.data);
                    $("#offer-modal").modal();
                } else {

                    var data = {
                        result: false,
                        message: res.message
                    };
                    $.zoombox.show('ajax', data);
                    window.location.reload();
                    return false;
                }
            },
            error: function (e) {
                console.log(e);
            }
        })
        if ($('#offer-modal #offer-files').val()) {
            $('#offer-modal #offer-title').html('');
        }
        $('#offer-modal #offer-files').val('');
        $('#offer-modal .offer-total-money').val('');

    }

    //澄清提交
    var clarifyCommitBtnLock = 0;
    $('#tocomment').on('click', function () {
        // $('.lodin').show();
        // debugger
        //多次提交？
        if (clarifyCommitBtnLock === 1) {
            return false;
        }
        var pid = $('#offersn').val();
        var fileurl = $('#offer-files').val();
        var totalNo = $('.remark-input').val();
        if (!totalNo) {

            var data = {
                result: false,
                message: '请上传澄清内容'
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
        clarifyCommitBtnLock = 1;
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-purchases-filecommit&pid=' + pid + '&fileurl=' + fileurl + '&totalNo=' + totalNo,
            dataType: 'JSON',
            success: function (res) {
                clarifyCommitBtnLock = 0;
                if (res.statusCode == 200) {

                    window.location.href = 'index.php?user-company-purchases-offer';
                    return true;
                } else {
                    alert('失败了');
                }
                //$('.lodin').show();
            },
            error: function (e) {
                console.log(e);
                clarifyCommitBtnLock = 0;
                //$('.lodin').show();
            }
        })
    })
    //--------------------------------更新报价单结束-----------------------------------------------

    //--------------------------------报价列表中的澄清start---------------------------------------
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

        if ($('#clarify-modal #clarify-files').val()) {
            $('#clarify-modal #clarify-title').closest('.uploaded-show').remove();
        }
        $('#clarify-modal #clarify-files').val('');
        $("#clarify-modal").modal('show');
    }


    //---更新报价提交----
    var offerCommitBtnLock = 0;
    $('#offerconfirm').on('click', function () {

        //多次提交？
        if (offerCommitBtnLock === 1) {
            return false;
        }
        var sn = $('#sn').val();
        var text = $('#remark-input').val();
        var fileurl = $('#clarify-modal #clarify-files').val();
        var filename = $("#clarify-title").text();
        console.log(text);
        console.log(filename);
        if (!text) {
            var data = {
                result: false,
                message: '请上传备注'
            };
            $.zoombox.show('ajax', data);
            return false;
        }
        var json_text={
            text:text,
            fileurl:fileurl,
            filename:filename,
            sn:sn,
            type:1
        }
        /*if (!fileurl) {
         var data = {
         result: false,
         message: '请上传文档'
         };
         $.zoombox.show('ajax', data);
         return false;
         }*/
        $('.lodin').show();
        offerCommitBtnLock = 1;
        $.ajax({
            type: 'get',
            // url: 'index.php?user-company-purchases-ajaxpost&text=' + text + '&fileurl=' + fileurl + '&filename=' + filename + '&sn=' +
            // sn + '&type=1',
            url: 'index.php?user-company-purchases-ajaxpost',
            dataType: 'JSON',
            data:json_text,
            success: function (res) {
                offerCommitBtnLock = 0;
                if (res.statusCode == 200) {
                    window.location.href = 'index.php?user-company-purchases-offer';
                    return true;
                } else {
                    alert('失败了');
                }
                $('.lodin').hide();
            },
            error: function (e) {
                console.log(e);
                offerCommitBtnLock = 0;
                $('.lodin').hide();
            }
        })
    })
    //--------------------------------报价列表中的澄清end--------------------------------------------

    /**
     * [exportReport 导出搜索条件下excel文档方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-15
     * @return   {[type]}      [description]
     */
    function exportReport(){
        var keyword = $("#keyword").val();

        var url = 'index.php?user-company-purchases-export_inquiryt';
        if (keyword != '') {
            url += '&keyword=' + keyword;
        }

        window.location.href = url;
    }


</script>
</body>

</html>