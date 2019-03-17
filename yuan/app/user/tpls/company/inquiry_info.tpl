{x2;include:header}
<link rel="stylesheet" type="text/css" href="app/core/styles/css/lightbox.min.css" />
<style>
	.hln-zx-centent-title {
		padding: 0px;
	}
	
	.content_s {
		margin-left: 40px;
		margin-bottom: 20px;
	}
	
	.content_s li p span {
		width: 100px;
		text-align: right;
	}
	
	.list_name li {
		float: left;
		min-width: 200px;
		margin-right: 200px;
	}
	
	.list_name li p {
		line-height: 36px;
	}
	
	.table {
		width: 1110px;
	}
	
	.dowload li {
		float: left;
	}
	
	.dowload li a {
		display: inline-block;
		margin-right: 20px;
		color: #666;
	}
	
	.dowload li a span.l_name {
		color: #323232;
	}
	
	.dowload li a span:last-child {
		color: #ff8a00;
		margin-left: 10px;
	}
	
	.import_color span {
		color: #ff8a00;
		cursor: pointer;
	}
	
	#release {
		float: left;
		cursor: pointer;
		border: solid 1px #eeeeee;
		padding: 0 14px;
		border-radius: 4px;
		outline: 0px;
		background: #fff;
		margin-top: 10px;
		font-size: 14px;
	}
	
	.cons a {
		font-size: 13px;
	}
	
	.cons li {
		width: 1110px;
		height: auto!important;
		border-bottom: dashed 1px #eee;
		padding: 10px 10px;
	}
	
	.qr {
		background: #ffffff;
		border: 1px solid #009944;
		border-radius: 4px;
		width: 64px;
		height: 26px;
		line-height: 25px;
		font-size: 12px;
		color: #009944;
		position: relative;
		margin-top: 10px;
	}
	
	.no_qr {
		border: 1px solid #ccc;
		color: #ccc;
	}
	
	.tips {
		font-size: 14px;
		color: #222222;
		text-align: justify;
		line-height: 24px;
		background: rgba(255, 153, 44, 0.05);
		box-shadow: inset 0 -1px 0 0 rgba(255, 153, 44, 0.15);
		width: 460px;
		padding: 10px;
		font-size: 13px;
	}
	
	label {
		float: left;
		font-weight: 400;
	}
	
	.form-group {
		margin-top: 20px;
	}
	
	.h {
		background: #eee!important;
		color: #999;
		outline: none;
	}
	
	#release:hover {
		color: #F08F35;
	}
	
	.h:hover {
		color: #999!important;
	}
	
	.sc {
		border: 1px solid rgb(204, 204, 204);
		border-radius: 4px;
		height: 30px;
		line-height: 30px;
		width: 100px;
		/* margin-top: 10px; */
		padding-left: 30px;
		background: url(app/core/styles/images/upload.png) 10px center / 15px no-repeat;
		position: relative;
		overflow: hidden;
		direction: ltr;
		background-color: #fff;
	}
	
	#text {
		border: solid 1px #ddd;
		max-width: 300px;
		border-radius: 4px;
	}
	
	p.title_lists {
		font-weight: 550;
		margin-bottom: 20px;
	}
	
	.load {
		position: absolute;
		margin-left: 115px;
		margin-top: -37px;
		text-align: left;
	}
	
	.calibration_icon {
		background: url(app/core/styles/images/calibration.png) no-repeat -3px 8px;
		background-size: 24px;
	}
	
	.company_name {
		font-weight: 600;
	}
	
	.company_name span {
		width: 200px!important;
		text-align: left!important;
		margin-left: 20px;
	}
/*	/*
	.uploaded-show {
		position: absolute;
		left: 110px;
		margin-top: -30px;
	}
	*/
	.lb-closeContainer .lb-close {
		position: absolute;
		width: 30px;
		height: 30px;
		background: url(app/core/styles/images/close.png) top right no-repeat;
		transition: opacity .2s;
		opacity: .7;
		display: block;
		top: -26px;
		right: -30px;
	}
</style>
{x2;include:nav2}

