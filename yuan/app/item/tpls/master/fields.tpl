<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>字段管理主页</title>
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
       .row_a{margin-left: 47px;}
       .row_a div{margin-right: 80px;}
       table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
    </style>

</head>
<body>
<header>
{x2;include:nav2}
</header>
<div class="goods" class="layui-col-sm12" id="content">


	 <div class="head">当前位置：<a href="index.php?item-master-module">模型管理</a>&nbsp;>&nbsp;【{x2;$module['modulename']}】字段列表</div>
    <div class="g-content">
        <form  action="index.php?item-master-brands-index" method="post" class="form-inline">
          	<div style="float: right;position: relative;right: -312px;">
              <div class="row row_a" style="margin-bottom:10px;">
                  
                  <div class="col-xs-1">
                      <a style="background-color:#009688;" class="pull-right btn btn-primary" href="index.php?item-master-module-preview&moduleid={x2;$moduleid}">模型预览</a>
                  </div>

                  <div class="col-xs-1">
                       <a style="background-color:#009688;" class="pull-right btn btn-primary" href="index.php?item-master-module-addfield&moduleid={x2;$moduleid}">添加模型字段</a>
                      
                  </div>

                  <div class="col-xs-1">
                      <a style="background-color:#009688;" class="pull-right btn btn-primary" href="index.php?item-master-module-addfield&moduleid={x2;$moduleid}&fieldpublic=1">添加公共字段</a>
                      
                  </div>
                  
              	</div>
             </div>
             <div style="clear: both;"></div>
              <div class="input">
                  <input type="hidden" value="1" name="search[argsmodel]" />
              </div>
          
        </form>
        
    <form action="index.php?item-master-items-lite" method="post">
        <fieldset class="table-responsive table2excel"> 
            <table class="layui-table protable"  id="table_a">
                <thead>
                    <tr class="info">
                      <th>ID</th>
                      <!-- <th>排序</th> -->
                      <th>字段名</th>
                      <th>字段类型</th>
                      <th>别名</th>
                      <th>字段长度</th>
                      <th>数据类型</th>
                      <th>HTML类型</th>
                      <th>索引</th>
                      <th>是否禁用</th>
                      <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    {x2;tree:$fields,field,fid}
                  <tr>
                    <td>{x2;v:field['fieldid']}</td>
                    <!-- <td class="form-inline"><input type="text" size="1" name="ids[{x2;v:field['fieldid']}]" value="{x2;v:field['fieldsequence']}" class="form-control"/></td> -->
                    <td>{x2;v:field['field']}</td>
                    <td>{x2;if:v:field['fieldpublic']}公共{x2;else}模型{x2;endif}字段</td>
                    <td>{x2;v:field['fieldtitle']}</td>
                    <td>{x2;if:v:field['fieldlength']}{x2;v:field['fieldlength']}{x2;else}默认{x2;endif}</td>
                    <td>{x2;v:field['fieldtype']}</td>
                    <td>{x2;v:field['fieldhtmltype']}</td>
                    <td>{x2;if:v:field['fieldindextype']}{x2;v:field['fieldindextype']}{x2;else}NULL{x2;endif}</td>
                    <td>
                      <img width="20" height="20" src="app/core/styles/images/{x2;if:v:field['fieldlock']}cancel.png{x2;else}yes.png{x2;endif}" onclick="changeTableVal('{x2;v:field[fieldid]}',this)"/>
                    </td>

                    
                    <td nowrap>
                      <div class="btn-group">
                        
                        <!-- {x2;if:v:field['fieldlock']}
                        <a class="btn ajax" href="index.php?{x2;$_app}-master-module-forbiddenfield&fieldid={x2;v:field['fieldid']}&moduleid={x2;$moduleid}&page={x2;$page}{x2;$u}" title="启用"><em class="glyphicon glyphicon-ban-circle"></em></a>
                        {x2;else}
                        <a class="btn ajax" href="index.php?{x2;$_app}-master-module-forbiddenfield&fieldid={x2;v:field['fieldid']}&moduleid={x2;$moduleid}&page={x2;$page}{x2;$u}" title="禁用"><em class="glyphicon glyphicon-ok-circle"></em></a>
                        {x2;endif} -->
                        <a class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal" href="index.php?{x2;$_app}-master-module-modifyfield&fieldid={x2;v:field['fieldid']}&page={x2;$page}{x2;$u}" title="修改字段"><i class="layui-icon">&#xe642;</i> 修改</a>

                        <a class="btn ajax" href="index.php?{x2;$_app}-master-module-delfield&fieldid={x2;v:field['fieldid']}&moduleid={x2;$moduleid}&page={x2;$page}{x2;$u}" title="删除字段"><em class="glyphicon glyphicon-remove"></em></a>

                      </div>
                    </td>
                  </tr>
                  {x2;endtree}
                </tbody>
            </table>
            <!-- <div class="control-group">
                <div class="controls">
                  <button class="btn btn-primary" type="submit" style="background-color:#009688;">更改排序</button>
                        <input type="hidden" name="page" value="{x2;$page}">
                        <input type="hidden" name="modifyfieldsequence" value="1"/>
                        <input type="hidden" name="moduleid" value="{x2;$moduleid}"/>
                  {x2;tree:$search,arg,aid}
                  <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                  {x2;endtree}
                </div>
            </div> -->
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

      //-------------改变显示状态-------------
        function changeTableVal(id_value,obj)
        {
            //alert(aaa);
            var src = "";
            if($(obj).attr('src').indexOf("cancel.png") > 0 )
            {          
                src = 'app/core/styles/images/yes.png';
                var value = 0;  
            }else{                    
                    src = 'app/core/styles/images/cancel.png';
                    var value = 1;
            }   
           // alert(value);                                              
            $.ajax({
                url:'index.php?item-master-module-updateStatus&id_value='+id_value+'&value='+value,
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