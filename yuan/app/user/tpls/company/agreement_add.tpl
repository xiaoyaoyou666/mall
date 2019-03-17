{x2;include:header}
<style>
	table tr td {
		border: 0px;
	}
	
	table.f tr td {
		height: 50px;
		border: 0px;
		line-height: 50px;
	}
	
	table.f tr td span {
		margin-right: 10px;
		display: inline-block;
		width: 90px;
	}
	
	table td input {
		width: 320px;
		border-radius: 4px;
		height: 32px;
		border: solid 1px #ccc;
		display: inline-block;
		text-indent: 10px;
		font-size: 13px;
	}
	
	input[type="file"] {
		display: inline-block;
	}
	
	.files {
		display: inline-block;
		width: 100px;
		height: 30px;
		position: relative;
		border: 1px solid #eeeeee;
		border-radius: 4px;
		line-height: 30px;
		top: 9px;
	}
	
	.files input {
		position: absolute;
		opacity: 0;
		z-index: 1000;
	}
	
	.files span {
		position: absolute;
		left: 0px;
		top: 0px;
		width: 100px !important;
		background: url(app/core/styles/img/sc.png) no-repeat 5px;
		background-size: 14px;
		padding-left: 24px;
	}
	
	.why-btn-big-green {
		border-radius: 4px;
		height: 30px;
		line-height: 30px;
		padding: 0 20px;
	}
	
	.why-btn-big-green:hover {
		color: #fff;
	}
	
	.spec {
		padding: 0px 20px;
		height: 21px;
		line-height: 21px;
		margin-right: 25px;
		background: rgba(0, 153, 68, 0.10);
		border-radius: 20px;
	}
	
	.pri input {
		width: 60px;
		height: 20px;
		margin-right: 25px;
	}
	
	.pit {
		background: rgba(0, 153, 68, 0.03);
	}
	
	#xz_show tr {
		cursor: pointer;
		border-bottom: 1px solid #ebebeb;
	}
	
	#xz_show tr:last-child {
		border-bottom: none;
	}
	
	#xz_show tr th {
		border: none;
	}
	
	#xz_show tr td {
		border: 0px !important;
	}
	
	#xz_show tr ul li {
		float: left;
	}
	
	#xz_show tr ul li span {
		display: block;
	}
	
	#xz_show div {
		height: 30px;
		line-height: 30px;
	}
	
	.xz ul {
		display: none;
	}
	
	.pit ul {
		display: block;
	}
	
	.ul_select,
	.sl_select {
		display: inline-block;
	}
	
	.select {
		background: rgba(0, 153, 68, 0.80) !important;
		color: #fff !important;
	}
	
	input[type="checkbox"] {
		-webkit-appearance: none;
		background-color: #fff;
		border: solid 1px #ccc;
		border-radius: 2px;
	}
	
	input:checked {
		-webkit-appearance: none;
		background: url(app/core/styles/img/checked.png) no-repeat center;
		background-size: 12px;
		background-color: #fff;
		border: solid 1px #ccc;
		outline: none;
	}
	
	.fineuploader {
		float: left;
	}
	
	.hln-cue {
		color: red;
		margin-right: 3px;
		font-style: normal;
	}
	
	.ul_select li,
	.sl_select li {
		padding-left: 10px;
		line-height: 30px;
	}
	.selects{
		width:340px!important;
		overflow: auto!important;
	}
	.ul_select li:hover,
	.sl_select li:hover {
		background: #fcfcfc;
		cursor: pointer;
	}
	#tj:hover{
		cursor: pointer;
	}
</style>

