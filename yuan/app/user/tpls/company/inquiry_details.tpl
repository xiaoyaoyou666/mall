{x2;include:header}

<body>
{x2;include:nav}

<style type="text/css">
    @font-face {
        font-family: 'iconfont';
        /* project id 814390 */
        src: url('//at.alicdn.com/t/font_814390_w8odnyf6faa.eot');
        src: url('//at.alicdn.com/t/font_814390_w8odnyf6faa.eot?#iefix') format('embedded-opentype'), url('//at.alicdn.com/t/font_814390_w8odnyf6faa.woff') format('woff'), url('//at.alicdn.com/t/font_814390_w8odnyf6faa.ttf') format('truetype'), url('//at.alicdn.com/t/font_814390_w8odnyf6faa.svg#iconfont') format('svg');
    }

    .content_s {
        margin-bottom: 20px;
    }

    .content_s li {
        height: 36px;
        line-height: 36px;
        width: 100%;
        padding-left: 40px;
    }

    .content_title {
        font-size: 18px;
    }

    .onload {
        color: #fe9010;
        margin-left: 5px;
    }

    .text{
        display: block;
        width: 98%;
        background: #eeeeee;
        border: 1px solid #cccccc;
        box-shadow: inset 0 1px 4px 0 rgba(0, 0, 0, 0.15);
        border-radius: 6px;
        height: 78px;
        margin: 10px 0px 20px 0px;
        padding:10px;
    }

    .cq {
        margin-left: 20px;
        padding-top: 15px;
         border-bottom: dashed 1px #eee;
        padding-left: 0px !important;
       /* height: auto !important;*/
        height: 120px!important;
        line-height: 26px!important;
        width: auto!important;
    }
    .cqs{
         border-bottom: dashed 1px #888;
    }
    .cq div {

        float: left;
        
    }

    .onload_f {
        font-size: 13px;
        color: #999;
    }

    .onload_f a {
        font-size: 13px;
    }

    .qr {
        background: #ffffff;
        border: 1px solid #009944;
        border-radius: 4px;
        width: 64px;
        height: 22px;
        line-height: 22px;
        font-size: 13px;
        color: #009944;
        position: relative;
        margin-top: 40px;
    }
    .h{
        background: #eee!important;
    }
</style>

