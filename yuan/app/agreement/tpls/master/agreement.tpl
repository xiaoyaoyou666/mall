<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>协议列表</title>
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
			#status{background: #ffffff;border: 1px solid #cccccc;box-shadow: inset 0 2px 4px 0 rgba(0, 0, 0, 0.10);border-radius: 4px;width: 140px!important;padding-left: 10px;height: 30px;}
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
				<div class="head">当前位置：<a style="color: #0078AD!important;" href="index.php?core-master-audit">协议管理</a>&nbsp;>&nbsp;协议列表</div>			
				<form action="index.php?core-master-audit" method="post">
					<div class="input_k" style="padding-bottom: 10px;height: auto;">
						<ul style="clear: both;">
							<li><span>关键字：</span><input type="text" name="keyword" value="{x2;$keyword}" id="keyword"></li>
							<li><span>甲方：</span><input type="text" name="salername" value="{x2;$salername}" id="salername"></li>
							<li><span>乙方：</span><input type="text" name="username" value="{x2;$username}" id="username"></li> 
							<li><span>有效期至：</span><input type="text" name="endtime" value="{x2;$endtime}" id="test1"></li>
							<li>
						<span>状态：</span>
						<select name="status" lay-verify="required" id="status">
                                 <option value="">请选择</option>
                                 <option value="1" {x2;if:$status== 1}
                                        selected{x2;endif}>
                                    未生效
                                </option>
                                <option value="2" {x2;if:$status== 2}
                                        selected{x2;endif}>
                                    待生效
                                </option>

                                <option value="3" {x2;if:$status== 3}
                                        selected{x2;endif}>
                                    生效
                                </option>
                                <option value="4" {x2;if:$status== 4}
                                        selected{x2;endif}>
                                    已失效
                                </option>
                           </select>

							</li>
						
						</ul>
						<div style="clear: both;"></div>
						<ul>
						<li><span>上传时间：</span><input type="text" name="addtime" value="{x2;$addtime}" id="test2"></li>
						<li style="float: right;margin-right: 54px;">
							<button style="padding:0 10px;margin-left: 0px;" class="btn  layui-btn  layui-btn-sm" type="button" onclick="doSearch()">查询</button>
							<button style="padding:0 10px;margin-left: 0px;" class="btn  layui-btn  layui-btn-sm" type="button" onclick="export_agreement()">导出</button>
						</li>						
					</ul>
					<div style="clear: both;"></div>
					</div>
				</form>
				
				<form class="rome">
					
						<!--表格-->
						<table class="layui-table layui-table_s qx_table" lay-size="sm" id="ta">
							<colgroup>
								<col width="30">
								<col>
							</colgroup>
							<thead>
								<tr>
									<th width="10%">ID</th>
									<th width="20%">协议名称</th>
									<th width="15%">甲方</th>
									<th width="15%">乙方</th>
									<th width="6%">有效期至</th>
									<th width="6%">上传时间</th>
									<th width="5%">状态</th>
									<th width="18%">操作</th>
								</tr>
							</thead>
							<tbody>
								<!--数据事需要后台循环显示的-->
								{x2;tree:$agreementarr['data'],agreement,aid}
								<tr>
									
									<td style="mso-number-format:'\@';">{x2;v:agreement['agreementid']}</td>
									<td>{x2;v:agreement['filename']}</td>
									<td>{x2;v:agreement['salername']}</td>
									<td>{x2;v:agreement['username']}</td>
									<td>{x2;date:v:agreement['endtime'],'Y-m-d'}</td>
									<td>{x2;date:v:agreement['addtime'],'Y-m-d H:i'}</td>
									<td>{x2;$xieyistatus[v:agreement['status']]}</td>
									<td>
									<a href="index.php?user-company-agreement-agreementInfo&agreementid={x2;v:agreement['agreementid']}" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal"><i class="layui-icon ">&#xe62d;</i>详情 </a>

									<a href="index.php?agreement-master-agreement-agreementJournal&agreementid={x2;v:agreement['agreementid']}" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal"><i class="layui-icon ">&#xe62d;</i>日志</a>

									{x2;if:v:agreement['status']==3}
									<a href="index.php?agreement-master-agreement-modifyAgreementApply&agreementid={x2;v:agreement['agreementid']}&type=3&applyid={x2;v:agreement['applyid']}" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal shixiao"><i class="layui-icon ">&#xe62d;</i>失效</a>
									{x2;endif}

									{x2;if:v:agreement['status']==4}
									<a type="button" href="index.php?user-company-agreement-agreementDelete&agreementid={x2;v:agreement['agreementid']}" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger deluser confirm" ><i class="layui-icon ">&#xe640;</i>删除</a>
									{x2;endif}


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
/**
 * [doSearch 搜索方法]
 * @Author   Zhangjianchao
 * @DateTime 2018-08-15
 * @return   {[type]}      [description]
 */
function doSearch(){
    var keyword = $("#keyword").val();
   	var status = $("#status").val();
    var salername = $("#salername").val();//甲方
   	var username = $("#username").val();//乙方
    var enteringTime = $("#test1").val();//有效期至
    var upfileTRime = $("#test2").val();//上传时间*/
    //alert(upfileTRime);
    var url = 'index.php?agreement-master-agreement-agreement';
    if (keyword != '') {
        url += '&keyword=' + keyword;
    }
    if (status != '') {
        url += '&status=' + status;
    }
    if (salername != '') {
        url += '&salername=' + salername;
    } 

   	if (username != '') {
        url += '&username=' + username;
    }
   
    if (enteringTime != '') {
        url += '&endtime=' + enteringTime;
    }
    if (upfileTRime != '') {
        url += '&addtime=' + upfileTRime;
    }
    window.location.href = url;
}

/**
 * [exportReport 导出搜索条件下excel文档方法]
 * @Author   Zhangjianchao
 * @DateTime 2018-08-15
 * @return   {[type]}      [description]
 */

function export_agreement(){
    var keyword = $("#keyword").val();
   	var status = $("#status").val();
    var salername = $("#salername").val();//甲方
   	var username = $("#username").val();//乙方
    var enteringTime = $("#test1").val();//有效期至
    var upfileTRime = $("#test2").val();//上传时间*/
    var url = 'index.php?agreement-master-agreement-export_agreement';
    if (keyword != '') {
        url += '&keyword=' + keyword;
    }
    if (status != '') {
        url += '&status=' + status;
    }
    if (salername != '') {
        url += '&salername=' + salername;
    } 

   	if (username != '') {
        url += '&username=' + username;
    }
   
    if (enteringTime != '') {
        url += '&endtime=' + enteringTime;
    }
    if (upfileTRime != '') {
        url += '&addtime=' + upfileTime;
    }
    window.location.href = url;
}

</script>		
		   
<script type="text/javascript" src="app/core/styles/js/backEnd/orderList.js">
	
</script>
  </body>
</html>