<body>
	<div class="container">
		<!--面包屑-->
		<div class="hln-zx-centent-title t20 b20">
			你所在的位置：
			<span><a href="index.php?user-company-purchases-inquiry">询价管理</a> > <a>询价详情</a></span>
		</div>
		<!--中间内容-->
		<div class="zmm_panel panel-default" id="content-box">
			<!--title*************************************************************-->
			<div class="zmm-qydt-title zmm-qydt-shsj1">
				<p class="clarify-title"><em class="title-triangle"></em>{x2;$inquiryData['xunjia_title']}</p>
				<div class="pull-right" style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">
					<a class="export-pdf-btn" style="padding-right: 20px">
						<i class="iconfont" style="color: #009944;padding-right: 3px">&#xe6a0;</i>导出询价详情
					</a>
					<a href="javascript:;" class="yellow-text pull-right" onclick="javascript:history.back(-1);">返回上一页</a>
				</div>
			</div>
			<!--tilte_list************************************************-->
			<div class="content_s">
				<ul class="list_name" style="width: 100%;">
					<li>
						<p><span>询价类型：</span><a style="color: #666;">{x2;$purchasestatus[$inquiryData['xunjia_type']]}</a></p>
						<p><span>发布时间：</span><a style="color: #666;">{x2;date:$inquiryData['create_time'],'Y-m-d H:i:s'}</a></p>
						<p><span>截止时间：</span><a style="color: #666;">{x2;date:$inquiryData['end_time'],'Y-m-d H:i:s'}</a></p>

					</li>
					<li style="margin-right: 20px;">
						<p><span>要求到货时间：</span><a style="color: #666;">{x2;date:$inquiryData['expire_time'],'Y-m-d'}</a></p>
						<p><span>税率：</span><a style="color: #666;">{x2;$inquiryData['taxrate']}</a></p>
						<p><span style="float: left;">付款方式：</span><span style="width: 400px;text-align: left;color: #666;">{x2;$inquiryData['pay_type']}</span></p>
					</li>
				</ul>
				<p style="margin-bottom: 20px;">
					<span style="float: left;margin-left: 30px;">补充说明：</span>
					<span style="width:840px;text-align: left;color: #666;">{x2;$inquiryData['xunjia_explain']}</span>
				</p>
			</div>

			<!--采购物资-->
			<div class="zmm-qydt-title zmm-qydt-shsj1" style="clear: both;">
				<p class="clarify-title title_lists">采购物资</p>
			</div>
			<div class="content_s">
				<!--表格-->
				<table class="table table-hover table-responsive table-bordered">
					<thead>
						<tr style="background:#f5f5f5!important;">
							<th width="43px">序号</th>
							<th width="500px">物资名称</th>
							<th width="73px">规格/型号</th>
							<th width="63px">采购量</th>
							<th width="43px">单位</th>
							<th width="65px">项目单位</th>
							<th>说明</th>
						</tr>
					</thead>
					<tbody>
						{x2;tree:$material,good,gid}
						<tr>
							<td>{x2;v:gid}</td>
							<td>{x2;v:good['material_title']}</td>
							<td>{x2;v:good['material_norms']}</td>
							<td>{x2;v:good['material_num']}</td>
							<td>{x2;v:good['material_unit']}</td>
							<td>{x2;v:good['xiangmuDanwei']}</td>
							<td>{x2;v:good['material_explain']}</td>
						</tr>
						{x2;endtree}
					</tbody>
				</table>
				<!--附件下载-->
				<ul class="dowload">
					<li>
						{x2;if:$inquiryData['technicalfile_url']}
						<a href="{x2;$inquiryData['technicalfile_url']}" download="{x2;$inquiryData['technicalfile_url']}"><span class="l_name">技术附件</span>：{x2;$inquiryData['technicalfile_title']}<span>下载</span></a></br>
						{x2;endif} {x2;if:$inquiryData['businessfile_url']}
						<a href="{x2;$inquiryData['businessfile_url']}" download="{x2;$inquiryData['businessfile_url']}"><span class="l_name">商务附件</span>：{x2;$inquiryData['businessfile_title']}<span>下载</span></a></br>
						{x2;endif} {x2;if:$inquiryData['other_url']}
						<a href="{x2;$inquiryData['other_url']}" download="{x2;$inquiryData['other_url']}"><span class="l_name">其他附件</span>：{x2;$inquiryData['other_title']}<span>下载</span></a> {x2;endif}
					</li>
				</ul>
			</div>
			<!--澄清信息************************************************************************-->
			<div class="zmm-qydt-title zmm-qydt-shsj1">
				<p class="clarify-title title_lists">澄清信息</p>
				<!--正常按鈕-->
				{x2;if:$inquiryData['status'] == '1'}
				<button id="release" onclick="filepost1({x2;$inquiryData['id']})" style="border:#F0953A solid 1px;color:#F0953A ;">
                  <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清
			    </button> {x2;else}
				<!--置灰按钮-->
				<button id="release" class="h" disable="disable">
                  <i class="iconfont"  style="color: #ccc;margin-right: 2px;" >&#xe616;</i>发布澄清
			    </button> {x2;endif}
			</div>

			<ul class="content_s cons dowload" style="width:98%">
				{x2;tree:$clarData,clar,cid}
				<li class="dowload">
					<div style="float: left;">
						<p class="company_name">{x2;v:clar['clarify_name']}<span style="font-size: 12px;color: #666;font-weight: 500;">{x2;date:v:clar['addtime'],'Y-m-d H:i:s'}</span></p>
						<p>{x2;v:clar['clarify_des']}</p>
						{x2;if:v:clar['clarify_fillename']}
						<a href="{x2;v:clar['clarify_file']}" download="{x2;v:clar['clarify_file']}">{x2;v:clar['clarify_fillename']} <span>下载</span></a> {x2;endif}
					</div>
				</li>
				{x2;endtree}
			</ul>
			<!--报价信息*********************************************************************************-->
			<div class="zmm-qydt-title zmm-qydt-shsj1">
				<p class="clarify-title title_lists">报价信息</p>
			</div>
			<div class="content_s" id="offerinfo">
				<!--表格-->
				<table class="table table-hover table-responsive table-bordered">
					<thead>
						<tr style="background:#f5f5f5!important;">
							<th>{x2;if:$isApply == '0'}序号{x2;else}排名{x2;endif}</th>
							<th>报价人</th>
							<th>报价金额（元）</th>
							<th>报价明细</th>
							<th>报价附件</th>
							<th>报价时间</th>
							<th>澄清确认</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						{x2;tree:$baojiaData,baoj,bid}
						<tr {x2;if:v:baoj[ 'baojia_status']=='1' }class="calibration_icon" {x2;endif}>
							<td style="padding-left:24px">{x2;v:bid}</td>
							<td>{x2;v:baoj['company_name']}</td>
							<td>
								{x2;if:$inquiryData['status'] == '1'} {x2;if:v:baoj['isapply'] == '1'} ***** {x2;else} - {x2;endif} {x2;else} {x2;if:v:baoj['isapply'] == '1'} {x2;v:baoj['total_price']} {x2;else} - {x2;endif} {x2;endif}
							</td>
							<td>
								<!--如果是询价中-->
								{x2;if:$inquiryData['status'] == '1'}
								<!--如果已报价-->
								{x2;if:v:baoj['isapply'] == '1'} ***** {x2;else} - {x2;endif} {x2;else} {x2;if:v:baoj['isapply'] == '1'}
								<a href="index.php?user-company-purchases-export_inquiryt&pid={x2;v:baoj['purchase_price_id']}"> <span>下载明细</span></a>
								{x2;else} - {x2;endif} {x2;endif}
							</td>
							<td>
								<!--如果是询价中-->
								{x2;if:$inquiryData['status'] == '1'}
								<!--如果已报价-->
								{x2;if:v:baoj['isapply'] == '1'} ***** {x2;else} - {x2;endif} {x2;else} {x2;if:v:baoj['isapply'] == '1'} {x2;if:v:baoj['file_url'] != ''}
								<a href="{x2;v:baoj['file_url']}" download="{x2;v:baoj['file_url']}"> <span>下载附件</span></a>
								{x2;else} - {x2;endif} {x2;else} - {x2;endif} {x2;endif}
							</td>
							<td>
								{x2;if:v:baoj['isapply'] == '1'} {x2;date:v:baoj['addtime'],'Y-m-d H:i:s'} {x2;else} 未报价 {x2;endif}
							</td>
							<td>
								{x2;if:v:baoj['isapply'] == '1'} {x2;if:v:baoj['istrue'] == '1'}已确认{x2;else}未确认{x2;endif} {x2;else} - {x2;endif}
							</td>
							{x2;if:$inquiryData['status'] == '1'}
							<td class="import_color calibrate"><span onclick="callpirce('{x2;$inquiryData['xunjia_title']}','{x2;v:baoj['company_mobile']}','{x2;v:baoj['endtime']}')">提醒报价</span></td>
							{x2;endif} {x2;if:$inquiryData['status'] == '2'} {x2;if:v:baoj['isapply'] == '1'}
							<td class="import_color"><span class="calibrate" onclick="filepost('{x2;v:baoj['purchase_price_id']}','{x2;$inquiryData['id']}','{x2;v:baoj['supplier_id']}')">定标</span></td>
							{x2;else}
							<td class="import_color">
								-
							</td>
							{x2;endif} {x2;endif} {x2;if:$inquiryData['status'] == '3'}
							<td class="import_color calibrate"><span>已完成</span></td>
							{x2;endif} {x2;if:$inquiryData['status'] == '4'}
							<td class="import_color calibrate"><span>已终止</span></td>
							{x2;endif}
						</tr>
						{x2;endtree}
					</tbody>
				</table>
			</div>
			<!--定标内容和图片-->
            {x2;if:$winerData}
			<div class="zmm-qydt-title zmm-qydt-shsj1">
				<p class="clarify-title title_lists">定标内容</p>
			</div>
			<div class="content_s" style="clear: both;padding-left: 30px;">
				<p>
					<span style="float: left;margin-right: 10px;">定标依据：</span>
					{x2;if:$is_pdf}
					<a href="{x2;$winerData['based_file']}" download="{x2;$winerData['based_file']}">
						定标依据文件.pdf &nbsp;&nbsp;&nbsp; <span style="color: #fe9010;">下载</span>
					</a>
					{x2;else}
					<a onclick="imgs()">
						<img class="example-image" src="{x2;$winerData['based_file']}" alt="" style="width: 200px;height: 146px;border:solid 1px #efefef">
					</a>
					{x2;endif}
				</p>
				<p style="clear: both;margin-top: 20px;">
					<span style="float: left;margin-right: 10px;">定标原因：</span><span>{x2;$winerData['based_reason']}</span>
				</p>

			</div>
            {x2;endif}
		</div>
	</div>
	<!--弹框*********************************************************************************************************************8-->
	<!--定标弹框-->
	<div class="modal fade" id="myModal">
		<div class="lodin">
			<div class="log">
				<img src="app/core/styles/images/qio.png" />
			</div>
		</div>
		<div class="modal-dialog" style="width: 498px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h5>定标确认</h5>
				</div>
				<form>
					<div class="modal-body">
						<div class="tips">
							定标结果不可变更，系统将自动生成采购订单，请上传审批截图或写明定标原因。
						</div>
						<!--<div class="form-group">
							<label for="block" class="control-label">定标依据：</label>
							<div style="display: inline-block;">
								<script type="text/template" id="pe-template-purchasethumb">
									<div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
										<div class="qq-upload-button-selector" style="clear:both;width: 112px;height: 91px;">
											<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
												<li class="text-center">
													<div class="thumbnail">
														<img class="qq-thumbnail-selector" alt="点击上传新图片" id="tip_img">
														<input type="hidden" class="qq-edit-filename-selector" name="args[honor_url]" tabindex="0" id="img_src">
													</div>
												</li>
											</ul>
											<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
												<li class="text-center">
													<div class="thumbnail">
														<img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
													</div>
												</li>
											</ul>
										</div>
									</div>
								</script>
								<div class="fineuploader" attr-type="thumb" attr-template="pe-template-purchasethumb"></div>
								<div class="form-group file-type-note" style="color:#999999;margin-top: -6px;">支持png,jpg格式图片</div>
							</div>
						</div>-->
						<!--上传文件-->
						 <div class="form-group" style="margin-bottom: 0;">
                            <span style="float: left">定标依据：</span>
                            <script type="text/template" id="pe-template-url">
                                <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                        <div class="qq-upload-button-selector">
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals">
                                                <li>
                                                <span class="btn btn-default" style="color: #009944;border: solid 1px #009944;">
                                                    <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>
                                                                                                            上传文档
                                                </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls"  id="img_src" tabindex="0" value="">
                                                    <div style="position: relative;float: right;margin-top: 4px;margin-left: 5px;" class="uploaded-show">
                                                        <span class="qq-upload-file-selector qq-upload-file upload-file-name" style="width: 200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" id="img_src_name"></span>
                                                        <span class="delete-file-btn yellow-text" style="float: right;">&times;</span>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions">
                                                <li style="text-align: left">
                                                    <span class="btn btn-default" style="color: #009944;border:solid 1px #009944;">
                                                        <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
                                                    </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" tabindex="0" value="">
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </script>
                            <div class="fineuploader" attr-list="true" attr-template="pe-template-url" attr-ftype="pdf,png,jpg,gif" load-type="inner" style="display: inline-block" ></div>
                            <div class="form-group file-type-note" style="padding-left: 70px;color: #999999;margin-top: -10px;">支持pdf、png、jpg格式</div>
						  </div>
						<!--上传原因-->
						<div class="form-group">
							<label for="news_title" class="control-label">定标原因：</label>
							<div style="display: inline-block;">
								<textarea class="form-control" style="width: 370px;max-width: 370px;" id="baoreason" needle="needle" placeholder="请输入文字描述"></textarea>
							</div>
						</div>
					</div>
					<!--尾部-->
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="d_sub_btn" style="outline:none;background: #009944;">
							确&nbsp;&nbsp;定
                       </button>
						<button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 
							取&nbsp;&nbsp;消
                       </button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--澄清彈框************************************************************************************-->
	<div class="modal fade" id="cq_model">
		<div class="lodin">
			<div class="log">
				<img src="app/core/styles/images/qio.png" />
			</div>
		</div>
		<div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4>澄清</h4>
				</div>
				<div id="test"></div>
				<div class="modal-body">
					<div class="form-group">
						<div style="margin: 0 auto;">
							<div class="form-group">
								<span style="float: left">澄清内容：</span>
								<textarea name="remark-input" id="text" cols="40" rows="3" placeholder="请输入200个字以内澄清信息" maxlength="200" style="width: 355px;resize:none"></textarea>
							</div>

						 <div class="form-group" style="margin-bottom: 0">
                            <span style="float: left">澄清文件：</span>
                            <script type="text/template" id="pe-template-url2">
                                <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                        <div class="qq-upload-button-selector">
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals">
                                                <li>
                                                <span class="btn btn-default" style="color: #009944;border: solid 1px #009944;">
                                                    <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>
                                                                                                             上传文档
                                                </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" id="clarify-files" tabindex="0" value="">
                                                    <div style="position: relative;float: right;margin-top: 4px;margin-left: 5px;" class="uploaded-show">
                                                        <span class="qq-upload-file-selector qq-upload-file upload-file-name" id="clarify-title" style="width: 200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"></span>
                                                        <span class="delete-file-btn yellow-text" style="float: right;">&times;</span>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions">
                                                <li style="text-align: left">
                                                    <span class="btn btn-default" style="color: #009944;border: solid 1px #009944;">
                                                        <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
                                                    </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" tabindex="0" value="">
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </script>
                            <div class="fineuploader" attr-list="true" attr-template="pe-template-url2" attr-ftype="pdf,rar,zip,doc,docx,xls,xlsx" load-type="inner" style="display: inline-block" ></div>
                        </div>
							<div class="form-group file-type-note" style="padding-left: 70px;color: #999999">仅支持pdf,rar,zip,doc,docx,xls,xlsx文件</div>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="sub_btn" style="outline:none;background: #009944;"> 确&nbsp;&nbsp;定
                    </button>
					<button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消
                    </button>
				</div>
			</div>
		</div>
	</div>
	<!--查看图片-->
     	<div class="modal fade" id="imgs_c">
		<div class="modal-dialog">
			<div class="modal-content" style="background: none;border: 0px;box-shadow: none;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="color: #fff;opacity: 1;">&times;</button>
				</div>
			    <div class="modal-body" style="position: relative;">
			    	<!--在src里写图片路径-->
			    	 <img src="{x2;$winerData['based_file']}"  style="position: absolute;left: 50%;transform: translate(-50%);">
			    </div>	
			</div>
		</div>
	</div>
	{x2;include:footer2}
	<script src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.auto.js"></script>
	<script src="app/core/styles/js/html2canvas.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.debug.js" integrity="sha384-THVO/sM0mFD9h7dfSndI6TS0PgAGavwKvB5hAxRRvc0o9cPLohB0wb/PTA7LdUHs" crossorigin="anonymous"></script>
	<script>
		$(function() {
				$(window).unbind('beforeunload');
				window.onbeforeunload = null;
		})
		//查看图片**************************************************
		 function imgs(){
		 	$("#imgs_c").modal();
		 }
		
		
		//定标*****************************************************
		function filepost(pid, xid, bid) {
			var pid = pid; //报价id
			var xid = xid; //询价id
			var bid = bid; //报价人id
			$("#myModal").modal();
			$("#d_sub_btn").click(function() {
					var urls = $('#img_src').val(); //图片路径
					var reason = $("#baoreason").val(); //定标原因
					var img_name=$("#img_src_name").text();
					if (urls == undefined) {
						var data = {
							result: false,
							message: '请上传图片'
						};
						$.zoombox.show('ajax', data);
						return false;
					}
					var jsons = {
						pid: pid,
						xid: xid,
						bid: bid,
						urls: urls,
						reason: reason,
						urls_name:img_name
					};
					//console.log(jsons);return false;
					$.ajax({
						type: 'post',
						url: "index.php?user-company-clarify-priceOrder",
						dataType: 'JSON',
						data: jsons,
						beforeSend: function() {
							// 禁用按钮防止重复提交
							$("#d_sub_btn").attr({
								disabled: "disabled"
							});
							$(".lodin").show();
						},
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
						},
						complete: function() {
							$("#d_sub_btn").removeAttr("disabled");
							$(".lodin").hide();
						}
					});
				})
				//清空
			$('#img_src').val('');
			$('#reason').val('');
			$('#tip_img').attr("src", "app/core/styles/images/noimage.gif");
		}
		//澄清
		function filepost1(id) {
			var id = id; //询价数据id
			$("#cq_model").modal();
			$("#sub_btn").click(function() {
					var urls = $('#clarify-files').val(); //文件路径
					var texts = $("#text").val(); //澄清信息
					var files_name = $("#clarify-title").text(); //澄清信息
					//console.log(urls,files_name);return false;
					if (urls == undefined) {
						urls == '';
						//						var data = {
						//							result: false,
						//							message: '请上传文件'
						//						};
						//						$.zoombox.show('ajax', data);
						//						return false;
					}
					if (texts == "") {
						var data = {
							result: false,
							message: '请輸入澄清信息'
						};
						$.zoombox.show('ajax', data);
						return false;
					}
					var jsons = {
						uds: urls,
						text: texts,
						title: files_name,
						xunid: id
					};
					//console.log(jsons);return false;
					$.ajax({
						type: 'post',
						url: "index.php?user-company-clarify-addclarifylists",
						dataType: 'JSON',
						data: jsons,
						beforeSend: function() {
							// 禁用按钮防止重复提交
							$("#sub_btn").attr({
								disabled: "disabled"
							});
							$(".lodin").show();
						},
						success: function(res) {
							if (res.statusCode == 200) {
								var data = {
									result: false,
									message: res.message
								};
								//  							$.zoombox.show('ajaxOK', data);								
								window.location.reload();
							} else {
								var data = {
									result: false,
									message: res.message
								};
								$.zoombox.show('ajax', data);
							}
						},
						complete: function() {
							$("#sub_btn").removeAttr("disabled");
							$(".lodin").hide();
						}
					});
				})
				//清空
			$('#clarify-files').val('');
			$('#text').val('');
			$('#clarify-title').html('');
		}
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
		});
		//提醒报价
		function callpirce(title, mobile, endtime) {
			//console.log(title,mobile)
			$.ajax({
				type: 'post',
				url: "index.php?user-company-purchases-callprice",
				dataType: 'JSON',
				data: {
					title: title,
					mobile: mobile,
					endtime: endtime
				},
				success: function(res) {
					if (res.statusCode == 200) {
						var data = {
							result: false,
							message: res.message
						};
						$.zoombox.show('ajaxOK', data);
						setTimeout(function() {
							window.location.reload();
						}, 2000)
					} else {
						var data = {
							result: false,
							message: res.message
						};
						$.zoombox.show('ajax', data);
					}
				}
			});
		}
	</script>
</body>