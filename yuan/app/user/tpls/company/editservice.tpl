<div class="form-group">
								<label for="purchasetype" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>需求类型：</label>
								<div class="col-sm-9">
	                                <input type="radio" name="args[purchasetype]" id="purchasetype2" value="施工" {x2;if:$purchase['purchasetype']=='施工'}
										checked='true';
	                                {x2;endif}/> 施工</label>
	                                &nbsp;&nbsp;<label class="radio-line"><input type="radio" name="args[purchasetype]" id="purchasetype3" value="服务" {x2;if:$purchase['purchasetype']=='服务'}
										checked='true';
	                                {x2;endif}/> 服务</label>&nbsp;&nbsp;				
	                                </div>
							</div>
							<div class="form-group">
					            <label for="purchasetitle" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>需求标题：</label>
					            <div class="col-sm-4">
								    <input class="form-control require" type="text" id="purchasetitle" name="args[purchasetitle]" needle="needle" msg="您必须输入标题" placeholder="请简短描述需求情况,限输30汉字" value="{x2;$purchase['purchasetitle']}">
						        </div>
					        </div>

					        <!-- <div class="form-group">
					        								<label for="service_isadmoney" class="control-label col-sm-2">是否需垫资：</label>
					        								<div class="col-sm-9">
					        	                                <label class="radio-line"><input type="radio" name="args[service_isadmoney]" id="service_isadmoney0" value="1" 
					        	                                {x2;if:$purchase['service_isadmoney']=='1'}
					        										checked='true';
					        	                                {x2;endif}/> 是</label>&nbsp;&nbsp;<label class="radio-line"><input type="radio" name="args[service_isadmoney]" id="service_isadmoney1" value="0" 
					        	                                {x2;if:$purchase['service_isadmoney']=='0'}
					        										checked='true';
					        	                                {x2;endif}/> 否</label>&nbsp;&nbsp;							</div>
					        							</div> -->
							<div class="form-group">
								<label for="service_money" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>预计工程费用：</label>
								<div class="col-sm-3">
	                                <input type="text" class="form-control require" name="args[service_money]" id="service_money" needle="needle" msg="您必须输入预计工程款" value="{x2;$purchase['service_money']}" onkeyup="value=value.replace(/[^\d]/g,'')"/>

	                                </div><span>万元</span>
							</div>
							<div class="form-group">
								<label for="service_cycle" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>预计项目周期：</label>
								<div class="col-sm-3">
	                                <input type="text" class="form-control require" name="args[service_cycle]" id="service_cycle" needle="needle" msg="您必须输入预计项目周期" value="{x2;$purchase['service_cycle']}" onkeyup="value=value.replace(/[^\d]/g,'')"/>

	                            </div><span>月</span>
							</div>

							<div class="form-group">
								<label for="purchase_province" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>项目所在地：</label>
								
								<div class="col-sm-2">
	                                <select class="autoloaditem combox form-control require" autoload="index.php?core-api-index-getProvince" target="service_city" refurl="index.php?core-api-index-getcity&amp;parent={value}" name="args[service_province]" id="service_province"  current="{x2;$purchase['service_province']}" needle="needle" msg="您必须选择省"></select>

	                            </div>

	                            <div class="col-sm-2">
	                                <select class="autoloaditem combox form-control require" autoload="index.php?core-api-index-getcity" target="service_area" refurl="index.php?core-api-index-getarea&amp;parent={value}" parent="#service_province" name="args[service_city]" id="service_city"  current="{x2;$purchase['service_city']}" needle="needle" msg="您必须选择市">
	                                </select>							

	                            </div>
	                            <div class="col-sm-2">
	                                <select class="autoloaditem form-control require" autoload="index.php?core-api-index-getarea" parent="#service_city" name="args[service_area]" id="service_area"  current="{x2;$purchase['service_area']}" needle="needle" msg="您必须选择区"></select>

	                            </div>
                            
							

							</div>

							<div class="form-group">
								<label for="service_starttime" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>预计开工时间：</label>
								<div class="col-sm-3">
	                                <input type="text" class="form-control datetimepicker require" name="args[service_starttime]" id="service_starttime" value="2018-05-12 23:04:29"  needle="needle" msg="您必须选择预计开工时间" value="{x2;date:$purchase['service_starttime'],'Y-m-d H:i:s'}"/>
	                            </div>
							</div>
							<div class="form-group">
								<label for="service_endtime" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>项目截至时间：</label>
								<div class="col-sm-3">
	                                <input type="text" class="form-control datetimepicker require" name="args[service_endtime]" id="service_endtime" value="2018-05-12 23:04:29" needle="needle" msg="您必须输入项目截至时间" value="{x2;date:$purchase['service_endtime'],'Y-m-d H:i:s'}"/>

	                                </div>
							</div>

							<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">项目概况</h4>
							<div class="form-group">
					            <label for="purchasetext" class="control-label col-sm-2">内容：</label>
					            <div class="col-sm-10">
								    <textarea id="purchasetext" rows="7" cols="4" class="ckeditor" name="args[purchasetext]">{x2;$purchase['purchasetext']}</textarea>
						        </div>
					        </div>



							<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">合作要求</h4>
						<div class="form-group">
							<label for="purchasecapital" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>注册资本：</label>
							<div class="col-sm-3">
                                <input type="text" class="form-control require" name="args[purchasecapital]" id="purchasecapital" size="40px" needle="needle" msg="您必须输入注册资本" value="{x2;$purchase['purchasecapital']}" onkeyup="value=value.replace(/[^\d]/g,'')"/>


                            </div><span>万元</span>
						</div>

						<div class="form-group">
							<label for="purchasefinancial" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>财务状况：</label>
							<div class="col-sm-3">
                                <select class="form-control require" name="args[purchasefinancial]" id="purchasefinancial"  current="" needle="needle" msg="您必须选择财务状况">
	                          
									<option value='优秀'
	                                {x2;if:$purchase['purchasefinancial']=='优秀'}
										selected="true" ;
	                                {x2;endif}>优秀</option>

	                                <option value='良好'
	                                {x2;if:$purchase['purchasefinancial']=='良好'}
										selected="true" ;
	                                {x2;endif}>良好</option>

								</select>							

							</div>
						</div>

						<div class="form-group">
							<label for="purchasecompsize" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>公司规模：</label>
							<div class="col-sm-3">
                                <select class="form-control require" name="args[purchasecompsize]" id="purchasecompsize"  current="" needle="needle" msg="您必须选择公司规模">
								

								<option value='100人以上'
	                                {x2;if:$purchase['purchasecompsize']=='100人以上'}
										selected="true" ;
	                                {x2;endif}>100人以上</option>


                                <option value='50-100人'
                                {x2;if:$purchase['purchasecompsize']=='50-100人'}
									selected="true" ;
                                {x2;endif}>50-100人</option>

                                <option value='50人以下'
	                                {x2;if:$purchase['purchasecompsize']=='50人以下'}
										selected="true" ;
	                                {x2;endif}>50人以下</option>
								</select>							

								</div>
						</div>

						<div class="form-group">
							<label for="purchasecompsize" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>公司性质：</label>
							<div class="col-sm-3">
                                <select class="form-control require" name="args[service_company_nature]" id="service_company_nature"  current="" needle="needle" msg="您必须选择公司性质">
                                <option value='国企'
                                {x2;if:$purchase['service_company_nature']=='国企'}
									selected="true" ;
                                {x2;endif}>国企</option>

                                <option value='私企'
	                                {x2;if:$purchase['service_company_nature']=='私企'}
										selected="true" ;
	                                {x2;endif}>私企</option>
								</select>							

								</div>
						</div>

						<div class="form-group">
							<label for="purchaseother" class="control-label col-sm-2"><span
                            class="hln-cue">*</span>其他要求：</label>
							<div class="col-sm-3">
                                <input type="text" class="form-control require" name="args[purchaseother]" id="purchaseother" needle="needle" msg="您必须输入其他要求" value="{x2;$purchase['purchaseother']}"/>
                                </div>
						</div>



						<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">补充说明</h4>
						<div class="form-group">
							<label for="purchasesupport" class="control-label col-sm-2">补充说明：</label>
							<div class="col-sm-9">
                                <textarea class="form-control" name="args[purchasesupport]" id="purchasesupport2" rows="7" cols="4">{x2;$purchase['purchasesupport']}</textarea>							

                            </div>
						</div>
