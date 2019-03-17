{x2;include:header}
<body>
{x2;include:nav}
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：

            <?php
				if($_GET['a']==1){
			?>
            <span><a href="index.php">企业中心</a> > <a href="index.php?enterprise">账户管理</a> > <a>企业资料</a></span>

            <?php
			}
			?>

            <?php
				if($_GET['a']==2){
			?>

            <span><a href="index.php">企业中心</a> > <a href="index.php?enterprise">账户管理</a> > <a>账户安全</a></span>

            <?php
			}
			?>

        </div>
        <div class="qycenter-content">
            {x2;include:menu}
            <div class="right-content col10 pull-right">
                <div>
                    <!---公共头部结束-->
                    <div class="box itembox" style="padding-top:10px;">
                        <div class="zmm_panel panel-default">
                            <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                            <div class="zmm-qydt-title zmm-qydt-shsj1">
                                <?php
						if($_GET['a']==1){
					?>

                                <p><em class="title-triangle"></em>企业资料</p>
                                <a href="index.php?user-company-basic" class="yellow-text pull-right"
                                   style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">账户安全</a>

                                <?php
					}
					?>

                                <?php
						if($_GET['a']==2){
					?>

                                <p><em class="title-triangle"></em>密码变更</p>
                                <!--<a href="index.php?user-company-basic" class="yellow-text pull-right"
                                   style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">企业资料</a>-->

                                <?php
					}
					?>

                            </div>
                            <div id="tabs-694325" class="tabbable">
                                <ul class="nav nav-tabs">
                                    <!-- <li>
                                        <a href="#panel-788885" data-toggle="tab">修改密码</a>
                                    </li> -->
                                </ul>
                                <div class="tab-content">
                                    <?php
								if($_GET['a']==1){
							?>
                                    <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                                        <form action="index.php?user-company-privatement" method="post"
                                              class="form-horizontal corporate-info" style="">
                                            <fieldset>
                                                {x2;tree:$forms,form,fid}
                                                <div class="form-group">
                                                    <label class="control-label col-sm-2" for="{x2;v:form['id']}">{x2;v:form['title']}：</label>
                                                    <div class="col-sm-9">{x2;v:form['html']}</div>
                                                </div>
                                                {x2;endtree}
                                                <div class="form-group">
                                                    <label class="control-label col-sm-2"></label>
                                                    <div class="col-sm-10">
                                                        <button class="btn btn-primary" type="submit"
                                                                style="background-color:#009944">提交
                                                        </button>
                                                        <input type="hidden" name="modifyuserinfo" value="1"/>
                                                        <input type="hidden" name="page" value="{x2;$page}"/>
                                                        {x2;tree:$search,arg,aid}
                                                        <input type="hidden" name="search[{x2;v:key}]"
                                                               value="{x2;v:arg}"/>
                                                        {x2;endtree}
                                                    </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                    <?php
							}
							?>

                                    <?php
								if($_GET['a']==2){
							?>


                                    <div class="zmm-panel-body account-security">
                                        <form action="index.php?user-company-privatement" method="post"
                                              class="form-horizontal">
                                            <fieldset>
                                                <div class="form-group">
                                                    <label for="oldpassowrd" class="control-label col-sm-2">旧密码：</label>
                                                    <div class="col-sm-3"><input id="oldpassowrd" class="form-control"
                                                                                 type="password" name="oldpassword"
                                                                                 needle="true" datatype="password"
                                                                                 msg="密码字数必须在6位以上"/></div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="passowrd1" class="control-label col-sm-2">新密码：</label>
                                                    <div class="col-sm-3"><input id="passowrd1" class="form-control"
                                                                                 type="password" name="args[password]"
                                                                                 needle="true" datatype="password"
                                                                                 msg="密码字数必须在6位以上"/></div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="oldpassowrd"
                                                           class="control-label col-sm-2">重复密码：</label>
                                                    <div class="col-sm-3"><input id="password2" class="form-control"
                                                                                 type="password" name="args[password2]"
                                                                                 needle="true" equ="passowrd1"
                                                                                 msg="前后两次密码必须一致且不能为空"/></div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-2"></label>
                                                    <div class="col-sm-2">
                                                        <button class="btn btn-primary" type="submit"
                                                                style="background-color:#009944">提交
                                                        </button>
                                                        <input type="hidden" name="modifyuserpassword" value="1"/>
                                                        <input type="hidden" name="page" value="{x2;$page}"/>
                                                        {x2;tree:$search,arg,aid}
                                                        <input type="hidden" name="search[{x2;v:key}]"
                                                               value="{x2;v:arg}"/>
                                                        {x2;endtree}
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                    
                                    <!--手机号更改-->
                                     <div class="zmm-qydt-title zmm-qydt-shsj1">
                                        <p><em class="title-triangle"></em>手机变更</p>
                                    
                                     </div>
                                   
                                    <div class="zmm-panel-body account-security">
                                    	   <form action="" method="post"  class="form-horizontal">
                                    	      <fieldset>
                                    	      	<div class="form-group">
                                                    <label for="oldpassowrd" class="control-label col-sm-2">新手机号：</label>
                                                    <div class="col-sm-3">
                                                    	<input class="form-control" type="text" name="newtel" needle="true" id="phone">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="oldpassowrd" class="control-label col-sm-2">验证码：</label>
                                                    <div class="col-sm-2">
                                                    	<input id="verCode" class="form-control" type="text" name="yzm" needle="true">
                                                    </div>
                                                    <div class="col-sm-2" style="padding-left: 0px;" id="sendcodebtn">
                                                        <a class="btn hln-btn-default fs" onclick="javascript:sendcode();" style="background: #009944;height: 30px;line-height: 30px;padding:0 6px;">发送验证码</a>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                	 <label class="control-label col-sm-2"></label>
                                                	  <div class="col-sm-10">
                                                          <button class="btn btn-primary" id="changemobile" type="button" style="background-color:#009944">提交
                                                         </button>
                                                      </div>
                                                </div>
                                    	      </fieldset>
                                    	   </form>
                                    </div>

                                    <?php
							}
							?>
                                </div>
                            </div>
                        </div>


                        <!---公共尾部结束-->

                    </div>
                </div>
                <!-- 右侧  end -->
            </div>
        </div>
    </div>
