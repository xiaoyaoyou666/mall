<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新增推荐位</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="app/core/styles/admin/bootstrap.css" />
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/friendlink.css" />
    <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">
    <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/layui/layui.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
</head>
<body>
<header>{x2;include:nav2}</header>
<div class="goods" id="content">
    <div class="g-content f-content">
        <div class="head">当前位置：<a href="index.php?user-master-user-position">推荐位管理</a>&nbsp;>&nbsp;添加推荐位</div>
        <div class="addLink-content">
            <div class="nb">
                <form class="layui-form" action="index.php?user-master-user-positionadd" method="post">
                    <input type="hidden" value="1" name="submit">
                <div class="row layui-form-item">
                    <label class="layui-form-label" style="width: 130px;">推荐位名称：</label>
                    <div class="layui-input-block" style="float: left;margin-left: -9px;">
                        <input type="text" name="name" autocomplete="off" class="layui-input" id="name">
                    </div>
                </div>
                <div class="row layui-form-item">
                    <label class="layui-form-label" style="width: 130px;">描述：</label>
                    <div class="layui-input-block" style="float: left;margin-left: -9px;">
                        <input type="text" name="desc" autocomplete="off" class="layui-input" id="desc">
                    </div>
                </div>
                <div class="row layui-form-item">
                    <div class="layui-input-block tx mt100">
                        <button class="layui-btn  layui-btn-sm" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn  layui-btn-sm">重置</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            var name = $("#name").val();
            var desc = $("#desc").val();
            if(name == ''){
                layer.msg('请填写推荐位名称');
                return false;
            }
            if(desc == ''){
                layer.msg('请填写描述');
                return false;
            }
        });
    });
</script>
</body>
</html>