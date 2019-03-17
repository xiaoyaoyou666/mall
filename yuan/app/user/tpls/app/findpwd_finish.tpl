{x2;include:header}
<style>
    #head_s p:nth-child(2) {
        border-bottom: solid 4px #009944;
    }
    #head_s p:nth-child(3) {
        border-bottom: solid 4px #009944;
        
    }
    .two_id{background: #009944!important;}
    #head_s p span{font-size: 20px;}
</style>
<body>
<header class="why-header">
    <div class="container">
        <ul class="pull-left">
            <li class="r40">欢迎访问天工e购电子商务平台</li>
        </ul>
        <p style="width: 130px;line-height: 30px;">
            <a href="http://www.tgcw.net.cn" target="_blank" style="border-left: none;display: block;margin-top: 6px;"><img style="width: 20px;float: left;margin-right: 5px;margin-top: 5px" src="app/core/styles/img/894201251291701630.png"/><i style="font-style: normal;color: #E9902A;">总平台</i></a>
        </p>
        <ul class="pull-right hr">
            <li><a href="index.php?user-app-login&t=2"> 登录 </a></li>
            <li><a href="index.php?user-app-register">注册</a></li>
            <li><a href="" class="phone_icon"><img src="app/core/styles/images/qyhy/phone_icon.png"></a></li>
        </ul>
    </div>
</header>
<div class="clear"></div>
<form id="step1Form" class="form-horizontal" method="post" action="index.php?user-app-register">
    <div class="why-main-logo">
        <div class="container">
            <div class="pull-left">
                <a href="index.php"><img style="width: 258px;margin-left: 4px;" src="app/core/styles/images/index/login.png?" alt=""></a>
            </div>
            <h3 class="reg_h3" style="margin-top: 8px">找回密码</h3>
        </div>
    </div>
</form>
    <div class="container">
        <div class="col-sm-12" id="head_s">
            <p><span class="two_id">1</span>验证身份</p>
            <p ><span class="two_id">2</span>找回密码</p>
            <p><span class="two_id">3</span>完成</p>
        </div>
        <div class="col-sm-12" style="height:300px;">
            <div class="border_k">
                <p><img src="app/core/styles/images/wrong.png"></p>
                <p style="line-height:30px;margin-left:30px;">
                    <span>重置成功，请牢记新的登陆密码</span><br>
                    <a href="index.php?user-app-login&t=2">重新登陆</a>
                </p>
            </div>
        </div>
    </div>

<script>
    function goTop(){
        $('html,body').animate({'scrollTop':0},600);
    }
</script>
{x2;include:footer2}
</body>
</html>