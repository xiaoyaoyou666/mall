<header class="b86">
    <div class="container">
        <div class="col-xs-12 header_top">
            <p>
                {x2;if:$_user['userid']}
                {x2;if:$_user['company_name']}
                <a href="index.php?user-company" style="border: 0;color:#ff8a00;">{x2;$_user['company_name']}</a> 欢迎您!{x2;$_user['userid']}
                {x2;else}
                <a href="index.php?user-company" style="border: 0;color:#ff8a00;"> {x2;$_user['username']}</a> 欢迎您!
                {x2;endif}
                {x2;else}
                欢迎访问天工e购电子商务平台{x2;$_user['userid']}
                {x2;endif}
            </p>

            <ul class="full_right">
                {x2;if:$_user['userid']}
                <li class="msg_hover"><a href="index.php?user-company-message-message" style="border-left:0px;padding:0px;"><img src="app/core/styles/images/index/msg2.png"><span style="color: #ff0000;padding-left:5px;">{x2;$msgnum}</span></a></li>
                <li><a href="index.php?user-company" style="padding-left:15px;">企业中心</a></li>
                    {x2;if:$_user['usergroupid'] == 1}
                    <li><a href="index.php?core-master">后台管理</a></li>
                    {x2;endif}
                <li><a class="ajax" href="index.php?user-app-logout">退出登录</a></li>
                <li><a href="index.php?user-company">{x2;$_user['username']}</a></li>
                {x2;else}
                <li><a href="index.php?user-app-login"> 登录 </a></li>
                <li><a href="index.php?user-app-register">注册</a></li>
                {x2;endif}
                <li class="phone" style="-webkit-transition:all 0s;">
                    <a href="" class="phone_icon"><img src="app/core/styles/images/qyhy/phone_icon.png"></a>
                    <div id="alert_phone">
                        010-57672968
                        010-57672985
                        010-57672819
                        010-57672724
                    </div>
                </li>
            </ul>
        </div>
        <div class="col-xs-12 header-bottom">
            <ul>
                <li>
                    <a href="index.php"><img src="app/core/styles/images/index/login.png" alt=""></a>
                </li>
               <!--  <li><a href="index.php">首页</a></li> -->
                <li><a href="index.php?item">网格超市</a></li>
                <li><a href="index.php?company-app-index">供应商展示</a></li>
                <li><a href="index.php?purchase">采购寻源</a></li>
               <!--  <li><a href="index.php?company-app-index">供应商展示</a></li> -->
                <!-- <li><a href="index.php?item">网格超市</a></li> -->
                <!-- <li><a target="_blank" href="http://zhaobiao.tgcw.net.cn/cms/index.htm">招投标</a></li> -->
                <li><a href="index.php?content-app-content-wait">招投标</a></li>
            </ul>

        </div>
    </div>
</header>
<div style="position: relative;border-top:4px solid #009944;"></div>
<script type="text/javascript">
    $(function(){
        var searchKeyword = $("#searchKeyword").val();
        if(searchKeyword == ''){
            $("#tab_search a:first-child").addClass('tab_on');
            $("#searchType").val(1);
        }
    });
    $("#tab_search a").on('click',function(){
        $("#tab_search a").removeClass('tab_on');
        $(this).addClass('tab_on');
        $("#searchType").val($(this).attr('value'));
    })

    function doSearch()
    {
        var searchType = $("#searchType").val();
        var searchKeyword = $("#searchKeyword").val();
        var url = '';
        if(searchKeyword == ''){
            var data = {result: false, message: '请输入关键字'};
            $.zoombox.show('ajax', data);
            return false;
        }
        switch(Number(searchType))
        {
            case 1:
                url = 'index.php?purchase-app-index&stype=1&keyword='+searchKeyword;
                break;
            case 2:
                url = 'index.php?company-app-index&stype=2&keyword='+searchKeyword;
                break;
            default:
                url = 'index.php?purchase-app-index&stype=3&keyword='+searchKeyword;
        }
        window.location.href = url;
    }

        $(".phone a").mouseover(function() {
                $(this).css("border-left", "solid 1px #fff");
                $(this).parent("li").css({
                    "background-color": "#fff",
                    "border-right": "solid 1px #ccc",
                    "border-left": "solid 1px #ccc"
                });
                $("#alert_phone").show();
            });
            $(".phone a").mouseout(function() {
                $(this).css({
                    "border-left": "solid 1px #ccc"
                });
                $(this).parent("li").css({
                    "background-color": "#ebebeb",
                    "border": "0px",
                    "border-right": "solid 1px #ebebeb",
                    "border-left": "solid 1px #ebebeb"
                });
                $("#alert_phone").hide();
            });

    $(".msg_hover").hover(function(){

        $(this).find("img").attr("src","app/core/styles/images/index/msg1.png")
    },function(){
        $(this).find("img").attr("src","app/core/styles/images/index/msg2.png")
    })


</script>