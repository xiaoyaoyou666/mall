<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>操作日志</title>
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
				<div class="head">当前位置：<a style="color: #0078AD!important;" href="index.php?agreement-master-agreement-agreement">协议管理</a>&nbsp;>&nbsp;操作申请列表</div>
				<form class="rome">
					
						<!--表格-->
						<table class="layui-table layui-table_s qx_table" lay-size="sm" id="ta">
							
							<thead>
								<tr>
									
									<th>协议ID</th>
									<th>用户ID</th>
									<th>操作类型</th>
									<th>字段</th>
									<th>值</th>
                                    <th>操作时间</th>
								</tr>
							</thead>
							<tbody>
								<!--数据事需要后台循环显示的-->
								{x2;tree:$agreementLogArr['data'],agreement,aid}
								<tr>
									<td>{x2;v:agreement['agreementid']}</td>
                                    <td>{x2;v:agreement['userid']}</td>
                                    <td>{x2;v:agreement['operation']}</td>
                                    <td>{x2;v:agreement['modifiess']}</td>
                                    <td>{x2;v:agreement['value']}</td>
									<td>{x2;date:v:agreement['addtime'],'Y-m-d H:i:s'}</td>
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