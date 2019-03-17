{x2;include:header}

<body>
{x2;include:nav}
<style>
    .xz_button:hover {
        color: #009944 !important;
    }

    .color-green {
        margin-right: 10px;
    }

    .why-btn-big-green:hover {
        background: #057d3a !important;
    }

    .load {
        color: #feb534;
        margin-left: 5px;
    }

    .in_t {
        background: #ffffff;
        border: 1px solid #cccccc;
        box-shadow: inset 0 1px 4px 0 rgba(0, 0, 0, 0.15);
        border-radius: 6px;
        width: 170px;
        height: 28px;
        margin-right: 10px;
    }

    .why-cg-detail a:hover {
        color: #222;
    }

    .tabls_s {
        text-align: left;
    }

    .tabls_s th {
        text-align: left;
        padding: 0px 8px;
    }

    .why-xj-list {
        margin-top: 60px;
        margin-bottom: 10px;
    }

    .why-cg-detail {
        padding-left: 0px;
    }

    .tabls_s tr td {
        text-align: left;
        padding: 4px 8px;
    }

    .s_img {
        width: 200px;
        /*	background: rgba(0, 153, 68, 0.05);*/
        padding-left: 0px;
        float: left;
    }

    .s_img .qq-uploader-selector {
        position: relative;
        /*left: 50%;
    margin-left: -105px;*/
        height: 160px;
    }

    .sc {
        border: 1px solid rgb(204, 204, 204);
        border-radius: 4px;
        height: 30px;
        line-height: 30px;
        width: 100px;
        /*margin-top: 10px;*/
        padding-left: 30px;
        background: url(app/core/styles/images/upload.png) 10px center / 15px no-repeat;
        position: relative;
        overflow: hidden;
        direction: ltr;
        background-color: #fff;
    }

    input[type=file] {
        left: 0px !important;
        display: block !important;
    }

    .error-reason {
        float: left;
        margin-top: 4px;
        font-size: 13px;
        color: #f00;
    }

    .timer_as {
        width: 290px;
        height: 68px;
        position: absolute;
        right: -8px;
        top: 122px;
    }

    .time_bg {
        width: 100%;
    }

    .surplus {
        position: absolute;
        top: 8px;
        color: #fff;
        left: 62px;
    }

    .timer_surplus {
        font-size: 20px;
        color: #fff;
        position: absolute;
        top: 35px;
        left: 62px;
    }

    .timer_sa {
        width: 290px;
        height: 68px;
        position: absolute;
        right: -8px;
        top: 122px;
        display: none;
    }

    .time_bg_s {
        width: 100%;
    }

    .surplus_s {
        position: absolute;
        top: 23px;
        color: #fff;
        left: 100px;
        font-size: 20px;
    }

    .timer_surplus_s {
        font-size: 20px;
        color: #fff;
        position: absolute;
        top: 35px;
        left: 62px;
    }

    .why-xj-list li {
        border-bottom: 1px dashed #eeeeee;
    }

    .bottom_img {
        width: 450px;
        position: absolute;
        right: 111px;
        bottom: 40px;
        opacity: 0.5;
    }

    .why-xj-list li {
        border-bottom: none;
    }

    .load-progress-bar {
        position: absolute;
        top: 0;
        z-index: 900;
    }

    .load-progress-bar img {
        width: 30px !important
    }

    .loading-note {
        display: none;
    }

    .why-cg-detail > span {
        width: 100px;
        text-align: right;
    }

    .why-cg-detail {
        margin: 7px 20px;
    }

    .table input {
        border: solid 1px #ebebeb;
        margin-bottom: 2px;
        width: 100px;
    }

    .load_d {
        color: #f08f35;
        margin-left: 10px;
    }

    .load_file p {
        display: inline-block;
        margin-right: 20px;
    }

    .uploaded-show {
        margin-top: 0;
    }

    .total-no {
        height: 33px;
        width: 1110px;
        text-align: right;
        padding-right: 10px;
        line-height: 30px;
        border-bottom: 1px solid #ddd;
        border-left: 1px solid #ddd;
        border-right: 1px solid #ddd;
    }

    .total-no > span {
        font-size: 14px;
        color: #323232;
    }

    .total-no > span > i {
        font-style: normal;
        color: #009944;
    }
