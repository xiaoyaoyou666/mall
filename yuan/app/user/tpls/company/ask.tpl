{x2;include:header}
<body>
{x2;include:nav}
<style type="text/css">
.zmm-panel-body {
    padding-top: 20px;
    padding-left: 20px;
    padding-right: 20px;
}
.zmm-gsjj table {
	width:100%;
    	margin-left: 0 !important;
	margin-bottom: 0 !important;
}

.conditions tbody tr,.conditions tbody td{
	border:0 !important;
}


.actions .btn-primary {
	color: #ff8a00;
	background-color: transparent!important;
	border-color: transparent!important;
}

.actions .btn-danger {
	color: #ff8a00;
	background-color: transparent!important;
	border-color: transparent!important;
}

.actions a span {
	color: #ff8a00!important;
}
.actions a span:hover {
	color: #009944!important;
}

.btn-primary{
	background:#009944;
	border:solid 1px #009944;
}
button.btn-primary:hover{
	background:#057d3a !important;
	border:solid 1px #057d3a !important;
}
</style>


<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> ><a>采购信息管理</a> > <a>我收到的询价</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right">
                <!--公司简介-->
                <div>



					<div class="zmm_panel panel-default" >
						<!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
						<div class="zmm-qydt-title zmm-qydt-shsj1"><p><em class="title-triangle"></em>我收到的询价</p >

					</div>



					<!--我的模块开始-->
					<div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj receive-enquiry">
					<form action="index.php?user-company-purchases-follow" method="post" class="form-inline">
						<table class="table conditions">
					        <tr>
					            <td style="border-top: 0px;font-size: 14px;">
                                    对方的企业名称：
                                    <input class="form-control" name="search[purchaseusername]" size="10" type="text" value="{x2;$search['purchaseusername']}"/>
                                </td>

								
								<td style="border-top: 0px;font-size: 14px;">
                                    状态：
                                    <select class="form-control" name="search[ppestatus]" id="ppestatus">
	                                	<option value=''>状态</option>
		                                <option value='0'>开放</option>
										<option value='2'>关闭</option>
										<option value='1'>已达成合作</option>

									</select>
								</td>

								<td style="border-top: 0px;font-size: 14px;">
                                    询价时间：
                                    <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>

								</td>
							
								
                                <td>
                                    <button class="btn btn-primary" type="submit" style="background-color:#009944" onclick="doSearch();return false;">搜索</button>
                                </td>
								<td></td>

								<td></td>
					        </tr>

						</table>
						<div class="input">
							<!-- <input type="hidden" value="1" name="search[argsmodel]" /> -->
						</div>
					</form>


					<form action="index.php?user-company-purchases-lite" method="post">
						<fieldset>
							<table class="table table-hover table-bordered receive-enquiry-table">
								<thead>
									<tr>
										<!-- <th width="40">ID</th> -->
								        <th width="40">询价内容</th>
								        <th width="70">询价企业名称</th>
								        <th width="50">采购状态</th>
								        <th width="80">询价时间</th>
								        <th width="80">联系方式</th>
								        <th width="100">操作</th>
					                </tr>
					            </thead>
					            <tbody>
					            	{x2;tree:$purchases['data'],purchase,cid}
					            	<tr>
					            		<!-- <td style="text-align:center">
					                        {x2;v:purchase['ppeid']}
					                    </td> -->
					                    <td>
					                        {x2;v:purchase['purchasetitle']}
					                    </td>
										<td>
					                        {x2;$users[v:purchase['ppeuserid']]['company_name']}
					                    </td>
										<td>
					                        {x2;if:v:purchase['ppestatus']==0}
												对方已收到
											{x2;elseif:v:purchase['ppestatus']==2}
												已拒绝
											{x2;elseif:v:purchase['ppestatus']==1}
												已达成合作
					                        {x2;endif}
					                    </td>

					                    <td>
					                    	{x2;date:v:purchase['ppetime'],'Y-m-d H:i'}
					                    </td>
										<td>
											{x2;$users[v:purchase['ppeuserid']]['company_mobile']}

					                    </td>
					                    <td class="actions">
					                    	<div class="btn-group">
													{x2;if:v:purchase['ppestatus']==1}
														已达成合作
						                      		{x2;elseif:v:purchase['ppestatus']==2}
														已拒绝
						                      		{x2;else}
														<a href="index.php?user-company-purchases-setpricestatus&status=1&ppeid={x2;v:purchase['ppeid']}" class="btn btn-primary yellow-text confirm" msg="确定要接受吗？">提交合作意向</a>

														<a href="index.php?user-company-purchases-setpricestatus&status=2&ppeid={x2;v:purchase['ppeid']}" class="btn btn-danger yellow-text confirm" msg="确定要拒绝吗？">拒绝</a>
						                      		{x2;endif}
					                    	</div>
					                    </td>
					                </tr>
					                {x2;endtree}
					        	</tbody>
					        </table>
					        <div class="control-group">
					            <div class="controls">
						            <label class="radio-inline">
						                <!-- <input type="radio" name="action" value="modify" checked/>排序 -->
						            </label>
						            <label class="radio-inline">
						                <!-- <input type="radio" name="action" value="delete" />删除 -->
						            </label>
						            {x2;tree:$search,arg,sid}
						            <input type="hidden"-name="search[{x2;v:key}]" value="{x2;v:arg}"/>
						            {x2;endtree}
						            <label class="radio-inline">
						            	<!-- <button class="btn btn-primary" type="submit">提交</button> -->
						            </label>
						            <input type="hidden" name="modifypurchasesequence" value="1"/>
						            <input type="hidden" name="catid" value="{x2;$catid}"/>
						            <input type="hidden" name="page" value="{x2;$page}"/>
						        </div>
					        </div>
							<ul class="pagination pull-right">
								{x2;$purchases['pages']}
							</ul>
						</fieldset>
					</form>


					</div>
					<!--我的模块结束-->



                </div>
            </div>
            <!-- 右侧  end -->
        </div>
    </div>
</div>
</div>
</div>

{x2;include:footer2}
<script>
    $(function() {
        $('.submenu:eq(2)').delay(400).slideDown(700);
        $('.submenu:eq(2) li:eq(3)').addClass("active");
    });

    function doSearch()
    {
        var stime = $("#stime").val();
        var etime = $("#etime").val();
        var purchasetype = $("#purchasetype").val();
        var ppestatus = $("#ppestatus").val();
        //alert(ppestatus);
        var searchKeyword = $("#keyword").val();
        var url = 'index.php?user-company-purchases-ask';
        if(searchKeyword != ''){
            url += '&search[keyword]='+searchKeyword;
        }
        if(stime != ''){
            url += '&search[stime]='+stime;
        }
        if(etime != ''){
            url += '&search[etime]='+etime;
        }
        if(purchasetype != ''){
            url += '&search[purchasetype]='+purchasetype;
        }
        if(ppestatus != ''){
            url += '&search[ppestatus]='+ppestatus;
        }
        window.location.href = url;
    }
</script>
</body>

</html>