<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>采购寻源</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/order_list.css" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="app/core/styles/admin/bootstrap.css" />
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/friendlink.css" />
    <link rel="stylesheet" href="app/core/styles/admin/indent.css" />
    <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">

    <script src="app/core/styles/admin/layui/layui.js"></script>
    <script src="app/core/styles/admin/js/base.js"></script>
    <script src="app/core/styles/js/jquery.min.js"></script>
    <script src="app/core/styles/js/jquery-ui.min.js"></script>
    <script src="app/core/styles/js/bootstrap.min.js"></script>
    <script src="app/core/styles/js/bootstrap-datetimepicker.js"></script>
    <script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
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
       table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
       .col-xs-3{padding: 0;}
    </style>

</head>
<body>
<header>
{x2;include:nav2}
</header>
<div class="goods" class="layui-col-sm12" id="content">
     <div class="head">当前位置：<a href="index.php?item-master-items">采购寻源</a>&nbsp;>&nbsp;询价管理</div>
    <div class="g-content">
        <form action="index.php?user-master-user-inquiry" method="post" class="form-inline" id="myForm">
            <div class="col-xs-12" style="padding: 0 ;">
            <div class="row" style="margin:0 0 10px 0 ;">
                <div class="col-xs-3" style="width: 22.9%;">
                    询价单名称：<input style="width: 148px!important;" class="form-control" name="keyword" size="15" type="text" value="{x2;$keyword}" id="keyword" />
                </div>

                <div class="col-xs-3" style="width:17.6%">
                    企业名称：<input style="width: 117px!important;"  class="form-control" name="companyname" size="15" type="text" value="{x2;$companyname}" id="companyname" />
                </div>
                <div class="col-xs-5" style="width: 44%;">
                    截止时间：
                        <input style="width: 178px!important;" class="form-control" type="text" name="stime" id="test1" value="{x2;$stime}"/> - <input style="width: 178px!important;" class="form-control" type="text" name="etime" id="test2" value="{x2;$etime}"/>
                </div>
                <div class="col-xs-3" style="width: 15%">
                    状态：
                        <select style="margin-left: -4px;width: 74%;" class="form-control" name="purchasestatus" id="purchasestatus">
                            <option value=''>全部</option>
                            <option value='1' {x2;if:$status== 1} selected="selected" {x2;endif}>询价中
                            </option>
                            <option value='2' {x2;if:$status== 2} selected="selected" {x2;endif}>待定标
                            </option>
                            <option value='3' {x2;if:$status== 3} selected="selected" {x2;endif}>已完成
                            </option>
                            <option value='4' {x2;if:$status== 4} selected="selected" {x2;endif}>已终止
                            </option>
                        </select>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-9" style="width: 100%;">
                    <div class="row" style="width: 100%;padding-left: 15px;margin-right: -30px;">
                        <div class="col-xs-3" style="float: right;width:12.5%;margin-right: -16px;">
                            <button style="padding:0 18px" class="btn layui-btn layui-btn-sm" onclick="doSearch2()">查询</button>
                            <a style="padding:0 18px" class="btn  layui-btn  layui-btn-sm" type="button" id="btn" onclick="formReset()">重置</a>
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
                        <th>ID</th>
                        <th>询价单名称</th>
                        <th>类型</th>
                        <th>收到报价</th>
                        <th>状态</th>
                        <th>发布时间</th>
                        <th>发布用户</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    {x2;tree:$contentarr['data'],content,cid}
                    <tr>
                        <td>{x2;v:content['id']}</td>
                        <td>{x2;v:content['xunjia_title']}</td>

                        {x2;if:v:content['xunjia_type']==1}
                        <td>邀请询价</td>
                        {x2;else}
                        <td>公开询价</td>
                        {x2;endif}

                        {x2;if:v:content['offernum']==0}
                        <td>否</td>
                        {x2;else}
                        <td>{x2;v:content['offernum']}</td>
                        {x2;endif}

                        {x2;if:v:content['status']==1}
                        <td>询价中</td>
                        {x2;elseif:v:content['status']==2}
                        <td>待定标</td>
                        {x2;elseif:v:content['status']==3}
                        <td>已完成</td>
                        {x2;elseif:v:content['status']==4}
                        <td>已终止</td>
                        {x2;endif}

                        <td>{x2;date:v:content['end_time'],'Y-m-d H:i'}</td>
                        <td>{x2;v:content['company_name']}</td>
                        <td class="actions">
                            <div class="btn-group">
                                <a class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal" href="index.php?user-company-purchases-inquiryinfo&id={x2;v:content['id']}"><i class="layui-icon">&#xe62d;</i>详情</a>
                                {x2;if:v:content['status']==1 || v:content['status']==2}
                                <button style="margin-left: 0px;" type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger del" value="{x2;v:content['id']}"><i class="layui-icon ">&#xe640;</i>终止</button>
                                {x2;endif}
                            </div>
                        </td>
                    </tr>
                    {x2;endtree}
                </tbody>
            </table>
            <ul class="pagination pull-right">{x2;$contentarr['pages']}</ul>
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
        ,type: 'datetime'
        });
        laydate.render({
        elem: '#test2'//指定元素
        ,type: 'datetime'
        });
    });

    //搜索功能
    function doSearch2() {
        var keyword = $("#keyword").val();
        var purchasetype = $("#purchasetype").val();
        var purchasestatus = $("#purchasestatus").val();
        var stime = $("#test1").val();//开始时间
        var etime = $("#test2").val();//结束时间*/
        var companyname = $("#companyname").val();//企业名称

        var url = 'index.php?user-master-user-inquiry';
        if (keyword != '') {
            url += '&keyword=' + keyword;
        }
        if (purchasetype != '') {
            url += '&purchasetype=' + purchasetype;
        }
        if (purchasestatus != '') {
            url += '&purchasestatus=' + purchasestatus;
        }

        if (stime != '') {
            url += '&stime=' + stime;
        }
        if (etime != '') {
            url += '&etime=' + etime;
        }
        if (companyname != '') {
            url += '&companyname=' + companyname;
        }
        window.location.href = url;
    }

    //from表单的reset功能
    function formReset()
    {
        var url = 'index.php?user-master-user-inquiry';
        window.location.href = url;
    }

    $(function(){
        $('.del').on('click',function(){
            var isconfirm = confirm('确定要终止吗');
            if(isconfirm){
                var id = this.value;
                $.ajax({
                    type:'get',
                    url: "index.php?user-company-purchases-delpurchase&id="+id,
                    dataType:'JSON',
                    async:true,
                    success:function(res){
                        if(res.statusCode == 200){
                            alert('操作成功');
                            window.location.reload();
                            return false;
                        }
                    },
                    error: function(e){
                        console.log(e);
                    }
                })
            }

        })
    })

</script>