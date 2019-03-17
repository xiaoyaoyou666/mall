<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品类目管理2-表格</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <script src="app/core/styles/admin/js/jquery.min.js"></script>
	<script src="app/core/styles/admin/js/base.js"></script>

    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>


    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/peskin.css" />
    <script src="app/core/styles/js/jquery.min.js"></script>
    <script src="app/core/styles/js/jquery-ui.min.js"></script>
    <script src="app/core/styles/js/bootstrap.min.js"></script>
    <script src="app/core/styles/js/bootstrap-datetimepicker.js"></script>
    <script src="app/core/styles/js/all.fine-uploader.min.js"></script>
    <script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
    <script src="app/core/styles/js/plugin.js"></script>

    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/goods/goods-index.css" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">

<style>
	table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
</style>
</head>
<body>
<header>{x2;include:nav2}</header>
<div class="goods" id="content">
	<div class="head">当前位置：<a style="color: #337ab7!important;" href="index.php?item-master-items">商品管理</a>&nbsp;>&nbsp;商品类目管理{x2;if:$grandpar}><a href="index.php?item-master-category&parent={x2;$grandpar[catparent]}">{x2;$grandpar['catname']}{x2;endif}{x2;if:$parent}><a href="index.php?item-master-category&parent={x2;$parentarr[catparent]}">{x2;$parentarr['catname']}</a>{x2;endif}</div>
    <a href="index.php?{x2;$_app}-master-category-add&parent={x2;$parent}" class="btn  pull-right layui-btn  layui-btn-sm" style="margin-bottom:10px;"><i class="fa fa-plus"></i> 新增分类</a>

    <div class="g-content">
        <table class="layui-table goods-table" lay-size="lg">
            <thead>
            <tr>
                <th><input type="checkbox" value="" id="allselectCheckbox"/></th>
                <th>序号</th>
                <th>类目名称</th>
                {x2;if:$parent}
                    <th>父级</th>
                {x2;else}
                    <th>级别</th>
                {x2;endif}

               <!--  <th>可见否</th> -->
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
                {x2;tree:$categorys['data'],category,cid}
                    <tr>
                        <td><input type="checkbox" class="gseled" name="delids[{x2;v:category['catid']}]"> </td>
                        <td>{x2;v:category['catid']}</td>
                        <td>{x2;v:category['catname']}</td>
                        <td>{x2;if:$parent}{x2;$categories[$parent]['catname']}{x2;else}一级分类{x2;endif}</td>
                        <!-- <td>
                        <img width="20" height="20" src="app/core/styles/images/{x2;if:v:category['catinmenu']}yes.png{x2;else}cancel.png{x2;endif}" onclick="changeTableVal('{x2;v:category[catid]}',this)"/>

                        </td> -->
                        <td><a class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal" href="index.php?{x2;$_app}-master-category-edit&page={x2;$page}&catid={x2;v:category['catid']}{x2;$u}"><i class="layui-icon">&#xe642;</i> 修改</a>

                        <a class="btn confirm layui-btn layui-btn-xs layui-btn-radius layui-btn-danger deluser" href="index.php?{x2;$_app}-master-category-del&catid={x2;v:category['catid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em> 删除</a>




                        <a class="layui-btn layui-btn-xs layui-btn-radius layui-btn-warm" href="index.php?item-master-category&parent={x2;v:category['catid']}"><i class="layui-icon">&#xe62d;</i>下级</a></td>
                    </tr>
                {x2;endtree}
            </tbody>
        </table>
        <div class="layui-form-item" style="margin-left: 50px;">
            <div class="layui-inline">
                <input type="checkbox" id="checkAllBox"/> &nbsp;&nbsp;全选
            </div>
            <div class="layui-inline">
                <button style="padding:0 18px" class="layui-btn layui-btn-primarylayui-btn  layui-btn-sm delete">删除</button>
            </div>
        </div>
        <div id="pages" style="text-align: center"></div>
    </div>
</div>
<script type="text/javascript" src="app/core/styles/admin/layui/layui.js"></script>
<script>
    $("#checkAllBox").on("click",function(){
        if($(this).is(":checked")){
            $("input[name='gseled'][type='checkbox']").prop("checked",true);
        }else{
            $("input[name='gseled'][type='checkbox']").prop("checked",false);
        }
    });
    $("#allselectCheckbox").on("click",function(){
        if($(this).is(":checked")){
            $("input[name='gseled'][type='checkbox']").prop("checked",true);
        }else{
            $("input[name='gseled'][type='checkbox']").prop("checked",false);
        }
    });


    // 批量删除
    $(".delete").on("click",function(){
         var isconfirm = confirm('确定要删除吗');
            if(isconfirm){
                var orderIds = getCheckedOrders();
                        $.ajax({
                            type:'get',
                            url: "index.php?item-master-category-Alldel&catid="+orderIds+"",
                            dataType:'JSON',
                            async:true,
                            success:function(res){
                                if(res.statusCode = 200){
                                    alert(res.message);
                                    window.location.reload();
                                    return false;
                                }else if(res.statusCode = 300){
                                    alert(res.message);
                                }else{
                                     return false;
                                }
                            }

                        })
                    }
    });

    function getCheckedOrders(){
            var checkeds = [];
            $("input.gseled").each(function(){
            if($(this).prop("checked")) {
                 checkeds.push($(this).closest("tr").find("td:eq(1)").text())
            }
            })
                 return checkeds;
           }


    //-------------改变显示状态-------------
    function changeTableVal(id_value,obj)
    {
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
            url:'index.php?item-master-category-updateStatus&id_value='+id_value+'&value='+value,
            dataType:'JSON',
            success: function(data){
                if(data.statusCode == 200){
                    $(obj).attr('src',src);
                    //window.location.href = 'index.php?item-master-category';
                    return false;
                }else{
                    alert('失败了');
                }

            }
        });
    }


    /*layui.use('form', function(){
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
    });*/
</script>
</body>
</html>