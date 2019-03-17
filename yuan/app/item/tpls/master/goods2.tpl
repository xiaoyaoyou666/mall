<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品管理主页</title>
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
       .col-xs-3{padding: 0;}
    </style>

</head>
<body>
<header>
{x2;include:nav2}
</header>
<div class="goods" class="layui-col-sm12" id="content">


	 <div class="head">当前位置：<a href="index.php?item-master-items">商品管理</a>&nbsp;>&nbsp;商品管理</div>
    <div class="g-content">
        <form action="index.php?item-master-items-index" method="post" class="form-inline">
            <div class="col-xs-12" style="padding: 0 ;">
            <div class="row" style="margin:0 0 10px 0 ;">
                <div class="col-xs-3" style="width: 18.9%;">
                    关键字：<input style="width: 148px!important;" class="form-control" name="search[keyword]" size="15" type="text" value="{x2;$search['keyword']}" id="keyword" />
                </div>
                <div class="col-xs-9" style="width: 20.4%;">
                    类目： <select msg="您必须选择一个分类" class="autocombox form-control" name="search[goodscatid]" refUrl="index.php?item-master-category-ajax-getchildcategory&catid={value}" id="goodscatid">
                        <option value="">选择一级分类</option>
                        {x2;tree:$parentcat,cat,cid}
                        <option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
                        {x2;endtree}
                    </select>
                </div>
                <div class="col-xs-3" style="width:14.6%">
                    店铺：<input style="width: 117px!important;"  class="form-control" name="search[username]" size="15" type="text" value="{x2;$search['username']}" id="username" />
                </div>
                 <div class="col-xs-5" style="width: 29%;">
                            添加时间：
                                <input style="width: 98px!important;" class="form-control" type="text" name="search[stime]" id="test1" value="{x2;$search['stime']}"/> - <input style="width: 98px!important;" class="form-control" type="text" name="search[etime]" id="test2" value="{x2;$search['etime']}"/>
                        </div>
                          <div class="col-xs-3" style="width: 17%">
                            状态：
                                <select style="margin-left: -4px;width: 77.2%;" class="form-control" name="search[goodsstatus]" id="goodsstatus">
                                    <option value="">状态不限</option>
                                    <option value="1"{x2;if:$search[goodsstatus] == 1} selected{x2;endif}>已上架</option>
                                    <option value="-1"{x2;if:$search[goodsstatus] == -1} selected{x2;endif}>未上架</option>
                                </select>
                        </div>
            </div>
            <div class="row">
                <div class="col-xs-9" style="width: 100%;">
                    <div class="row" style="width: 100%;padding-left: 15px;margin-right: -30px;">                     
                        <div class="col-xs-3" style="float: right;width:12.5%;margin-right: -16px;">
                            <button style="padding:0 18px" class="btn  layui-btn  layui-btn-sm" type="submit">查询</button>
                            <a style="padding:0 18px" class="btn  layui-btn  layui-btn-sm" type="button" id="btn" href="javascript:exportReport()">导出</a>
                        </div>
                    </div>
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
                        <!--
                        <th width="2%"><input type="checkbox" class="checkall" target="delids"/></th>-->
                        <th>ID</th>
                        <th>名称</th>
                        <th>物料编码</th>
                        <th>产品类型</th>
                        <th>货号</th>
                        <th>品牌</th>
                        <th>发布时间</th>
                        <th>所属商铺</th>

                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    {x2;tree:$goods['data'],good,cid}
                    <tr>
                        <!--
                        <td><input type="checkbox" name="delids[{x2;v:good['goodsid']}]" value="1"></td>
                        <td><input class="form-control" type="text" name="ids[{x2;v:good['goodsid']}]" value="{x2;v:good['goodssequence']}" style="width:36px;padding:2px 5px;"/></td>
                        -->
                        <td>{x2;v:good['goodsid']}</td>
                        <td>{x2;v:good['goodstitle']}</td>
                        <td>{x2;v:good['wuliaocode']}</td>
                        <td>{x2;$categories[v:good['goodscatid']]['catname']}</td>
                        <td>{x2;v:good['goodscode']}</td>
                        <td>{x2;v:good['goodsbrand']}</td>
                        <td>{x2;date:v:good['goodstime'],'Y-m-d'}</td>
                        <td>{x2;v:good['goodsusername']}</td>
                        <td class="actions">
                            <div class="btn-group">
                                <button type="button" value="{x2;v:good['goodsid']}" class="layui-btn layui-btn-xs layui-btn-radius code" ><i class="layui-icon ">&#xe6c6;</i>编码</button>

                                <a class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal" href="index.php?item-app-item&goodsid={x2;v:good['goodsid']}"><i class="layui-icon">&#xe62d;</i> 详情</a>

                                {x2;if:v:good['goodsstatus'] == 1}<a title="点击设置下架" class="down layui-btn layui-btn-xs layui-btn-radius layui-btn-warm" href="javascript:;" onclick="down('{x2;v:good['goodsid']}')"><em class="glyphicon glyphicon-import"></em> 上架中</a>{x2;else}<a title="点击设置上架"  class="up layui-btn layui-btn-xs layui-btn-radius layui-btn-warm" href="javascript:;" onclick="up('{x2;v:good['goodsid']}')"><em class="glyphicon glyphicon-export"></em> 下架中</a>{x2;endif}
                           
                            </div>
                        </td>
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
            <ul class="pagination pull-right">{x2;$goods['pages']}</ul>
        </fieldset>
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

    //下架
    function down(id)
    {
        var userid = id;
        $.ajax({
            type:'get',
            url: "index.php?item-master-items-goodsdown&goodsid="+userid+"&page={x2;$page}{x2;$u}",
            dataType:'JSON',
            async:true,
            success:function(res){
                if(res.statusCode == 200){
                    alert('下架成功');
                    window.location.reload();
                    return false;
                }
            },
            error: function(e){
                console.log(e);
            }
        })
    }

    //上架
    function up(id)
    {
        var userid = id;
        $.ajax({
            type:'get',
            url: "index.php?item-master-items-goodsup&goodsid="+userid+"&page={x2;$page}{x2;$u}",
            dataType:'JSON',
            async:true,
            success:function(res){
                if(res.statusCode == 200){
                    alert('上架成功');
                    window.location.reload();
                    return false;
                }
            },
            error: function(e){
                console.log(e);
            }
        })
    }

    //----导出excel表格----
   /* $(function() {
        $("#btn").click(function(){
            $(".table2excel").table2excel({
                exclude: ".noExl",
                name: "Excel Document Name",
                filename: "商品列表",
                exclude_img: true,
                exclude_links: true,
                exclude_inputs: true
            });
        });


        //全局变量 企业id
        var gid = '';
        var code = '';
        var matkl = ''; //物料组code
        var wgbez = ''; //物料组描述
        var meins = ''; //物料单位

        //供应商编码设置
        $(".code").on('click',function(){
            gid = $(this).val();
            $("#myModal2").modal();
        });

        $("#xl").on("click","li",function(){
            matkl = $(this).attr('matkl');
            wgbez = $(this).attr('wgbez');
            meins = $(this).attr('meins');
            $("#userName").val($(this).text());
            $("#xl").slideUp();
        });


        $("#userName").keyup(function() {
            //$(this).next("#xl").slideUp();
            var code = $(this).val();
            if(code != ''){
                $(this).next("#xl").slideDown();
                $.ajax({
                    type: 'GET',
                    data: {code:code},
                    url: "index.php?core-api-index-getWuliaoByCode",
                    dataType: 'json',
                    success: function (res) {
                        if(res.statusCode == 200){
                            $("#xl").html(res.data);
                        }else{
                            var data = {result: false, message: res.msg};
                            $.zoombox.show('ajax', data);
                        }
                    }
                })
            }
        });

        $("#addcode").on('click',function(){
            //console.log($("#userName").val(),matkl,wgbez,meins);return false;
            var cc = $("#userName").val();
            if(cc == ''){
                alert('请重新选择供应商编码');
                return false;
            }
            if(gid == ''){
                alert('请重新选择商品');
                return false;
            }
            $.ajax({
                type:'get',
                url: "index.php?core-api-index-setGoodCode&goodid="+gid+"&code="+cc+"&matkl="+matkl+"&wgbez="+wgbez+"&meins="+meins,
                dataType:'JSON',
                async:true,
                success:function(res){
                    if(res.statusCode == 200){
                        alert('设置成功');
                        window.location.reload();
                    }
                },
                error: function(e){
                    console.log(e);
                }
            })
        });
  
    });*/


    function exportReport(){
        var keyword = $("#keyword").val();
        var goodscatid = $("#goodscatid").val();
        var username = $("#username").val();
        var test1 = $("#test1").val();
        var test2 = $("#test2").val();
        var goodsstatus = $("#goodsstatus").val();
    
        var url = 'index.php?item-master-items-export_goods';
        if (keyword != '')url += '&keyword=' + keyword;
        if (goodscatid != '') url += '&goodscatid=' + goodscatid;
        if (username != '')url += '&username=' + username;
        if (goodsstatus != '')url += '&goodsstatus=' + goodsstatus;
        if (test1 != '')url += '&test1=' + test1;
        if (test2 != '')url += '&test2=' + test2;
            
        window.location.href = url;
    }


</script>