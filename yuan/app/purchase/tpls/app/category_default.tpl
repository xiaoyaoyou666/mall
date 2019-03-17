{x2;include:header}
<body>
{x2;include:nav}
<div style="background-color: #fff; width: 100%;">
	<div class="container">
		<div class="pull-left" style="width: 800px;">
			<div class="t20"><img src="app/core/styles/images/cg-ad01.jpg" alt=""></div>
			  <!--采购信息-->
            <div class="zmm_panel panel-default t20" style="width: 800px;">
                <div class="zmm-qydt-title zmm-qydt-shsj1"><p>采购信息 <i>NEW</i></p></div>
                <ul class="why-xj-list">
                    {x2;tree:$contents['data'],content,cid}
                    <li>
                        <div>
                            
                            
                            
                            {x2;if:$_user['userid']}
                                <a href="index.php?purchase-app-category&catid={x2;v:content['purchasecatid']}" class="color-red">[公开询价]</a>
                                <a href="index.php?purchase-app-content&purchaseid={x2;v:content['purchaseid']}" class="color-blue l5">{x2;v:content['purchasetitle']}</a>
                                <a href="index.php?purchase-app-category-company&companyid={x2;v:content['purchaseuserid']}" class="color-orange l5">
                                
                                {x2;$users[v:content['purchaseuserid']]['company_name']}

                                </a>
                            {x2;else}
                                <a href="javascript:;" class="color-red">[公开询价]</a>
                                <a href="javascript:;" class="color-blue l5">{x2;v:content['purchasetitle']}</a>

                                {x2;if:$users[v:content['purchaseuserid']]['company_name']}
                                    <a href="javascript:;" onclick="javascript:$.loginbox.show();" class="color-orange l5">****公司</a>
                                {x2;endif}
                            {x2;endif}
                        </div>
                        <b>{x2;date:v:content['purchaseinputtime'],'Y-m-d'}</b>
                    </li>
                    {x2;endtree}
                </ul>
                <ul class="pagination pull-right">
                    {x2;$contents['pages']}
                </ul>
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
                            <span class="color-red" style="padding-left:0px;">
                            {x2;if:$caigouNumber}

                                {x2;$caigouNumber}
                            {x2;else}
                                0
                             {x2;endif}
                            </span><br>
                            <span>我发布的采购</span>
                        </td>


                        <td>
                            <span class="color-red" style="padding-left:0px;">
                                {x2;if:$caigouNumber}

                                    {x2;$otherPriceNumber}
                                {x2;else}
                                    0
                                {x2;endif}
                                

                            </span><br>
                            <span>我收到的询价</span>
                        </td>
                        <td>
                            <span class="color-red" style="padding-left:0px;">
                            {x2;if:$caigouNumber}

                                {x2;$myPriceNumber}
                            {x2;else}
                                0
                            {x2;endif}
                           

                            </span><br>
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
                            <span></span>{x2;v:user1['company_name']}
                        </li>
                    {x2;endtree}
                    
                </ul>
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
                        window.location.href = 'index.php?purchase'
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





</script>



</div>
{x2;include:footer}
</body>
</html>