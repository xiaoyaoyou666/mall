{x2;include:header}

<body>
	<style>
		.dis-select {
			border: 1px solid #ff8a00!important;
		}
		
		.closes {
			display: none;
		}
		
		.di-style span {
			border: solid 1px #fff;
			padding: 3px 20px;
		}
		
		.why-cartbg table .info td {
			padding: 10px 10px 10px 10px;
		}
		
		td input,
		td select,
		td textarea {
			border: solid 1px #ccc;
			padding-left: 10px;
			height: 30px;
			line-height: 30px;
			width: 200px;
			border-radius: 4px;
		}
		
		td textarea {
			width: 80%;
			height: 100px;
			margin-left: 10%;
		}
		
		td select {
			width: 120px;
			text-align: center!important padding-left: 0px;
		}
		
		.why-cartbg table td {
			text-align: left;
			font-size: 14px;
		}
		
		.why-cartbg table td>span:first-child,
		.li_input li span:first-child {
			text-align: right;
			margin-right: 10px;
			display: inline-block;
			width: 120px;
		}
		
		.title_c {
			width: auto!important;
			font-size: 14px;
			text-align: left!important;
			font-weight: 600;
			color: #555;
		}
		
		.why-cartbg table th,
		.why-cartbg table td {
			padding: 8px 10px;
			font-weight: 500;
		}
		
		#com_name {
			background: url(app/core/styles/images/market/sj-icon.png) no-repeat center left;
			padding-left: 20px;
			margin-left: 10px;
			width: 100%;
			text-align: left;
		}
		
		.why-cartbg table .info td {
			text-align: center;
		}
		
		td li {
			height: 40px;
			line-height: 40px;
		}
		
		.why-cartbg table td>span:first-child {
			width: auto;
		}
		
		#address_more li {
			height: 34px;
			line-height: 34px;
			margin-left: 20px;
			margin-right: 20px;
			border: solid 1px #fff;
			color: #666;
			font-size: 13px;
			margin-bottom: 5px;
			padding-left: 10px;
		}
		
		#address_more li span:first-child {
			width: 80px;
		}
		
		#address_more li:hover {
			border: solid 1px #fff;
			background: #fff0e0;
			border: solid 1px #ff992c!important;
			cursor: pointer;
			color: #323232;
		}
		
		.li_hover {
			background: url(app/core/styles/img/address.png) 10px no-repeat;
			background-size: 14px;
			border: solid 1px #ff992c!important;
			font-size: 14px!important;
			font-weight: 600;
			padding-left: 10px;
			background-color: #fff0e0;
		}
		
		#address_more .li_hover span:first-child::before {
			content: "寄送至";
			color: #ff992c;
			font-weight: 100;
		}
		
		#address_more li .del {
			float: right;
			margin-right: 10px;
			display: none;
			font-weight: 100;
		}
		
		#address_more .li_hover .del {
			display: block;
		}
		
		#address_more span {
			text-align: center;
			margin-right: 0px;
		}
		
		.add {
			display: block;
			width: 150px!important;
			height: 24px;
			line-height: 20px;
			font-size: 13px;
			border-radius: 2px;
			border: solid 1px #EBEBEB;
			margin-left: 100px;
			/*position: relative;
			left:50%;
			margin-left:-100px;*/
			text-align: center;
			cursor: pointer;
			margin-top: 20px;
		}
		
		li button {
			width: 100px;
			height: 30px;
			line-height: 30px;
			margin-left: 10px;
		}
		
		.ul_select,
		.s_select {
			position: relative;
			display: inline-block;
		}
		
		.ul_select div,
		.s_select div {
			display: none;
			display: none;
			position: absolute;
			z-index: 100;
			background: rgba(255, 255, 255, 0.9);
			width: 270px;
			height: 150px;
			border: solid 1px #ebebeb;
			overflow-y: scroll;
		}
		
		.s_select div {
			width: 140px;
		}
		
		.comp_sel {
			overflow-y: scroll!important;
		}
		
		.comp_sel>ul {
			padding: 10px!important;
		}
		
		.comp_sel ul li {
			width: 100%;
			cursor: pointer;
			line-height: 16px;
		}
		
		.new_add {
			font-size: 13px;
			margin-top: 20px;
			margin-left: 80px;
			display: none;
		}
		
		.new_add input {
			width: 210px;
			height: 34px;
			line-height: 34px;
		}
		
		.why-btn-big-green,
		.why-btn-big-border-green {
			padding: 0 15px;
			height: 30px;
			line-height: 30px;
			border-radius: 4px;
		}
		/*	/*	/*
		.ul_select input {
			min-width: 270px;
		}*/
		
		td.td_c {
			color: #666;
		}
		
		.btn {
			background: none;
			outline: none;
			border: 0px;
		}
		
		.li_input input {
			width: 280px;
		}
		
		.form-inline .form-control {
			width: 210px;
		}
		
		.why-cartbg {
			background-color: #fff;
		}
		
		.why-cartbg table .info {
			background: rgba(255, 153, 44, 0.02);
			border: solid 1px #f2f2f2;
			border-bottom: 0px;
		}
		
		.t_li li {
			height: 43px;
			line-height: 43px;
		}
	</style>
	{x2;include:nav}

	<div class="container why-cartbg">
		<form class="wrap" action="index.php?user-company-yeeorder" method="post" id="form1">
			<input type="hidden" value="1" name="createorder">
			<input type="hidden" value="0" name="isedit" id="isedit">
			<table class="cart-list" style="border:1px solid #ededed;margin-top:30px;">
				<tr>
					<td style="text-align: left;padding:5px 10px;" colspan="8">
						<span class="title_c">订单详情</span>
					</td>
				</tr>

				<tr>
					<th width="50px">序号</th>
					<th width="300px">商品描述</th>
					<th width="100px">单价</th>
					<th width="100px">数量</th>
					<th width="140px">物料编码</th>
					<!--
					<th width="200px">采购税</th>					
					<th>项目主体</th>
					-->
					<th>小计</th>
				</tr>
				{x2;eval: v:number = 0} {x2;eval: v:price = 0} {x2;eval: v:allprice = 0} {x2;tree:$scarts,cart,cid}
				<div>
					<tr>
						<td colspan="8"><span style="font-size: 13px;" id="com_name">{x2;$susers[v:key]['company_name']}</span></td>
					</tr>
				</div>
				{x2;tree:v:cart,ct,ctid} {x2;if:v:ct['cartstatus']} {x2;eval: v:number = v:number + v:ct['number']} {x2;eval: v:price = v:price + v:ct['itemprice']*v:ct['number']} {x2;eval: v:allprice = v:allprice + v:ct['itemprice']*v:ct['number']}
				<div style="box-shadow:inset 0 -1px 0 0 rgba(255,153,44,0.15);">

					<tr class="info">
						<td>{x2;v:ctid}</td>
						<td valign="middle">
							<p style="float: left;width:80px;height:80px;overflow: hidden;border:solid 1px #EBEBEB"><img src="{x2;v:ct['itemthumb']}" style="width:100%;" /></p>
							<p style="color:#333;float: left;width:200px;font-size: 13px;height:80px;overflow: hidden;text-align: left;padding-left:10px;">
								{x2;v:ct['goodstitle']} {x2;tree:$mfields[$categories[v:ct['goodscatid']]['catmoduleid']],field,fid} {x2;if:v:field['fieldsystem']} {x2;v:field['fieldtitle']} : {x2;v:ct[v:field['field']]}&nbsp;&nbsp; {x2;endif} {x2;endtree}
							</p>
						</td>
						<td style="font-weight: 550;">
							&yen;{x2;v:ct['itemprice']}
							<!--净价-->
						</td>
						<td class="td_c">
							{x2;v:ct[ 'number']}
						</td>
						<td class="td_c">
							{x2;v:ct[ 'FJLSBJCL_WLBH']}
							<input type="hidden" value="" name="goods[ematn][{x2;v:ct['itemid']}]">
						</td>
						<!--
						<td>
							<div class="s_select">
								<input type="hidden" value="" name="goods[mwskz][{x2;v:ct['goodsid']}]">
								<input type="text" value="" placeholder="请输入采购税" autocomplete="off" style="width:180px;text-align: center;padding-left:0px;" class="shui_sel">
								<div class="comp_sel" style="width:180px;">
								</div>
							</div>
						</td>
						-->
						<td><label class="color-red">&yen; {x2;eval: echo v:ct['itemprice']*v:ct['number']}</label></td>
					</tr>

				</div>

				{x2;endif} {x2;endtree} {x2;endtree}
				<tr style="background:rgba(255,153,44,0.02);">
					<td colspan="8">给卖家留言 &nbsp;&nbsp;<input name="args[message]" rows="2" style="width:470px;"></input>
					</td>
				</tr>
			</table>
			<table style="border:1px solid #ededed;margin-top:30px; ">
				<tr>
					<td style="text-align: left;padding:5px 10px;" colspan="8">
						<span class="title_c">收货信息</span>
					</td>
				</tr>
				<tr>
					<td colspan="8" style="background:#fff;">
						{x2;eval:v:cadd = current($addressinfo['data'])}
						<input type="hidden" name="args[orderaddress]" id="orderaddress" value="{x2;v:cadd['addressid']}" />
						<ul id="address_more">
							{x2;tree:$addressinfo['data'],address,aid}
							<li class="sel_addr {x2;if:v:aid == '1'}li_hover{x2;endif}" value="{x2;v:address['addressid']}">
								<span></span>
								<span>
                                {x2;v:address['province']}&nbsp;{x2;v:address['city']}&nbsp;{x2;v:address['area']}&nbsp;{x2;v:address['addressinfo']}&nbsp;&nbsp;{x2;v:address['receiver']}&nbsp;&nbsp;{x2;v:address['phone']}<em></em>
                            </span>
								<span class="del"><a class="btn confirm" href="index.php?item-app-order-deladdress&addressid={x2;v:address['addressid']}">删除</a></span>
							</li>
							{x2;endtree}
						</ul>

						<p class="add" id="add"><img src="app/core/styles/images/add_da.png" style="width:10px;margin-right: 3px;margin-top:-2px;">创建并添加新地址</p>

						<div class="new_add">

							<div class="add-address form-inline" id="newaddress" style="padding-left:10px;">
								<form id="form_hh" method="post">
									<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">收货人  </span>&nbsp;&nbsp;<input type="text" class="form-control aa-ipt-text addaddress" name="ads[receiver]" id="receiver" /></p>
									<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">所在地区 </span>&nbsp;
										<select id="provinces" target="cities" autoload="index.php?core-api-index-getProvince" class="form-control autoloaditem combox it-select" style="width:140px;" name="ads[provinceid]" refUrl="index.php?core-api-index-getcity&parent={value}">
										<option value="">选择所在地区</option>
									</select>
										<select id="cities" target="areas" class="form-control combox it-select" style="width:140px;" name="ads[cityid]" refUrl="index.php?core-api-index-getarea&parent={value}">
										<option value="">选择所在城市</option>
									</select>
										<select id="areas" current="{x2;$areaid}" class="form-control it-select 110" style="width:140px;" name="ads[areaid]">
										<option value="">选择所在县区</option>
									</select>
									</p>
									<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">详细地址 </span>&nbsp;
										<input type="text" class="form-control aa-ipt-text addaddress" name="ads[addressinfo]" id="addressinfo" />
									</p>
									<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">邮政编码 </span>&nbsp;
										<input type="text" class="form-control aa-ipt-text addaddress" name="ads[zipcode]" id="zipcode" />
									</p>
									<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">联系电话 </span>&nbsp;&nbsp;<input type="text" class="form-control aa-ipt-text addaddress" name="ads[phone]" id="phone" placeholder="请输入手机号码" onblur="checkPhone()"/>
										<span id="tssj" style="color:#f00;"></span>
									</p>
									<p style="text-align: center;"><button type="button" class="why-btn-big-green" id="addressbtn" style="width:100px;margin-right:90px;">保存</button></p>
								</form>
							</div>

						</div>
					</td>
				</tr>
			</table>
			<table style="border:1px solid #ededed;margin-top:30px;">
				<tr>
					<td style="text-align: left;padding:5px 10px;">
						<span class="title_c">发票信息</span>
					</td>

				</tr>
				<tr style="background:#fff;">
					<td style="width: 50%;" class="li_input">
						<ul>
							<li><span>发票类型</span> :<input class="isedit" type="text" placeholder="请输入名称" name="args[title]" needle="needle" msg="增值税专用发票" value="增值税专用发票" readonly="readonly" style="border: none;"></li>
							<li><span>名称</span> <input class="isedit" type="text" placeholder="请输入名称" name="args[title]" needle="needle" msg="您必须输入发票名称" value="{x2;$invoiceData['title']}"></li>
							<li><span>纳税人识别号</span> <input class="isedit" type="text" placeholder="请输入纳税人识别号" name="args[number]" needle="needle" msg="您必须输入纳税人识别号" value="{x2;$invoiceData['number']}"></li>
							<li><span>地址、电话</span> <input class="isedit" type="text" placeholder="请输入地址、电话" name="args[mobile]" needle="needle" msg="您必须输入地址、电话" value="{x2;$invoiceData['mobile']}"></li>
							<li><span>开户行及账号</span> <input class="isedit" type="text" placeholder="请输入开户行及账号" name="args[card_number]" needle="needle" msg="您必须输入开户行及账号" value="{x2;$invoiceData['card_number']}"></li>
							<li><span>发票明细</span> :<input class="isedit" type="text" name="args[card_number]" needle="needle" msg="您必须输入发票明细" value="订单商品" readonly="readonly" style="border: none;"></li>
						</ul>

					</td>
					<!--<td>
						
					</td>-->
				</tr>
			</table>
			<tr>
				<td colspan="2">
					<ul style="float:right;text-align: right;" class="t_li">
						<li style="border-bottom: solid 1px #eee;"><span style="font-weight: 600;">{x2;v:number}</span>&nbsp;&nbsp;件商品金额总计：&nbsp;&nbsp;<span>&yen;{x2;v:price}</span></li>
						<li>应付总额（运费提付)：&nbsp;&nbsp;<span style="font-size:24px;color:#f00">&yen;{x2;v:allprice}</span></li>
						<li><button onClick="javascript :history.back(-1);" class="why-btn-big-green" style="background: #fff;border:solid 1px #009944;color:#009944;">取消订单</button><button type="button" id="btn" class="why-btn-big-green">提交订单</button></li>
					</ul>
				</td>
			</tr>
			</table>
		</form>
	</div>
	<script>
		$(".di-style").on("mouseover", function() {
			$(this).children($(".closes")).show()
		})
		$(".di-style").on("mouseout", function() {
			$(".closes").hide()
		})
		$('.di-style').find('span').on('click', function() {
			var _this = $(this);
			_this.parents('.di-style').parent().find('span').removeClass('active');
			_this.addClass('active');
			if (_this.attr('data-element')) {
				$('#' + _this.attr('data-element')).val(_this.attr('data-value'));
			}
		});
	</script>
	{x2;include:footer2}
	<script>
		$("#address_more").on("click", "li", function() {
			$(this).addClass("li_hover");
			$(this).siblings().removeClass("li_hover");
		});

		function checkPhone() {
			var phone = document.getElementById('phone').value;
			if (!(/^1(3|4|5|7|8)\d{9}$/.test(phone))) {
//				alert("手机号码有误，请重填");
                $("#tssj").text("手机号码有误，请重新填写");
				return false;
			}
		}
	</script>

	<script>
		$(function() {
			// 新建地址
			$("#newaddress").on("keyup", "input", function() {
					wls2 = $(this).val().length * 14;
					if (wls2 > $(this).width()) {
						$(this).width(wls2);
					} else {
						$(this).width(200);
					}
				})
				// $(".selects").keyup(function() {
				// 	var s_t = $(this).parent(".ul_select").prev("span").text();
				// 	var action = '';
				// 	if (s_t == '公司') {
				// 		action = 'getCompanyByCode';
				// 	} else if (s_t == '采购组') {
				// 		action = 'getCaigouByCode';
				// 	} else {
				// 		action = 'getFukuanByCode';
				// 	}
				// 	var wl2 = $(this).width() + 10;
				// 	$(this).siblings(".comp_sel").width(wl2);
				// 	var suibian = $(this).next('.comp_sel');
				// 	var code = $(this).val();
				// 	var ad = $(this).siblings(".comp_sel");
				// 	if (code != '') {
				// 		$.ajax({
				// 			type: 'GET',
				// 			data: {
				// 				code: code
				// 			},
				// 			url: "index.php?item-app-ajax-" + action,
				// 			dataType: 'json',
				// 			success: function(res) {
				// 				if (res.statusCode == 200) {
			// 					suibian.html(res.data);
			// 					if(res.data=="<ul></ul>"){
			// 					}else{
			// 						ad.slideDown();
			// 						console.log(res.data);
			// 					}
			// 				} else {
			// 					var data = {
			// 						result: false,
			// 						message: res.message
			// 					};
			// 					$.zoombox.show('ajax', data);
			// 				}
			// 			}
			// 		})
			// 	}
			// });
			// 发票信息
			$(".li_input").on("keyup", "input", function() {
				wls = $(this).val().length * 14;
				if (wls > $(this).width()) {
					$(this).width(wls);
				} else {
					$(this).width(200);
				}
			})
			// 付款条款
			// $(".ul_select").on("click", "li", function() {
			// 	$(this).parent("ul").parent("div").siblings(".selects").val($(this).text());
			// 	var wl = $(this).parent("ul").parent("div").siblings(".selects").val().length * 14;
			// 	if (wl > $(this).parent("ul").parent("div").siblings(".selects").size()) {
			// 		$(this).parent("ul").parent("div").siblings(".selects").width(wl);
			// 	}
			// 	$(this).parent("ul").parent("div").siblings(".selects").val($(this).text());
			// 	$(this).parent("ul").parent("div").siblings("input[type=hidden]").val($(this).attr("name"));
			// 	$(this).parent("ul").parent("div").hide();
			// 	if ($(this).parents(".comp_sel").prev("input[type=text]").attr("id") == "company_name") {
			// 		var compid = $(this).attr("name");
			// 		if (compid != '') {
			// 			$.ajax({
			// 				type: 'GET',
			// 				data: {
			// 					code: compid
			// 				},
			// 				url: "index.php?item-app-ajax-getFactoryByCode",
			// 				dataType: 'json',
			// 				success: function(res) {
			// 					if (res.statusCode == 200) {
			// 						$('.getproject').html(res.data);
			// 					} else {
			// 						var data = {
			// 							result: false,
			// 							message: res.message
			// 						};
			// 						$.zoombox.show('ajax', data);
			// 					}
			// 				}
			// 			})
			// 		}
			// 	}
			// });
			// 请输入采购税
			// $(".shui_sel").keyup(function() {
			// 	var suibian = $(this).next('.comp_sel');
			// 	var code = $(this).val();
			// 	if (code != '') {
			// 		$.ajax({
			// 			type: 'GET',
			// 			data: {
			// 				code: code
			// 			},
			// 			url: "index.php?item-app-ajax-getShuiByKey",
			// 			dataType: 'json',
			// 			success: function(res) {
			// 				if (res.statusCode == 200) {
			// 					suibian.html(res.data);
			// 				} else {
			// 					var data = {
			// 						result: false,
			// 						message: res.message
			// 					};
			// 					$.zoombox.show('ajax', data);
			// 				}
			// 			}
			// 		})
			// 	}
			// 	$(this).next("div").slideDown();
			// });
			// $(".s_select").on("click", "li", function() {
			// 	$(this).parent("ul").parent("div").siblings(".shui_sel").val($(this).text());
			// 	$(this).parent("ul").parent("div").siblings("input[type=hidden]").val($(this).attr("id"));
			// 	$(this).parent("ul").parent("div").hide();
			// });
			//提交订单
			$('#btn').on('click', function() {
				$.ajax({
					type: 'POST',
					data: $("#form1").serializeArray(),
					url: "index.php?user-company-yeeorder-orders",
					dataType: 'json',
					success: function(res) {
						if (res.statusCode == 200) {
							var data = {
								result: false,
								message: res.message
							};
							$.zoombox.show('ajaxOK', data);
							window.location.href = res.forwardUrl;
						} else {
							var data = {
								result: false,
								message: res.message
							};
							$.zoombox.show('ajax', data);
						}
					}
				})
			});
			//-----增加收货地址----------------
			$("#addressbtn").click(function() {
					var receiver = $("#receiver").val();
					var provinces = $("#provinces").val();
					var cities = $("#cities").val();
					var areas = $("#areas").val();
					var addressinfo = $("#addressinfo").val();
					var zipcode = $("#zipcode").val();
					var phone = $("#phone").val();
					if (receiver == false) {
						alert('请填写收货人姓名');
						return false;
					}
					if (provinces == false) {
						alert('请选择省份');
						return false;
					}
					if (cities == false) {
						alert('请选择市');
						return false;
					}
					if (areas == false) {
						alert('请选择地区');
						return false;
					}
					if (addressinfo == false) {
						alert('请选择详细地址');
						return false;
					}
					if (zipcode == false) {
						alert('请填写邮政编码');
						return false;
					}
					if (phone == false) {
						alert('请填收货人电话');
						return false;
					}
					$.ajax({
						type: 'get',
						url: 'index.php?user-company-yeeorder-addaddress&receiver=' + receiver + '&provinces=' + provinces + '&cities=' + cities + '&areas=' + areas + '&addressinfo=' + addressinfo + '&zipcode=' + zipcode + '&phone=' + phone,
						dataType: 'JSON',
						success: function(res) {
							if (res.statusCode == 200) {
								$("#address_more").append("<li class='sel_addr' value='" + res.data.addressid + "'><span></span><span>" + res.data.province + "&nbsp;" + res.data.city + "&nbsp;" + res.data.area + "&nbsp;" + res.data.addressinfo + "&nbsp;&nbsp;" + res.data.addressinfo + res.data.receiver + "&nbsp;&nbsp;" + res.data.phone + "</span><span class='del'><a class='btn confirm' href='index.php?user-company-yeeorder-deladdress&addressid=" + res.data.addressid + "'>删除</a></span></li>");
								$(".new_add").hide();
								//$("#form_hh")[0].reset();
								$(".new_add").find("input").val("");
								$(".new_add").find("select").val("");
							} else {
								alert('失败了');
							}
						},
						error: function(e) {
							console.log(e);
						}
					})
				})
				//新增收货地址
			$("#add").click(function() {
				if ($(this).next(".new_add").is(":hidden")) {
					$(this).next(".new_add").show();
				} else {
					$(this).next(".new_add").hide();
				}
			})
			//选择收货地址
			$("body").on("click", ".sel_addr", function() {
				console.log($(this).val());
				var addressid = $(this).val();
				$('#orderaddress').val(addressid);
			})
			//var isedit = 0; //是否编辑发票信息
			$(".isedit").on("change", function() {
				$('#isedit').val(1);
			});
		});
	</script>

</body>

</html>