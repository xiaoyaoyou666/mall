<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>天工e购</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/datetimepicker.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/peskin.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/why.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/hln.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/zmm.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/wgmarket-index.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/style.css"/>
    <style type="text/css">
        body {
            width: 100% !important;
        }

        .img-body div:first-child {
            height: 495px;
        }

        .tab-body .content-nav ul {
            margin-bottom: 0 !important;
            height: 630px;
        }

        .tab-body .content-nav ul > li > .desc > .bottom {
            width: 100%;
        }

        .tab-body .content-nav ul > li > .desc > .bottom > div.fl:first-child {
            width: 15%;
        }

        .tab-body .content-nav ul > li > .desc > .bottom > div.fl:last-child {
            width: 85%;
        }

        .tab-body .content-nav ul > li > .desc > .bottom > div.fl:last-child > a {
            width: 100%;
        }

        .menu-notice .login-register-btn a {
            background: #fff;
            border: #fff;
            margin-right: 15px;
            margin-left: 15px;
            margin-top: 10px;
        }

        #carous {
            position: relative;
            clear: both;
            height: auto;
            padding: 0px;
            height: 430px;
            min-width: 1200px;
        }

        .carousel-inner > div {
            width: 100%;
            overflow: hidden;
        }
        .carousel-inner > .item{
            height:430px;
        }
        .img-responsive,
        .thumbnail > img,
        .thumbnail a > img,
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            display: block;

            height: 430px;
            position: relative;
            left: 50%;
            transform: translate(-50%);
            -ms-transform: translate(-50%);
        }

        .menu .menu-type > ul > li {
            background: rgba(0, 0, 0, 0.3) !important;
            border-bottom-color: rgba(255, 255, 255, 0.3) !important;
        }

        .menu .menu-type > ul {
            height: 378px;
            background: rgba(0, 0, 0, 0.3) !important;
        }

        .menu-type .popmenu {
            background: rgba(235, 235, 235, 0.9);
            color: #000;
        }

        .popmenu div.twomenu > span > a,
        .popmenu div.twomenu > span > a:visited {
            color: #000;
        }

        .popmenu div.twomenu > div > span > a,
        .popmenu div.twomenu > div > span > a:visited {
            color: #000;
        }

        .popmenu div.twomenu > div > span > a:hover {
            color: #009944;
        }

        .zmm-zx-centent .menu .menu-notice .bottom {
            background: rgba(0, 0, 0, 0.4);
            border: 0px;
        }

        .zmm-zx-centent .menu .menu-notice .bottom .content > ul > li {
            color: #fff;
            font-size: 13px;
            line-height: 26px;
        }

        .alltypes {
            background: rgba(0, 0, 0, 0.66) !important;
            border-color: rgba(255, 255, 255, 0.5);
        }

        .zmm-zx-centent {
            background: #fff;
        }

        .menu .menu-type > ul > li.active {
            background: rgba(0, 0, 0, 0.6) !important;
            color: #fff !important;
        }

        .menu .menu-type > ul > li.active > a,
        .menu .menu-type > ul > li.active > a:visited {
            color: #fff !important;
            text-decoration: none !important;
        }

        .wel_content {
            width: 228px;
            height: 168px;
            background: rgba(0, 0, 0, 0.4) !important;
            background-size: 100%;
            padding-top: 10px;
        }

        .body {
            height: 665px;
        }

        #menu_fors {
            position: absolute;
            top: 0px;
            margin-top: 10px;
            left: 50%;
            margin-left: 370px;
        }

        .nav li {
            float: left;
            height: 40px;
            cursor: pointer;
            color: #ddd;
        }

        li.active {
            border-bottom: solid 4px #fff;
            color: #fff;
        }

        .list_lh li a:hover {
            color: #009944 !important;
        }

        .list_lh li a {
            font-size: 13px;
        }

        img.bq {
            display: none;
        }

        .t_b img.bq {
            display: block;
            width: 57px !important;
            height: auto !important;
            position: absolute;
            top: -5px;
            right: -6px;
            /*background: url() no-repeat right top;
            background-size: 57px;
             color: #0000FF;*/
        }

        .content-nav ul li {
            position: relative;
            margin-top: 4px;
        }

        .content a {
            font-size: 13px;
        }

        #receive-inquiry-modal .modal-footer {
            padding: 30px 0;
        }
        #receive-inquiry-modal .modal-dialog{
            width: 398px;
            margin-top: 160px;
        }
        @media (min-width: 1909px) {
            #receive-inquiry-modal .modal-dialog{
                margin-top: 240px;
            }
        }
        #menu-div .alltypes .iconfont{
            font-size: 17px;
            margin-right: 8px;
        }
        #menu-type-ul .iconfont{
            font-size: 18px;
            margin-right: 5px;
        }
        #menu-type-ul .iconfont.green{
            color: #009944;
        }

    </style>
