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
    <script src="app/core/styles/admin/js/jquery.min.js"></script>
    <script src="app/core/styles/admin/js/base.js"></script>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/goods/goods-index.css" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">
    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>


    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/datetimepicker.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css" />

    <script src="app/core/styles/js/jquery.min.js"></script>
    <script src="app/core/styles/js/jquery-ui.min.js"></script>
    <script src="app/core/styles/js/bootstrap.min.js"></script>
    <script src="app/core/styles/js/bootstrap-datetimepicker.js"></script>

    <script src="app/core/styles/js/all.fine-uploader.min.js"></script>

    <script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
    <script src="app/core/styles/js/plugin2.js"></script>

    <style>
        .selectwidth{
            display: inline-block;
            width: 25%;
        }
        .selectwidth:nth-child(2){
            margin-right: 15px;
            margin-left: 15px;
        }

        element.style {
            border: 1px solid #009688;
            color: #009688;
            margin-bottom: 15px;
        }
		table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
    </style>

</head>
<body>
<header>{x2;include:nav2}</header>
<div class="goods" id="content">
    <div class="g-content">
        <form action="index.php?item-master-category-add" method="post" class="form-horizontal">
            <fieldset>
                <div class="form-group">
                </div>


                <div class="form-group">
                    <label for="modulename" class="control-label col-sm-2">上级分类</label>
                    <div class="col-sm-8">
                       <select  class="autocombox form-control selectwidth" name="args[catparent]" refUrl="index.php?item-master-category-ajax-getchildcategory&catid={value}" id="select">
                            <option value="">选择一级分类</option>
                            {x2;tree:$parentcat,cat,cid}
                            <option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
                            {x2;endtree}
                        </select>

                    </div>
                </div>

                <div class="form-group">
                    <label for="modulecode" class="control-label col-sm-2">绑定模型</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="args[catmoduleid]" needle="needle" msg="您必须为这个分类选择一个模型">
                            {x2;tree:$modules,module,mid}
                            <option value="{x2;v:module['moduleid']}"{x2;if:$category['catmoduleid'] == v:module['moduleid']} selected{x2;endif}>{x2;v:module['modulename']}</option>
                            {x2;endtree}
                        </select>
                    </div>
                </div>

                <div class="form-group">
                                <label for="modulecode" class="control-label col-sm-2">分类模板</label>
                                <div class="col-sm-4">
                                    <select class="form-control" name="args[cattpl]" needle="needle" msg="您必须为这个分类选择一个模板">
                                        {x2;tree:$tpls,tpl,tid}
                                        <option value="{x2;v:tpl}"{x2;if:$category['cattpl'] == v:tpl} selected{x2;endif}>{x2;v:tpl}</option>
                                        {x2;endtree}
                                    </select>
                                </div>
                            </div>

                <div class="form-group">
                    <label for="modulename" class="control-label col-sm-2">分类名称</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" id="input1" name="args[catname]" value="{x2;$category['catname']}"  needle="needle" msg="您必须输入中英文字符的分类名称"><span>多个分类添加请用英文逗号分隔</span>

                    </div>
                </div>

                <div class="form-group">
                    <label for="modulename" class="control-label col-sm-2">分类描述</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" id="input2" name="args[caturl]" value="{x2;$category['caturl']}" >

                    </div>
                </div>

                <!-- <div class="form-group">
                    <label for="modulecode" class="control-label col-sm-2">绑定模型</label>
                    <div class="col-sm-4">
                        <select class="form-control" name="args[catmoduleid]" needle="needle" msg="您必须为这个分类选择一个模型">
                            {x2;tree:$modules,module,mid}
                            <option value="{x2;v:module['moduleid']}"{x2;if:$category['catmoduleid'] == v:module['moduleid']} selected{x2;endif}>{x2;v:module['modulename']}</option>
                            {x2;endtree}
                        </select>
                    </div>
                </div> -->
                <!-- {x2;if:!$parent}
                <div class="form-group">
                    <label for="modulename" class="control-label col-sm-2">是否显示</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" class="input-text" name="args[catinmenu]" value="1"/> 显示
                        </label>
                        <label class="radio-inline">
                            <input type="radio" class="input-text" name="args[catinmenu]" value="0" checked/> 不显示
                        </label>
                    </div>
                </div>
                {x2;endif} -->

                <!-- <div class="form-group">
                    <label for="moduledescribe" class="control-label col-sm-2">分类图片</label>
                    <div class="col-sm-9">
                        <script type="text/template" id="pe-template-photo">
                            <div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                <div class="qq-upload-button-selector" style="clear:both;">
                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                        <li class="text-center">
                                            <div class="thumbnail">
                                                <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                <input type="hidden" class="qq-edit-filename-selector" name="args[catimg]" tabindex="0">
                                            </div>
                                        </li>
                                    </ul>
                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                        <li class="text-center">
                                            <div class="thumbnail">
                                                <img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
                                                <input type="hidden" class="qq-edit-filename-selector" name="args[catimg]" tabindex="0" value="app/core/styles/images/noimage.gif">
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </script>
                        <div class="fineuploader" attr-type="thumb" attr-template="pe-template-photo"></div>
                    </div>
                </div> -->

                <div class="form-group">
                    <label for="catdes" class="control-label col-sm-2"></label>
                    <div class="col-sm-10">
                        <button class="btn btn-primary" type="submit">提交</button>
                        <input type="hidden" name="page" value="{x2;$page}">
                        <input type="hidden" name="addcategory" value="1">
                        <input type="hidden" name="args[catparent]" value="{x2;$parent}">
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