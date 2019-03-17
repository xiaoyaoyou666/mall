<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>天工e购登录页</title>
		<!-- <meta name="viewport" content="width=device-width, initial-scale=1">-->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/login.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/fpeskin.css" />
		<script src="app/core/styles/js/jquery.min.js"></script>
		<script src="app/core/styles/js/jquery-ui.min.js"></script>
		<script src="app/core/styles/js/bootstrap.min.js"></script>
		<script src="app/core/styles/js/plugin2.js"></script>
		<style type="text/css">
			.modalCenter {
				position: fixed;
				top: 50%;
				left: 50%;
				transform: translateX(-50%) translateY(-50%);
			}
			
			.modal-header {
				border-bottom: 0 !important;
			}
			
			.modal-footer {
				text-align: center;
				border-top: 0 !important;
			}
			
			.modal-body {
				padding: 5px 15px !important;
			}
			
			.xunjia-title {
				width: 140px;
				border-bottom: 2px solid #009944;
				margin-top: 30px;
				margin-left: calc(50% - 70px);
				font-size: 16px;
				color: #323232;
			}
			
			.btn-green {
				width: 90px;
				height: 34px;
				background-color: #009944;
				color: #fff;
				border-radius: 1px;
			}
			
			@keyframes myAni {
				0% {
					transform: rotate(0deg);
				}
				100% {
					transform: rotate(360deg);
				}
			}
			
			input {
				text-fill-color: #fff!important;
				color: #fff!important;
			}
		</style>
	</head>

	<body>
		<!--<header class="col-md-12">
	<ul>
		<li><img src="app/core/styles/images/login/login.png"></li>
		<li class="w_login">
			<h3>欢迎登录</h3>
		</li>
	</ul>
</header>-->
		<div class="col-md-12 login-center">
			<div class="container">
				<div class="content_left">
					<img src="app/core/styles/images/login/tr.png" style="margin-top:37px;">
					<br>
					<img src="app/core/styles/images/login/tr2.png">
					<ul class="imgs">
						<li id="f">
							<div class="wrap"><img src="app/core/styles/images/login/f.png" class="fengc"></div>
						</li>
						<li class="sed_imgs"><img src="app/core/styles/images/login/bot.png"></li>
					</ul>
				</div>
				<div class="content_right">
					<h3>欢迎登录</h3>
					<p style="margin-bottom:40px;margin-top:25px;font-size:18px;">
						<span>想要获取更多的商机</span><br><span>及企业信息，请先登录平台账号</span>
					</p>
					<div>
						<p class="p_user"><input type="text" placeholder="请输入您的用户名" class="user" name="username" id="username" style="font-size: 20px;" value="{x2;$username}"></p>
						<p class="p_pwd"><input type="password" placeholder="请输入您的密码" class="pwd" name="userpassword" id="userpassword" style="font-size: 20px;" value="{x2;$pwd}">
							<div class="form-control-static clo-md-3 hln-cue" style="display: none;color:red;" id="pwdmsg">必须为8-20位的英文字母、数字或符号，不能是纯数字</div>
						</p>
						<input type="hidden" id="sessionid" value="">
						<input type="hidden" id="type2" value="{x2;$type2}">
						<p class="inputs" style="width:300px;">
							<input id="pass_word" type="checkbox" name="remember" {x2;if:$username}checked{x2;endif} style="float:left;margin-top:0.5em;">记住密码
							<a href="index.php?user-app-register" style="margin-left:20px;">免费注册</a>
							<a href="index.php?user-app-login-findpwd">忘记密码</a>
						</p>
						<p class="login_button" id="tologin">登录</p>
					</div>
				</div>
			</div>
		</div>
		<footer style="clear: both;">
			<span style="display:block;background:#ddd;">粤ICP备 18083013号 ©天工开物网络技术服务(深圳)有限公司 </span>
		</footer>

	</body>

	<div class="modal fade modalCenter" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
					<div class="xunjia-title text-center">
						<h4>提示</h4></div>
				</div>
				<div class="modal-body text-center">

				</div>
				<div class="modal-footer">
					<button type="button" class="btn-green r20" data-dismiss="modal"> 确&nbsp;&nbsp;定 </button>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="modal-dialog" id="loginModal" role="document" style="width:362px;margin-top:160px;height:261px;border: 1px solid #ccc;border-radius: 5px;"><div class="modal-content" style="width:362px;height:263px"><div style="border:0px;width:362px;height:268px;box-sizing: border-box;"><div class="top" style="width:99.6% ;height:42px;background:#f9f9f9 ;border-bottom: 1px solid #dddddd;box-sizing: border-box;"><p style="width: 90%;margin: 0 auto;height: 100%;line-height:42px ;box-sizing: border-box;"><span style="float: left;">提示</span><button type="button" class="close pull-right" data-dismiss="modal" aria-hidden="true" style="font-size:2em;float: right;margin-top: 8px;">×</button></p></div><img style="width: 53px;margin:30px auto;display: block;" src="./app/core/styles/img/1.png"><p style="text-align:center;color: #323232;font-size: 16px;">"+obj.message+"</p><p class="close pull-right closes" data-dismiss="modal" aria-hidden="true" style="width: 100px;height: 30px;margin:20px auto;text-align: center;line-height: 30px;float: none!important;background: #e4e4e4;font-size: 16px;font-weight: normal;color: #666;border-radius: 5px;opacity:7;">知道了</p></div></div></div> -->

