<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <title>友情链接</title>
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
        <div class="head">当前位置：<a style="color: #0078AD;" href="index.php?content-master-link">系统管理</a>&nbsp;>&nbsp;友情链接管理</div>
        <div class="add-link"><a class="layui-btn  layui-btn-sm" style="padding:0 10px" href="index.php?content-master-link-add"><i class="layui-icon">&#xe654;</i> 新增</a></div>
        <table class="layui-table goods-table" lay-even  id="friendLinkTable">
            <thead>
                <tr>
                    <th>序号</th>
                    <th>名称</th>
                    <th>链接</th>
                    <th>添加时间</th>
                    <th>点击数</th>
                    <th>可见否</th>

                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                {x2;tree:$links['data'],link,lid}
                    <tr>
                        <td>{x2;v:link['linkid']}</td>
                        <td>{x2;v:link['name']}</td>
                        <td>{x2;v:link['url']}</td>
                        <td>{x2;date:v:link['addtime'],'Y-m-d'}</td>
                        <td>{x2;v:link['click']}</td>
                        <td>
                            <img width="20" height="20" src="app/core/styles/images/{x2;if:v:link['status']}yes.png{x2;else}cancel.png{x2;endif}" onclick="changeTableVal('{x2;v:link[linkid]}',this)"/>
                                        
                        </td>
                        <td>
                        <a class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal" href="index.php?content-master-link-modifylink&linkid={x2;v:link['linkid']}"><i class="layui-icon">&#xe642;</i> 修改</a>

                        <a class="btn confirm layui-btn layui-btn-xs layui-btn-radius layui-btn-danger deluser" href="index.php?content-master-link-del&linkid={x2;v:link['linkid']}" title="删除"><em class="glyphicon glyphicon-remove"></em> 删除</a>
                        </td>
                    </tr>
                {x2;endtree}
            </tbody>
        </table>
        <div id="pages" style="text-align: center"></div>
        <div style="float: right">
                    <ul class="pagination" style="margin:10px 0 50px 0;">
                      {x2;$links['pages']}
                    </ul>
                </div>
                <div style="clear:both"></div>
    </div>
</div>




<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="app/core/styles/js/backEnd/orderList.js"></script>
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
</body>
</html>