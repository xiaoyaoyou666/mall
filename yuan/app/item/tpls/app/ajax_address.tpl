{x2;if:$addressinfo['data']}
{x2;eval:v:cadd = current($addressinfo['data'])}
<input type="hidden" name="args[orderaddress]" id="orderaddress" value="{x2;v:cadd['addressid']}"/>
{x2;tree:$addressinfo['data'],address,aid}
<div class="di-style" style="margin:0;">
	<span{x2;if:v:aid == 1} class="dis-select"{x2;endif} data-value="{x2;v:address['addressid']}" data-element="orderaddress" onclick="javascript:$('#newaddress').addClass('hide');">{x2;v:address['receiver']}&nbsp;&nbsp;{x2;v:address['phone']}</span><i>{x2;v:address['province']}&nbsp;{x2;v:address['city']}&nbsp;{x2;v:address['area']}&nbsp;{x2;v:address['addressinfo']}</i>
</div>
{x2;endtree}
<div class="di-style" style="margin:0;">
                    <span onclick="javascript:$('#newaddress').removeClass('hide');">创建并使用新地址</i>
</div>
<div class="add-address hide form-inline" id="newaddress">
	<p><span>收货人：</span><input type="text" class="form-control aa-ipt-text addaddress" name="ads[receiver]"/></p>
	<p><span>所在地区：</span>
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
	<p><span>详细地址：</span>
		<input type="text" class="form-control aa-ipt-text addaddress" name="ads[addressinfo]"/>
	</p>
	<p><span>邮政编码：</span>
		<input type="text" class="form-control aa-ipt-text addaddress" name="ads[zipcode]"/>
	</p>
	<p><span>电话：</span><input  type="text" class="form-control aa-ipt-text addaddress" name="ads[phone]"/></p>
	<p><button type="button" class="why-btn-big-green" onclick="javascript:$('#form1').attr('action','index.php?item-app-order-addnewaddress');$('#form1').attr('direct','setaddress');$('#form1').submit();">保存</button></p>
</div>
{x2;else}
<input type="hidden" name="" value=""/>
<div class="di-style" style="margin:0;">
                    <span class="dis-select" onclick="javascript:$('#newaddress').removeClass('hide');">创建并使用新地址</i>
</div>
<div class="add-address form-inline" id="newaddress">
	<p><span>收货人：</span><input type="text" class="form-control aa-ipt-text addaddress" name="ads[receiver]"/></p>
	<p><span>所在地区：</span>
		<select id="provinces"  target="cities" autoload="index.php?core-api-index-getProvince" class="form-control autoloaditem combox it-select" style="width:120px;" name="ads[provinceid]"  refUrl="index.php?core-api-index-getcity&parent={value}">
			<option value="">选择所在地区</option>
		</select>
		<select id="cities" target="areas" class="form-control combox it-select" style="width:120px;" name="ads[cityid]"  refUrl="index.php?core-api-index-getarea&parent={value}">
			<option value="">选择所在城市</option>
		</select>
		<select id="areas" current="{x2;$areaid}"  class="form-control it-select 110" style="width:120px;" name="ads[areaid]">
			<option value="">选择所在县区</option>
		</select>
	</p>
	<p><span>详细地址：</span>
		<input type="text" class="form-control aa-ipt-text addaddress" name="ads[addressinfo]"/>
	</p>
	<p><span>邮政编码：</span>
		<input type="text" class="form-control aa-ipt-text addaddress" name="ads[zipcode]"/>
	</p>
	<p><span>电话：</span><input  type="text" class="form-control aa-ipt-text addaddress" name="ads[phone]"/></p>
	<p><button type="button" class="why-btn-big-green" onclick="javascript:$('#form1').attr('action','index.php?item-app-order-addnewaddress');$('#form1').attr('direct','setaddress');$('#form1').submit();">保存</button></p>
</div>
{x2;endif}