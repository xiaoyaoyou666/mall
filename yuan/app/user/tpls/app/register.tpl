{x2;include:header}
<style>
	hr {
    width:auto!important;
    border: 1px dashed #ccc!important;
    position: relative;
    left: 0!important;
    margin-left: 0px;
    margin-top: 0px!important;
    border-top: 0px!important;
}
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
        <!--<ul class="pull-right hr">
            <li><a href="index.php?user-app-login"  class=""> 登录 </a></li>
            <li><a href="index.php?user-app-register">注册</a></li>
            <li><a href="" class="phone_icon"><img src="app/core/styles/images/qyhy/phone_icon.png"></a></li>
        </ul>-->
    </div>
</header>
<div class="clear"></div>
<form id="step1Form" class="form-horizontal" method="post" action="index.php?user-app-register">
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
                <img alt="" src="app/core/styles/images/login/regist-step01.png">
            </div>
            <div class="form-group">
                <h4 class="control-label col-md-4"><b>账户设置</b></h4>
            </div>

            <div class="form-group">
                <label class="control-label col-md-4"><span
                            class="hln-cue">*</span> 用户名</label>
                <div class="col-md-4">
                    <input class="form-control" value="{x2;$sessionData['username']}" type="text"id="userName" name="args[username]" placeholder="请输入用户名">
                </div>
                <div class="form-control-static clo-md-3 hln-cue" style="display: none;" id="namemsg">请正确用户名</div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-4"><span
                            class="hln-cue">*</span> 手机号</label>
                <div class="col-md-4">
                    <input class="form-control" value="{x2;$sessionData['company_mobile']}" type="text" id="phone" name="args[company_mobile]"  placeholder="请正确填写手机号">
                </div>
                <div class="form-control-static clo-md-3 hln-cue" style="display: none;" id="phonomsg">请正确填写手机号</div>
            </div>


            <div class="form-group">
                <label class="control-label col-md-4"><span
                            class="hln-cue">*</span> 验证码</label>
                <div class="col-md-2">
                    <input class="form-control" id="verCode" name="args[verCode]" needle="needle" msg="请输入正确的验证码" type="text" placeholder="请输入验证码">
                </div>
                <div class="col-md-1" style="padding:0;margin-left:-10px;margin-right:10px" id="sendcodebtn">
                    <a class="btn hln-btn-default fs" onclick="javascript:sendcode();" style="background: #009944;">发送验证码</a>
                </div>
                <div class="form-control-static clo-md-3 hln-cue" style="color: #555;">请根据手机短信提示填写验证码</div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-3"></label>
                <div class="col-md-7">
                    <hr style="border: 1px dashed #ccc;">
                </div>
            </div>

            <div class="form-group">
                <h4 class="control-label col-md-4"><b>密码设置</b></h4>
            </div>

            <div class="form-group">
                <label class="control-label col-md-4"><span
                            class="hln-cue">*</span> 登录密码</label>
                <div class="col-md-4">
                    <input class="form-control" value="{x2;$sessionData['userpassword']}" id="pwd" name="args[userpassword]" type="password" placeholder="请设置您的登录密码">
                </div>
                <div class="form-control-static clo-md-3 hln-cue" style="display: block;color: #555;" id="pwdmsg">必须为8-20位的英文字母、数字或符号，不能是纯数字</div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-4"><span
                            class="hln-cue">*</span> 确认密码</label>
                <div class="col-md-4">
                    <input class="form-control" value="{x2;$sessionData['userpassword']}" id="repwd" type="password" placeholder="请再次输入您的密码">
                </div>
                <div class="form-control-static clo-md-3 hln-cue" style="display: none;" id="repwdmsg">两次输入密码需一致</div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-3"></label>
                <div class="col-md-7">
                    <hr style="border: 1px dashed #ccc;">
                </div>
            </div>

            <!--<div class="form-group">
                <label class="control-label col-md-4"> 推荐码</label>
                <div class="col-md-4">
                    <input datatype="number" name="args[recommendCode]"
                           class="form-control" type="text" placeholder="请输入您的推荐码" id="recommendCode">
                </div>
                <div class="form-control-static clo-md-3 hln-cue" style="color:red;display:none;" id="recommendmsg">如您是推荐人介绍注册的，请输入推荐人的4位推荐码</div>
            </div>-->

            <div class="form-group hln-bottom-btn">
                <label class="control-label col-md-4"></label>
                <div class="col-md-3">
                    <button id="commitbtn" class="button_tt reg_button" type="button">下一步</button>
                </div>
            </div>
            <input type="hidden" name="userregister" value="1">
        </div>
    </div>
</form>
<script>
    function goTop(){
        $('html,body').animate({'scrollTop':0},600);
    }