</head>

<body>
{x2;include:nav}
<div class="zmm-zx-centent">
    <div id="carous" style="position:relative;">
        <div id="myCarousel" class="carousel slide">
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner">
                {x2;tree:$bannerarr['data'],content1,cid} {x2;if:v:content1['contentlink']}
                <div class="item">
                    <a href="{x2;v:content1['contentlink']}"><img src="{x2;v:content1['contentthumb']}"></a>
                </div>
                {x2;else}
                <!-- <div class="item">
                        <img src="{x2;v:content1['contentthumb']}">
                    </div> -->

                <div class="item {x2;if:v:cid == '1'}active{x2;endif}">
                    <img src="{x2;v:content1['contentthumb']}"> {x2;if:v:cid == '3'}
                    <a href="app/core/styles/CaoZuoShouCe.docx" download="app/core/styles/CaoZuoShouCe.docx"
                       style="display:block;position:absolute;top:100px;width:50%;height:120px;"></a>
                    <a href="app/core/styles/PeiXunShouCe.pptx" download="app/core/styles/PeiXunShouCe.pptx"
                       style="display:block;position:absolute;top:250px;width:50%;height:120px;"></a>
                    {x2;endif}
                </div>
                {x2;endif} {x2;endtree}

            </div>
            <!-- 轮播（Carousel）导航 -->

        </div>
        <div class="menu" style="background:transparent;position:absolute;top:0px;left:50%;margin-left:-600px;">
            <div id="menu-div" class="menu-type fl">

                <div class="alltypes" style="padding-left:20px;"><em class="iconfont">&#xe63c;</em>全部商品分类


                </div>
                <ul id="menu-type-ul" style="width:240px;">
                    {x2;tree:$cate,cd,cid}
                    <li class="text-left">
                        {x2;if:v:cid == '1'}

                        <em class="iconfont">&#xe625;</em>
                        <em class="iconfont green hide">&#xe625;</em>
                        <!--<img src="app/core/styles/images/market/biaopin-icon-white.png" alt=""/>-->
                        <!--<img src="app/core/styles/images/market/biaopin-icon-green.png" alt=""-->
                             <!--class="hide"/> -->
                        {x2;elseif:v:cid == '2'}
                        <em class="iconfont">&#xe61b;</em>
                        <em class="iconfont green hide">&#xe61b;</em>
                        <!--<img src="app/core/styles/images/market/shebei-icon-white.png" alt=""/>-->
                        <!--<img src="app/core/styles/images/market/shebei-icon-green.png" alt=""class="hide"/>-->
                        {x2;elseif:v:cid == '3'}
                        <em class="iconfont">&#xe620;</em>
                        <em class="iconfont green hide">&#xe620;</em>
                        <!--<img src="app/core/styles/images/market/menu2.png" alt=""/>-->
                        <!--<img src="app/core/styles/images/market/cailiao-icon-green.png" alt="" class="hide"/>-->
                        {x2;elseif:v:cid == '4'}
                        <em class="iconfont">&#xe623;</em>
                        <em class="iconfont green hide">&#xe623;</em>
                        <!--<img src="app/core/styles/images/market/shigong-icon-white.png" alt=""/>-->
                        <!--<img src="app/core/styles/images/market/shigong-icon-green.png" alt="" class="hide"/>-->
                        {x2;elseif:v:cid == '5'}
                        <em class="iconfont">&#xe624;</em>
                        <em class="iconfont green hide">&#xe624;</em>
                        <!--<img src="app/core/styles/images/market/menu2.png" alt=""/>-->
                        <!--<img src="app/core/styles/images/market/cailiao-icon-green.png" alt="" class="hide"/>-->
                        {x2;elseif:v:cid == '6'}
                        <em class="iconfont">&#xe622;</em>
                        <em class="iconfont green hide">&#xe622;</em>
                        <!--<img src="app/core/styles/images/market/shigong-icon-white.png" alt=""/>-->
                        <!--<img src="app/core/styles/images/market/shigong-icon-green.png" alt="" class="hide"/>-->
                        {x2;elseif:v:cid == '7'}
                        <em class="iconfont">&#xe61c;</em>
                        <em class="iconfont green hide">&#xe61c;</em>
                        <!--<img src="app/core/styles/images/market/menu2.png" alt=""/>-->
                        <!--<img src="app/core/styles/images/market/cailiao-icon-green.png" alt="" class="hide"/>-->
                        {x2;elseif:v:cid == '8'}
                        <em class="iconfont">&#xe61d;</em>
                        <em class="iconfont green hide">&#xe61d;</em>
                        <!--<img src="app/core/styles/images/market/shigong-icon-white.png" alt=""/>-->
                        <!--<img src="app/core/styles/images/market/shigong-icon-green.png" alt="" class="hide"/>-->
                        {x2;elseif:v:cid == '9'}
                        <em class="iconfont">&#xe65c;</em>
                        <em class="iconfont green hide">&#xe65c;</em>
                        <!--<img src="app/core/styles/images/market/menu2.png" alt=""/>-->
                        <!--<img src="app/core/styles/images/market/cailiao-icon-green.png" alt="" class="hide"/>-->
                        {x2;else}


                        <img src="app/core/styles/images/market/menu3.png" alt=""/>
                        <img src="app/core/styles/images/market/fuwu-icon-green.png" alt="" class="hide"/>
                        {x2;endif}
                        <a href="index.php?item-app-category&catid={x2;v:cd['catid']}">{x2;v:cd['catname']}</a>
                        <a href="index.php?item-app-category&catid={x2;v:cd['catid']}"></a>
                    </li>
                    {x2;endtree}
                </ul>
                <div id="popdiv" class="popmenu hide">
                    <div id="div0" style="display: block">
                        {x2;tree:$cate[0]['subcat'],cd0,cid0}
                        <div class="twomenu clearfix">
                            <span style="width:20% "><a
                                    href="index.php?item-app-category&catid={x2;v:cd0['catid']}">{x2;v:cd0['catname']}
                                    >> </a></span>
                            <div style="width:80%;">
                                {x2;tree:v:cd0['subcat'],cd01,cid01}
                                <span><a href="index.php?item-app-category&catid={x2;v:cd01['catid']}">{x2;v:cd01['catname']}</a></span>
                                {x2;endtree}
                            </div>
                        </div>
                        {x2;endtree}
                    </div>
                    <div id="div1">
                        {x2;tree:$cate[1]['subcat'],cd1,cid1}
                        <div class="twomenu clearfix">
                            <span style="width: 20%"><a
                                    href="index.php?item-app-category&catid={x2;v:cd1['catid']}">{x2;v:cd1['catname']}
                                    >> </a></span>
                            <div style="width: 80%">
                                {x2;tree:v:cd1['subcat'],cd11,cid11}
                                <span><a href="index.php?item-app-category&catid={x2;v:cd11['catid']}">{x2;v:cd11['catname']}</a></span>
                                {x2;endtree}
                            </div>
                        </div>
                        {x2;endtree}
                    </div>
                    <div id="div2">
                        {x2;tree:$cate[2]['subcat'],cd2,cid2}
                        <div class="twomenu clearfix">


                            <span style="width: 20%"><a href="index.php?item-app-category&catid={x2;v:cd2['catid']}">{x2;v:cd2['catname']}
                                    >> </a></span> {x2;if:v:cd2['subcat']}
                            <div style="width: 80%">


                                {x2;tree:v:cd2['subcat'],cd21,cid21}
                                <span><a href="index.php?item-app-category&catid={x2;v:cd21['catid']}">{x2;v:cd21['catname']}</a></span>
                                {x2;endtree}
                            </div>
                            {x2;endif}
                        </div>
                        {x2;endtree}
                    </div>
                    <div id="div3">
                        {x2;tree:$cate[3]['subcat'],cd3,cid3}
                        <div class="twomenu clearfix">


                            <span style="width: 20%"><a href="index.php?item-app-category&catid={x2;v:cd3['catid']}">{x2;v:cd3['catname']}
                                    >> </a></span> {x2;if:v:cd3['subcat']}
                            <div style="width: 80%">


                                {x2;tree:v:cd3['subcat'],cd31,cid31}
                                <span><a href="index.php?item-app-category&catid={x2;v:cd31['catid']}">{x2;v:cd31['catname']}</a></span>
                                {x2;endtree}
                            </div>
                            {x2;endif}
                        </div>
                        {x2;endtree}
                    </div>
                    <div id="div4">
                        {x2;tree:$cate[4]['subcat'],cd4,cid4}


                        <div class="twomenu clearfix">
                            <span style="width: 20%"><a href="index.php?item-app-category&catid={x2;v:cd4[ 'catid']} ">{x2;v:cd4['catname']}
                                    >> </a></span>


                            {x2;if:v:cd4['subcat']}
                            <div style="width: 80%">
                                {x2;tree:v:cd4['subcat'],cd41,cid41}
                                <span><a href="index.php?item-app-category&catid={x2;v:cd41[ 'catid']} ">{x2;v:cd41['catname']}</a></span>
                                {x2;endtree}
                            </div>
                            {x2;endif}
                        </div>
                        {x2;endtree}
                    </div>
                    <div id="div5">
                        {x2;tree:$cate[5]['subcat'],cd5,cid5}


                        <div class="twomenu clearfix">
                            <span style="width: 20%"><a href="index.php?item-app-category&catid={x2;v:cd5[ 'catid']} ">{x2;v:cd5['catname']}
                                    >> </a></span>


                            {x2;if:v:cd5['subcat']}
                            <div style="width: 80%">
                                {x2;tree:v:cd5['subcat'],cd51,cid51}
                                <span><a href="index.php?item-app-category&catid={x2;v:cd51[ 'catid']} ">{x2;v:cd51['catname']}</a></span>
                                {x2;endtree}
                            </div>
                            {x2;endif}
                        </div>
                        {x2;endtree}
                    </div>
                    <div id="div6">
                        {x2;tree:$cate[6]['subcat'],cd6,cid6}


                        <div class="twomenu clearfix">
                            <span style="width: 20%"><a style="" href="index.php?item-app-category&catid={x2;v:cd6[ 'catid']} ">{x2;v:cd6['catname']}
                                    >> </a></span>


                            {x2;if:v:cd6['subcat']}
                            <div style="width:80%;">
                                {x2;tree:v:cd6['subcat'],cd61,cid61}
                                <span style="padding-right:14px"><a href="index.php?item-app-category&catid={x2;v:cd61[ 'catid']} ">{x2;v:cd61['catname']}</a></span>
                                {x2;endtree}
                            </div>
                            {x2;endif}
                        </div>
                        {x2;endtree}
                    </div>
                    <div id="div7">
                        {x2;tree:$cate[7]['subcat'],cd7,cid7}


                        <div class="twomenu clearfix">
                            <span style="width:20%"><a href="index.php?item-app-category&catid={x2;v:cd7[ 'catid']} ">{x2;v:cd7['catname']}
                                    >> </a></span>


                            {x2;if:v:cd7['subcat']}
                            <div style="width:80%;">
                                {x2;tree:v:cd7['subcat'],cd71,cid71}
                                <span style="padding-right:14px"><a href="index.php?item-app-category&catid={x2;v:cd71[ 'catid']} ">{x2;v:cd71['catname']}</a></span>
                                {x2;endtree}
                            </div>
                            {x2;endif}
                        </div>
                        {x2;endtree}
                    </div>
                </div>
            </div>
        </div>
        <div class="menu-notice fr" id="menu_fors" style="">
            <div class="top text-center">
                <div class="wel_content">
                    {x2;if:$_user['userid']}
                    {x2;if:$_user['company_logo']}
                    <div class="bj-img " style="line-height:0;overflow:hidden; ">
                        <img style="width:auto!important;height:100%;position:relative;left:50%;transform: translate(-50%);"
                             src="{x2;$_user[ 'company_logo']} " class="wel_img ">
                    </div>
                    {x2;else}
                    <div class="bj-img">
                        <img src="app/core/styles/images/home-login-img.png " class="wel_img ">
                    </div>
                    {x2;endif}
                    <p style="font-size:14px;color:#fff;">欢迎来到天工e购超市!</p>
                    {x2;endif}
                    <div class="btn login-register-btn text-center" style="width: 100%;">
                        {x2;if:$_user['userid']}
                        <a href="{x2;if:$role==0}index.php?user-company{x2;elseif:$role==3}index.php?user-company-index-evaluate_list{x2;elseif:$role==4}index.php?user-company-purchases-inquiry{x2;else}index.php?user-company-index-suplier_list{x2;endif}" class="wel_a" style="margin-top:0px!important;">企业中心</a>
                        {x2;else}
                        <div class="bj-img">
                            <img src="app/core/styles/images/home-login-img.png" class="wel_img">
                        </div>
                        <p style="font-size:14px;color:#fff; ">欢迎来到天工e购超市!</p>
                        <a class="lrbtn text-green fl " href="index.php?user-app-login&t=2 ">登&nbsp;&nbsp;录</a>
                        <a class="lrbtn text-green fr " href="index.php?user-app-register ">注&nbsp;&nbsp;册</a>
                        {x2;endif}
                        <div class="clearfix"></div>
                    </div>
                </div>

                <div class="bottom"
                     style="height:232px;background:rgba(0,0,0,0.4);text-align:left;color:#fff;margin-top:10px; ">
                    <div class="head" style="height:34px;">
                        <ul class="nav" id="tab_n"
                            style="border-bottom:solid 1px rgba(255,255,255,0.2);padding-left:14px;height:40px;line-height:40px;">
                            <li class="active" style="margin-right:10px;"><span>公告</span></li>
                            <li><span>消息</span></li>
                        </ul>
                    </div>
                    <div class="tab-content" style="margin-top:16px;" id="gd">
                        <!--<div class=" list_lh" id="gonggao-content" style="padding-left:14px;">
                            <ul id="express">

                            </ul>
                        </div>-->
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>

    </div>

    <div class="container">
        <div class="row">
            <div class="content col-sm-12">
                <div class="head clearfix"
                     style=" margin-top: 10px;margin-bottom: 8px;font-size: 24px;color:#373737;padding-left: 0px;letter-spacing: 1px;">
                    {x2;if:$agreementarrinfos}
                    协议商品{x2;else}风机类设备及材料{x2;endif}<span><a
                        href="index.php?item-app-category&catid=125{x2;if:$agreementarrinfos}&agreement=2{x2;endif}"><img
                        src="app/core/styles/images/index/MORE1.png"> </a></span></div>
                <div class="body clearfix">
                    <div class="img-body fl">
                        <div style="height:460px;position: relative;background: url(app/core/styles/images/market/biaopin1.png) no-repeat;background-size:100%">

									<span style="margin:0 auto;line-height:36px;text-align:center;display:block;width:30px;color:#fff;font-size:28px;position:absolute;left:50%;top:50%;margin-top:-50%;margin-left:-15px;">
                    	<span style="position: absolute;left:-50px;top:-20px;font-weight:bold;">「</span> {x2;if:$agreementarrinfos}
                                        协议商品{x2;else}风机类设备及材料{x2;endif}
                                        <span style="position: absolute;right:-50px;bottom:-20px;font-weight: bold;">」</span>
									</span>
                        </div>
                        <div><img src="app/core/styles/images/market/biaopin-left-pic2.png"/></div>
                    </div>
                    <div class="tab-body fl">
                        <!--<div class="tab-div clearfix">
                <div class="tab-nav fl">
                    <ul id="biaopinUL" class="tab-nav-ul">
                        <li class="active" no="0">风机配件</li>
                        <li no="1">非风机配件</li>
                    </ul>
                </div>
                <div class="jiantou fr"><a><div class="yellow-jiantou"></div></a></div>
            </div>-->
                        <div class="content-nav" style="border-top:solid 2px #009944">
                            {x2;if:$biaopin['data']}
                            <ul id="biaopin-tab-ul0">
                                {x2;tree:$biaopin[data],biaopin1,pid}
                                <li class="t_b">
                                    {x2;if:$agreementarrinfos}
                                    <img src="app/core/styles/img/tb.png" class="bq">
                                    {x2;endif}
                                    <a href="index.php?item-app-item&goodsid={x2;v:biaopin1['goodsid']}&agreementid={x2;v:biaopin1['agreementid']}&p={x2;v:biaopin1['goodsminprice']}"
                                    ><img src="{x2;v:biaopin1['goodsthumb']}"/></a>
                                    <div class="desc">
                                        <div class="top">
                                            <div class="top1 clearfix">
                                                <div class="fl">
                                                    {x2;if:$islogin == 0}
                                                    <a style="color: #f32828" href="javascript:;" class="modify"
                                                       msg="如果您想知道商品价格，请先登录">立即询价</a> {x2;else}
                                                    {x2;if:v:biaopin1['goodsminprice'] > 0}
                                                    ￥{x2;v:biaopin1['goodsminprice']}
                                                    {x2;elseif:v:biaopin1['goodsmaxprice'] > 0}
                                                    ￥{x2;v:biaopin1['goodsmaxprice']}
                                                    {x2;else}
                                                    <a style="color: #f32828"
                                                       href="index.php?item-app-item&goodsid={x2;v:biaopin1['goodsid']}"
                                                    >立即询价</a> {x2;endif} {x2;endif}

                                                </div>
                                                <div class="fr"><span>{x2;v:biaopin1['goodspv']}</span>人看过</div>
                                            </div>
                                            <div class="top2"><a
                                                    href="index.php?item-app-item&goodsid={x2;v:biaopin1['goodsid']}">{x2;v:biaopin1['goodstitle']}</a>
                                            </div>
                                        </div>
                                        <div class="bottom clearfix">
                                            <div class="fl"><img src="app/core/styles/images/market/sj-icon.png"/></div>
                                            <div class="fl"><a
                                                    href="index.php?item-app-company&companyid={x2;v:biaopin1['goodsuserid']}">
                                                {x2;v:biaopin1['company_name']}


                                            </a></div>
                                        </div>
                                    </div>
                                </li>
                                {x2;endtree}
                            </ul>
                            {x2;endif}

                            <ul id="biaopin-tab-ul1" class="hide">
                                {x2;tree:$biaopin[2][data],biaopin2,pid}
                                <li>
                                    <a href="index.php?item-app-item&goodsid={x2;v:biaopin2['goodsid']}"
                                    ><img src="{x2;v:biaopin2['goodsthumb']}"/></a>
                                    <div class="desc">
                                        <div class="top">
                                            <div class="top1 clearfix">
                                                <div class="fl">
                                                    {x2;if:v:biaopin2['goodsminprice'] > 0}
                                                    ￥{x2;v:biaopin2['goodsminprice']}
                                                    {x2;elseif:v:biaopin2['goodsmaxprice'] > 0}
                                                    ￥{x2;v:biaopin2['goodsmaxprice']} {x2;else}
                                                    <a style="color: #f32828"
                                                       href="index.php?item-app-item&goodsid={x2;v:biaopin2['goodsid']}"
                                                    >立即询价</a> {x2;endif}
                                                </div>
                                                <div class="fr"><span>{x2;v:biaopin2['goodspv']}</span>人看过</div>
                                            </div>
                                            <div class="top2"><a
                                                    href="index.php?item-app-item&goodsid={x2;v:biaopin2['goodsid']}">{x2;v:biaopin2['goodstitle']}</a>
                                            </div>
                                        </div>
                                        <div class="bottom clearfix">
                                            <div class="fl"><img src="app/core/styles/images/market/sj-icon.png"/></div>
                                            <div class="fl"><a
                                                    href="index.php?item-app-company&companyid={x2;v:biaopin2['goodsuserid']}">{x2;v:biaopin2['company_name']}</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                {x2;endtree}
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="myModal" style="border-radius:0 !important;">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <div class="xunjia-title text-center">立即询价</div>
                        </div>
                        <form id="form" method="get" action="">
                            <div class="modal-body">
                                <div class="text-center">
                                    <div class="com-name">显示询价企业的名称</div>
                                    <div class="liuyan-content">
                                        <div class="record clearfix form_control">
                                            <div class="fl text-right">&nbsp;&nbsp;&nbsp;<span>*</span>联系人：</div>
                                            <input name="name" class="fl text-left required" type="text"
                                                   placeholder="请留下联系人姓名"/>
                                        </div>
                                        <div class="record clearfix form_control">
                                            <div class="fl text-right"><span>*</span>联系电话：</div>
                                            <input name="tel" class="fl text-left required" type="text"
                                                   placeholder="请留下联系电话"/>
                                        </div>
                                        <div class="record clearfix form_control">
                                            <div class="fl text-right"><span>*</span>联系邮箱：</div>
                                            <input name="email" class="fl text-left required" type="email"
                                                   placeholder="请留下联系邮箱" data-tip="请输入您的邮箱"
                                                   data-valid="isNonEmpty||isEmail" data-error="email不能为空||邮箱格式不正确"/>
                                        </div>
                                        <div class="record clearfix form_control">
                                            <div class="fl text-right">询价详情：</div>
                                            <div class="fl"><textarea name="detail" cols="30" rows="3"></textarea></div>
                                        </div>
                                        <div class="record clearfix form_control">
                                            <div class="fl text-right">我的地址：</div>
                                            <div class="fl">
                                                <select name="address" class="prov btn-select" id="prov"></select>
                                                <select class="city btn-select" id="city"></select>
                                                <select class="dist btn-select" id="area"></select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn-green r20"> 发&nbsp;&nbsp;送</button>
                                <button type="button" class="btn-green" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--我收到的询价详情modal-->
