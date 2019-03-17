{x2;include:header}

<body>
	{x2;include:nav}

	<style type="text/css">
		@font-face {
			font-family: 'iconfont';
			/* project id 814390 */
			src: url('//at.alicdn.com/t/font_814390_w8odnyf6faa.eot');
			src: url('//at.alicdn.com/t/font_814390_w8odnyf6faa.eot?#iefix') format('embedded-opentype'), url('//at.alicdn.com/t/font_814390_w8odnyf6faa.woff') format('woff'), url('//at.alicdn.com/t/font_814390_w8odnyf6faa.ttf') format('truetype'), url('//at.alicdn.com/t/font_814390_w8odnyf6faa.svg#iconfont') format('svg');
		}
		
		.content_s {
			margin-bottom: 20px;
		}
		
		.content_s li {
			height: 36px;
			line-height: 36px;
			width: 100%;
			padding-left: 40px;
		}
		
		.content_title {
			font-size: 18px;
		}
		
		.onload {
			color: #fe9010;
			margin-left: 5px;
		}
		
		.text {
			display: block;
			width: 98%;
			background: #eeeeee;
			border: 1px solid #cccccc;
			box-shadow: inset 0 1px 4px 0 rgba(0, 0, 0, 0.15);
			border-radius: 6px;
			height: 78px;
			margin: 10px 0px 20px 0px;
			padding: 10px;
		}
		
		.cq {
			margin-left: 20px;
			/* padding-top: 15px;*/
			border-bottom: dashed 1px #eee;
			padding-left: 0px !important;
			/* height: auto !important;*/
			height: 120px!important;
			line-height: 26px!important;
			width: auto!important;
		}
		
		.cqs {
			border-bottom: dashed 1px #888;
		}
		
		.cq div {
			float: left;
		}
		
		.onload_f {
			font-size: 13px;
			color: #999;
		}
		
		.onload_f a {
			font-size: 13px;
		}
		
		.qr {
			background: #ffffff;
			border: 1px solid #009944;
			border-radius: 4px;
			width: 64px;
			height: 22px;
			line-height: 22px;
			font-size: 13px;
			color: #009944;
			position: relative;
			margin-top: 40px;
		}
		
		.h {
			background: #eee!important;
			color: #999;
			outline: none;
		}
		.h:hover{
			color: #999!important;
		}
		.cons li {
			height: auto!important;
			border-bottom: dashed 1px #eee;
			clear: both;
		}
		
		.cq div {
			padding-top: 20px;
		}
		
		#release:hover {
			color: #F08F35;
		}
		table a.btn{
			padding: 0px 12px;
			font-size: 13px;
		}
		.sc {
			border: 1px solid rgb(204, 204, 204);
			border-radius: 4px;
			height: 30px;
			line-height: 30px;
			width: 110px;
			margin-top: 10px;
			padding-left: 20px;
			background: url(app/core/styles/images/upload.png) 12px center / 16px no-repeat;
			background-color: #fff;
			position: relative;
			overflow: hidden;
			direction: ltr;
			text-align: center;
			cursor: pointer;
			padding-top: 0px;
		}
		.form-group{
			display: inline-block;
			margin-left: 10px;
			margin-top: -5px;
		}
		.file-type-note{
			
			font-size: 13px;
			color: #999;
			margin-left: 0px;
			margin-top: 3px;
		}
		.load{
			position: absolute;
			margin-left: 115px;
			margin-top: -27px;
			text-align: left;
		}
		input[type="file"]{
			display: block!important;
		}
		.qq-upload-list-selector .error-reason{
			text-align: left;
			margin-top: 5px;
		}
		.load-progress-bar{
			position: absolute;
			margin-left: 115px;
			margin-top: 16px;
			background: #fff;
			z-index: 1000;
			width: 60%;
		}
		#progress{
			width: 20px;
		}
	</style>

	<div class="zmm-zx-centent">
		<div class="container">
			<!-- 导航 start -->
			<div class="hln-zx-centent-title t20 b20">
				你所在的位置：
				<span><a href="index.php?user-company">采购寻源</a> > <a>询价管理</a></span>
			</div>
			<!-- 导航 end -->
			<div class="qycenter-content">
				<!-- 左侧栏 start -->
				{x2;include:menu}
				<!-- 左侧栏 end -->

				<!-- 右侧  start -->
				<div class="right-content col10 pull-right published-purchase" id="content-box">
					<!--公司简介-->
					<div>
						<div class="zmm_panel panel-default">
							<div class="zmm-qydt-title zmm-qydt-shsj1">
								<p class="clarify-title"><em class="title-triangle"></em>{x2;$one['xunjia_title']}</p>
								<div class="pull-right" style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">
									<a class="export-pdf-btn" style="padding-right: 20px"><i class="iconfont"
                                                                                         style="color: #009944;padding-right: 3px">&#xe6a0;</i>导出询价详情</a>
									<a href="javascript:;" class="yellow-text pull-right" onclick="goBack()">返回上一页</a>
								</div>
							</div>

							<!--我的模块开始-->
							<div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
								<ul class="content_s">
									<li>询价类型 : <span>{x2;$purchasestatus[$one['xunjia_type']]}</span></li>
									<li>发布时间 : <span>{x2;date:$one['create_time'],'Y-m-d H:i:s'}</span></li>
									<li>截止时间 : <span>{x2;date:$one['end_time'],'Y-m-d H:i:s'}</span></li>
								</ul>
								<!--采购物资*************************************************************-->
								<h4 class="content_title">采购物资</h4>
								<ul class="content_s">
									{x2;if:$one['xunjiadan_title'] == ''} 123 {x2;else}
									<li>{x2;$one['xunjiadan_title']}<a href="{x2;$one['xunjiadan_url']}" download="{x2;$one['xunjiadan_title']}" class="onload">下载</a></li>
									{x2;endif} {x2;if:$one['wuziguige_title'] == ''} {x2;else}
									<li>{x2;$one['wuziguige_title']} <a href="{x2;$one['wuziguige_url']}" download="{x2;$one['wuziguige_title']}" class="onload">下载</a></li>
									{x2;endif}
								</ul>
								<h4 class="content_title">付款方式</h4>
								<ul class="content_s">
									<li>{x2;$one['pay_type']}</li>
								</ul>
								<!--补存说明**************************************************************-->
								<h4 class="content_title">采购物资</h4>
								<div style="margin-left:20px;"><textarea readonly="readonly" class="text">{x2;$one['xunjia_explain']}</textarea></div>

								<!--澄清说明*************************************************************-->

								<div>
									<h4 class="content_title" style="float: left;height: 32px;line-height: 32px;margin-right: 20px;">澄清信息</h4>
									<!-- 询价方判断逻辑 234及time内 无法发表 time内及1 可以发表 -->
									{x2;if:$demo == $one['xunjia_ren']} {x2;if:$dingbiao == '1'} {x2;if:$one['status'] == '3' || $one['status'] == '4' || $one['status'] == '2'}
									<button id="release" data-toggle="modal" data-target="#myModal" style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;" disabled="disabled" class="h">
                                            <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清</button>
									<!-- {x2;elseif:$one['status'] == '4'}
                                            <button id="release" data-toggle="modal" data-target="#myModal" style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;" disabled="disabled" class="h">
                                            <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清</button>
                                        {x2;elseif:$one['status'] == '2'}
                                            <button id="release" data-toggle="modal" data-target="#myModal" style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;" disabled="disabled" class="h">
                                            <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清</button> -->
									{x2;else}
									<button id="release" data-toggle="modal" data-target="#myModal" style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;">
                                            <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清</button> {x2;endif} {x2;elseif:$dingbiao == '2'}
									<button id="release" data-toggle="modal" data-target="#myModal" style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;" disabled="disabled" class="h">
                                                    <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清</button> {x2;endif} {x2;else}
									<!-- 报价方判断逻辑 234及time内 无法发表 time内及1 可以发表 -->
									{x2;if:v:bao['supplier_id'] == $demo} {x2;else} {x2;if:$dingbiao == '1'} {x2;if:$one['status'] == '3' || $one['status'] == '4' || $one['status'] == '2'}
									<button id="release" data-toggle="modal" data-target="#myModal" style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;" disabled="disabled" class="h">
                                                <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清</button>
									<!--  {x2;elseif:$one['status'] == '4'}
                                                <button id="release" data-toggle="modal" data-target="#myModal" style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;" disabled="disabled" class="h">
                                                <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清</button>
                                              {x2;elseif:$one['status'] == '2'}
                                                <button id="release" data-toggle="modal" data-target="#myModal" style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;" disabled="disabled" class="h">
                                                <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清</button> -->
									{x2;else}
									<button id="release" data-toggle="modal" data-target="#myModal" style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;">
                                                <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清</button> {x2;endif} {x2;elseif:$dingbiao == '2'}
									<button id="release" data-toggle="modal" data-target="#myModal" style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;" disabled="disabled" class="h">
                                                <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清</button> {x2;endif} {x2;endif} {x2;endif}
									<!--  <button id="release" data-toggle="modal" data-target="#myModal" style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;"> -->
									<!-- {x2;if:$times==2} disabled="disabled" class="h" {x2;endif} -->
									<ul class="content_s cons" style="width:98%">
										{x2;tree:$two3,two,cid}
										<li class="cq">
											<div>
												<p>{x2;v:two['clarify_name']}</p>
												<p>{x2;v:two['clarify_des']}</p>
												<p class="onload_f">{x2;v:two['clarify_fillename']} {x2;if:v:two['clarify_file']}<a href="{x2;v:two['clarify_file']}" download="{x2;v:two['clarify_fillename']}" class="onload">下载</a> {x2;endif}
												</p>
											</div>
											{x2;if:$one['xunjia_ren'] != $demo} {x2;if:v:two['clarify_uid'] != $demo} 　　　　　　　　　　　　　　　　　　　　 {x2;if:v:two['clarifydetail'] == '200'}
											<div style="float:right"><input type="button" value="已确认" class="qr" style=" border:1px solid #cccccc;
