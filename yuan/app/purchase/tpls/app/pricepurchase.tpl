{x2;include:header}
<body>
{x2;include:nav}
<style>
  .color-c {
    color: #bbb!important;
}
</style>
<div style="width: 100%;">
	<div class="container">
		<div class="pull-left" style="width: 800px;">
			<div class="t20"><img src="app/core/styles/images/cg-ad01.jpg" alt=""></div>
			<!--采购信息-->
			<div class="zmm_panel panel-default t20" style="width: 800px;">
				<ul class="why-xj-list t20">
					<li style="font-size: 16px;"><span class="glyphicon glyphicon-th-large color-green"></span><span class="c5">提交合作意向</span></li>
				</ul>
				<h4 class="text-center" style="width: 100%; color: #009944;padding:30px 0;">请提交您的合作意向，并真实描述您的信息，更有可能获得合作机会</h4>
				<form action="index.php?purchase-app-content-pricepurchase">
					<table class="why-cg-login" style="margin-left:170px; width: 700px;">
						<tr>
							<td align="right"><span class="color-red">＊</span>报价金额：</td>
							<td colspan="2">
								{x2;if:!$_user['company_istrue']}
									<input type="hidden" name=""  needle="needle" msg="您还没有经过审核">
								{x2;endif}
								
								{x2;if:$_user['company_capital']<$purchasemoney}
									<input type="hidden" name=""  needle="needle" msg="您的注册资本不符合要求">
								{x2;endif}


								<input type="text" name="args[ppeinfo][price]" class="ipt-text" placeholder="请填写报价金额" needle="needle" msg="您必须输入报价金额" onkeyup="value=value.replace(/^\d+\.\d{3}$/g,'')"><span class="color-c">（人民币.元）</span>
							</td>
						</tr>
						<tr>
							<td valign="top" align="right"><span class="color-red">＊</span>合作意向：</td>
							<td colspan="2">
								<textarea name="args[ppeinfo][intention]" placeholder="请填写您的合作意向，限200字以内" needle="needle" msg="您必须输入合作意向"></textarea>
							</td>
						</tr>
						<tr>
							<td align="right"><span class="color-red">＊</span>联系人：</td>
							<td colspan="2">
								<input type="text" class="ipt-text" name="args[ppeinfo][contacter]" placeholder="请填写联系人姓名" needle="needle" msg="您必须输入联系人">
							</td>
						</tr>
						<tr>
							<td align="right"><span class="color-red">＊</span>联系电话：</td>
							<td colspan="2">
								<input type="text" name="args[ppeinfo][phone]" class="ipt-text" placeholder="请填写联系电话" needle="needle" msg="您必须输入联系电话" onkeyup="value=value.replace(/[^\d]/g,'')" id="mobile">
							</td>
						</tr>
						<tr>
							<td align="right"><span class="color-red">＊</span>公司邮箱：</td>
							<td colspan="2">
								<input type="text" class="ipt-text" name="args[ppeinfo][email]" placeholder="请填写公司邮箱" needle="needle" msg="您必须输入公司邮箱" id="email">
							</td>
						</tr>
						<tr>
							<td align="right"><span class="color-red">＊</span>联系地址：</td>
							<td colspan="2">
								<select autoload="index.php?core-api-index-getProvince" target="city" refurl="index.php?core-api-index-getcity&parent={value}" name="args[ppeinfo][province]" id="province" style="width: 95px;" class="autoloaditem combox" needle="needle" msg="您必须选择省"><option value="">请选择省份</option></select>
								<select name="args[ppeinfo][city]" id="city" autoload="index.php?core-api-index-getcity" target="area" refurl="index.php?core-api-index-getarea&parent={value}" parent="#province" style="width: 120px; margin: 0 10px;" class="autoloaditem combox" needle="needle" msg="您必须选择市"><option value="">请选择城市</option></select>
								<select name="args[ppeinfo][area]" id="area" autoload="index.php?core-api-index-getarea" parent="#city" style="width: 110px;" class="autoloaditem" needle="needle" msg="您必须选择区"><option value="">请选择区县</option></select>
							</td>
						</tr>
						
						<tr>
							<td align="right"><span class="color-red">＊</span>上传文件：</td>
							<td colspan="2">
								<script type="text/template" id="pe-template-url">
									<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
										<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
											<div class="qq-upload-button-selector">
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<span class="btn btn-primary" style="background:#009944;border:#009944 1px solid">已上传</span>
														<input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[ppeinfo][attach]" tabindex="0" value="" needle="needle" msg="您必须上传报价单">
														<span class="qq-upload-file-selector qq-upload-file"></span>
													</li>
												</ul>
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<span class="btn btn-default">点击上传报价单</span>
														<input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[ppeinfo][attach]" tabindex="0" value="" needle="needle" msg="您必须上传报价单">
														<span style="color:#bbb">文件格式（xls,xlsx,zip）</span>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</script>
								<div class="fineuploader" attr-list="true" attr-template="pe-template-url" attr-ftype="xls,xlsx,zip"></div>
							</td>
						</tr>
						<tr>
							<td colspan="3" >
								<button class="ipt-btn" type="submit" style="width: 150px;margin-top: 40px;margin-left:150px;border-radius: 4px;">提交</button>
								<input type="hidden" name="purchaseid" value="{x2;$purchaseid}" />
								<input type="hidden" name="pricepurchase" value="1" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<div class="pull-right" style="width: 380px;">
			<div class="t20"><img src="app/core/styles/images/cg-ad02.jpg" alt=""></div>
			<!--用户登录-->
			<div class="zmm_panel panel-default t20" style="width: 380px; height: 280px;">
				<div class="zmm-qydt-title zmm-qydt-shsj1"><p>用户登录</p></div>
				<table class="why-cg-login text-center">
					{x2;if:$_user['userid']}
						<tr>
	                        <td colspan="3" style="padding:20px 0 10px 0px;">
	                            {x2;if:$_user['company_logo']}
	                                <img src="{x2;$_user['company_logo']}" alt="" class="img-circle" height="65" width="65">
	                            {x2;else}
	                                <img src="app/core/styles/images/home-login-img.png" alt="">
	                            {x2;endif}
	                        </td>
	                    </tr>
	                    <tr>
	                        <td colspan="3" >{x2;$_user['company_name']}</td>
	                    </tr>
	                      <tr>
                        <td>
                            <a href="index.php?user-company-purchases">
                                <span class="color-red" style="padding-left:0px;">
                                {x2;if:$caigouNumber}

                                    {x2;$caigouNumber}
                                {x2;else}
                                    0
                                 {x2;endif}
                                </span>
                            </a>
                            <br>
                            <span>我发布的采购</span>
                        </td>


                        <td>
                            <a href="index.php?user-company-purchases-follow">
                                <span class="color-red" style="padding-left:0px;">
                                    {x2;if:$caigouNumber}

                                        {x2;$otherPriceNumber}
                                    {x2;else}
                                        0
                                    {x2;endif}
                                    

                                </span>
                            </a>
                            <br>
                            <span>我收到的询价</span>
                        </td>
                        <td>
                            <a href="index.php?user-company-purchases-follow">
                                <span class="color-red" style="padding-left:0px;">
                                {x2;if:$caigouNumber}

                                    {x2;$myPriceNumber}
                                {x2;else}
                                    0
                                {x2;endif}
                               

                                </span>
                            </a>
                            <br>
                            <span>我报价的商机</span>
                        </td>
                    </tr>
					{x2;else}

					<tr>
                        <td>账号</td>
                        <td colspan="2">
                            <input type="text" class="ipt-text" placeholder="输入账号" name="username" id="username">
                        </td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td colspan="2">
                            <input type="password" class="ipt-text" placeholder="输入密码" name="userpassword" id="userpassword">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div class="checkbox">
                                <label>
                                  <input type="checkbox"> 记住密码
                                </label>
                              </div>
                        </td>
                        <td align="right"><a href="index.php?user-app-register">注册账号</a></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="right"><button class="ipt-btn" id="tologin">登录</button></td>
                    </tr>
					{x2;endif}
				</table>
			</div>
			<!--最新完成交易-->
			<div class="zmm_panel panel-default t20" style="width: 380px;">
                <div class="zmm-qydt-title zmm-qydt-shsj1"><p>最新完成交易 <i>NEW</i></p></div>
                <ul class="why-xj-list" style="width: 340px;">

                    {x2;tree:$contents3['data'],content,cid}
                    <li>
                        <h4>{x2;v:content['purchasetitle']}</h4>
                        <p>采购方式：公开询价</p>
                        <p>采购方：{x2;$users[v:content['purchaseuserid']]['company_name']}</p>
                    </li>
                    {x2;endtree}
                </ul>
            </div>
			<!--采购排行-->
			<div class="zmm_panel panel-default t20" style="width: 380px;">
				<div class="zmm-qydt-title zmm-qydt-shsj1"><p>采购排行 <i>PANKING</i></p></div>
				<ul class="why-ph-list" style="width: 340px;">
					{x2;tree:$users1,user1,uid}
                        <li>
                            <span class="imge_number"></span><a href="index.php?item-app-company&companyid={x2;v:user1['userid']}">{x2;v:user1['company_name']}</a>
                        </li>
                    {x2;endtree}

				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 提交合作意向成功模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document" style="width: 520px;">
		<div class="modal-content" style="height: 370px;">
			<div class="modal-body text-center">
				<img src="app/core/styles/images/suc-icon.jpg" alt="" style="margin: 40px 0 30px 0;"> <br>
				<h3 class="color-green">恭喜你，提交成功！</h3>
				<p>已提交合作意向，可在“企业中心”查看</p>
				<p class="t20 why-cg-login" style="width: auto;"><button class="ipt-btn" style="width: 150px;">继续浏览采购信息</button> <button class="ipt-btn" style="width: 150px;margin-left: 20px;">去查看</button></p>
			</div>
		</div>
	</div>
