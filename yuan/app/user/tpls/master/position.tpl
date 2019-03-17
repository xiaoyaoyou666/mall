<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>推荐位管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <link rel="stylesheet" href="app/core/styles/admin/bootstrap.css" />
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/friendlink.css" />
    <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">
    <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/layui/layui.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
    <style type="text/css">
    	table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
    </style>
</head>
<body>
<header>{x2;include:nav2}</header>
<div class="goods" id="content">
    <div class="g-content">
        <div class="head">当前位置：<a href="index.php?user-master-user">供应商管理</a>&nbsp;>&nbsp;推荐位管理</div>
        <div class="add-link"><a style="padding:0 10px" class="layui-btn  layui-btn-sm" href="index.php?user-master-user-positionadd"><i class="layui-icon">&#xe654;</i> 新增</a></div>
        <table class="layui-table goods-table" lay-even lay-size="lg" id="friendLinkTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>推荐位名称</th>
                    <th>推荐位描述</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
            {x2;tree:$data['data'],dd,uid}
                <tr>
                    <td>{x2;v:dd['posid']}</td>
                    <td>{x2;v:dd['posname']}</td>
                    <td>{x2;v:dd['descs']}</td>
                    <td>
                        <a href="index.php?user-master-user-poscontentset&posid={x2;v:dd['posid']}" class="layui-btn layui-btn-xs layui-btn-radius"><i class="layui-icon ">&#xe6c6;</i>内容管理</a>
                    </td>
                </tr>
            {x2;endtree}
            </tbody>
        </table>
        <ul class="pagination pull-right">
            {x2;$data['pages']}
        </ul>
    </div>
</div>

</body>
</html>