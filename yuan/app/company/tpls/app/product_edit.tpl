{x2;include:header}
<style>
	#three_c {
		width: 800px;
		height: auto;
		line-height: 30px;
	}
	
	#show_check ul li {
		float: left;
		line-height: 30px;
		background: rgba(0, 153, 68, 0.10);
		border: 1px solid rgba(0, 153, 69, 0.60);
		margin-right: 20px;
		padding: 0px 10px 0px 10px;
		margin-bottom: 10px;
	}
	
	#show_check li:hover {
		background: rgba(0, 153, 68, 0.80);
		border: 1px solid #009945;
		color: #fff;
	}
	
	#show_check li:hover .close {
		color: #fff;
		opacity: 1;
	}
	
	.close {
		margin-left: 10px;
		display: block;
		float: right;
		width: 12px;
		height: 30px;
		line-height: 26px;
		opacity: 0.6;
	}
	
	#three_c p {
		float: left;
		padding-left: 15px;
		padding-right: 15px;
		height: 60px;
	}
	
	#three_c input[type="text"] {
		height: 20px;
		width: 50px;
		margin-left: 5px;
		font-size: 12px;
	}
	
	#three_c input[type="checkbox"] {
		margin-top: -3px;
	}
	
	#three_c .years {
		display: none;
		color: #f3a95e;
	}
	
	#three_c .years input {
		color: #666;
		padding-left: 10px;
	}
	.input_n {
		width: 60px;
		height: 20px;
		padding-left: 2px!important;
		font-size: 12px;
	}
	.heading{background: none!important;color: #595656!important;text-align: left!important;border-bottom: 1px solid #f2f2f2;font-weight: bold;}
	.pull-left ul li{border: none!important;}
	.heading img{width: 25px;height: 25px;margin: 0 20px;}
	.active{color: #333;
    	background: url(app/core/styles/img/menu_icon/active.png) no-repeat!important;
    	background-size: auto 50px!important;
    	background-color: rgba(83,181,126,0.08)!important;}
</style>

<body>

	{x2;include:nav}

	<div class="zmm-zx-centent">
		<div class="container">
			<!-- 导航 start -->
			<div class="hln-zx-centent-title t20 b20">
				你所在的位置：
				<span><a href="index.php?user-company">企业中心</a> > <a>主营业务</a></span>
			</div>
			<div class="pull-left" style="border: 1px solid #f2f2f2;">
            <div class="heading"><img src="app/core/styles/images/qyhy/header_sd.png"/>导&nbsp;&nbsp;&nbsp;&nbsp;航</div>
            <ul>
               <li class="active"><a href="index.php?company-app-company-index&companyid={x2;$data['userid']}" class="select">企业简介</a></li>
				<li><a href="index.php?company-app-company-news&companyid={x2;$data['userid']}">企业动态</a></li>
				<li><a href="index.php?company-app-company-product&companyid={x2;$data['userid']}">供货范围</a></li>
				<li><a href="index.php?company-app-company-qualification&companyid={x2;$data['userid']}" >荣誉资质</a></li>
				<li><a href="index.php?company-app-company-project&companyid={x2;$data['userid']}" >成功案例</a></li>
				<li><a href="index.php?company-app-company-contact&companyid={x2;$data['userid']}" >联系方式</a></li>
                {x2;if:in_array($role,[1,2])}
                <li><a href="index.php?company-app-company-companyMaterials&companyid={x2;$data['userid']}" >企业资质</a></li>
                {x2;endif}
            </ul>
        </div>
			<!-- 导航 end -->
			<div class="qycenter-content">
				<!-- 左侧栏 start -->
		
				<!-- 左侧栏 end -->
				
				<!-- 右侧  start -->
				<div class="right-content col10 pull-right edit-primary-business" style="width:83%;float:left">
					<!--公司简介-->
					<div>				<!--公司信息-->
                <div class="zmm_panel panel-default zmm-gsxi">
                    <div>
                        <div class="zmm-gs-pj">
                            <table style="width: 100%">
                                <tr>
                                    <td align="center" valign="top" width="240px">
                                        <div class="pull-left zmm-gs-pj-logo t20 l20">
                                            <img src="{x2;if:$data['company_logo_da']}{x2;$data['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}" alt="" style="width: 100%;height: 100%;">
                                        </div>
                                    </td>
                                    <td>
                                        <ul class="pull-left">
                                            <li><span class="zmm-gs-title">{x2;$data['company_name']}</span>
                                                <!--<a class="t_c_on l20">修改企业资料</a>-->
                                                <!--<a class="sc_a r20"><span><img src="app/core/styles/images/qyhy/sc_star.png"></span>收藏</a>
												<a class="sc_a sc_a_on r20"><span><img src="app/core/styles/images/qyhy/qy_star_on.png"></span>已收藏</a>
												-->
                                            </li>
                                            <li class="zmm-gs-dj">
												<span id="levelhtml">
                                                    <input type="hidden" id="level" value="{x2;$data['company_level']}">
												</span>
												<span class="zmm-gs-djl">点击量：<span class="zmm-font-bold">{x2;$data['userreferrer']}<span></span>
                                            </li>
                                            <button onclick="toShop();return false;" class="button_tt dw_tt pull-right" autocomplete="off">进入网格超市</button>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
					<div>

						<div class="zmm_panel panel-default">
							<div class="zmm-qydt-title zmm-qydt-shsj1">
								<p><em class="title-triangle"></em>供货范围</p>
							</div>
							<div class="zmm-panel-body">
								<form action="index.php?company-app-company-productedit" method="post" class="form-horizontal">
									<div class="form-group">
                                        <input type="hidden" name="args[userid]" value="{x2;$data['userid']}">
										<div class="col-md-12" style="padding-left: 0px;">
											<div id="show_check" style="margin-left:15px;">
												<ul>
													{x2;tree:$catnameArr,cat,cid}
													<li>
														<span class="one_menu">{x2;v:cat['grandpaNames']}</span>&nbsp;&gt;&nbsp;
														<span class="two_menu">{x2;v:cat['parentName']}</span>&nbsp;&gt; {x2;tree:v:cat['catArr'],val,kid}
														<span class="three">
															{x2;v:val['catname']}<input type="hidden" value="{x2;v:val['year_num']}" name="args[user_category][{x2;v:val['cate_id']}]">
														</span><span class="fg">、</span> {x2;endtree}
														<span style="display: inline-block" class="close">×</span>
													</li>
													{x2;endtree}
												</ul>
											</div>
											<div class="col-md-3" style="margin-right: 5px;" id="first_c">
												<select class="form-control">
                                                       <option value="-1">请选择一级分类</option>
                                                        {x2;tree:$parentcat,cat,cid}
                                                        <option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
                                                        {x2;endtree}
                                                        </select>
											</div>
											<div class="col-md-3" id="sed_c">
												<select class="form-control">
                                                      <option value="-1">请选择二级分类</option>
                                                </select>
											</div>
											<div class="col-md-3">
												<span id="submit_check" style="display: none;" class="btn btn-primary">保存</span>
											</div>
										</div>

									</div>
									<div class="form-group">
										<label class="control-label col-md-4"></label>
										<div class="col-md-8" id="three_c" style="padding-left: 0px;">

										</div>

									</div>
									<!--發票類型*************************************************-->
									<div class="zmm-qydt-title zmm-qydt-shsj1" style="margin-left: -20px;">
								          <p><em class="title-triangle"></em>发票类型</p>
							        </div>
									<div  class="form-group fors" style="margin-left: 10px;">
										<label class="checkbox-inline hln-checkbox-inline" style="display: inline-block;">
                                             <input class="eType etype_one" name="args[company_invoice][]" value="1"  type="checkbox" checked="checked">
                                              <span>增值税专用发票</span>
                                           </label>
										<label class="checkbox-inline hln-checkbox-inline" style="margin-left: 0px;display: inline-block;">
                                             <input class="eType etype_two" name="args[company_invoice][]" value="2"  type="checkbox" >
                                             <span>增值税普通发票</span>
                                         </label>

									</div>
									<!--********************************************************-->
									<div class="form-group">
										<!--<label for="purchasetemplate" class="control-label col-sm-2"></label>-->
										<div class="col-sm-12" style="text-align: center;margin-top: 40px;">
											<button class="btn btn-primary" type="submit" style="background:#007222">提交</button>
											<input type="hidden" name="submit" value="1">
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>
				</div>
				<!-- 右侧  end -->
			</div>
		</div>
	</div>

	{x2;include:footer2}
	<script>
		$(function() {
			$('.submenu:eq(0)').delay(400).slideDown(700);
			$('.submenu:eq(0) li:eq(3)').addClass("active");
			$(".etype_one").click(function(){
				if($(this).prop("checked")){
					
				}else{
					if($(".etype_two").prop("checked")){
						console.log(this)
					}else{
						$(this).prop("checked","true")
					}
				}
			})
			$(".etype_two").click(function(){
				if($(this).prop("checked")){
					
				}else{
					if($(".etype_one").prop("checked")){
						console.log(this)
					}else{
						$(this).prop("checked","true")
					}
				}
			})
		});
		$(function() {
			$("#show_check").find("li").each(function() {
					$(this).find(".fg:last").remove();
				})
				//二级菜单
			$("#first_c").find("select").change(function() {
				var code = $(this).val();
				console.log(code);
				if (code == "-1") {
					$("#sed_c select").empty();
					$("#three_c").empty();
					$("#sed_c select").append("<option value='-1'>请选择二级分类</option>");
					return false;
				} else {
					$.ajax({
						type: "GET",
						url: "index.php?user-app-register-ajaxCategory&catid=" + code,
						dataType: "json",
						success: function(data) {
							$("#sed_c select").empty();
							console.log(data);
							$.each(data, function(index, value) {
								$("#sed_c select").append("<option value=" + value.catid + ">" + value.catname + "</option>")
							})
						}
					})
				}
			})
			$("#sed_c").find("select").click(function() {
					var code = $(this).val();
					console.log(code);
					if (code == "-1") {
						$("#three_c").empty();
						return false;
					} else {
						$("#submit_check").show();
						$.ajax({
							type: "GET",
							url: "index.php?user-app-register-ajaxCategory&catid=" + code,
							dataType: "json",
							success: function(data) {
								console.log(data);
								$("#three_c").empty();
								$.each(data, function(index, value) {
									$("#three_c").append("<p><input type='checkbox'  value=" + value.catid + " name='three_c'><span>" + value.catname + "</span><span class='years'>年产量:<input type='number' oninput='this.value=this.value.replace(/^[0]+[0-9]*$/gi,)' class='input_n'></span></p>");
								})
								$("#submit_check").show();
							}
						})
					}
				})
				//展示选择的多选点击保存
			$("#submit_check").click(function() {
					var one_t = $("#first_c").find("option:selected").text();
					var two_t = $("#sed_c").find("option:selected").text();
					$("#show_check").find("li").each(function() {
						if ($(this).find(".one_menu").text() == one_t) {
							if ($(this).find(".two_menu").text() == two_t) {
								$(this).remove();
							}
						}
					})
					content = "<li><span class='one_menu'>" + one_t + "</span>&nbsp;>&nbsp;<span class='two_menu'>" + two_t + "</span>&nbsp;>";
					if ($("#three_c").find("input:checked").length > 0) {
						$("#three_c").find("input:checked").each(function() {
							var catid = $(this).val();
							var catname = $(this).next("span").text();
							var catyear = $(this).siblings(".years").find("input[type=number]").val();
							if(catyear==""){
								catyear=0;
							}
							console.log(catyear);
					
							content += "<span class='three'>" + catname + "<input type='hidden' value='" + catyear + "' name='args[user_category][" + catid + "]'></span><span class='fg'>、</span>"
						})
						content += "<span class='close'>&times;</span></li>";
						$("#show_check").children("ul").append(content);
						$("#show_check").css("margin-bottom", "15px")
						$("#three_c").empty();
						$("#show_check").find("li").find("span.fg:last").remove();
						$("#submit_check").hide();
					} else {
						alert("请选择三级菜单");
					}
				})
				//展示页面关闭按钮
			$("#show_check").on("click", ".close", function() {
					$(this).parent("li").remove();
				})
				//单击三级菜单的时候，年产品显示
			$("#three_c").on("click", "input[type=checkbox]", function() {
				if ($(this).is(':checked')) {
					$(this).siblings("span.years").css("display", "block");
				} else {
					$(this).siblings(".years").hide();
				}
			})
		})

    // 头部等级
        $(function(){
        var level = $('#level').val();
        var htmla = '';
        var htmlb = '';
        var reshtml = '推荐指数：';
        for (var i=0;i<level;i++)
        {
            htmla += "<img src='app/core/styles/images/qyhy/qy_star_on.png'>"
        }
        for (var j=0;j<5-level;j++)
        {
            htmlb += "<img src='app/core/styles/images/qyhy/qy_star.png'>"
        }
        reshtml += htmla + htmlb;
        $('#levelhtml').html(reshtml);

        //判断企业简介是不是大于3行
        if($('.company-introduction p').length){
			if($('.company-introduction p').height() >= 90){
				// var html = '<span onlick="showMore(this)">...更多</span>';
                $('.company-introduction').addClass('rows-style');
                // $('.company-introduction p').append(html);
			}
		}

		$(document).on('click','.company-introduction.rows-style',function () {
            $(this).removeClass('rows-style');
        })
    });
	</script>
</body>

</html>