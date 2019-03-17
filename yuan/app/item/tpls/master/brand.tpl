<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>品牌管理主页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">

    <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/goods/goods-index.css" />


    <script src="app/core/styles/admin/layui/layui.js"></script>
    
    <script src="app/core/styles/admin/js/base.js"></script>
    
    <script src="app/core/styles/js/jquery.min.js"></script>
    <script src="app/core/styles/js/jquery-ui.min.js"></script>
    <script src="app/core/styles/js/bootstrap.min.js"></script>
    <script src="app/core/styles/js/bootstrap-datetimepicker.js"></script>
    <script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>

    <script src="app/core/styles/js/jquery.min.js"></script>
    <script src="app/core/styles/js/jquery-ui.min.js"></script>
    <script src="app/core/styles/js/bootstrap.min.js"></script>
    <script src="app/core/styles/js/bootstrap-datetimepicker.js"></script>

    <script src="app/core/styles/js/all.fine-uploader.min.js"></script>

    <script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
    <script src="app/core/styles/js/plugin2.js"></script>
     <style>
      
       .search-table{
            border-collapse:separate;
            border-spacing:0;
            border: 0px !important;
            margin-bottom: 0px !important;
       }
       .search-table>tbody>tr{
            border: 0px !important;
       }
       .search-table>tbody>tr>td{
            border: 0px !important;
       }
       .search-table>tbody>tr>td:first-child{
            width: 20%;
       }
       .search-table>tbody>tr:nth-child(2)>td:nth-child(2){
           width: 26%;
       }
       .search-table>tbody>tr:nth-child(2)>td:nth-child(3){
           width: 14%;
       }
       .search-table>tbody>tr:nth-child(2)>td:last-child{
           text-align: right;
       } 
       .protable>thead>tr>th{
            text-align: center;
       }
       .protable>tbody>tr>td{
            text-align: center;
       }
       .actions .btn-group a:first-child{

            margin-right: 10px;
       }
       #userName{
           width:180px!important;
       }
       #xl{
           display: none;
           border: 1px solid #ccc;
           width:180px!important;
           height:120px;
           overflow-y: scroll;
       }
       #xl li{

           height:30px!important;
           cursor: pointer;
           width:100%;
           padding: 6px 12px;
           font-size: 14px;
           line-height: 30px;
           color: #555;
           background-color: #fff;
           height:30px;
           line-height:30px;
       }
       .btn-primary{background: #009944;border-color: #009944;}
       .btn-primary:hover{background: #009944;border-color: #009944;}
       table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
    </style>

</head>
<body>
<header>
{x2;include:nav2}
</header>
<div class="goods" class="layui-col-sm12" id="content">


	 <div class="head">当前位置：<a href="index.php?item-master-brands">商品管理</a>&nbsp;>&nbsp;品牌管理</div>
    <div class="g-content">
        <form action="index.php?item-master-brands-index" method="post" class="form-inline">
            <div class="col-xs-12">
            <div class="row" style="margin-bottom:10px;">
                <div class="col-xs-3">
                    品牌中文名称：<input class="form-control" name="search[brandtitle]" size="15" type="text" value="{x2;$brandtitle}" id="keyword" />
                </div>

                <div class="col-xs-3">
                    品牌英文名称：<input class="form-control" name="search[brandid]" size="15" type="text" value="{x2;$brandid}" id="brandid" />
                </div>

                <div class="col-xs-3" style="width: 10%;">
                    <button style="padding:0 18px" class="btn  layui-btn  layui-btn-sm" type="button" onclick="doSearch()">查询</button>
                    
                </div>

                <div class="col-xs-3" style="width: 10%;">
                    <a style="background-color:#009688;" class="pull-right btn btn-primary" href="index.php?item-master-brands-add&page={x2;$page}">添加品牌</a>
                    
                </div>
                
            </div>
            
            <div class="input">
                <input type="hidden" value="1" name="search[argsmodel]" />
            </div>
        </form>
        
    <form action="index.php?item-master-items-lite" method="post">
        <fieldset class="table-responsive table2excel"> 
            <table class="layui-table protable"  id="table_a">
                <thead>
                    <tr class="info">
                      
                        <th>缩略图</th>
                        <th>品牌英文名</th>
                        <th>品牌中文名</th>
                        <th>品牌所属国家</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    {x2;tree:$brands['data'],brand,bid}
                    <tr>
                        <tr>
                           
                            <td class="picture"><img src="{x2;if:v:brand['brandthumb']}{x2;v:brand['brandthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="height:48px;"/></td>
                            <td>{x2;v:brand['brandid']}</td>
                            <td>
                                {x2;v:brand['brandtitle']}
                            </td>
                            <td>
                                {x2;v:brand['brandcountry']}
                            </td>
                            <td class="actions">
                                <div class="btn-group">
                                    <a class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal" href="index.php?item-master-brands-edit&brandid={x2;v:brand['brandid']}&page={x2;$page}{x2;$u}" title="修改"><i class="layui-icon">&#xe642;</i> 修改</a>                              
                                    <a style="border-radius: 100px;padding: 0 7px;margin-right: 10px;" class="btn confirm layui-btn layui-btn-xs layui-btn-radius layui-btn-danger deluser" href="index.php?item-master-brands-del&brandid={x2;v:brand['brandid']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em>删除</a>                               	
                                </div>
                            </td>
                        </tr>
                    {x2;endtree}
                </tbody>
            </table>
            
            <ul class="pagination pull-right">{x2;$brands['pages']}</ul>
        </fieldset>
    </form>
</div>
</div>
</div>
</body>
</html>

<script>
    layui.use(['laydate', 'form'], function() {
        var laydate = layui.laydate
        laydate.render({
        elem: '#test1'//指定元素
        ,type: 'date'
        });
        laydate.render({
        elem: '#test2'//指定元素
        ,type: 'date'
        });
    });


    function doSearch(){
        var keyword = $("#keyword").val();
        var brandid = $("#brandid").val();
        var url = 'index.php?item-master-brands';
        if (keyword != '')url += '&keyword=' + keyword;
        if (brandid != '') url += '&brandid=' + brandid;
           
        window.location.href = url;
    }


</script>