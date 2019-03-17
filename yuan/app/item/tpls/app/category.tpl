<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>网格商城</title>
   <!-- <meta name="viewport" content="width=device-width, initial-scale=1">-->
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
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/ss.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/wgmarket-index.css"/>

    <script src="app/core/styles/js/jquery.min.js"></script>
    <script src="app/core/styles/js/bootstrap.min.js"></script>
    <script src="app/core/styles/js/menu_left.js"></script>
</head>
<body>
{x2;include:nav}
<!--面包屑-->
<style type="text/css">
    .buycp_list li>a>img,.buycp_list li .gys img {
        margin-bottom:0px !important;
        border:0 !important;
    }
    .buycp_list li .gys img{
        margin-top: -3px;
    }
    .jiage, .gys {
        overflow: hidden;
        margin-bottom: 2px;
        font-size: 12px;
    }
    .jiage{
        margin-top:10px;
    }
    ul.buycp_list .jiage p {
        margin-bottom: 0px !important;
    }
    .gray-color {
        color: #888;
    }
    .guige {
        color: #323232;
        line-height: 20px;
        overflow: hidden;
        text-overflow: ellipsis;
        -o-text-overflow: ellipsis;
        white-space: nowrap;
        width: 246px;
    }
    .gys {
        width: 246px;
        line-height: 20px;
    }
    .gys div:first-child {
        width: 13%;
    }
    .gys div>img {
        width: 16px;
        height: 14px;
        margin-right:10px;
    }
    .gys div:last-child {
        width: 87%;
        overflow: hidden;
        text-overflow: ellipsis;
        -o-text-overflow: ellipsis;
        display: block;
        white-space: nowrap;
    }
    .buycp_list{
    	padding-bottom: 20px;
    }
    .typeMore .buycp_list li{
        padding:20px;
        border:1px solid #ccc;
        height: 380px;
        margin:10px;
        position: relative;
    }

    .typeMore .buycp_list li:hover{
     border:solid 1px #fff!important;
	-webkit-transition: box-shadow .2s ease-in-out;
	-moz-transition: box-shadow .2s ease-in-out;
	-ms-transition: box-shadow .2s ease-in-out;
	-o-transition: box-shadow .2s ease-in-out;
	transition: box-shadow .2s ease-in-out;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
	-webkit-transform: translate3d(0, -2px, 0);
	-moz-transform: translate3d(0, -2px, 0);
	-ms-transform: translate3d(0, -2px, 0);
	-o-transform: translate3d(0, -2px, 0);
	transform: translate3d(0, -2px, 0);
    }
    .typeMore .buycp_list li a {
        border:0 !important;
        padding:0 !important;
    }
    .cpbox{
        height:48px;
        padding:0;
        float: none !important;
    }
    .cpbox .alltypes{
        height:48px;
        line-height: 48px;
    }
    .alltypes{
        height:50px;
        line-height: 50px;
        /*background-color: #2faa66;*/
        /*background-color: #006b2f;*//*深绿色*/
        background-color: #009944;
        border-bottom: 1px solid #60d795;
        color: #ffffff;
        width:240px;
        padding: 0;
    }
    .u-av-label{
        display: inline-block;
        height:24px;
        line-height: 24px;
        border:solid 1px #009944;
        padding-left:10px;
        padding-right:10px;
        font-size: 13px;
    }
   .u-av-label i{
      margin-left:10px;
      color: #009944;   
   }
   .pagination > li > a {  
      color: #888;
      margin-right: 10px;
    }
    .pagination > li > a:hover{  
      color: #fff!important;
      margin-right: 10px;
      background:#009944;
    }
    .pagination > li:first-child > a, .pagination > li:first-child > span {
     margin-left: 0;
     border-top-left-radius: 0px; 
     border-bottom-left-radius: 0px;
   }
   .pagination > li:last-child > a, .pagination > li:last-child > span{
   	border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
   }
   	.li_st li{width: 222px;height:303px!important;}
	.li_st li img{}
	.li_ft{width: 62%!important;}
	.guigess{width: 180px;}
	img.bq{
		display: none;
	}
	.t_b img.bq{
		display: block;
		width:57px!important;
		height:auto!important;
		position: absolute;
		top:-5px;
		right:-6px;
		/*background: url() no-repeat right top;
		background-size: 57px;
		color: #0000FF;*/
	}
</style>
<div class="zmm-zx-centent bg_fff">
    <div class="container t20 typeMore">
        <div class="cpbox">
            <div class="pull-left alltypes text-center" style="text-align:left;padding-left:22px;"><img style="margin-right:15px;width:24px;height:auto;" src="app/core/styles/images/market/menu1.png" alt="">全部商品分类</div>
            <div class="pull-left" style="padding:10px 20px;">
                <!--筛选条件-->
                {x2;tree:$menu_list,mlist,menu_listid}
                <a title="{x2;v:mlist['text']}" href="{x2;v:mlist['href']}" class="u-av-label"><span style="width:auto;max-width: 220px;overflow: hidden;height: 24px;">{x2;v:mlist['text']}</span><i style="float:right;"><img src="app/core/styles/images/close_s.png" style="width:10px;height:10px;margin-top:-3px;"></i></a>
                {x2;endtree}
            </div>
            <div class="clearfix"></div>
        </div>
        {x2;if:$goods['data']}
            {x2;include:category_a}
        {x2;endif}


        {x2;if:$goods['data']}
        <ul class="buycp_list li_st">
            {x2;tree:$goods['data'],good,gid}
            <li class="t_b">
                {x2;if:v:good['type']==1}
            	<img src="app/core/styles/img/tb.png" class="bq">
                {x2;endif}
                <a href="index.php?item-app-item&goodsid={x2;v:good['goodsid']}{x2;if:$agreement==2 || v:good['type']==1}&agreementid={x2;v:good['agreementid']}&p={x2;v:good['goodsminprice']}{x2;endif}">
                    <img style="width: 180px;height: 180px;" src="{x2;v:good['goodsthumb']}">
                    <div class="jiage">
                        <div class="pull-left">
                            {x2;if:$_user['userid']}
                            <p><span class="col_red ">¥{x2;v:good['goodsminprice']}</span></p>
                            {x2;else}
                                <a style="color: #f32828" href="javascript:;" class="modify" msg="如果您想知道商品价格，请先登录">立即询价</a>
                            {x2;endif}
                        </div>
                        <div class="pull-right"><span class="gray-color">{x2;v:good['goodspv']}人看过</span></div>
                    </div>
                    <div class="guige guigess">{x2;v:good['goodstitle']}</div>

                </a>
                <a href="index.php?item-app-company&companyid={x2;v:good['goodsuserid']}">
                    <div class="gys">
                        <div class="pull-left">
                            <img src="app/core/styles/images/market/sj-icon.png">
                        </div>

                        <div class="pull-left li_ft">{x2;$userarr['data'][v:good['goodsuserid']]['company_name']}</div>
                    </div>
                </a>
            </li>
            {x2;endtree}
        </ul>
        <ul class="pagination" style="float:right;margin-right:-12px;">{x2;$goods['pages']}</ul>
        {x2;else}
            {x2;include:goods_no}
        {x2;endif}


    </div>
</div>
{x2;include:menu}
{x2;include:footer2}


</body>
</html>