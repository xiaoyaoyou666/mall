<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模型管理-字段修改</title>
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

</head>
<body>
<header>{x2;include:nav2}</header>
<div class="goods" id="content">
   <div class="head" style="margin-bottom:10px;"><a href="index.php?item-master-module">模型管理</a>&nbsp;>&nbsp;<a href="index.php?item-master-module-fields&moduleid={x2;$field['fieldmoduleid']}">字段管理</a>&nbsp;>&nbsp;编辑{x2;if:$fieldpublic}公共{x2;else}模型{x2;endif}字段
            </div>
    <div class="g-content">
       <h4 class="title" style="padding:10px;">
                        {x2;$field['fieldtitle']}[{x2;$field['field']}]
                    </h4>
                    <div id="tabs-694325" class="tabbable">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#panel-344373" data-toggle="tab">样式编辑</a>
                            </li>
                            <li>
                                <a href="#panel-788842" data-toggle="tab">数据编辑</a>
                            </li>
                            
                        </ul>
                        <div class="tab-content">
                            <div id="panel-344373" class="tab-pane active">
                                <form action="index.php?item-master-module-modifyfield" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2"></label>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">字段别名：</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" type="text" size="40" name="args[fieldtitle]" needle="needle" datatype="userName" id="fieldtitle" msg="您必须填写字段别名，字段别名必须为中英文字符或数字" value="{x2;$field['fieldtitle']}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="fieldhtmltype" class="control-label col-sm-2">HTML类型：</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" name="args[fieldhtmltype]" id="fieldhtmltype">
                                                <option value="text"{x2;if:$field['fieldhtmltype'] == 'text'} selected{x2;endif}>文本域(text)</option>
                                                <option value="htmltime"{x2;if:$field['fieldhtmltype'] == 'htmltime'} selected{x2;endif}>时间文本域(htmltime)</option>
                                                <option value="password"{x2;if:$field['fieldhtmltype'] == 'password'} selected{x2;endif}>密码域(password)</option>
                                                <option value="hidden"{x2;if:$field['fieldhtmltype'] == 'hidden'} selected{x2;endif}>隐藏域(hidden)</option>
                                                <option value="select"{x2;if:$field['fieldhtmltype'] == 'select'} selected{x2;endif}>下拉菜单/选择框(select)</option>
                                                <option value="radio"{x2;if:$field['fieldhtmltype'] == 'radio'} selected{x2;endif}>单选框(radio)</option>
                                                <option value="checkbox"{x2;if:$field['fieldhtmltype'] == 'checkbox'} selected{x2;endif}>复选框(checkbox)</option>
                                                <option value="checkboxarray"{x2;if:$field['fieldhtmltype'] == 'checkboxarray'} selected{x2;endif}>复选框组(checkboxarray)</option>
                                                <option value="textarea"{x2;if:$field['fieldhtmltype'] == 'textarea'} selected{x2;endif}>文本区域(textarea)</option>
                                                <option value="editor"{x2;if:$field['fieldhtmltype'] == 'editor'} selected{x2;endif}>编辑器(editor)</option>
                                                <option value="thumb"{x2;if:$field['fieldhtmltype'] == 'thumb'} selected{x2;endif}>缩略图上传(thumb)</option>
                                                <option value="picture"{x2;if:$field['fieldhtmltype'] == 'picture'} selected{x2;endif}>组图上传(picture)</option>
                                                <option value="auto"{x2;if:$field['fieldhtmltype'] == 'auto'} selected{x2;endif}>自定义(auto)</option>
                                                <option value="videotext"{x2;if:$field['fieldhtmltype'] == 'videotext'} selected{x2;endif}>上传(videotext)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">HTML属性：</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" rows="7" cols="4" name="args[fieldhtmlproperty]" id="fieldhtmlproperty">{x2;$field['fieldhtmlproperty']}</textarea>
                                            <span class="help-block">每行一个，等号隔开，如：style=width:100px;</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">可选值列表：</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" rows="7" cols="4" name="args[fieldvalues]" id="fieldvalues">{x2;$field['fieldvalues']}</textarea>
                                            <span class="help-block">每行一个，等号隔开，如：属性=值;</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">默认值：</label>
                                        <div class="col-sm-3">
                                            <input class="form-control" type="text" size="40" name="args[fielddefault]" class="form-control" id="fielddefault" value="{x2;$field['fielddefault']}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">禁止修改：</label>
                                        <div class="col-sm-9">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="args[fieldforbidactors][]" value="-1" {x2;if:strpos($field['fieldforbidactors'],',-1,') !== false}checked="true"{x2;endif}/> 本用户
                                            </label>
                                            {x2;tree:$groups,group,gid}
                                            {x2;if:v:group['groupmoduleid'] == 1}
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="args[fieldforbidactors][]" value="{x2;v:group['groupid']}" {x2;if:strpos($field['fieldforbidactors'],','.v:group['groupid'].',') !== false}checked="true"{x2;endif}/> {x2;v:group['groupname']}
                                            </label>
                                            {x2;endif}
                                            {x2;endtree}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">字段描述：</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" rows="7" cols="4" name="args[fielddescribe]" id="fielddescribe">{x2;$field['fielddescribe']}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">系统字段：</label>
                                        <div class="col-sm-9">
                                            <label class="radio-inline">
                                                <input type="radio" class="input-text" name="args[fieldsystem]" value="1"{x2;if:$field['fieldsystem']} checked{x2;endif}/> 作为系统字段
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" class="input-text" name="args[fieldsystem]" value="0"{x2;if:!$field['fieldsystem']} checked{x2;endif}/> 作为普通字段
                                            </label>
                                            <span class="help-block">系统字段不能被删除</span>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2"></label>
                                        <div class="col-sm-9">
                                            <button class="btn btn-primary" type="submit" style="background-color:#009688;">提交</button>
                                            <input type="hidden" name="moduleid" value="{x2;$field['fieldmoduleid']}"/>
                                            <input type="hidden" name="fieldid" value="{x2;$fieldid}"/>
                                            <input type="hidden" name="modifyfieldhtml" value="1"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div id="panel-788842" class="tab-pane">
                                <form action="index.php?item-master-module-modifyfield" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-2"></label>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">字段类型：</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" id="fieldtype" name="args[fieldtype]">
                                                <option value="int"{x2;if:$field['fieldtype'] == 'int'} selected{x2;endif}>整型(int/time)</option>
                                                <option value="varchar"{x2;if:$field['fieldtype'] == 'varchar'} selected{x2;endif}>0~255字符串型(varchar)</option>
                                                <option value="decimal"{x2;if:$field['fieldtype'] == 'decimal'} selected{x2;endif}>浮点型(decimal)</option>
                                                <option value="text"{x2;if:$field['fieldtype'] == 'text'} selected{x2;endif}>长文字型(text)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">字段长度：</label>
                                        <div class="col-sm-3">
                                            <input type="text" size="16" name="args[fieldlength]" class="form-control" id="fieldlength" value="{x2;$field['fieldlength']}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2">索引类型：</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" name="args[fieldindextype]" id="fieldindextype">
                                                <option value="0">无(NULL)</option>
                                                <option value="INDEX"{x2;if:$field['fieldindextype'] == 'INDEX'} selected{x2;endif}>普通索引(INDEX)</option>
                                                <option value="UNIQUE"{x2;if:$field['fieldindextype'] == 'UNIQUE'} selected{x2;endif}>不重复索引(UNIQUE)</option>
                                                <option value="FULLTEXT"{x2;if:$field['fieldindextype'] == 'FULLTEXT'} selected{x2;endif}>全文索引(FULLTEXT)</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2"></label>
                                        <div class="col-sm-9">
                                            <button class="btn btn-primary" type="submit" style="background-color:#009688;">提交</button>
                                            <input type="hidden" name="moduleid" value="{x2;$field['fieldmoduleid']}"/>
                                            <input type="hidden" name="fieldid" value="{x2;$fieldid}"/>
                                            <input type="hidden" name="modifyfielddata" value="1"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

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