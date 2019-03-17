{x2;include:header}
<body>
{x2;include:nav}
<style type="text/css">
.table a{
    word-break: break-all;
    white-space: normal;
    word-wrap: break-word;
    text-align: left;
}
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
.conditions>tbody>tr>td {
    padding: 12px 2px !important;
}

.btn-group span:hover{
	color:#009944;
}

.btn-primary{
	background:#009944;
	border:solid 1px #009944;
}
button.btn-primary:hover{
	background:#057d3a !important;
	border:solid 1px #057d3a !important;
}
.table-responsive th{font-weight: normal;}
.btnfg {font-size: 12px!important;padding: 0px 0px!important;}
.text_s{font-size: 12px!important;}
</style>


<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> ><a>采购信息管理</a> > <a>我关注的采购</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right follow-purchase">
                <!--公司简介-->
                <div>
					<div class="zmm_panel panel-default" >
						<!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
						<div class="zmm-qydt-title zmm-qydt-shsj1"><p><em class="title-triangle"></em>我关注的采购</p >
					</div>

					<!--我的模块开始-->
					<div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
					<form action="index.php?user-company-purchases-follow" method="post" class="form-inline">
						<table class="table conditions table-responsive ">
					        <tr>
					             <td style="border-top: 0px;font-size: 14px;">
                                    对方的企业名称：

                                    <input class="form-control" name="search[purchaseusername]" size="6" type="text" value="{x2;$search['purchaseusername']}"/>
                                 </td>
                                 <td style="border-top: 0px;font-size: 14px;">
                                    采购类型：
                                    <select class="form-control" name="search[purchasetype]">
                                        <option value=''>采购类型</option>
                                        <option value='设备'>设备</option>
                                        <option value='材料'>材料</option>
                                        <option value='施工'>施工</option>
                                        <option value='服务'>服务</option>
                                    </select>
                                </td>
					             <td style="border-top: 0px;font-size: 14px;">
                                    采购状态：
                                    <select class="form-control" name="search[purchasestatus]">
                                        <option value=''>采购状态</option>
                                        <option value='1'>开放</option>
                                        <option value='2'>关闭</option>
                                        <option value='3'>已达成合作</option>

                                    </select>
                                </td>

								<td style="border-top: 0px;font-size: 14px;">
									发布时间：
									<input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>
								</td>


                                <td>
                                    <button class="btn btn-primary" type="submit" style="background-color:#009944">搜索</button>
                                </td>
					        </tr>
					     
						</table>
						<div class="input">
							<input type="hidden" value="1" name="search[argsmodel]" />
						</div>
					</form>

					
					<form action="index.php?user-company-purchases-lite" method="post">
						<fieldset>
							<table class="table table-hover table-bordered follow-purchase-table">
								<thead>
									<tr>
								        <th>采购标题</th>
								        <th>采购类型</th>
								        <th>采购状态</th>
								        <th>发布时间</th>
								        <th>对方的企业名称</th>
								        <th>最新进展</th>
					                </tr>
					            </thead>
					            <tbody>
					            	{x2;tree:$purchases['data'],purchase,cid}
					            	<tr>
					                    <td class="table-text" style="max-width:240px">
					                        <a class="btn btnfg yellow-text" href="index.php?user-company-purchases-detail&catid={x2;v:purchase['purchasecatid']}&purchaseid={x2;v:purchase['purchaseid']}&page={x2;$page}{x2;$u}&a=1">{x2;v:purchase['purchasetitle']}</a>
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
											{x2;v:purchase['purchaseusername']}
					               
					                    </td>
					                    <td class="actions">
					                    	<div class="btn-group">
												{x2;if:v:purchase['ppestatus']==0}
													<a class="yellow-text text_s" href="index.php?user-company-purchases-pricedetail&ppeid={x2;v:purchase['ppeid']}&follow=1">对方已收到</a>
												{x2;elseif:v:purchase['ppestatus']==1}
													<a class="yellow-text text_s" href="index.php?user-company-purchases-pricedetail&ppeid={x2;v:purchase['ppeid']}&follow=1">对方已接受</a>
												{x2;elseif:v:purchase['ppestatus']==2}
													<a class="yellow-text text_s" href="index.php?user-company-purchases-pricedetail&ppeid={x2;v:purchase['ppeid']}&follow=1">对方已拒绝</a>
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
        $('.submenu:eq(2) li:eq(2)').addClass("active");
    });
</script>
</body>

</html>
