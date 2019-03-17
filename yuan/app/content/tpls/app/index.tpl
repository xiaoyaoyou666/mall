<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/index.css" />
    <script src="app/core/styles/js/plugin.js"></script>
    <style>
        .why-footer {
            background-color: #ddd;
            width: 100%;
            padding: 10px 0;
            color: #323232;
        }
        .bg_c1 {
            background-color: #bbb;
        }
        .why-footer .foot-yq{
            width:100%;
        }
        .why-footer .foot-yq a {
            margin: 0px 40px;
            line-height: 30px;
            color:#323232;
        }
        .why-footer .foot-yq a:hover{
            color:#fff;
        }
        .why-footer .foot-menu img{
            margin-top:20px;
        }
        .why-footer .foot-menu img:nth-child(2){
            margin:20px 140px 0 140px;
        }
         #cnzz_stat_icon_1273787615{
            float: left;
            margin-top:-28px;
        }
    </style>
</head>

<body>
<header>
    <div class="container">
        <div class="col-xs-12 header_top">
            {x2;if:$_user['userid']}
                {x2;if:$_user['company_name']}
                    <p><a href="index.php?user-company" style="border-left:0px;color:##ff8a00;">{x2;$_user['company_name']}</a>欢迎您！</p>
                {x2;else}
                    <p><a href="index.php?user-company" style="border-left:0px;color:#ff8a00;">{x2;$_user['username']}</a>欢迎您！</p>
                {x2;endif}

            {x2;else}
                欢迎访问天润新能阳光易购电子商务平台
            {x2;endif}
            <ul class="full_right">
                {x2;if:$_user['userid']}
                <li class="msg_hover" ><a href="index.php?user-company-message-message" style="border-left:0px;padding:0px;"><img src="app/core/styles/images/index/msg2.png"><span style="color: #ff0000;padding-left:5px;" >{x2;$msgnum}</span></a></li>
                <li ><a  href="index.php?user-company" style="padding-left:15px;">企业中心</a></li>
                <li><a href="index.php?user-company">{x2;$_user['username']}</a></li>
                <li><a class="ajax" href="index.php?user-app-logout">退出登录</a></li>
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
                <!-- <li><a href="">首页</a></li> -->
                <li><a href="index.php?item">网格超市</a></li>
                <li><a href="index.php?company-app-index">供应商展示</a></li>
                <li><a href="index.php?purchase">采购寻源</a></li>
                <!-- <li><a href="index.php?company-app-index">供应商展示</a></li> -->
                <!-- <li><a href="index.php?item">网格超市</a></li> -->
                <li><a target="_blank" href="http://zhaobiao.tgcw.net.cn/cms/index.htm">招投标</a></li>
                <!-- <li><a href="index.php?content-app-content-wait">增值服务</a></li> -->
            </ul>
            <p class="full_right" style="margin-top:-5px;">
                <select id="searchType">
                    <option value="1">采购信息</option>
                    <option value="2">供应商</option>
                </select>
                <input type="text" class="input_tx" id="searchKeyword" value="" placeholder="请输入关键词"><span class="input_span" id="tosearch"></span>
            </p>

        </div>
    </div>
</header>
<div id="content">
    <div id="myCarousel" class="carousel slide col-xs-12">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators" >
            <?php $a=0?>
            {x2;tree:$bannerarr['data'],content1,cid}
            <li data-target="#myCarousel" data-slide-to="<?php echo $a;?>" {x2;if:v:cid == '1'} class="active"{x2;endif}></li>
            <?php $a++?>
            {x2;endtree}
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
           {x2;tree:$bannerarr['data'],content1,cid}
                {x2;if:v:content1['contentlink']}
                    <div class="item {x2;if:v:cid == '1'}active{x2;endif}">
                        <a href="{x2;v:content1['contentlink']}"><img src="{x2;v:content1['contentthumb']}"></a>
                    </div>
                {x2;else}
                    <div class="item {x2;if:v:cid == '1'}active{x2;endif}">
                        <img src="{x2;v:content1['contentthumb']}">
                        {x2;if:v:cid == '2'}
                        <a href="/采买方操作手册.docx" download="/采买方操作手册.docx" style="display:block;position:absolute;top:100px;width:50%;height:120px;"></a>
                        <a href="/培训手册.pptx" download="/培训手册.pptx" style="display:block;position:absolute;top:250px;width:50%;height:120px;"></a>
                        {x2;endif}
                    </div>
                {x2;endif}


            {x2;endtree}

          
         <!-- <div class="item active">
               <img src="app/core/styles/images/banner/banner1.png" alt="First slide">
           </div>
           <div class="item">
               <a href="index.php?user-app-register"><img src="app/core/styles/images/banner/banner2.png" alt="Second slide"></a>
           </div>
           <div class="item">
               <img src="app/core/styles/images/banner/banner3.png" alt="Third slide">
           </div>
           <div class="item">
               <img src="app/core/styles/images/banner/banner4.png" alt="Third slide">
           </div> -->
        </div>
        <!-- 轮播（Carousel）导航 -->

    </div>
    <div id="content_title">
        <div class="container">
            <ul class="row">
                <li class="col-md-3 col-xs-6">
                    <p><img src="app/core/styles/images/index/ruzhu.png"></p>
                    <p>
                        <span class="full_num">{x2;$zuser}</span>
                        <span class="full_name">累计入驻商家</span>
                    </p>
                </li>
                <li class="col-md-3 col-xs-6">
                    <p><img src="app/core/styles/images/index/xinzeng.png"></p>
                    <p>
                        <span class="full_num">{x2;$ztodayUser}</span>
                        <span class="full_name">今日新增商家（个）</span>
                    </p>
                </li>
                <li class="col-md-3 col-xs-6">
                    <p><img src="app/core/styles/images/index/caigou.png"></p>
                    <p>
                        <span class="full_num">{x2;$zpurchase}</span>
                        <span class="full_name">采购需求（条）</span>
                    </p>
                </li>
                <li class="col-md-3 col-xs-6">
                    <p><img src="app/core/styles/images/index/chengjiao.png"></p>
                    <p>
                        <span class="full_num">{x2;$zcount}</span>
                        <span class="full_name">成交金额（万）</span>
                    </p>
                </li>
            </ul>

        </div>
    </div>
    <div style="clear: both;"></div>
