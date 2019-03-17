		<header class="container-fluid" style="background-color:#FFFFFF;border-bottom:1px solid #cccccc;">
			<h5 class="text-center">
				<em style="font-size:2.6rem;color:#000000;" class="pull-left glyphicon glyphicon-menu-left" onclick="javascript:$.goPrePage();"></em>
				<span class="ttlo" style="color:#000000;">选择快递公司</span>
				<em style="font-size:2.6rem;color:#000000;" class="pull-right glyphicon glyphicon-phone" onclick="javascript:$.goPage($('#page1'));"></em>
			</h5>
		</header>
		{x2;tree:$posters,poster,psid}
		<div style="width:95%;margin:auto;margin-top:0.6rem;background-color:#FFFFFF;overflow:hidden;padding:1.2rem;" onclick="javascript:setposter(this);">
			{x2;v:poster['psname']}
			<input type="hidden" value="{x2;v:poster['psid']}" name="psid"/>
		</div>
		{x2;endif}
		<p></p>
		<script>
		function setposter(obj)
		{
			$('#order-currentposter').html($(obj).html());
			$.goPage($('#order'));
			$.get('index.php?item-app-order-getcartfee&addressid='+$('#order-currentaddress').find("input").val()+'&psid='+$('#order-currentposter').find("input").val()+'&'+Math.random(),function(data){
				$('#order-fee').html(data);
				var p = parseFloat(data.replace('￥','').replace('元',''))+parseFloat($('#order-totalprice').attr('data-iprice'));
				$('#order-totalprice').html('￥'+p+'元');
			});
		}
		</script>