                            <h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">服务需求基本概况</h4>
							<div class="form-group">
								<label for="purchasetype" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>需求类型：</label>
								<div class="col-sm-9" style="font-weight:bold;margin-top: 9px;">
	                                <input type="radio" name="args[purchasetype]" id="purchasetype2" value="施工" /> 施工</label>&nbsp;&nbsp;<label class="radio-line"><input type="radio" name="args[purchasetype]" id="purchasetype3" value="服务" /> 服务</label>&nbsp;&nbsp;				
	                                </div>
							</div>
							<div class="form-group">
					            <label for="purchasetitle" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>需求标题：</label>
					            <div class="col-sm-4" >
								    <input class="form-control require" type="text" id="purchasetitle" name="args[purchasetitle]" needle="needle" msg="您必须输入标题" placeholder="请简短描述需求情况,限输30汉字"  maxlength="30">
						        </div>
					        </div>

					        <!-- <div class="form-group" >
					        								<label for="service_isadmoney" class="control-label col-sm-2">是否需垫资：</label>
					        								<div class="col-sm-9" style="font-weight:bold">
					        	                                <label class="radio-line"><input type="radio" name="args[service_isadmoney]" id="service_isadmoney0" value="1" /> 是</label>&nbsp;&nbsp;<label class="radio-line"><input type="radio" name="args[service_isadmoney]" id="service_isadmoney1" value="0" /> 否</label>&nbsp;&nbsp;							</div>
					        							</div> -->
							<div class="form-group">
								<label for="service_money" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>预计工程费用：</label>
								<div class="col-sm-3">
	                                <input type="text" class="form-control require" name="args[service_money]" id="service_money" needle="needle" msg="您必须输入预计工程款" onkeyup="value=value.replace(/[^\d]/g,'')"/ maxlength="5">

	                                </div><span>万元</span>
							</div>
							<div class="form-group">
								<label for="service_cycle" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>预计项目周期：</label>
								<div class="col-sm-3">
	                                <input type="text" class="form-control require" name="args[service_cycle]" id="service_cycle" needle="needle" msg="您必须输入预计项目周期" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="2"/>

	                            </div><span>月</span>
							</div>

							<div class="form-group">
								<label for="purchase_province" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>项目所在地：</label>
								
								<div class="col-sm-2">
	                                <select class="autoloaditem combox form-control" autoload="index.php?core-api-index-getProvince" target="service_city" refurl="index.php?core-api-index-getcity&amp;parent={value}" name="args[service_province]" id="service_province"  current=""></select>							

	                            </div>

	                            <div class="col-sm-2">
	                                <select class="autoloaditem combox form-control" autoload="index.php?core-api-index-getcity" target="service_area" refurl="index.php?core-api-index-getarea&amp;parent={value}" parent="#service_province" name="args[service_city]" id="service_city"  current="">
	                                </select>							

	                            </div>
	                            <div class="col-sm-2">
	                                <select class="autoloaditem form-control" autoload="index.php?core-api-index-getarea" parent="#service_city" name="args[service_area]" id="service_area"  current=""></select>							

	                            </div>

							</div>

							<div class="form-group">
								<label for="service_starttime" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>预计开工时间：</label>
								<div class="col-sm-3">
	                                <input type="text" class="form-control datetimepicker require" name="args[service_starttime]" id="service_starttime" needle="needle" msg="您必须选择预计开工时间" value="" />
	                            </div>
							</div>
							<div class="form-group">
								<label for="service_endtime" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>项目截至时间：</label>
								<div class="col-sm-3">
	                                <input type="text" class="form-control datetimepicker require" name="args[service_endtime]" id="service_endtime" needle="needle" msg="您必须输入项目截至时间" value=""/>

	                                </div>
							</div>

							<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">项目概况</h4>
							<div class="form-group">
					            <label for="purchasetext" class="control-label col-sm-2">内容：</label>
					            <div class="col-sm-10">
								    <textarea id="purchasetext" rows="7" cols="4" class="ckeditor" name="args[purchasetext]"></textarea>
						        </div>
					        </div>


					        <h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">合作要求</h4>
							<div class="form-group">
								<label for="purchasecapital" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>注册资本：</label>
								<div class="col-sm-3">
	                                <input type="text" class="form-control require" name="args[purchasecapital]" id="purchasecapital" size="40px" needle="needle" msg="您必须输入注册资本" onkeyup="value=value.replace(/[^\d]/g,'')"/>


	                            </div><span>万元</span>
							</div>

							<div class="form-group">
								<label for="purchasefinancial" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>财务状况：</label>
								<div class="col-sm-3">
	                                <select class="form-control require" name="args[purchasefinancial]" id="purchasefinancial"  current="" needle="needle" msg="您必须选择财务状况">
		                                <option value='优秀'>优秀</option>
										<option value='良好'>良好</option>
									</select>							

								</div>
							</div>

							<div class="form-group">
								<label for="purchasecompsize" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>公司规模：</label>
								<div class="col-sm-3">
	                                <select class="form-control require" name="args[purchasecompsize]" id="purchasecompsize"  current="" needle="needle" msg="您必须选择公司规模">
	                                <option value='100人以上'>100人以上</option>
									<option value='50-100人'>50-100人</option>
									<option value='50人以下'>50人以下</option>
									</select>							

									</div>
							</div>

							<div class="form-group">
								<label for="purchasecompsize" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>公司性质：</label>
								<div class="col-sm-3">
	                                <select class="form-control require" name="args[service_company_nature]" id="service_company_nature"  current="" needle="needle" msg="您必须选择公司性质">
	                                <option value='国企'>国企</option>
									<option value='私企'>私企</option>
									</select>							

									</div>
							</div>


							<div class="form-group">
								<label for="purchaseother" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>其他要求：</label>
								<div class="col-sm-3">
	                                <input type="text" class="form-control require" name="args[purchaseother]" id="purchaseother" needle="needle" msg="您必须输入其他要求"/>
	                                </div>
							</div>
							<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">补充说明</h4>
							<div class="form-group">
								<label for="purchasesupport" class="control-label col-sm-2">补充说明：</label>
								<div class="col-sm-9">
	                                <textarea class="form-control" name="args[purchasesupport]" id="purchasesupport2" rows="7" cols="4">请详细描述其他补充内容</textarea>							

	                            </div>
							</div>
							<script type="text/javascript">
							    var t = document.getElementById('purchasesupport2');
							    t.onfocus = function(){
							        if(this.innerHTML == '请详细描述其他补充内容'){this.value = ''}
							    };
							      
							    t.onblur = function(){
							        if(this.value == ''){
							            this.innerHTML = '请详细描述其他补充内容'   
							        }   
							    };
							</script>