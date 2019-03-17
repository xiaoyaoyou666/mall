<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>天工e购</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/datetimepicker.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/fpeskin.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/why.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/hln.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/zmm.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/lightbox.min.css"/>
    <!-- <link rel="stylesheet" type="text/css" href="app/core/styles/css/corporateCentre.css"/>-->
    <script type="text/javascript" src="app/core/styles/js/jquery.min.js"></script>
    <script type="text/javascript" src="app/core/styles/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="app/core/styles/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="app/core/styles/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="app/core/styles/js/all.fine-uploader.min.js"></script>
    <script type="text/javascript" src="app/core/styles/js/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="app/core/styles/js/plugin.js"></script>
    <script type="text/javascript" src="app/core/styles/js/lightbox-plus-jquery.js"></script>
    <style>
        header ul.sel_nav li{
            float:none;
            border-right:0px;
            border-left:0px;
            height:30px;
            line-height: 30px;
        }
        header ul.sel_nav{
            position: fixed;
            top: 29px;
            z-index: 500;
            width: 105px;
            padding-left: 10px;
            height: 60px;
            margin-left: -1px;
            background-color: #fff;
            display: none;
            border: solid 1px #ccc;
            border-top: 0px;
            z-index: 1000;
        }
        ul.sel_nav a{
            border-left: 0px;
            padding-left: 10px;
        }
        .sel_x{
            width:10px;
            margin-left: 10px;
        }
        .col-xs-12{
            padding:0px;
        }
    </style>
</head>
<body>


<header class="b86">
    <div class="container">
        <div class="col-xs-12 header_top">
            <p>
                {x2;if:$_user['userid']}
                {x2;if:$_user['company_name']}
                <a href="index.php?user-company" style="border: 0;color:#ff8a00;padding-left:0px;">{x2;$_user['company_name']}</a> 欢迎您!
                {x2;else}
                <a href="index.php?user-company" style="border: 0;color:#ff8a00;padding-left:0px;"> {x2;$_user['username']}</a> 欢迎您!
                {x2;endif}
                {x2;else}
                欢迎访问天工e购电子商务平台
                {x2;endif}
            </p>

            <ul class="full_right">
                {x2;if:$_user['userid']}
                <li class="msg_hover"><a href="index.php?user-company-message-message" style="border-left:0px;padding:0px;width:40px;"><img src="app/core/styles/images/index/msg.png" style="width:18px;margin-top:-2px;"><span style="color: #ff0000;padding-left:0px;">{x2;$msgnum}</span></a></li>
                <li><a href="index.php?item-app-cart"><img src="app/core/styles/img/gw2.png" style="margin-top:-1px;width:23px;"><span style="color: #ff0000;background:#009944;padding-left:0px;">{x2;$cartNum}</span></a></li>
                <li class="phone" style="-webkit-transition:all 0s;">
                    <a href="javascript:;">收藏夹<img src="app/core/styles/images/sel_x.png" style="margin-top:-4px;" class="sel_x"></a>

                    <ul class="sel_nav">
                        <li><a href="index.php?user-company-items-goods">商品</a></li>
                        <li><a href="index.php?user-company-items-supplier">供应商</a></li>
                    </ul>

                </li>
                <li class="phone" style="-webkit-transition:all 0s;">
                    <a href="javascript:;">发&nbsp;&nbsp;&nbsp;布<img src="app/core/styles/images/sel_x.png" style="margin-top:-4px;" class="sel_x"></a>

                    <ul class="sel_nav" style="width:103.44px;height: auto">
                        <li><a href="index.php?user-company-items-add">商品</a></li>
                        {x2;if:$_user['users_role']==4}
                        <li><a href="index.php?user-company-purchases-xunJianPush">询价发布</a></li>
                        {x2;endif}
                    </ul>

                </li>
                <li><a href="{x2;if:$_user['users_role']==0}index.php?user-company{x2;else}index.php?user-company-index-suplier_list{x2;endif}" style="padding-left:15px;">企业中心</a></li>
                <li class="phone" style="min-width: 109px;">
                    <a href="index.php?user-company">{x2;$_user['username']}</a>
                    <ul class="sel_nav" style="height:30px;text-align: center;">
                        <li><a class="ajax" href="index.php?user-app-logout">退出登录</a></li>
                    </ul>
                </li>

                {x2;else}
                <li><a href="index.php?user-app-login"> 登录 </a></li>
                <li><a href="index.php?user-app-register">注册</a></li>
                {x2;endif}
                <li class="phone" style="-webkit-transition:all 0s;">
                    <a href="" class="phone_icon"><img src="app/core/styles/images/qyhy/phone_icon.png"></a>
                    <div id="alert_phone">
                        010-57672944
                    </div>
                </li>
            </ul>
        </div>
        <div class="col-xs-12 header-bottom">
            <ul>
                <li>
                    <a href="index.php"><img src="app/core/styles/images/index/login.png" alt=""></a>
                </li>
                <!-- <li><a href="index.php">首页</a></li> -->
                <li><a href="index.php?item">网格超市</a></li>
                <li><a href="index.php?company-app-index" style="color: #009944;">供应商展示</a></li>
                <li><a href="index.php?purchase">采购寻源</a></li>
                <!-- <li><a href="index.php?company-app-index" style="color: #009944;">供应商展示</a></li> -->
                <!-- <li><a href="index.php?item">网格超市</a></li> -->
                <!--  <li><a target="_blank" href="http://zhaobiao.tgcw.net.cn/cms/index.htm">招投标</a></li> -->
                <li><a href="index.php?content-app-content-wait">招投标</a></li>
            </ul>
            <p class="full_right" style="margin-top:38px;">
                <select id="searchType" style="float: left;margin-right:10px;">
                    <option value="1" {x2;if:$stype&&$stype==1} selected="selected" {x2;endif}>采购信息</option>
                    <option value="2" {x2;if:$stype&&$stype==2} selected="selected" {x2;endif}>供应商</option>
                </select>
                <input type="text" style="float: left;" class="input_tx" id="searchKeyword" value="{x2;$keyword}" placeholder="请输入关键词"><span class="input_span" id="tosearch"></span>
            </p>

        </div>
    </div>