<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">采购寻源</a> > <a>询价管理</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right published-purchase" id="content-box">
                <!--公司简介-->
                <div>
                    <div class="zmm_panel panel-default">
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <p class="clarify-title"><em class="title-triangle"></em>{x2;$one['xunjia_title']}</p>
                            <div class="pull-right" style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">
                                <a class="export-pdf-btn" style="padding-right: 20px"><i class="iconfont"
                                                                                         style="color: #009944;padding-right: 3px">&#xe6a0;</i>导出询价详情</a>
                                <a href="javascript:;"
                                   class="yellow-text pull-right" onclick="goBack()">返回上一页</a>
                            </div>
                        </div>

                        <!--我的模块开始-->
                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                            <ul class="content_s"> 
                                <li>询价类型 : <span>{x2;$purchasestatus[$one['xunjia_type']]}</span></li>
                                <li>发布时间 : <span>{x2;date:$one['create_time'],'Y-m-d H:i:s'}</span></li>
                                <li>截止时间 : <span>{x2;date:$one['end_time'],'Y-m-d H:i:s'}</span></li>
                            </ul>
                            <!--采购物资*************************************************************-->
                            <h4 class="content_title">采购物资</h4>
                            <ul class="content_s">
                                {x2;if:$one['xunjiadan_title'] == ''}      
                                  123
                                {x2;else}  
                                    <li>{x2;$one['xunjiadan_title']}<a href="{x2;$one['xunjiadan_url']}"
                                                                   download="{x2;$one['xunjiadan_title']}"
                                                                   class="onload">下载</a></li>
                                {x2;endif}   

                                {x2;if:$one['wuziguige_title'] == ''}                                   
                                   
                                {x2;else}       
                                     <li>{x2;$one['wuziguige_title']} <a href="{x2;$one['wuziguige_url']}"
                                                                    download="{x2;$one['wuziguige_title']}"
                                                                    class="onload">下载</a></li>
                                {x2;endif}                           
                            </ul>
                            <h4 class="content_title">付款方式</h4>
                            <ul class="content_s">
                                <li>{x2;$one['pay_type']}</li>
                            </ul>
                            <!--补存说明**************************************************************-->
                            <h4 class="content_title">采购物资</h4>
                            <div style="margin-left:20px;"><textarea readonly="readonly" class="text">{x2;$one['xunjia_explain']}</textarea></div>

                            <!--澄清说明*************************************************************-->
                            
                            <div>
                                 
                                <h4 class="content_title" style="float: left;height: 32px;line-height: 32px;margin-right: 20px;">澄清信息</h4>
                                <button id="release" data-toggle="modal" data-target="#myModal"style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;background:#fff;" {x2;if:$times==2} disabled="disabled" class="h" {x2;endif}>
                                    
                                 	<i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清
                                 </button>

                                <ul class="content_s" style="width:98%">
                                    {x2;tree:$two3,two,cid}
                                    <li class="cq">
                                        <div>
                                            <p>{x2;v:two['clarify_name']}</p>
                                            <p>{x2;v:two['clarify_des']}</p>
                                            <p class="onload_f">{x2;v:two['clarify_fillename']} {x2;if:v:two['clarify_file']}<a
                                                    href="{x2;v:two['clarify_file']}"
                                                    download="{x2;v:two['clarify_fillename']}" class="onload">下载</a>
                                            {x2;endif}
                                            </p>
                                        </div>
                                        {x2;if:v:two['clarify_uid'] != $demo}
　　　　　　　　　　　　　　　　　　　　    {x2;if:v:two['clarifydetail'] == '200'}
                                            <div style="float:right"><input type="button" value="已确认" class="qr"></div>
                                            <p style="clear: both;"></p>
                                           {x2;else}
                                            {x2;if:v:two['clarify_uid'] != $demo}
                                            <div style="float:right"><input type="button" value="确认" class="sub_add qr">
                                            </div>
                                           <p style="clear: both;"></p>
                                           {x2;endif}
                                           {x2;endif}
                                        {x2;endif}
                                        <input type="hidden" name="xun_id" value="{x2;$one['id']}" id="xun_id">
                                        <input type="hidden" class="charifyid" name="charifyid"
                                               value="{x2;v:two['clarify_uid']}">
                                        <input type="hidden" class="charifyxid" name="charifyxid"
                                               value="{x2;v:two['clarify_id']}">
                                        <input type="hidden" class="bao_id" name="charifyxid"
                                               value="{x2;v:two['clarify_xid']}">
                                    </li>
                                    {x2;endtree}
                                
                                </ul>
                                
                            </div>
                            <h4 class="content_title" id="offerinfo">报价信息</h4>
                            <!-- <form action="" method=""> -->
                            <fieldset>
                                <table class="table table-hover table-responsive table-bordered">
                                    <thead>
                                    <tr class="info" style="background:#f5f5f5;">

                                        <th style="background-color:#f5f5f5;font-weight: normal;width: 50px;">排名</th>
                                        <th style="background-color:#f5f5f5;font-weight: normal;">报价人</th>

                                        <th style="background-color:#f5f5f5;font-weight: normal;">报价金额</th>
                                        <th style="background-color:#f5f5f5;font-weight: normal;">报价明细</th>
                                        <th style="background-color:#f5f5f5;font-weight: normal;">报价时间</th>
                                        <th style="background-color:#f5f5f5;font-weight: normal;">澄清确认</th>
                                        <th style="background-color:#f5f5f5;font-weight: normal;">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {x2;tree:$baojia,bao,bid}
                                    <tr>
                                        <td class="form-inline cell-align-center">
                                            {x2;v:bao['keys']}

                                        </td>
                                        <td class="table-text" style="max-width:240px;">
                                            {x2;v:bao['company_name']}
                                        </td>

                                        <td>
                                            {x2;v:bao['total_price']} 元
                                        </td>
                                        <td>
                                            <a href="{x2;v:bao['file_url']}" download="{x2;v:bao['company_name']}报价明细"
                                               style="font-size: 12px;color: #F17D2B">下载</a>
                                        </td>

                                        <td>
                                            {x2;date:v:bao['addtime'],'Y-m-d H:i:s'}
                                        </td>
                                        <td>
                                            {x2;if:v:bao['baojia_status'] == '1'}
                                            <div><span>已确认</span></div>
                                            <p style="clear: both;"></p>
                                            {x2;endif}
                                            {x2;if:v:bao['baojia_status'] == '0'}
                                            <div><span style="color: #999;">未确认</span></div>
                                            <p style="clear: both;"></p>
                                            {x2;endif}
                                        </td>
                                        <td class="actions" style="text-align:left;">
                                            <input type="hidden" class="addPurchase"
                                                   value="{x2;v:bao['purchase_new_id']}">
                                            <input type="hidden" class="addbaojiaid" value="{x2;v:bao['supplier_id']}">

                                            <div class="btn-group">

                                                {x2;if:v:bao['baostatus'] == '200'}
                                                <i class="btn yellow-text file-btn" onclick="filepost(' {x2;v:bao['pid']}')" title="更新报价"><em class="iconfont"></em></i>

                                                {x2;else}
                                                <!-- <i class="iconfont ding btn yellow-text file-btn">&#xe613;</i>  disabled="disabled" class="h"-->

                                                 {x2;if:$one['status'] == '3'}
                                                     已完成
                                                 {x2;else}
                                                    {x2;if:$one['status'] == '4'}
                                                    已终止
                                                    {x2;else}

                                                         {x2;if:$dingbiao == '1'}
                                                    <a class="btn yellow-text dingbiao" href="index.php?user-company-clarify-priceOrder&xid={x2;v:bao['purchase_new_id']}&bid={x2;v:bao['supplier_id']}" title="定标"><em class="iconfont" >&#xe613;</em></a>
                                                    {x2;else}
                                                    已失效
                                                   
                                                    {x2;endif}

                                                    {x2;endif}
                                                   

                                                {x2;endif}
                                               
                                                {x2;endif}
                                            </div>
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                    </tbody>
                                </table>

                            </fieldset>
                            <!-- </form> -->
                        </div>
                        <!--我的模块结束-->

                    </div>
                </div>
                <!-- 右侧  end -->
            </div>
        </div>
    </div>
    <!--弹框-->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <div>澄清</div>
                </div>
                <div class="modal-body">
                    <div class="row form-group text-center">
                        <!--<lable class="control-label col-md-3">上传文档</lable>-->
                        <div style="width: 330px;margin: 0 auto;">
                            <textarea name="remark-input" cols="40" rows="5" id="text"></textarea>
                            <div class="row form-group">
                                <!--<lable>上传文档:</lable>-->
                                <div>
                                    <script type="text/template" id="pe-template-url">
                                        <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                            <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                                <div class="qq-upload-button-selector">
                                                    <ul class="qq-upload-list-selector list-unstyled text-center"
                                                        style="padding: 0 30px;" aria-live="polite"
                                                        aria-relevant="additions removals">
                                                        <li>
                                                            <input type="hidden" name="xun_id" value="{x2;$one['id']}"
                                                                   id="xun_id">
                                                            <input type="hidden" name="xun_ren"
                                                                   value="{x2;$one['xunjia_ren']}" id="xun_ren">
                                                            <input size="60"
                                                                   class="form-control qq-edit-filename-selector"
                                                                   type="hidden" name="urls" id="clarify-files"
                                                                   tabindex="0" value="">
                                                            <div style="position: relative" class="uploaded-show">
                                                                <span class="qq-upload-file-selector qq-upload-file"
                                                                      id="title"
                                                                      style="line-height: 17px;max-width: 253px;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 1;"></span>
                                                                <span class="yellow-text"
                                                                      style="position: absolute;right: 16px;display: block;top: -6px;">修改</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                        aria-relevant="additions removals">
                                                        <li class="text-center">
                                                            <span class="btn btn-default"
                                                                  style="border: 1px solid #feac56;background-color: #fff0e0;">上传文档</span>

                                                            <input size="60"
                                                                   class="form-control qq-edit-filename-selector"
                                                                   type="hidden" name="urls" tabindex="0" value="">
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </script>
                                </div>
                                <div class="fineuploader" attr-list="true" attr-template="pe-template-url"
                                     attr-ftype="xls,xlsx,zip,rar" load-type="inner">
                                </div>
                            </div>
                            <div class="row form-group file-type-note">仅支持xls,xlsx,zip,rar文档</div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="sub_btn"> 确&nbsp;&nbsp;定
                    </button>
                    <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- 报价金额 -->
    <div class="modal fade" id="file-modal">
    <div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div>更新报价单</div>
            </div>

            <div id="filecontent">
            </div>
            <div class="modal-body">
                <div class="row form-group" style="padding-left: 61px;">
                    <span style="display: inline-block">报价金额：</span>
                    <input type="number" class="form-control offer-total-money" style="width: 200px;display: inline-block" min="0">
                </div>
                <div class="row form-group text-center">
                    <!--<lable class="control-label col-md-3">上传文档</lable>-->
                    <div style="width: 330px;margin: 0 auto;">
                        <!-- <textarea name="remark-input" cols="40" rows="5"></textarea> -->
                        <div class="row form-group">
                            <!--<lable>上传文档:</lable>-->
                            <div>
                                <script type="text/template" id="pe-template-url">
                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                        <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                            <div class="qq-upload-button-selector">
                                                <ul class="qq-upload-list-selector list-unstyled text-center"
                                                    style="padding: 0 30px;" aria-live="polite"
                                                    aria-relevant="additions removals">
                                                    <li>
                                                        <input size="60" class="form-control qq-edit-filename-selector"
                                                               type="hidden" name="urls" id="clarify-files" tabindex="0" value="">
                                                        <div style="position: relative" class="uploaded-show">
                                                    <span class="qq-upload-file-selector qq-upload-file" id="title"
                                                          style="line-height: 17px;max-width: 253px;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 1;"></span>
                                                            <span class="yellow-text"
                                                                  style="position: absolute;right: 16px;display: block;top: -6px;">修改</span>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals">
                                                    <li class="text-center">
                                                <span class="btn btn-default"
                                                      style="border: 1px solid #feac56;background-color: #fff0e0;">上传文档</span>


                                                        <input size="60" class="form-control qq-edit-filename-selector"
                                                               type="hidden" name="urls" tabindex="0" value="">
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
                <button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="tocomment"> 确&nbsp;&nbsp;定
                </button>
                <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
            </div>
        </div>
    </div>
