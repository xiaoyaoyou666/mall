{x2;if:!$userhash}{x2;include:header}<body>{x2;include:nav}<div class="container-fluid">	<div class="row-fluid">		<div class="main">			<div class="col-xs-2" style="padding-top:10px;margin-bottom:0px;">				{x2;include:menu}			</div>			<div class="col-xs-10" id="datacontent">{x2;endif}				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">					<div class="col-xs-12">						<ol class="breadcrumb">							<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>							<li><a href="index.php?{x2;$_app}-master-orders">订单列表</a></li>							<li class="active">订单详情</li>						</ol>					</div>				</div>				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">					<h4 class="title" style="padding:10px;">						订单号：{x2;$order['ordersn']} 当前状态：{x2;$orderstatus[$order['orderstatus']]}					</h4>					<table class="table table-hover table-bordered">						<thead>							<tr class="info">								<th></th>								<th>商品</th>								<th width="120">数量</th>								<th width="200">小计（元）</th>							</tr>						</thead>						<tbody>							{x2;tree:$order['orderitems'],cart,cid}							<tr>								<td><a href="index.php?item-master-items-edit&goodsid={x2;v:cart['goodsid']}" target="_blank"><img src="{x2;v:cart['itemthumb']}" style="width:80px;"/></a></td>								<td>									{x2;v:cart['goodstitle']}									<span style="font-size:1rem;">									{x2;tree:$mfields[$categories[v:cart['goodscatid']]['catmoduleid']],field,fid}					            	{x2;if:v:field['fieldsystem']}					            	{x2;v:field['fieldtitle']}:{x2;v:cart[v:field['field']]}&nbsp;					            	{x2;endif}					            	{x2;endtree}					            	</span>					            </td>								<td>{x2;v:cart['number']}</td>								<td>{x2;eval: echo v:cart['number']*v:cart['itemprice']}</td>							</tr>							{x2;endtree}						</tbody>					</table>					<h4 class="text-right" style="padding:10px;">						订单折扣：{x2;if:$order['orderlevel'] == 1}无折扣{x2;else}{x2;$order['orderlevel']}{x2;endif}						订单总额：{x2;$order['orderprice']}&nbsp;&nbsp;						运费总额：{x2;$order['orderfee']}&nbsp;&nbsp;						{x2;if:($saler['usergroupid']) == 2 && ($saler['userid'] != 3)}						一代提成：{x2;$order['orderfirstprice']}&nbsp;&nbsp;						{x2;elseif:($saler['usergroupid']) == 3 && ($saler['userid'] != 3)}						二代提成：{x2;$order['ordersecondprice']}						{x2;endif}					</h4>				</div>				{x2;if:($saler['usergroupid'] == 2 || $saler['usergroupid'] == 3) && ($saler['userid'] != 3)}				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">					<h4 class="title" style="padding:10px;">						代理信息					</h4>					<p>						代理用户：{x2;$saler['username']} {x2;if:$saler['usergroupid'] == 3}上级代理：{x2;$upline['username']}{x2;endif}					</p>				</div>				{x2;endif}				{x2;if:$order['orderbsinfo']}				{x2;eval:$order['orderbsinfo'] = unserialize($order['orderbsinfo']);}				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">					<h4 class="title" style="padding:10px;">						保税信息					</h4>					<p>						姓名：{x2;$order['orderbsinfo']['name']}						<br />身份证号： {x2;$order['orderbsinfo']['passport']}					</p>				</div>				{x2;endif}				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">					<h4 class="title" style="padding:10px;">						收货信息					</h4>					<p>						地址：{x2;$order['orderaddress']['province']}{x2;$order['orderaddress']['city']}{x2;$order['orderaddress']['area']}{x2;$order['orderaddress']['addressinfo']} <br />姓名： {x2;$order['orderaddress']['receiver']} <br />电话： {x2;$order['orderaddress']['phone']}					</p>				</div>				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">					<h4 class="title" style="padding:10px;">						物流与发货 &nbsp; 用户要求的快递公司是：{x2;$order['orderuserposter']}					</h4>					{x2;if:$order['orderstatus'] == 1}					<h4 style="padding:10px;">						订单未支付					</h4>					{x2;elseif:$order['orderstatus'] == 2}					<form action="index.php?bank-master-orders-sendorder" method="post">						<div class="form-group">				            <div class="controls form-inline">					            <label class="radio-inline">					            	物流公司：<input type="text" class="form-control" name="postname" size="15" value="{x2;$order['orderpost']['postname']}">					            </label>					            <label class="radio-inline">					            	运单号：<input type="text" class="form-control" name="postorder" size="15" value="{x2;$order['orderpost']['postorder']}">					            </label>					            <label class="radio-inline">					            	应付运费：<input type="text" class="form-control" name="orderfactfee" value="{x2;$order['orderfactfee']}" size="15">					            </label>					            <label class="radio-inline">					            	<button class="btn btn-primary" type="submit">发货</button>					            	<input type="hidden" name="ordersn" value="{x2;$order['ordersn']}"/>					            </label>					        </div>				        </div>					</form>					{x2;elseif:$order['orderstatus'] == 99}					<h4 style="padding:10px;">						订单已经撤销了					</h4>					{x2;else}					<h4 style="padding:10px;">						物流公司：{x2;$order['orderpost']['postname']} &nbsp;&nbsp; 运单号：{x2;$order['orderpost']['postorder']} &nbsp;&nbsp; 应付运费：{x2;$order['orderfactfee']}					</h4>					{x2;endif}				</div>				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">					<h4 class="title" style="padding:10px;">						更改状态					</h4>					<form action="index.php?bank-master-orders-modifyorder" method="post">						<div class="form-group">				            <div class="controls form-inline">					            <label class="radio-inline">					            	<input type="radio" class="form-control" name="orderstatus" value="1"> 未支付					            </label>					            <label class="radio-inline">					            	<input type="radio" class="form-control" name="orderstatus" value="2"> 待发货					            </label>					            <label class="radio-inline">					            	<input type="radio" class="form-control" name="orderstatus" value="3"> 已发货					            </label>					            <label class="radio-inline">					            	<input type="radio" class="form-control" name="orderstatus" value="4"> 已完成					            </label>					            <label class="radio-inline">					            	<input type="radio" class="form-control" name="orderstatus" value="99"> 已取消					            </label>					            <label class="radio-inline">					            	更改原因：<input type="text" class="form-control" name="reason">					            </label>					            <label class="radio-inline">					            	<button class="btn btn-primary" type="submit">更改</button>					            	<input type="hidden" name="ordersn" value="{x2;$order['ordersn']}"/>					            </label>					        </div>				        </div>					</form>				</div>				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">					<h4 class="title" style="padding:10px;">						更改状态记录					</h4>					<table class="table table-hover table-bordered">						<thead>							<tr class="info">								<th>操作原因</th>								<th width="120">原状态</th>								<th width="120">修改后状态</th>								<th width="240">操作人</th>								<th width="200">操作时间</th>							</tr>						</thead>						<tbody>						{x2;tree:$order['orderfaq'],faq,fid}							<tr>								<td>{x2;v:faq['reason']}</td>								<td>{x2;$orderstatus[v:faq['prestatus']]}</td>								<td>{x2;$orderstatus[v:faq['status']]}</td>								<td>{x2;v:faq['username']}</td>								<td>{x2;date:v:faq['time'],'Y-m-d H:i:s'}</td>							</tr>						{x2;endtree}						</tbody>					</table>				</div>			</div>{x2;if:!$userhash}		</div>	</div></div>{x2;include:footer}</body></html>{x2;endif}