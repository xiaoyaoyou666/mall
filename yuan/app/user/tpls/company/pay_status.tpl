{x2;include:header}
<body>
	<style type="text/css">
		select{color: #555555a1!important;}
	</style>
{x2;include:nav}
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php">企业中心</a> > <a href="index.php?enterprise">账户管理</a> > <a>钱包管理</a></span>
        </div>
        <div class="qycenter-content">
            {x2;include:menu}
            <div class="right-content col10 pull-right zmm_panel" style="height: 624px;padding:0!important;border: none;">
            	<!--恭喜您已成功通过审核，现在即可登录！-->
                {x2;eval:v:checkStatus = $status}
                {x2;if:v:checkStatus == 3}
                <div class="pass" style="display: block;">
                    <p class="hint_as">恭喜您已成功通过审核，现在即可<a href="#">登录</a>！</p>
                    <img src="app/core/styles/images/one_cs.png"/>
                </div>
                {x2;elseif:v:checkStatus == 1}
                <!--您的开户申请已提交，预计3个工作日之内反馈审核结果，审核通过之后即可登录！-->
                <div class="submitted" style="display: block;">
                    <p class="hint_as">您的开户申请已提交，预计3个工作日之内反馈审核结果，审核通过之后即可！<a href="#">登录</a>!</p>
                    <p class="explain">说明：我们会通过系统消息、短信、邮件三种方式反馈审核结果，请您注意查收。</p>
                    <img src="app/core/styles/images/two_cs.png"/>
                </div>
                {x2;elseif:v:checkStatus == 2}
                <!--您的开户申请已提交，预计3个工作日之内反馈审核结果，审核通过之后即可登录！-->
                <div class="submitted" style="display: block;">
                    <p class="hint_as">您的开户申请已提交，预计3个工作日之内反馈审核结果，审核通过之后即可！<a href="#">登录</a>!</p>
                    <p class="explain">说明：我们会通过系统消息、短信、邮件三种方式反馈审核结果，请您注意查收。</p>
                    <img src="app/core/styles/images/two_cs.png"/>
                </div>
                {x2;elseif:v:checkStatus == 6}
                <!--您的开户申请已提交，预计3个工作日之内反馈审核结果，审核通过之后即可登录！-->
                <div class="submitted" style="display: block;">
                    <p class="hint_as">您的开户申请已提交，预计3个工作日之内反馈审核结果，审核通过之后即可！<a href="#">登录</a>!</p>
                    <p class="explain">说明：我们会通过系统消息、短信、邮件三种方式反馈审核结果，请您注意查收。</p>
                    <img src="app/core/styles/images/two_cs.png"/>
                </div>
                {x2;elseif:v:checkStatus == 4}
                <!--您的开户申请已提交，预计3个工作日之内反馈审核结果，审核通过之后即可登录！-->
                <div class="submitted" style="display: block;">
                    <p class="hint_as">您的开户申请没有通过，请修改信息<a href="#">立刻修改</a>!</p>
                    <p class="explain">说明：我们会通过系统消息、短信、邮件三种方式反馈审核结果，请您注意查收。</p>
                    <img src="app/core/styles/images/two_cs.png"/>
                </div>
                {x2;elseif:v:checkStatus == 5}
                <!--您的开户申请已提交，预计3个工作日之内反馈审核结果，审核通过之后即可登录！-->
                <div class="submitted" style="display: block;">
                    <p class="hint_as">您的开户申请没有通过，请修改信息<a href="#">立刻修改</a>!</p>
                    <p class="explain">说明：我们会通过系统消息、短信、邮件三种方式反馈审核结果，请您注意查收。</p>
                    <img src="app/core/styles/images/two_cs.png"/>
                </div>
                {x2;elseif:v:checkStatus == ''}
                <!--您还没有开通企业钱包，请立刻开通！-->
                <div class="credit_Card" style="display: block;">
                    <div class="pass">
                        <p class="hint_as">您还没有开通企业钱包，请<a href="index.php?user-company-privatement-test3&register=yes" class="immediately">立刻开通</a>！</p>
                        <img src="app/core/styles/images/three_cs.png"/>
                    </div>
                </div>
                {x2;endif}
            </div>	
        </div>
    </div>
</div>
    {x2;include:footer2}

    <script type="text/javascript">
        $(function () {
            $('.submenu:eq(5)').delay(400).slideDown(700);
            $('.submenu:eq(5) li:eq(1)').addClass("active");

        });
    </script>


</body>

</html>
