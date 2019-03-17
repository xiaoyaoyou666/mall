{x2;include:header}
<style type="text/css">
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
            <span><a href="index.php?user-company">企业中心</a> > <a>网格超市货架管理</a> > <a>我的询价</a></span>
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
					<div class="zmm-qydt-title zmm-qydt-shsj1"><p>我的询价</p >
				    
				</div>
			
					
					<div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
					<table class="table table-hover table-bordered">
			            <thead>
			                <tr class="info">
			                    <th>ID</th>
			                    <th>商品名</th>
						        <th>询价人</th>
								<th>电话</th>
		                        <th>邮箱</th>
						        <th>地址</th>
						        <th>描述</th>
						        <th width="140">时间</th>
			                </tr>
			            </thead>
			            <tbody>
			            	{x2;tree:$items['data'],item,cid}
			            	<tr>
			                    <td>{x2;v:item['askitemid']}</td>
			                    <td>{x2;v:item['goodstitle']}</td>
						        <td>{x2;v:item['askitemname']}</td>
		                        <td>{x2;v:item['askitemphone']}</td>
						        <td>{x2;v:item['askitememail']}</td>
						        <td>{x2;v:item['askitemaddress']}</td>
								<td>{x2;v:item['askitemdesc']}</td>
								<td>{x2;date:v:item['askitemtime'],'Y-m-d H:i:s'}</td>
			                </tr>
			                {x2;endtree}
			        	</tbody>
			        </table>
					<ul class="pagination pagination-right">
						{x2;$items['pages']}
					</ul>
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
        $('.submenu:eq(1) li:eq(1)').addClass("active");
    });
</script>
</body>

</html>
