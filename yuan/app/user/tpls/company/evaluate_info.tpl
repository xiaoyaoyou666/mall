<html>

	<head>
		<title>评价详情</title>
		<link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico" />
		<script src="app/core/styles/js/jquery.min.js"></script>
		<script type="text/javascript" src="app/core/styles/js/pdfobject.js"></script>
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
		<style>
			* {
				margin: 0px;
				padding: 0px;
			}
			
			.head {
				width: 100%;
				height: 60px;
				background: #18bc9c;
			}
			
			.head ul li {
				display: inline-block;
				line-height: 60px;
			}
			
			.title {
				height: 30px;
				line-height: 30px;
				margin-top: 20px;
			}
			
			.titles span:first-child {
				display: inline-block;
				background: #18bc9c;
				width: 8px;
				height: 8px;
				margin-right: 10px;
			}
			
			.forms {
				border: 1px solid #ededed;
				border-radius: 4px;
				/*	width: 1398px;*/
				/*height: 558px;*/
				font-size: 13px;
				margin-bottom: 30px!important;
			}
			
			.forms>div {
				margin-top: 15px;
			}
			
			.pad {
				padding: 0px!important;
			}
			
			.head_btn {
				margin-top: 60px;
				margin-bottom: 30px;
			}
			
			ul {
				list-style-type: none;
			}
			
			.head_btn span {
				display: block;
				background-image: linear-gradient(-134deg, #50a9f1 0%, #c86dd7 100%);
				border-radius: 17.5px;
				/*background: url(../imgs/head_bg.png) no-repeat;*/
				background-size: 100% 100%;
				width: 176px;
				height: 40px;
				line-height: 40px;
				text-align: center;
				position: relative;
				left: 50%;
				margin-left: -88px;
				color: #fff;
				font-size: 14px;
			}
			
			input,
			select,
			textarea {
				padding-left: 10px;
				font-size: 14px;
				color: #999;
				outline: none!important;
			}
			
			.input_s {
				background: #ffffff;
				border: 1px solid #cccccc;
				box-shadow: inset 0 1px 4px 0 rgba(0, 0, 0, 0.15);
				border-radius: 6px;
				width: 250px;
				height: 34px;
				margin: 10px 0px;
				margin-left: 10px;
				display: inline-block!important;
			}
			
			.li_content {
				/*height: 216px;*/
				margin-bottom: 10px;
			}
			
			.li_content li {
				/*height: 26px;*/
				margin-bottom: 10px;
				/*line-height: 36px;*/
				font-size: 14px;
			}
			
			.li_content li span {
				float: right;
				margin-right: 10px;
			}
			/*	/*	/*	/*
			.title {
				height: 40px;
				line-height: 40px;
			}*/
			
			select,
			option,
			.explain,
			.input_dis,.input_c input {
				/*Chrome和Firefox里面的边框是不一样的，所以复写了一下*/
				border: none;
				outline: none;
				/*很关键：将默认的select选择框样式清除*/
				appearance: none;
				-moz-appearance: none;
				-webkit-appearance: none;
				/*将背景改为红色*/
				background-color: transparent;
				/*加padding防止文字覆盖*/
				padding-right: .14rem;
			}
			
			.title select {
				border: 1px solid #cccccc;
				box-shadow: inset 0 1px 4px 0 rgba(0, 0, 0, 0.15);
				border-radius: 6px;
				width: 116px;
				height: 34px;
				line-height: 34px;
				float: right;
				margin-right: 20px;
				background-color: #fff!important;
				background: url(../imgs/xl.png) no-repeat right 10px center transparent;
				background-size: 10px 6px;
				padding-right: 14px;
			}
			
			.input_dis {
				border: solid 1px #eee;
				border-radius: 4px;
				background-color: #fefefe!important;
				width: 100px;
				float: right;
				margin-right: 10px;
			}
			
			.title p {
				float: left;
				font-weight: bold;
				font-size: 15px;
			}
			
			.careful {
				background: rgba(105, 157, 252, 0.08);
				border: 1px dashed #699dfc;
				padding: 20px;
				width: 541px;
				height: 114px;
			}
			
			.careful ul li {
				margin-bottom: 5px;
				letter-spacing: 1px;
				color: #666666;
				font-size: 13px;
			}
			
			.explain {
				width: 400px;
				min-height: 30px;
				border-bottom: #999 1px dashed!important;
				color: #999;
			}
			
			.pitch {
				color: #65d7f7;
			}
			
			.row {
				margin: 10px 20px
			}
			
			.head ul li img {
				width: 30px;
				height: 30px;
				border-radius: 50%;
			}
			
			.head ul li span {
				padding-left: 10px;
				color: #fff;
			}
			
			.out_login {
				width: 100px;
				height: 40px;
				line-height: 40px;
				background: #D0E9F5;
				padding-left: 10px;
				position: absolute;
				right: 73px;
				z-index: 100;
				display: none;
			}
			
			.input_c {
				float: right;
			}
			
			.input_c input {
				width: 60px;
				border-bottom: solid 1px #999;
			}.li_content li{
				color: #666;
			}
            .active {
                color: #78bdf3!important;
            }
            .first_span{
              float: left!important;
              width: 565px;
            }
            .li_content div:last-child{
            	clear: both;
            }
		</style>
	</head>

	<body>
		<div class="container-fluid" style="margin: 0px;padding: 0px;">
			<div class="head">
				<ul>
					<a href="index.php?item">
						<li style="width:200px;background:#16a589;color: #fff;text-align: center;font-size: 20px;">天润新能</li>
					</a>
					<li style="float:right;margin-right:0px;margin-right: 50px;"><a class="ajax" href="index.php?user-app-logout" style="color: #fff;"><em class="glyphicon glyphicon-log-out" style="margin-right: 5px;"></em>退出登录</a></li>
					<li class="userInfo" style="float: right;margin-right: 50px;"><span>{x2;$_user['username']}</span></li>
				</ul>
			</div>

			<div class="row" style="margin-left:50px;margin-top:30px">
				<div class="col-md-12 pad">
					<p class="titles" style="float: left;padding-top: 2px;"><span></span><span>{x2;if:$type == '1'}物资类供应商使用评价表{x2;elseif:$type == '2'}运检类供应商使用评价表{x2;else}技术服务类供应商使用评价表{x2;endif}</span></p>
					<p style="float: right;margin-right: 30px;"><a href="index.php?user-company-index-evaluate_list" style="color:#18bc9c;line-height:30px;text-align:center;border-radius:6px;text-decoration: none;display: block;width:100px;height:30px;border:solid 1px #18bc9c">返回上一级</a></p>
				</div>
			</div>
			<div class="forms" style="margin:0px 50px;">
				<div class="head_btn col-xs-12">
					<span>基本信息</span>
				</div>
				<!--评价1-->
				{x2;if:$type == '1'}
				<div class="row">
					<div class="col-md-4 col-xs-12">
						<span>供应商全称</span>
						<input value="{x2;$data['supplier_name']}" type='text' class="input_s" name="contractor_name" disabled="disabled">
					</div>
					<div class="col-md-4 col-xs-12">
						<span>物资名称</span>
						<input value="{x2;$data['contract_name']}" type='text' class="input_s" name="contract_name" disabled="disabled">
					</div>
                    <div class="col-md-4 col-xs-12">
                        <span>项目名称</span>
                        <input value="{x2;$data['project_name']}" type='text' class="input_s" name="contract_name" disabled="disabled">
                    </div>
					<div class="col-md-4 col-xs-12">
						<span>评&nbsp;审&nbsp;时&nbsp;间</span>
						<input  value="{x2;date:$data['review_time'],'Y-m-d'}" type='text' class="input_s" name="review_time" disabled="disabled">
					</div>
                     <div class="col-md-4 col-xs-12">
                            <span>标段分类</span>
                            <input value="{x2;$data['cate_name']}" type='text' class="input_s" name="review_time" disabled="disabled">
                     </div>

				</div>
				{x2;endif}
				<!--评价2-->
				{x2;if:$type == '3'}
				<div class="row">
					<div class="col-md-4 col-xs-12">
						<span>供应商全称</span>
						<input type='text' class="input_s" value="{x2;$data['supplier_name']}" name="contractor_name" disabled="disabled">
					</div>
                    <div class="col-md-4 col-xs-12">
                        <span>标段名称</span>
                        <input type='text' class="input_s" value="{x2;$data['contract_name']}" name="engineer_name" disabled="disabled">
                    </div>
					<div class="col-md-4 col-xs-12">
						<span>项目名称</span>
						<input type='text' class="input_s" value="{x2;$data['project_name']}" name="contract_name" disabled="disabled">
					</div>
					<div class="col-md-4 col-xs-12">
						<span>评&nbsp;审&nbsp;时&nbsp;间</span>
						<input type='text' class="input_s" value="{x2;date:$data['review_time'],'Y-m-d'}" name="review_time" disabled="disabled">
					</div>
					<div class="col-md-4 col-xs-12">
						<span>完工时间</span>
						<input type='text' class="input_s" value="{x2;date:$data['stop_time'],'Y-m-d'}" name="stop_time" disabled="disabled">
					</div>
                    <div class="col-md-4 col-xs-12">
                        <span>标段分类</span>
                        <input value="{x2;$data['cate_name']}" type='text' class="input_s" name="review_time" disabled="disabled">
                    </div>
				</div>
				{x2;endif}

				<!--评价3-->
				{x2;if:$type == '2'}
				<div class="row">
					<div class="col-md-4 col-xs-12">
						<span>供应商全称</span>
						<input style="wid type='text'" value="{x2;$data['supplier_name']}" class="input_s" name="contractor_name" disabled="disabled">
					</div>
					<div class="col-md-4 col-xs-12">
						<span>标段名称</span>
						<input type='text' value="{x2;$data['contract_name']}" class="input_s" name="contract_name" disabled="disabled">
					</div>
                    <div class="col-md-4 col-xs-12">
                        <span>项目名称</span>
                        <input type='text' value="{x2;$data['project_name']}" class="input_s" name="contract_name" disabled="disabled">
                    </div>
					<div class="col-md-4 col-xs-12">
						<span>评&nbsp;审&nbsp;时&nbsp;间</span>
						<input value="{x2;date:$data['review_time'],'Y-m-d'}" type='text' class="input_s" name="engineer_name" disabled="disabled">
					</div>
					<div class="col-md-4 col-xs-12">
						<span>标段分类</span>
						<input  type='text' value="{x2;$data['cate_name']}" class="input_s" name="review_time" disabled="disabled">
					</div>
				</div>
				{x2;endif}
				<div class="head_btn col-xs-12">
					<span>评定细则</span>
				</div>
				{x2;if:$type == '1'}
				<div class="row">
					<div class="row_s" style="display: flex;justify-content: space-between;flex-wrap: wrap;width: 100%;">
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">价格情况（15%）</p>
								<input type="text" value="{x2;$data['data'][0]['select_0']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][0]['select_0'] <= 3}class="active"{x2;endif}><span class="first_span">在工作紧张情况下不能提供服务或价格高出市场5%以上</span> <span>0-3分</span></li>
									<li {x2;if:$data['data'][0]['select_0'] > 3 && $data['data'][0]['select_0'] < 8}class="active"{x2;endif}><span class="first_span">价格不能保持市场竞争力。</span> <span>4-7分</span></li>
									<li {x2;if:$data['data'][0]['select_0'] > 7 && $data['data'][0]['select_0'] < 12}class="active"{x2;endif}><span class="first_span">价格保持市场竞争力，在工作紧张时也能及时提供服务。</span><span>8-11分</span></li>
									<li {x2;if:$data['data'][0]['select_0'] > 11 && $data['data'][0]['select_0'] < 16}class="active"{x2;endif}><span class="first_span">价格稳中趋降，能协助降低总采购成本。</span> <span>12-15分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span><span class="explain" style="display:inline-block">{x2;$data['data'][0]['input_0']}</span> 
									<p style="clear: both;"></p>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">质量情况（15%）</p>
								<input type="text" value="{x2;$data['data'][1]['select_1']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][1]['select_1'] <= 5}class="active"{x2;endif}><span class="first_span">产品或服务的交检合格率低于95%、运行故障率超过3%</span> <span>0-5分</span></li>
									<li {x2;if:$data['data'][1]['select_1'] > 5 && $data['data'][1]['select_1'] < 11}class="active"{x2;endif}><span class="first_span">产品或服务的交检合格率97%、运行故障率2%以内 </span><span>6-10分</span></li>
									<li {x2;if:$data['data'][1]['select_1'] > 10 && $data['data'][1]['select_1'] < 16}class="active"{x2;endif}><span class="first_span">产品或服务的交检合格率99%以上、运行故障率1%以内 </span><span>11-15分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][1]['input_1']}</span>
									<p style="clear: both;"></p>
								<!--	<input type="text" value="{x2;$data['data'][1]['input_1']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">供货情况（15%）</p>
								<input type="text" value="{x2;$data['data'][2]['select_2']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][2]['select_2'] <= 3}class="active"{x2;endif}><span class="first_span">按期供货率小于70%</span><span>0-3分</span></li>
									<li {x2;if:$data['data'][2]['select_2'] > 3 && $data['data'][2]['select_2'] < 8}class="active"{x2;endif}><span class="first_span">按期供货率小于90%</span><span>4-7分</span></li>
									<li {x2;if:$data['data'][2]['select_2'] > 7 && $data['data'][2]['select_2'] < 12}class="active"{x2;endif}><span class="first_span">按期供货率≧90%，且部分能随需求调整 </span><span>8-11分</span></li>
									<li {x2;if:$data['data'][2]['select_2'] > 11 && $data['data'][2]['select_2'] < 16}class="active"{x2;endif}><span class="first_span">完全满足要求，能根据项目实际情况进行调整</span><span>12-15分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][2]['input_2']}</span>
									<p style="clear: both;"></p>
									<!--<input type="text" value="{x2;$data['data'][2]['input_2']}" disabled="disabled" class="explain"></div>-->
							  </div>
						</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">产品资料（5%）</p>
								<input type="text" value="{x2;$data['data'][3]['select_3']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][3]['select_3'] <= 1}class="active"{x2;endif}><span class="first_span">产品相关资料不齐 全，缺少关键资料</span><span>0-1分</span></li>
									<li {x2;if:$data['data'][3]['select_3'] > 1 && $data['data'][3]['select_3'] < 3}class="active"{x2;endif}><span class="first_span">产品相关资料基本齐全，不缺少关键资料</span><span>2-3分</span></li>
									<li {x2;if:$data['data'][3]['select_3'] > 3 && $data['data'][3]['select_3'] < 6}class="active"{x2;endif}><span class="first_span">产品相关资料齐全、交接及时</span><span>4-5分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][3]['input_3']}</span>
									 <p style="clear: both;"></p>
									<!--<input type="text" value="{x2;$data['data'][3]['input_3']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">技术对接（15%）</p>
								<input type="text" value="{x2;$data['data'][4]['select_4']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][4]['select_4'] <= 3}class="active"{x2;endif}><span class="first_span">配合不好或对接不及时</span><span>0-3分</span></li>
									<li {x2;if:$data['data'][4]['select_4'] > 3 && $data['data'][4]['select_4'] < 8}class="active"{x2;endif}><span class="first_span">配合、对接一般，基本满足要求</span><span>4-7分</span></li>
									<li {x2;if:$data['data'][4]['select_4'] > 7 && $data['data'][4]['select_4'] < 12}class="active"{x2;endif}><span class="first_span">配合良好，对接及时</span><span>8-11分</span></li>
									<li {x2;if:$data['data'][4]['select_4'] > 11 && $data['data'][4]['select_4'] < 16}class="active"{x2;endif}><span class="first_span">配合、对接过程中能够给使用单位提供技术指导</span><span>12-15分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][4]['input_4']}</span>
									<p style="clear: both;"></p>
									<!--<input type="text" value="{x2;$data['data'][4]['input_4']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">现场验收（15%）</p>
								<input type="text" value="{x2;$data['data'][5]['select_5']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][5]['select_5'] <= 3}class="active"{x2;endif}><span class="first_span">规格型号或数量有误，外包装有破损,且缺少关键资料</span><span>0-3分</span></li>
									<li {x2;if:$data['data'][5]['select_5'] > 3 && $data['data'][5]['select_5'] < 8}class="active"{x2;endif}><span class="first_span">规格型号及数量准确，外包装有破损，且资料基本齐全</span><span>4-7分</span></li>
									<li {x2;if:$data['data'][5]['select_5'] > 7 && $data['data'][5]['select_5'] < 12}class="active"{x2;endif}><span class="first_span">规格型号及数量准确，外包装完整，且资料齐全</span><span>8-11分</span></li>
									<li {x2;if:$data['data'][5]['select_5'] > 11 && $data['data'][5]['select_5'] < 16}class="active"{x2;endif}><span class="first_span">产品设计、制造合理，便于操作</span><span>12-15分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][5]['input_5']}</span>
									<p style="clear: both;"></p>
								<!--	<input type="text" value="{x2;$data['data'][5]['input_5']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">信息支持及售后（15%）</p>
								<input type="text" value="{x2;$data['data'][6]['select_6']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][6]['select_6'] <= 3}class="active"{x2;endif}><span class="first_span">对现场产品故障信息需求不配合/不能兑现售后服务承诺</span><span>0-3分</span></li>
									<li {x2;if:$data['data'][6]['select_6'] > 3 && $data['data'][6]['select_6'] < 8}class="active"{x2;endif}><span class="first_span">对现场产品故障信息需求配合周期很长，协助故障的消除时间超过市场平均水平</span><span>4-7分</span></li>
									<li {x2;if:$data['data'][6]['select_6'] > 7 && $data['data'][6]['select_6'] < 12}class="active"{x2;endif}><span class="first_span">对现场产品故障信息需求基本配合，能协助故障的消除/基本兑现售后服务承诺</span><span>8-11分</span></li>
									<li {x2;if:$data['data'][6]['select_6'] > 11 && $data['data'][6]['select_6'] < 16}class="active"{x2;endif}><span class="first_span">对现场产品故障信息需求积极配合，消除故障，提出改进措施/兑现售后服务承诺且响应速度快</span><span>12-15分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][6]['input_6']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][6]['input_6']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">职业健康安全（3%）</p>
								<input type="text" value="{x2;$data['data'][7]['select_7']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][7]['select_7'] <= 0}class="active"{x2;endif}><span class="first_span">对现场提供的设备设施、物资材料，存在不符合国家法律法规、电力行业规范要求的情况。在设备设施、物资材料使用期间，发生安全事故并导致人员伤亡及财产损失的情况。</span><span>0分</span></li>
									<li {x2;if:$data['data'][7]['select_7'] > 0 && $data['data'][7]['select_7'] < 3}class="active"{x2;endif}><span class="first_span">在设备设施、物资材料使用期间，接到现场人员对其存在安全风险方面的投诉，但未造成实际人员伤亡及财产损失的情况。</span><span>1-2分</span></li>
									<li {x2;if:$data['data'][7]['select_7'] == 3}class="active"{x2;endif}><span class="first_span">对现场提供的设备设施、物资材料，符合国家法律法规、电力行业规范要求，对现场作业人员不构成安全风险。在设备设施、物资材料使用期间，未接到现场人员对其存在安全风险方面的投诉。</span><span>3分</span></li>
									<li {x2;if:$data['data'][7]['select_7'] > 11 && $data['data'][7]['select_7'] < 16}class="active"{x2;endif}><span class="first_span">对现场产品故障信息需求积极配合，消除故障，提出改进措施/兑现售后服务承诺且响应速度快</span><span>12-15分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][7]['input_7']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][7]['input_7']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">环境保护（2%）</p>
								<input type="text" value="{x2;$data['data'][8]['select_8']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][8]['select_8'] == 0}class="active"{x2;endif}><span class="first_span">对现场提供的设备设施、物资材料，存在不符合国家法律法规、电力行业规范要求的情况，对周边环境造成污染的情况。</span><span>0分</span></li>
									<li {x2;if:$data['data'][8]['select_8'] == 1}class="active"{x2;endif}><span class="first_span">在设备设施、物资材料使用期间，接到现场人员、周边居民对其污染周边环境的投诉，造成污染情况较轻未产生损失的情况。</span><span>1分</span></li>
									<li {x2;if:$data['data'][8]['select_8'] == 2}class="active"{x2;endif}><span class="first_span">对现场提供的设备设施、物资材料，符合国家法律法规、电力行业规范要求，不构成对周边环境造成污染。在设备设施、物资材料使用期间，未接到现场人员、周边居民对其污染周边环境的投诉。在上级部门、体系审核、专家诊断等的各项检查工作中，未对设备设施、物资材料提出不符合环保要求的问题。</span><span>2分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][8]['input_8']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][8]['input_8']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>

					</div>

					<div class="col-md-12 col-xs-12" style="margin-top: 30px;">
						<ul>
							<li style="margin-bottom: 20px;">总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;得&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分 <input type="text" value="{x2;$data['total_score']}" class="input_dis" name="total_score" disabled="disabled" style="float: none;margin-left: 20px;width: 200px;height: 32px;"></li>
							<li>评价人员签名<input type="text" class="input_dis" name="autograph" disabled="disabled" style="float: none;margin-left: 20px;width: 200px;height: 32px;" value="{x2;$data['autograph']}"></li>
						</ul>
					</div>
				</div>
				{x2;endif}
				<!--评价1-->
				{x2;if:$type == '3'}
				<div class="row">
					<div class="row_s" style="display: flex;justify-content: space-between;flex-wrap: wrap;width: 100%;">
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">服务能力（30%）</p>
								<input type="text" value="{x2;$data['data'][0]['select_0']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][0]['select_0'] <= 8}class="active"{x2;endif}><span class="first_span">不能履行服务合同或出具的服务报告不合格，人为原因造成的一般设备或重伤及以上事故。</span><span>0-7分</span></li>
									<li {x2;if:$data['data'][0]['select_0'] > 7 && $data['data'][0]['select_0'] < 16}class="active"{x2;endif}><span class="first_span">按要求履行合同并提供完整报告，人为原因造成的记录设备或微伤及以上事故。</span><span>8-15分</span></li>
									<li {x2;if:$data['data'][0]['select_0'] > 15 && $data['data'][0]['select_0'] < 24}class="active"{x2;endif}><span class="first_span">服务人员在职责范围内有求必应、有问必答和耐心细致，表现出很高的素质和良好的服务态度，人为原因造成的一类障碍及以下事故。</span><span>16-23分</span></li>
									<li {x2;if:$data['data'][0]['select_0'] > 23 && $data['data'][0]['select_0'] < 31}class="active"{x2;endif}><span class="first_span">不仅精通产品技术，同时还对电力行业的用户需求特点有深入的了解，自发优化服务水平，例如对每次服务都进行书面记录，甚至提供书面的用户需求分析报告。</span><span>24-30分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][0]['input_0']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][0]['input_0']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">价格竞争力（10%）</p>
								<input type="text" value="{x2;$data['data'][1]['select_1']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][1]['select_1'] <= 2}class="active"{x2;endif}><span class="first_span">在工作紧张情况下不能提供服务或价格高出市场5%以上。</span><span>0-2分</span></li>
									<li {x2;if:$data['data'][1]['select_1'] > 2 && $data['data'][1]['select_1'] < 6}class="active"{x2;endif}><span class="first_span">价格不能保持市场竞争力。</span><span>3-5分</span></li>
									<li {x2;if:$data['data'][1]['select_1'] > 5 && $data['data'][1]['select_1'] < 9}class="active"{x2;endif}><span class="first_span">价格保持市场竞争力，在工作紧张时也能及时提供服务。</span><span>6-8分</span></li>
									<li {x2;if:$data['data'][1]['select_1'] > 8 && $data['data'][1]['select_1'] < 11}class="active"{x2;endif}><span class="first_span">价格稳中趋降，能协助降低总采购成本。</span><span>9-10分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][1]['input_1']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][1]['input_1']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">技术能力（30%）</p>
								<input type="text" value="{x2;$data['data'][2]['select_2']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][2]['select_2'] <= 7}class="active"{x2;endif}><span class="first_span">技术能力不能满足合同要求或行业标准。</span><span>0-7分</span></li>
									<li {x2;if:$data['data'][2]['select_2'] > 7 && $data['data'][2]['select_2'] < 16}class="active"{x2;endif}><span class="first_span">技术能力低于国内或国外同类产品平均水平。</span><span>8-15分</span></li>
									<li {x2;if:$data['data'][2]['select_2'] > 15 && $data['data'][2]['select_2'] < 24}class="active"{x2;endif}><span class="first_span">技术能力接近国内或国外同类产品先进水平。</span><span>16-23分</span></li>
									<li {x2;if:$data['data'][2]['select_2'] > 23 && $data['data'][2]['select_2'] < 31}class="active"{x2;endif}><span class="first_span">根据服务特点，对工作程序及服务项目进行评估，处于国内或国际先进水平。</span><span>24-30分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][2]['input_2']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][2]['input_2']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">定制服务能力（25%）</p>
								<input type="text" value="{x2;$data['data'][3]['select_3']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][3]['select_3'] <= 5}class="active"{x2;endif}><span class="first_span">不具备相关技术能力。</span><span>0-5分</span></li>
									<li {x2;if:$data['data'][3]['select_3'] > 5 && $data['data'][3]['select_3'] < 13}class="active"{x2;endif}><span class="first_span">不具备定制或现有服务改进能力。</span><span>6-12分</span></li>
									<li {x2;if:$data['data'][3]['select_3'] > 12 && $data['data'][3]['select_3'] < 19}class="active"{x2;endif}><span class="first_span">有一定的定制服务能力。</span><span>13-18分</span></li>
									<li {x2;if:$data['data'][3]['select_3'] > 18 && $data['data'][3]['select_3'] < 26}class="active"{x2;endif}><span class="first_span">在需要时可提供定制服务，技术人员表现出很强的设计能力和技术水平。</span><span>19-25分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][3]['input_3']}</span>
									<p style="clear: both;"></p>
								<!--	实际情况说明：<input type="text" value="{x2;$data['data'][3]['input_3']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">职业健康安全（3%）</p>
								<input type="text" value="{x2;$data['data'][4]['select_4']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][4]['select_4'] == 0}class="active"{x2;endif}><span class="first_span">现场提供技术服务的人员，存在不符合国家法律法规、电力行业规范要求，或缺少相关工作的证件等资质要求，不满足工作需要的情况；现场提供技术服务的人员在作业过程及安全检查过程中，存在违反使用单位的安全规章制度，现场工作不规范的情况。</span><span>0分</span></li>
									<li {x2;if:$data['data'][4]['select_4'] > 0 && $data['data'][4]['select_4'] < 3}class="active"{x2;endif}><span class="first_span">现场提供技术服务的人员，符合国家法律法规、电力行业规范要求，具备相关工作的证件等资质要求，满足工作需要。但在作业过程及安全检查过程中，存在违反使用单位的安全规章制度，现场工作不规范的情况。</span><span>1-2分</span></li>
									<li {x2;if:$data['data'][4]['select_4'] == 3 }class="active"{x2;endif}><span class="first_span">现场提供技术服务的人员，符合国家法律法规、电力行业规范要求，具备相关工作的证件等资质要求，满足工作需要；在作业过程及安全检查过程中，严格遵守使用单位的安全规章制度，现场工作规范，安全素养高，无违章情况发生。</span><span>3分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][4]['input_4']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][4]['input_4']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">环境保护（2%）</p>
								<input type="text" value="{x2;$data['data'][5]['select_5']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][5]['select_5'] == 0}class="active"{x2;endif}><span class="first_span">现场提供技术服务的人员在作业过程中，不能严格遵守使用单位环保制度要求；施工过程中，不能主动按照“工完、料净、场地清”的要求，自觉对作业过程中产生的废油、废物、废料进行统一收集，到指定垃圾站进行处理。现场技术服务期间，用人单位接到工作监护人、周边居民对技术服务人员作业行为污染周边环境的投诉。</span><span>0分</span></li>
									<li {x2;if:$data['data'][5]['select_5'] == 1}class="active"{x2;endif}><span class="first_span">现场提供技术服务的人员，在作业过程中，严格遵守使用单位环保制度要求，施工过程中，主动按照“工完、料净、场地清”的要求，自觉对作业过程中产生的废油、废物、废料进行统一收集，到指定垃圾站进行处理。现场技术服务期间，用人单位接到工作监护人、周边居民对技术服务人员作业行为污染周边环境的投诉。</span><span>1分</span></li>
									<li {x2;if:$data['data'][5]['select_5'] == 2}class="active"{x2;endif}><span class="first_span">现场提供技术服务的人员，在作业过程中，严格遵守使用单位环保制度要求，施工过程中，主动按照“工完、料净、场地清”的要求，自觉对作业过程中产生的废油、废物、废料进行统一收集，到指定垃圾站进行处理。现场技术服务期间，用人单位未接到工作监护人、周边居民对技术服务人员作业行为污染周边环境的投诉。</span><span>2分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][5]['input_5']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][5]['input_5']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-xs-12" style="margin-top: 30px;">
						<ul>
							<li style="margin-bottom: 20px;">总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;得&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分 <input type="text" value="{x2;$data['total_score']}" class="input_dis" name="total_score" disabled="disabled" style="float: none;margin-left: 20px;width: 200px;height: 32px;"></li>
							<li>评价人员签名<input type="text" class="input_dis" name="autograph" disabled="disabled" style="float: none;margin-left: 20px;width: 200px;height: 32px;" value="{x2;$data['autograph']}"></li>
						</ul>
					</div>
				</div>
				{x2;endif}
				<!--评价2-->
				{x2;if:$type == '2'}
				<div class="row">
					<div class="row_s" style="display: flex;justify-content: space-between;flex-wrap: wrap;width: 100%;">
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">价格情况（15%）</p>
								<input type="text" value="{x2;$data['data'][0]['select_0']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][0]['select_0'] <= 3}class="active"{x2;endif}><span class="first_span">在工作紧张情况下不能提供服务或价格高出市场5%以上。</span><span>0-3分</span></li>
									<li {x2;if:$data['data'][0]['select_0'] > 3 && $data['data'][0]['select_0'] < 8}class="active"{x2;endif}><span class="first_span">价格不能保持市场竞争力。</span><span>4-7分</span></li>
									<li {x2;if:$data['data'][0]['select_0'] > 7 && $data['data'][0]['select_0'] < 12}class="active"{x2;endif}><span class="first_span">价格保持市场竞争力，在工作紧张时也能及时提供服务。</span><span>8-11分</span></li>
									<li {x2;if:$data['data'][0]['select_0'] > 11 && $data['data'][0]['select_0'] < 16}class="active"{x2;endif}><span class="first_span">价格稳中趋降，能协助降低总采购成本。</span><span>12-15分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][0]['input_0']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][0]['input_0']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">信息支持（25%）</p>
								<input type="text" value="{x2;$data['data'][1]['select_1']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][1]['select_1'] <= 5}class="active"{x2;endif}><span class="first_span">对现场产品故障分析信息需求不配合</span><span>0-5分</span></li>
									<li {x2;if:$data['data'][1]['select_1'] > 5 && $data['data'][1]['select_1'] < 13}class="active"{x2;endif}><span class="first_span">对现场产品故障分析信息需求基本配合，但不能消除故障</span><span>6-12分</span></li>
									<li {x2;if:$data['data'][1]['select_1'] > 12 && $data['data'][1]['select_1'] < 19}class="active"{x2;endif}><span class="first_span">对现场产品故障分析信息需求基本配合，能协助故障的消除</span><span>13-18分</span></li>
									<li {x2;if:$data['data'][1]['select_1'] > 18 && $data['data'][1]['select_1'] < 26}class="active"{x2;endif}><span class="first_span">对现场产品故障分析信息需求积极配合，消除故障，提出改进措施</span><span>19-25分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][1]['input_1']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][1]['input_1']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">现场支持（30%）</p>
								<input type="text" value="{x2;$data['data'][2]['select_2']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][2]['select_2'] <= 7}class="active"{x2;endif}><span class="first_span">不能兑现售后服务承诺</span><span>0-7分</span></li>
									<li {x2;if:$data['data'][2]['select_2'] > 7 && $data['data'][2]['select_2'] < 16}class="active"{x2;endif}><span class="first_span">基本能够兑现售后服务承诺，响应不够及时</span><span>8-15分</span></li>
									<li {x2;if:$data['data'][2]['select_2'] > 15 && $data['data'][2]['select_2'] < 24}class="active"{x2;endif}><span class="first_span">基本能够兑现售后服务承诺，响应及时</span><span>16-23分</span></li>
									<li {x2;if:$data['data'][2]['select_2'] > 23 && $data['data'][2]['select_2'] < 31}class="active"{x2;endif}><span class="first_span">能够兑现售后服务承诺且响应速度快</span><span>24-30分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][2]['input_2']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][2]['input_2']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">（试）运行情况（25%）</p>
								<input type="text" value="{x2;$data['data'][3]['select_3']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][3]['select_3'] <= 5}class="active"{x2;endif}><span class="first_span">产品不能满足（试）运行要求，故障频发</span><span>0-5分</span></li>
									<li {x2;if:$data['data'][3]['select_3'] > 5 && $data['data'][3]['select_3'] < 13}class="active"{x2;endif}><span class="first_span">产品基本满足（试）运行各项性能指标和电网要求</span><span>6-12分</span></li>
									<li {x2;if:$data['data'][3]['select_3'] > 12 && $data['data'][3]['select_3'] < 19}class="active"{x2;endif}><span class="first_span">产品完全满足（试）运行各项性能指标和电网要求</span><span>13-18分</span></li>
									<li {x2;if:$data['data'][3]['select_3'] > 18 && $data['data'][3]['select_3'] < 26}class="active"{x2;endif}><span class="first_span">产品部分指标大幅度超过国标要求和电网要求</span><span>19-25分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][3]['input_3']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][3]['input_3']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">职业健康安全（3%）</p>
								<input type="text" value="{x2;$data['data'][4]['select_4']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][4]['select_4'] <= 0}class="active"{x2;endif}><span class="first_span">现场运检作业人员，存在不符合国家法律法规、电力行业规范要求，或缺少相关工作的证件等资质要求，不满足工作需要的情况；现场运检作业人员在作业过程及安全检查过程中，存在违反使用单位的安全规章制度，现场工作不规范的情况。</span><span>0分</span></li>
									<li {x2;if:$data['data'][4]['select_4'] > 0 && $data['data'][4]['select_4'] < 3}class="active"{x2;endif}><span class="first_span">现场运检作业人员，符合国家法律法规、电力行业规范要求，具备相关工作的证件等资质要求，满足工作需要。但在作业过程及安全检查过程中，存在违反使用单位的安全规章制度，现场工作不规范的情况。</span><span>1-2分</span></li>
									<li {x2;if:$data['data'][4]['select_4'] == 3}class="active"{x2;endif}><span class="first_span">现场运检作业人员，在作业过程中，严格遵守使用单位的安全规章制度，现场工作规范，安全素养高，无违章情况发生。在安全检查中，未发现运检作业人员存在违章违纪行为。</span><span>3分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][4]['input_4']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][4]['input_4']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">环境保护（2%）</p>
								<input type="text" value="{x2;$data['data'][5]['select_5']}" disabled="disabled" class="input_dis">
								<ul style="clear: both;">
									<li {x2;if:$data['data'][5]['select_5'] <= 0}class="active"{x2;endif}><span class="first_span">现场运检作业人员，在巡检、作业、操作过程中，严格遵守使用单位环保制度要求，工作过程中，未造成环境污染情况发生。</span><span>0分</span></li>
									<li {x2;if:$data['data'][5]['select_5'] == 1}class="active"{x2;endif}><span class="first_span">现场工作期间，用人单位未接到周边居民对运检作业人员作业行为污染周边环境的投诉。</span><span>1分</span></li>
									<li {x2;if:$data['data'][5]['select_5'] == 2}class="active"{x2;endif}><span class="first_span">现场运检的人员，自觉对生产和生活过程中，产生的废油、废物、废料、垃圾进行统一收集，到指定垃圾站进行处理，不发生随意丢弃的行为。在上级部门、体系审核、专家诊断、安全环水保等各项检查工作中，未发现现场技术服务人员存在破坏环境、污染环境的不法行为。</span><span>2分</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block">{x2;$data['data'][5]['input_5']}</span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" value="{x2;$data['data'][5]['input_5']}" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
						<div class="col-md-6 col-xs-12 li_content">
							<div class="title">
								<p style="float: left;">减分项</p>
								<ul style="clear: both;">
									<li>按照巡视要求，在运行中发现一处因设备质量原因缺陷扣1分<span class="input_c"><input value="{x2;$data['cut_score'][0]}" type="text" disabled="disabled">处</span></li>
									<li>每发生一次紧急缺陷扣1分<span class="input_c"><input type="text" value="{x2;$data['cut_score'][1]}" disabled="disabled">次</span></li>
									<li>发生一次跳闸扣3分<span class="input_c"><input type="text" value="{x2;$data['cut_score'][2]}" disabled="disabled">次</span></li>
									<li>每发生操作维护故障、缺陷扣一分<span class="input_c"><input type="text" value="{x2;$data['cut_score'][3]}" disabled="disabled">次</span></li>
									<li>一般性及交接每发生一项试验不合格扣三分<span class="input_c"><input value="{x2;$data['cut_score'][4]}" type="text" disabled="disabled">项</span></li>
									<li>在诊断性试验中，发现一项不合格扣3分<span class="input_c"><input value="{x2;$data['cut_score'][5]}" type="text" disabled="disabled">项</span></li>
									<li>对于安全违章违纪行为，发现一项，扣除1分（若情况严重，人员列入黑名单，清除出场）。现场运检作业过程中出现人员伤亡等安全事故的，列入黑名单。<span class="input_c"><input type="text" value="{x2;$data['cut_score'][6]}" disabled="disabled">项</span></li>
									<li>在发现破坏环境的不法行为，发现一项，扣除1分（若情况严重，人员列入黑名单，清除出场）。<span class="input_c" ><input type="text" value="{x2;$data['cut_score'][7]}" disabled="disabled">项</span></li>
								</ul>
								<div>
									<span style="float: left;">实际情况说明：</span>
									<span class="explain" style="display:inline-block"></span>
									<p style="clear: both;"></p>
									<!--实际情况说明：<input type="text" disabled="disabled" class="explain">-->
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-xs-12" style="margin-top: 30px;">
						<ul>
							<li style="margin-bottom: 20px;">总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;得&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分 <input type="text" class="input_dis" value="{x2;$data['total_score']}" name="total_score" disabled="disabled" style="float: none;margin-left: 20px;width: 200px;height: 32px;"></li>
							<li>评价人员签名<input type="text" value="{x2;$data['autograph']}" class="input_dis" name="autograph" disabled="disabled" style="float: none;margin-left: 20px;width: 200px;height: 32px;"></li>
						</ul>
					</div>
				</div>
				{x2;endif}
				<!--评价3-->

			</div>
		</div>

	</body>
	<script type="text/javascript">
		$(".userInfo").on('mouseover', function() {
			$(".out_login").show();
		})
		$(".out_login").on("mouseleave", function() {
			$(".out_login").hide()
		})
	</script>

</html>