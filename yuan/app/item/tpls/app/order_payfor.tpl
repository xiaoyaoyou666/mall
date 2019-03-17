	<header class="container-fluid" style="background-color:#FFFFFF;border-bottom:1px solid #cccccc;">
		<h5 class="text-center">
			<em style="font-size:2.6rem;color:#000000;" class="pull-left glyphicon glyphicon-menu-left" onclick="javascript:$.goPrePage();"></em>
			<span class="ttlo" style="color:#000000;">订单支付</span>
			<em style="font-size:2.6rem;color:#000000;" class="pull-right glyphicon glyphicon-phone" onclick="javascript:$.goPage($('#page1'));"></em>
		</h5>
	</header>
	<div style="width:95%;padding:0.5rem;margin:auto;margin-bottom:4.8rem;margin-top:0.6rem;background-color:#FFFFFF;overflow:hidden;">
		<form action="index.php?item-app-order-createorder" method="post" data-target="payfor" data-page="payfor">
			<h5 class="alert alert-info hide"><em class="glyphicon glyphicon-globe"></em> 收货人：</h5>
			<ul class="list-group">
				<li class="list-group-item" style="line-height:1.5rem;overflow:hidden;">
					<div class="col-xs-12" id="currentaddress">
						{x2;$order['orderaddress']['receiver']} {x2;$order['orderaddress']['phone']}<br />
						<span style="font-size:1rem;">{x2;$order['orderaddress']['province']}{x2;$order['orderaddress']['city']}{x2;$order['orderaddress']['area']}{x2;$order['orderaddress']['addressinfo']}</span>
					</div>
				</li>
			</ul>
			<table class="table table-hover table-bordered">
				<tr>
					<th colspan="2">订单号：{x2;$order['ordersn']}</th>
				</tr>
				<tr class="items" style="background-color:#8B8B8B;">
					<td width="75%">商品</td>
					<td>数量</td>
				</tr>
				{x2;tree:$order['orderitems'],cart,cid}
				{x2;if:v:cart['cartstatus']}
				<tr>
					<td>
						{x2;v:cart['goodstitle']}
						<span style="font-size:1rem;">
						{x2;tree:$mfields[$categories[v:cart['goodscatid']]['catmoduleid']],field,fid}
		            	{x2;if:v:field['fieldsystem']}
		            	{x2;v:field['fieldtitle']}:{x2;v:cart[v:field['field']]}&nbsp;
		            	{x2;endif}
		            	{x2;endtree}
		            	</span>
		            </td>
					<td>{x2;v:cart['number']}</td>
				</tr>
				{x2;endif}
				{x2;endtree}
				<tr>
					<td colspan="2">
						<span class="text-danger pull-right">运费：￥{x2;$order['orderfee']}元 商品合计：￥{x2;eval: echo $order['orderprice'] - $order['orderfee']}元</span>
					</td>
				</tr>
				<tr style="background-color:#8B8B8B;">
					<td colspan="2">
						<span class="text-danger pull-right">合计：￥{x2;$order['orderprice']}元</span>
					</td>
				</tr>
			</table>
			<p>
				<a style="line-height:3rem;" href="index.php?user-center-orders" data-target="orderlist" data-page="orderlist" class="ajax btn btn-default btn-block">订单列表</a>
			</p>
		</form>
	</div>