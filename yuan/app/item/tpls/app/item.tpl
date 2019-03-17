{x2;include:header}
<body>

<style>
#spec-n5 {
	width: 350px;
	height: 56px;
	padding-top: 6px;
	overflow: hidden;
}
#spec-left {
	width: 16px;
	height: 55px;
	float: left;
	cursor: pointer;
	margin-top: 3px;
	background-color:#ddd;
}
#spec-right {
	width: 16px;
	height: 55px;
	float: left;
	cursor: pointer;
	margin-top: 3px;
	background-color:#ddd;
}
#spec-list {
	position: relative;
	width: 310px;
	margin-right: 6px;
	float: left;
	overflow: hidden;
	margin-left: 2px;
	display: inline;
}
.why-basket-detail-img ul li,.why-basket-detail-img ul li:nth-child(1){
	margin-top: 0px;
}
.list-h{min-width:310px!important;}
.list-h li img{border: 1px solid rgb(204, 204, 204);
    padding: 2px;}
.jqzoom {
	padding: 0;
	width: 350px;
	height: 350px;
	position: relative;
}
#preview {
	margin-top: 10px;
	text-align: center;
	width: 357px;
}
.zoomdiv{z-index:100;position:absolute;top:1px;left:0px;width:400px;height:400px;background:url(loading.gif) #fff no-repeat center center;border:1px solid #e4e4e4;display:none;text-align:center;overflow: hidden;}
.bigimg{width:800px;height:800px;}
.title::after{background: none!important;}
.why-basket-center img{
	max-width: 700px;
	height:auto;
}
.why-basket-center{width: 970px;}
.why-btn-big-green, .why-btn-big-border-green {
    padding: 0 20px;
}
.collection{
	background: url("app/core/styles/images/collection2.png") no-repeat 10px center ;
	padding-left:14px;
	background-size: 16px;
	background-color:rgba(254,144,16,0.10);
    border:1px solid #f0953a;
  /*  border-radius:2px;*/
    height:35px;
    width:118px;
    outline: 0px;
    
}
.collection1{
	background: url("app/core/styles/images/collection1.png") no-repeat 10px center ;
	padding-left:14px;
	background-size: 16px;
	background-color:#ff9518;
   /* border-radius:2px;*/
    border:1px solid #f0953a;
    width:92px;
    color:#fff;
    height:35px;
    outline: 0px;
}
.seach_b{
	position: relative;bottom: 38px;left: 320px;
	width: 30px;
	height: 30px;
	background:rgba(255,255,255,0.7);	
}
.seach_b span{margin:8px 5px 10px 5px ;top:9px!important}
.pu-right{background:rgba(255,255,255,0.10);border:1px solid #beecd2;width:206px;height:410px;}
.pu-right .idera{width: 100%;background:url("app/core/styles/images/bgso.png") no-repeat;height: auto;background-size: 100% auto;}
.left_bg{position: absolute;width: auto;height: 3px;top:27px;left: 16px;}
.right_bg{position: absolute;width: auto;height: 3px;top:27px;right: 16px;}
.m_home{width: 40px;height:auto ;position: absolute;left: 84px;top:18px}
.copy_on{text-align: center;font-size:14px;color:#666666;}
.recommend{text-align: left;padding:0 20px;display: flex;align-items: center;color: #666;font-size: 14px;}
.recommend img{width: 102px;height: auto;vertical-align: auto;}
.touch{padding: 0 20px;}
.touch span{color: #666;display: inline-block;float: left;padding-top: 2px;}
.touch a{display: block;}
.qq_s{display: inline-block;}

.qq_s .qq_as{width: 80px;display: inline-block;height: 20px;} 
.qq_s .qq_ab{position: absolute;left: -3px;top:6px;width: 18px;}
.ours{font-size:12px;color:#666666;position: absolute;top:1px;left: 20px;}
.border_s{width: 168px;height: 1px;border: 1px dashed #ddd;margin: 12px auto;}
.center_bs{width: 168px;display: flex;justify-content: space-between;margin: 0 auto;}
.center_bs p{width: 80px;padding: 0!important;margin-top: 10px;}
.center_bs p a{width: 80px;display: block!important;text-align: center;font-size: 12px!important;padding: 0!important;background:#fafafa;}
.why-basket-detail-info{width: 586px!important;}
.ass{border:1px solid #009944;color:#009944}
.details_s{padding:0px 10px;color: #323232;display: inline-block;width: 32%;font-size: 12px;}
.details_s p{display: flex;align-items: center;width: 100%;}
.details_s p .spns_a{color:#666!important;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;display: inline-block;width:60%;padding-left: 10px;}
.decils{width: 99%;margin: 0 auto;border-bottom: 1px solid #e5e5e5;padding-bottom: 20px;}
.spns{width: 36%;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;display: inline-block;float: left;}
.title p{width: 100%;border-bottom: 1px solid #ccc;padding:5px 0 5px 16px;color:#009944!important ;}
.why-basket-center{border-top: 1px solid #009944;}
</style>
{x2;include:nav}
<div class="container why-position">您所在位置：<span class="color-orange">首页</span>><span class="color-orange"><a href="index.php?item">网格超市</a></span>><span style="color:#009944;">查看商品详情</span></div>
<div class="container ">
	<!-- 图片 -->
	<div class="pull-left why-basket-detail-img" >
		<div id="preview">
			<div id="spec-n1" class="jqzoom"><img jqimg="{x2;$goods['goodsphotos'][0]}" src="{x2;$goods['goodsphotos'][0]}" alt="" height="350" width="350"></div>
			<div class="seach_b"><span style="display:block;"  class="glyphicon glyphicon-search"></span></div>
		</div>
		<div id="spec-n5">
			<ul class="control before" id="spec-left">
				<li style="margin-top: 10px;padding-left:3px;"><span class="glyphicon glyphicon-triangle-left"></span></li>
			</ul>
			<div id="spec-list">
				<ul class="list-h">
                    {x2;tree:$goods['goodsphotos'],photo,pid}
					<li><img height="50" width="50" src="{x2;v:photo}"> </li>
                    {x2;endtree}
				</ul>
			</div>
			<ul class="control next" id="spec-right" style="float: right;">
				<li style="margin-top: 10px;padding-left:3px;"><span class="glyphicon glyphicon-triangle-right"></span></li>
			</ul>
		</div>
	</div>
	<!-- 商品信息 -->
	<div class="pull-left why-basket-detail-info" style="margin-top:10px;">
		<form id="item-buycart" action="index.php?item-app-cart-addtocart" method="post" >
		<h4 style="font-weight: 700;">{x2;$goods['goodstitle']}</h4>
		<div class="table" style="margin-top:20px;">
			<table style="width: 100%;">
				<tr>
					<td width="80%">
						商品价格：
                        {x2;if:$agreementPric != '0'}
                        <span class="color-red" id="itemprice">&yen{x2;$agreementPric}</span><br>
                        {x2;else}
                        <span class="color-red" id="itemprice">&yen{x2;$goods['goodsminprice']}{x2;if:$goods['goodsmaxprice'] > $goods['goodsminprice']}-&yen{x2;$goods['goodsmaxprice']}{x2;endif}</span><br>
                        {x2;endif}
						运费：<i>请咨询客服</i>
					</td>
                    <!--
					<td align="center" valign="middle" style="border-right: 1px solid #ddd">
						编号<br>{x2;$goods['goodsid']}
					</td>

                        <td align="center" valign="middle" style="border-right: 1px solid #ddd">
                            <img src="app/core/styles/images/det-Colle.png" alt=""><br>收藏
                        </td>
					-->
					<td align="center" valign="middle" >
						<img src="app/core/styles/images/det-follow.png" alt=""><br>{x2;$goods['goodspv']}
					</td>
					<td align="center" valign="middle" >
						<img src="app/core/styles/images/sc_nbm.png" alt="" style="width:18px;"><br>{x2;$goods['goodsnum']}
					</td>
				</tr>
			</table>
		</div>
		<p style="padding:5px 0px;">品牌：&nbsp;{x2;$goods['goodsbrand']}</p>
            <div class="list">
		{x2;tree:$items['fields'],field,fid}
            {x2;if:v:fid == '1'}
            <p class="td_{x2;v:field['field']} xz" style="padding: 5px 0px;">
                {x2;v:field['fieldtitle']}：
                {x2;tree:v:field['pars'],par,pid}
                <a class="btn btn-default parselector" onClick="javascript:selectpar('{x2;v:field['field']}','{x2;v:par}',this);" data="{x2;v:par}"{x2;if:v:fid == 1} data-img="{x2;v:field['img'][v:key]}"{x2;endif}>{x2;v:par}</a>
                {x2;endtree}
            </p>
            {x2;else}
            <p class="td_{x2;v:field['field']} xz" style="padding: 5px 0px;">
                {x2;v:field['fieldtitle']}：
                {x2;tree:v:field['pars'],par,pid}
                <a style="cursor:not-allowed;" class="btn btn-default parselector" data="{x2;v:par}"{x2;if:v:fid == 1} data-img="{x2;v:field['img'][v:key]}"{x2;endif}>{x2;v:par}</a>
                {x2;endtree}
            </p>
            {x2;endif}
        {x2;endtree}
            </div>
		<p style="padding:5px 0px">
			库存：<span id="itemnumber">请选择规格</span>
            {x2;tree:$items['items'],item,iid}
			<a style="display:none;margin-bottom:0.5rem;" data-id="{x2;v:item['itemid']}" data-limit="{x2;v:item['limit_number']}" data-price="{x2;v:item['itemprice']}" data-agrid="{x2;v:item['agreementid']}" class="parselector"{x2;tree:v:item['pars'],par,pid} data-{x2;v:key}="{x2;v:par}"{x2;endtree}>{x2;v:item['number']}</a>
            {x2;endtree}
		</p>
		<p style="padding:5px 0px;float: left;">起订量：</p>
		<div class="why-num-change" style="float:left;">
			<span class="jian removebutton">-</span>

			<input type="text" class="text-center" value="1" id="number" name="number" needle="needle" datatype="number" onkeyup="value=value.replace(/[^0-9]/g,'')">

            <!--  商品收藏主键ID-->
            <input type="hidden" name="goodsid" value="{x2;$goods['goodsid']}"  id="goodscollect">
            <!--  结束 -->
			
			<span class="jia addbutton">+</span>
		</div>&nbsp;&nbsp;<span style="float:left;padding:5px 10px">{x2;$goods['goodsunit']}</span>

		<div class="clearfix"></div>
		<p style="float: left;width:100%;margin-top:20px;">
			<input type="hidden" value="" id="itemid" name="itemid" needle="needle" datatype="number" autocomplete="off" msg="请先选择产品规格"/>
            <input type="hidden" value="" name="agreementid" id="agreementid">
			<button id="subbutton" class="why-btn-big-green" type="button" >加入进货单</button>
			<button class="collection" type="button" id="collection" style="margin-left:20px;">收藏该商品</button>
			<button id="askbutton"{x2;if:$_user['userid']} onclick="javascript:$('#askitemid').val($('#itemid').val());$('#myModal').modal();"{x2;else} onclick="javascript:$.loginbox.show();"{x2;endif} class="why-btn-big-green" style="display: none;" type="button">询价</button>
			<!--
			<button class="why-btn-big-border-green l10">立即购买</button>-->
		</p>
		</form>
	</div>
	<!-- 右侧收藏 -->
	{x2;if:$_user['userid']}
	<div class="pull-right pu-right" style="width: 208px;">
		<!--新改-->
		<div class="idera" style="height: 50px;position: relative;">
			<img class="left_bg" src="app/core/styles/images/left_bg.png" />
			<img class="right_bg" src="app/core/styles/images/right_bg.png"/>
			<img class="m_home" src="app/core/styles/images/maijia.png"/>
		</div>
		
		<div style="width:168px;height:112px;border:1px solid #ddd;margin:12px auto;"><img src="{x2;$company['company_logo']}" alt=""  style="width:100%;height:100%;position:relative;top:50%;left:50%;transform:translate(-50%,-50%);"></div>
		<div class="copy_on">{x2;$company['company_name']}</div>
		<p class="recommend"><i style="font-style: normal;float: left;padding-top: 4px;">推荐：</i><img src="app/core/styles/images/xj.png"/></p>
		
         
        <p style="text-align: left;margin: 4px 0 0 20px;color: #666;">电话：{x2;$company['company_kefu']}</p>
        
        {x2;if:$company['company_qq'] != ''}
       	<p class="touch">
            <span>联系：&nbsp;</span>
           	<a class="touchs" style="position: relative;" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin={x2;$company['company_qq']}&site=qq&menu=yes">
           		<div class="qq_s">
           			<img class="qq_as" src="app/core/styles/images/bgs_a.png"/>
           			<img class="qq_ab" src="app/core/styles/images/qqs.png"/>
           			<p class="ours">联系我们</p>
           		</div>
           	</a>
          
        </p>
        {x2;endif}
        <div class="border_s"></div>
        <div class="center_bs">
        	<p style=""><a href="index.php?item-app-company&companyid={x2;$company['userid']}" class="why-btn-big-border-green" style="display:inline-block;text-align:center;">进入店铺</a></p>
        	<p style=""><a href="index.php?item-app-company&companyid={x2;$company['userid']}" class="why-btn-big-border-green" style="display:inline-block;text-align:center;">收藏店铺</a></p>
        </div>
		
		
	</div>
	{x2;endif}
</div>
<div class="clearfix"></div>
<div class="container" style="margin-top: 30px;">
	<!-- 左侧 -->
	<div class="pull-left why-basket-left">
		<h5 style="background: #ededed;height: 45px;line-height: 45px;">看了又看</h5>
		<ul>
            {x2;tree:$seeAgainList,again,ggid}
            <a target="_blank" href="index.php?item-app-item&goodsid={x2;v:again['goodsid']}">
                <li>
                    <img src="{x2;v:again['goodsthumb']}" height="180" width="180" alt="" style="border:1px solid #ddd ">
                    <div class="t10">{x2;v:again['goodstitle']}</div>
                    <div class="color-red">
						{x2;if:v:again['goodsminprice'] > 0}
                        	￥{x2;v:again['goodsminprice']}
                        {x2;else}
                        	￥{x2;v:again['goodsmaxprice']}
                        {x2;endif}
                    </div>
                </li>
            </a>
            {x2;endtree}
		</ul>
	</div>
	<!-- 中间 -->
	<div class="pull-left why-basket-center">
		<div class="title" style="background:none;">
			<p style="color:#009944;">商品详情</p>
		</div>
		<!--新增-->
		<div class="decils">
	        {x2;tree:$goodparameter,goodp,gid}
			<div class="details_s">
				<p><span class="spns">{x2;v:goodp['title']}</span><span class="spns_a" title="{x2;v:goodp['val']}">{x2;v:goodp['val']}</span></p>
			</div>
	        {x2;endtree}
	        </div>
		<div style="padding:16px;">
			{x2;realhtml:$goods['goodsdescribe']}
		</div>
	</div>
	<!-- 右侧 -->
	<!--<div class="pull-right why-basket-left">
		<h5 style="background: #ededed;height: 45px;line-height: 45px;">热门推荐</h5>
		<ul>
            {x2;tree:$groomList['data'],groomList,gid}
            <a target="_blank" href="index.php?item-app-item&goodsid={x2;v:groomList['goodsid']}">
                <li>

                    <img src="{x2;v:groomList['goodsthumb']}" height="180" width="180" alt="" style="border:1px solid #ddd ">
                    <div class="t10">{x2;v:groomList['goodstitle']}</div>
                    <div class="color-red">
                    	{x2;if:v:groomList['goodsminprice'] > 0}
                        	￥{x2;v:groomList['goodsminprice']}
                        {x2;else}
                        	￥{x2;v:groomList['goodsmaxprice']}
                        {x2;endif}

                    </div>
                </li>
            </a>
            {x2;endtree}
		</ul>
	</div>-->
</div>
<script type="text/javascript">

    $(".list p:first-child a").click(function(){
        var i =$(this).index()
        $(".list").find("p").each(function(){
            $(this).children("a").eq(i).addClass("ass");
            if($(this).children("a").eq(i).hasClass("ass")){
                $(this).children("a").eq(i).siblings().removeClass("ass")
            }
        })
    })

	$('#number').keyup(function(){
		var _val = $(this).val();
		if(_val==0) {
			$(this).val(1);
		};
    });

    //ajax 收藏

    //获取是否已收藏该商品状态
    function getCollectionStatus(){
        var goodsed = $("#goodscollect").val();
        $.ajax({
            type: 'get',
            url: 'index.php?item-app-item-collectshows&goodsed='+goodsed,
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
       //取消收藏？--未收藏
       if(types === "collected"){
           $('#collection').removeClass("collection").addClass("collection1").text("已收藏");
       }else{
           $('#collection').removeClass("collection1").addClass("collection").text("收藏该商品");
       }
   }
    //商品ajax
    $("#collection").click(function(){
        var type = 1,
        $this=$(this);
         var goods = $("#goodscollect").val();
           $.ajax({
             type: 'get',
             url: 'index.php?item-app-item-goods&collect=' + goods +'&type='+type,
             dataType: 'JSON',
             success: function(res) {
                 //收藏成功
                 if (res.statusCode == 200) {
                     // alert("收藏成功");
                     window.location.href = "index.php?item-app-item&goodsid="+goods;
                     setCollectionStatus('collect');
                 }else{
                     // alert("取消收藏");
                    window.location.href = "index.php?item-app-item&goodsid="+goods;
                     setCollectionStatus('collected');
                 }
             },
             error: function(e) {
                 console.log(e);
             }
         })
    })
    //ajax 结束

    // $("#collection").click(function(){
    // 	if($(this).hasClass("collection")){

    // 		$(this).removeClass("collection").addClass("collection1").text("已收藏");
    		
    // 	}else{

    // 		$(this).removeClass("collection1").addClass("collection").text("收藏该商品");
    // 	}
    // })

    var pars = [];
    {x2;tree:$items['fields'],field,fid}
    var {x2;v:key} = '';
    pars.push('{x2;v:key}');
    {x2;endtree}
    var cnt = [];
    var isselcet = 0;
    function selectpar(parname,parcontent,obj)  {
        isselcet = 1;
        if($(obj).attr('data-img'))
        {
            $('#spec-n1 img').attr('src',$(obj).attr('data-img'));
            $('#spec-n1 img').attr('jqimg',$(obj).attr('data-img'));
        }
        $('#subbutton').val('加入进货单');
        $('#itemid').val('');
        $('#subbutton').attr('disabled',true);
        cnt[parname] = parcontent;
        var cntnumber = 0;
        for(x in cnt)
        {
            cntnumber++;
        }
           if($(obj).hasClass("btn-danger")){
        	    $(obj).removeClass("btn-danger");
           }else{
           	   //$(obj).addClass("btn-danger");
           	   $(obj).siblings().removeClass("btn-danger");
           }
       //$(obj).parent().find('a').removeClass('btn-danger');
//      if($(obj).parent().children().length>1){
//      	if($(obj).hasClass("btn-danger")){
//      	    $(obj).removeClass("btn-danger")
//         }else{
//         	   $(obj).addClass("btn-danger");
//         }
//      }else{
//      	$(obj).addClass("btn-danger");
//      }
        
        if(pars.length - cntnumber <= 1)
        {
            var ext = '';
            for(x in pars)
            {
                ext = pars[x];
            }
            if(ext != parname)
                p = $('.parselector[data-'+parname+'="'+parcontent+'"]');
            else
            {
                p = $('.parselector');
            }
            for(x in cnt)
            {
                if(x != ext)
                {
                    p = p.filter('[data-'+x+'="'+cnt[x]+'"]');
                }
            }
            $('.td_'+ext).find('span.selector').each(function(){
                var _this = this;
                $(_this).show();
                var s = parseInt(p.filter('[data-'+ext+'="'+$(_this).attr('data')+'"]').html());

                //if(pars.length > 1)
                //if(s != s || s < 1)$(_this).hide();
            });
        }
        p = $('.parselector');
        for(x in cnt)
        {
            p = p.filter('[data-'+x+'="'+cnt[x]+'"]');
        }
        //console.log(p.length);
        if(p.length == 1)
        {
            $('#itemnumber').html(p.html());
            $('#limit_number').html(p.attr('data-limit'));
            $('#itemprice').html('&yen'+p.attr('data-price'));
            $('#subbutton').attr('disabled',false);
            $('#itemid').val(p.attr('data-id'));
            $('#agreementid').val(p.attr('data-agrid'));
            if(p.attr('data-price') == '0.00')
            {
                $('#askbutton').show();
                $('#itemprice').html('需询价');
                $('#subbutton').attr('disabled',true).hide();
            }
            else
			{
				$('#askbutton').hide();
				$('#subbutton').attr('disabled',false).show();
			}
        }
        else
        {
            if(p.length < 1)
            $('#itemnumber').html('无货');
            $('#subbutton').val('无货');
            $('#itemprice').html($('#itemprice').attr('data-price'));
            /**
            if($('#itemprice').attr('data-price') == '0.00')
            {
				$('#askbutton').show();
			}
			 **/
        }
   
       if($("#itemnumber").text()=="0"){
	       $("#subbutton").attr("disabled",true);
	       $("#subbutton").css("background","#ddd");
          }else{
          	$("#subbutton").attr("disabled",false);
	       $("#subbutton").css("background","#009944");
          }
    }
    window.onload = function(){
    	$("#subbutton").click(function(){
    		//必填项总数
    		var requireParam = $(".xz").length,
    		//实际填写的总数
    		paramNo=0;
            //console.log(requireParam,isselcet);return false;
//    		$(".xz").each(function(){
//	    		 if($(this).children("a").hasClass("btn-danger")){
//	    		 	  paramNo ++;
//	    		 }
//         	})
    		// 必填项==实际填项？
    		//if(requireParam === paramNo){
            if(requireParam > 0 && isselcet == 1){
    			$("#subbutton").parents("form").submit();
    		}else{
    			var data = {
						result: false,
						message: '请勾选您要的商品信息'
					};
					$.zoombox.show('ajax', data);
					return false;
    		}
    		
    	})
    }

    $(function(){
        $(".jqzoom").jqueryzoom({
            xzoom:400,
            yzoom:400,
            offset:10,
            position:"right",
            preload:1,
            lens:1
        });
        $("#spec-list").jdMarquee({
            deriction:"left",
            width:350,
            height:56,
            step:2,
            speed:4,
            delay:10,
            control:true,
            _front:"#spec-right",
            _back:"#spec-left"
        });
        $("#spec-list img").bind("mouseover",function(){
            var src=$(this).attr("src");
            $("#spec-n1 img").eq(0).attr({
                src:src.replace("\/n5\/","\/n1\/"),
                jqimg:src.replace("\/n5\/","\/n0\/")
            });
            $(this).css({
                "border":"2px solid #ff6600",
                "padding":"1px"
            });
        }).bind("mouseout",function(){
            $(this).css({
                "border":"1px solid #ccc",
                "padding":"2px"
            });
        });
        $('.addbutton').bind("click",function(){
            var i = $(this).parent().find("input");
            var val = parseInt(i.val());
            val ++;
            i.val(val);
        });
        $('.removebutton').bind("click",function(){
            var i = $(this).parent().find("input");
            var val = parseInt(i.val());
            if(val >=2)
            {
                val--;
                i.val(val);
            }
        });
    })
</script>
<div class="modal fade" id="myModal" style="border-radius:0 !important;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<div class="xunjia-title text-center">立即询价</div>
			</div>
			<form id="askform" method="post" action="index.php?item-app-item-askprice">
				<div class="modal-body">
					<div class="text-center">
						<div class="com-name">询价</div>
						<div class="liuyan-content">
							<div class="record clearfix form_control">
								<div class="fl text-right">&nbsp;&nbsp;&nbsp;<span>*</span>联系人：</div>
								<input name="args[askitemname]" class="fl text-left" needle="needle" type="text" placeholder="请留下联系人姓名" msg="请留下联系人姓名"/>
							</div>
							<div class="record clearfix form_control">
								<div class="fl text-right"><span>*</span>联系电话：</div>
								<input name="args[askitemphone]" class="fl text-left" needle="needle" type="text" placeholder="请留下联系电话" msg="请留下联系电话"/>
							</div>
							<div class="record clearfix form_control">
								<div class="fl text-right"><span>*</span>联系邮箱：</div>
								<input name="args[askitememail]" class="fl text-left" needle="needle" datatype="email" msg="请留下联系邮箱" placeholder="请留下联系邮箱" data-tip="请输入您的邮箱" data-valid="isNonEmpty||isEmail" data-error="email不能为空||邮箱格式不正确"/>
							</div>
							<div class="record clearfix form_control">
								<div class="fl text-right">询价详情：</div>
								<div class="fl"><textarea name="args[askitemdesc]" cols="30" rows="3" ></textarea></div>
							</div>
							<div class="record clearfix form_control">
								<div class="fl text-right">我的地址：</div>
								<div class="fl form-inline">
									<!--
									<select id="provinces" target="cities" autoload="index.php?core-api-index-getProvince" class="form-control autoloaditem combox it-select" style="width:120px;" name="ads[provinceid]"  refUrl="index.php?core-api-index-getcity&parent={value}">
										<option value="">选择所在地区</option>
									</select>
									<select id="cities" target="areas" class="form-control combox it-select" style="width:120px;" name="ads[cityid]"  refUrl="index.php?core-api-index-getarea&parent={value}">
										<option value="">选择所在城市</option>
									</select>
									<select id="areas" current="{x2;$areaid}"  class="form-control it-select 110" style="width:120px;" name="ads[areaid]">
										<option value="">选择所在县区</option>
									</select>
									-->
									<input name="args[askitemaddress]" class="fl text-left" type="text" needle="needle" placeholder="请填写您的地址" msg="请填写您的地址"/>
									<input name="args[askitemitemid]" id="askitemid" type="hidden"/>
									<input name="askprice" value="1" type="hidden"/>
									<input name="args[askitemcompanyid]" value="{x2;$goods['goodsuserid']}" type="hidden"/>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn-green r20"> 发&nbsp;&nbsp;送 </button>
					<button type="button" class="btn-green" data-dismiss="modal"> 取&nbsp;&nbsp;消 </button>
				</div>
			</form>
		</div>
	</div>
</div>
<!--foot-->

{x2;include:menu}
{x2;include:footer2}
</body>
</html>