<style type="text/css">
	.cols{margin-top: 7px!important;}
	.imgds{width: 18px;margin-right: ;}
</style>
<div class="form-group">
				            <label for="purchasetitle" class="control-label col-sm-2">采购标题：</label>
				            <div class="col-sm-4 cols">
							    {x2;$purchase['purchasetitle']}
					        </div>
				        </div>




				        <div class="form-group">
				            <label for="purchasetitle" class="control-label col-sm-2">发布时间：</label>
				            <div class="col-sm-4 cols">
							   {x2;date:$purchase['purchaseinputtime'],'Y-m-d H:i:s'}
					        </div>
				        </div>

				        <div class="form-group">
							<label for="purchasetype" class="control-label col-sm-2">采购类型：</label>
							<div class="col-sm-3 cols">

	                                {x2;$purchase['purchasetype']}


							</div>
						</div>

						<div class="form-group">
				            <label for="purchasetitle" class="control-label col-sm-2">采购结束时间：</label>
				            <div class="col-sm-4 cols">
							    {x2;date:$purchase['purchase_finishtime'],'Y-m-d H:i:s'}
					        </div>
				        </div>



						<div class="form-group">
				            <label for="purchasetitle" class="control-label col-sm-2">期望收货时间：</label>
				            <div class="col-sm-4 cols">
							   {x2;date:$purchase['purchase_recivetime'],'Y-m-d H:i:s'}
					        </div>
				        </div>

						<div class="form-group" style="margin-bottom: 0">
							<label for="purchase_province" class="control-label col-sm-2">收货地址：</label>
                            <div class="col-md-10 form-group">
							<div class="col-sm-2 cols">
	                                <select class="autoloaditem combox form-control" autoload="index.php?core-api-index-getProvince" target="service_city" refurl="index.php?core-api-index-getcity&amp;parent={value}" name="args[service_province]" id="service_province"  current="{x2;$purchase['service_province']}" disabled="disabled"></select>

	                            </div>

	                            <div class="col-sm-2 cols">
	                                <select class="autoloaditem combox form-control" autoload="index.php?core-api-index-getcity" target="service_area" refurl="index.php?core-api-index-getarea&amp;parent={value}" parent="#service_province" name="args[service_city]" id="service_city"  current="{x2;$purchase['service_city']}" disabled="disabled">
	                                </select>

	                            </div>
	                            <div class="col-sm-2 cols">
	                                <select class="autoloaditem form-control" autoload="index.php?core-api-index-getarea" parent="#service_city" name="args[service_area]" id="service_area"  current="{x2;$purchase['service_area']}" disabled="disabled"></select>

	                            </div>
                            </div>
						</div>
                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="args[purchase_address]" id="purchase_address"  value="{x2;$purchase['purchase_address']}" disabled="disabled">
                            </div>
                        </div>

						<h4 class="title">合作要求</h4>
						<div class="form-group">
							<label for="purchasecapital" class="control-label col-sm-2 ">注册资本：</label>
							<div class="col-sm-3 cols">
                                {x2;$purchase['purchasecapital']}<span>万元</span>


                            </div>
						</div>

						<div class="form-group">
							<label for="purchasefinancial" class="control-label col-sm-2 ">财务状况：</label>
							<div class="col-sm-3 cols">

	                                {x2;$purchase['purchasefinancial']}

							</div>
						</div>

						<div class="form-group">
							<label for="purchasecompsize" class="control-label col-sm-2">公司规模：</label>
							<div class="col-sm-3 cols">

	                                {x2;$purchase['purchasecompsize']}

								</div>
						</div>

						<div class="form-group">
							<label for="purchasestate" class="control-label col-sm-2">经营状况：</label>
							<div class="col-sm-3 cols">
                                {x2;$purchase['purchasestate']}
                                </div>
						</div>

						<div class="form-group">
							<label for="purchaseother" class="control-label col-sm-2">其他要求：</label>
							<div class="col-sm-3 cols">
                               {x2;$purchase['purchaseother']}
                                </div>
						</div>

						<h4 class="title">采购物料</h4>
						<div class="form-group">
							<div class="table-div col-sm-11" style="width: 100%;">
								<table class="table table-bordered table-responsive">
									<thead>
									<tr>
										<th>物料名称</th>
										<th>型号</th>
										<th>品牌</th>
										<th>物料描述</th>
										<th>采购量</th>
										<th>附件</th>
										<th>图片/图纸(数量)</th>
									</tr>
									</thead>
									<tbody id="itemlists">
									{x2;$purchaseinfostr}
									</tbody>
								</table>
							</div>
						</div>

						<h4 class="title">补充要求</h4>

						<div class="form-group">
							<label for="purchasedescribe" class="control-label col-sm-1 cols" style="width: 65px;"></label>
							<div class="col-sm-9">
								<textarea class="form-control" name="args[purchasesupport]" id="purchasesupport1" rows="7" cols="4" disabled="disabled" readonly="readonly">{x2;$purchase['purchasesupport']}</textarea>
							</div>
						</div>