</div>

<script>
	

    $('#tologin').on('click',function(){
        var username = $('#username').val();
        var userpassword = $('#userpassword').val();
        $.ajax({
            type:'get',
            url: 'index.php?user-app-login-login&un='+username+'&up='+userpassword,
            dataType:'JSON',
            async:true,
            success:function(res){
                console.log(res);
                if(res.statusCode == 201){
                    var data = {result: false, message: "登录成功"};
                    $.zoombox.show('ajaxOK', data);
                    setTimeout(function(){
                        window.location.href = 'index.php?purchase-app-content'
                    }, 2000);
                    return false;
                }else{
                    var message = res.message;
                    var data = {result: false, message: message};
                    $.zoombox.show('ajax', data);
                    return false;
                }
            },
            error: function(e){
                console.log(e);
            }
        })
    })

    $(function(){
        var i=0;
        $('.why-ph-list li').each(function(){
          i++;
          //$(this).find('span').html(i);
          if(i==1){
            $(this).find('span').html("<img src='app/core/styles/images/cg-ph0"+i+".jpg'>");
          }else if(i==2){
            $(this).find('span').html("<img src='app/core/styles/images/cg-ph0"+i+".jpg'>");
          }else if(i==3){

            $(this).find('span').html("<img src='app/core/styles/images/cg-ph0"+i+".jpg'>");
          }else{
            $(this).find('span').html(i);
          }
          
        })
  });


