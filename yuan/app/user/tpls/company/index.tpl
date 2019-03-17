{x2;include:header}
<style type="text/css">
	.ta_b th{font-style: normal;}
    .iconfont{
        font-size: 12px;
    }
</style>
<body>
{x2;include:nav}

<!--面包屑-->
<div class="zmm-zx-centent corporate-centre">
    <div class="container">
        <!-- 面包屑 start -->
        <div class="hln-zx-centent-title t10 b20">
            你所在的位置：
            <span><a href="index.php">首页</a> > <a href="javascript:;">主页管理</a></span>
        </div>
        <!-- 面包屑 end -->

        <div class="qycenter-content">
            {x2;include:menu}
            <div class="right-content col10 pull-left">
                <div class="right-top-content">
                    {x2;include:companyinfo}

                </div>
                <div class="right-bot-content">


                    <div class="table-div b20">
                        <div class="table-div-title">
                            <span><em class="title-triangle"></em>我的报价</span>
                            <div class="more pull-right r20 t10"><a href="index.php?user-company-purchases-offer">更多 >></a></div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="table-div-body">

                            <div class="table-div-body-content">
                                <table class="table table-bordered table-responsive table-hover text-center ta_b">
                                    <thead>
                                    <tr>
                                        <th>标题</th>
                                        <th>类型</th>
                                        <th>状态</th>
                                        <th>报名截止时间</th>
                                        <th>报价金额(元)</th>
                                        <th>报价明细</th>
                                        <th>澄清确认</th>
                                        <th>报价排名</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {x2;tree:$offerarr['data'],content,cid}
                                        <tr>

                                        <td style="width: 150px;line-height: 1.5em">{x2;v:content['xunjia_title']}</td>

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
                                        <td><a href="{x2;v:content['file_url']}" class="btn yellow-text" download="{x2;v:content['file_url']}">下载</a></td>
                                        {x2;if:v:content['baojia_status']}
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
                                                {x2;if:v:content['end_time']>=time() && v:content['status']!=4}
                                                <a class="btn yellow-text  clarify-btn" onclick="catComment1('{x2;v:content[purchase_new_id]}')" title="澄清"><em class="iconfont ">&#xe616;</em></a>
                                                {x2;endif}

                                                <a class="btn yellow-text" href="index.php?user-company-clarify&id={x2;v:content['purchase_new_id']}" title="详情"><em class="iconfont">&#xe63c;</em></a>

                                                {x2;if:v:content['end_time']>=time() && v:content['status']!=4}
                                                <a class="btn yellow-text file-btn" href="index.php?user-company-clarify&id={x2;v:content['purchase_new_id']}&pid={x2;v:content['pid']}#offerinfo" title="更新报价"><em class="iconfont">&#xe612;</em></a>
                                                {x2;endif}


                                                {x2;if:v:content['end_time']>=time() || v:content['status']==4}
                                                <a class="btn yellow-text cancel" href="index.php?user-company-purchases-offerCancel&pid={x2;v:content[pid]}" title="取消"><em class="iconfont">&#xe672;</em></a>
                                                {x2;endif}
                                            </div>
                                        </td>
                                        </tr>
                                    {x2;endtree}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="table-div">
                        <div class="table-div-title">
                            <span><em class="title-triangle"></em>货架维护</span>
                            <div class="more pull-right r20 t10"><a href="index.php?user-company-items">更多 >></a></div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="table-div-body">

                            <div class="table-div-body-content">
                                <table class="table table-bordered table-responsive table-hover text-center ta_b">
                                    <thead>
                                    <tr>
                                        <th>缩略图</th>
                                        <th>标题</th>
                                        <th>分类</th>
                                        <th>上下架</th>
                                        <th>发布时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {x2;tree:$goods['data'],good,cid}
                                    <tr>
                                        <td class="picture"><img src="{x2;if:v:good['goodsthumb']}{x2;v:good['goodsthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:24px;"/></td>
                                        <td class="table-text">
                                            <a class="yellow-text" href="index.php?item-app-item&goodsid={x2;v:good['goodsid']}" target="_blank">{x2;v:good['goodstitle']}</a>
                                        </td>
                                        <td>
                                            <a class="yellow-text" href="index.php?user-company-items&catid={x2;v:good['goodscatid']}" target="">{x2;$categories[v:good['goodscatid']]['catname']}</a>
                                        </td>
                                        <td>{x2;if:v:good['goodsstatus'] == 1}上架中 <a title="点击设置下架" class="ajax yellow-text" href="index.php?user-company-items-goodsdown&goodsid={x2;v:good['goodsid']}"><em class="glyphicon glyphicon-import"></em></a>{x2;else}下架中 <a title="点击设置上架" class="ajax yellow-text" href="index.php?user-company-items-goodsup&goodsid={x2;v:good['goodsid']}"><em class="glyphicon glyphicon-export"></em></a>{x2;endif}</td>
                                        <td>
                                            {x2;date:v:good['goodstime'],'Y-m-d'}
                                        </td>
                                        <td class="actions" style="padding: 0;">
                                            <div class="btn-group">

                                                <a class="btn yellow-text" href="index.php?user-company-items-stock&goodsid={x2;v:good['goodsid']}{x2;$u}" title="库存管理"><em class="glyphicon glyphicon-briefcase"></em></a>
                                                {x2;if:v:good['goodsstatus'] == 1}
                                                <a class="btn yellow-text shangjiatip"
                                                   href="index.php?user-company-items-edit&catid={x2;v:good['goodscatid']}&goodsid={x2;v:good['goodsid']}&page={x2;$page}{x2;$u}"
                                                   title="修改"><em class="glyphicon glyphicon-edit"></em>
                                                </a>
                                                {x2;else}
                                                <a class="btn yellow-text" target="_blank"
                                                   href="index.php?user-company-items-edit&catid={x2;v:good['goodscatid']}&goodsid={x2;v:good['goodsid']}&page={x2;$page}{x2;$u}"
                                                   title="修改"><em class="glyphicon glyphicon-edit"></em></a>

                                                {x2;endif}
                                                <a class="btn yellow-text" target="_blank" href="index.php?user-company-items-history&goodsid={x2;v:good['goodsid']}&page={x2;$page}{x2;$u}" title="历史操作"><em class="glyphicon glyphicon-paperclip"></em></a>
                                                <a class="btn yellow-text confirm" href="index.php?user-company-items-del&catid={x2;v:good['goodscatid']}&goodsid={x2;v:good['goodsid']}&page={x2;$page}{x2;$u}" title="删除"><em class="iconfont">&#xe672;</em></a>
                                                <!--    <a class="btn" href="index.php?item-company-items-setcuxiao&goodsid={x2;v:good['goodsid']}" title="设置为促销产品"><em class="icon-cog"></em></a>-->
                                            </div>
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--报价列表中的澄清-->
<div class="modal fade" id="clarify-modal">
    <div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div>澄清</div>
            </div>
            <div id="test"></div>
            <div class="modal-body">
                <div class="row form-group text-center">
                    <div style="width: 330px;margin: 0 auto;">
                        <textarea name="remark-input" id="remark-input" cols="40" rows="5" placeholder="请输入澄清信息"></textarea>
                        <div class="row form-group">
                            <!--<lable>上传文档:</lable>-->
                            <div>
                                <script type="text/template" id="pe-template-url">
                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                        <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                            <div class="qq-upload-button-selector">
                                                <ul class="qq-upload-list-selector list-unstyled text-center" style="padding: 0 30px;" aria-live="polite" aria-relevant="additions removals">
                                                    <li class="text-center">
                                                <span class="btn btn-default" style="border: 1px solid #009944;color: #009944">
                                                    <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>
                                                    上传文档
                                                </span>
                                                        <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" id="clarify-files" tabindex="0" value="">
                                                        <div style="position: relative" class="uploaded-show">
                                                            <span class="qq-upload-file-selector qq-upload-file upload-file-name text-center" id="clarify-title" style="width: 200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"></span>
                                                            <span class="delete-file-btn yellow-text" style="float: right;">&times;</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions">
                                                    <li class="text-center">
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
                            </div>
                            <div class="fineuploader" attr-list="true" attr-template="pe-template-url"
                                 attr-ftype="zip,rar" load-type="inner">
                            </div>
                        </div>
                        <div class="row form-group file-type-note">仅支持zip,rar文档</div>
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


