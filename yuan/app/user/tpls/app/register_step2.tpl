{x2;include:header}
<style>
	.form-horizontal .form-group {
		margin-left: 300px;
		margin-right: 0px;
	}
	
	.form-horizontal .control-label {
		width: 135px;
		font-weight: 500;
		color: #000;
	}
	
	.hln-head-img {
		margin-left: 0px!important;
	}
	
	textarea {
		border: solid 1px #ccc;
		border-radius: 4px;
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		padding-left: 15px;
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
		margin-bottom: 20px;
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
		padding-left: 10px;
		margin-top: 0px;
	}
	
	.h_foot {
		text-align: center;
		/*height: 36px;*/
		line-height: 20px;
		font-size: 12px;
		padding-left: 20px;
		padding-right: 20px
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
		width: 100px;
		margin-top: 10px;
		padding-left: 30px;
		background: url(app/core/styles/images/upload.png) 10px center / 16px no-repeat;
		position: relative;
		overflow: hidden;
		direction: ltr;
		background-color: #fff;
	}
	
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
	
	.thumbnail img {
		width: 200px;
		height: 150px;
	}
	
	.head_img {
		width: 18px;
		float: left;
		margin-top: 10px;
		margin-right: 10px;
		display: none;
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
		z-index: 1000;
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
	
	input[type="file"] {
		z-index: 1000;
	}
	
	.text-center>span.btn {
		display: none;
	}
	
	.input_n {
		width: 60px;
		height: 20px;
		padding-left: 2px;
		font-size: 12px;
	}
</style>

<body>
	<header class="why-header">
		<div class="container">
			<ul class="pull-left">
				<li class="r40">欢迎访问天工e购电子商务平台</li>
			</ul>
            <p style="width: 130px;line-height: 30px;">
                <a href="http://www.tgcw.net.cn" target="_blank" style="border-left: none;display: block;margin-top: 6px;"><img style="width: 20px;float: left;margin-right: 5px;margin-top: 5px" src="app/core/styles/img/894201251291701630.png"/><i style="font-style: normal;color: #E9902A;">总平台</i></a>
            </p>
		</div>
	</header>
	<div class="clear"></div>
	<form class="form-horizontal" method="post" action="index.php?user-app-register-step2" id="form1">
		<div class="why-main-logo">
			<div class="container">
				<div class="pull-left">
					<a href="index.php"><img style="width: 258px;margin-left: 4px;" src="app/core/styles/images/index/login.png?" alt=""></a>
				</div>
				<h3 class="reg_h3" style="margin-top: 8px">企业账号注册</h3>
			</div>
		</div>
		<div class="register_box">
			<div class="container">
				<div class="form-group hln-head-img">
					<img alt="" src="app/core/styles/images/login/regist-step02.png">
				</div>
				<div class="form-group">
					<h4 class="control-label" style="text-align: left;"><b>基本信息</b></h4>
				</div>

				<div class="form-group">
					<div class="col-md-12">
						<label class="control-label col-md-4" style="width: 110px;margin-left: 10px;"><span class="hln-cue">*</span>
                        企业类型</label>
						<div class="col-md-5" style="margin-left: 5px;">
							<label class="checkbox-inline hln-checkbox-inline">
                            <input class="eType" name="args[company_category][]" value="设备商"
                                   type="checkbox"><span>设备类</span>
                            </label>
							<label class="checkbox-inline">
                            <input class="eType" name="args[company_category][]" value="施工商"
                                   type="checkbox"><span>施工类</span>
                        </label>
						</div>
					</div>
					<div class=" col-md-12">
						<label class="control-label col-md-4" style="text-align: left;padding-left:50px;font-size: 13px;margin-top: -9px;color: #999;">(可多选)</label>
						<div class="col-md-5" style="padding-left:5px">
							<label class="checkbox-inline hln-checkbox-inline">
                            <input class="eType" name="args[company_category][]" value="材料商"
                                   type="checkbox"><span>材料类</span>
                        </label>
							<label class="checkbox-inline">
                            <input class="eType" name="args[company_category][]" value="服务商"
                                   type="checkbox"><span>服务类</span>
                        </label>
						</div>
					</div>
					<div class=" col-md-12">
						<label class="control-label col-md-4"> </label>
						<div class="col-md-5" style="padding-left:5px">
							<label class="checkbox-inline hln-checkbox-inline">
                            <input class="eType" name="args[company_category][]" value="配件商"
                                   type="checkbox"><span>配件类</span>
                        </label>
							<label class="checkbox-inline">
                            <input class="eType" name="args[company_category][]" value="其他"
                                   type="checkbox"><span>其他</span>
                        </label>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-md-4"><span
                            class="hln-cue">*</span> 企业名称</label>
					<div class="col-md-4">
						<input class="form-control" needle="needle" msg="请输入企业名称" name="args[company_name]" type="text" placeholder="请输入企业名称" id="company_name">
						<div class="form-control-static clo-md-3" style="color: #999;">与营业执照名称一致</div>
					</div>

				</div>
				<div class="form-group">
					<label class="control-label col-md-4"><span
								class="hln-cue">*</span> 注册资本</label>
					<div class="col-md-4">
						<input class="form-control" needle="needle" msg="请输入注册资本" name="args[company_capital]" type="text" placeholder="请输入注册资本" id="company_capital">

					</div>
					万元
				</div>

				<div class="form-group">
					<label class="control-label col-md-4"> 所在行业</label>
					<div class="col-md-4">
						<select class="form-control" name="args[industry]">
                        <option value="" selected style="display: none;">请选择行业</option>
                        <option value="020701">建筑业</option>
                        <option value="020702">制造业</option>
                        <option value="020703">电力、热力、燃气及生产和供应业</option>
                        <option value="020704">交通运输、仓储和邮政业</option>
                        <option value="020705">信息传输、软件和信息技术服务业</option>
                        <option value="020706">金融业</option>
                        <option value="020707">房地产业</option>
                        <option value="020708">租赁和商务服务业</option>
                        <option value="020709">科学研究和技术服务业</option>
                        <option value="020710">公共管理、社会保障和社会组织</option>
                        <option value="020711">其他</option>
                    </select>
					</div>
				</div>
				<!--供货范围**********************************************************************************************-->
				<div class="form-group">
					<label class="control-label col-md-4"><span class="hln-cue">*</span>供货范围</label>
					<div class="col-md-8" style="padding-left: 0px;">
						<div id="show_check" style="margin-left:15px;">
							<ul></ul>
						</div>
						<div class="col-md-4" style="margin-right: 5px;" id="first_c">
							<select class="form-control">
                            <option value="-1">请选择一级分类</option>
                            {x2;tree:$parentcat,cat,cid}
                            <option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
                            {x2;endtree}
                        </select>
						</div>
						<div class="col-md-4" id="sed_c">
							<select class="form-control">
                            <option>请选择二级分类</option>
                        </select>
						</div>
						<div class="col-md-3">
							<span id="submit_check" style="display: none;" class="btn btn-primary">保存</span>
						</div>
					</div>

				</div>
				<div class="form-group">
					<label class="control-label col-md-4"></label>
					<div class="col-md-8" id="three_c" style="padding-left: 135px;">

					</div>

				</div>
				<!--哈哈哈哈 完事-->
				<div class="form-group">
					<label class="control-label col-md-4"> 企业简介</label>
					<div class="col-md-4">
						<textarea rows="5" style="width: 100%" placeholder="请输入企业简介" name="args[company_intro]"></textarea>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-md-4"> 企业官网</label>
					<div class="col-md-4">
						<input class="form-control" name="args[company_url]" type="text" placeholder="请输入企业官网">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">企业邮箱</label>
					<div class="col-md-4">
						<input class="form-control" name="args[useremail]" type="text" placeholder="请输入企业邮箱">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4">
						<span class="hln-cue">*</span> 发票类型
					</label>
					<div class="col-md-6">
						<label class="checkbox-inline hln-checkbox-inline" style="display: inline-block;">
                            <input class="eType" name="args[company_invoice][]" value="1"  type="checkbox" checked="checked">
                            <span>增值税专用发票</span>
                        </label>
						<label class="checkbox-inline hln-checkbox-inline" style="margin-left: 0px;display: inline-block;">
                            <input class="eType" name="args[company_invoice][]" value="2"  type="checkbox">
                            <span>增值税普通发票</span>
                        </label>

					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4"> 企业LOGO</label>
					<div class="col-md-3">
						<script type="text/template" id="pe-template-photo">
							<div class="qq-uploader-selector" style="width:210px" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
								<div class="qq-upload-button-selector" style="clear:both;">
									<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
										<li class="text-center">
											<div class="thumbnail">
												<img class="qq-thumbnail-selector" alt="点击上传新图片">
												<input type="hidden" class="qq-edit-filename-selector" name="args[company_logo]" tabindex="0">
												<div class="img-delete-bg closes">
													<em class="img-delete-icon">×</em>
												</div>
											</div>
										</li>
									</ul>
									<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
										<li class="text-center">
											<div class="thumbnail">
												<img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
												<input type="hidden" class="qq-edit-filename-selector" name="args[company_logo]" tabindex="0" value="">
											</div>
										</li>
									</ul>
								</div>
							</div>
						</script>
						<div class="fineuploader" attr-type="thumb" attr-template="pe-template-photo" attr-ftype="JPG,JPEG,PNG"></div>
					</div>
					<div class="col-md-5">
						<span class="c999 t20" style="font-size: 12px;">
						1.请上传企业条形LOGO，用于企业主页展示，要求清晰<br>
						2.LOGO要求尺寸162*54像素，格式为JPG/JPEG/PNG，大小不要超过3M
					</span>
					</div>
				</div>

				<div class="form-group">
					<h4 class="control-label" style="text-align: left;"><b>企业资质</b></h4>
				</div>
				<div class="form-group">
					<div style="margin-bottom: 20px;"><span class="hln-cue">*</span> 三证合一/五证合一/营业执照</div>
					<label class="control-label col-md-4"> 
					  	
					</label>
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
												<img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
												<input type="hidden" class="qq-edit-filename-selector" needle="needle" msg="请上传企业营业执照" name="args[company_licence_pic]" tabindex="0" value="">

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
				<!--上传图片-->
				<div>

					<div class="col-md-7">
						<div class="col-md-6">
							<!--资质等级证书-->
							<div class="form-group">
								<div class="head"><img src="app/core/styles/img/x_sl.png" class="head_img">资质等级证书<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
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
															<img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
															<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][1]" tabindex="0" value="">
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
								<div class="head"><img src="app/core/styles/img/x_sl.png" class="head_img">管理体系认证证书<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
								<div class="s_img" style="height:auto">
									<div class="sortable" id="goodsphotos-range" style="bottom: 50px;margin-left:50px;overflow: hidden;">

									</div>

									<script type="text/template" id="pe-template-goodsphotos">
										<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">

											<div class="qq-upload-list-selector hide" aria-live="polite" aria-relevant="additions removals">
												<span></span>
											</div>

											<div class="listimg hide">
												<div class="thumbnail col-xs-3 listimgselector" style="margin-right:5px;width: 60px;">
													<img class="qq-thumbnail-selector" alt="点击上传新图片" src="*value*" style="width: 100%;height:50px">
													<input type="hidden" class="qq-edit-filename-selector" name="*name*" tabindex="0" value="*value*">
													<div class="img-delete-bg">
														<em class="img-delete-icon">×</em>
													</div>
												</div>
												<!-- <div style="clear: both;"></div>-->
											</div>

											<div class="qq-upload-button-selector qq-upload-button" style="clear:both;left:50%;">
												<img src="app/core/styles/images/noimage.gif" class="select-imgs-button" alt="添加文件">
												<!--<a class="btn btn-primary" style="background-color:#009944;">添加文件</a>-->
											</div>

										</div>
									</script>
									<div style="float: left" class="fineuploader" max-length="3" attr-box="goodsphotos-range" attr-name="args[user_certificates][5][]" attr-type="list" attr-list="true" attr-template="pe-template-goodsphotos"></div>
									<div style="clear: both;"></div>
									<div class="h_foot">请提供质量、职业健康安全、环境管理体系认证证书</div>

								</div>
							</div>
							<!---->
							<!---->
							<div class="form-group">
								<div class="head"><img src="app/core/styles/img/x_sl.png" class="head_img">型式试验报告<span style="color: #999;font-size: 12px;">(请上传pdf文件)</span><img src="app/core/styles/img/x_sl.png" class="img_s"></div>
								<div class="s_img">
									<script type="text/template" id="pe-template-url6">

										<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;margin-left: 96px;height:60px">
											<div class="qq-upload-button-selector">
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<div style="width:200px;text-align: left;"><span class="sc">点击上传</span></div>
														<input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[user_certificates][6]" tabindex="0" value="" needle="needle" style="width:20px;">
														<span class="qq-upload-file-selector" style="display: block;line-height: 20px;text-align: left;font-size:12px;width:150px;margin-top:-5px;"></span>
													</li>

												</ul>
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<span class="sc">点击上传</span>
													</li>
												</ul>
											</div>
										</div>

									</script>
									<div class="fineuploader" attr-list="true" attr-template="pe-template-url6" attr-ftype="pdf,rar,zip,doc,docx,xls,xlsx"></div>

								</div>
							</div>
							<!---->
							<div class="form-group">
								<div class="head"><img src="app/core/styles/img/x_sl.png" class="head_img">财务报表<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
								<div class="s_img">
									<script type="text/template" id="pe-template-url1">

										<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;margin-left: 96px;height:60px">
											<div class="qq-upload-button-selector">
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<div style="width:200px;text-align: left;"><span class="sc">点击上传</span></div>
														<input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[user_certificates][7]" tabindex="0" value="" needle="needle" style="width:20px;">
														<span class="qq-upload-file-selector" style="display: block;line-height: 20px;text-align: left;font-size:12px;width:150px;margin-top:-5px;"></span>
													</li>

												</ul>
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<span class="sc">点击上传</span>
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
								<div class="head"><img src="app/core/styles/img/x_sl.png" class="head_img">安全生产许可证<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
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
															<img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
															<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][2]" tabindex="0" value="">
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
															<img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
															<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][3]" tabindex="0" value="">
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
								<div class="s_img">
									<script type="text/template" id="pe-template-url2">

										<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;margin-left: 96px;height:60px">
											<div class="qq-upload-button-selector">
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<div style="width:200px;text-align: left;"><span class="sc">点击上传</span></div>
														<input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[user_certificates][4]" tabindex="0" value="" needle="needle" style="width:20px;">
														<span class="qq-upload-file-selector" style="display: block;line-height: 20px;text-align: left;font-size:12px;width:150px;margin-top:-5px;"></span>
													</li>

												</ul>
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<span class="sc">点击上传</span>
													</li>
												</ul>
											</div>
										</div>

									</script>
									<div class="fineuploader" attr-list="true" attr-template="pe-template-url2" attr-ftype="pdf,rar,zip,doc,docx,xls" load-type="inner"></div>
									<!--  <a id="file_a" href="?{x2;$_app}-company-privatement-test2" target="_blank" style="margin-left:10px;"></a>-->
									<div class="h_foot">请提供近三年审计过的业绩报表及相关证明文件的复印件，含单位、联系人、联系电话等文件等复印件，并加盖公司 公章
									</div>
								</div>

							</div>
							<div class="form-group">
								<div class="head">其他文件<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
								<div class="s_img">
									<script type="text/template" id="pe-template-url3">

										<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;margin-left: 96px;height:60px">
											<div class="qq-upload-button-selector">
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<div style="width:200px;text-align: left;"><span class="sc">点击上传</span></div>
														<input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[user_certificates][8]" tabindex="0" value="" needle="needle" style="width:20px;">
														<span class="qq-upload-file-selector" style="display: block;line-height: 20px;text-align: left;font-size:12px;width:150px;margin-top:-5px;"></span>
													</li>

												</ul>
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<span class="sc">点击上传</span>
													</li>
												</ul>
											</div>
										</div>

									</script>
									<div class="fineuploader" attr-list="true" attr-template="pe-template-url3" attr-ftype="pdf,rar,zip,doc,docx,xls" load-type="inner"></div>

								</div>

							</div>

						</div>
					</div>

					<div style="clear: both;"></div>
				</div>
				<br>
				<div class="form-group">
					<h4 class="control-label hln-title" style="text-align: left;"><b>联系方式</b></h4>
				</div>

				<div class="form-group">
					<label class="control-label col-md-4"><span
                            class="hln-cue">*</span>第一联系人</label>
					<div class="col-md-3">
						<input class="form-control" needle="needle" msg="请填写联系人姓名" name="args[company_contacter]" type="text" placeholder="请输入联系人姓名" id="first_name">
					</div>
					<label class="control-label col-md-4"><span
                            class="hln-cue">*</span>第二联系人</label>
					<div class="col-md-3">
						<input class="form-control" needle="needle" msg="请填写联系人姓名" name="args[contact_info][contacts_name]" type="text" placeholder="请输入联系人姓名" id="sed_name">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-md-4"><span
                            class="hln-cue">*</span>手机号</label>
					<div class="col-md-3">
						<input class="form-control" needle="needle" msg="请填写电话" name="args[company_phone]" type="text" placeholder="请输入电话" id="first_tel">
					</div>
					<label class="control-label col-md-4"><span
                            class="hln-cue">*</span>手机号</label>
					<div class="col-md-3">
						<input class="form-control" needle="needle" msg="请填写电话" name="args[contact_info][user_phone]" type="text" placeholder="请输入电话" id="sed_tel">
					</div>
				</div>

				<div class="form-group">
					<!--第一联系人-->
					<label class="control-label col-md-4"><span class="hln-cue">*</span>固定电话</label>
					<div class="col-md-1">
						<input class="form-control" needle="needle" msg="请填写电话" name="args[company_quhao]" type="text" placeholder="区号" id="first_q" style="width:55px;">

					</div>
					<div class="col-md-1" style="width:5px;padding: 0px;">-</div>
					<div class="col-md-2" style="margin-left: -5px;">
						<input class="form-control" needle="needle" msg="请填写电话" name="args[company_tel]" type="text" placeholder="请输入电话" id="first_pho">
					</div>
					<!--第二联系人-->
					<label class="control-label col-md-4"><span
                            class="hln-cue">*</span>固定电话</label>
					<div class="col-md-1">
						<input class="form-control" needle="needle" msg="请填写电话" name="args[contact_info][user_quhao]" type="text" placeholder="区号" id="sed_q" style="width:55px;">
					</div>
					<div class="col-md-1" style="width:5px;padding: 0px;">-</div>
					<div class="col-md-2" style="margin-left: -5px;">
						<input class="form-control" needle="needle" msg="固定电话" name="args[contact_info][user_tel]" type="text" placeholder="请输入电话" id="sed_pho">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4"><span
                            class="hln-cue">*</span>邮箱</label>
					<div class="col-md-3">
						<input class="form-control" needle="needle" msg="请填写邮箱" name="args[company_email]" type="text" placeholder="请输入邮箱" id="first_emil">
					</div>
					<label class="control-label col-md-4"><span
                            class="hln-cue">*</span>邮箱</label>
					<div class="col-md-3">
						<input class="form-control" needle="needle" msg="请填写邮箱" name="args[contact_info][user_mail]" type="text" placeholder="请输入邮箱" id="sed_emil">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4"><span
                            class="hln-cue">*</span>企业地址</label>
					<div class="col-md-8" id="address" style="padding-left: 0px;">
						{x2;tree:$html,form,fid}
						<div class="col-sm-4">
							{x2;v:form['html']}
						</div>
						{x2;endtree}
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-md-4">详细地址</label>
					<div class="col-md-3">
						<input class="form-control" name="args[company_address]" type="text" placeholder="请输入企业详细街道" style="width:410px">
					</div>
				</div>
				<div class="form-group">
					<h4 class="control-label hln-title" style="text-align: left;"><b>平台协议</b></h4>
				</div>
				<div class="form-group">

					<div class="col-md-3" style="margin-left: 50px;">
						<label class="control-label hln-qyxy" style="display: flex"><a style="color:#f17d2b;"
                                                                                   data-toggle="modal"
                                                                                   data-target="#myModal">《平台注册协议》</a></label>
						<label class="checkbox-inline">
                        <input id="isReadAgreement" type="checkbox"><span>我已阅读并接受以上协议</span>
                    </label>
					</div>
				</div>

				<div class="form-group hln-bottom-btn" style="margin-top:20px;margin-left: 500px;">

					<div class="col-md-2" style="text-align: center;">
						<button type="button" id="reg_btn" class="button_tt reg_button">提交注册</button>
					</div>
					<div class="col-md-2">
						<button onclick="return false;" id="goshouye" class="button_tt reg_button">返回首页</button>
					</div>
				</div>
				<input type="hidden" name="userregister" value="1">
				<input type="hidden" name="args[username]" value="{x2;$step1Data['username']}">
				<input type="hidden" name="args[company_mobile]" value="{x2;$step1Data['company_mobile']}">
				<input type="hidden" name="args[userpassword]" value="{x2;$step1Data['userpassword']}">
				<input type="hidden" name="args[recommendCode]" value="{x2;$step1Data['recommendCode']}">
			</div>
		</div>
	</form>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" style="display: inline-block" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
					<h4 class="modal-title" id="myModalLabel">平台注册协议</h4>
				</div>
				<div class="modal-body" style="height: 350px; overflow: auto;">
					<b>一．总则</b><br> 1.1 同意遵守本协议及所有平台规则后方可成为生态圈在线平台用户。一旦注册成功，您与生态圈在线平台间自动形成协议关系，须受本协议及所有平台规则的约束。<br> 1.2 本协议根据您在本平台的运营情况随时更新，生态圈在线平台不承担通知义务，请您在使用时密切关注。
					<br>
					<b>二．帐户</b><br> 2.1 您注册的账号如果出现以下情况，个人账号/企业账号将有权被停用，禁止您在生态圈在线平台的一切活动。<br> （1）以党和国家领导人的真实姓名或音近名称注册； 　<br>（2）以含有恶意人身攻击或淫秽字眼的名称注册；
					<br> （3）以机器手段批量注册。
					<br> 2.2您有义务保证个人/企业账号和密码的安全，因保管不当引起的任何损失或损害，生态圈在线平台将不承担任何责任。
					<br>
					<b>三．使用</b><br> 3.1 欢迎您随时进入生态圈在线平台，在商机、企业、产品、招投标等版块进行相关合作操作，如果您在平台内进行的操作对他人造成不良影响或产生纠纷，用户需自行处理，平台不承担任何责任。
					<br>
					<b>四．隐私</b><br> 4.1 为了向您提供更好的用户服务，请您在注册时及时、详尽、准确地提供个人/企业资料，并不断更新补充。如果因注册信息不真实出现任何问题，由您自行承担相应的后果。<br> 4.2 生态圈在线平台非常重视对您个人隐私的保护，承诺不对外公开或向第三方提供用户的注册信息和在平台内的相关使用情况。但以下几种特殊情况除外：
					<br> （1）得到了您的授权许可；
					<br> （2）只有透露您的个人资料，才能提供您所要求的服务及合作；
					<br> （3）根据有关的法律法规要求；
					<br> （4）按照相关政府主管部门的要求；
					<br> （5）为维护本平台的合法权益。
					<br> （6）为维护公共安全。
					<br>
					<b>五．版权</b><br> 5.1 生态圈在线平台所有文字、图片、视频等版权均归生态圈在线平台享有或生态圈在线平台与作者共同享有，未经生态圈在线平台许可，不得任意转载。<br> 5.2 生态圈在线的LOGO标识、所有本平台产品设计及编排方式等版权均属平台享有，未经生态圈在线平台许可，不得任意复制转载。
					<br> 5.3 您在生态圈在线平台发布的任何重要内容，平台会根据您的意向进行处理，避免您的利益受损，但因个人角色失误造成的影响，本平台将不承担责任。
					<br> 5.4 您须承诺在生态圈在线平台发布的所有信息均真实有效，不得因信息真实性问题影响他人合法权利。一旦权利人提出异议并提供书面通知和有效的证明资料后，本平台有权立即删除该信息。如因违反本条规定造成实质侵权的，将由用户个人承担相关法律责任和赔偿费用。
					<br> 5.5 生态圈在线平台所有内容仅代表作者自己的立场和观点，并不代表本平台立场。<br> 5.6 恶意转载其他用户内容的，平台将保留对其提出法律诉讼的权利。<br>
					<b>六．免责</b><br> 除上述内容所涉及条款外，出现以下情况时生态圈在线平台将不承担任何责任：
					<br> 6.1 因不可抗力或生态圈在线平台不能控制的原因（含系统升级和维护）而造成的网络服务中断、数据丢失或其他缺陷。但平台承诺将竭尽所能减少因此而给您带来的损失和影响。<br> 6.2 您在生态圈在线发布对企业及其他个人等的投诉信息，并由此产生争议和纠纷的。
					<br> 6.3 您在生态圈在线发布的个人或其他真实信息，并由此产生纠纷和伤害的。<br> 6.4 您使用出现在生态圈在线平台的外部链接、QQ号、email等信息，参加其他用户个人组织的活动或与其他用户进行个人交易并由此发生纠纷和其他伤害的。
					<br> 6.5 您在生态圈在线发布的除前述范围以外的其它信息，并由此产生纠纷和伤害的。
					<br>
					<b>七．附则</b><br> 7.1 本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。<br> 7.3 本协议解释权及修订权归北京天润新能投资有限公司所有。
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	{x2;include:footer2}
	<script type="text/javascript" src="app/core/styles/js/user/company/goods_add.js"></script>
	<script>
		function goTop() {
			$('html,body').animate({
				'scrollTop': 0
			}, 600);
		}
	</script>
	<script>
		$("#address").on("change", "select", function() {
			var id = $(this).attr("id");
			var nameId = id + "Name";
			if ($(this).val() != "") {
				var text = $("#" + id + " option:selected").text();
				$("#" + nameId).val(text);
			} else {
				$("#" + nameId).val("");
			}
		})

		function check() {
			var company_name = $("#company_name").val();
			var len = $(".eType:checked").length;
			if (len == 0) {
				var data = {
					result: false,
					message: "请选择企业类型"
				};
				$.zoombox.show('ajax', data);
				return false;
			}
			if (!company_name) {
				var data = {
					result: false,
					message: "请输入企业名称"
				};
				$.zoombox.show('ajax', data);
				return false;
			}
			if (!$("#isReadAgreement").is(":checked")) {
				var data = {
					result: false,
					message: "请仔细阅读《平台注册协议》并勾选“我已阅读并接受以上协议”"
				};
				$.zoombox.show('ajax', data);
				return false;
			}
			$("form").submit();
		}
		$(function() {
			$('#reg_btn').on('click', function() {
				var company_name = $("#company_name").val();
				var company_capital = $("#company_capital").val();
				var first_name = $("#first_name").val();
				var sed_name = $("#sed_name").val();
				var first_tel = $("#first_tel").val();
				var sed_tel = $("#sed_tel").val();
				var first_pho = $("#first_pho").val();
				var sed_pho = $("#sed_pho").val();
				var first_emil = $("#first_emil").val();
				var sed_emil = $("#sed_emil").val();
				var len = $(".eType:checked").length;
				var first_q = $("#first_q").val();
				var sed_q = $("#sed_q").val();
				var company_province = $("#company_province").val();
				var company_city = $("#company_city").val();
				var company_area = $("#company_area").val();
				if (!company_province) {
					var data = {
						result: false,
						message: "请输入省"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!company_city) {
					var data = {
						result: false,
						message: "请输入市"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!company_area) {
					var data = {
						result: false,
						message: "请输入区"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (len == 0) {
					var data = {
						result: false,
						message: "请选择企业类型"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!company_name) {
					var data = {
						result: false,
						message: "请输入企业名称"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!company_capital) {
					var data = {
						result: false,
						message: "请输入注册资本"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!first_name) {
					var data = {
						result: false,
						message: "请输入第一联系人名称"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!sed_name) {
					var data = {
						result: false,
						message: "请输入第二联系人名称"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!first_tel) {
					var data = {
						result: false,
						message: "请输入第一联系人手机号"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!sed_tel) {
					var data = {
						result: false,
						message: "请输入第二联系人手机号"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!first_pho) {
					var data = {
						result: false,
						message: "请输入第一联系人固定电话"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!first_q) {
					var data = {
						result: false,
						message: "请输入第一联系人区号"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!sed_q) {
					var data = {
						result: false,
						message: "请输入第二联系人区号"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!sed_pho) {
					var data = {
						result: false,
						message: "请输入第二联系人固定电话"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!first_emil) {
					var data = {
						result: false,
						message: "请输入第一联系人邮箱"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!sed_emil) {
					var data = {
						result: false,
						message: "请输入第二联系人邮箱"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (!$("#isReadAgreement").is(":checked")) {
					var data = {
						result: false,
						message: "请仔细阅读《平台注册协议》并勾选“我已阅读并接受以上协议”"
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				$.ajax({
					type: 'POST',
					data: $("#form1").serializeArray(),
					url: "index.php?user-app-register-step2",
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
		});
		$("#goshouye").click(function() {
			window.history.go(-1);
		});
		//哈哈哈的js
		$(function() {
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
					$("#submit_check").show();
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
								console.log(data);
								$("#three_c").empty();
								$.each(data, function(index, value) {
									$("#three_c").append("<p><input type='checkbox'  value=" + value.catid + " name='three_c'><span>" + value.catname + "</span><span class='years'>年产量:<input type='number' class='input_n' oninput='this.value=this.value.replace(/^[0]+[0-9]*$/gi,)'></span></p>");
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
				//上下展示图片上传
			$(".head").click(function() {
					if ($(this).next().css("display") == "none") {
						$(this).next().show();
						$(this).find(".img_s").attr("src", "app/core/styles/img/s_sl.png");
						$(this).parent(".form-group").siblings(".form-group").find(".s_img").hide();
						$(this).parent(".form-group").siblings(".form-group").find(".head").find(".img_s").attr("src", "app/core/styles/img/x_sl.png");
					} else {
						$(this).next().hide();
						$(this).find(".img_s").attr("src", "app/core/styles/img/x_sl.png");
					}
				})
				//关闭按钮
			$(".fineuploader").on("click", ".closes", function() {
				$(this).siblings("img").attr("src", "app/core/styles/images/noimage.gif");
				$(this).siblings("input").val("");
				$(this).remove();
			})
		})
	</script>

</body>

</html>