</html>

<script>
	$(function() {
			if (window.screen.width < 640) {
				$(".container").width("auto");
			}
			$(".login-center").height(window.innerHeight);
		})
		//    $("#pass_word").click(function () {
		//        if($(this).prop("checked")==true){
		//			$("#username").val();
		//            $("#userpassword").val();
		//        }else{
		//            $("#username").val("");
		//            $("#userpassword").val("");
		//        }
		//    })
	$('#tologin').on('click', function() {
		var type = 1;
		var myreg2 = /^[0-9]+$/;
		if ($('#type2').val() != '') {
			type = 2;
		}
		var username = $('#username').val();
		var userpassword = $('#userpassword').val();
		//---是否记住密码----
		if ($("#pass_word").prop("checked")) {
			var remember = 1;
		} else {
			var remember = 0;
		}
		/*if(userpassword == "" || userpassword.length<8){
		 $("#pwdmsg").show();
		 return false;
		 }

		 if(userpassword == "" || userpassword.length>20){
		 $("#pwdmsg").show();
		 return false;
		 }

		 if(myreg2.test(userpassword)){
		 $("#pwdmsg").show();
		 return false;
		 }

		 */
		$.ajax({
			type: 'get',
			url: 'index.php?user-app-login-login&un=' + username + '&up=' + userpassword + '&t=' + type + '&remember=' + remember,
			dataType: 'JSON',
			async: true,
			//          header("Content-Type: text/html;charset=utf-8"),
			success: function(res) {
				if (res.statusCode == 201) {
					// $(".modal-body").text('登录成功!系统将会自动跳转，请稍候……');
					// $("#loginModal").modal();
					setTimeout(function() {
						//window.location.href = res.forwardUrl;
                        window.history.back(-1);
                    }, 1000);
					var data = {
						result: false,
						message: "登录成功"
					};
					$.zoombox.show('ajaxOK', data);
					// window.location.href = 'index.php?content-app-index'
					//用户信息存到session中
					var user = JSON.stringify(res.userinfo);
					sessionStorage.setItem('userInfo', user);
					return false;
				}
				//				else if(res.statusCode == 202){
				//
				//                    setTimeout(function() {
				//                        window.location.href = res.forwardUrl;
				//                    }, 1000);
				//                    var data = {
				//                        result: false,
				//                        message: "被迫下线，及时修改"
				//                    };
				//                    $.zoombox.show('ajaxOK', data);
				//                    // window.location.href = 'index.php?content-app-index'
				//                    return false;
				//                }
				else {
					var msg = res.message;
					var data = {
						result: false,
						message: msg
					};
					$.zoombox.show('ajax', data);
					return false;
				}
			},
			error: function(e) {
				console.log(e);
			}
		})
	})
	$("body").keydown(function(e) {
		if (e.keyCode == 13) {
			$('#tologin').click();
		}
	})
</script>