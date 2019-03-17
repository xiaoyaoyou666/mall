{x2;include:header}
<body>
<header class="why-header">
    <div class="container">
        <ul class="pull-left">
            <li class="r40">欢迎访问天润e购电子商务平台</li>
            <!--<li><a>泛能解决方案服务</a><span>|</span></li>
            <li><a>运行服务</a><span>|</span></li>
            <li><a>设备交易</a><span>|</span></li>
            <li><a>能源交易</a><span>|</span></li>
            <li><a>增值服务</a></li>-->
        </ul>
        <p style="width: 130px;line-height: 30px;">
            <a href="http://www.tgcw.net.cn" target="_blank" style="border-left: none;display: block;margin-top: 6px;"><img style="width: 20px;float: left;margin-right: 5px;margin-top: 5px" src="app/core/styles/img/894201251291701630.png"/><i style="font-style: normal;color: #E9902A;">总平台</i></a>
        </p>
        <!--<ul class="pull-right hr">
            <li><a href="index.php?user-company">个人中心</a></li>
            <li><a href="index.php?user-company">{x2;$_user['sessionusername']}</a></li>
            <li><a href="" class="phone_icon"><img src="app/core/styles/images/qyhy/phone_icon.png"></a></li>
        </ul>-->
    </div>
</header>
<div class="clear"></div>	<form class="form-horizontal">
    <div class="why-main-logo">
        <div class="container">
            <div class="pull-left">
                <a href="index.php"><img style="width: 258px;margin-left: 4px;" src="app/core/styles/images/index/login.png?" alt=""></a>
            </div>
            <h3 class="reg_h3" style="margin-top: 8px">企业账号注册</h3>
        </div>
    </div>
    <div class="register_box">
        <div class="container">
            <div class="form-group hln-head-img">
                <img alt="" src="app/core/styles/images/login/regist-step03.png">
            </div>

            <div class="tab-content hln-regist-success-content">
            	<img style="width: 56px;" src="app/core/styles/images/true_x.png" />
                <div class="form-group" style="margin: 20px 0;">
                	
                    <h3 class="hln-cue" style="font-size: 32px;color: #009944;margin: 20px 0;">  恭喜您注册成功</h3>
                    <p>平台将于2个工作日内审核您的企业入驻资料，现在可进入企业中心完善信息，审核通过后即可正常显示</p>
                </div>
                <div class="form-group hln-bottom-btn" style="margin-top: 20px;margin-left: 500px;">
                    <!--<label class="control-label col-md-4"></label>-->
                    <!--<div class="col-md-2" style="width: 26%;">
                        <button style="background:#0a8dea;" id="gozhongxins" class="button_tt reg_button">继续开通支付账户</a></button>
                    </div>
                    <div class="col-md-2">
                        <button id="gozhongxin" class="button_tt reg_button">企业中心</a></button>
                    </div>-->
                    <div class="col-md-2" style="width: 24%;">
                        <button id="goshouye" class="button_tt reg_button">返回首页</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    function goTop(){
        $('html,body').animate({'scrollTop':0},600);
    }

    $("#gozhongxin").click(function(){
        window.location.href = "index.php?user-company";
    });

    $("#goshouye").click(function(){
        window.location.href = "index.php?";
    });
//    $("#goshouyes").click(function(){
//      window.location.href = "index.php?";
//  });
</script>
{x2;include:footer2}
</body>
</html>