</div>
<!--定标-->
    <div class="modal fade" id="d-modals" >
    <div class="modal-dialog" style="width: 384px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
        <div class="modal-content" style="height:262px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div>提示</div>
            </div>

            <div id="filecontent">
            </div>
            <div class="modal-body">
                  <div style="text-align: center;margin-bottom: 10px;"><img src="app/core/styles/img/question.png"></div>
                  <div style="text-align: center;">定标结果不可变更，系统将自动生成采购订单，是否确认？</div>
   
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="tocomment"> 确&nbsp;&nbsp;定
                </button>
                <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
            </div>
        </div>
    </div>
</div>
</div>
{x2;include:footer2}
<script src="app/core/styles/js/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.debug.js"
        integrity="sha384-THVO/sM0mFD9h7dfSndI6TS0PgAGavwKvB5hAxRRvc0o9cPLohB0wb/PTA7LdUHs"
        crossorigin="anonymous"></script>

<script>
    $('.submenu:eq(2)').delay(400).slideDown(700);
    function goBack() {
        history.go(-1);
    }
    
 
    /*
     * ajax  add 澄清内容
     */
    
    $("#sub_btn").click(function () {
        var uds = $('#clarify-files').val();//路径
        var title = $("#title").text();//文档标题
        var text = $("#text").val();//文字描述
        var xunid = $("#xun_id").val();//询价单id
        var xunren = $("#xun_ren").val();//询价表的用户id

        if (text == '') {
            var data = {result: false, message: '请澄清说明'};
            $.zoombox.show('ajax', data);
            return false;
        }
        if (uds == '') {
            var data = {result: false, message: '请上传文档'};
            $.zoombox.show('ajax', data);
            return false;
        }
        if (text == '') {
            var data = {result: false, message: '请写入标题'};
            $.zoombox.show('ajax', data);
            return false;
        }
        var jsons = {text: text, uds: uds, title: title, xunid: xunid, xunren: xunren};
        console.log(jsons);
        $.ajax({
            type: 'post',
            url: "index.php?user-company-clarify-addclarifylists",
            dataType: 'JSON',
            data: jsons,
            success: function (res) {
                if (res.statusCode == 200) {
                    var data = {result: false, message: res.message};
                    //$.zoombox.show('ajaxOK', data);
                    window.location.reload();
                } else {
                    var data = {result: false, message: res.message};
                    $.zoombox.show('ajax', data);
                }
            }
        });
    })

    /*
     * 添加澄清确定按钮 判断状态
     */
    $("body").on('click', '.sub_add', function () {
        var uid = $(this).parent("div").siblings(".charifyid").val()//询价单id
            , xid = $(this).parent("div").siblings(".charifyxid").val()//澄清发布id  bao_id
            , bid = $(this).parent("div").siblings(".bao_id").val()//询价单id
            , jsons = {uid: uid, xid: xid, bid: bid};
        $.ajax({
            type: 'post',
            url: "index.php?user-company-clarify-addclarify",
            dataType: 'JSON',
            data: jsons,
            success: function (res) {
                if (res.statusCode == 200) {
                    // var data = {result: false, message: res.message};
                    // $.zoombox.show('ajaxOK', data);
                    window.location.reload();
                } else {
                    var data = {result: false, message: res.message};
                    $.zoombox.show('ajax', data);
                }
            }
        });
    })

    //提交订单
    $("body").on('click', '.sub_mit', function () {
    	$("#d-modals").modal('show');
        var xid = $(this).parent("div").siblings(".addPurchase").val();//澄清发布id
        var bid = $(this).parent("div").siblings(".addbaojiaid").val();//澄清发布id
        var jsons = {xid: xid, bid: bid};
        // $.ajax({
        //     type: 'post',
        //     url: "index.php?user-company-clarify-priceOrder",
        //     dataType: 'JSON',
        //     data: jsons,
        //     success: function (res) {
        //         if (res.statusCode == 200) {
        //             var data = {result: false, message: res.message};
        //             $.zoombox.show('ajaxOK', data);
        //             window.location.href = res.forwardUrl
        //         } else {
        //             var data = {result: false, message: res.message};
        //             $.zoombox.show('ajax', data);
        //         }
        //     }
        // });
    })
    //导出pdf
    $('.export-pdf-btn').on('click', function () {
        //导出html到pdf文件
        html2canvas(document.getElementById('content-box'), {
            onrendered: function (canvas) {
                var contentWidth = canvas.width;
                var contentHeight = canvas.height;

                //一页pdf显示html页面生成的canvas高度;
                var pageHeight = contentWidth / 592.28 * 841.89;
                //未生成pdf的html页面高度
                var leftHeight = contentHeight;
                //页面偏移
                var position = 0;
                //a4纸的尺寸[595.28,841.89]，html页面生成的canvas在pdf中图片的宽高
                var imgWidth = 595.28;
                var imgHeight = 592.28 / contentWidth * contentHeight;

                var pageData = canvas.toDataURL('image/jpeg', 1.0);

                var pdf = new jsPDF('', 'pt', 'a4');

                //有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
                //当内容未超过pdf一页显示的范围，无需分页
                if (leftHeight < pageHeight) {
                    pdf.addImage(pageData, 'JPEG', 0, 0, imgWidth, imgHeight);
                } else {
                    while (leftHeight > 0) {
                        pdf.addImage(pageData, 'JPEG', 0, position, imgWidth, imgHeight)
                        leftHeight -= pageHeight;
                        position -= 841.89;
                        //避免添加空白页
                        if (leftHeight > 0) {
                            pdf.addPage();
                        }
                    }
                }
                var title = $('.clarify-title').text();
                pdf.save(title+".pdf");
            }
        });
    })