$(document).ready(function(){
	
	//为表单的必填文本框添加相关事件（blur、focus、keyup）
	$("form :input").blur(function(){
		//注意：这里的this是DOM对象，$(this)才是jQuery对象
		var $parent = $(this).parent();
		//删除之前的错误提醒信息
		$parent.find(".msg").remove();
		//验证邮箱
		if($(this).is("#email")){
			if($.trim(this.value) == "" || ($.trim(this.value) != "" && !/.+@.+\.[a-zA-Z]{2,4}$/.test($.trim(this.value))))
			{
				var errorMsg = "请输入E-Mail地址！";
				$parent.append("<span class='msg onError' style='color:red'>" + errorMsg + "</span>");
			}else{
				var okMsg=" 输入正确";
				$parent.find(".high").remove();
				$parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
			}

		}


	
		//验证手机号
		if($(this).is("#mobile")){
			if($.trim(this.value) == "" || ($.trim(this.value) != "" && !/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/.test($.trim(this.value))))
			{
				var errorMsg = "请输入手机号！";
				$parent.append("<span class='msg onError' style='color:red'>" + errorMsg + "</span>");
			}else{
				var okMsg=" 输入正确";
				$parent.find(".high").remove();
				$parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
			}

		}
		
		}).keyup(function(){
			//triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
			$(this).triggerHandler("blur");
		}).focus(function(){
		$(this).triggerHandler("blur");
	});
	
 });
    
</script>
{x2;include:footer2}
</body>
</html>