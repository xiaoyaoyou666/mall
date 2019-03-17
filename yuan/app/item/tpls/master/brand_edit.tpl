<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>品牌管理-修改</title>
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
   
    <!--[if lt IE 9]>
    <script src="app/core/styles/js/html5shiv.min.js"></script>
    <script src="app/core/styles/js/respond.min.js"></script>
    <![endif]-->
    <script src="app/core/styles/js/jquery.min.js"></script>
    <script src="app/core/styles/js/jquery-ui.min.js"></script>
    <script src="app/core/styles/js/bootstrap.min.js"></script>
    <script src="app/core/styles/js/bootstrap-datetimepicker.js"></script>

    <script src="app/core/styles/js/all.fine-uploader.min.js"></script>

    <script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
    <script src="app/core/styles/js/plugin2.js"></script>
	<style type="text/css">
		.col-sm-4{padding: 0;}
		.col-sm-9{padding: 0;}
	</style>
</head>
<body>
<header>{x2;include:nav2}</header>
<div class="goods" id="content">
    <div class="head">当前位置：<a href="index.php?item-master-brands">品牌管理</a>&nbsp;>&nbsp;品牌修改</div>
    <div class="g-content">
        <form action="index.php?item-master-brands-edit" method="post" class="form-horizontal">
            <fieldset>
                <div class="form-group">
                </div>
                <div class="form-group">
                    <label for="modulename" class="control-label col-sm-2">品牌英文名称</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" id="input1" name="args[brandid]" value="{x2;$brand['brandid']}"  needle="needle" msg="您必须输入英文品牌名称">
                       
                    </div>
                </div>
                <div class="form-group">
                    <label for="modulename" class="control-label col-sm-2">品牌中文名称</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" id="input2" name="args[brandtitle]" value="{x2;$brand['brandtitle']}">

                    </div>
                </div>

                <div class="form-group">
                    <label for="modulename" class="control-label col-sm-2">品牌所属国家</label>
                    <div class="col-sm-4">
                        <input class="form-control" type="text" id="input2" name="args[brandcountry]" value="{x2;$brand['brandcountry']}" datatype="userName">

                    </div>
                </div>


                <div class="form-group">
                    <label for="moduledescribe" class="control-label col-sm-2">品牌图片</label>
                    <div class="col-sm-9">
                        <script type="text/template" id="pe-template-brandthumb">
                            <div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                <div class="qq-upload-button-selector" style="clear:both;">
                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                        <li class="text-center">
                                            <div class="thumbnail">
                                                <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                <input type="hidden" class="qq-edit-filename-selector" name="args[brandthumb]" tabindex="0">
                                            </div>
                                        </li>
                                    </ul>
                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                        <li class="text-center">
                                            <div class="thumbnail">
                                                <img class="qq-thumbnail-selector" src="{x2;if:$brand['brandthumb']}{x2;$brand['brandthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
                                                <input type="hidden" class="qq-edit-filename-selector" name="args[brandthumb]" tabindex="0" value="{x2;if:$brand['brandthumb']}{x2;$brand['brandthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </script>
                        <div class="fineuploader" attr-type="thumb" attr-template="pe-template-brandthumb"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="catdes" class="control-label col-sm-2">品牌简介</label>
                    <div class="col-sm-9">
                        <textarea class="ckeditor" rows="7" id="branddescribe" name="args[branddescribe]">{x2;$brand['branddescribe']}</textarea>
                        <span class="help-block">对这个品牌进行描述</span>
                    </div>
                </div>
               
                <div class="form-group">
                    <label for="catdes" class="control-label col-sm-2"></label>
                    <div class="col-sm-9">
                        <button class="layui-btn  layui-btn-sm" type="submit">提交</button>
                        <input type="hidden" name="page" value="{x2;$page}">
                        <input type="hidden" name="modifybrand" value="1">
                        <input type="hidden" name="brandid" value="{x2;$brand['brandid']}">
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