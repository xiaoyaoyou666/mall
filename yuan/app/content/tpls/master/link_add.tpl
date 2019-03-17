<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新增友情链接</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <script src="app/core/styles/admin/js/jquery.min.js"></script>
	<script src="app/core/styles/admin/js/base.js"></script>
    <link rel="stylesheet" href="app/core/styles/admin/index.css">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/goods/goods-index.css" />
    <link rel="stylesheet" href="app/core/styles/admin/friendlink.css" />

    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap-treeview.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/peskin.css" />
    <!--[if lt IE 9]>
    <script src="app/core/styles/js/html5shiv.min.js"></script>
    <script src="app/core/styles/js/respond.min.js"></script>
    <![endif]-->
    <script src="app/core/styles/js/jquery.min.js"></script>
    <script src="app/core/styles/js/jquery-ui.min.js"></script>
    <script src="app/core/styles/js/bootstrap.min.js"></script>
    <script src="app/core/styles/js/bootstrap-datetimepicker.js"></script>
    <script src="app/core/styles/js/all.fine-uploader.min.js"></script>
    <script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
    <script src="app/core/styles/js/plugin.js"></script>
    <script src="app/core/styles/js/bootstrap-treeview.js"></script>
   
    <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
    <style>
        .inputdiv input[type='text']{
            width: 100% !important;
            height: auto !important;
        }
        .text-label{
            width: auto !important;
        }
         button{
            width: 115px;
         }
    </style>
</head>
<body>
<header>{x2;include:nav2}</header>
<div class="goods" id="content">
    <div class="g-content f-content">
        <div>
            <div class="head">当前位置：<a style="color: #0078AD;" href="index.php?content-master-link">友情链接管理</a>&nbsp;>&nbsp;新增友情链接</div>
        </div>
        <div class="addLink-content">
            <div class="nb">
                <form class="layui-form" action="index.php?content-master-link-add" method="post">
                    <div class="layui-row layui-form-item">
                        <label class="layui-form-label text-label">企业名称：</label>
                        <div class="layui-input-block layui-col-md-1 inputdiv" style="float: left;margin-left: -9px;width: 300px;">
                            <input type="text" name="args[name]" autocomplete="off" class="form-control"/>
                        </div>
                    </div>
                    <div class="layui-row layui-form-item">
                        <label class="layui-form-label text-label">链接地址：</label>
                        <div class="layui-input-block layui-col-md-1 inputdiv" style="float: left;margin-left: -9px;width: 300px;">
                            <input type="text" name="args[url]" autocomplete="off" class="form-control"/>
                        </div>
                    </div>
                    <div class="row layui-form-item">
                        <div class="layui-input-block tx mt100">
                            <button class="layui-btn  layui-btn-sm" lay-submit lay-filter="formDemo" type="submit">立即提交</button>
                            <button type="reset" class="layui-btn  layui-btn-sm">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="app/core/styles/admin/layui/layui.js"></script>
<script>
    
</script>
</body>
</html>