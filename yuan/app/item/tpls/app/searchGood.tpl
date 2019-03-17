{x2;include:header}
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
    .typeMore .buycp_list li{
        padding:20px;
        border:1px solid #ccc;
        height: 380px;
    }
    .typeMore .buycp_list li:hover{
        border:1px solid #009944;
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
    .corre{float: right;margin:11px 16px;}
    .frd_hint{width: 100%;border:2px solid #ff8700;box-sizing: border-box;margin-top: 30px;}
    .frd_hint .frd_hints{width: 100%;height:100% ;background:#fff3e3;padding: 36px 60px;}
    .frd_hint .frd_hints p{color: font-size:14px;color:#666666;}
    .frd_hint .frd_hints .hint_sorry{font-size: 16px;font-weight: bold;}
    .reminder{text-align: center;font-size: 14px;color: #666;margin: 20px 0;}
    .reminder i{font-style:normal;display: inline-block;width:0; height:0; border-left:7px solid transparent;border-right:7px solid transparent;border-top:7px solid #d8d8d8;}
</style>
<div class="zmm-zx-centent bg_fff">
	<div class="container t20 typeMore">
        <div class="cpbox">
            <div class="pull-left alltypes text-center" style="text-align:left;padding-left:22px;">
            	<img style="margin-right:15px;width:24px;height:auto;" src="app/core/styles/images/market/menu1.png" alt="">全部商品分类</div>
            	<div class="pull-left" style="padding:10px 20px;color: #666;">全部结果>&nbsp;<i style="font-style: normal;color: #000000;">"扑尔敏"</i></div>
            	<span class="corre">相关商品<i style="font-style: normal;color: #ff8700;">110</i>件</span>
            <div class="clearfix"></div>
        </div>
        <!--商品友情提示-->
        <div class="frd_hint">
        	<div class="frd_hints">
        		<p class="hint_sorry">很抱歉，没有找到与“扑尔敏”相关的 商品。</p>
		        	<p>建议您：</p>
		        	<p>1.看看输入的文字是否有误</p>
		        	<p>2.调整关键词，如“风机发电机组备件”改成“风机发电机”</p>
        	</div>
        </div>
        <p class="reminder">您是不是再找&nbsp;&nbsp;<i></i></p>
		<!--<ul class="buycp_list">
            {x2;tree:$goods['data'],good,gid}
			<li>
				<a href="index.php?item-app-item&goodsid={x2;v:good['goodsid']}">
					<img src="{x2;v:good['goodsthumb']}">
                    <div class="jiage">
                        <div class="pull-left">
                            <p>价格：<span class="col_red">¥{x2;v:good['goodsminprice']}起</span></p>
                        </div>
                        <div class="pull-right"><span class="gray-color">{x2;v:good['goodspv']}人看过</span></div>
                    </div>
                    <div class="guige">{x2;v:good['goodstitle']}</div>
                    
                </a>
                <a href="index.php?item-app-company&companyid={x2;v:good['goodsuserid']}">
                    <div class="gys">
                        <div class="pull-left">
                            <img src="app/core/styles/images/market/sj-icon.png">
                        </div>

                        <div class="pull-left">{x2;v:good['company_name']}</div>
                    </div>
                </a>
			</li>



            {x2;endtree}
		</ul>-->
		<ul class="pagination pull-right">{x2;$goods['pages']}</ul>
	</div>
</div>
{x2;include:menu}
{x2;include:footer2}
</body>
</html>