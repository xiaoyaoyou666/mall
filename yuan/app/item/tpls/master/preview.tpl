<!DOCTYPE html>
<html>

<head>
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <title>模型管理</title>
    <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
    <script src="app/core/styles/js/jquery.min.js"></script>
    <script src="app/core/styles/admin/layui/layui.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">
    <style>
        label{
            width: 100px!important;
        }
        input{
            width:400px!important;
            display:inline!important;
            margin-right:10px;
        }
    </style>
</head>

<body>
<header>
    {x2;include:nav2}
</header>
<div class="layui-row" id="content">
    <div class="head">当前位置：<a style="color: #0078AD;" href="index.php?item-master-module">模型管理</a>&nbsp;>&nbsp;模型预览</div>
    <div style="padding:20px;width:760px;position: relative;left:50%;margin-left:-380px;">
       
        <form class="layui-form" method="post" style="margin-top: 20px;">
            {x2;tree:$forms,form,fid}
            <div class="layui-form-item">
                <label class="layui-form-label">{x2;v:form['title']}</label>
                <div class="layui-input-block">
                    {x2;v:form['html']}
                </div>
            </div>
            {x2;endtree}
        </form>
    </div>
     <lable class="layui-form-label" style="width:auto;margin-top:-5px;margin-left: 560px;">
            <a class="layui-btn" href="index.php?item-master-module">模型列表</a>
            <a class="layui-btn" href="index.php?item-master-module-fields&moduleid={x2;$module['moduleid']}">字段管理</a>
        </lable>
</div>
</body>




<script>
    $('#tologin').on('click',function(){

        var enter = $('#enter').val();
        var add = $('#add').val();
        var need = $('#need').val();
        var amount = $('#amount').val();


        $.ajax({
            type:'get',
            url: 'index.php?content-master-statistics-update&en='+enter+'&ad='+add+'&ne='+need+'&am='+amount,
            dataType:'JSON',
            async:true,
            success:function(res){
                if(res.statusCode == 200){

                    window.location.href = 'index.php?content-master-statistics';
                    return false;
                }else{
                    alert('失败了');
                }
            },
            error: function(e){
                console.log(e);
            }
        })
    })

</script>

</html>