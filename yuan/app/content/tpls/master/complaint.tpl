<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <title>投诉反馈</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="app/core/styles/admin/js/base.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
     
    <link rel="stylesheet" type="text/css" href="app/core/styles/admin/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">
    <link rel="stylesheet" href="app/core/styles/admin/friendlink.css" />
    <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
    <script src="app/core/styles/js/plugin.js"></script>
    <!---->
     <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>

	<style type="text/css">
		table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
	</style>


</head>
<body>
<header>
{x2;include:nav2}
</header>
<div class="goods" id="content">
    <div class="g-content">
         <div class="head">当前位置：<a href="index.php?content-master-complaint">系统管理</a>&nbsp;>&nbsp;投诉反馈</div>
        <table class="layui-table goods-table " lay-even  id="friendLinkTable">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>用户ID</th>
                    <th>用户名</th>
                    <th>联系方式</th>
                    <th>所属企业名称</th>
                    <th>订单号</th>
                    <th>投诉名称</th>
                    <th>投诉内容</th>
                </tr>
            </thead>
            <tbody>
                {x2;tree:$complaint['data'],complaint,id}
                    <tr>
                        <td>{x2;v:complaint['id']}</td>
                        <td>{x2;v:complaint['userid']}</td>
                        <td>{x2;v:complaint['username']}</td>
                        <td>{x2;v:complaint['phone']}</td>
                        <td>{x2;v:complaint['enterprise_name']}</td>
                        <td ><a href="index.php?user-company-orders-orderdetail&ordertype=1&sn={x2;v:complaint['ordersn']}"  style="color:blue ">{x2;v:complaint['ordersn']}</a></td>
                        <td>{x2;v:complaint['complaint_name']}</td>
                        <td>{x2;v:complaint['complaint_content']}</td>
                    </tr>
                {x2;endtree}
            </tbody>
        </table>
        <ul class="pagination pagination-right" style="float: right">
            {x2;$complaint['pages']}
        </ul>
        <div id="pages" style="text-align: center"></div>
    </div>
</div>




<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
     //-------------改变显示状态-------------
    function changeTableVal(id_value,obj)
    {
        //alert(aaa);
        var src = "";
        if($(obj).attr('src').indexOf("cancel.png") > 0 )
        {          
            src = 'app/core/styles/images/yes.png';
            var value = 1;  
        }else{                    
                src = 'app/core/styles/images/cancel.png';
                var value = 0;
        }                                                 
        $.ajax({
            url:'index.php?content-master-link-updateStatus&id_value='+id_value+'&value='+value,
            dataType:'JSON',        
            success: function(data){
                if(data.statusCode == 200){
                    $(obj).attr('src',src);
                    return false;
                }else{
                    alert('失败了');
                }                                   
                          
            }
        });     
    }

</script>
<script type="text/javascript" src="app/core/styles/js/backEnd/orderList.js">
	
</script>
</body>
</html>