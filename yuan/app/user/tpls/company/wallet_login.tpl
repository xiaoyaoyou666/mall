{x2;include:header}
<body>
	<style type="text/css">
		select{color: #555555a1!important;}
        .red{
            color: #f00;
            width: 10px!important;
            float: none!important;
            margin-right: 5px!important;
        }
        .writingArea p span{
            width:160px;
        }
        .writingArea .opui span{
            width:160px;
        }
	</style>
{x2;include:nav}
    <script src="app/core/styles/js/user/plugin3.js"></script>
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php">企业中心</a> > <a href="index.php?enterprise">账户管理</a> > <a>钱包管理</a></span>
        </div>
        <div class="qycenter-content">
            {x2;include:menu}
            <div class="right-content col10 pull-right zmm_panel">
            	<p class="plase_for"><span>*</span>请完整填写以下信息。</p>
            	<div class="writingArea">
                    <p><span><span class="red">*</span>企业名称</span><input class="form-control col_s" placeholder="请输入企业全称" type="text" name="merFullName" id="" value="{x2;$meruser['merFullName']}" needle="needle"/></p>
                    <p><span><span class="red">*</span> 商户品牌名称</span><input class="form-control col_s" placeholder="请填写商户品牌名称" type="text" name="merShortName" needle="needle" id="" value="{x2;$meruser['merShortName']}" /></p>
            		<p><span><span class="red">* </span>证件类型</span><input class="form-control col_s" placeholder="请填写证件类型" type="text" disabled="disabled"  needle="needle" value="营业执照" name="" id="" {x2;if:$meruser['merShortName'] != ''}  {x2;else} value=""  {x2;endif} /></p>
            		<p><span><span class="red">* </span>证件号</span><input class="form-control col_s" placeholder="请填写证件号" type="text" name="merCertNo" id="" needle="needle" value="{x2;$meruser['merCertNo']}" /></p>
            		<p><span><span class="red">* </span>法人姓名</span><input class="form-control col_s" placeholder="请填写法人姓名" type="text" name="legalName" id="" needle="needle" value="{x2;$meruser['legalName']}" /></p>
                    <p><span><span class="red">*</span> 法人身份证号</span><input class="form-control col_s" placeholder="请填写法人身份证号" type="text" name="legalIdCard" id="" needle="needle" value="{x2;$meruser['legalIdCard']}" /></p>
            		<p>
                        <span><span class="red">*</span> 商户一级分类</span>
            			<select class="form-control seles" id="tenant" needle="needle" style="width: 440px!important;">
            				<option value="0">选择一级分类</option>
                            {x2;tree:$merTopCode,mTopCode,pid}
                            <option value="{x2;v:mTopCode['classCode']}" classType="{x2;v:mTopCode['classType']}" {x2;if:v:mTopCode['isSet'] == 1} selected = "selected" {x2;endif}>{x2;v:mTopCode['title']}</option>
                            {x2;endtree}
            			</select>
            		</p>
            		<p>
                        <span><span class="red">*</span> 商户二级分类</span>
            			<select class="form-control seles" needle="needle" id="tentant_two" style="width: 440px!important;">
            				<option value="0">选择二级分类</option>
            			</select>
            		</p>
            		<!---->
            		<div class="opui">
            			<span><span class="red">* </span>商户地址</span>
            			    <div class="col-md-10" style="width: 70%;padding-left: 0;">
						        <div class="col-sm-2" style="width: 22%;padding-left: 0;">
						            <select class="autoloaditem combox form-control require merProvince" autoload="index.php?core-api-index-getProvince"
						                    target="service_city" refurl="index.php?core-api-index-getcity&parent={value}"
						                    name="args[service_province]" id="service_province" current="" needle="needle"
						                    msg="您必须选择省"></select>
						
						        </div>
						
						        <div class="col-sm-2" style="width: 24%;">
						            <select class="autoloaditem combox form-control require merCity" autoload="index.php?core-api-index-getcity"
						                    target="service_area" refurl="index.php?core-api-index-getarea&parent={value}"
						                    parent="#service_province" name="args[service_city]" id="service_city" current="" needle="needle"
						                    msg="您必须选择市">
						            </select>
						
						        </div>
						        <div class="col-sm-2" style="width: 24%;">
						            <select class="autoloaditem form-control require merDistrict" autoload="index.php?core-api-index-getarea"
						                    parent="#service_city"
						                    name="args[service_area]" id="service_area" current="" needle="needle" msg="您必须选择区">
						            </select>						
						        </div>
						 </div>
            		</div>
            		<!---->
            		<p style="margin-top: 50px;"><span>&nbsp;</span><input style="width: 500px;" placeholder="详细地址" class="form-control" type="text" name="merAddress" id="" value="{x2;$meruser['merAddress']}" /></p>
            		<p><span><span class="red">* </span>商户联系人</span><input class="col_s form-control" needle="needle" placeholder="请填写商户联系人" class="form-control" type="text" name="merContactName" id="" value="{x2;$meruser['merContactName']}" /></p>
            		<p><span><span class="red">* </span>手机号</span><input class="col_s form-control" needle="needle" placeholder="请填写手机号码" class="form-control" type="text" name="merContactPhone" id="" value="{x2;$meruser['merContactPhone']}" /></p>
            		<p><span><span class="red">* </span>邮箱</span><input class="col_s form-control" needle="needle" placeholder="请填写邮箱地址" class="form-control" type="text" name="merContactEmail" id="" value="{x2;$meruser['merContactEmail']}" /></p>
            		<p><span><span class="red">* </span>税务登记证编号</span><input class="col_s form-control" needle="needle" placeholder="请填写税务登记证编号" class="form-control" type="text" name="taxRegistCert" id="" value="{x2;$meruser['taxRegistCert']}" /></p>
            		<p><span><span class="red">* </span>开户许可证编号</span><input class="col_s form-control" needle="needle" placeholder="请填写开户许可证编号" class="form-control" type="text" name="accountLicense" id="" value="{x2;$meruser['accountLicense']}" /></p>
                    <p><span><span class="red">* </span> 组织结构代码证</span><input class="col_s form-control" needle="needle" placeholder="组织结构代码证" class="form-control" type="text" name="orgCode" id="" value="{x2;$meruser['orgCode']}" /></p>
            		<p><span><span class="red">* </span>是否长期有效</span>
            			<select class="form-control" needle="needle" style="width: 300px;" id="isTrue">
            				<option value="0">是否长期有效</option>
            				<option value="1">是</option>
            				<option value="2">否</option>
            			</select>
            		</p>
            		<p><span><span class="red">* </span>组织机构代码证有效期</span><input class="col_s form-control valid" needle="needle" placeholder="请选择组织机构代码证有效期" class="form-control" type="text" name="isOrgCodeLong" id="entering-time" {x2;if:$meruser['isOrgCodeLong'] == 'false' } value="{x2;$meruser['orgCodeExpiry']}" {x2;elseif:$meruser['isOrgCodeLong'] == 'true'} value= "长期有效" {x2;else} value= ""  {x2;endif} /></p>
            		<p><span><span class="red">* </span>银行账户</span><input  class="col_s form-control" needle="needle" placeholder="请填写银行账户" class="form-control" type="text" name="cardNo" id="" value="{x2;$meruser['cardNo']}" /></p>
            		<p>
            			<span><span class="red">* </span>开户行总行</span>
            			<select class="form-control headBankCode" needle="needle" style="width: 300px;">
            				<option value="0">请选择开户行总行</option>
                            {x2;tree:$headBankCode,headBankCode,pid}
                            <option value='{x2;v:headBankCode['bankCode']}' {x2;if:v:headBankCode['isSet'] == 1} selected = "selected" {x2;endif}
                            >{x2;v:headBankCode['title']}</option>
                            {x2;endtree}
            			</select>
            		</p>
            		<!---->
            		<div class="opui">
            			<span><span class="red">* </span>开户省市</span>
            			    <div class="col-md-10" style="width: 70%;padding-left: 0;">
						        <div class="col-sm-2" style="width: 22%;padding-left: 0;">
                                    <select class="autoloaditem combox form-control bankProvince" needle="needle" id="company_province" current="" autocomplete="off">
                                        <option value="0">请选择省</option>
                                        {x2;tree:$bankProvince,provinces,pid}
                                        <option value='{x2;v:provinces['provinceid']}' {x2;if:v:provinces['isSet'] == 1} selected = "selected" {x2;endif}
                                        >{x2;v:provinces['province']}</option>
                                        {x2;endtree}
                                    </select>
						
						        </div>
						
						        <div class="col-sm-2" style="width: 24%;">
						            <select class="autoloaditem combox form-control require bankCity" needle="needle" name="" id="service_city">
						            	<option value="0">请选择城市</option>
						            </select>					
						        </div>
						 </div>
            		</div>
            		<!---->
            		<p style="margin-top: 50px;">
                        <span><span class="red">*</span> 开户行支行</span>
            			<select class="form-control bankCode" needle="needle" style="width: 300px;">
            				<option value="0">请选择开户行支行</option>
            			</select>
            		</p>
            		<!--资质影印件-->
            		<div class="opui">
                        <span><span class="red">*</span> 资质影印件</span>
            			<ul class="unls">
            				<li class="libs_one">         
                                <div class="col-sm-9 lisn" style="padding-left: 0;">
                                    <script type="text/template" id="pe-template-goodsthumb">
                                        <div class="qq-uploader-selector" style="width:30%"
                                             qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;width: 120px;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals"
                                                    style="clear:both;max-width: 220px;max-height: 220px;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img style="width: 500px;height: 81px;" class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail" style="border: none;">
                                                            <img style="width: 500px;height: 81px;" class="qq-thumbnail-selector select-imgs-button"
                                                                 src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                 alt="点击上传新图片">
                                                            <input id="" type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0"
                                                                   value=" {x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"
                                         attr-ftype="jpg,jpeg,png">
                                    </div>
                                    <p class="text_ps" style="width: 123px;text-align: center;">法人身份证正面</p>
                                </div>
            					
            				</li>
            				<li class="libs libs_two">         
                                <div class="col-sm-9 lisns">
                                    <script type="text/template" id="pe-template-goodsthumb">
                                        <div class="qq-uploader-selector" style="width:30%"
                                             qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals"
                                                    style="clear:both;max-width: 220px;max-height: 220px;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail" style="border: none;">
                                                            <img class="qq-thumbnail-selector select-imgs-button"
                                                                 src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                 alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0"
                                                                   value=" {x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"
                                         attr-ftype="jpg,jpeg,png">
                                    </div>
                                    <p class="text_ps" style="width: 123px;text-align: center;">法人身份证反面</p>
                                </div>
            				</li>
            				<li class="libs libs_three">         
                                <div class="col-sm-9 lisns">
                                    <script type="text/template" id="pe-template-goodsthumb">
                                        <div class="qq-uploader-selector" style="width:30%"
                                             qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals"
                                                    style="clear:both;max-width: 220px;max-height: 220px;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail" style="border: none;">
                                                            <img class="qq-thumbnail-selector select-imgs-button"
                                                                 src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                 alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0"
                                                                   value=" {x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"
                                         attr-ftype="jpg,jpeg,png">
                                    </div>
                                    <p class="text_ps" style="width: 123px;text-align: center;">营业执照</p>
                                </div>
            				</li>
            				<li class="libs_fore">
            					 <div class="col-sm-9 lisns">
                                    <script type="text/template" id="pe-template-goodsthumb">
                                        <div class="qq-uploader-selector" style="width:30%"
                                             qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals"
                                                    style="clear:both;max-width: 220px;max-height: 220px;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail" style="border: none;">
                                                            <img class="qq-thumbnail-selector select-imgs-button"
                                                                 src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                 alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0"
                                                                   value=" {x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"
                                         attr-ftype="jpg,jpeg,png">
                                    </div>
                                    <p class="text_ps" style="width: 123px;text-align: center;">税务登记证</p>
                                </div>
            				</li>
            				<li class="libs_five">
            					<div class="col-sm-9 lisns">
                                    <script type="text/template" id="pe-template-goodsthumb">
                                        <div class="qq-uploader-selector" style="width:30%"
                                             qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals"
                                                    style="clear:both;max-width: 220px;max-height: 220px;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail" style="border: none;">
                                                            <img class="qq-thumbnail-selector select-imgs-button"
                                                                 src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                 alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0"
                                                                   value=" {x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"
                                         attr-ftype="jpg,jpeg,png">
                                    </div>
                                    <p class="text_ps" style="width: 123px;text-align: center;">组织机构代码证</p>
                                </div>
            				</li>
            				<li class="libs_six">
            					<div class="col-sm-9 lisns">
                                    <script type="text/template" id="pe-template-goodsthumb">
                                        <div class="qq-uploader-selector" style="width:30%"
                                             qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals"
                                                    style="clear:both;max-width: 220px;max-height: 220px;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail" style="border: none;">
                                                            <img class="qq-thumbnail-selector select-imgs-button"
                                                                 src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                 alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0"
                                                                   value=" {x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"
                                         attr-ftype="jpg,jpeg,png">
                                    </div>
                                    <p class="text_ps" style="width: 126px;text-align: center;">统一社会信用代码证</p>
                                </div>
            				</li>
            				<li class="libs_seven">
            					<div class="col-sm-9 lisns">
                                    <script type="text/template" id="pe-template-goodsthumb">
                                        <div class="qq-uploader-selector" style="width:30%"
                                             qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals"
                                                    style="clear:both;max-width: 220px;max-height: 220px;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail" style="border: none;">
                                                            <img class="qq-thumbnail-selector select-imgs-button"
                                                                 src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                 alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0"
                                                                   value=" {x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"
                                         attr-ftype="jpg,jpeg,png">
                                    </div>
                                    <p class="text_ps" style="width: 123px;text-align: center;">银行开户许可证</p>
                                </div>
            				</li>
            				<li class="libs_eight">
            					<div class="col-sm-9 lisns">
                                    <script type="text/template" id="pe-template-goodsthumb">
                                        <div class="qq-uploader-selector" style="width:30%"
                                             qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals"
                                                    style="clear:both;max-width: 220px;max-height: 220px;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail" style="border: none;">
                                                            <img class="qq-thumbnail-selector select-imgs-button"
                                                                 src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                 alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0"
                                                                   value=" {x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"
                                         attr-ftype="jpg,jpeg,png">
                                    </div>
                                    <p class="text_ps" style="width: 123px;text-align: center;">结算银行卡</p>
                                </div>
            				</li>
            				<li class="libs_nine">
            					<div class="col-sm-9 lisns">
                                    <script type="text/template" id="pe-template-goodsthumb">
                                        <div class="qq-uploader-selector" style="width:30%"
                                             qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals"
                                                    style="clear:both;max-width: 220px;max-height: 220px;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail" style="border: none;">
                                                            <img class="qq-thumbnail-selector select-imgs-button"
                                                                 src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                 alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0"
                                                                   value=" {x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"
                                         attr-ftype="jpg,jpeg,png">
                                    </div>
                                    <p class="text_ps" style="width: 123px;text-align: center;">手持身份证</p>
                                </div>
            				</li>
            				<li class="libs_ten">
            					<div class="col-sm-9 lisns">
                                    <script type="text/template" id="pe-template-goodsthumb">
                                        <div class="qq-uploader-selector" style="width:30%"
                                             qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals"
                                                    style="clear:both;max-width: 220px;max-height: 220px;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail" style="border: none;">
                                                            <img class="qq-thumbnail-selector select-imgs-button"
                                                                 src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                 alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0"
                                                                   value=" {x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"
                                         attr-ftype="jpg,jpeg,png">
                                    </div>
                                    <p class="text_ps" style="width: 123px;text-align: center;">手持银行卡</p>
                                </div>
            				</li>
            			</ul>
            		</div>
            		<!---->
                    <p><span><span class="red">*</span> 平台协议</span><a href="#" style="color: #f08f35;">《平台注册协议》</a></p>
            		<p><span>&nbsp;</span>
            			<label style="font-weight: normal;color: #323232;">
            				<input id="checks" style="float: left;margin-top: 9px;" type="checkbox" />我已阅读并接受以上协议
            			</label>
            		</p>
            		<p><span>&nbsp;</span><span id="feedBack" class="applys btn-primary">申请开通</span><span class="applys" style="border:1px solid #ccc;">取消</span></p>
            	</div>
            </div>
        </div>
    </div>
</div>
    {x2;include:footer2}

    <script type="text/javascript">
        $(function () {
        	//时间控件
        	  $('#entering-time').datetimepicker({
			        format: 'yyyy-mm-dd',
			        minView: 2,
			        autoclose: true,
			        todayBtn: true,
			        language: "zh-CN"
    			});
            $('.submenu:eq(5)').delay(400).slideDown(700);
            $('.submenu:eq(5) li:eq(1)').addClass("active");
            //点击商户一级分类
            $("#tenant").change(function(){
            	var option_val= $('#tenant option:selected').val();
            	$.ajax({
                		type: "GET",
                		url: "index.php?user-company-privatement-getMerchantCode&parentCode="+option_val,
                		success: function (data) {
                    		$("#tentant_two").html(data)
                		}
            		})
            })
            //点击省
            $(".bankProvince").change(function(){
            	var option_val= $('.bankProvince option:selected').val();
            	$.ajax({
                		type: "GET",
                		url: "index.php?core-api-index-getcity&parent="+option_val,
                		success: function (data) {
                    		$(".bankCity").html(data)
                		}
            		})
            })
            //点击是否长期有效
            $("#isTrue").change(function(){
            	if($("#isTrue option:selected").val()==1){
            		$(".valid").val("长期有效")
					$(".valid").attr("disabled","disabled")
            	}else if($("#isTrue option:selected").val()==2){
            		$(".valid").val("")
           			$($(".valid").attr("disabled",false))
            	}
            })
            //获取开户行支行
            $(".bankCity").click(function(){
            	if($(".headBankCode option:selected").val()==0){
            		var data = {
	                        result: false,
	                        message: "请选择开户行总行"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
            	}
            	if($(".bankProvince option:selected").val()==0){
            		var data = {
	                        result: false,
	                        message: "请选择开户省"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
            	}
//          	if($(".bankCity option:selected").val()==0){
//          		alert("请选择开户市");
//          		return false;
//          	}
            	var headBankCode = $('.headBankCode option:selected').val();
            	var bankProvince = $('.bankProvince option:selected').val();
            	var bankCity = $('.bankCity option:selected').val();
            	$.ajax({
                		type: "GET",
                		url: "index.php?user-company-privatement-bandBranchInfo&headBankCode="+headBankCode+"&bankProvince="+bankProvince+"&bankCity="+bankCity,
                		success: function (data) {
                			console.log(data)
                    		$(".bankCode").html(data)
                		}
            		})
            })
            //点击图片上传
            $(".libs_one").click(function(){
            	if($(this).find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
            	}else {
            		var file_url = $(this).find("input.qq-edit-filename-selector").val();
            		$.ajax({
                		type: "POST",
                		url: "index.php?user-company-privatement-uploadFile",
                		dataType:"json",
                		data:{
                			fileURI:file_url
                		},
                		success: function (data) {
                			console.log(data.files[0].fileLocation)		
                		}
            		})
            	}
            })
            $(".libs_two").click(function(){
            	if($(this).find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
            	}else {
            		var file_url = $(this).find("input.qq-edit-filename-selector").val();
            		$.ajax({
                		type: "POST",
                		url: "index.php?user-company-privatement-uploadFile",
                		dataType:"json",
                		data:{
                			fileURI:file_url
                		},
                		success: function (data) {
                			console.log(data.files[1].fileLocation)		
                		}
            		})
            	}
            })
            $(".libs_three").click(function(){
            	if($(this).find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
            	}else {
            		var file_url = $(this).find("input.qq-edit-filename-selector").val();
            		$.ajax({
                		type: "POST",
                		url: "index.php?user-company-privatement-uploadFile",
                		dataType:"json",
                		data:{
                			fileURI:file_url
                		},
                		success: function (data) {
                			console.log(data.files[2].fileLocation)		
                		}
            		})
            	}
            })
            $(".libs_fore").click(function(){
            	if($(this).find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
            	}else {
            		var file_url = $(this).find("input.qq-edit-filename-selector").val();
            		$.ajax({
                		type: "POST",
                		url: "index.php?user-company-privatement-uploadFile",
                		dataType:"json",
                		data:{
                			fileURI:file_url
                		},
                		success: function (data) {
                			console.log(data.files[3].fileLocation)		
                		}
            		})
            	}
            })
            $(".libs_five").click(function(){
            	if($(this).find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
            	}else {
            		var file_url = $(this).find("input.qq-edit-filename-selector").val();
            		$.ajax({
                		type: "POST",
                		url: "index.php?user-company-privatement-uploadFile",
                		dataType:"json",
                		data:{
                			fileURI:file_url
                		},
                		success: function (data) {
                			console.log(data.files[4].fileLocation)		
                		}
            		})
            	}
            })
            $(".libs_six").click(function(){
            	if($(this).find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
            	}else {
            		var file_url = $(this).find("input.qq-edit-filename-selector").val();
            		$.ajax({
                		type: "POST",
                		url: "index.php?user-company-privatement-uploadFile",
                		dataType:"json",
                		data:{
                			fileURI:file_url
                		},
                		success: function (data) {
                			console.log(data.files[5].fileLocation)		
                		}
            		})
            	}
            })
            $(".libs_seven").click(function(){
            	if($(this).find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
            	}else {
            		var file_url = $(this).find("input.qq-edit-filename-selector").val();
            		$.ajax({
                		type: "POST",
                		url: "index.php?user-company-privatement-uploadFile",
                		dataType:"json",
                		data:{
                			fileURI:file_url
                		},
                		success: function (data) {
                			console.log(data.files[6].fileLocation)		
                		}
            		})
            	}
            })
            $(".libs_eight").click(function(){
            	if($(this).find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
            	}else {
            		var file_url = $(this).find("input.qq-edit-filename-selector").val();
            		$.ajax({
                		type: "POST",
                		url: "index.php?user-company-privatement-uploadFile",
                		dataType:"json",
                		data:{
                			fileURI:file_url
                		},
                		success: function (data) {
                			console.log(data.files[7].fileLocation)		
                		}
            		})
            	}
            })
            $(".libs_nine").click(function(){
            	if($(this).find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
            	}else {
            		var file_url = $(this).find("input.qq-edit-filename-selector").val();
            		$.ajax({
                		type: "POST",
                		url: "index.php?user-company-privatement-uploadFile",
                		dataType:"json",
                		data:{
                			fileURI:file_url
                		},
                		success: function (data) {
                			console.log(data.files[8].fileLocation)		
                		}
            		})
            	}
            })
            $(".libs_ten").click(function(){
            	if($(this).find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
            	}else {
            		var file_url = $(this).find("input.qq-edit-filename-selector").val();
            		$.ajax({
                		type: "POST",
                		url: "index.php?user-company-privatement-uploadFile",
                		dataType:"json",
                		data:{
                			fileURI:file_url
                		},
                		success: function (data) {
                			console.log(data.files[9].fileLocation);		
                		}
            		})
            	}
            })
            //点击申请开通
            $("#feedBack").on("click",function(){
            	if($("#checks").prop("checked")){
//          		alert(1)
            	}else{
            		var data = {
	                        result: false,
	                        message: "请勾选协议"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
            	}
            	//判断是否长期有效
				var param = {};
        		param['merFullName'] = $("input[name='merFullName']").val();
        		param['merShortName'] = $("input[name='merShortName']").val();
        		param['merCertNo'] = $("input[name='merCertNo']").val();
        		param['legalName'] = $("input[name='legalName']").val();
        		param['legalIdCard'] = $("input[name='legalIdCard']").val();
        		param['merLevel1No'] = $("#tenant option:selected").val();
        		param['merLevel2No'] = $("#tentant_two option:selected").val();
        		param['merProvince'] = $(".merProvince option:selected").val();
        		param['merCity'] = $(".merCity option:selected").val();
        		param['merDistrict'] = $(".merDistrict option:selected").val();
        		param['merAddress'] = $("input[name='merAddress']").val();
        		param['merContactName'] = $("input[name='merContactName']").val();
        		param['merContactPhone'] = $("input[name='merContactPhone']").val();
        		param['merContactEmail'] = $("input[name='merContactEmail']").val();
        		param['taxRegistCert'] = $("input[name='taxRegistCert']").val();
        		param['accountLicense'] = $("input[name='accountLicense']").val();
        		//组织结构代码证
        		param['orgCode'] = $("input[name='orgCode']").val();
				param['cardNo'] = $("input[name='cardNo']").val();
				param['accountLicense'] = $("input[name='accountLicense']").val();
				param['headBankCode'] = $(".headBankCode option:selected").val();
				param['bankCode'] = $(".bankCode option:selected").val();
				param['bankProvince'] = $(".bankProvince option:selected").val();
				param['bankCity'] = $(".bankCity option:selected").val();
				//资质图片
				param['IDCARD_FRONT'] = $(".libs_one input.qq-edit-filename-selector").val();
				param['IDCARD_BACK'] = $(".libs_two input.qq-edit-filename-selector").val();
				param['CORP_CODE'] = $(".libs_three input.qq-edit-filename-selector").val();
				param['TAX_CODE'] = $(".libs_fore input.qq-edit-filename-selector").val();
				param['ORG_CODE'] = $(".libs_five input.qq-edit-filename-selector").val();
				param['UNI_CREDIT_CODE'] = $(".libs_six input.qq-edit-filename-selector").val();
				param['OP_BANK_CODE'] = $(".libs_seven input.qq-edit-filename-selector").val();
				param['SETTLE_BANKCARD'] = $(".libs_eight input.qq-edit-filename-selector").val();
				param['HAND_IDCARD'] = $(".libs_nine input.qq-edit-filename-selector").val();
				param['HAND_BANKCARD'] = $(".libs_ten input.qq-edit-filename-selector").val();
				
            	//判断框内是否有值
            	  if(param['merFullName'] == ''){      			 							
//         	 			alert('请输入企业全称');return false;
           	 			var data = {
	                        result: false,
	                        message: "请输入企业全称"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;	
        			}
            	  if(param['merShortName'] == ''){      			 							
           	 			var data = {
	                        result: false,
	                        message: "请填写商品牌名称"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  if(param['merCertNo'] == ''){      			 							
           	 			var data = {
	                        result: false,
	                        message: "请填写证件号"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	   if(param['legalName'] == ''){      			 							
           	 			var data = {
	                        result: false,
	                        message: "请填写法人姓名"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	    if(param['legalIdCard'] == ''){      			 							
           	 			var data = {
	                        result: false,
	                        message: "请填写法人身份证号"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	     if($("#tenant option:selected").val()==0){      			 							
						 var data = {
	                        result: false,
	                        message: "请选择一级分类"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;          	 			
        			}
            	     if($("#tentant_two option:selected").val()==0){      			 							
           	 			var data = {
	                        result: false,
	                        message: "请选择二级分类"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  	  if($(".merProvince option:selected").val()==0){      			 							
           	 			var data = {
	                        result: false,
	                        message: "请选择省"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  	if($(".merCity option:selected").val()==0){      			 							
           	 		
           	 			var data = {
	                        result: false,
	                        message: "请选择市"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  	if($(".merDistrict option:selected").val()==0){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请选择县区"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  	if(param['merAddress'] == ''){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请填写详细地址"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  	if(param['merContactName'] == ''){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请填写商户联系人"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  	if(param['merContactPhone'] == ''){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请填写手机号码"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  	if(param['merContactEmail'] == ''){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请填写邮箱地址"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  	if(param['taxRegistCert'] == ''){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请填写税务登记证编号"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  	if(param['accountLicense'] == ''){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请填写开户许可证证编号"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  	if(param['orgCode'] == ''){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "组织结构代码证"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            	  	if($("#isTrue option:selected").val()==1){
						param['isOrgCodeLong'] = $("#isTrue option:selected").val();
						param['orgCodeExpiry'] = $("#entering-time").val();
											
            		}else if($("#isTrue option:selected").val()==2){
		            	param['isOrgCodeLong'] = $("#isTrue option:selected").val(); 
		            	param['orgCodeExpiry'] = $("#entering-time").val();
		            	if($("#entering-time").val()==""){
		            	
		            	var data = {
	                        result: false,
	                        message: "请选择组织机构代码证有效期"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
		            	}
            		}else{
            			
            			var data = {
	                        result: false,
	                        message: "请选择是否长期有效"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
            		}
            		if(param['cardNo'] == ''){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请填写银行账户"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            		 if($(".headBankCode option:selected").val()==0){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请选择开户总行"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            		if($(".bankProvince option:selected").val()==0){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请选择省"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            		if($(".bankCity option:selected").val()==0){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请选择城市"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
            		if($(".bankCode option:selected").val()==0){      			 							
           	 			
           	 			var data = {
	                        result: false,
	                        message: "请选择开户行支行"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
        			}
					if($(".libs_one").find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
						
						
						var data = {
	                        result: false,
	                        message: "请上传法人身份证正面"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
					}else{
						param['IDCARD_FRONT'] = $(".libs_one").find("input.qq-edit-filename-selector").val();
					}
					if($(".libs_two").find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
						
						
						var data = {
	                        result: false,
	                        message: "请上传法人身份证反面"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
					}else{
						param['IDCARD_FRONT'] = $(".libs_two").find("input.qq-edit-filename-selector").val();
					}
					if($(".libs_three").find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
						
						var data = {
	                        result: false,
	                        message: "请上传营业执照"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
					}else{
						param['IDCARD_FRONT'] = $(".libs_three").find("input.qq-edit-filename-selector").val();
					}
					if($(".libs_fore").find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
						
						var data = {
	                        result: false,
	                        message: "请上传税务登记证"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
					}else{
						param['IDCARD_FRONT'] = $(".libs_fore").find("input.qq-edit-filename-selector").val();
					}
					if($(".libs_five").find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
						
						var data = {
	                        result: false,
	                        message: "请上传组织机构代码证"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
					}else{
						param['IDCARD_FRONT'] = $(".libs_five").find("input.qq-edit-filename-selector").val();
					}
					if($(".libs_six").find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
						
						var data = {
	                        result: false,
	                        message: "请上传统一社会信用代码证"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
					}else{
						param['IDCARD_FRONT'] = $(".libs_six").find("input.qq-edit-filename-selector").val();
					}
					if($(".libs_seven").find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
						
						var data = {
	                        result: false,
	                        message: "请上传银行开户许可证"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
					}else{
						param['IDCARD_FRONT'] = $(".libs_seven").find("input.qq-edit-filename-selector").val();
					}
					if($(".libs_eight").find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
						
						var data = {
	                        result: false,
	                        message: "请输入结算银行卡"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
					}else{
						param['IDCARD_FRONT'] = $(".libs_eight").find("input.qq-edit-filename-selector").val();
					}
					if($(".libs_nine").find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
						
						var data = {
	                        result: false,
	                        message: "请输入手持身份证"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
					}else{
						param['IDCARD_FRONT'] = $(".libs_nine").find("input.qq-edit-filename-selector").val();
					}
					if($(".libs_ten").find("input.qq-edit-filename-selector").val()==" app/core/styles/images/noimage.gif"){
						
						var data = {
	                        result: false,
	                        message: "手持银行卡"
                    		};
                    	$.zoombox.show('ajax', data);
						return false;
					}else{
						param['IDCARD_FRONT'] = $(".libs_ten").find("input.qq-edit-filename-selector").val();
					}
//					console.log(param);return false;
					//上传数据
				$.ajax({
		            type:'post',
		            url: 'index.php?user-company-privatement-register',
		            data: param,
		            dataType:'JSON',
		            async:true,
		            success:function(data){
		                if(data.result == 1){
		                    alert('上传成功');
		                    window.location.reload();
		                    console.log(data);
		                    
		                }else{
		                    alert(data.message);
		                }
		            },
		            error: function(e){
		                console.log(e);
		            }
		        })
			})
        });

    </script>


</body>

</html>