<div class="modal fade" id="receive-inquiry-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
                <div style="font-size: 16px">报价提示</div>
            </div>
            <div id="test"></div>
            <div class="modal-body text-center">
                <!--<img style="width: 53px;margin:20px auto;display: block;" src="./app/core/styles/img/question.png">-->
                <div class="modal-icon-box">
                    <em class="iconfont">&#xe60f;</em>
                </div>
                <p style="text-align:center;color: #323232;font-size: 14px;">您有新的报价邀请尚未报价，是否报价？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-primary r20 to-inquiry-btn"> 立即报价
                </button>
                <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 暂不报价</button>
            </div>
        </div>
    </div>
</div>
<!--foot-->
{x2;include:footer2}
<div class="alert-shadow"></div>
<script src="app/core/styles/js/jquery.min.js"></script>
<script src="app/core/styles/js/jquery-ui.min.js"></script>
<script src="app/core/styles/js/bootstrap.min.js"></script>
<script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
<script src="app/core/styles/js/plugin.js"></script>
<script src="app/core/styles/js/scroll.js"></script>
<script type="text/javascript">
    $(function () {
        //轮播
        $('#myCarousel').carousel({
            interval: 2500
        });
        //公告
        var type = 2;
        $("#tab_n").children("li").click(function () {
            $(this).addClass("active");
            $(this).siblings().removeClass("active");
            if ($(this).children("span").text() == "消息") {
                type = 3;
            } else if ($(this).children("span").text() == "公告") {
                type = 2;
            }
            message();

        })

        function message() {
            $.ajax({
                type: "get",
                url: "index.php?core-api-index-getShowMessage&type=" + type,
                dataType: "json",
                success: function (data) {
                    console.log(data.data);
                    $("#gd").empty();
                    if (data.data == "") {
                        $("#gd").append("<div class='list_lh' style='padding-left:14px'><ul style='margin-top:0px'><li>暂无任何消息！</li></ul><div>");
                    } else {
                        $("#gd").append("<div class='list_lh' style='padding-left:14px;'><ul style='margin-top:0px' id='express'></ul><div>");
                        $.each(data.data, function (i, indexs) {
                            $("#express").append("<li><a style='color:#fff' href=" + indexs.msg_url + indexs.msg_id + ">" + indexs.msg_title + "</a></li>");
                        })
                    }
                    $("div.list_lh").myScroll({
                        speed: 60, //数值越大，速度越慢
                        rowHeight: 28 //li的高度
                    });
                }
            })
        }

        message();

        if (window.screen.width < 500) {
            //					$(".container").css("width", "100%");
            $(".menu").css({
                "left": "0",
                "margin-left": "0"
            });
            $("#menu_fors").css({
                "right": "0",
                "left": "initial",
                "margin-left": "0"
            });
        }


        $(".carousel-inner .item:first-child").addClass("active");
        $("#menu-type-ul li").mouseover(function () {
            // li backgroud
            $(this).addClass("active").siblings().removeClass("active");
            // 选中 白底绿图，其他元素设置为 绿底白图
            //img:first 白图，img:last 绿图
            //设置选中的li元素$(this)为绿图（第一个图片隐藏第二个图片显示）
            // $(this).children("img").first().removeClass().addClass("hide");
            // $(this).children("img").last().removeClass().addClass("icon-show");
            //设置未选中的兄弟li元素为白图（第一个图片显示第二个图片隐藏）
            var others = $(this).siblings();
            $(others).each(function () {
                $(this).children("img").removeClass();
                //  $(this).children("img").first().removeClass().addClass("icon-show");
                $(this).children("img").last().removeClass().addClass("hide");
            });
            var width = tirmPxFun($(this).css("padding-left")) + tirmPxFun($(this).css("padding-right")) + tirmPxFun($(this).css("border-left")) + tirmPxFun($(this).css("padding-right")) + $(this).width();
            $("#popdiv").removeClass("hide");
            $("#popdiv").css({
                left: width,
                top: '0'
            }).show();
            if (!$("#popdiv").text()) {
                $("#popdiv").html($(this).text());
            } else {
                var index = $(this).index();
                $("#popdiv").children().removeClass("show").addClass("hide");
                $("#div" + index).removeClass().addClass("show");
                if (!$("#div" + index).html()) {
                    $("#div" + index).html($(this).text());
                }
            }
        });
        /* 对str（str=240px）去除px返回整数的数字240*/
        var tirmPxFun = function (str) {
            if (!str) {
                return 0;
            } else {
                return parseInt(str.substring(0, str.length - 2));
            }
        }
        $("#menu-div").mouseleave(function () {
            $("#menu-type-ul li").removeClass("active");
            $("#menu-type-ul li").children("img").removeClass();
            $("#menu-type-ul li").each(function () {
                $(this).children("img").first().removeClass().addClass("icon-show");
                $(this).children("img").last().removeClass().addClass("hide");
            });
            $("#popdiv").hide();
        });
        $("#biaopinUL li").click(function () {
            var index = $(this).attr("no");
            $("ul#biaopin-tab-ul" + index).removeClass("hide").addClass("show");
            $("ul#biaopin-tab-ul" + index).siblings().removeClass("show").addClass("hide");
        })
        $("ul.tab-nav-ul li").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
        });
        $("#shebeiUL li").click(function () {
            var index = $(this).attr("no");
            $("ul#shebei-tab-ul" + index).removeClass("hide").addClass("show");
            $("ul#shebei-tab-ul" + index).siblings().removeClass("show").addClass("hide");
        })
        $("#cailiaoUL li").click(function () {
            var index = $(this).attr("no");
            $("ul#cailiao-tab-ul" + index).removeClass("hide").addClass("show");
            $("ul#cailiao-tab-ul" + index).siblings().removeClass("show").addClass("hide");
        })
        $("#shigongUL li").click(function () {
            var index = $(this).attr("no");
            $("ul#shigong-tab-ul" + index).removeClass("hide").addClass("show");
            $("ul#shigong-tab-ul" + index).siblings().removeClass("show").addClass("hide");
        })
        $("#fuwuUL li").click(function () {
            var index = $(this).attr("no");
            $("ul#fuwu-tab-ul" + index).removeClass("hide").addClass("show");
            $("ul#fuwu-tab-ul" + index).siblings().removeClass("show").addClass("hide");
        })

        //我收到了询价邀请？
        $.ajax({
            url: 'index.php?user-company-purchases-tips',
            TYPE: 'GET',
            dataType: 'JSON',
        }).done(function (result) {

            if (result.isOk) {
                $('#receive-inquiry-modal').modal({backdrop:'static',keyboard:false});
                bindBtnEvent();
            }
        }).error(function (data) {
            console.log('获取用户是否收到询价消息失败');
        })

        function bindBtnEvent() {
            $('.to-inquiry-btn').on('click', function () {
                window.location.href = 'index.php?user-company-purchases-notice';
            })
        }
    });
</script>
</body>

</html>