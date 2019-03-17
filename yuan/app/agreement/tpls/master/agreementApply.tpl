<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>操作申请列表</title>
        <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
	    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
	    <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
	    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
	    <link rel="stylesheet" href="app/core/styles/admin/index.css">
	    <script src="app/core/styles/admin/js/jquery.min.js"></script>
	    <script src="app/core/styles/admin/js/base.js"></script>
	    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>

	    
	    <script src="app/core/styles/admin/layui/layui.js"></script>
	    <script src="app/core/styles/js/jquery.min.js"></script>
	    <script src="app/core/styles/js/jquery-ui.min.js"></script>
	    <script src="app/core/styles/js/bootstrap.min.js"></script>
	    <script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
	    <script src="app/core/styles/js/plugin2.js"></script>

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

	  <div class="modal fade" tabindex="-1" role="dialog" id="cancelOrderModal" aria-labelledby="cancelOrderModal">
				    <div class="modal-dialog" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
				                </button>
				                <h4 class="modal-title">拒绝申请</h4>
				            </div>
				            <div id="cancelOrderSn"></div>
				            <div class="modal-body">
				                <textarea rows="10" cols="60" placeholder="请输入不通过的原因" class="cancelOrderReason"></textarea> 
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				                <button type="button" class="btn btn-primary" id="cancelButton">确定</button>
				            </div>

				        </div>
				    </div>
				</div>
		<div class="layui-row layui-rowabs" id="content">
			<div class="layui-col-sm12">
				<div class="head">当前位置：<a style="color: #0078AD!important;" href="index.php?core-master-audit">协议管理</a>&nbsp;>&nbsp;操作申请列表</div>
				<form class="rome">
					
						<!--表格-->
						<table class="layui-table layui-table_s qx_table" lay-size="sm" id="ta">
							
							<thead>
								<tr>
									<th>ID</th>
									<th>合同ID</th>
									<th>用户ID</th>
									<th>申请类型</th>
									<th>申请状态</th>
									<th>申请时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<!--数据事需要后台循环显示的-->
								{x2;tree:$agreementApplyList['data'],agreement,aid}
								<tr>
									<td>{x2;v:agreement['applyid']}</td>
									<td>{x2;v:agreement['agreementid']}</td>
									<td>{x2;v:agreement['userid']}</td>
									<td>{x2;$type[v:agreement['type']]}</td>
									<td>{x2;$lookstatus[v:agreement['status']]}</td>
									<td>{x2;date:v:agreement['addtime'],'Y-m-d H:i:s'}</td>
									<td>
									<a href="index.php?user-company-agreement-agreementInfo&agreementid={x2;v:agreement['agreementid']}" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal"><i class="layui-icon ">&#xe62d;</i>详情 </a>
									{x2;if:v:agreement['type']==1 && v:agreement['status']==2}
									<a href="index.php?agreement-master-agreement-modifyAgreementApply&agreementid={x2;v:agreement['agreementid']}&type=1&applyid={x2;v:agreement['applyid']}" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal shengxiao"><i class="layui-icon ">&#xe62d;</i>生效</a>
									{x2;elseif:v:agreement['type']==2 && v:agreement['status']==2}
									<a href="index.php?agreement-master-agreement-modifyAgreementApply&agreementid={x2;v:agreement['agreementid']}&type=2&applyid={x2;v:agreement['applyid']}" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal shixiao"><i class="layui-icon ">&#xe62d;</i>失效</a>
									{x2;endif}

									{x2;if:v:agreement['status']==2}
									<a href="#" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal" onclick="cacelOrder('{x2;v:agreement[agreementid]}','{x2;v:agreement[applyid]}')"><i class="layui-icon ">&#xe62d;</i>不通过</a>
									{x2;endif}

									</td>
								</tr>
								<!--分割-->
								{x2;endtree}
							</tbody>
						</table>
					    <div style="float: right">
		                    <ul class="pagination" style="margin:10px 0 50px 0;">
		                        {x2;$agreementApplyList['pages']}                 
		                    </ul>
		                </div>
                </form>


		</div>



 

<script>
	function exportReport(){
        var url = 'index.php?core-master-audit-export_goods'; 
        window.location.href = url;
    }

     function cacelOrder(orderid,applyid) {
        $.ajax({
            type: 'get',
            url: 'index.php?agreement-master-agreement-ajaxagreement&agreementid=' + orderid+'&applyid='+applyid,
            dataType: 'JSON',
            async: true,
            success: function (res) {
                if (res.statusCode == 201) {
                    $("#cancelOrderSn").html(res.data);
                } else {
                    var message = res.message;
                    return false;
                }
            },
            error: function (e) {
                console.log(e);
            }
        })
        $("#cancelOrderModal").modal();
    }

    $('#cancelButton').on('click', function () {
        var agreementid = $('#ordersn2').val();
        var applyid = $('#applyid').val();
        
        var cancelOrderReason = $('.cancelOrderReason').val();
        if (cancelOrderReason == '') {
            alert('请填写不通过的原因');
            $("#cancelOrderModal").modal();
            return false;
        }

        $.ajax({
            type: 'get',
            url: 'index.php?agreement-master-agreement-agreementcancel&agreementid=' + agreementid + '&reason=' + cancelOrderReason+'&applyid='+applyid,
            dataType: 'JSON',
            success: function (res) {
                if (res.statusCode == 200) {
                    $("#cancelOrderModal").modal('hide');
                    window.location.href = 'index.php?agreement-master-agreement-agreementApply';
                    return true;
                } else {
                    alert('失败了');
                }
            },
            error: function (e) {
                console.log(e);
            }
        })
    })
</script>		
		   
<script type="text/javascript" src="app/core/styles/js/backEnd/orderList.js">
	
</script>
  </body>
</html>