<!--foot-->
{x2;include:footer2}
<script>
    $(function() {
        var url = window.location.href;
        var formLocationStr = url.split('#')[1];
        if(formLocationStr === 'formCentre'){
            $('.submenu:eq(0)').delay(400).slideDown(700);
        }
        $('.submenu:eq(0) li:eq(0)').addClass("active");
        $('.shangjiatip').on('click', function() {
            var data = {result: false, message: '请将商品下架后再修改'};
            $.zoombox.show('', data);
            return false;

        });
    });

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


    //---提交澄清----
    var inquiryCommitBtnlock = 0;
    //---提交澄清----
    $('#tocomment').on('click', function () {
        //多次提交？
        if (inquiryCommitBtnlock === 1) {
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
        var json_text={
            text:text,
            fileurl:fileurl,
            filename:filename,
            sn:sn,
            type:1
        }
        $.ajax({
            type: 'get',
            //url: 'index.php?user-company-purchases-ajaxpost&text=' + text + '&fileurl=' + fileurl + '&filename=' + filename + '&sn=' + sn,
            dataType: 'JSON',
            data:json_text,
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

    //报价列表start
    //--------------更新报价单start--------------------------------------------
    function filepost(id) {
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-purchases-filepost&id=' + id+'&xunid='+xunid,
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
        if($('#offer-modal #offer-files').val()){
            $('#offer-modal #offer-title').html('');
        }
        $('#offer-modal #offer-files').val('');
        $('#offer-modal .offer-total-money').val('');
    }
    var clarifyCommitBtnLock = 0;
    $('#tocomment1').on('click', function () {

        //多次提交？
        if(clarifyCommitBtnLock === 1){
            return false;
        }
        var pid = $('#offersn').val();
        var fileurl = $('#offer-files').val();
        var totalNo = $('.offer-total-money').val();
        if (!totalNo) {

            var data = {
                result: false,
                message: '请上传报价金额'
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
            },
            error: function (e) {
                console.log(e);
                clarifyCommitBtnLock = 0;
            }
        })
    })
//--------------------------------更新报价单结束-----------------------------------------------
//
//--------------------------------报价列表中的澄清start---------------------------------------
    function catComment1(ordid) {
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

        if($('#clarify-modal #clarify-files').val()){
            $('#clarify-modal #clarify-title').html('');
        }
        $('#clarify-modal #clarify-files').val('');
        $("#clarify-modal").modal('show');
    }


    //---提交澄清----
    var offerCommitBtnLock = 0;
    $('#offerconfirm').on('click', function () {
        //多次提交？
        if(offerCommitBtnLock === 1){
            return false;
        }
        var sn = $('#sn').val();
        var text = $('#remark-input').val();
        var fileurl = $('#clarify-modal #clarify-files').val();
        var filename = $("#clarify-title").text();
        if (!text) {
            var data = {
                result: false,
                message: '请上传备注'
            };
            $.zoombox.show('ajax', data);
            return false;
        }
        /*if (!fileurl) {
         var data = {
         result: false,
         message: '请上传文档'
         };
         $.zoombox.show('ajax', data);
         return false;
         }*/
        offerCommitBtnLock = 1;
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-purchases-ajaxpost&text=' + text + '&fileurl=' + fileurl + '&filename=' + filename + '&sn=' +
            sn + '&type=1',
            dataType: 'JSON',
            success: function (res) {
                offerCommitBtnLock = 0;
                if (res.statusCode == 200) {
                    window.location.href = 'index.php?user-company-purchases-offer';
                    return true;
                } else {
                    alert('失败了');
                }
            },
            error: function (e) {
                console.log(e);
                offerCommitBtnLock = 0;
            }
        })
    })
    //--------------------------------报价列表中的澄清end--------------------------------------------
</script>
</body>

</html>
