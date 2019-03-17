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
		margin-bottom: 40px;
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
		width: 120px;
		margin-top: 10px;
		padding-left: 40px;
		background: url(app/core/styles/images/upload.png) 15px center / 16px no-repeat;
		position: relative;
		overflow: hidden;
		direction: ltr;
	}
</style>
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>合作资料</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right contact-us">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}


                <!--我的模块开始-->
                <div class="zmm_panel panel-default" >
                    <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                    <div class="zmm-qydt-title zmm-qydt-shsj1">
                        <p><em class="title-triangle"></em>合作资料</p >
                       <!-- <a href="index.php?{x2;$_app}-company-basic-contactedit" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">编辑</a>-->
                    </div>
                    <p style="width:100%;color:#f23838;font-size:13px;padding-left:30px;margin:10px 0px 20px 0px;background:rgba(255,153,44,0.05);box-shadow:inset 0 -1px 0 0 rgba(255,153,44,0.15);">
                    	*本页资料仅天润业务人员可见，请放心上传
                    </p>
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
								<div class="head">管理体系认证证书<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
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
							<div class="form-group">
								<div class="head">型式试验报告<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
								<div class="s_img">
									<script type="text/template" id="pe-template-photo4">
										<div class="qq-uploader-selector" style="width:210px" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
											<div class="qq-upload-button-selector" style="clear:both;">
												<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<div class="thumbnail">
															<img class="qq-thumbnail-selector" alt="点击上传新图片">
															<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][6]" tabindex="0">
														</div>
													</li>
												</ul>
												<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<div class="thumbnail">
															<img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
															<input type="hidden" class="qq-edit-filename-selector" name="args[user_certificates][6]" tabindex="0" value="">
														</div>
													</li>
												</ul>
											</div>
										</div>
									</script>
									<div class="fineuploader" attr-type="thumb" attr-template="pe-template-photo4" attr-ftype="JPG,JPEG,PNG"></div>
									<div class="h_foot">请提供型式试验报告 </div>
								</div>
							</div>
							<!---->

							<!---->
							<div class="form-group">
								<div class="head">财务报表<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
								<div class="s_img">
									<script type="text/template" id="pe-template-url1">

										<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;margin-left: 80px;height:30px">
											<div class="qq-upload-button-selector">
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<span class="sc">点击上传</span>
														<input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[user_certificates][7]" tabindex="0" value="" needle="needle" style="width:20px;">
														<span class="qq-upload-file-selector" style="display: block;"></span>
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
									<div class="fineuploader" attr-list="true" attr-template="pe-template-url1" attr-ftype="pdf,rar,zip,doc,docx,xls"></div>
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
									<div class="h_foot">请提供安全生产许可证<img src="app/core/styles/img/x_sl.png" class="img_s">
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

										<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;margin-left: 50px;height:30px">
											<div class="qq-upload-button-selector">
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<span class="sc">点击上传</span>
														<input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[user_certificates][4]" tabindex="0" value="" needle="needle" style="width:20px;">
														<span class="qq-upload-file-selector"></span>
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
									<div class="fineuploader" attr-list="true" attr-template="pe-template-url2" attr-ftype="pdf,rar,zip,doc,docx,xls"></div>
									<!--  <a id="file_a" href="?{x2;$_app}-company-privatement-test2" target="_blank" style="margin-left:10px;"></a>-->
									<div class="h_foot">请提供近三年审计过的业绩报表及相关证明文件的复印件，含单位、联系人、联系电话等文件等复印件，并加盖公司 公章
									</div>
								</div>

							</div>
							<div class="form-group">
								<div class="head">其他文件<img src="app/core/styles/img/x_sl.png" class="img_s"></div>
								<div class="s_img">
									<script type="text/template" id="pe-template-url3">

										<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;margin-left: 90px;height:30px">
											<div class="qq-upload-button-selector">
												<ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
													<li class="text-center">
														<span class="sc">点击上传</span>
														<input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[user_certificates][8]" tabindex="0" value="" needle="needle" style="width:20px;">
														<span class="qq-upload-file-selector" style="display: block;"></span>
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
									<div class="fineuploader" attr-list="true" attr-template="pe-template-url3" attr-ftype="pdf,rar,zip,doc,docx,xls"></div>
									<div class="h_foot">请提供近三年审计过的业绩报表及相关证明文件的复印件，含单位、联系人、联系电话等文件等复印件，并加盖公司 公章
									</div>
								</div>

							</div>

						</div>
					</div>

					<div style="clear: both;"></div>
				</div>
                </div>
                <!--我的模块结束-->
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
        $('.submenu:eq(0) li:eq(7)').addClass("active");
        $(".head").click(function() {
				$(this).next().show();
				$(this).find("img").attr("src", "app/core/styles/img/s_sl.png");
				$(this).parent(".form-group").siblings(".form-group").find(".s_img").hide();
				$(this).parent(".form-group").siblings(".form-group").find(".head").find("img").attr("src", "app/core/styles/img/x_sl.png");
			})
			$("#file_a").click(function() {
				a_href = $("#file_address").val();
				$(this).attr("href", "?{x2;$_app}-company-privatement-test2&" + a_href);
			});
    });
</script>

</body>
</html>