</div>
    {x2;include:footer2}

    <script type="text/javascript">
        $(function () {
            $('.submenu:eq(5)').delay(400).slideDown(700);
            $('.submenu:eq(5) li:eq(0)').addClass("active");

            //修改手机号
            $('#changemobile').on('click', function() {
                var phono = $("#phone").val();
                var verCode = $("#verCode").val();
                var myreg = /^1[3|4|5|7|8][0-9]\d{4,8}$/;
                if(!myreg.test(phono))
                {
                    var data = {result: false, message: "手机号码格式不对"};
                    $.zoombox.show('ajax', data);
                    return false;
                }
                if(verCode == ""){
                    var data = {result: false, message: "请输入验证码"};
                    $.zoombox.show('ajax', data);
                    return false;
                    return false;
                }
                var args = {};
                args['company_mobile'] = phono;
                args['verCode'] = verCode;
                $.ajax({
                    type: 'POST',
                    data:args,
                    dataType:'JSON',
                    url: "index.php?user-company-privatement-changeMobile",
                    success:function(res){
                        console.log(res);
                        if(res.statusCode == 200){
                            setTimeout(function() {
                                window.location.href = 'index.php?user-company-privatement&a=2';
                            }, 1000);
                            var data = {
                                result: false,
                                message: res.message
                            };
                            $.zoombox.show('ajaxOK', data);
                        }else{
                            var data = {
                                result: false,
                                message: res.message
                            };
                            $.zoombox.show('ajax', data);
                            return false;
                        }
                    },
                    error: function(e){
                        console.log(e);
                    }
                })
            })
        });



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
                data:{mobile:phone,action:'changemobile'},
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


</body>

</html>
