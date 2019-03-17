<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模型管理-修改</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <script src="app/core/styles/admin/js/jquery.min.js"></script>
    <script src="app/core/styles/admin/js/base.js"></script>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/goods/goods-index.css" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css" />

    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
    <script src="app/core/styles/js/jquery.min.js"></script>
    <script src="app/core/styles/js/jquery-ui.min.js"></script>
    <script src="app/core/styles/js/bootstrap.min.js"></script>
    <script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
    <script src="app/core/styles/js/plugin2.js"></script>

</head>
<body>
<header>{x2;include:nav2}</header>
<div class="goods" id="content">
    <div class="head">当前位置：<a href="index.php?item-master-module">模型管理</a>&nbsp;>&nbsp;模型修改</div>
    <div class="g-content">
        <form action="index.php?item-master-module-modify" method="post" class="form-horizontal">
            <fieldset>
                <div class="form-group">
                </div>
                <div class="form-group">
                    <label for="modulename" class="control-label col-sm-2">模型名称：</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" id="modulename" name="args[modulename]" value="{x2;$module['modulename']}"  needle="needle" msg="您必须输入英文品牌名称">
                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="modulename" class="control-label col-sm-2">模型描述：</label>
                    <div class="col-sm-9">
                        <textarea class="form-control" rows="7" name="args[moduledescribe]" id="moduledescribe">{x2;$module['moduledescribe']}</textarea>
                    </div>
                </div>
               
                <div class="form-group">
                    <label class="control-label col-sm-2" for="moduledescribe"></label>
                    <div class="col-sm-8">
                        <button class="btn btn-primary" type="submit" style="background-color:#009688;">提交</button>
                        <input type="hidden" name="moduleid" value="{x2;$module['moduleid']}"/>
                        <input type="hidden" name="modifymodule" value="1"/>
                        <input type="hidden" name="page" value="{x2;$page}"/>
                        {x2;tree:$search,arg,aid}
                        <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                        {x2;endtree}
                    </div>
                </div>
                
            </fieldset>
        </form>

        <div id="pages" style="text-align: center"></div>
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

</script>
</body>
</html>