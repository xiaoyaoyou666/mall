
	<header class="container-fluid" style="background-color:#FFFFFF;border-bottom:1px solid #cccccc;">
		<h5 class="text-center">
			<em style="font-size:2.6rem;color:#000000;" class="pull-left glyphicon glyphicon-menu-left" onclick="javascript:$.goPrePage();"></em>
			<span class="ttlo" style="color:#000000;">选择产品</span>
			<em style="font-size:2.6rem;color:#000000;" class="pull-right glyphicon glyphicon-phone" onclick="javascript:$.goPage($('#page1'));"></em>
		</h5>
	</header>
	<form id="item-buycart" style="width:100%;margin:auto;margin-bottom:4.8rem;margin-top:0.6rem;" action="index.php?item-app-cart-addtocart" method="post" data-target="cart" data-page="cart">
		<div style="background-color:#FFFFFF;padding:1rem 2rem;">
			<h4 style="line-height:3.6rem;margin-bottom:0.5rem;">
				{x2;$goods['goodstitle']}
				<br />
				<span class="text-danger" style="font-size:1.8rem;color:#F02CAF" id="itemprice">￥{x2;$goods['goodsminprice']} - ￥{x2;$goods['goodsmaxprice']}</span>
			</h4>
		</div>
		<div style="padding:0.5rem;;background-color:#FFFFFF;overflow:hidden;margin-top:0.5rem;">
			<div class="selector col-xs-4" style="padding-top:1rem;">
				<img src="{x2;$goods['goodsthumb']}" style="width:100%" id="specimg"/>
				<hr />
				<p class="text-center" id="spectxt">请选择产品</p>
			</div>
			<div class="selector col-xs-8">
				{x2;tree:$items['fields'],field,fid}
				<h5 style="line-height:2.4rem;">{x2;v:field['fieldtitle']}：</h5>
				<p class="td_{x2;v:field['field']}">
					{x2;tree:v:field['pars'],par,pid}
					<a class="btn btn-default parselector" onClick="javascript:selectpar('{x2;v:field['field']}','{x2;v:par}',this);" data="{x2;v:par}"{x2;if:v:fid == 1} data-img="{x2;v:field['img'][v:key]}"{x2;endif}>{x2;v:par}</a>
					{x2;endtree}
				</p>
				{x2;endtree}
				<h5 style="line-height:3rem;">
					库存：<span id="itemnumber">请选择商品</span>
					{x2;tree:$items['items'],item,iid}
					<a style="display:none;margin-bottom:0.5rem;" data-id="{x2;v:item['itemid']}" data-limit="{x2;v:item['limit_number']}" data-price="{x2;v:item['itemprice']}" class="parselector"{x2;tree:v:item['pars'],par,pid} data-{x2;v:key}="{x2;v:par}"{x2;endtree}>{x2;v:item['number']}</a>
					{x2;endtree}
				</h5>
				<p>
					<div class="input-group" style="width:12rem;">
					  <span class="input-group-addon removebutton">-</span>
					  <input type="text" value="1" class="form-control text-center" id="number" name="number" needle="needle" datatype="number">
					  <span class="input-group-addon addbutton">+</span>
					</div>
				</p>
			</div>
		</div>
		<p style="margin-top:0.5rem;padding:1rem;">
			<input type="hidden" value="" id="itemid" name="itemid" needle="needle" datatype="number" autocomplete="off" msg="请先选择产品"/>
			<input type="hidden" value="0" name="saletype" id="item-saletype"/>
			<span class="col-xs-4 text-center" style="padding-left:0px;"><button onclick="javascript:$('#item-saletype').val('0');$('#item-buycart').attr('data-target','cart');$('#item-buycart').attr('data-page','cart');$('#item-buycart').submit();" style="line-height:3rem;" type="button" class="btn btn-default btn-block">加入购物车</button></span>
			<span class="col-xs-4 text-center" style="padding-left:7px;padding-right:7px;"><button onclick="javascript:$('#item-saletype').val('1');$('#item-buycart').attr('data-target','order');$('#item-buycart').attr('data-page','order');$('#item-buycart').submit();" style="line-height:3rem;background-color:#F02CAF;border-color:#F02CAF;" type="button" class="btn btn-danger btn-block">立即购买</button></span>
			<span class="col-xs-4 text-center" style="padding-right:0px;"><a style="line-height:3rem;background-color:#6F6F6F;border-color:#6F6F6F;" href="javascript:;" onclick="javascript:$.goPrePage();" class="btn btn-warning btn-block">再看看</a></span>
		</p>
	</form>
	<script>
	var pars = [];
	{x2;tree:$items['fields'],field,fid}
	var {x2;v:key} = '';
	pars.push('{x2;v:key}');
	{x2;endtree}
	var cnt = [];
	function selectpar(parname,parcontent,obj)
	{
		if($(obj).attr('data-img'))
		{
			$('#specimg').attr('src',$(obj).attr('data-img'));
			$('#spectxt').html($(obj).attr('data'));
		}
		$('#subbutton').val('购买');
		$('#itemid').val('');
		$('#subbutton').attr('disabled',true);
		cnt[parname] = parcontent;
		var cntnumber = 0;
		for(x in cnt)
		{
			cntnumber++;
		}
		$(obj).parent().find('a').removeClass('btn-danger');
		$(obj).addClass('btn-danger');
		if(pars.length - cntnumber <= 1)
		{
			var ext = '';
			for(x in pars)
			{
				ext = pars[x];
			}
			if(ext != parname)
				p = $('.parselector[data-'+parname+'="'+parcontent+'"]');
			else
			{
				p = $('.parselector');
			}
			for(x in cnt)
			{
				if(x != ext)
				{
					p = p.filter('[data-'+x+'="'+cnt[x]+'"]');
				}
			}
			$('.td_'+ext).find('a').each(function(){
				var _this = this;
				$(_this).show();
				var s = parseInt(p.filter('[data-'+ext+'="'+$(_this).attr('data')+'"]').html());
			});
		}
		p = $('.parselector');
		for(x in cnt)
		{
			p = p.filter('[data-'+x+'="'+cnt[x]+'"]');
		}
		if(p.length == 1)
		{
			$('#itemnumber').html(p.html());
            $('#limit_number').html(p.attr('data-limit'));
			{x2;if:$_user['userid'] && $allow_price == 1}
			$('#itemprice').html('&yen'+p.attr('data-price'));
			{x2;else}
			$('#itemprice').html(p.attr('data-price'));
			{x2;endif}
			$('#subbutton').attr('disabled',false);
			$('#itemid').val(p.attr('data-id'));
		}
		else
		{
			if(p.length < 1)
			$('#itemnumber').html('无货');
			$('#subbutton').html('无货');
			$('#itemprice').html($('#itemprice').attr('data-price'));
		}
	}
	$(document).ready(function() {
		$('.addbutton').bind("click",function(){
			var i = $(this).parent().find("input");
			var val = parseInt(i.val());
			val ++;
			i.val(val);
		});
		$('.removebutton').bind("click",function(){
			var i = $(this).parent().find("input");
			var val = parseInt(i.val());
			if(val >=2)
			{
				val--;
				i.val(val);
			}
		});
	});
	</script>