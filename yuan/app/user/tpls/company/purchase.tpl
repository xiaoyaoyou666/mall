{x2;include:header}
<body>
{x2;include:nav}

<style type="text/css">
.table a{color:#ff8a00}
.table a:hover{color:#009944}
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
.conditions>tbody>tr>td{
padding:5px 2px !important;
}

.form-control{

	height: 40px;
}
.btn-primary{
	background:#009944;
	border:solid 1px #009944;
}
button.btn-primary:hover{
	background:#057d3a !important;
	border:solid 1px #057d3a !important;
}
.btnabs{padding: 4px 14px 4px 0!important;font-size: 12px;}
</style>


<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>采购信息管理</a> > <a>我发布的采购信息</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right published-purchase">
                <!--公司简介-->
                <div>
					<div class="zmm_panel panel-default">
						<!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
						<div class="zmm-qydt-title zmm-qydt-shsj1">
							<p><em class="title-triangle"></em>我发布的采购信息</p >
					    	<a href="index.php?user-company-purchases-add" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">发布采购信息</a>
						</div>

					<!--我的模块开始-->
					<div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
						
						<form action="index.php?user-company-purchases" method="post" class="form-inline condition-table">
							<table class="table conditions">
						        <tr>
						            <td style="border-top: 0px;font-size: 14px;">
                                        标题：
                                        <input style="width: 126px;" class="form-control" name="search[keyword]" size="6" type="text" value="{x2;$search['keyword']}" id="keyword"/>
                                    </td>
									<td style="border-top: 0px;font-size: 14px;">
										采购类型：
									
										<select class="form-control" name="search[purchasetype]" id="purchasetype">
		                                	<option value=''>采购类型</option>
			                                <option value='设备' {x2;if:$search['purchasetype']=='设备'}selected{x2;endif}>设备</option>
											<option value='材料' {x2;if:$search['purchasetype']=='材料'}selected{x2;endif}>材料</option>
											<option value='施工' {x2;if:$search['purchasetype']=='施工'}selected{x2;endif}>施工</option>
											<option value='服务' {x2;if:$search['purchasetype']=='服务'}selected{x2;endif}>服务</option>
										</select>
									</td>

									<td style="border-top: 0px;font-size: 14px;">
										采购状态：
									
										<select class="form-control" name="search[purchasestatus]" id="purchasestatus">
		                                	<option value=''>采购状态</option>
			                                <option value='0' {x2;if:$search['purchasestatus']=='0'}selected{x2;endif}>开放</option>
											<option value='2' {x2;if:$search['purchasestatus']=='2'}selected{x2;endif}>关闭</option>
											<option value='1' {x2;if:$search['purchasestatus']=='1'}selected{x2;endif}>已达成合作</option>
										</select>
									</td>
									<td style="border-top: 0px;font-size: 14px;">
										发布时间：
									
										<input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>
									</td>

						        	
									<td>
										<button class="btn btn-primary" type="submit" style="background-color:#009944;border:solid 1px #009944;" onclick="doSearch();return false;">搜索</button>
									</td>
									
						        </tr>
						    
							</table>
							<div class="input">
								<!-- <input type="hidden" value="1" name="search[argsmodel]" /> -->
							</div>
						</form>

						
						<form action="index.php?user-company-purchases-lite" method="post">
							<fieldset>
								<table class="table table-hover table-responsive table-bordered">
									<thead>
										<tr class="info" style="background-color:#DADADA;">
											
						                   	<th style="background-color:#ededed;font-weight: normal;width: 50px;">权重</th>
									        <th style="background-color:#ededed;font-weight: normal;">采购标题</th>
											

									        <th style="background-color:#ededed;font-weight: normal;">采购类型</th>
									        <th style="background-color:#ededed;font-weight: normal;">采购状态</th>
									        <th style="background-color:#ededed;font-weight: normal;">发布时间</th>
									        <th style="background-color:#ededed;font-weight: normal;">收到的合作申请</th>
									        <th style="background-color:#ededed;font-weight: normal;">操作</th>
						                </tr>
						            </thead>
						            <tbody>
						            	{x2;tree:$purchases['data'],purchase,cid}
						            	<tr>
						                    <td class="form-inline cell-align-center" >
						                      <input style="height: 25px;" type="text" size="1" name="ids[{x2;v:purchase['purchaseid']}]" value="{x2;v:purchase['purchasesequence']}" class="form-control"/>
						                    </td>
						                    <td class="table-text" style="max-width:240px;">
						                        {x2;v:purchase['purchasetitle']}
						                    </td>
											<td>
						                        {x2;v:purchase['purchasetype']}
						                    </td>
											<td>
						                        {x2;if:v:purchase['purchasestatus']==0}
													开放
												{x2;elseif:v:purchase['purchasestatus']==2}
													关闭
												{x2;elseif:v:purchase['purchasestatus']==1}
													已达成合作
						                        {x2;endif}
						                    </td>

						                    <td>
						                    	{x2;date:v:purchase['purchaseinputtime'],'Y-m-d H:i'}
						                    </td>
											<td>
						                    	<a href="index.php?user-company-purchases-pricelist&purchaseid={x2;v:purchase['purchaseid']}" class="autoloaditem yellow-text" autoload="index.php?user-company-purchases-getpricednumber&purchaseid={x2;v:purchase['purchaseid']}"></a>
						                    </td>
						                    <td class="actions" style="text-align:left;">
						                    	<div class="btn-group">
													<a class="btn btnabs yellow-text" href="index.php?user-company-purchases-detail&catid={x2;v:purchase['purchasecatid']}&purchaseid={x2;v:purchase['purchaseid']}&page={x2;$page}{x2;$u}" title="查询"><em class="glyphicon glyphicon-list"></em></a>
													

													<a class="btn btnabs yellow-text" href="index.php?user-company-purchases-edit&catid={x2;v:purchase['purchasecatid']}&purchaseid={x2;v:purchase['purchaseid']}&page={x2;$page}{x2;$u}&edittype=1" title="编辑"><em class="glyphicon glyphicon-edit"></em></a>
													<a class="btn btnabs yellow-text confirm" href="index.php?user-company-purchases-updatestatus&catid={x2;v:purchase['cncatid']}&purchaseid={x2;v:purchase['purchaseid']}&page={x2;$page}{x2;$u}" title="关闭"><em class="glyphicon glyphicon-remove"></em></a>
						                    	</div>
						                    </td>
						                </tr>
						                {x2;endtree}
						        	</tbody>
						        </table>
                                {x2;if:$isHaveData == '1'}
						        <div class="control-group">
						        	<div class="controls" style="padding-top:10px;">
										<button class="btn btn-primary" type="submit" >更改排序</button>
							            <input type="hidden" name="page" value="{x2;$page}">
							            <input type="hidden" name="modifyfieldsequence" value="1"/>
				          				<input type="hidden" name="moduleid" value="{x2;$moduleid}"/>
										{x2;tree:$search,arg,aid}
										<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
										{x2;endtree}
									</div>
								</div>
                                {x2;endif}
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

{x2;include:footer2}
<script>
    $(function() {
        $('.submenu:eq(2)').delay(400).slideDown(700);
        $('.submenu:eq(2) li:eq(1)').addClass("active");
    });
    //---搜索------
    function doSearch()
    {
        var stime = $("#stime").val();
        var etime = $("#etime").val();
        var purchasetype = $("#purchasetype").val();
        var purchasestatus = $("#purchasestatus").val();
        var searchKeyword = $("#keyword").val();
        var url = 'index.php?user-company-purchases';
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
        if(purchasestatus != ''){
            url += '&search[purchasestatus]='+purchasestatus;
        }
        window.location.href = url;
    }
</script>
</body>

</html>
