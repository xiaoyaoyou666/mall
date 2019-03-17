{x2;include:header}
<style type="text/css">

.url_a{font-size:24px;color:#323232;text-align: center;margin: 25px 0 11px 0;}
.timer_s{font-size:14px;color:#666666;text-align: center;}
.ul_list{margin:10px 20px 0 20px;}
.ul_list li{font-size:14px;color:#323232;line-height: 40px;}
.tab_cd{width: 500px;margin: 20px 22px;border: 1px solid #ddd;}
.tab_po thead{background:#f5f5f5;}
.tab_po tr  td{border:none!important;word-wrap:break-word;}
.tab_po tr{border-bottom: 1px solid #ddd;padding-right: 20px;}
.original{font-size: font-size:14px;color:#323232;padding: 20px 0 20px 20px;}
.original img{width: auto;height: 17px;float: left;margin-top: 4px;}
.tbdy tr{height: 30px}
.overFlow{height:214px;overflow: auto;}
.ul_head{width: 100%;}
.ul_head{background:#f5f5f5 ;}
.ul_head li{float: left;padding: 4px 8px;}
.table_content{width: 100%;}
</style>
<body>
{x2;include:nav}
<script type="text/javascript">
	$(document).ready(function(){
//		console.log($(".tab_po").height()===214)
		 $("tbody tr:last").css("border-bottom","none");
		 if($(".tab_po").height()>214){
		 	$(".table_content").addClass("overFlow");
		 	$(".td_three").css("paddingLeft","15px");
		 	$(".td_fore").css("paddingLeft","20px");
		 }else{
		 	$(".table_content").removeClass("overFlow");
		 }
	})
</script>
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?{x2;$_app}-company">企业中心</a>&nbsp;>&nbsp;<a>网格超市货架管理</a>> <a href="index.php?user-company-agreement-agreement">框架协议</a>><a>{x2;$agreement['filename']}</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right">
                <div>
                    <div class="zmm_panel panels-default cybershop-shelf-maintenance">
                    	<p class="url_a">{x2;$agreement['filename']}</p>
                   		<p class="timer_s">上传时间：{x2;date:$agreement['addtime'],'Y-m-d H:i:s'}</p>
                   		<ul class="ul_list">
                   			<li>协议编码：{x2;$agreement['agreement_number']}</li>
                   			<li>甲      &nbsp; &nbsp; &nbsp; 方：{x2;$agreement['salername']}</li>
                   			<li>乙       &nbsp; &nbsp; &nbsp; 方：{x2;$agreement['username']}</li>
                   			<li>有 &nbsp;效 &nbsp;期：{x2;date:$agreement['starttime'],'Y-m-d'}至{x2;date:$agreement['endtime'],'Y-m-d'}</li>
                   			<li>付款条款：{x2;$agreement['payment_text']}</li>
                   			<li>协议商品：</li>
                   		</ul>
                   		<div class="tab_cd">
                   			<ul class="ul_head">
                   				<li style="width:15%;">物料编码</li>
                   				<li style="width:30%">商品名称</li>
                   				<li style="width:30% ;">规格</li>
                   				<li style="width: 20%">协议价</li>
                   			</ul>
                   			<div class="table_content">
	                   			<table  width="100%"  style="border: none;margin-bottom: 0;width: 100%;table-layout:fixed;" class="table table-hover table-bordered tab_po">
		                   			<!--<thead>
		                   				<tr>
		                   					<td width="15%">物料编码</td>
		                   					<td width="30%">商品名称</td>
		                   					<td width="30%">规格</td>
		                   					<td width="25%">协议价</td>
		                   				</tr>
		                   			</thead>-->
		                            <tbody>
	                                   {x2;tree:$goods,good,gid}
		                                <tr>
		                   					<td width="15%">{x2;v:good['FJLSBJCL_WLBH']}</td>
		                   					<td width="30%">{x2;v:good['goodstitle']}</td>
		                   					<td class="td_three" width="30%">{x2;v:good['FJLSBJCL_XHGG']}</td>
		                   					<td class="td_fore"  width="25%">¥{x2;v:good['agreement_price']}</td>
		                   				</tr>
	                                    {x2;endtree}
	                                  	               		                   					                   			
		                            </tbody>
	                        	</table>
                   			</div>
                   		</div>
                   		<p class="original">合同原件：<a target="_blank" title="{x2;$agreement['file']}" id="file_a"><img src="app/core/styles/images/search_a.png"/>&nbsp;查看</a></p>
                    </div>
                </div>
                <!--我的模块结束-->
            </div>
        </div>
        <!-- 右侧  end -->
    </div>
</div>
</div>

{x2;include:footer2}
<script>
    $("#file_a").click(function(){
        	var a=$(this).attr("title");        
            $(this).attr("href","?{x2;$_app}-company-privatement-test2&"+a);
       })
</script>
</body>

</html>
