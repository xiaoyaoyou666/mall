<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <title>模型管理</title>

    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">
    <script src="app/core/styles/admin/js/jquery.min.js"></script>
    <script src="app/core/styles/admin/js/base.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>

    <!--[if lt IE 9]>
    <script src="app/core/styles/js/html5shiv.min.js"></script>
    <script src="app/core/styles/js/respond.min.js"></script>
    <![endif]-->
    <script src="app/core/styles/js/jquery.min.js"></script>
    <script src="app/core/styles/js/jquery-ui.min.js"></script>
    <script src="app/core/styles/js/bootstrap.min.js"></script>
    <script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
    <script src="app/core/styles/js/plugin2.js"></script>

    <style>
        label{
            text-align:left!important;
            width:auto!important;
            padding:5px 5px;
        }
        li div.layui-input-block{
            margin-left:90px;
        }
        input[type='checkbox']{
            width:15px!important;
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
        .inpup input[type=checkbox]{
            display:block;
            float: left;
            margin-right: 10px;
        }
        .inpup{
            line-height: 36px;
        }
        .grops .control-label{
            margin-top: 6px;
        }
    </style>
</head>

<body>
<header>
    {x2;include:nav2}
</header>
<div class="layui-row">

    <div class="layui-col-sm12" id="content">
        <div class="head">当前位置：<a href="index.php?item-master-module">商品管理</a>&nbsp;>&nbsp;品牌管理</div>
        
        <form class="layui-form" action="index.php?item-master-module-brands" method="post" class="form-horizontal">
            <div style="line-height: 30px;margin-bottom: 60px;clear: both">
                <lable class="layui-form-label " style="width:auto;margin-top:-36px;float: left;font-size: 18px;color:#009688 ">
                    {x2;$module['modulename']}：
                </lable>
                <lable class="layui-form-label" style="width:auto;margin-top:-51px;float: right;">
                    <a class="layui-btn" href="index.php?item-master-module">模型列表</a>
                </lable>
            </div>

            <fieldset>
                <div class="form-group grops">
                    <label class="control-label col-sm-2" for="moduledescribe">已有品牌：</label>
                    <div class="col-sm-10">
                        {x2;tree:$brands,brand,bid}
                        {x2;if:in_array(v:brand['brandid'],$modulebrands)}
                        <span class="col-sm-3 inpup">
                            <label class="radio-inline ">
                                <input type="checkbox" name="brands[]" value="{x2;v:brand['brandid']}" checked/> {x2;v:brand['brandtitle']}
                            </label>
                        </span>
                        {x2;endif}
                        {x2;endtree}
                    </div>
                </div>
                <div class="form-group grops">
                    <label class="control-label col-sm-2" for="moduledescribe">待选品牌：</label>
                    <div class="col-sm-10">
                        {x2;tree:$brands,brand,bid}
                        {x2;if:!in_array(v:brand['brandid'],$modulebrands)}
                        <span class="col-sm-3 inpup">
                            <label class="radio-inline ">
                                <input type="checkbox" name="brands[]" value="{x2;v:brand['brandid']}"/> {x2;v:brand['brandtitle']}
                            </label>
                        </span>
                        {x2;endif}
                        {x2;endtree}
                    </div>
                </div>
                <div class="form-group grops">
                    <label class="control-label col-sm-2" for="moduledescribe"></label>
                    <div class="col-sm-8" style="width: 80%;">
                        <button style="float: right;"  class="layui-btn" type="submit">提交</button>
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
        <div style="clear:both"></div>
    </div>
</div>



</body>

</html>