<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>订单列表</title>
		<link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico">
        <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
     	<script src="app/core/styles/js/bootstrap.min.js"></script>
		<script src="app/core/styles/admin/js/base.js"></script>
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/order_list.css" />
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="stylesheet" href="app/core/styles/admin/bootstrap.css" />
        <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
        <link rel="stylesheet" href="app/core/styles/admin/friendlink.css" />
        <link rel="stylesheet" href="app/core/styles/admin/indent.css" />
        <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
        <link rel="stylesheet" href="app/core/styles/admin/index.css">
        <script type="text/javascript" src="app/core/styles/admin/layui/layui.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
		<style>
			.modal-dialog {
				width: 500px!important;
			}
			#add {
				position: absolute;
				right: 10px;
				width: 100px;
				height: 50px;
				cursor: pointer;
			}
			#add i {
				margin-right: 5px;
			}
			.rome input{width: 14px!important;height: 14px!important;}
			.layui-rowabs a{color: #fff;}
			.order-status a{color: #666}
			.active_order{color: #009688!important;}
			/*.layui-table_s th,td{padding: 5px 2px !important;}*/
			.active_li{color: #009688!important;border-bottom: solid 2px #009688;color: #009688;}
			table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
		</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.order-status li').each(function(){
					if($($(this).find($("a")))[0].href==String(window.location)){
						$('#order-status li').removeClass("active");
						$(this).addClass('active_li').siblings().removeClass("active_li");
						$(this).find($("a")).addClass("active_order").parent().parent().siblings().find($("a")).removeClass("active_order");
					}	
				});
		})
	</script>
	<body>
		<header>{x2;include:nav2}</header>
		<div class="layui-row layui-rowabs" id="content">
			<div class="layui-col-sm12">
				<div class="head">当前位置：<a style="color: #0078AD!important;" href="index.php?core-master-audit">订单管理</a>&nbsp;>&nbsp;订单列表</div>
				<div class="order_lengs">此处的订单编号查询不受订单状态限制，历史订单列表只显示一个月前的订单</div>
				<div class="tab_list">
					<ul  class="order-status">
						<li class="active_li"><span><a class="active_order" href="index.php?core-master-audit">所有订单</a></span></li>
						<li><span><a href="index.php?core-master-audit&orderstatus=1">待卖家确认</a></span></li>
						<li><span><a href="index.php?core-master-audit&orderstatus=2">待卖家发货</a></span></a></li>
						<li><span><a href="index.php?core-master-audit&orderstatus=3">待买家收货</a></span></li>
						<li><span><a href="index.php?core-master-audit&orderstatus=4">已完成</span></a></li>
						<li><span><a href="index.php?core-master-audit&orderstatus=5">已退/换货</span></a></li>
						<li><span><a href="index.php?core-master-audit&orderstatus=99">交易关闭</a></span></li></a>
						<li><span><a href="index.php?core-master-audit&historyorder=1">历史订单</a></span></li>
					</ul>
				</div>
				<form action="index.php?core-master-audit" method="post">
					<div class="input_k">
						<ul>
							<li><span>订单编号：</span><input type="text" name="search[ordersn]" value="{x2;$search['ordersn']}"></li>
							<!--<li><span>用户名：</span><input type="text" name="search[orderaddress][receiver]" value="{x2;$search['orderaddress']['receiver']}"></li>-->
							<li><span>选择时间段：</span><input type="text" name="search[stime]" value="{x2;$search['stime']}" id="test1">&nbsp;&nbsp;一&nbsp;&nbsp;<input type="text" name="search[etime]" value="{x2;$search['etime']}" id="test2"></li>
						</ul>
						<ul >
						<li><span>买方：</span><input type="text" name="search[company_name]" value="{x2;$search['company_name']}"></li>
						<li><span>卖方：</span><input type="text" name="search[company_names]" value="{x2;$search[company_names]}"></li>
						<button style="padding:0 18px;" class="btn  layui-btn  layui-btn-sm" type="submit">查询</button>
					</ul>
					</div>
				</form>
				
				<form class="rome">
					<div style="height:50px;line-height:68px;padding-left:20px;">
						<label><span style="display: inline-block;margin-right: 30px;cursor: pointer;"><input style="float: left;margin-top: 27px;" type="radio" name="x" id="qx" value="全选" title="全选"><i style="padding-top: 10px;">&nbsp;&nbsp;&nbsp;全选</i></span></label>
						<label><span style="display: inline-block;margin-right: 30px;cursor: pointer;"><input style="float:left;margin-top: 27px;"  type="radio" name="x" id='fx' value="反选" title="反选"><i style="padding-top: 10px;">&nbsp;&nbsp;&nbsp;反选</i></span></label>
						<a id="btn_cores" class="layui-btn layui-btn-sm btn_core confirm"> 批量删除</a>
						
						<!---->
						<button class="layui-btn layui-btn-sm" style="float:right;margin-top: 10px;"><a href="">刷新</a></button>
						 <a style="float:right;margin-top: 10px;" download="i.png" class="btn  layui-btn  layui-btn-sm" type="button" href="javascript:exportReport()">导出</a>
					</div>
						<!--表格-->
						<table class="layui-table layui-table_s qx_table" lay-size="sm" id="ta">
							<colgroup>
								<col width="30">
								<col>
							</colgroup>
							<thead>
								<tr>
									<th><input id="checkall" onclick="selectAll()" type="checkbox"  class="checkall" target="delids" lay-skin="primary" > </th>
									<th>订单编号</th>
									<th>提交时间</th>
									<th>买方</th>
									<th>卖方</th>
									<th>商品名称</th>
									<th>是否异常</th>
									<th>订单总额(元)</th>
									<th>订单状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<!--数据事需要后台循环显示的-->
								{x2;tree:$orders['data'],order,oid}
								<tr {x2;if:v:order['status_qufen1'] != 0} style="color: #FF0000 {x2;endif}">
									<td><input type="checkbox" class="checkedres" name="delids[{x2;v:order['ordersn']}]" lay-skin="primary"> </td>
									<td style="mso-number-format:'\@';">{x2;v:order['ordersn']}</td>
									<td>{x2;date:v:order['ordercreatetime'],'Y-m-d H:i:s'}</td>
									<td>{x2;$users[v:order['orderuserid']]['company_name']}</td>
								<td>{x2;$users[v:order['ordersalerid']]['company_name']}</td>
									<td>{x2;v:order['orderitems'][0]['goodstitle']}</td>
									<td>
                                        {x2;if:v:order['status_qufen1'] == 0}正常{x2;elseif:v:order['status_qufen1'] == 1}订单失败{x2;else}入库失败{x2;endif}
                                    </td>
									<td>￥{x2;v:order['orderprice']}</td>
									<td>{x2;$orderstatus[v:order['orderstatus']]}</td>
									<td>
									<a href="index.php?core-master-audit-xqing&ordersn={x2;v:order['ordersn']}" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal"><i class="layui-icon ">&#xe62d;</i>查看详情 </a>
									</td>
								</tr>
								<!--分割-->
								{x2;endtree}
							</tbody>
						</table>
					    <div style="float: right">
		                    <ul class="pagination" style="margin:10px 0 50px 0;">
		                        {x2;$orders['pages']}                 
		                    </ul>
		                </div>
                </form>
		</div>
<script>
	function exportReport(){
        var url = 'index.php?core-master-audit-export_goods'; 
        window.location.href = url;
    }
</script>		
		   
<script type="text/javascript" src="app/core/styles/js/backEnd/orderList.js">
	
</script>
  </body>
</html>