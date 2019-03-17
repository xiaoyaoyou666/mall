{x2;include:header}
<style>
    #find_pwd ul{
        width:auto;
        position: absolute;
        left: 50%;
        transform: translate(-50%);
    }

    ul li {
        text-align: left;
       line-height:40px;
    }
    ul label{
        margin-right:10px;
        font-weight: normal;

    }
    .send{
        margin-left:10px;
        width:120px;
        font-size: 13px;
        border: solid 1px #ff930e;
        background: rgba(255, 147, 14, 0.1)!important;
    }

    .form-inline .form-group {
        display: block;
        margin-bottom: 10px;
    }

    label {
        /*width: 150px;*/
        text-align: right;
    }
    .two_id{background: #009944!important;}
    #head_s p span{font-size: 20px;}
</style>
<body>
<header class="why-header">
    <div class="container">
        <ul class="pull-left">
            <li class="r40">欢迎访问天工e购电子商务平台</li>
            <!--<li><a>泛能解决方案服务</a><span>|</span></li>
            <li><a>运行服务</a><span>|</span></li>
            <li><a>设备交易</a><span>|</span></li>
            <li><a>能源交易</a><span>|</span></li>
            <li><a>增值服务</a></li>-->
        </ul>
        <p style="width: 130px;line-height: 30px;">
            <a href="http://www.tgcw.net.cn" target="_blank" style="border-left: none;display: block;margin-top: 6px;"><img style="width: 20px;float: left;margin-right: 5px;margin-top: 5px" src="app/core/styles/img/894201251291701630.png"/><i style="font-style: normal;color: #E9902A;">总平台</i></a>
        </p>
        <ul class="pull-right hr">
            <li><a href="javascript:;" onclick="javascript:$.loginbox.show();" class=""> 登录 </a></li>
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
        <div class="container" style="height:500px;">
            <div class="col-sm-12" id="head_s">
                <p><span class="two_id">1</span>验证身份</p>
                <p class="live_id"><span class="bg_ord">2</span>找回密码</p>
                <p><span>3</span>完成</p>
            </div>
            <div class="col-sm-12" id="find_pwd" style="position: relative;">
                <div>
                    <form class="form-inline">

                        <ul style="display: block;" id="one">
                            <li><img src="app/core/styles/images/i.png" style="width:16px;margin-right:6px;">请输入您要找回的登陆密码的帐户名或手机号</li>
                            <li><input style="padding-left: 10px;" type="text" id="username"></li>
                            <li><button type="submit" id="getuser" autocomplete="off" style="margin:50px 0 0 30px;">确定</button></li>
                        </ul>
                        <ul style="margin-top:30px;display: none;" id="two">
                            <li>手机验证码验证，账户<span id="name" class="name"></span>为确认是你本人操作，请完成以下验证</li>
                            <li><label>手机号码：</label><span id="mobile"></span></li>
                            <li><label>&nbsp;&nbsp;&nbsp;验证码：</label><input id="verCode" type="text" style="width:120px;padding-left: 10px;"><input style="width: 120px; background-color: #fef3e7!important;border: 1px solid #f0953a;" type="button" class="send" id="sendcodebtn" value="获取短信校验码" onclick="javascript:sendcode();"></li>
                            <li style="margin-top: 50px;"><button type="button" id="commitbtn" autocomplete="off">确定</button></li>
                        </ul>

                        <ul style="display:none;" id="three">
                            <div class="form-group">
                                <label style="width:150px;">新的登陆密码：</label>
                                <input style="padding-left: 10px;" type="password" autocomplete="off" id="pwd">
                            </div>
                            <div class="form-group">
                                <label style="width:150px;">确定新的登陆密码：</label>
                                <input style="padding-left: 10px;" type="password" autocomplete="off" autocomplete="off" id="repwd">
                            </div>
                            <button style="margin-top: 50px;" type="button" autocomplete="off" id="changepwd">确定</button>
                        </ul>

                    </form>
                </div>
            </div>
        </div>

<script>
    function goTop(){
        $('html,body').animate({'scrollTop':0},600);
    }
</script>
<script>
    $(function(){
        $('#commitbtn').on('click', function() {
            var userName = $("#name").text();
            var phono = $("#mobile").text();
            var verCode = $("#verCode").val();
            if(userName == ""){
                var data = {result: false, message: "请刷新页面重试"};
                $.zoombox.show('ajax', data);
                return false;
            }
            if(verCode == ""){
                var data = {result: false, message: "请输入验证码"};
                $.zoombox.show('ajax', data);
                return false;
            }
            var args = {};
            args['findpwd'] = 1;
            args['username'] = userName;
            args['company_mobile'] = phono;
            args['verCode'] = verCode;
            $.ajax({
                type: 'POST',
                data:args,
                dataType:'JSON',
                url: "index.php?user-app-login-findpwd",
                success:function(res){
                    console.log(res);
                    if(res.statusCode == 200){
                        $("#one").hide();
                        $("#two").hide();
                        $("#head_two").css("border-bottom","solid 4px #009944");
                        $(".live_id").css("border-bottom","solid 4px #009944");
                        $(".bg_ord").addClass("two_id");
                        $("#three").show();
                    }else{
                        var data = {result: false, message: res.message};
                        $.zoombox.show('ajax', data);
                        return false;
                    }
                },
                error: function(e){
                    console.log(e);
                }
            })
        });


        $("#getuser").on('click',function(){
            var userName = $("#username").val();
            if(userName == ''){
                var data = {result: false, message: '请输入要要找回的登录账号'};
                $.zoombox.show('ajax', data);
                return false;
            }
            $.ajax({
                type: 'GET',
                data: {username: userName},
                url: "index.php?user-app-login-ajaxgetuser",
                dataType: 'json',
                success: function (res) {
                    if(res.statusCode == 200) {
                        $("#one").hide();
                        $("#two").show();
                        $("#name").text(res.data.username);
                        $("#mobile").text(res.data.company_mobile);

                    }else{
                        var data = {result: false, message: res.message};
                        $.zoombox.show('ajax', data);
                    }
                }
            })
        });


        //重置密码
        $('#changepwd').on('click', function() {
            var userName = $("#name").text();
            var phono = $("#mobile").text();
            var verCode = $("#verCode").val();
            var pwd = $("#pwd").val();
            var repwd = $("#repwd").val();
            if(pwd == "" || pwd.length<8){
                var data = {result: false, message: "密码必须为8-20位"};
                $.zoombox.show('ajax', data);
                return false;
            }
            if(repwd != pwd){
                var data = {result: false, message: "两次密码不一致"};
                $.zoombox.show('ajax', data);
                return false;
            }
            if(userName == "" || phono == "" || verCode == ""){
                var data = {result: false, message: "请刷新页面重试"};
                $.zoombox.show('ajax', data);
                return false;
            }
            var args = {};
            args['username'] = userName;
            args['company_mobile'] = phono;
            args['verCode'] = verCode;
            args['userpassword'] = pwd;
            $.ajax({
                type: 'POST',
                data:args,
                dataType:'JSON',
                url: "index.php?user-app-login-changepwd",
                success:function(res){
                    console.log(res);
                    if(res.statusCode == 200){
                        window.location.href = 'index.php?user-app-login-finish';
                    }else{
                        var data = {result: false, message: res.message};
                        $.zoombox.show('ajax', data);
                        return false;
                    }
                },
                error: function(e){
                    console.log(e);
                }
            })
        });

    });





    function sendcode() {
        var phone = $("#mobile").text();
        var myreg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
        var endtime = 60;
        if (phone == '' || !myreg.test(phone)) {
            var data = {result: false, message: "手机号码格式不对"};
            $.zoombox.show('ajax', data);
            return false;
        }
        $.ajax({
            type: 'POST',
            data:{mobile:phone,action:'findpassword'},
            url: "index.php?core-api-index-sendcode",
            dataType: 'json',
            success: function (data) {
                if (data.statusCode != 200) {
                    var data = {result: false, message: data.message};
                    $.zoombox.show('ajax', data);
                    return false;
                }
                $('#sendcodebtn').val( endtime + '秒后重发');

                var v = setInterval(function () {
                    endtime--;
                    if (endtime > 0) {
                        $('#sendcodebtn').val( endtime + '秒后重发');
                    }
                    else {
                        clearInterval(v);
                        $('#sendcodebtn').val('重新发送');
                    }
                }, 1000);
            }
        });
    }
</script>
{x2;include:footer2}
</body>
</html>