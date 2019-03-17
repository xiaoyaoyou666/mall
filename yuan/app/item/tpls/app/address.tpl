		<header class="container-fluid" style="background-color:#FFFFFF;border-bottom:1px solid #cccccc;">
			<h5 class="text-center">
				<em style="font-size:2.6rem;color:#000000;" class="pull-left glyphicon glyphicon-menu-left" onclick="javascript:$.goPrePage();"></em>
				<span class="ttlo" style="color:#000000;">选择地址</span>
				<em style="font-size:2.6rem;color:#000000;" class="pull-right glyphicon glyphicon-phone" onclick="javascript:$.goPage($('#page1'));"></em>
			</h5>
		</header>
		<div style="width:95%;margin:auto;margin-top:0.6rem;background-color:#F02CAF;overflow:hidden;padding:1.2rem;">
			<a href="index.php?item-app-order-addaddress" class="ajax" data-target="address" data-page="address" style="color:#FFFFFF;">添加新地址 <span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
		</div>
		{x2;tree:$addresses,address,adid}
		<div style="width:95%;margin:auto;margin-top:0.6rem;background-color:#FFFFFF;overflow:hidden;padding:1.2rem;" onclick="javascript:setaddress(this);">
			{x2;v:address['receiver']} {x2;v:address['phone']}<br />
			<input type="hidden" value="{x2;v:address['addressid']}" name="addressid"/>
			<span style="font-size:1rem;">{x2;v:address['province']}{x2;v:address['city']}{x2;v:address['area']}{x2;v:address['addressinfo']}</span>
		</div>
		{x2;endif}
		<p></p>
		<script>
		function setaddress(obj)
		{
			$('#order-currentaddress').html($(obj).html());
			$.goPage($('#order'));
		}
		</script>