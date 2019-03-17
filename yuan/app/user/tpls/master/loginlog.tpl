<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>日志操作</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/goods/goods-index.css" />
    <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">
    <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
    <style type="text/css">
    	table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
    </style>
</head>
<body>
<header>{x2;include:nav2}</header>
<div class="goods" id="content">
    <div class="head">当前位置：<a href="index.php?user-master-user">供应商管理</a>&nbsp;>&nbsp;登录日志</div>
    <div class="g-content">
        <table class="layui-table goods-table" lay-even lay-skin="line" lay-size="lg">
            <thead>
            <tr>
                <th>ID</th>
                <th>用户ID</th>
                <th>用户名</th>
                <th>所属企业名称</th>
                <th>模块</th>
                <th>最后登录时间</th>
            </tr>
            </thead>
            <tbody>
            {x2;tree:$data['data'],user,uid}
            <tr>
                <td>{x2;v:user['id']}</td>
                <td>{x2;v:user['userid']}</td>
                <td>{x2;v:user['username']}</td>
                <td>{x2;v:user['company_name']}</td>
                <td>{x2;v:user['type']}</td>
                <td>{x2;date:v:user['actiontime'],'Y-m-d'}</td>
            </tr>
            {x2;endtree}
            </tbody>
        </table>
        <ul class="pagination pull-right">
            {x2;$data['pages']}
        </ul>
    </div>

</div>
<script type="text/javascript" src="layui/layui.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form(); //只有执行了这一步，部分表单元素才会修饰成功
    });
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#startaddtime' //指定元素
        });
        //执行一个laydate实例
        laydate.render({
            elem: '#endaddtime' //指定元素
        });

    });

    layui.use('laypage', function(){
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'pages' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: 50 //数据总数，从服务端得到
        });
    });
</script>
</body>
</html>