</div>
<div class="container border_sw" id="content_center">
    <div class="row">
        <div class="col-md-6 pad-right">
            <p class="head_title">
                <img src="app/core/styles/images/index/采购信息icon.png"><span>采购信息</span>
                <a href="index.php?purchase"  class="full_right"><img src="app/core/styles/images/index/MORE1.png" ></a>
            </p>
            <div class="center_center bor_sw2">
                <ul>
                    {x2;tree:$purchase['data'],aa,cid}
                        <li>
                            <a href="index.php?purchase-app-content&purchaseid={x2;v:aa['purchaseid']}">
                                {x2;substring:v:aa['purchasetitle'],80}
                            </a>
                            <span class="full_right">[{x2;date:v:aa['purchaseinputtime'],'Y-m-d'}]</span></li>
                    {x2;endtree}
                </ul>
            </div>
        </div>
        <div class="col-md-6 pad_ing pad-left">
            <p class="head_title">
                <img src="app/core/styles/images/index/招标信息icon.png"><span>招标信息</span>
                <a target="_blank" href="http://58.247.46.125:9600/cms/index.htm" class="full_right"><img src="app/core/styles/images/index/MORE1.png"  ></a>
            </p>
            <div class="center_center bor_sw2">
                <ul>
                    <li><a target="_blank" href="http://58.247.46.125:9600/cms/index.htm">{x2;substring:'北票涌泉二期风电项目35kV集电线路工程招标公告',80}</a><span class="full_right">[2015-05-22]</span></li>
                    <li><a target="_blank" href="http://58.247.46.125:9600/cms/index.htm">{x2;substring:'宁夏电投太阳山风电场100MW项目（五六期）塔架采购项目招标公告 关键词： 100mw 塔架',80}</a><span class="full_right">[2015-05-22]</span></li>
                    <li><a target="_blank" href="http://58.247.46.125:9600/cms/index.htm">{x2;substring:'龙源贵州风力发电有限公司风电场标志牌制作招标公告',80}</a><span class="full_right">[2015-05-22]</span></li>
                    <li><a target="_blank" href="http://58.247.46.125:9600/cms/index.htm">{x2;substring:'华润新能源叶县朝阳38MW风电项目35kV集电线路塔材采购招标公告[变更公告]',80}</a><span class="full_right">[2015-05-22]</span></li>
                    <li><a target="_blank" href="http://58.247.46.125:9600/cms/index.htm">{x2;substring:'河南汝州后坡50MW风电PC项目升压站建筑安装、风机基础、集电线路工程采购预告招标公告',80}</a><span class="full_right">[2015-05-22]</span></li>
                    <li><a target="_blank" href="http://58.247.46.125:9600/cms/index.htm">{x2;substring:'乌拉特中旗新忽热10MW风电场项目采购项目招标公告',80}</a><span class="full_right">[2015-05-22]</span></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container" id="content_foot" style="height:200px;margin-left:-20px;padding-left:0px;padding-right:0px;">
        <div style="text-align: center;margin-bottom:40px;">
            <img src="app/core/styles/images/index/title1.png" style="margin-bottom:40px;margin-top:30px;"><br>
            <img src="app/core/styles/images/index/title2.png">
        </div>
        <div class="row" style="margin-bottom:22px;">
            <div class="col-md-6 col-xs-12 pad-right">
                <div class="center_center">
                    <div class="foot_center_back border_sw">
                        <p class="head_img head_img1"><a href="index.php?company-app-index&cat=设备商" class="full_right more"><img src="app/core/styles/images/index/MORE.png"></a></p>
                        <div class="row" style="padding:20px;">
                            {x2;tree:$shebei['data'],vv,cid}
                                <div class="col-md-6 foot_img pad-rl">
                                    <a href="index.php?company-app-company-index&companyid={x2;v:vv['userid']}" class="foot_img_border">
                                        <p><img src="{x2;if:v:vv['company_logo_da']}{x2;v:vv['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}"></p>
                                        <p class="text-foot">{x2;substring:v:vv['company_name'],36}</p>
                                    </a>
                                </div>
                            {x2;endtree}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xs-12 pad-left">
                <div class="center_center">
                    <div class="foot_center_back border_sw">
                        <p class="head_img head_img2"><a href="index.php?company-app-index&cat=材料商" class="full_right more"><img src="app/core/styles/images/index/MORE.png"></a></p>
                        <div class="row" style="padding:20px;">
                            {x2;tree:$cailiao['data'],vvv,cid}
                            <div class="col-md-6 foot_img pad-rl">
                                <a href="index.php?company-app-company-index&companyid={x2;v:vvv['userid']}" class="foot_img_border">
                                    <p><img src="{x2;if:v:vvv['company_logo_da']}{x2;v:vvv['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}"></p>
                                    <p class="text-foot">{x2;substring:v:vvv['company_name'],36}</p>
                                </a>
                            </div>
                            {x2;endtree}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-xs-12 pad-right">
                <div class="center_center">
                    <div class="foot_center_back border_sw">
                        <p class="head_img head_img3"><a href="index.php?company-app-index&cat=施工商" class="full_right more"><img src="app/core/styles/images/index/MORE.png"></a></p>
                        <div class="row" style="padding:20px;">
                            {x2;tree:$shigong['data'],vvvv,cid}
                                <div class="col-md-6 foot_img pad-rl">
                                    <a href="index.php?company-app-company-index&companyid={x2;v:vvvv['userid']}" class="foot_img_border">
                                        <p><img src="{x2;if:v:vvvv['company_logo_da']}{x2;v:vvvv['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}"></p>
                                        <p class="text-foot">{x2;substring:v:vvvv['company_name'],36}</p>
                                    </a>
                                </div>
                            {x2;endtree}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xs-12 pad-left">
                <div class="center_center">
                    <div class="foot_center_back border_sw">
                        <p class="head_img head_img4"><a href="index.php?company-app-index&cat=服务商" class="full_right more"><img src="app/core/styles/images/index/MORE.png"></a></p>
                        <div class="row" style="padding:20px;">
                            {x2;tree:$fuwu['data'],vvvvv,cid}
                            <div class="col-md-6 foot_img pad-rl">
                                <a href="index.php?company-app-company-index&companyid={x2;v:vvvvv['userid']}" class="foot_img_border">
                                    <p><img src="{x2;if:v:vvvvv['company_logo_da']}{x2;v:vvvvv['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}"></p>
                                    <p class="text-foot">{x2;substring:v:vvvvv['company_name'],36}</p>
                                </a>
                            </div>
                            {x2;endtree}
                        </div>

                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"></div>
