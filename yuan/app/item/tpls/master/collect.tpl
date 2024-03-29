<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>收藏排行</title>
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
       table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
    </style>

</head>
<body>
<header>
{x2;include:nav2}
</header>
<div class="goods" class="layui-col-sm12" id="content">
	
	 <div class="head">当前位置：<a href="index.php?item-master-items">商品管理</a>&nbsp;>&nbsp;收藏排行</div>
	 <!--提示-->
    <form action="index.php?item-master-items-lite" method="post">
            <table class="layui-table protable"  id="table_a">
                <thead>
                   <tr class="info">
                        <th>ID</th>
                        <th>名称</th>
                        <th>物料编码</th>
                        <th>产品类型</th>
                        <th>货号</th>
                        <th>品牌</th>
                        <th>发布时间</th>
                        <th>所属商铺</th>
                        <th>收藏数</th>
                    </tr>    
                </thead>
                <tbody>     
                    {x2;tree:$goods['data'],good,cid}
                    <tr>
                        <td>{x2;v:good['goodsid']}</td>
                        <td>{x2;v:good['goodstitle']}</td>
                        <td>{x2;v:good['wuliaocode']}</td>
                        <td>{x2;$categories[v:good['goodscatid']]['catname']}</td>
                        <td>{x2;v:good['goodscode']}</td>
                        <td>{x2;v:good['goodsbrand']}</td>
                        <td>{x2;date:v:good['goodstime'],'Y-m-d'}</td>
                        <td>{x2;v:good['goodsusername']}</td>
                        <td class="actions">{x2;v:good['goodsnum']}</td>
                    </tr>
                {x2;endtree}
                </tbody>
            </table>
            <!--
            <div class="control-group">
                <div class="controls">
                    <label class="radio-inline">
                        <input type="radio" name="action" value="modify" checked/>排序
                    </label>
                    
                    <label class="radio-inline">
                        <input type="radio" name="action" value="delete" />删除
                    </label>
                    {x2;tree:$search,arg,sid}
                    <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                    {x2;endtree}
                    <label class="radio-inline">
                        <button class="btn btn-primary" type="submit">提交</button>
                    </label>
                    <input type="hidden" name="modifycontentsequence" value="1"/>
                    <input type="hidden" name="catid" value="{x2;$catid}"/>
                    <input type="hidden" name="page" value="{x2;$page}"/>
                </div>
            </div>
            -->

            <div style="float: right">
            <ul class="pagination" style="margin:10px 0 50px 0;">
                {x2;$goods['pages']}
            </ul>
        </div>
      
    </form>
</div>



</div>



</div>
<div class="modal fade"  id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">物料编码管理</h4>
            </div>
            <div class="modal-body" style="height:200px;">

                <input class="form-control" value="" type="text" id="userName" placeholder="请输入物料编码" autocomplete="off">
                <div id="xl">
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="layui-btn  layui-btn-sm" data-dismiss="modal">关闭</button>
                <button type="button" class="layui-btn  layui-btn-sm" id="addcode">提交</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

</body>
</html>
<script src="app/core/styles/js/jquery.table2excel.js"></script>
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

    


</script>