<style type="text/css">
    .back_icon{background: url(app/core/styles/images/back_icon.png) no-repeat;width: 16px;height: 16px;display: inline-block;}
    .back_icona{background: url(app/core/styles/images/修改.png) no-repeat;width: 16px;height: 16px;display: inline-block;}
#u2 li{clear: both;}
</style>
<script type="text/javascript">
	$(window).resizeend(function() {  
	
	});
    $(document).ready(function(){ 
　       $("#u2 li").on("click",function(){
//              alert(2)
            if($(this).find($("em")).hasClass("layui-icon layui-icon-right")){
                $(this).find($("em")).removeClass("layui-icon layui-icon-right").addClass("layui-icon layui-icon-down");
                $(this).find($("em")).attr("class","layui-icon layui-icon-down").parent().parent().siblings().find($("em")).attr("class","layui-icon layui-icon-right");        
            }else{
                $(this).find($("em")).attr("class","layui-icon layui-icon-down").parent().parent().siblings().find($("em")).attr("class","layui-icon layui-icon-right");
                $(this).find($("em")).removeClass("layui-icon layui-icon-down").addClass("layui-icon layui-icon-right");                
            }

        })
    });  
</script>
<header>
    <div id="logo">
        <a href="index.php" style="display:inline-block;width:220px;text-align:center;" id="a"><img style="width: 182px;" src="app/core/styles/admin/images/bj.png"></a>
    </div>
    <ul id="u1">
        {x2;if:$_user['userid']}
        <li><a class="ajax" href="index.php?user-app-logout"><em class="glyphicon glyphicon-log-out"></em> 退出</a></li>
        <li>
            <a href="javascript:;" class="admin-header-user">
                <!-- <img src="images/0.jpg" /> -->
                <span>{x2;$_user['username']}</span>
            </a>
            <ul style="display:none;">
                <li><a href="javascript:;">个人信息</a></li>
                <li><a href="javascript:;">设置</a></li>
                <li><a href="login.html">注销</a></li>
            </ul>
        </li>
        {x2;else}
        <li><a href="javascript:;" onclick="javascript:$.loginbox.show();" class="btn btn-default"> 登 录 </a></li>
        {x2;endif}
    </ul>
</header>
<nav>
    <ul id="u2">
        <li><span><a href="index.php?core-master"><i class="layui-icon layui-icon-home"></i>首页</a></span></li>
        <li>
            <span><i class="layui-icon layui-icon-component"></i>供应商管理<em style="float:right;margin-right: 14px" class="layui-icon layui-icon-right"></em></span>
            <ul class="ul2">
                <li><a href="index.php?user-master-user"><i class="layui-icon layui-icon-group"></i>用户管理</a></li>
                <li><a href="index.php?user-master-user-position"><i class="layui-icon layui-icon-praise"></i>推荐位管理</a></li>
                <li><a href="index.php?user-master-user-loginlog"><i class="layui-icon layui-icon-release"></i>登录日志</a></li>
                <li><a href="index.php?user-master-user-sisters"><i class="layui-icon layui-icon-star"></i>供应商收藏排行榜</a></li>
            </ul>
        </li>
        <li>
            <span><i class="layui-icon layui-icon-template-1"></i>商品管理<em style="float:right;margin-right: 14px" class="layui-icon layui-icon-right"></em></span>
            <ul class="ul2">
                <li><a href="index.php?item-master-items"><i class="layui-icon layui-icon-form"></i>商品管理</a></li>
                <li><a href="index.php?item-master-category" ><i class="layui-icon layui-icon-app"></i>商品类目管理</a></li>
                <li><a href="index.php?item-master-items-collect"><i class="layui-icon layui-icon-star"></i>商品收藏排行</a></li>
                <li><a href="index.php?item-master-brands"><i class="layui-icon layui-icon-fire"></i>品牌管理</a></li>
                <li><a href="index.php?item-master-module"><i class="layui-icon layui-icon-file"></i>模型管理</a></li>

            </ul>
        </li>
         <li>
            <span><i class="layui-icon layui-icon-tree"></i>协议管理<em style="float:right;margin-right: 14px" class="layui-icon layui-icon-right"></em></span>
            <ul class="ul2">
                <li><a href="index.php?agreement-master-agreement-agreement"><i class="layui-icon layui-icon-chart-screen"></i>协议管理</a></li>
                <li><a href="index.php?agreement-master-agreement-agreementJournal" ><i class="layui-icon layui-icon-engine"></i>操作日志</a></li>
                <li><a href="index.php?agreement-master-agreement-agreementapply"><i class="layui-icon layui-icon-file"></i>操作申请</a></li>
            </ul>
        </li>
          <li>
            <span><i class="layui-icon layui-icon-file-b"></i>订单管理<em style="float:right;margin-right: 14px" class="layui-icon layui-icon-right"></em></span>
            <ul class="ul2">
                <li><a href="index.php?core-master-audit"><i class="layui-icon layui-icon-list"></i>订单列表</a></li>
                <li><a href="index.php?core-master-audit-statistics"><i class="layui-icon layui-icon-templeate-1"></i>订单统计</a></li>
                <li><a href="index.php?core-master-audit-set"><i class="layui-icon layui-icon-set-sm"></i>订单设置</a></li>
            </ul>
        </li>
        <li>
            <span><i class="layui-icon layui-icon-app"></i>系统管理<em style="float:right;margin-right: 14px" class="layui-icon layui-icon-right"></em></span>
            <ul class="ul2">
                <li><a href="index.php?content-master-contents"><i class="layui-icon layui-icon-picture"></i>banner位管理</a></li>
                <li><a href="index.php?content-master-statistics"><i class="layui-icon layui-icon-util"></i>首页四个数据修改</a></li>
                <li><a href="index.php?user-master-user-searchcount"><i class="layui-icon layui-icon-search"></i>搜索关键字数据</a></li>
                <li><a href="index.php?user-master-user-systemmessage"><i class="layui-icon layui-icon-dialogue"></i>发送系统消息</a></li>
                <li><a href="index.php?user-master-user-messageList"><i class="layui-icon layui-icon-dialogue"></i>公告消息列表</a></li>
                <li><a href="index.php?content-master-link" ><i class="layui-icon layui-icon-link"></i>友情链接管理</a></li>
                <li><a href="index.php?content-master-complaint" > <i class="layui-icon layui-icon-tips"></i>投诉反馈</a></li>
            </ul>
        </li>

        <!-- <li>
            <span><a href="index.php?core-master-index-old" ><i class="layui-icon layui-icon-home"></i>首页（旧版系统）</a></span>
        </li> -->
    </ul>
</nav>
<!--<script type="text/javascript">
        $("#u2 li").on("click",function(){
        alert(1)
    })
</script>-->