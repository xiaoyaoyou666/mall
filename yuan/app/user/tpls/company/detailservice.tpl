<div class="form-group">
								<label for="purchasetype" class="control-label col-sm-2">需求类型：</label>
								<div class="col-sm-9">
	                               {x2;$purchase['purchasetype']}
													
	                                </div>
							</div>
							<div class="form-group">
					            <label for="purchasetitle" class="control-label col-sm-2">需求标题：</label>
					            <div class="col-sm-4">
								    {x2;$purchase['purchasetitle']}
						        </div>
					        </div>

					        <div class="form-group">
								<label for="service_isadmoney" class="control-label col-sm-2">是否需垫资：</label>
								<div class="col-sm-9">
	                                
	                                {x2;if:$purchase['service_isadmoney']=='1'}
										是
	                                {x2;else}
	                               		否
	                                {x2;endif}				
	                            </div>
							</div>
							<div class="form-group">
								<label for="service_money" class="control-label col-sm-2">预计工程费用：</label>
								<div class="col-sm-3">
	                               {x2;$purchase['service_money']}	<span>万元</span>						

	                                </div>
							</div>
							<div class="form-group">
								<label for="service_cycle" class="control-label col-sm-2">预计项目周期：</label>
								<div class="col-sm-3">
	                               {x2;$purchase['service_cycle']}<span>月</span>							

	                            </div>
							</div>

							<div class="form-group">
								<label for="purchase_province" class="control-label col-sm-2">项目所在地：</label>
								
								<div class="col-sm-2">
	                                <select class="autoloaditem combox form-control" autoload="index.php?core-api-index-getProvince" target="service_city" refurl="index.php?core-api-index-getcity&amp;parent={value}" name="args[service_province]" id="service_province"  current="{x2;$purchase['service_province']}" needle="needle" msg="您必须选择省" disabled="disabled"></select>							

	                            </div>

	                            <div class="col-sm-2">
	                                <select class="autoloaditem combox form-control" autoload="index.php?core-api-index-getcity" target="service_area" refurl="index.php?core-api-index-getarea&amp;parent={value}" parent="#service_province" name="args[service_city]" id="service_city"  current="{x2;$purchase['service_city']}" needle="needle" msg="您必须选择市" disabled="disabled">
	                                </select>							

	                            </div>
	                            <div class="col-sm-2">
	                                <select class="autoloaditem form-control" autoload="index.php?core-api-index-getarea" parent="#service_city" name="args[service_area]" id="service_area"  current="{x2;$purchase['service_area']}" needle="needle" msg="您必须选择区" disabled="disabled"></select>							

	                            </div>
                            
							

							</div>

							<div class="form-group">
								<label for="service_starttime" class="control-label col-sm-2">预计开工时间：</label>
								<div class="col-sm-3">
	                                {x2;date:$purchase['service_starttime'],'Y-m-d H:i:s'}							
	                            </div>
							</div>
							<div class="form-group">
								<label for="service_endtime" class="control-label col-sm-2">项目截至时间：</label>
								<div class="col-sm-3">
	                               {x2;date:$purchase['service_endtime'],'Y-m-d H:i:s'}							

	                                </div>
							</div>

							<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">项目概况</h4>
							<div class="form-group">
					            <label for="purchasetext" class="control-label col-sm-2">内容：</label>
					            <div class="col-sm-10">
								    <textarea id="purchasetext" rows="7" cols="4" class="ckeditor" disabled="disabled" name="args[purchasetext]">{x2;$purchase['purchasetext']}</textarea>
						        </div>
					        </div>



							<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">合作要求</h4>
						<div class="form-group">
							<label for="purchasecapital" class="control-label col-sm-2">注册资本：</label>
							<div class="col-sm-3">
                                {x2;$purchase['purchasecapital']}	<span>万元</span>						


                            </div>
						</div>

						<div class="form-group">
							<label for="purchasefinancial" class="control-label col-sm-2">财务状况：</label>
							<div class="col-sm-3">
                               
	                                {x2;$purchase['purchasefinancial']}
										

							</div>
						</div>

						<div class="form-group">
							<label for="purchasecompsize" class="control-label col-sm-2">公司规模：</label>
							<div class="col-sm-3">
                               
	                                {x2;$purchase['purchasecompsize']}
													

								</div>
						</div>

						<div class="form-group">
							<label for="purchasecompsize" class="control-label col-sm-2">公司性质：</label>
							<div class="col-sm-3">
                               
                                {x2;$purchase['service_company_nature']}
									
								</div>
						</div>

						<div class="form-group">
							<label for="purchaseother" class="control-label col-sm-2">其他要求：</label>
							<div class="col-sm-3">
                                {x2;$purchase['purchaseother']}						
                                </div>
						</div>



						<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">补充说明</h4>
						<div class="form-group">
							<label for="purchasesupport" class="control-label col-sm-2">补充说明：</label>
							<div class="col-sm-9">
                                <textarea class="form-control" name="args[purchasesupport]" disabled="disabled" id="purchasesupport2" rows="7" cols="4">{x2;$purchase['purchasesupport']}</textarea>							

                            </div>
						</div>