// 新增加功能
   function filepost(id){
        $.ajax({
        type: 'get',
        url: 'index.php?user-company-clarify-filepost&id=' + id,
        dataType: 'JSON',
        async: true,
        success: function (res) {
            if (res.statusCode == 201) {
                $("#filecontent").html(res.data);
            } else {
                var message = res.message;
                return false;
            }
        },
        error: function (e) {
            console.log(e);
        }
    })
        $("#file-modal").modal('show');
    }


        $('#tocomment').on('click', function () {
        var pid = $('#offersn').val();
        var fileurl = $('#clarify-files').val();
        var totalNo = $('.offer-total-money').val();
        if(!totalNo){
            var data = {
                result: false,
                message: '请上传报价金额'
            };
            $.zoombox.show('ajax', data);
            return false;
        }
        if(!fileurl){
            var data = {
                result: false,
                message: '请上传文档'
            };
            $.zoombox.show('ajax', data);
            return false;
        }
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-clarify-filecommit&pid=' + pid + '&fileurl=' + fileurl+ '&totalNo=' + totalNo,
            dataType: 'JSON',
            success: function (res) {
                if (res.statusCode == 200) {
                    var data = {result: false, message: res.message};
                    $.zoombox.show('ajaxOK', data);
                    window.location.reload();
                } else {
                    var data = {result: false, message: res.message};
                    $.zoombox.show('ajax', data);
                }
            },
            error: function (e) {
                console.log(e);
            }
        })
    })
</script>
</body>

</html>