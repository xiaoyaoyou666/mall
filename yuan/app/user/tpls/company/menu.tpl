<style>
	.left-content .mainmenu > li {
		background: #fff;
		color: #666;
		border: 1px solid #f2f2f2;
		text-align: left;
		padding-left: 15px;
		border-bottom: 0px;
	}
	.left-content .mainmenu > li img{
		width:18px;
		margin-right: 10px;
	}
	.left-content .submenu li {
		background: #ffffff;
		border: 1px solid #f2f2f2;
		border-bottom: 0px;
		border-top: 0px;
		text-align: left;
		padding-left:40px;

	}
	.left-content .submenu>li.active{
		color: #333;
        /*height:32px;
        line-height: 32px;*/
        background: url(app/core/styles/img/menu_icon/active.png) no-repeat;
        background-size:auto 50px;
        background-color:rgba(83,181,126,0.08);      
	}
</style>

<div class="left-content col2 pull-left text-center">
	<ul class="mainmenu">
		<li><img src="app/core/styles/img/menu_icon/icon_1.png"><span>企业中心</span></li>
		<ul class="submenu">
			<div class="expand-triangle"></div>
			<li><a class="bbb" href="?{x2;$_app}-company#formCentre"><span>主页管理</span></a></li>
			<li><a class="bbb" href="?{x2;$_app}-company-basic"><span>企业简介</span></a></li>
			<li><a class="bbb" href="?{x2;$_app}-company-basic-news"><span>企业动态</span></a></li>
			<li><a class="bbb" href="?{x2;$_app}-company-basic-product"><span>供货范围</span></a></li>
			<li><a class="bbb" href="?{x2;$_app}-company-basic-honour"><span>荣誉资质</span></a></li>
			<li><a class="bbb" href="?{x2;$_app}-company-basic-project"><span>成功案例</span></a></li>
			<li><a class="bbb" href="?{x2;$_app}-company-basic-contact"><span>联系我们</span></a></li>
			<li><a class="bbb" href="?{x2;$_app}-company-basic-information"><span>企业资质</span></a></li>
		</ul>
		<li><img src="app/core/styles/img/menu_icon/icon_2.png"><span>网格超市货架管理</span></li>
		<ul class="submenu">
			<div class="expand-triangle"></div>
			<li><a class="bbb" href="?{x2;$_app}-company-items"><span>货架维护</span></a></li>
			<li><a class="bbb" href="?{x2;$_app}-company-agreement-agreement"><span>框架协议</span></a></li>
			<!--  <li><a class="bbb" href="?{x2;$_app}-company-items-askitem"><span>我的询价</span></a></li> -->
		</ul>
		<li><img src="app/core/styles/img/menu_icon/icon_3.png"><span>询比价采购</span></li>
		<ul class="submenu">
			<div class="expand-triangle"></div>
			<li><a class="bbb" href="?{x2;$_app}-company-purchases-notice"><span>询价公告</span></a></li>
			<li><a class="bbb" href="?{x2;$_app}-company-purchases-offer"><span>报价管理</span></a></li>

		</ul>
		<li><img src="app/core/styles/img/menu_icon/icon_4.png"><span>订单管理</span></li>
		<ul class="submenu">
			<div class="expand-triangle"></div>
			<li><a class="bbb" href="index.php?{x2;$_app}-company-ordersbuy"><span>采购管理</span></a></li>
			<li><a class="bbb" href="index.php?{x2;$_app}-company-orders-mysale"><span>销售管理</span></a></li>
		</ul>
		<!--<li><span>招投标管理</span></li>-->
		<ul class="submenu">
			<!-- <div class="expand-triangle"></div>
            <li><span>发布招标信息</span></li>
            <li><span>我的招标</span></li>
            <li><span>我的投标</span></li> -->
		</ul>
		<li><img src="app/core/styles/img/menu_icon/icon_5.png"><span>账户管理</span></li>
		<ul class="submenu">
			<div class="expand-triangle"></div>
			<!-- <li><a class="bbb" href="?{x2;$_app}-company-privatement&a=1"><span>企业资料</span></a></li> -->
			<li><a class="bbb" href="?{x2;$_app}-company-privatement&a=2"><span>账户安全</span></a></li>
			<li><a class="bbb" href="index.php?user-company-privatement-test3"><span>钱包管理</span></a></li>
		</ul>

		<li><img src="app/core/styles/img/menu_icon/icon_6.png"><span>我的收藏</span></li>
		<ul class="submenu">
			<div class="expand-triangle"></div>
			<li><a class="bbb" href="?{x2;$_app}-company-items-goods"><span>我收藏的商品</span></a></li>
			<li><a class="bbb" href="?{x2;$_app}-company-items-supplier"><span>我收藏的供应商</span></a></li>
		</ul>
		<!--
		<li style="border-bottom: solid 1px #f2f2f2;"><img src="app/core/styles/img/menu_icon/icon_7.png"><span>供应商管理</span></li>
		<ul class="submenu">
			<div class="expand-triangle"></div>
			<li style="border-bottom: solid 1px #f2f2f2;"><a class="bbb" href="?{x2;$_app}-company-index-suplier_list"><span>供应商列表</span></a></li>
		</ul>
		-->
		<li style="border-bottom: solid 1px #f2f2f2;"><img src="app/core/styles/img/menu_icon/icon_7.png"><span>系统消息</span></li>
		<ul class="submenu">
			<div class="expand-triangle"></div>
			<li style="border-bottom: solid 1px #f2f2f2;"><a class="bbb" href="?{x2;$_app}-company-message-message"><span>站内信</span></a></li>
		</ul>
		<!--<li><span>帮助中心</span></li>-->
	</ul>
</div>
<script>
      window.onload = function(){
		 $(".active").parent("ul").prev("li").addClass("br_b");
		 
      }
</script>