</style>
<div style="background-color:#fff; width: 100%;">
    <div class="container">
        <div class="t20" style="width: 1180px;"><img style="width: 1180px" src="app/core/styles/images/cg-ad01.jpg"
                                                     alt=""></div>
        <div class="pull-left" style="width: 1180px;position: relative;">
            <!--采购信息-->
            <div class="zmm_panel panel-default t20" style="width: 1180px;">
                <div class="zmm-qydt-title zmm-qydt-shsj1">
                    <p>询价邀请函</p><input type="hidden" value="{x2;$time}" id="endtime">
                </div>
                <p class="text-center" style="width: 100%;padding: 20px 0 10 0;font-size: 18px;">
                    {x2;$detial['xunjia_title']}</p>
                <!--时间-->
                <!--时间-->
                <div class="timer_as">
                    <img class="time_bg" src="app/core/styles/images/blue.png"/>
                    <p class="surplus">询价截至时间还剩</p>
                    <p class="timer_surplus"><span id="day_show">0天</span><span id="hour_show">0时</span><span
                            id="minute_show">0分</span><span id="second_show">0秒</span></p>
                </div>
                <!--时间截至-->
                <div class="timer_sa">
                    <img class="time_bg_s" src="app/core/styles/images/glay.png"/>
                    <p class="surplus_s">报价已终止</p>
                </div>
                <ul class="why-xj-list t20" style="margin-top: 10px;">
                    <li style="font-size: 16px;"><span class="glyphicon glyphicon-th-large color-green"></span><span
                            class="c5">基本信息</span></li>
                </ul>
                <div class="why-cg-detail t20" style="color: #009944;"><span>询价类型：</span>{x2;if:$detial['xunjia_type']==1}邀请询价{x2;else}公开询价{x2;endif}
                </div>
                <div class="why-cg-detail t20"><span>发布时间：</span>{x2;date:$detial['create_time'],'Y-m-d H:i:s'}</div>
                <div class="why-cg-detail t20"><span>截止时间：</span>{x2;date:$detial['end_time'],'Y-m-d H:i:s'}</div>
                <div class="why-cg-detail t20"><span>税率：</span>{x2;$detial['taxrate']}</div>
                <div class="why-cg-detail t20"><span>要求到货日期：</span>{x2;date:$detial['expire_time'],'Y-m-d'}</div>
                <div class="why-cg-detail t20"><span>付款方式：</span>{x2;$detial['pay_type']}</div>
                <div class="why-cg-detail t20"><span style="float: left;">补充说明：</span><span
                        style="width: 500px;text-align: left;">{x2;$detial['xunjia_explain']}</span></div>

                <ul class="why-xj-list t20">
                    <li style="font-size: 16px;"><span class="glyphicon glyphicon-th-large color-green"></span><span
                            class="c5">立即报价</span></li>
                </ul>
                <form action="index.php?purchase-app-content-newPricePurchase" method="post" style="margin-left: 30px;">
                    <!--表格-->
                    <table class="table table-hover table-bordered" style="width: 1110px;margin-bottom: 0;">
                        <thead style="background: #ededed!important;">
                        <tr>
                            <th>序号</th>
                            <th style="width: 220px;">物资名称</th>
                            <th>型号/规格</th>
                            <th>采购量</th>
                            <th>单位</th>
                            <th>项目单位</th>
                            <th style="width: 130px;">说明</th>
                            <th>承诺到货时间</th>
                            <th>报价单价(元)</th>
                            <th>报价金额</th>
                            <th>备注</th>
                        </tr>
                        </thead>
                        <tbody>
                        {x2;tree:$materialarr,material,mid}
                        <tr>
                            <td>{x2;v:material['ordernum']}</td>
                            <td>{x2;v:material['material_title']}</td>
                            <td>{x2;v:material['material_norms']}</td>
                            <td class="num">{x2;v:material['material_num']}</td>
                            <td>{x2;v:material['material_unit']}</td>
                            <td>{x2;v:material['xiangmuDanwei']}</td>
                            <td>{x2;v:material['material_explain']}</td>

                            {x2;if:$isbaojiastatus}
                            <td><input type="text" class="stime" name="promisetimes[]" readonly="readonly"
                                       value="{x2;v:material['addtime']}"></td>
                            <td><input type="text" onkeyup="value=value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3')"
                                       name="singleprices[]" style="width: 100px;" class="price"
                                       value="{x2;v:material['single_price']}"></td>
                            <td class="total_amount"><span>{x2;v:material['total_price']}</span><input type="hidden"
                                                                                                       name="totalprices[]"
                                                                                                       value="{x2;v:material['total_price']}">
                            </td>
                            <td><input type="text" name="remarks[]" value="{x2;v:material['remarks']}"></td>
                            {x2;else}
                            <td><input type="text" class="stime" name="promisetimes[]" readonly="readonly"></td>
                            <td><input type="text" onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                       name="singleprices[]" style="width: 100px;" class="price"></td>
                            <td class="total_amount"><span></span><input type="hidden" name="totalprices[]" value="">
                            </td>
                            <td><input type="text" name="remarks[]"></td>


                            {x2;endif}

                            <input type="hidden" name="pricerecordids[]" value="{x2;v:material['pricerecordid']}">
                            <input type="hidden" name="materialids[]" value="{x2;v:material['id']}">
                            <input type="hidden" name="materialnums[]" value="{x2;v:material['material_num']}">
                        </tr>
                        {x2;endtree}
                        </tbody>

                    </table>
                    <div class="total-no">
                        <span>合计：<i></i></span>
                    </div>

                    <div class="load_file">
                        {x2;if:$detial['technicalfile_url']}
                        <p>技术附件：<a href="{x2;$detial['technicalfile_url']}"
                                   download="{x2;$detial['technicalfile_url']}">{x2;$detial['technicalfile_title']}<span
                                class="load_d">下载</span></a></p>
                        {x2;endif} {x2;if:$detial['businessfile_url']}
                        <p>商务附件：<a href="{x2;$detial['businessfile_url']}" download="{x2;$detial['businessfile_url']}">{x2;$detial['businessfile_title']}<span
                                class="load_d">下载</span></a></p>
                        {x2;endif} {x2;if:$detial['other_url']}
                        <p>其他附件：<a href="{x2;$detial['other_url']}" download="{x2;$detial['other_url']}">{x2;$detial['other_title']}<span
                                class="load_d">下载</span></a></p>
                        {x2;endif}
                    </div>

                    <div class="form-group why-cg-detail t20" style="margin:10px 0px" id="bj_files">
                        <div class="head" style="display: inline-block;float: left;">报价文件：</div>

                        <!-- buneng  -->
                        {x2;if:$detial['status']==4 || $time
                        <=0 || $is_show==0 || $detial['status']==3}
                        <div class="s_img">
                            <div style="width:120px;text-align: left;float: left;">
                                <span class="sc" style="background-color:#e4e4e4;border:solid 1px #e4e4e4;color: #999;">点击上传</span>
                            </div>
                            {x2;if:$isbaojiastatus}<span>{x2;$baojiaarr['url_name']}</span>{x2;endif}
                        </div>

                        {x2;else}

                        <div class="s_img">
                            <script type="text/template" id="pe-template-url3">

                                <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传"
                                     style="clear:both;left:0px;margin-left: 0px;height:60px">
                                    <div class="qq-upload-button-selector"
                                         style="overflow: auto!important;width: 600px;">
                                        <ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite"
                                            aria-relevant="additions removals" style="clear:both;">
                                            <li class="text-center" style="float: left;">
                                                <div style="width:120px;text-align: left;float: left;"><span class="sc">点击上传</span>
                                                </div>
                                                <input size="60" class="form-control qq-edit-filename-selector"
                                                       type="hidden" name="args[attach]" tabindex="0" value=""
                                                       needle="needle" msg="文件上传中,请稍后提交" style="width:20px;"
                                                       id="files_span_url">
                                                <div style="position: absolute;margin-left: 110px"
                                                     class="uploaded-show">
                                                    <span class="qq-upload-file-selector" id="file_span_names"
                                                          style="width:200px;overflow: hidden; white-space: nowrap;text-overflow: ellipsis;margin-left: 10px;"></span>
                                                    <span class="delete-file-btn"
                                                          style="float: right;color:#feb534;margin-left: 5px">&times;</span>
                                                </div>
                                            </li>

                                        </ul>
                                        <ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite"
                                            aria-relevant="additions removals" style="clear:both;">
                                            <li class="text-center">
                                                <div style="width:120px;text-align: left;float: left;"><span class="sc">点击上传</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </script>
                            <div class="fineuploader" attr-list="true" attr-template="pe-template-url3"
                                 attr-ftype="pdf,rar,zip,doc,docx,xls,xlsx" load-type="inner"></div>
                            <div style="width:400px;margin-top: -25px;color: #aaa;">支持pdf,rar,zip,doc,docx,xls,xlsx文件
                            </div>
                        </div>
                        {x2;endif}

                    </div>

                    <div class="why-cg-detail t20"
                         style="margin-top: 20px;clear: both;margin-left: 70px;padding-top: 40px;">
                        {x2;if:$detial['status']==4 || $time
                        <=0 || $is_show==0 || $detial['status']==3}

                        {x2;if:$isbaojiastatus}
                        <input type="submit" disabled="disabled" value="更新报价"
                               style="background:#ccc;color: #fff;border-radius:4px;height:30px;width:100px;text-align: center;line-height:30px;padding: 0;border: solid 1px #ccc;">
                        {x2;else}
                        <input type="submit" disabled="disabled" value="提交报价"
                               style="background:#ccc;color: #fff;border-radius:4px;height:30px;width:100px;text-align: center;line-height:30px;padding: 0;border: solid 1px #ccc;">
                        {x2;endif}


                        {x2;else}


                        {x2;if:$isbaojiastatus}
                        <input type="submit" value="更新报价" id="sub_btn" class="why-btn-big-green"
                               style="background:#009944;color: #fff;border-radius:4px;height:30px;width:100px;text-align: center;line-height:30px;padding: 0;">
                        {x2;else}
                        <input type="submit" value="提交报价" id="sub_btn" class="why-btn-big-green"
                               style="background:#009944;color: #fff;border-radius:4px;height:30px;width:100px;text-align: center;line-height:30px;padding: 0;">
                        {x2;endif}


                        {x2;endif}
                        <a href="index.php?purchase-app-content-baoJiaXuZhi" target="_blank" class="load">报价须知</a>

                        <input type="hidden" name="purchaseid" value="{x2;$purchaseid}"/>
                    </div>
                    <input type="hidden" name="args[url_name]" id="file_span_name">
                </form>
                <div style="position: relative;margin-top: 200px;"><img class="bottom_img"
                                                                        src="app/core/styles/images/bottom_img.png"/>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    //時間空間
    $(function () {
        $('.stime').datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd ',
            todayHighlight: 1,
            forceParse: 0,
            showMeridian: 1,
            autoclose: 1,
            minView: 2
        });
    })
    $('#tologin').on('click', function () {
        var username = $('#username').val();
        var userpassword = $('#userpassword').val();
        $.ajax({
            type: 'get',
            url: 'index.php?user-app-login-login&un=' + username + '&up=' + userpassword,
            dataType: 'JSON',
            async: true,
            success: function (res) {
                console.log(res);
                if (res.statusCode == 201) {
                    var data = {
                        result: false,
                        message: "登录成功"
                    };
                    $.zoombox.show('ajaxOK', data);
                    setTimeout(function () {
                        window.location.href = 'index.php?purchase-app-content'
                    }, 2000);
                    return false;
                } else {
                    var message = res.message;
                    var data = {
                        result: false,
                        message: message
                    };
                    $.zoombox.show('ajax', data);
                    return false;
                }
            },
            error: function (e) {
                console.log(e);
            }
        })
    })
    $(function () {
        var i = 0;
        $('.why-ph-list li').each(function () {
            i++;
            //$(this).find('span').html(i);
            if (i == 1) {
                $(this).find('span').html("<img src='app/core/styles/images/cg-ph0" + i + ".jpg'>");
            } else if (i == 2) {
                $(this).find('span').html("<img src='app/core/styles/images/cg-ph0" + i + ".jpg'>");
            } else if (i == 3) {
                $(this).find('span').html("<img src='app/core/styles/images/cg-ph0" + i + ".jpg'>");
            } else {
                $(this).find('span').html(i);
            }
        })

    });
    //隐藏的name值
    $("#bj_files").on("change", function () {
        $("#file_span_name").val($("#file_span_names").text());

    })

    //提交時必填
    $("#sub_btn").on("click", function (event) {
        console.log($("#file_span_name").val());
        var pd = true;
        $('.stime').each(function () {
            var time = $(this).val();
            if (time == "") {
                var data = {
                    result: false,
                    message: '请选择承诺到货时间'
                };
                $.zoombox.show('ajax', data);
                pd = false;
            }
        });
        $(".price").each(function () {
            var price = $(this).val();
            if (price == "") {
                var data = {
                    result: false,
                    message: '请输入单价'
                };
                $.zoombox.show('ajax', data);
                pd = false;
            }
        });
        console.log(pd)
        if (pd == false) {
            return false;
            event.preventDefault();
        }
    })

    //合计计算器
    function totalAmountCalculator() {
        var cells = $('.total_amount').find('span'),total = 0;
        $.each(cells, function (index, item) {
            total += Number($(item).text());
        })
        $(".total-no i").html(total+'元');
        return total;
    }
    totalAmountCalculator();
    //计算总金额
    $(document).on("blur", ".price", function () {
        var total_amount;
        var price = $(this).val();
        var num = $(this).parent("td").siblings(".num").text();
        total_amount = Number(price) * Number(num);
        console.log(total_amount);
        $(this).parent("td").siblings(".total_amount").find("span").text(total_amount.toFixed(2));
        $(this).parent("td").siblings(".total_amount").find("input").val(total_amount.toFixed(2));
        totalAmountCalculator();
    })
    //时间插件
    //时间倒计时
    var intDiff = $("#endtime").val();//倒计时总秒数量
    function timer(intDiff) {
        window.setInterval(function () {
            var day = 0,
                hour = 0,
                minute = 0,
                second = 0; //时间默认值
            if (intDiff > 0) {
                day = Math.floor(intDiff / (60 * 60 * 24));
                hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
            }
            if (minute <= 9) minute = '0' + minute;
            if (second <= 9) second = '0' + second;
            $('#day_show').html(day + "天");
            $('#hour_show').html('<s id="h"></s>' + hour + '时');
            $('#minute_show').html('<s></s>' + minute + '分');
            $('#second_show').html('<s></s>' + second + '秒');
            if (intDiff <= 0) {
                $(".timer_as").hide();
                $(".timer_sa").show();
            }
            intDiff--;
        }, 1000);
    }

    $(function () {
        timer(intDiff);
    });
</script>
{x2;include:footer2}

</body>

</html>