<body>
	{x2;include:nav}
	<div class="zmm-zx-centent">
		<div class="container">
			<!-- 导航 start -->
			<div class="hln-zx-centent-title t20 b20">
				你所在的位置：
				<span><a href="index.php">企业中心</a> > <a>网格超市货架维护</a> > <a>框架协议</a></span>
			</div>
			<!-- 导航 end -->
			<div class="qycenter-content">
				<!-- 左侧栏 start -->
				{x2;include:menu}
				<!-- 左侧栏 end -->

				<!-- 右侧  start -->
				<div class="right-content col10 pull-right">
					<div class="zmm_panel panel-default">
						<div class="zmm-qydt-title zmm-qydt-shsj1">
							<p><em class="title-triangle"></em>协议上传</p>

						</div>
						<div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
							<form action="index.php?user-company-items-lite" method="post" id="form1">
								<fieldset>
									<table class="f">
										<tr>
											<td>
												<span><em class="hln-cue">*</em>甲&nbsp;&nbsp;&nbsp;方：</span>
												<div class="ul_select" style="margin-left: -4px">
													<input type="hidden" value="" name="args[comp_code]" id="comp_id">
													<input type="text" class="comp_sel" name="args[comp_name]" placeholder="请输入甲方名称关键字,平台帮您模糊搜索">
													<div class="selects" style="width:310px;height:200px;display: none;border:solid 1px #eee;background:#fff;position: absolute;z-index: 1000;;">
													</div>
												</div>
											</td>
											<td><span>乙&nbsp;&nbsp;&nbsp;&nbsp;方：</span><input type="text" style="border: 0px;" readonly="readonly" value="{x2;$_user['company_name']}">
											</td>
										</tr>

										<tr>
											<td><span><em class="hln-cue">*</em>协议编号：</span><input id="agr_num" type="text" name="args[agreement_number]" placeholder="请输入协议编号">
											</td>
											<td><span><em class="hln-cue">*</em>有效期：</span>
												<input id="upfile-time" type="text" style="width: 140px;display: inline-block;" class="form-control goods-time-input"  name="args[starttime]" data-date-format="yyyy-mm-dd"> - 
												<input id="entering-time" name="args[endtime]" type="text" style="width: 140px;display:inline-block;"
													class="form-control goods-time-input" data-date-format="yyyy-mm-dd">
                                               
										</tr>

										<tr>
											<td colspan="2">
												<span><em class="hln-cue">*</em>付款条款：</span>
												<div class="sl_select" style="margin-left: -4px;">
													<input type="hidden" value="" name="args[fukuan_code]" id="fukuan_id">
													<input type="text" class="fukuan_sel" placeholder="请输入付款条款关键字，例如“货到”，“80%”等">
													<div class="selects" style="width:310px;height:200px;display: none;border:solid 1px #eee;background:#fff;position: absolute;z-index: 1000;">
													</div>
												</div>
											</td>
										</tr>

										<tr>
											<td colspan="2">
												<span style="float:left"><em class="hln-cue">*</em>协议上传:</span>
												<script type="text/template" id="pe-template-url">
													<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
														<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
															<div class="qq-upload-button-selector" style="border:solid 1px #ccc;border-radius: 4px;height:30px;line-height: 30px;margin-top:10px;padding-left: 30px;background:url(app/core/styles/images/upload.png) no-repeat 15px;background-size:16px;">
																<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<span>点击上传</span>
																		<input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[pdf]" tabindex="0" value="" needle="needle" style="width:20px;" id="file_address"><span class="qq-upload-file-selector" style="display: none;" id="file_w"></span>
																	</li>

																</ul>
																<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<span>点击上传</span>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</script>
												<div class="fineuploader" attr-list="true" attr-template="pe-template-url" attr-ftype="pdf"></div>
												<a id="file_a" target="_blank" style="margin-left:20px;margin-right: 5px;"></a>
												<span style="width: 300px;color: #999;">(请您上传PDF格式协议，不超过50M)</span>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<span><em class="hln-cue">*</em>协议商品:</span>
												<a class="why-btn-big-green" id="xz_file" style="margin-left: -4px;">选 择</a>
												<a class="why-btn-big-green" id="save" style="display: none;margin-left: 530px;">保存</a>
											</td>
										</tr>
									</table>
									<!--展示选中信息-->

									<table class="table table-hover table-bordered" style="display: none;width:600px;margin-left: 100px;" id="show">
										<thead style="background:#f5f5f5;color:#333">
											<tr>
												<th>物料编码</th>
												<th>商品名称</th>
												<th>规格</th>
												<th>协议价</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>1</td>
												<td>1</td>
												<td>1</td>

											</tr>
										</tbody>
									</table>
									<!--可以选择的-->

									<div style="width: 616px;height:300px;overflow: auto;display: none;margin-left: 100px;" id="xz_show">

										<table class="table table-hover table-bordered xz" style="width:auto;min-width: 600px;">
											<thead style="background:#f5f5f5;color:#333">
												<tr>
													<th width="60px">选择</th>
													<th>商品名称</th>

												</tr>
											</thead>
											<tbody>
												{x2;tree:$goods,good,cid}
												<tr>
													<td style="text-align: center;">
														<div><input type="checkbox"></div>
														<ul>
															<li>
																<div>规格</div>
																<div>协议价</div>
															</li>
														</ul>

													</td>
													<td>
														<div class="shop_name">{x2;v:good['goodstitle']}</div>
														<ul>

															{x2;tree:v:good['goodsitem'],gooditem,itid}
															<li class="lis">
																<div style="padding-top:5px;">
																	<input type="checkbox" name="goods[{x2;v:good['goodsid']}][{x2;v:gooditem['itemid']}][item]" style="display: none">
																	<span class="spec">
                                                                <span class="spec2" style="display: inline">{x2;v:gooditem['FJLSBJCL_XHGG']}</span>
																	<span class="code" style="display: inline">{x2;v:gooditem['FJLSBJCL_WLBH']}</span></span>
																</div>
																<div class="pri">&yen; <input type="text" name="goods[{x2;v:good['goodsid']}][{x2;v:gooditem['itemid']}][pric]" class="price"></div>
																<input type="hidden" name="goods[{x2;v:good['goodsid']}][{x2;v:gooditem['itemid']}][name]" value="{x2;v:good['goodstitle']}">
															</li>
															{x2;endtree}

														</ul>
													</td>
												</tr>
												{x2;endtree}

											</tbody>
										</table>
									</div>
									<div class="col-md-12" style="text-align: center;">

										<span class="why-btn-big-green" id="tj">提交</span>
										<a class="why-btn-big-green" id="qx" style="background: #fff;color:#000000;border:solid 1px #ccc;margin-left: 20px;" href="index.php?user-company-agreement-agreement">取消</a>
									</div>
								</fieldset>
								<input type="hidden" value="" name="args[pdf_name]" id="pdf_name">
								<input type="hidden" value="1" name="create">
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	{x2;include:footer2}
	<script type="text/javascript" src="app/core/styles/js/user/company/agreementinfo.js"></script>
	<script type="text/javascript" src="app/core/styles/js/pdfobject.js"></script>

	<script>
		$(function() {
			//提交
			$('#tj').on('click', function() {
				if ($('#comp_id').val() == '') {
					$.zoombox.show('ajax', {
						result: false,
						message: '请选择甲方'
					});
					return false;
				}
				if ($('#agr_num').val() == '') {
					$.zoombox.show('ajax', {
						result: false,
						message: '请填写协议编号'
					});
					return false;
				}
				if ($('#start').val() == '' || $('#endt').val() == '') {
					$.zoombox.show('ajax', {
						result: false,
						message: '请选择有效期'
					});
					return false;
				}
				if ($('#start').val() > $('#endt').val()) {
					$.zoombox.show('ajax', {
						result: false,
						message: '请选择有效期'
					});
					return false;
				}
				if ($('#fukuan_id').val() == '') {
					$.zoombox.show('ajax', {
						result: false,
						message: '请选择付款条款'
					});
					return false;
				}
				if (typeof($('#file_address').val()) == 'undefined') {
					$.zoombox.show('ajax', {
						result: false,
						message: '请上传协议'
					});
					return false;
				}
				var submits = false;
				$("#xz_show").find(".lis").each(function() {
					if ($(this).find(".spec").hasClass("select")) {
						
						if ($(this).find(".select").parent("div").siblings(".pri").find("input").val() == "") {
							$(this).find(".select").removeClass("select");
							submits = false;
						} else {
							submits = true;
						}
					}
				})
				if (submits == true) {
					$.ajax({
						type: 'POST',
						data: $("#form1").serializeArray(),
						url: "index.php?user-company-agreement-agreementAdd",
						dataType: 'json',
						success: function(res) {
							if (res.statusCode == 200) {
								var data = {
									result: false,
									message: res.message
								};
								$.zoombox.show('ajaxOK', data);
								window.location.href = "index.php?user-company-agreement-agreement";
							} else {
								var data = {
									result: false,
									message: res.message
								};
								$.zoombox.show('ajax', data);
							}
						}
					})
				} else {
					$.zoombox.show('ajax', {
						result: false,
						message: '请完整填写协议商品信息'
					});
					return false;
				}
			});
			//        function pdf(){
			//         var myPDF = new PDFObject({ url: "app/core/styles/js/sample.pdf" }).embed("file_a");
			//         };
			var a_href;
			$('.submenu:eq(1)').delay(400).slideDown(700);
			$('.submenu:eq(1) li:eq(1)').addClass("active")
			$(document).on('change', 'input[type=file]', function() {
				if ($("#file_w").text() !== "") {
					$("#file_a").text($("#file_w").text());
					$("#pdf_name").val($("#file_w").text());
				}
			})
			  $("#file_a").click(function() {
					var a = $("#file_address").val();
					$(this).attr("href", "?{x2;$_app}-company-privatement-test2&" + a);
				})
				//        $("input[type=file]").change(function () {
				//                if ($("#file_w").text() !== "") {
				//                    $("#file_a").text($("#file_w").text());
				//                    $("#pdf_name").val($("#file_w").text());
				//                }
				//            }
				//        )
			$("#xz_file").click(function() {
				$("#xz_show").show();
				$("#save").show()
				$(this).hide();
			})
			$("#xz_show").on("click", "tr", function() {
				$(this).addClass("pit");
				$(this).find("input[type=checkbox]").prop("checked", true);
				$(this).siblings("tr").removeClass("pit");
				$(this).siblings("tr").each(function() {
					if ($(this).find(".select").length > 0) {
						if ($(this).find(".select").parent("div").siblings(".pri").find("input").val() == "") {
							$(this).find("input[type=checkbox]").removeAttr("checked");
						}
					} else {
						$(this).find("input[type=checkbox]").removeAttr("checked");
					}
				})
			})
			$("#xz_show").on("click", ".spec", function() {
				if ($(this).hasClass("select")) {
					$(this).removeClass("select");
					$(this).prev("input").removeAttr("checked");
				} else {
					$(this).addClass("select");
					$(this).prev("input").prop("checked", true);
				}
			})
			//选择公司
			$(".comp_sel").keyup(function() {
				var suibian = $(this).next('.selects');
				var code = $(this).val();
				var ad = $(this).next("div");
				if (code != '') {
					$.ajax({
						type: 'GET',
						data: {
							code: code
						},
						url: "index.php?item-app-ajax-getCompanyByCode",
						dataType: 'json',
						success: function(res) {
							if (res.statusCode == 200) {
								suibian.html(res.data);
								if(res.data=="<ul></ul>"){
									
								}else{
									ad.slideDown();
									console.log(res.data);
								}
							} else {
								var data = {
									result: false,
									message: res.message
								};
								$.zoombox.show('ajax', data);
							}
						}
					})
				}

			});
			$(".ul_select").on("click", "li", function() {
				$(this).parent("ul").parent("div").siblings(".comp_sel").val($(this).text());
				$(this).parent("ul").parent("div").siblings("input[type=hidden]").val($(this).attr("name"));
				$(this).parent("ul").parent("div").hide();
				var wl = $(this).parent("ul").parent("div").siblings(".comp_sel").val().length * 14;
				if (wl > $(this).parent("ul").parent("div").siblings(".comp_sel").width()) {
					$(this).parent("ul").parent("div").siblings(".comp_sel").width(wl);
				} else {
					$(this).parent("ul").parent("div").siblings(".comp_sel").width(320);
				}
			});
			//选择付款条码
			$(".fukuan_sel").keyup(function() {
				var suibian = $(this).next('.selects');
				var code = $(this).val();
				var ad = $(this).next("div");
				if (code != '') {
					$.ajax({
						type: 'GET',
						data: {
							code: code
						},
						url: "index.php?item-app-ajax-getFukuanByCode",
						dataType: 'json',
						success: function(res) {
							if (res.statusCode == 200) {
								suibian.html(res.data);
								if(res.data=="<ul></ul>"){
									
								}else{
									ad.slideDown();
									console.log(res.data);
								}
							} else {
								var data = {
									result: false,
									message: res.message
								};
								$.zoombox.show('ajax', data);
							}
						}
					})
				}
				
			});
			$(".sl_select").on("click", "li", function() {
				$(this).parent("ul").parent("div").siblings(".fukuan_sel").val($(this).text());
				$(this).parent("ul").parent("div").siblings("input[type=hidden]").val($(this).attr("name"));
				$(this).parent("ul").parent("div").hide();
				var wl = $(this).parent("ul").parent("div").siblings(".fukuan_sel").val().length * 14;
				if (wl > $(this).parent("ul").parent("div").siblings(".fukuan_sel").size()) {
					$(this).parent("ul").parent("div").siblings(".fukuan_sel").width(wl);
				} else {
					$(this).parent("ul").parent("div").siblings(".fukuan_sel").width(320);
				}
			});
			//
			$("#save").click(function() {
				$("#show tbody").empty();
				$("#xz_show").find(".lis").each(function() {
					if ($(this).find(".spec").hasClass("select")) {					
						if ($(this).find(".select").parent("div").siblings(".pri").find("input").val() == "") {
							$(this).find(".select").removeClass("select");
							alert("选中规格下的价格不能为空");
							return;
						} else {
							if ($(this).find(".select").length > 0) {
							    $(this).parents("tr").addClass("order");
						    } else {
							    $(this).find("input[type=checkbox]").removeAttr("checked");
						    }
						}
					}
				})
//				$("#xz_show tbody").find("tr").each(function() {
//					if ($(this).find(".select").parent("div").siblings(".pri").find("input").val() == "") {
//						alert("选中规格下的价格不能为空");
//						return;
//					} else {
//						if ($(this).find(".select").length > 0) {
//							$(this).addClass("order");
//						} else {
//							$(this).find("input[type=checkbox]").removeAttr("checked");
//						}
//					}
//				})
				$("#xz_show tbody").find("tr.order").each(function() {
					var shop_name = $(this).find(".shop_name").text();
					$(this).find(".select").each(function() {
						var code = $(this).find(".code").text();
						var price = $(this).parent("div").next().find(".price").val();
						var spec = $(this).find(".spec2").text();
						$("#show").show();
						$("#show tbody").append("<tr><td>" + code + "</td><td>" + shop_name + "</td><td>" + spec + "</td><td>" + price + "</td></tr>");
					})
				})
				$("#xz_file").show();
				$(this).hide();
				$("#xz_show").hide();
			})
		});
	</script>
</body>

</html>