</script>
<script>
    $(function(){
        $('#commitbtn').on('click', function() {
            var userName = $("#userName").val();
            var phono = $("#phone").val();
            var pwd = $("#pwd").val();
            var repwd = $("#repwd").val();
            var verCode = $("#verCode").val();
            var recommendCode = $("#recommendCode").val();

            if(userName == ""){
                $("#namemsg").show();
                return false;
            }else{
                $("#namemsg").hide();
            }
            var myreg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
            if(!myreg.test(phono))
            {
                $("#phonomsg").show();
                return false;
            }
            if(phono == ""){
                $("#phonomsg").show();
                return false;
            }else{
                $("#phonomsg").hide();
            }
            if(pwd == "" || pwd.length<8){
                $("#pwdmsg").css({color: "red"});
                return false;
            }else{
                $("#pwdmsg").css({color: "#555"});
            }
            var pwdreg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z_]{8,20}$/;
            if (!pwdreg.test(pwd)) {
                var data = {result: false, message: "密码格式不对"};
                $.zoombox.show('ajax', data);
                return false;
            }
            if(repwd == ""){
                $("#repwdmsg").show();
                return false;
            }else{
                $("#repwdmsg").hide();
            }
            if(repwd != pwd){
                $("#repwdmsg").show();
                return false;
            }else{
                $("#repwdmsg").hide();
            }
            //---推荐码验证----
            if(recommendCode){
                if(recommendCode.length!=4){
                    $("#recommendmsg").show();
                    return false;
                }
            }
            var args = {};
            args['userregister'] = 1;
            args['username'] = userName;
            args['company_mobile'] = phono;
            args['pwd'] = pwd;
            args['verCode'] = verCode;
            $.ajax({
                type: 'POST',
                data:args,
                dataType:'JSON',
                url: "index.php?user-app-register",
                success:function(res){
                    console.log(res);
                    if(res.statusCode == 200){
                        window.location.href = res.forwardUrl;
                    }else{
                        alert(res.message);
                        return false;
                    }
                },
                error: function(e){
                    console.log(e);
                }
            })
        })
    });

    function check2() {
        $("form").submit();
    }


    function check() {
        var userName = $("#userName").val();
        var phono = $("#phone").val();
        var pwd = $("#pwd").val();
        var repwd = $("#repwd").val();
        var recommendCode = $("#recommendCode").val();

        if(userName == ""){
            $("#namemsg").show();
            return false;
        }else{
            $("#namemsg").hide();
        }
        /*var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;*/
        var myreg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
        var myreg2 = /^[0-9]+$/;
        if(!myreg.test(phono))
        {
            $("#phonomsg").show();
            return false;
        }
        if(phono == ""){
            $("#phonomsg").show();
            return false;
        }else{
            $("#phonomsg").hide();
        }

        if(pwd == "" || pwd.length<8){
            $("#pwdmsg").css({color: "red"});
            return false;
        }else{
            $("#pwdmsg").css({color: "#555"});
            //$("#pwdmsg").hide();
        }

        if(myreg2.test(pwd)){
            $("#pwdmsg").css({color: "red"});
            return false;
        }else{
            $("#pwdmsg").css({color: "#555"});
            //$("#pwdmsg").hide();
        }


        if(pwd == "" || pwd.length>20){
            $("#pwdmsg").css({color: "red"});
            return false;
        }else{
            $("#pwdmsg").css({color: "#555"});
            //$("#pwdmsg").hide();
        }


        if(repwd == ""){
            $("#repwdmsg").show();
            return false;
        }else{
            $("#repwdmsg").hide();
        }
        if(repwd != pwd){
            $("#repwdmsg").show();
            return false;
        }else{
            $("#repwdmsg").hide();
        }

        //---推荐码验证----
        if(recommendCode){
            if(recommendCode.length!=4){
                $("#recommendmsg").show();
                return false;
            }   
        }
        
        
        $("form").submit();
    }



    $("#userName").blur(function(){
        var userName = $(this).val();
        if(userName != "") {
            $.ajax({
                type: 'GET',
                data: {userName: userName},
                url: "index.php?user-app-ajax-checkUserName",
                dataType: 'json',
                success: function (res) {
                    if(res.retCode !== 0) {
                        var data = {result: false, message: res.msg};
                        $.zoombox.show('ajax', data);
                    }
                }
            })
        }
    })

    /*$("#phone").blur(function(){
     var phone = $(this).val();
     if(phone != "") {
     $.ajax({
     type: 'GET',
     data: {phone: phone},
     url: "index.php?user-app-ajax-checkPhone",
     dataType: 'json',
     success: function (res) {
     if(res.retCode !== 0) {
     var data = {result: false, message: res.msg};
     $.zoombox.show('ajax', data);
     }
     }
     })
     }
     })*/

    function sendcode() {
        var phone = $("#phone").val();
        var myreg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
        var endtime = 60;
        if (phone == '' || !myreg.test(phone)) {
            var data = {result: false, message: "手机号码格式不对"};
            $.zoombox.show('ajax', data);
            return false;
        }
        $.ajax({
            type: 'POST',
            data:{mobile:phone,action:'reg'},
            url: "index.php?core-api-index-sendcode",
            dataType: 'json',
            success: function (data) {
                if (data.statusCode != 200) {
                    alert(data.message);
                    return false;
                }
                $('#sendcodebtn').html('<a href="javascript:;" class="btn hln-btn-default">' + endtime + '秒后重发</a>');

                var v = setInterval(function () {
                    endtime--;
                    if (endtime > 0) {
                        $('#sendcodebtn').html('<a href="javascript:;" class="btn hln-btn-default">' + endtime + '秒后重发</a>');
                    }
                    else {
                        clearInterval(v);
                        $('#sendcodebtn').html('<a class="btn hln-btn-default" onclick="javascript:sendcode();">重新发送</a>');
                    }
                }, 1000);
            }
        });
    }
</script>
{x2;include:footer2}
</body>
</html>