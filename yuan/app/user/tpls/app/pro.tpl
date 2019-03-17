<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<script src="app/core/styles/js/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/qycenter.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/header.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/about_us.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/base.css" />
		<script src="app/core/styles/js/menu_left.js"></script>

		<style>
			img {
				display: block;
			}
			
			.right_content span {
				display: block;
				margin: 10px 0px;
				color: #222;
			}
			
			.right_content h5 {
				margin-top: 10px;
				color: #000;
				font-weight: bold;
				font-size: 16px;
			}
			
			.container header{
				margin-top: 10px;
				
			}
			
		</style>
	</head>
	{x2;include:header}

	<body>
		{x2;include:nav2}
		<div class="container">
			<div class="col-sm-12 head">
				当前位置：<span>购物指南</span>><span class="current">常见问题</span>
			</div>
			<div class="col-sm-12">
				<div class="left_menu">
					<ul id="menu_content">
						<li>
							<span>购物指南</span>
							<ul style="display: block;">
								<li><a href="index.php?user-app-register-shop">采买方操做手册</a></li>
								<li><a href="index.php?user-app-register-shop#">培训手册</a></li>
								<li><a href="index.php?user-app-register-pro">常见问题</a></li>
							</ul>
						</li>
						<li>
							<span>关于我们</span>
							<ul>
								<li><a href="index.php?user-app-register-aboutus" style="color:#009944;">公司介绍</a></li>
								<li><a href="index.php?user-app-register-contactus" style="color:#009944;">联系方式</a></li>
							</ul>
						</li>

					</ul>
				</div>
				<div class="right_content">
					<header>
						<h4>常见问题</h4>
						<hr>
					</header>
					<h5>1、忘记密码怎么办</h5>
					<p>
						<span>若您忘记了登陆密码，可以在登陆页面点击“忘记密码”，进入找回密码页面</span>
						<img src="app/core/styles/images/login.png">
						<span> 在找回密码页面，输入您的帐户名。</span><br>
						<img src="app/core/styles/images/pwd1.png">
						<img src="app/core/styles/images/pwd2.png">
						<img src="app/core/styles/images/pwd3.png">
						<img src="app/core/styles/images/pwd4.png">
					</p>
					<h5>2、搜索不到想要的商品怎么办？</h5>
					<span>您可以根据商品型号或订货号进行精准/模糊搜索，如果仍然搜索不到，可以将您所需商品的型号和订货号反馈给客服。</span>
					<h5>3、网站登陆不上去怎么办</h5>
					<span>确定您的账号和密码无误后，您可以尝试清理浏览器缓存或更换浏览器访问。</span>
				</div>
			</div>
		</div>
		{x2;include:footer2}
	</body>

</html>