</header>
<div style="position: relative;border-top:4px solid #009944;"></div>

<style type="text/css">
    .modalCenter{
        position:fixed;
        top:50%;
        left:50%;
        transform:translateX(-50%) translateY(-50%);
    }
    .modal-header{
        border-bottom: 0 !important;
    }
    .modal-footer {
        text-align: center;
        border-top: 0 !important;
    }
    .modal-body{
        padding: 5px 15px !important;
    }
    .xunjia-title{
        width:140px;
        border-bottom: 2px solid #009944;
        margin-top: 30px;
        margin-left:calc(50% - 70px);
        font-size:16px;
        color:#323232;
    }
    .btn-green{
        width:90px;
        height: 34px;
        background-color: #009944;
        color: #fff;
        border-radius:1px;
    }
</style>
<div class="modal fade modalCenter" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <div class="xunjia-title text-center"><h4>提示</h4></div>
            </div>
            <div class="modal-body text-center">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn-green r20" data-dismiss="modal"> 确&nbsp;&nbsp;定 </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $("#tab_search a").on('click',function(){
        $("#tab_search a").removeClass('tab_on');
        $(this).addClass('tab_on');
        $("#searchType").val($(this).attr('value'));
    })

    $("body").keydown(function (e) {
        if(e.keyCode==13){
            var searchType = $("#searchType").val();
            var searchKeyword = $("#searchKeyword").val();
            //console.log(searchType,searchKeyword);return false;
            var url = '';
            if(searchKeyword == ''){
                $(".modal-body").text('请输入关键字');
                $("#loginModal").modal();
                return false;
            }
            switch(Number(searchType))
            {
                case 1:
                    url = 'index.php?purchase-app-index&stype=1&keyword='+searchKeyword;
                    break;
                default:
                    url = 'index.php?company-app-index&stype=2&keyword='+searchKeyword;
            }
            window.location.href = url;
        }
    })

    $('#tosearch').on('click',function(){
        var searchType = $("#searchType").val();
        var searchKeyword = $("#searchKeyword").val();
        var url = '';
        if(searchKeyword == ''){
            $(".modal-body").text('请输入关键字');
            $("#loginModal").modal();
            return false;
        }
        switch(Number(searchType))
        {
            case 1:
                url = 'index.php?purchase-app-index&stype=1&keyword='+searchKeyword;
                break;
            default:
                url = 'index.php?company-app-index&stype=2&keyword='+searchKeyword;
        }
        window.location.href = url;
    })
    $(".phone a").mouseover(function() {
                $(this).css("border-left", "solid 1px #fff");
                $(this).parent("li").css({
                    "background-color": "#fff",
                    "border-right": "solid 1px #ccc",
                    "border-left": "solid 1px #ccc"
                });
                $("#alert_phone").show();
            });
            $(".phone a").mouseout(function() {
                $(this).css({
                    "border-left": "solid 1px #ccc"
                });
                $(this).parent("li").css({
                    "background-color": "#ebebeb",
                    "border": "0px",
                    "border-right": "solid 1px #ebebeb",
                    "border-left": "solid 1px #ebebeb"
                });
                $("#alert_phone").hide();
            });
</script>