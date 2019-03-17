{x2;include:header}

<body>
	{x2;include:nav}
	<style>
		.control-label {
			width: 135px !important;
			font-weight: 500;
			color: #000;
			margin-left: 50px;
		}
		
		.s_img {
			width: 300px;
			background: rgba(0, 153, 68, 0.05);
			margin-left: 120px !important;
			padding-left: 0px;
			padding-top: 20px;
			padding-bottom: 10px;
			display: none;
			/*position:relative;
        left:50%;
        transform: translate(-50%);*/
		}
		
		.s_img .qq-uploader-selector {
			position: relative;
			left: 50%;
			margin-left: -105px;
			height: 160px;
			margin-bottom: 10px;
		}
		
		.head {
			margin-left: 120px !important;
			padding-left: 0px;
			margin-bottom: 0px;
			background: #f5f5f5;
			box-shadow: inset 0 -1px 0 0 #eeeeee;
			width: 300px;
			height: 36px;
			line-height: 36px;
			padding: 0px;
			padding-left: 20px;
			margin-top: 0px;
		}
		
		.h_foot {
			text-align: center;
			/*height: 36px;*/
			line-height: 20px;
			font-size: 12px;
			padding: 0px 20px;
			color: #999;
		}
		input[type="file"]{
			display: block!important;
		}
		.img_s {
			float: right;
			width: 18px;
			margin-top: 10px;
			margin-right: 10px;
		}
		
		.sc {
			border: 1px solid rgb(204, 204, 204);
			border-radius: 4px;
			height: 30px;
			line-height: 30px;
			width: 110px;
			margin-top: 10px;
			padding-left: 20px;
			background: url(app/core/styles/images/upload.png) 15px center / 16px no-repeat;
			background-color: #fff;
			position: relative;
			overflow: hidden;
			direction: ltr;
			text-align: center;
		}
		
		.thumbnail img {
			width: 200px;
			height: 150px;
		}
		
		.img-delete-bg {
			color: #fff;
			border-bottom: 23px solid #009944;
			width: 46px;
			height: 46px;
			border-left: 23px solid rgba(255, 255, 255, 0);
			border-right: 23px solid rgba(255, 255, 255, 0);
			border-top: 23px solid rgba(255, 255, 255, 0);
			display: inline-block;
			transform: rotate(45deg);
			position: absolute;
			top: -30px;
			right: -23px;
			vertical-align: bottom;
			cursor: pointer;
			/* display: none;*/
		}
		
		.closes {
			z-index: 1000;
		}
		
		.closes:hover {
			color: #fff;
		}
		
		.img-delete-icon {
			font-size: 16px;
			position: absolute;
			top: 3px;
			right: -12px;
			font-style: normal;
			transform: rotate(47deg);
		}
		
		.reg_button {
			padding: 0px 20px;
			width: 100%;
			height: 34px;
			line-height: 28px;
			font-size: 16px;
		}
		
		#glsc .qq-uploader-selector {
			width: 86px!important;
			height: 62px;
		}
		
		#glsc .fineuploader {
			display: inline-block;
			margin-left: 84px;
		}
		
		#glsc .thumbnail {
			width: 86px;
		}
		
		#glsc .thumbnail img {
			width: 86px;
			height: 62px;
		}
		
		.load {
			line-height: 20px;
			font-size: 12px;
			width: 150px;
		}
		.text-center>span.btn{
			display: none;
		}
		
		.qq-upload-list-selector .error-reason{
			margin-top:-8px;
			width: 250px!important;
		}
		/*input[type=file]{
			z-index: 1000;
		}*/
		/*ul>div.error-reason{
			display: none;
		}*/
        #other_file input[name=qqfile],#fd input[name=qqfile],#ach input[name=qqfile]{
			height: 30px!important;
		}
		.load-progress-bar{
			position: absolute;
			top:0px;
			background: #f2faf5;
			height: 78px;
			z-index: 1000;
			text-align: center;
			
		}
		.loading-note{
			font-size: 13px;
		}
		#progress{
			margin-left: -20px;
		}
		.error-reason{
			font-size: 13px;
			margin-left: -50px;
		}
		/*.qq-upload-file-selector{margin-left: -48!important;}*/
		/*.fineuploader{height: 70px;position: relative}*/
		/*.qq-upload-list-selector .error-reason{margin-left: -86px;}*/
	.heading{background: none!important;color: #595656!important;text-align: left!important;border-bottom: 1px solid #f2f2f2;font-weight: bold;}
	.pull-left ul li{border: none!important;}
	.heading img{width: 25px;height: 25px;margin: 0 20px;}
	.active{color: #333;
    	background: url(app/core/styles/img/menu_icon/active.png) no-repeat!important;
    	background-size: auto 50px!important;
    	background-color: rgba(83,181,126,0.08)!important;}
	</style>
	<div class="zmm-zx-centent">
		<div class="container">
			<!-- 导航 start -->
			<div class="hln-zx-centent-title t20 b20">
				你所在的位置：
				<span><a href="index.php?user-company">企业中心</a> > <a>合作资料</a></span>
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
				<div class="right-content col10 pull-right contact-us" style="width:83%;float:left">
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
						<!--我的模块开始-->
						<div class="zmm_panel panel-default">
							<!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
							<div class="zmm-qydt-title zmm-qydt-shsj1">
								<p><em class="title-triangle"></em>合作资料</p>
								<!-- <a href="index.php?{x2;$_app}-company-basic-contactedit" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">编辑</a>-->
							</div>
							<p style="width:100%;color:#f23838;font-size:13px;padding-left:30px;margin:10px 0px 20px 0px;background:rgba(255,153,44,0.05);box-shadow:inset 0 -1px 0 0 rgba(255,153,44,0.15);">
								*本页资料仅天润业务人员可见，请放心上传
							</p>
							<form class="form-horizontal" method="post" action="index.php?cpmpany-app-company-information" id="form1">
								<!--三证合一-->
								<div class="form-group">
									<div style="margin-bottom: 20px;margin-left: 50px;"> 三证合一/五证合一/营业执照</div>
									<label class="control-label col-md-4"> 
					  	
					                 </label>
					                <input type="hidden" name="args[userid]" value="{x2;$data['userid']}">
									<div class="col-md-3">
										<script type="text/template" id="pe-template-photo2">
											<div class="qq-uploader-selector" style="width:210px" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
												<div class="qq-upload-button-selector" style="clear:both;">
													<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
														<li class="text-center">
															<div class="thumbnail">
																<img class="qq-thumbnail-selector" alt="点击上传新图片">
																<input type="hidden" class="qq-edit-filename-selector" name="args[company_licence_pic]" tabindex="0">
																<div class="img-delete-bg closes">
																	<em class="img-delete-icon">×</em>
																</div>
															</div>

														</li>

													</ul>
													<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
														<li class="text-center">
															<div class="thumbnail">
																<img class="qq-thumbnail-selector" src="{x2;if:$data['company_licence_pic']}{x2;$data['company_licence_pic']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
																<input type="hidden" class="qq-edit-filename-selector" needle="needle" msg="请上传企业营业执照" name="args[company_licence_pic]" tabindex="0" value="{x2;$data['company_licence_pic']}">
                                                                <div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
															</div>
														</li>
													</ul>

												</div>
											</div>
										</script>
										<div class="fineuploader" attr-type="thumb" attr-template="pe-template-photo2" attr-ftype="JPG,JPEG,GIF,PNG">

										</div>

									</div>
									<div class="col-md-5">
										<span class="c999" style="font-size: 12px;">
						                    1.请上传合法有效的营业执照<br>
						                    2.上传文件需加盖公章，清晰无涂抹<br>
						                    3.格式为JPG/JPEG/GIF/PNG，大小不要超过3M<br>
						                                       注：您的证件信息不会被其他用户看到，我们将严格保密，请放心上传
					                    </span>
									</div>
								</div>
								<!--下面的******************************-->
								<div>
									<div class="col-md-10">
										<div class="col-md-6">
											<!--资质等级证书-->
											<div class="form-group">
												<div class="head">资质等级证书<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
												<div class="s_img">
													<script type="text/template" id="pe-template-photo3">
														<div class="qq-uploader-selector" style="width:210px" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
															<div class="qq-upload-button-selector" style="clear:both;">
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][1]" tabindex="0">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>
																	</li>
																</ul>
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" src="{x2;if:$certificateInfo[1]['certificate_url']}{x2;$certificateInfo[1]['certificate_url']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][1]" tabindex="0" value="{x2;$certificateInfo[1]['certificate_url']}">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</script>
													<div class="fineuploader" attr-type="thumb" attr-template="pe-template-photo3" attr-ftype="JPG,JPEG,PNG"></div>
													<div class="h_foot">请提供资质等级证书</div>
												</div>
											</div>
											<!--资质等级证书-->
											<div class="form-group breviary">
												<div class="head">管理体系认证证书<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
												<div class="s_img" id="glsc">
													<!--第一张图片-->
													<script type="text/template" id="pe-template-photo51">
														<div class="qq-uploader-selector" style="width:210px" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
															<div class="qq-upload-button-selector" style="clear:both;">
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][5][]" tabindex="0">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>

																	</li>
																</ul>
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" src="{x2;if:$certificateInfo[5][0]['certificate_url']}{x2;$certificateInfo[5][0]['certificate_url']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][5][]" tabindex="0" value="{x2;$certificateInfo[5][0]['certificate_url']}">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</script>
													<div class="fineuploader" attr-type="thumb" attr-template="pe-template-photo51" attr-ftype="JPG,JPEG,PNG" style="margin-left: 121px;"></div>
													<!--第二张图片-->
													<script type="text/template" id="pe-template-photo52">
														<div class="qq-uploader-selector" style="width:210px" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
															<div class="qq-upload-button-selector" style="clear:both;">
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][5][]" tabindex="0">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>

																	</li>
																</ul>
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" src="{x2;if:$certificateInfo[5][1]['certificate_url']}{x2;$certificateInfo[5][1]['certificate_url']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][5][]" tabindex="0" value="{x2;$certificateInfo[5][1]['certificate_url']}">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</script>
													<div class="fineuploader" attr-type="thumb" attr-template="pe-template-photo52" attr-ftype="JPG,JPEG,PNG"></div>
													<!--第三张图片-->
													<script type="text/template" id="pe-template-photo53">
														<div class="qq-uploader-selector" style="width:210px" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
															<div class="qq-upload-button-selector" style="clear:both;">
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][5][]" tabindex="0">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>

																	</li>
																</ul>
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" src="{x2;if:$certificateInfo[5][2]['certificate_url']}{x2;$certificateInfo[5][2]['certificate_url']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][5][]" tabindex="0" value="{x2;$certificateInfo[5][2]['certificate_url']}">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</script>
													<div class="fineuploader" attr-type="thumb" attr-template="pe-template-photo53" attr-ftype="JPG,JPEG,PNG"></div>
													<div class="h_foot" style="clear: both;">请提供质量、职业健康安全、环境管理体系认证证书 </div>
												</div>
											</div>
											<!---->
											<!---->
											<div class="form-group">
												<div class="head">型式试验报告<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
												<div class="s_img" id="fd">
													<script type="text/template" id="pe-template-url6">

														<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;margin-left: 96px;height:70px">
															<div class="qq-upload-button-selector">
																<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center" style="margin-top:-5px;">
																		<div style="width:200px;text-align: left;"><span class="sc">点击上传</span></div>
																		<input size="60" class="form-control qq-edit-filename-selector address" type="hidden" name="args[user_certificates][6]" tabindex="0" value="{x2;$certificateInfo[6]['certificate_url']}" needle="needle" style="width:20px;">
																		<a class="qq-upload-file-selector <br />pdf_name load" style="margin-top:-10px;margin-left: -86px;width: 114px;"></a>
																	</li>
																</ul>
																<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center" style="margin-top:-5px;">
																		<div style="width:200px;text-align: left;"><span class="sc">点击上传</span></div>
																		<input type="hidden" class="qq-edit-filename-selector address" name="args[user_certificates][6]" tabindex="0" value="{x2;$certificateInfo[6]['certificate_url']}">
																		<a class="qq-upload-file-selector pdf_name load" style="margin-top:-10px;margin-left: -86px;width: 114px;">{x2;if:$certificateInfo[6]['certificate_url']}{x2;$certificateInfo[6]['fileName']}{x2;endif}</a>
																	</li>
																</ul>
															</div>

														</div>
													</script>
													<div class="fineuploader" attr-list="true" attr-template="pe-template-url6" attr-ftype="pdf,rar,zip,doc,docx,xls,xlsx" load-type="inner"></div>
												</div>
											</div>
											<!---->
											<div class="form-group">
												<div class="head">财务报表<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
												<div class="s_img" id="fd">
													<script type="text/template" id="pe-template-url1">

														<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;margin-left: 96px;height:70px">
															<div class="qq-upload-button-selector">
																<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center" style="margin-top:-5px;">
																		<div style="width:200px;text-align: left;"><span class="sc">点击上传</span></div>
																		<input size="60" class="form-control qq-edit-filename-selector address" type="hidden" name="args[user_certificates][7]" tabindex="0" value="{x2;$certificateInfo[7]['certificate_url']}" needle="needle" style="width:20px;">
																		<a class="qq-upload-file-selector pdf_name load" style="margin-top:-10px;margin-left: -86px;width: 114px;"></a>
																	</li>
																</ul>
																<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center" style="margin-top:-5px;">
																		<div style="width:200px;text-align: left;"><span class="sc">点击上传</span></div>
																		<input type="hidden" class="qq-edit-filename-selector address" name="args[user_certificates][7]" tabindex="0" value="{x2;$certificateInfo[7]['certificate_url']}">
																		<a class="qq-upload-file-selector pdf_name load" style="margin-top:-10px;margin-left: -86px;width: 114px;">{x2;if:$certificateInfo[7]['certificate_url']}{x2;$certificateInfo[7]['fileName']}{x2;endif}</a>
																	</li>
																</ul>
															</div>
															
														</div>
													</script>
													<div class="fineuploader" attr-list="true" attr-template="pe-template-url1" attr-ftype="pdf,rar,zip,doc,docx,xls,xlsx" load-type="inner"></div>
													<!--  <a class="file_a" href="?{x2;$_app}-company-privatement-test2" target="_blank" style="margin-left:10px;"></a>-->
													<div class="h_foot">请提供近三年审计过的财物报表及相关证明文件的复印件，含单位、联系人、联系电话等文件等复印件，并加盖公司 公章
													</div>
												</div>
											</div>
										</div>
										<!--右侧*****************************************************************************************************-->
										<!--资质等级证书-->
										<div class="col-md-6">
											<div class="form-group">
												<div class="head">安全生产许可证<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
												<div class="s_img">
													<script type="text/template" id="pe-template-photo6">
														<div class="qq-uploader-selector" style="width:210px" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
															<div class="qq-upload-button-selector" style="clear:both;">
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][2]" tabindex="0">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>
																	</li>
																</ul>
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" src="{x2;if:$certificateInfo[2]['certificate_url']}{x2;$certificateInfo[2]['certificate_url']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][2]" tabindex="0" value="{x2;$certificateInfo[2]['certificate_url']}">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</script>
													<div class="fineuploader" attr-type="thumb" attr-template="pe-template-photo6" attr-ftype="JPG,JPEG,PNG"></div>
													<div class="h_foot">请提供安全生产许可证
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="head">信誉等级证书<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
												<div class="s_img">
													<script type="text/template" id="pe-template-photo7">
														<div class="qq-uploader-selector" style="width:210px" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
															<div class="qq-upload-button-selector" style="clear:both;">
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][3]" tabindex="0">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>
																	</li>
																</ul>
																<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center">
																		<div class="thumbnail">
																			<img class="qq-thumbnail-selector" src="{x2;if:$certificateInfo[3]['certificate_url']}{x2;$certificateInfo[3]['certificate_url']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
																			<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][3]" tabindex="0" value="{x2;$certificateInfo[3]['certificate_url']}">
																			<div class="img-delete-bg closes">
																				<em class="img-delete-icon">×</em>
																			</div>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</script>
													<div class="fineuploader" attr-type="thumb" attr-template="pe-template-photo7" attr-ftype="JPG,JPEG,PNG"></div>
													<div class="h_foot">请提供信誉等级证书</div>
												</div>
											</div>
											<div class="form-group">
												<div class="head">业绩报表及相关证明文件<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
												<div class="s_img" id="ach">
													<script type="text/template" id="pe-template-url2">

														<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;margin-left: 96px;height:70px">
															<div class="qq-upload-button-selector">
																<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center" style="margin-top:-5px;">
																		<div style="width:200px;text-align: left;"><span class="sc">点击上传</span></div>
																		<input size="60" class="form-control qq-edit-filename-selector address" type="hidden" name="args[user_certificates][4]" tabindex="0" value="{x2;$certificateInfo[4]['certificate_url']}" needle="needle" style="width:20px;">
																		<a class="qq-upload-file-selector pdf_name load" style="margin-top:-10px;margin-left:-86px;width: 114px;"></a>
																	</li>

																</ul>
																<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="" style="margin-top:-5px;">
																		<span class="sc">点击上传</span>
																		<input type="hidden" class="qq-edit-filename-selector address" name="args[user_certificates][4]" tabindex="0" value="{x2;$certificateInfo[4]['certificate_url']}">
																		<span class="qq-upload-file-selector" style="display:none">{x2;if:$certificateInfo[4]['certificate_url']}{x2;$certificateInfo[4]['fileName']}{x2;endif}</span>
																	</li>
																</ul>
															</div>
															<a style="color:#333;" class="load" href="{x2;$certificateInfo[4]['certificate_url']}" download="{x2;$certificateInfo[4]['fileName']}">{x2;if:$certificateInfo[4]['certificate_url']}{x2;$certificateInfo[4]['fileName']}{x2;endif}</a>
														</div>

													</script>
													<div class="fineuploader" attr-list="true" attr-template="pe-template-url2" attr-ftype="pdf,rar,zip,doc,docx,xls,xlsx" load-type="inner"></div>
													<!--  <a id="file_a" href="?{x2;$_app}-company-privatement-test2" target="_blank" style="margin-left:10px;"></a>-->
													<div class="h_foot">请提供近三年审计过的业绩报表及相关证明文件的复印件，含单位、联系人、联系电话等文件等复印件，并加盖公司公章
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="head">其他文件<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
												<div class="s_img" id="other_file">
													<script type="text/template" id="pe-template-url3">

														<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;margin-left: 96px;height:70px">
															<div class="qq-upload-button-selector">
																<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center" style="margin-top:-5px;">
																		<div style="width:200px;text-align: left;"><span class="sc">点击上传</span></div>
																		<input size="60" class="form-control qq-edit-filename-selector address" type="hidden" name="args[user_certificates][8]" tabindex="0" value="{x2;$certificateInfo[8]['certificate_url']}" needle="needle" style="width:20px;">
																		<a class="qq-upload-file-selector pdf_name load" style="margin-top:-10px;margin-left: -86px;width: 114px;" href="{x2;$certificateInfo[8]['certificate_url']}" download="{x2;$certificateInfo[8]['certificate_url']}"></a>
																	</li>

																</ul>
																<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
																	<li class="text-center" style="margin-top:-5px;">
																		<div style="width:200px;text-align: left;"><span class="sc">点击上传</span></div>
																		<input type="hidden" class="qq-edit-filename-selector address" name="args[user_certificates][8]" tabindex="0" value="{x2;$certificateInfo[8]['certificate_url']}">
																		<a class="qq-upload-file-selector pdf_name load" href="{x2;$certificateInfo[8]['certificate_url']}" download="{x2;$certificateInfo[8]['certificate_url']}" style="margin-top:-10px;margin-left: -86px;width: 114px;">{x2;if:$certificateInfo[8]['certificate_url']}{x2;$certificateInfo[8]['fileName']}{x2;endif}</a>
																	</li>
																</ul>
															</div>
														<!--	<a style="color:#333;" class="load" href="{x2;$certificateInfo[8]['certificate_url']}" download="{x2;$certificateInfo[8]['fileName']}">{x2;if:$certificateInfo[8]['certificate_url']}{x2;$certificateInfo[8]['fileName']}{x2;endif}</a>-->
														</div>
													</script>
													<div class="fineuploader" attr-list="true" attr-template="pe-template-url3" attr-ftype="pdf,rar,zip,doc,docx,xls,xlsx" load-type="inner"></div>

												</div>
											</div>
										</div>
									</div>

									<div style="clear: both;"></div>
									<input type="hidden" name="categoryedit" value="1">
								</div>
								<div class="col-md-12" style="text-align: center;margin-bottom: 10px;margin-top: 20px;">
									<button type="button" id="reg_btn" class="button_tt reg_button" style="width:100px;background:#007222">保存</button>
									<button type="button" id="ret_btn" class="button_tt reg_button" style="width:100px;background: #fff!important;color: #333;border:1px solid #ccc;line-height:28px;margin-left: 20px;">取消</button>

								</div>
								<div style="clear: both;"></div>
							</form>
						</div>
						<!--我的模块结束-->
					</div>
				</div>
				<!-- 右侧  end -->
			</div>
		</div>
	</div>
	{x2;include:footer2}

	<script type="text/javascript">
	    // 头部样式
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

	    // 
		$(function() {
			$(".thumbnail").each(function() {
				if ($(this).find("img").attr("src") == "app/core/styles/images/noimage.gif") {
					//          		alert("d");
					$(this).parents(".fineuploader").find(".closes").remove();
				}
			})
			$('.submenu:eq(0)').delay(400).slideDown(700);
			$('.submenu:eq(0) li:eq(7)').addClass("active");
			//打击菜单头部收缩
			$(".head").click(function() {
				if ($(this).next().css("display") == "none") {
					$(this).next().show();
					$(this).find("img").attr("src", "app/core/styles/img/s_sl.png");
					$(this).parent(".form-group").siblings(".form-group").find(".s_img").hide();
					$(this).parent(".form-group").siblings(".form-group").find(".head").find("img").attr("src", "app/core/styles/img/x_sl.png");
				} else {
					$(this).next().hide();
					$(this).find(".img_s").attr("src", "app/core/styles/img/x_sl.png");
				}
			})
			$('#reg_btn').on('click', function() {
				$.ajax({
					type: 'POST',
					data: $("#form1").serializeArray(),
					url: "index.php?company-app-company-information",
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
			})
			$('#ret_btn').on('click', function() {
				window.location.reload();
			});
			//下载Pdf
			$(document).on("click",".load",function() {
				var a = $(this).siblings(".address").val();
				$(this).attr("href", a);
				$(this).attr("download", a);
			})
			$(".fineuploader").on("click", ".closes", function() {
				$(this).siblings("img").attr("src", "app/core/styles/images/noimage.gif");
				$(this).siblings("input").val("");
				$(this).remove();
			})
		});
	</script>
	<!--<script type="text/javascript" src="app/core/styles/js/user/company/goods_add.js"></script>-->
</body>

</html>