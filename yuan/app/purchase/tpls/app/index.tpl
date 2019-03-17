{x2;include:header}
<body>
{x2;include:nav}
<style>
        .caigou-list {
            width: 100% !important;
            margin: 0 !important;
        }
        .xunjia_li li:hover{
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
    	 .why-page li a:hover{
        background:#009944!important;
        border:solid 1px #009944;
    }
    .why-page li a {

        padding: 2px 12px;

    }
    	/*动画*/
@-webkit-keyframes bounce-down {
  25% {
    -webkit-transform: translateY(-6px);
  }
  50%, 100% {
    -webkit-transform: translateY(0);
  }
  75% {
    -webkit-transform: translateY(6px);
  }
}
@keyframes bounce-down {
  25% {
    transform: translateY(-6px);
  }
  50%, 100% {
    transform: translateY(0);
  }
  75% {
    transform: translateY(6px);
  }
}
.animate-bounce-down{
  -webkit-animation: bounce-down 2s linear infinite;
  animation: bounce-down 2s linear infinite;
}
.animate-bounce-downs{
  -webkit-animation: bounce-down 5s linear infinite;
  animation: bounce-down 5s linear infinite;
}
/**/
		.zmm-qydt-shsj1{position:relative;width: 100%;height:300px;min-width:1200px;background: url(app/core/styles/images/xun_jia.png) no-repeat;background-size: 100% 100%;}
		.xun_jiabj{width: 100%;}
		.search_s{width: 38%;position: absolute;left: 0;top:24px;z-index: 1;right: 0;margin: auto;}
		.text_s{width: 76%;float: left;}
		.button_tt{height: 39px;line-height: 39px;cursor: pointer;margin-left: 18px;width: 20%;}
		.xunjia_list{margin: 0 auto;}
		.xunjia_li{width: 100%;display: flex;flex-wrap: wrap;}
		.xunjia_li li{width: 18%;border:1px solid #ccc;margin:10px 10px;position: relative;}
		.company{padding: 6px 6px;line-height: 18px;border-bottom: 1px dashed #ccc;color: #666;font-weight: 500;font-size: 14px;}
		.list_xunjia{padding: 20px 8px;}
		.list_xunjia p{line-height: 20px;color:#000000;font-size: 14px;}
		.company_s{padding: 0px 6px 6px 6px;line-height: 20px;border-bottom: 1px dashed #ccc;color: #666;font-size: 12px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;}
		.company_s img{width: 15px;float: left;display: inline-block;margin: 2px 4px 0 0;}
		.offer{width: 60%;display:block;height: 30px;line-height: 30px;text-align: center;border:1px solid #009944;
		color: #009944;border-radius: 5px;margin:20px auto;}
		.offer:hover{background: #009944;color: #fff;}
		.offer_over{width: 60%;display:block;height: 30px;line-height: 30px;text-align: center;border:1px solid #ccc;
		color: #666;border-radius: 5px;margin:20px auto;}
		.left_xz{position: absolute;left: 114px;top:2px;width: 220px;}
		.left_xs{position: absolute;left: 99px;bottom:7px;width: 136px;}
		.right_xs{position: absolute;right: 121px;top:4px;width: 180px;}
		.right_zs{position: absolute;right: 109px;bottom:4px;width: 163px;}
		.broken{position: absolute;top:57px;padding: 30px 0;width: 0;overflow: hidden;}		
		.broken span{position: absolute;font-size:14px;color:#50bf81;white-space:nowrap;}
		.zx_pic{height: 194px;}
		/*.broken .xun_a{top:23px;left:444px}
		.broken .xun_c{top:153px;left:513px}
		.broken .xun_b{top:8px;left:576px}
		.broken .xun_d{top:44px;left:662px}
		.broken .xun_e{top:135px;left:723px}
		.broken .xun_f{top:40px;left:790px}
		.div_img{position: absolute;top:53px;left: 890px;color:#50bf81 ;font-size: 14px; white-space:nowrap;}
		.div_img img{width: 30px;margin-right: 10px;}*/
		.ani{transition: width 2s linear;}
		/*空警告*/
		.empty-box{
			display: flex;
			border: 1px solid #ebebeb;
			border-radius: 4px;
			padding: 30px 0;
		}
		.empty-box .empty-item{
			flex: 1;
		}
		.empty-box .empty-item:first-child{
			padding-left: 0px;
			text-align: right;
			padding-right: 15px;
		}
		.empty-box .empty-item:last-child{
			padding-left: 15px;
		}
		.empty-box .empty-title{
			font-size: 16px;
			margin-bottom: 20px;
			font-weight: bold;
			color: #666;
		}
		.empty-box .empty-item ul li{
			color: #999;
		}
		.text_z{line-height: 35px;text-align: center;}
		.text_zs{overflow : hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp:2;
        -webkit-box-orient: vertical;}
        .ym_on{background: #009944;color: #fff!important;}
    .trsb{width: 70px;position: absolute;right: 0;bottom: 0;z-index: 500;}
    .opci{opacity: 0.8;}
</style>
<script type="text/javascript">
	$(window).resize(function() {
		$(".zx_pic").width($(window).width());
		$(".broken").width($(window).width());
		if($(window).width()<1200){
			$(".zx_pic").attr("src","app/core/styles/images/broken2.png");
		}
	});
	$(document).ready(function(){
		anmit();
			setInterval(function(){
				if($(".broken").width()=='100%'){
				}else{
					anmit();
				}
			},3000)
			setInterval(function(){
				anmit();				
			},3000)
			function anmit(){
				if($(".broken").width()==0){
					$(".broken").show()
					$(".broken").css("width","100%");
					$(".broken").addClass("ani");
				}else{
					$(".broken").hide()
					$(".broken").removeClass("ani");					
					$(".broken").css("width","0");
				}
			}
			 $(".company").each(function(i,item){
				if($(item).text().length<14){
					$(item).addClass("text_z")
				}else{
					$(item).addClass("text_zs");
					$(item).removeClass("text_z");
				}
		});
		if($(window).width()>1650){
			$(".zx_pic").attr("src","app/core/styles/images/broken.png");
			$(".zmm_panel").width(1500);
			$(".list_xunjia p").css("line-height","30px");
		}
		$(".zx_pic").width($(window).width());
		$(".broken").width($(window).width());
	})
</script>
<div style="background-color: #fff; width: 100%;">
    <div class="container" style="width: 100%;">
        <div class="pull-left" style="width: 100%;">
            <!--采购信息-->
            <!--修改-->
                <div class="zmm-qydt-title zmm-qydt-shsj1" style="position: relative;">
                	<div style="clear: both;"></div>
                	<div class="search_s"><input placeholder="搜索询价标题" class="form-control text_s" type="text" name="" id="" value="" />
                	<span class="button_tt" id="tosearchs">搜&nbsp;&nbsp;索</span></div>
                	<img class="left_xz animate-bounce-downs" src="app/core/styles/images/left_1.png"/>
                	<img class="left_xs animate-bounce-down" src="app/core/styles/images/left_2.png"/>
                	<img class="right_xs animate-bounce-downs" src="app/core/styles/images/right_1.png"/>
                	<img class="right_zs animate-bounce-down" src="app/core/styles/images/right_2.png"/>
                	<div class="broken">
						<img class="zx_pic" src="app/core/styles/images/broken1.png"/>
                	</div>            
                </div>
            <!---->
            <div class="zmm_panel panel-default t20" style="width: 1180px;padding-bottom:0px;margin:10px auto 0;border: none;">    
				{x2;if:$contents['data']}
                <div class="xunjia_list" style="width: 100%;">
                	<ul class="xunjia_li">
                        {x2;tree:$contents['data'],content,cid}
                		<li>

                			
                			
                			<p class="company" style="height: 46px;">{x2;v:content['xunjia_title']}</p>
                			<div class="list_xunjia">
	                			<p class="type">询价类型：{x2;if:v:content['xunjia_type']==1}邀请询价{x2;else}公开询价{x2;endif}</p>
	                			<p class="type_time">发布时间：{x2;date:v:content['create_time'],'Y-m-d'}</p>
	                			<p class="type_time">截至时间：{x2;date:v:content['end_time'],'Y-m-d'}</p>
                			</div>
                			<div class="company_s">
                				<img src="app/core/styles/images/city.png"/>{x2;v:content['company_name']}
                			</div>
							{x2;if:v:content['is_show']==1}
								{x2;if:v:content['status']==3}
									<p class="offer_over">已完成</p>
									<!--已完成-->
                					<img class="trsb" src="app/core/styles/images/true2.png"/>
								{x2;elseif:v:content['status']==4 || v:content['time']==0}
									<p class="offer_over">已截止</p>
									<!--已截至-->
                					<img class="trsb opci" src="app/core/styles/images/true3.png"/>
								{x2;else}
									<a class="offer" href="index.php?purchase-app-content&id={x2;v:content['id']}">我要报价</a>
								{x2;endif}
							{x2;else}
                                {x2;if:v:content['status']==3}
									<p class="offer_over">已完成</p>
									<!--已完成-->
                					<img class="trsb" src="app/core/styles/images/true2.png"/>
								{x2;elseif:v:content['status']==4 || v:content['time']==0}
									<p class="offer_over">已截止</p>
									<!--已截至-->
                					<img class="trsb opci" src="app/core/styles/images/true3.png"/>
								{x2;else}
									<p class="offer_over">未收到邀请</p>
									<!--未收到邀请-->
                					<img class="trsb" src="app/core/styles/images/true1.png"/>
								{x2;endif}
							{x2;endif}
                		</li>
                        {x2;endtree}
                	</ul>
                </div>
				{x2;else}
				<!--空警告-->
				<div class="empty-box" style="margin-top: 14px;margin-bottom: 14px">
					<div class="empty-item" style="width: 200px;">
						<img src="app/core/styles/img/empty_offer.png" alt="">
					</div>

					<div class="empty-item">
						<p class="empty-title">非常抱歉，没有找到与搜索内容相符的内容</p>
						建议您：
						<ul>
							<li>1、判断输入的文字是否有误</li>
							<li>2、尝试一下其他相关字段</li>
							<li>3、拆分要搜索的关键词，分成几个词语再次搜索</li>
						</ul>
					</div>
				</div>
				{x2;endif}
                <!--分页-->
                <div class="why-page text-center t40">
                    <ul class="">
                        {x2;$contents['pages']}
                    </ul>
                </div>
                <!---->
                
            </div>
        </div>
    </div>
</div>
<script>
    $('#tologin').on('click',function(){
        var username = $('#username').val();
        var userpassword = $('#userpassword').val();
        $.ajax({
            type:'get',
            url: 'index.php?user-app-login-login&un='+username+'&up='+userpassword,
            dataType:'JSON',
            async:true,
            success:function(res){
                console.log(res);
                if(res.statusCode == 201){
                    var data = {result: false, message: "登录成功"};
                    $.zoombox.show('ajaxOK', data);
                    setTimeout(function(){
                        window.location.href = 'index.php?purchase'
                    }, 2000);
                    return false;
                }else{
                    var message = res.message;
                    var data = {result: false, message: message};
                    $.zoombox.show('ajax', data);
                    return false;
                }
            },
            error: function(e){
                console.log(e);
            }
        })
    })

    $(function(){
        var i=0;
        $('.why-ph-list li').each(function(){
          i++;
          //$(this).find('span').html(i);
          if(i==1){
            $(this).find('span').html("<img src='app/core/styles/images/cg-ph0"+i+".jpg'>");
          }else if(i==2){
            $(this).find('span').html("<img src='app/core/styles/images/cg-ph0"+i+".jpg'>");
          }else if(i==3){

            $(this).find('span').html("<img src='app/core/styles/images/cg-ph0"+i+".jpg'>");
          }else{
            $(this).find('span').html(i);
          }
          
        })


        $(".caigou-list li div").each(function () {
            var div_width = $(this).width();
            console.info("div width:" + div_width);
            var sum_width = 0;
            $(this).children().each(function (index,item) {
               //console.info(index+"~~~"+$(item).width())
                sum_width += $(item).width();
            })
            if(sum_width > div_width){
                var firstchid_width = $(this).children().eq(0).width();
                var lastchid_width = $(this).children().eq(2).width();
                var titleWidth = div_width-firstchid_width-lastchid_width-40;
                $(this).children().eq(1).css({width:titleWidth,display:'inline-block'});
            }
        })
        //搜索
        $('#tosearchs').on('click',function(){
	        var searchType = $("#searchType").val();
	        var searchKeyword = $(".text_s").val();
	        var url = '';
	        if(searchKeyword == ''){
	            var data = {result: false, message: "请输入关键字!"};
	            $.zoombox.show('ajax', data);
	            return false;
	        }
	        window.location.href = 'index.php?purchase-app-index&stype=1&keyword='+searchKeyword;
    	})
  });

</script>

{x2;include:footer2}
</body>
</html>