<style>
    .buycp_lists li a:hover {
        border: solid 1px #fff !important;
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
    .search-condition:hover{
        color: #666;
    }
    .search-condition.active{
        color: #ff8a00;
    }
	.bg_fff{background-color: #fff;}
	.cpboxs{ float: left; width: 100%;padding:20px }
	.cpboxs img{ width: 180px; height: 180px; }
	.cpboxs h2{ color: #323232; width: 900px; margin-left: 30px; margin-bottom:20px; }
	.cpboxs p{width: 900px; line-height: 24px; margin-left: 30px; margin-bottom: 0px; font-style: 16px; color: #323232;}
	.px_boxs{float: left; width: 100%; background-color:rgba(255,255,255,0.3); height: 34px; line-height: 34px; padding: 0px 20px;}
	.px_boxs p{float: left; line-height: 34px; color: #323232;}
	.px_boxs a{float: left; margin: 0px 8px;}
	.px_boxs a em{padding-left: 5px;}
	.buycp_lists{width: 105%; float: left; overflow: hidden; padding:0;}
	.buycp_lists li{ float: left; width: 224px;  margin:20px 18px 0px 0px;}
	.buycp_lists li a{ border: 1px solid #ccc;  }
	.buycp_lists li a:hover{border: 1px solid #009944;}
	.buycp_lists li img{width: 217px; height: 200px; padding:12px;}
	.buycp_lists li .col_red{color: #f32828;}
	.buycp_lists li p{width: 100%; color: #323232; max-height: 56px; overflow: hidden;padding-left: 14px;}
	.positions{float: right!important;}
	.collection{
	background: url("app/core/styles/images/collection2.png") no-repeat 10px center ;
	padding-left:14px;
	background-size: 16px;
	background-color:#fef3e7;
    border:1px solid #f0953a;
    border-radius:2px;
    height:35px;
    width:138px;
    outline: 0px;
    margin-right: 20px;
}
.collection1{
	background: url("app/core/styles/images/collection1.png") no-repeat 10px center ;
	padding-left:14px;
	background-size: 16px;
	background-color:#ff9518;
    border-radius:2px;
    border:1px solid #f0953a;
    width:92px;
    color:#fff;
    height:35px;
    outline: 0px;
    margin-right: 20px;
}
.phone_qq{display: inline-block;width: 102px;height: 35px;background-color: #fef3e7;border: 1px solid #f0953a}
.phone_qq a{width: 100%;height: 35px;display: inline-block;padding:6px 10px ;}
.phone_qq a img{width: 18px;height: 20px;float: left;margin:1px 4px 0 0;}
.phone_qq a:hover{color: #ff9518;}
</style>
{x2;include:header}

<body>
{x2;include:nav}
<!--面包屑-->
<div class="zmm-zx-centent bg_fff">
    <div class="container t20">
    	<div class="bg_imgs">
	        <div class="cpboxs" style="background: none;">
	            <img class="pull-left"
	                 src="{x2;if:$company['company_logo_da']}{x2;$company['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}"
	                 style="width: 240px;height: 140px;">
	            <h2 class="pull-left" style="width: 700px;">{x2;$company['company_name']}</h2>
	            <p class="pull-left" style="width: 700px;color: #323232;">电话：{x2;$company['company_kefu']}</p>
	            <p class="pull-left" style="width: 700px;color:#323232;">地址：{x2;$company['company_address']}</p>
                  <!--  隐藏userid 传值-->
                <input type="hidden" value="{x2;$company['userid']}" id="companyname">
                <!--  结束 时间-->
                <p class="pull-left" style="margin-left: 20px;margin-top:5px;">

                </p>
	            <p class="pull-left" style="margin-left: 20px;margin-top:5px;">
                    {x2;if:$company['company_qq'] != ''}
                  
                    {x2;endif}
                    	<span class="phone_qq" alt="联系卖家" title="联系卖家">
                    	<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin={x2;$company['company_qq']}&site=qq&menu=yes">
                    		<img src="app/core/styles/images/qqs.png" / >
                    		<span>联系卖家</span>
                    	</a>
                    </span>
                    
                    <button style="float: left;" class="collection" type="button" id="collection">收藏该供应商</button>
                    
                    
                </p>
	        </div>
	        <div class="px_boxs">
	            <p>排序方式：</p>
	            <a href="index.php?item-app-company&companyid={x2;$company['userid']}" class="search-condition new-product"
	               title="">新品<em><img src="app/core/styles/images/up_icon_on.png"></em></a>
	            <a href="index.php?item-app-company&companyid={x2;$company['userid']}&ordertype=1"
	               class="search-condition price" title="">价格<em><img src="app/core/styles/images/down_icon.png"></em></a>
	        </div>
	        <div style="clear: both;"></div>
	    </div>
        {x2;if:$goods['data']}
        <ul class="buycp_lists" style="padding-bottom: 30px;">

            {x2;tree:$goods['data'],good,gid}
            <li>
                <a href="index.php?item-app-item&goodsid={x2;v:good['goodsid']}">
                    <img src="{x2;v:good['goodsthumb']}">
                    {x2;if:$islogin == 0}
                    
                    <span style="color: #f32828;padding: 10px 0 0 14px;" id="nologin" msg="如果您想知道商品价格，请先登录">立即询价<i style="font-style: normal;color: #666;padding-left: 85px;">{x2;v:good['goodspv']}人看过</i></span>
                    {x2;else}
                    <p><span class="col_red">¥{x2;v:good['goodsminprice']}</span><span  style="color:#666;float:right;margin-right: 11px;">{x2;v:good['goodspv']}人看过</span></p>
                    {x2;endif}
                    <p style="height:36px;line-height: 18px;font-size: 13px;padding-right: 13px;">{x2;v:good['goodstitle']}</p>
                    
                </a>
            </li>
            {x2;endtree}
        </ul>
        {x2;else}
        {x2;include:company_no}
        {x2;endif}
        <div class="">
        	
        </div>
    </div>
</div>

<script type="text/javascript">
// ajax 开始
    //获取是否已收藏该商品状态
    function getCollectionStatus(){
        var companyname = $("#companyname").val();
        $.ajax({
            type: 'get',
            url: 'index.php?item-app-company-collectshows&companyname='+companyname,
            dataType: 'JSON',
            success: function(res) {
                //已收藏
                if (res.statusCode == 200) {
                    setCollectionStatus('collected');
                } else {
                    setCollectionStatus('collect');
                }
            }
        })
    }
    getCollectionStatus();

    //取消收藏/收藏
    function setCollectionStatus(types) {
        //取消收藏--未收藏
        if(types === "collected"){
            $('#collection').removeClass("collection").addClass("collection1").text("已收藏");
        }else{
            $('#collection').removeClass("collection1").addClass("collection").text("收藏该供应商");
        }
    }

    //收藏供应商
    $("#collection").click(function(){
        var type = 2;   //代表供应商类型
        var companyname = $("#companyname").val();
        $.ajax({
            type: 'get',
            url: 'index.php?item-app-company-companyshow&companyname='+companyname+'&type='+type,
            dataType: 'JSON',
            success: function(res) {
                //alert(res.statusCode)
                //收藏成功
                if (res.statusCode == 200) {
                    // alert("收藏成功");
                    window.location.href = "index.php?item-app-company&companyid="+companyname;
                    setCollectionStatus('collect');
                }else if(res.statusCode == 301){
                    window.location.href = "index.php?user-app-login&t=2";
                }else{
                    // alert("取消收藏");
                    window.location.href = "index.php?item-app-company&companyid="+companyname;
                    setCollectionStatus('collected');
                }
            },
            error: function(e) {
                console.log(e);
            }
        })
    })

// ajax  结束
    $(function () {
        $('#nologin').on('click', function () {
            var data = {result: false, message: '如果您想知道商品价格，请先登录'};
            $.zoombox.show('modify', data);
            return false;

        });
    })
    var widget = {}

    widget = {
        init: function () {
            widget.showActiveTab();

        },

        showActiveTab: function () {
            $(".search-condition").find("em").html('<img src="app/core/styles/images/down_icon.png">');
            var type = widget.getParamByurl('ordertype');
            //==1价格；==undifined新品
            if (type) {
                $(".price").addClass('active');
                $(".price").find("em").html('<img src="app/core/styles/images/up_icon_on.png">');
            } else {
                $(".new-product").addClass('active');
                $(".new-product").find("em").html('<img src="app/core/styles/images/up_icon_on.png">');
            }
        },


        getParamByurl: function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]);
            return null;

        }
    }
    widget.init();

</script>
{x2;include:footer2}
{x2;include:menu}
</body>

</html>

