{x2;include:header}
<body>
<style>
.dis-select{border:1px solid #ff8a00!important;}
.closes{display: none;}
.di-style span{
	border:solid 1px #fff;
	padding:3px 20px;
}
.titlesb a:hover{color: #fff;}
</style>
{x2;include:nav}

<div class="container why-cartbg">
	<form class="wrap"  action="index.php?item-app-order" method="post" id="form1">
		<table class="cart-list">
			<tr class="total" style="background: #ebebeb">
				<td class="titlesb" style="text-align: left;padding:5px 10px;" colspan="4">结算列表
					<a href="index.php?item-app-cart" class="why-btn-big-green pull-right">修改购物车</a>
				</td>
			</tr>
			<tr style="background:#f5f5f5">
				<th width="10%"></th><th width="50%">商品</th><th width="20%">金额数量</th><th width="20%">小计</th>
			</tr>
            {x2;eval: v:number = 0}
            {x2;eval: v:price = 0}
            {x2;eval: v:allprice = 0}
            {x2;tree:$scarts,cart,cid}
            {x2;tree:v:cart,ct,ctid}
            {x2;if:v:ct['cartstatus']}
            {x2;eval: v:number = v:number + v:ct['number']}
            {x2;eval: v:price = v:price + v:ct['itemprice']*v:ct['number']}
            {x2;eval: v:allprice = v:allprice + v:ct['itemprice']*v:ct['number']}
			<tr class="info">
				<td valign="top" class="border-b">
					<img src="{x2;v:ct['itemthumb']}" height="55" width="55"/>
				</td>
				<td style="text-align:left;" valign="top" class="border-b">
					<p style="color:#333;">
						{x2;v:ct['goodstitle']}
                        {x2;tree:$mfields[$categories[v:ct['goodscatid']]['catmoduleid']],field,fid}
                        {x2;if:v:field['fieldsystem']}
                        {x2;v:field['fieldtitle']} : {x2;v:ct[v:field['field']]}&nbsp;&nbsp;
                        {x2;endif}
                        {x2;endtree}
						<!--
						单位运费：&yen;{x2;v:ct['goodsfee']}-->
					</p>
				</td>
				<td valign="top" class="border-b">&yen;{x2;v:ct['itemprice']} * {x2;v:ct['number']}</td>
				<td valign="top" class="border-b"><label class="color-red">&yen; {x2;eval: echo v:ct['itemprice']*v:ct['number']}</label></td>
			</tr>
            {x2;endif}
            {x2;endtree}
            {x2;endtree}


			<tr class="total" style="background: #f5f5f5"><td style="text-align: left;padding:5px 10px;" colspan="4">收货地址</td></tr>

			<tr class="info attr">
				<td colspan="4" style="text-align:left;" id="setaddress">
			                    {x2;if:$addressinfo['data']}
			                    {x2;eval:v:cadd = current($addressinfo['data'])}
			
			
					<input type="hidden" name="args[orderaddress]" id="orderaddress" value="{x2;v:cadd['addressid']}"/>
			                    {x2;tree:$addressinfo['data'],address,aid}
					<div class="di-style" style="margin-bottom:10px;">
						<span{x2;if:v:aid == 1} class="active"{x2;endif} data-value="{x2;v:address['addressid']}" data-element="orderaddress" onclick="javascript:$('#newaddress').addClass('hide');">{x2;v:address['receiver']}&nbsp;&nbsp;{x2;v:address['phone']}<em></em>&nbsp;&nbsp;收货地址：{x2;v:address['province']}&nbsp;{x2;v:address['city']}&nbsp;{x2;v:address['area']}&nbsp;{x2;v:address['addressinfo']}</span>
						<a class="btn confirm closes" href="index.php?item-app-order-deladdress&addressid={x2;v:address['addressid']}">删除</a>
					</div>
			                    {x2;endtree}
			
			
					<div class="di-style" style="margin:0;">
			                    	<h4 style="margin: 20px 0; font-size:14px;cursor:pointer;" onclick="javascript:$('#newaddress').removeClass('hide').html();">创建并使用新地址</h4>
					</div>
					<div class="add-address hide form-inline" id="newaddress" style="padding-left: 10px;">
						<p><span style="width: 112px; text-align: right; border: none;">收货人：</span><input type="text"  class="form-control addaddress" name="ads[receiver]" style="height:32px;"/></p>
						<p><span style="width: 112px; text-align: right; border: none;">所在地区：</span>
							<select id="provinces"  target="cities" autoload="index.php?core-api-index-getProvince" class="form-control autoloaditem combox it-select" style="width:120px;margin-right:5px;height:32px;" name="ads[provinceid]"  refUrl="index.php?core-api-index-getcity&parent={value}">
								<option value="">选择所在地区</option>
							</select>
							<select id="cities" target="areas" class="form-control combox it-select" style="width:120px;margin-right:5px;height:32px;" name="ads[cityid]"  refUrl="index.php?core-api-index-getarea&parent={value}">
								<option value="">选择所在城市</option>
							</select>
							<select id="areas" current="{x2;$areaid}"  class="form-control it-select 110" style="width:120px;margin-right:5px;height:32px;" name="ads[areaid]">
								<option value="">选择所在县区</option>
							</select>
						</p>
						<p><span style="width: 112px; text-align: right; border: none;">详细地址：</span>
							<input type="text" class="form-control aa-ipt-text addaddress"  name="ads[addressinfo]" style="height:32px;"/>
						</p>
						<p><span style="width: 112px; text-align: right; border: none;">邮政编码：</span>
							<input type="text" class="form-control aa-ipt-text addaddress" name="ads[zipcode]" style="height:32px;"/>
						</p>
						<p><span style="width: 112px; text-align: right; border: none;">电话：</span><input type="text" id="phone" class="form-control aa-ipt-text addaddress" name="ads[phone]" style="height:32px;"/></p>
						<p><button type="button" class="why-btn-big-green" onclick="javascript:$('#form1').attr('action','index.php?item-app-order-addnewaddress');$('#form1').attr('direct','setaddress');$('#form1').submit();">保存</button></p>
					</div>
			                    {x2;else}
					<div class="di-style" style="margin:0;">
						<h4 class="dis-select" onclick="javascript:$('#newaddress').removeClass('hide');">创建并使用新地址</h4>
					</div>
					<div class="add-address form-inline" id="newaddress" style="padding-left:10px;">
						<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">收货人：</span><input type="text"  class="form-control aa-ipt-text addaddress" name="ads[receiver]"/></p>
						<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">所在地区：</span>
							<select id="provinces" target="cities" autoload="index.php?core-api-index-getProvince" class="form-control autoloaditem combox it-select" style="width:120px;" name="ads[provinceid]"  refUrl="index.php?core-api-index-getcity&parent={value}">
								<option value="">选择所在地区</option>
							</select>
							<select id="cities" target="areas" class="form-control combox it-select" style="width:120px;" name="ads[cityid]"  refUrl="index.php?core-api-index-getarea&parent={value}">
								<option value="">选择所在城市</option>
							</select>
							<select id="areas" current="{x2;$areaid}"  class="form-control it-select 110" style="width:120px;" name="ads[areaid]">
								<option value="">选择所在县区</option>
							</select>
						</p>
						<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">详细地址：</span>
							<input type="text"  class="form-control aa-ipt-text addaddress" name="ads[addressinfo]"/>
						</p>
						<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">邮政编码：</span>
							<input type="text"  class="form-control aa-ipt-text addaddress" name="ads[zipcode]"/>
						</p>
						<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">电话：</span><input  type="text" class="form-control aa-ipt-text addaddress" name="ads[phone]"/></p>
						<p><button type="button" class="why-btn-big-green" onclick="javascript:$('#form1').attr('action','index.php?item-app-order-addnewaddress');$('#form1').attr('direct','setaddress');$('#form1').submit();">保存</button></p>
					</div>
			        {x2;endif}
				</td>
			</tr>
			<tr class="total" style="background: #f5f5f5"><td style="text-align: left;padding:5px 10px;" colspan="4">支付方式</td></tr>
			<tr class="info attr">
				<td style="text-align: left;" colspan="4">
					<span>货到付款<em></em></span>
				</td>
			</tr>
			<tr class="total" style="background: #f5f5f5"><td style="text-align: left;padding:5px 10px;" colspan="4">运费方式</td></tr>
			<tr class="info attr">
				<td style="text-align: left;" colspan="4">
					<span>到付<em></em></span>
				</td>
			</tr>

			<tr class="total" style="background: #f5f5f5"><td style="text-align: left;padding:5px 10px;" colspan="4">留言</td></tr>
			<tr class="info attr">
				<td style="text-align: left;" colspan="4">
					<textarea name="args[message]" id="" cols="50" rows="3"></textarea>
				</td>
			</tr>

			<tr class="total">
				<td style="text-align: right" colspan="4">
					<div>{x2;v:number}件商品金额总计：&yen;{x2;v:price}</div><br>
					<em class="clearfix"></em>
					<p>应付总额：<b class="color-red" style="font-size: 24px;">&yen;{x2;v:allprice}</b></p>
					<button class="why-btn-big-green" type="button" onclick="javascript:$('#form1').attr('action','index.php?item-app-order');$('#form1').submit();">确认下单</button>
					<input type="hidden" name="createorder" value="1"/>
					<input type="hidden" name="args[znumber]" value="{x2;v:number}"/>
				</td>
			</tr>
		</table>
	</form>
</div>
{x2;include:footer2}
<script>
	$(".di-style").on("mouseover",function () {
		$(this).children($(".closes")).show()
	})
	$(".di-style").on("mouseout",function () {
		$(".closes").hide()
	})
    $('.di-style').find('span').on('click',function(){
        var _this = $(this);
        _this.parents('.di-style').parent().find('span').removeClass('active');
        _this.addClass('active');
        if(_this.attr('data-element'))
        {
            $('#'+_this.attr('data-element')).val(_this.attr('data-value'));
        }
    });
</script>

</body>
