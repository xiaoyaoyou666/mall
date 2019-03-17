{x2;include:header}
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
.conditions{
	background-color:#eee;
	border:0 !important;
}
.conditions tbody tr,.conditions tbody td{
	border:0 !important;
}
.conditions>tbody>tr>td{
padding:5px 2px !important;
}

.table > thead > tr > td.info, .table > tbody > tr > td.info, .table > tfoot > tr > td.info, .table > thead > tr > th.info, .table > tbody > tr > th.info, .table > tfoot > tr > th.info, .table > thead > tr.info > td, .table > tbody > tr.info > td, .table > tfoot > tr.info > td, .table > thead > tr.info > th, .table > tbody > tr.info > th, .table > tfoot > tr.info > th {
    background-color: #DADADA;
}
</style>
<body>
{x2;include:nav}

<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?{x2;$_app}-company">企业中心</a> > <a href="index.php?user-company-items">网格超市货架管理</a>> <a>库存管理</a></span>
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


				<!--我的模块开始-->
				<div class="zmm_panel panel-default" >
					<!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
					<div class="zmm-qydt-title zmm-qydt-shsj1">
					<p><em class="title-triangle"></em><a target="_blank" href="index.php?item-app-item&goodsid={x2;$goods['goodsid']}">【{x2;$goods['goodstitle']}】</a>库存管理</p >
					
					<a href="index.php?user-company-items-additem&goodsid={x2;$goods['goodsid']}" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 40px;line-height: 40px;">添加库存</a>

					
				</div>
				<div class="zmm-panel-body">
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr class="info">
                            <!--
                                <th><input type="checkbox" class="checkall" target="delids"/></th>
                                <th>权重</th>-->
                                <th>ID</th>
                                <th>缩略图</th>
                                {x2;tree:$fields,field,fid}
                                <th>{x2;v:field['fieldtitle']}</th>
                                {x2;endtree}
                                <th>价格</th>
                                <!--<th>起订量</th>-->
                                <th>库存</th>
                                <th>状态</th>
                                <th width="100">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            {x2;tree:$items['data'],item,cid}
                            <tr>
                                <!--<td><input type="checkbox" name="delids[{x2;v:item['itemid']}]" value="1"></td>
                                <td><input type="text" class="form-control" name="ids[{x2;v:item['itemid']}]" value="{x2;v:item['itemsequence']}" style="width:24px;padding:2px 5px;"/></td>
                                -->
                                <td>{x2;v:item['itemid']}</td>
                                <td class="picture"><img src="{x2;if:v:item['itemthumb']}{x2;v:item['itemthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="height:18px;"/></td>
                                {x2;tree:$fields,field,fid}
                                <td>{x2;v:item[v:field['field']]}</td>
                                {x2;endtree}
                                <td>{x2;v:item['itemprice']}</td>
                                <!--<td>{x2;v:item['itemlimitnumber']}</td>-->
                                <td>{x2;v:item['itemnumber']}</td>
                                <td>{x2;if:v:item['itemstatus']}显示{x2;else}<em class="text-warning">不显示</em>{x2;endif}</td>
                                <td class="actions">
                                    <div class="btn-group">
                                        <a class="btn yellow-text" href="index.php?user-company-items-edititem&itemid={x2;v:item['itemid']}&page={x2;$page}{x2;$u}" title="修改"><em class="glyphicon glyphicon-edit"></em></a>
                                        <a class="btn yellow-text confirm" href="index.php?user-company-items-delitem&itemid={x2;v:item['itemid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                    </div>
                                </td>
                            </tr>
                            {x2;endtree}
                        </tbody>
                    </table>
				</div>

			        <!--
			        <div class="control-group">
			            <div class="controls">
				            <label class="radio-inline">
				                <input type="radio" name="action" value="modify" checked/>排序
				            </label>
				            <label class="radio-inline">
				                <input type="radio" name="action" value="delete" />删除
				            </label>
				            {x2;tree:$search,arg,sid}
				            <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
				            {x2;endtree}
				            <label class="radio-inline">
				            	<button class="btn btn-primary" type="submit">提交</button>
				            </label>
				            <input type="hidden" name="modifyitemsequence" value="1"/>
				            <input type="hidden" name="goodsid" value="{x2;$goods['goodsid']}"/>
				            <input type="hidden" name="page" value="{x2;$page}"/>
				        </div>
			        </div>
			        -->
					<div class="pagination pagination-right">
						<ul>{x2;$items['pages']}</ul>
					</div>
				
</div>
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
        $('.submenu:eq(1)').delay(400).slideDown(700);
        $('.submenu:eq(1) li:eq(0)').addClass("active");
    });
</script>
</body>

</html>



				