<footer style="margin-top: 75px;">
    <div class="why-footer bg_c1">
        <div class="container">
            <div class="foot-menu">
                友情链接
            </div>
            <div class="foot-yq pull-left">
                {x2;tree:$links['data'],link,lid}
                    <a target="_blank" href="{x2;v:link['url']}" title="" onclick="changeTableVal('{x2;v:link[linkid]}')">{x2;v:link['name']}</a>|
                {x2;endtree}

            </div>
        </div>
    </div>
    <div class="why-footer">
        <div class="container">
            <div class="foot-menu text-center">
                <img src="app/core/styles/images/qyhy/foot_aboutus.png">
                <img src="app/core/styles/images/qyhy/foot_email.png">
                <img src="app/core/styles/images/qyhy/foot_phone.png">
            </div>
        </div>
    </div>
    <div class="why-footer">
        <div class="container">
            <div class="foot-menu text-center" style="color: #888;">
                版权所有：北京天润新能投资有限公司 京ICP备09014811号 京公网安备11010502024904
            </div>
        </div>
    </div>
</footer>

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

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1273787615'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s13.cnzz.com/z_stat.php%3Fid%3D1273787615%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
</script>
<script>
     //-------------点击量增加-------------
    function changeTableVal(id_value)
    {
                                                       
        $.ajax({
            url:'index.php?content-app-index-updateStatus&id_value='+id_value,
            dataType:'JSON',        
            success: function(data){
                if(data.statusCode == 200){
                    $(obj).attr('src',src);
                    return false;
                }else{
                    alert('失败了');
                }                                   
                          
            }
        });     
    }


 $('#myCarousel').carousel({
            interval: 2000
        });
        $("#myCarousel .item:first-child").addClass("active");
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
    $(".msg_hover").hover(function(){

         $(this).find("img").attr("src","app/core/styles/images/index/msg1.png")
     },function(){
         $(this).find("img").attr("src","app/core/styles/images/index/msg2.png")
     })


</script>
</body>

</html>