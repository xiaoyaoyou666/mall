
<!--面包屑-->
<style type="text/css">
	 .buycp_list{
    	padding-bottom: 20px;
    }
    .typeMore .buycp_list li{
        padding:20px;
        border:1px solid #ccc;
        height: 380px;
        margin:10px;
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
	.li_st li{width: 222px;height:303px!important;}
	.li_st li img{}
	.li_ft{width: 62%!important;}
	.guigess{width: 180px;}
</style>

        <!--商品友情提示-->
        <div class="frd_hint">
        	<div class="frd_hints">
        		<p class="hint_sorry">很抱歉，没有找到与"{x2;$catename}"
                相关的 商品。</p>
		        	<p>建议您：</p>
                    <p>1.看看输入的文字是否有误</p>
                    <p>2.调整关键词，如“风机发电机组备件”改成“风机发电机”</p>
		        	<!-- <p>1.调整筛选条件，如“风机发电机组备件”改成“风机发电机”</p> -->
        	</div>
        </div>
        <p class="reminder">您是不是再找&nbsp;&nbsp;<i></i></p>
		<ul class="buycp_list li_st">
            {x2;tree:$tuijiangoods['data'],good,gid}
			<li>
				<a href="index.php?item-app-item&goodsid={x2;v:good['goodsid']}">
					<img style="width: 180px;height: 180px;" src="{x2;v:good['goodsthumb']}">
                    <div class="jiage">
                        <div class="pull-left">
                            {x2;if:$_user['userid']}
                            <p>价格：<span class="col_red">¥{x2;v:good['goodsminprice']}起</span></p>
                            {x2;else}
                                <a style="color: #f32828" href="javascript:;" class="modify" msg="如果您想知道商品价格，请先登录">立即询价</a>
                            {x2;endif}
                           
                        </div>
                        <div class="pull-right"><span class="gray-color">{x2;v:good['goodspv']}人看过</span></div>
                    </div>
                    <div class="guige guigess">{x2;v:good['goodstitle']}</div>
                    
                </a>
                <a style="margin-top: 10px;" href="index.php?item-app-company&companyid={x2;v:good['goodsuserid']}">
                    <div class="gys">
                        <div class="pull-left">
                            <img src="app/core/styles/images/market/sj-icon.png">
                        </div>

                        <div class="pull-left  li_ft">{x2;$userarr['data'][v:good['goodsuserid']]['company_name']}</div>
                    </div>
                </a>
			</li>



            {x2;endtree}
		</ul>
		