color: #666;"></div>
											<p style="clear: both;"></p>
											{x2;else} {x2;if:v:two['clarify_uid'] != $demo}
											<div style="float:right"><input type="button" value="确认" class="sub_add qr">
											</div>
											<p style="clear: both;"></p>
											{x2;endif} {x2;endif} {x2;endif} {x2;endif}
											<input type="hidden" name="xun_id" value="{x2;$one['id']}" id="xun_id">
											<input type="hidden" class="charifyid" name="charifyid" value="{x2;v:two['clarify_uid']}">
											<input type="hidden" class="charifyxid" name="charifyxid" value="{x2;v:two['clarify_id']}">
											<input type="hidden" class="bao_id" name="charifyxid" value="{x2;v:two['clarify_xid']}">
											<p style="clear: both;"></p>
										</li>
										{x2;endtree}

									</ul>

								</div>
								<h4 class="content_title" id="offerinfo">报价信息</h4>
								<!-- <form action="" method=""> -->
								<fieldset>
									<table class="table table-hover table-responsive table-bordered">
										<thead>
											<tr class="info" style="background:#f5f5f5;">

												<th style="background-color:#f5f5f5;font-weight: normal;width: 50px;">序号</th>
												<th style="background-color:#f5f5f5;font-weight: normal;">报价人</th>

												<th style="background-color:#f5f5f5;font-weight: normal;">报价金额(元)</th>
												<th style="background-color:#f5f5f5;font-weight: normal;">报价明细</th>
												<th style="background-color:#f5f5f5;font-weight: normal;">报价时间</th>
												<th style="background-color:#f5f5f5;font-weight: normal;">澄清确认</th>
												<th style="background-color:#f5f5f5;font-weight: normal;">操作</th>
											</tr>
										</thead>
										<tbody>
											{x2;tree:$baojia,bao,bid}
											<tr>
												<td class="form-inline cell-align-center">
													{x2;v:bao['keys']}

												</td>
												<td class="table-text" style="max-width:240px;">
													{x2;if:$demo == $one['xunjia_ren']} {x2;if:$dingbiao == '1'} {x2;if:$one['status'] == '3'} {x2;v:bao['company_name']} {x2;else} {x2;v:bao['company_name']} {x2;endif} {x2;elseif:$dingbiao == '2'} {x2;v:bao['company_name']} {x2;endif} {x2;else} {x2;if:v:bao['supplier_id']
													== $demo} {x2;v:bao['company_name']} {x2;else} {x2;if:$one['status'] == '3'} {x2;v:bao['company_name']} {x2;else} **************** {x2;endif} {x2;endif} {x2;endif}

												</td>

												<td>

													{x2;if:$demo == $one['xunjia_ren']} {x2;if:$dingbiao == '1'} {x2;if:$one['status'] == '3'} {x2;v:bao['company_name']} {x2;else} **************** {x2;endif} {x2;elseif:$dingbiao == '2'} {x2;v:bao['total_price']} {x2;endif} {x2;else} {x2;if:v:bao['supplier_id']
													== $demo} {x2;v:bao['total_price']} {x2;else} {x2;if:$one['status'] == '3'} {x2;v:bao['total_price']} {x2;else} **************** {x2;endif} {x2;endif} {x2;endif}
												</td>
												<td>

													{x2;if:$demo == $one['xunjia_ren']} {x2;if:$dingbiao == '1'} 下载 {x2;elseif:$dingbiao == '2'}
													<a href="{x2;v:bao['file_url']}" download="{x2;v:bao['company_name']}报价明细" style="font-size: 12px;color: #F17D2B">下载</a> {x2;endif} {x2;else} {x2;if:v:bao['supplier_id'] == $demo}
													<a href="{x2;v:bao['file_url']}" download="{x2;v:bao['company_name']}报价明细" style="font-size: 12px;color: #F17D2B">下载</a> {x2;else} 下载 {x2;endif} {x2;endif}
												</td>

												<td>
													{x2;date:v:bao['addtime'],'Y-m-d H:i:s'}
												</td>
												<td>
													{x2;if:v:bao['istrue'] == '1'}
													<div><span>已确认</span></div>
													<p style="clear: both;"></p>
													{x2;else}
													<div><span style="color: #999;">未确认</span></div>
													<p style="clear: both;"></p>
													{x2;endif}
												</td>
												<td class="actions" style="text-align:left;">
													<input type="hidden" class="addPurchase" value="{x2;v:bao['purchase_new_id']}">
													<input type="hidden" class="addbaojiaid" value="{x2;v:bao['supplier_id']}">

													<div class="btn-group">

														{x2;if:v:bao['baostatus'] == '200'} {x2;if:$one['status'] == '1'} {x2;if:v:bao['supplier_id'] == $demo}
														<i class="btn yellow-text file-btn" onclick="filepost('{x2;v:bao['pid']}','{x2;v:bao['purchase_new_id']}')" title="更新报价"><em class="iconfont">&#xe612;</em></i> {x2;endif} {x2;elseif:$one['status'] == '2'} 待定标 {x2;elseif:$one['status'] ==
														'3'} {x2;if:v:bao['is_winer'] == '1'} 已中标 {x2;else} 已完成 {x2;endif} {x2;else} 已终止 {x2;endif} {x2;else}
														<!-- <i class="iconfont ding btn yellow-text file-btn">&#xe613;</i>  disabled="disabled" class="h"-->
														{x2;if:$one['status'] == '1'} 询价中 {x2;elseif:$one['status'] == '3'} {x2;if:v:bao['is_winer'] == '1'} 已中标 {x2;else} 已完成 {x2;endif} {x2;elseif:$one['status'] == '2'}
														<a class="btn yellow-text dingbiao" href="index.php?user-company-clarify-priceOrder&xid={x2;v:bao['purchase_new_id']}&bid={x2;v:bao['supplier_id']}" title="定标" style="margin-top: 15px;display: inline-block;" >定标</a><span class="sc" onclick="filepost2('{x2;v:bao['pid']}','{x2;v:bao['purchase_new_id']}')">上传文件</span> {x2;else} {x2;if:$one['status'] == '4'}
														已终止 {x2;else} {x2;if:$dingbiao == '1'}
														<a class="btn yellow-text dingbiao" href="index.php?user-company-clarify-priceOrder&xid={x2;v:bao['purchase_new_id']}&bid={x2;v:bao['supplier_id']}" title="定标">未定标</a> {x2;else} 已失效 {x2;endif} {x2;endif} {x2;endif}
														{x2;endif}
													</div>
												</td>
											</tr>
											{x2;endtree}
										</tbody>
									</table>

								</fieldset>
								<!-- </form> -->
							</div>
							<!--我的模块结束-->

						</div>
					</div>
					<!-- 右侧  end -->
				</div>
			</div>
		</div>
		<!--弹框-->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4>澄清</h4>
					</div>
					<div class="modal-body">
						<div style="float: left;">澄清内容：</div>
						<div class="row form-group">
							<!--<lable class="control-label col-md-3">上传文档</lable>-->
							<div style="width: 330px;margin: 0 auto;">
								<input type="hidden" name="xun_id" value="{x2;$one['id']}" id="xun_id">
								<input type="hidden" name="xun_ren" value="{x2;$one['xunjia_ren']}" id="xun_ren">
								<textarea name="remark-input" cols="40" rows="5" id="text"></textarea>
								
								<div class="row form-group" style="margin-left: 0px;">
									<!--<lable>上传文档:</lable>-->
									
									<div >
										<script type="text/template" id="pe-template-url2">

											<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;">
												<div class="qq-upload-button-selector">
													<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;width: 400px;">
														<li style="margin-top:5px;">
															<div style="text-align: left;">
																<span class="btn btn-default sc">上传文档</span>
															</div>
															<input size="60" id="clarify-files1" class="form-control qq-edit-filename-selector address" type="hidden" name="args[user_certificates][4]" tabindex="0" value="{x2;$certificateInfo[4]['certificate_url']}" needle="needle" style="width:20px;">
															<a class="qq-upload-file-selector clarify_name load" id="clarify-title1"></a>
														</li>

													</ul>
													<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
														<li style="text-align: left;">
															<span class="btn btn-default sc">上传文档</span>
															<input type="hidden" class="qq-edit-filename-selector address" name="args[user_certificates][4]" tabindex="0" value="{x2;$certificateInfo[4]['certificate_url']}">
															<span class="qq-upload-file-selector" style="display:none">{x2;if:$certificateInfo[4]['certificate_url']}{x2;$certificateInfo[4]['fileName']}{x2;endif}</span>
														</li>
													</ul>
												</div>
											</div>

										</script>
										<div class="fineuploader" attr-list="true" attr-template="pe-template-url2" attr-ftype="rar,zip" load-type="inner"></div>

									</div>
									<div class="row form-group file-type-note">仅支持zip,rar文档</div>
								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="sub_btn"> 确&nbsp;&nbsp;定
                    </button>
						<button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消
                    </button>
					</div>
				</div>
			</div>
		</div>
		<!-- 报价金额 -->
		<div class="modal fade" id="file-modal">
			<div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<div>更新报价单</div>
					</div>

					<div id="filecontent">
					</div>
					<div class="modal-body">
						<div style="float: left;">报价金额:</div>
						<div class="row form-group">
							<span style="display: inline-block"></span>
							<input type="text" class="form-control offer-total-money" style="width: 200px;display: inline-block;margin-right: 3px" min="0"> 元
						</div>
						<div class="row form-group" style="margin-left: 65px;">
							<!--<lable class="control-label col-md-3">上传文档</lable>-->
							<div style="text-align: left;">
								<!-- <textarea name="remark-input" cols="40" rows="5"></textarea> -->
								<div class="row form-group">
									<!--<lable>上传文档:</lable>-->
									<div>
										<script type="text/template" id="pe-template-url">

											<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;">
												<div class="qq-upload-button-selector">
													<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;width: 400px;">
														<li style="margin-top:5px;">
															<div style="text-align: left;">
																<span class="btn btn-default sc">上传文档</span>
															</div>
															<input size="60" id="clarify-files" class="form-control qq-edit-filename-selector address" type="hidden" name="args[user_certificates][4]" tabindex="0" value="{x2;$certificateInfo[4]['certificate_url']}" needle="needle" style="width:20px;">
															<a class="qq-upload-file-selector clarify_name load" id="clarify-title"></a>
														</li>

													</ul>
													<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
														<li style="text-align: left;">
															<span class="btn btn-default sc">上传文档</span>
															<input type="hidden" class="qq-edit-filename-selector address" name="args[user_certificates][4]" tabindex="0" value="{x2;$certificateInfo[4]['certificate_url']}">
															<span class="qq-upload-file-selector" style="display:none">{x2;if:$certificateInfo[4]['certificate_url']}{x2;$certificateInfo[4]['fileName']}{x2;endif}</span>
														</li>
													</ul>
												</div>
											</div>

										</script>
										<div class="fineuploader" attr-list="true" attr-template="pe-template-url" attr-ftype="rar,zip" load-type="inner"></div>

									</div>
									<div class="row form-group file-type-note">仅支持zip,rar文档</div>
								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="tocomment"> 确&nbsp;&nbsp;定
                </button>
						<button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
					</div>
				</div>
			</div>
		</div>
		<!--定标-->
		<div class="modal fade" id="d-modals">
			<div class="modal-dialog" style="width: 384px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
				<div class="modal-content" style="height:262px;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<div>提示</div>
					</div>

					<div id="filecontent">
					</div>
					<div class="modal-body">
						<div style="text-align: center;margin-bottom:5px;"><img src="app/core/styles/img/question.png"></div>
						<div style="text-align: center;font-size: 14px;">定标结果不可变更，系统将自动生成采购订单，<br>是否确认？</div>

					</div>
					<div class="modal-footer" style="padding-bottom: 10px;">
						<button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="tocomment"> 确&nbsp;&nbsp;定
                </button>
						<button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
					</div>
				</div>
			</div>
		</div>
		<!--定标文件-->
		<div class="modal fade" id="file-sc">
			<div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4>定标</h4>
					</div>

					<div id="filecontent">
					</div>
					<div class="modal-body">
						<div style="float: left;">定标文件：</div>
						<div class="row form-group">
							<!--<lable class="control-label col-md-3">上传文档</lable>-->
							<div style="width: 330px;margin: 0 auto;">
								<!-- <textarea name="remark-input" cols="40" rows="5"></textarea> -->
								<div class="row form-group">
									<!--<lable>上传文档:</lable>-->
									<div>
										<script type="text/template" id="pe-template-url3">

											<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;left:0px;">
												<div class="qq-upload-button-selector">
													<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;width: 400px;">
														<li style="margin-top:5px;">
															<div style="text-align:left;">
																<span class="btn btn-default sc">上传文档</span>
															</div>
															<input size="60" id="sc-files" class="form-control qq-edit-filename-selector address" type="hidden" name="args[user_certificates][4]" tabindex="0" value="{x2;$certificateInfo[4]['certificate_url']}" needle="needle">
															<a class="qq-upload-file-selector clarify_name load" id="sc-title"></a>
														</li>

													</ul>
													<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
														<li class="">
															<span class="btn btn-default sc">上传文档</span>
															<input type="hidden" class="qq-edit-filename-selector address" name="args[user_certificates][4]" tabindex="0" value="{x2;$certificateInfo[4]['certificate_url']}">
															<span class="qq-upload-file-selector" style="display:none">{x2;if:$certificateInfo[4]['certificate_url']}{x2;$certificateInfo[4]['fileName']}{x2;endif}</span>
														</li>
													</ul>
												</div>
											</div>

										</script>
										<div class="fineuploader" attr-list="true" attr-template="pe-template-url3" attr-ftype="rar,zip" load-type="inner"></div>

									</div>
									<div class="row form-group file-type-note">仅支持zip,rar文档</div>
								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="tocomment"> 确&nbsp;&nbsp;定
                </button>
						<button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	{x2;include:footer2}
	<script src="app/core/styles/js/html2canvas.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.debug.js" integrity="sha384-THVO/sM0mFD9h7dfSndI6TS0PgAGavwKvB5hAxRRvc0o9cPLohB0wb/PTA7LdUHs" crossorigin="anonymous"></script>

	<script>
		$('.submenu:eq(2)').delay(400).slideDown(700);

		function goBack() {
			history.go(-1);
		}
		$("#release").click(function() {
				if ($('#myModal #clarify-files1').val()) {
					$('#myModal #clarify-title1').html('');
				}
				$('myModal #clarify-files1').val('');
			})
			/*
			 * ajax  add 澄清内容
			 */
		$("#sub_btn").click(function() {
				var uds = $('#clarify-files').val(); //路径
				var title = $("#title").text(); //文档标题
				var text = $("#text").val(); //文字描述
				var xunid = $("#xun_id").val(); //询价单id
				var xunren = $("#xun_ren").val(); //询价表的用户id
				if (text == '') {
					var data = {
						result: false,
						message: '请澄清说明'
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (uds == '') {
					var data = {
						result: false,
						message: '请上传文档'
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				if (text == '') {
					var data = {
						result: false,
						message: '请写入标题'
					};
					$.zoombox.show('ajax', data);
					return false;
				}
				var jsons = {
					text: text,
					uds: uds,
					title: title,
					xunid: xunid,
					xunren: xunren
				};
				console.log(jsons);
				$.ajax({
					type: 'post',
					url: "index.php?user-company-clarify-addclarifylists",
					dataType: 'JSON',
					data: jsons,
					success: function(res) {
						if (res.statusCode == 200) {
							var data = {
								result: false,
								message: res.message
							};
							//$.zoombox.show('ajaxOK', data);
							window.location.reload();
						} else {
							var data = {
								result: false,
								message: res.message
							};
							$.zoombox.show('ajax', data);
						}
					}
				});
			})
			/*
			 * 添加澄清确定按钮 判断状态
			 */
		$("body").on('click', '.sub_add', function() {
				var uid = $(this).parent("div").siblings(".charifyid").val() //询价单id
					,
					xid = $(this).parent("div").siblings(".charifyxid").val() //澄清发布id  bao_id
					,
					bid = $(this).parent("div").siblings(".bao_id").val() //询价单id
					,
					jsons = {
						uid: uid,
						xid: xid,
						bid: bid
					};
				$.ajax({
					type: 'post',
					url: "index.php?user-company-clarify-addclarify",
					dataType: 'JSON',
					data: jsons,
					success: function(res) {
						if (res.statusCode == 200) {
							// var data = {result: false, message: res.message};
							// $.zoombox.show('ajaxOK', data);
							window.location.reload();
						} else {
							var data = {
								result: false,
								message: res.message
							};
							$.zoombox.show('ajax', data);
						}
					}
				});
			})
			//提交订单
		$("body").on('click', '.sub_mit', function() {
				$("#d-modals").modal('show');
				var xid = $(this).parent("div").siblings(".addPurchase").val(); //澄清发布id
				var bid = $(this).parent("div").siblings(".addbaojiaid").val(); //澄清发布id
				var jsons = {
					xid: xid,
					bid: bid
				};
				$.ajax({
					type: 'post',
					url: "index.php?user-company-clarify-priceOrder",
					dataType: 'JSON',
					data: jsons,
					success: function(res) {
						if (res.statusCode == 200) {
							// var data = {result: false, message: res.message};
							// $.zoombox.show('ajaxOK', data);
							window.location.href = 'index.php?user-company-ordersbuy';
						} else {
							var data = {
								result: false,
								message: res.message
							};
							$.zoombox.show('ajax', data);
						}
					}
				});
			})
			//导出pdf
		$('.export-pdf-btn').on('click', function() {
			//导出html到pdf文件
			html2canvas(document.getElementById('content-box'), {
				onrendered: function(canvas) {
					var contentWidth = canvas.width;
					var contentHeight = canvas.height;
					//一页pdf显示html页面生成的canvas高度;
					var pageHeight = contentWidth / 592.28 * 841.89;
					//未生成pdf的html页面高度
					var leftHeight = contentHeight;
					//页面偏移
					var position = 0;
					//a4纸的尺寸[595.28,841.89]，html页面生成的canvas在pdf中图片的宽高
					var imgWidth = 595.28;
					var imgHeight = 592.28 / contentWidth * contentHeight;
					var pageData = canvas.toDataURL('image/jpeg', 1.0);
					var pdf = new jsPDF('', 'pt', 'a4');
					//有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
					//当内容未超过pdf一页显示的范围，无需分页
					if (leftHeight < pageHeight) {
						pdf.addImage(pageData, 'JPEG', 0, 0, imgWidth, imgHeight);
					} else {
						while (leftHeight > 0) {
							pdf.addImage(pageData, 'JPEG', 0, position, imgWidth, imgHeight)
							leftHeight -= pageHeight;
							position -= 841.89;
							//避免添加空白页
							if (leftHeight > 0) {
								pdf.addPage();
							}
						}
					}
					var title = $('.clarify-title').text();
					pdf.save(title + ".pdf");
				}
			});
		})

		function filepost(id, xunid) {
			$.ajax({
				type: 'get',
				url: 'index.php?user-company-purchases-filepost&id=' + id + '&xunid=' + xunid,
				dataType: 'JSON',
				async: true,
				success: function(res) {
					if (res.statusCode == 201) {
						$("#filecontent").html(res.data);
						$("#file-modal").modal();
					} else {
						var data = {
							result: false,
							message: res.message
						};
						$.zoombox.show('ajax', data);
						window.location.reload();
						return false;
					}
				},
				error: function(e) {
					console.log(e);
				}
			})
			if ($('#file-modal #clarify-files').val()) {
				$('#file-modal #clarify-title').html('');
			}
			$('#file-modal #clarify-files').val('');
			$('#file-modal .offer-total-money').val('');
		}
		//定标文件上传
		function filepost2(id, xunid) {
			$.ajax({
				type: 'get',
				url: 'index.php?user-company-purchases-filepost&id=' + id + '&xunid=' + xunid,
				dataType: 'JSON',
				async: true,
				success: function(res) {
					if (res.statusCode == 201) {
						$("#filecontent").html(res.data);
						$("#file-sc").modal();
					} else {
						var data = {
							result: false,
							message: res.message
						};
						$.zoombox.show('ajax', data);
						window.location.reload();
						return false;
					}
				},
				error: function(e) {
					console.log(e);
				}
			})
			if ($('#file-sc #sc-files').val()) {
				$('#file-sc #sc-title').html('');
			}
			$('#file-sc #sc-files').val('');
		}
		//
		$('#tocomment').on('click', function() {
			var pid = $('#offersn').val();
			var fileurl = $('#clarify-files').val();
			var totalNo = $('.offer-total-money').val();
			if (!totalNo) {
				var data = {
					result: false,
					message: '请上传报价金额'
				};
				$.zoombox.show('ajax', data);
				return false;
			}
			if (!fileurl) {
				var data = {
					result: false,
					message: '请上传文档'
				};
				$.zoombox.show('ajax', data);
				return false;
			}
			$.ajax({
				type: 'get',
				url: 'index.php?user-company-clarify-filecommit&pid=' + pid + '&fileurl=' + fileurl + '&totalNo=' + totalNo,
				dataType: 'JSON',
				success: function(res) {
					if (res.statusCode == 200) {
						var data = {
							result: false,
							message: res.message
						};
						$.zoombox.show('ajaxOK', data);
						window.location.reload();
					} else {
						var data = {
							result: false,
							message: res.message
						};
						$.zoombox.show('ajax', data);
					}
				},
				error: function(e) {
					console.log(e);
				}
			})
		})
	</script>
</body>

</html>