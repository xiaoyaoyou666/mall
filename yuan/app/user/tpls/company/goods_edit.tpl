{x2;include:header}
<body>
{x2;include:nav}
<style>
    .comp_sel {
        overflow-y: scroll!important;
    }

    .comp_sel>ul {
        padding:10px!important;
    }

    .comp_sel ul li {
        width: 100%;
        cursor: pointer;
    }
         .tr-icon {
    width: 16px;
    height: 17px;
    cursor: pointer;
    position: relative;
    top: 3px;
}
 .icon-add {
    background-image: url(app/core/styles/images/icon_add.png);
    margin-right: 5px;
}
#tab_es{width: 58%;float: left;}
#tab_es thead tr th{background: #ededed;}
.tas{width:80%;}
.right_c{width: 40%;height: 120px;float: left;margin-left: 10px;}
.right_c img{width: 100%;height: 100%;}
#tab_es a{color: #ff8a00;}
</style>
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?{x2;$_app}-master">企业中心</a> > <a>网格超市货架管理</a>> <a>编辑商品</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right edit-goods">
                <!--公司简介-->
                <div>
                    <!--我的模块开始-->
                    <div class="zmm_panel panel-default">
                        <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <!--<p><em class="title-triangle"></em>编辑商品{x2;if:$catname}【当前分类：{x2;$catname}】{x2;endif}</p >-->
                            <p><em class="title-triangle"></em>编辑商品</p>
                            <a href="index.php?{x2;$_app}-company-items&catid={x2;$catid}&page={x2;$page}"
                               class="yellow-text pull-right"
                               style="padding: 0px 40px 0px 20px;height: 40px;line-height: 40px;">商品管理</a>
                        </div>
                        <form action="index.php?user-company-items-edit&edittype={x2;$edittype}" method="post" class="form-horizontal edit-goods-from">
                            <div class="form-group">
                                <label for="itemtitle" class="control-label col-sm-2"> </label>
                                <div class="col-sm-7">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="itemcatid" class="control-label col-sm-2"><span
                                        class="hln-cue">*</span>分类：</label>
                                <div class="controls form-inline col-sm-7">
                                    <select id="catid" msg="您必须选择一个分类" needle="needle" class="autocombox form-control require" name="catid">
                                        <option value="-1">选择一级分类</option>
                                        {x2;tree:$parentcat,cat,cid}
                                        <option {x2;if:$cateArr[0]['catid']==v:cat['catid']}selected="selected"{x2;endif} value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
                                        {x2;endtree}
                                    </select>
                                    <select id="catid1" msg="您必须选择一个分类" needle="needle" class="autocombox form-control require" name="catid">
                                        <option value="">请选择</option>
                                        <option selected="selected" value="{x2;$cateArr[1]['catid']}">{x2;$cateArr[1]['catname']}</option>

                                    </select>
                                    <select id="catid2" msg="您必须选择一个分类" needle="needle" class="autocombox form-control require" name="catid">
                                        <option value="">请选择</option>
                                        <option selected="selected" value="{x2;$cateArr[2]['catid']}">{x2;$cateArr[2]['catname']}</option>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="itemtitle" class="control-label col-sm-2"><span
                                            class="hln-cue">*</span>标题：</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control require" id="itemtitle" name="args[goodstitle]"
                                           needle="needle" msg="您必须输入标题" value="{x2;$goods['goodstitle']}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="itemtitle" class="control-label col-sm-2">广告语：</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="goodsadv" name="args[goodsadv]"
                                           value="{x2;$goods['goodsadv']}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="itemtitle" class="control-label col-sm-2">运费：</label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" id="goodspostinfo" name="args[goodsstyle]"
                                           value="{x2;$goods['goodsstyle']}">
                                </div>
                            </div>
                            <div class="form-group">

                                <label for="block" class="control-label col-sm-2"><span
                                            class="hln-cue">*</span>缩略图：</label>
                                <div class="col-sm-9">
                                    <p style="color: #999;line-height: 40px;">该图片展示在商品列表页面，支持jpg、gif、png格式</p>
                                    <script type="text/template" id="pe-template-goodsthumb">
                                        <div class="qq-uploader-selector" style="width:30%"
                                             qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals"
                                                    style="clear:both;max-width: 220px;max-height: 220px;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                    aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail" style="border: none;">
                                                            <img class="qq-thumbnail-selector select-imgs-button"
                                                                 src="{x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                 alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector"
                                                                   name="args[goodsthumb]" tabindex="0"
                                                                   value=" {x2;if:$goods['goodsthumb']}{x2;$goods['goodsthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-goodsthumb"
                                         attr-ftype="jpg,jpeg,png"></div>
                                </div>
                            </div>
                            <div class="form-group breviary">
                                <label for="goodsphotos" class="control-label col-sm-2"><span class="hln-cue">*</span>组图：</label>
                                <div class="col-sm-9">
                                    <p style="color: #999;line-height: 40px;">该图片展示在商品详情页面，支持jpg、gif、png格式</p>
                                    <div class="sortable" id="goodsphotos-range">
                                        {x2;tree:$goods['goodsphotos'],photo,pid}
                                        <div class="thumbnail col-xs-3 listimgselector">
                                            <img class="qq-thumbnail-selector" alt="点击上传新图片" src="{x2;v:photo}">
                                            <input type="hidden" class="qq-edit-filename-selector"
                                                   name="args[goodsphotos][]" tabindex="0" value="{x2;v:photo}">
                                            <div class="img-delete-bg">
                                                <em class="img-delete-icon">×</em>
                                            </div>
                                        </div>
                                        {x2;endtree}
                                    </div>
                                    <script type="text/template" id="pe-template-goodsphotos">
                                        <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传"
                                             style="clear:both;">

                                            <div class="qq-upload-list-selector hide" aria-live="polite"
                                                 aria-relevant="additions removals">
                                                <span></span>
                                            </div>

                                            <div class="listimg hide">
                                                <div class="thumbnail col-xs-3 listimgselector">
                                                    <img class="qq-thumbnail-selector" alt="点击上传新图片" src="*value*">
                                                    <input type="hidden" class="qq-edit-filename-selector" name="*name*"
                                                           tabindex="0" value="*value*">
                                                    <div class="img-delete-bg">
                                                        <em class="img-delete-icon">×</em>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="qq-upload-button-selector qq-upload-button" style="clear:both;">
                                                <img src="app/core/styles/images/noimage.gif" class="select-imgs-button"
                                                     alt="添加文件">
                                                <!--<a class="btn btn-primary" style="background-color:#009944;">添加文件</a>-->
                                            </div>

                                        </div>
                                    </script>
                                    <div style="float: left" class="fineuploader" max-length="6"
                                         attr-box="goodsphotos-range" attr-name="args[goodsphotos][]" attr-type="list"
                                         attr-list="true" attr-template="pe-template-goodsphotos"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="block" class="control-label col-sm-2"><span
                                            class="hln-cue">*</span>货号：</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control require" name="args[goodscode]" needle="needle"
                                           msg="您必须输入货号" value="{x2;$goods['goodscode']}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="block" class="control-label col-sm-2"><span
                                            class="hln-cue">*</span>品牌：</label>
                                <div class="col-sm-4">
                                    <input type="text" name="args[goodsbrand]" value="{x2;$goods['goodsbrand']}"
                                           class="form-control require" needle="needle" msg="您必须输入品牌">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="block" class="control-label col-sm-2"><span
                                            class="hln-cue">*</span>单位：</label>
                                <div class="col-sm-4">
                                    <input type="text" name="args[goodsunit]" value="{x2;$goods['goodsunit']}"
                                           class="form-control require" needle="needle" msg="您必须输入单位">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="block" class="control-label col-sm-2"><span
                                            class="hln-cue">*</span>税率：</label>
                                <div class="col-sm-4 s_select">
                                    <input type="hidden" value="{x2;$goods['shui']}" name="args[shui]">
                                    <input type="text" value="{x2;$goods['shui_text']}" class="form-control require shui_sel" needle="needle" msg="您必须输入税率">
                                    <div class="comp_sel" style="width:310px;height:200px;overflow: hidden;display: none;border:solid 1px #eee;">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
								<label for="block" class="control-label col-sm-2">
									<span class="hln-cue"></span>商品参数：
								</label>
								<div style="margin-top: 7px;"><a id="add_lists"><em class="tr-icon icon-add"></em>新增</a></div>
							</div>
							<div class="form-group">
								<label for="block" class="control-label col-sm-2" style="width: 18%;">
									<span class="hln-cue"></span>&nbsp;
								</label>
								<div class="tas" style="float: left;">
									<table id="tab_es" class="table table-hover table-bordered">
										<thead>
											<tr class="info">
												<th>参数名称</th>
												<th>参数内容 </th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
                                        {x2;if:$goodparameter}
                                        {x2;tree:$goodparameter,goodp,gid}
                                        <tr>
                                            <td><input class="form-control" type="text" name="args[goodparameter][{x2;eval:echo v:gid-1}][title]" id="" value="{x2;v:goodp['title']}" /></td>
                                            <td><input class="form-control" type="text" name="args[goodparameter][{x2;eval:echo v:gid-1}][val]" id="" value="{x2;v:goodp['val']}" /></td>
                                            <td><a class="delects">删除</a></td>
                                        </tr>
                                        {x2;endtree}
                                        {x2;else}
                                        <tr>
                                            <td><input class="form-control" type="text" name="args[goodparameter][0][title]" id="" value="" /></td>
                                            <td><input class="form-control" type="text" name="args[goodparameter][0][val]" id="" value="" /></td>
                                            <td><a class="delects">删除</a></td>
                                        </tr>
                                        <tr>
                                            <td><input class="form-control" type="text" name="args[goodparameter][1][title]" id="" value="" /></td>
                                            <td><input class="form-control" type="text" name="args[goodparameter][1][val]" id="" value="" /></td>
                                            <td><a class="delects">删除</a></td>
                                        </tr>
                                        {x2;endif}
										</tbody>
									</table>
									<div class="right_c">
										<img src="app/core/styles/images/decil.png"/>
									</div>
								</div>
							</div>
                            <div id="itemforms">
                                {x2;tree:$forms,form,fid}
                                <div class="form-group">
                                    <label for="{x2;v:form['id']}"
                                           class="control-label col-sm-2">{x2;v:form['title']}</label>
                                    <div class="col-sm-9">{x2;v:form['html']}</div>
                                </div>
                                {x2;endtree}
                            </div>
                            <div class="form-group">
                                <label for="itemtext" class="control-label col-sm-2">商品介绍：</label>
                                <div class="col-sm-9">
                                    <textarea id="itemtext" rows="7" cols="4" class="jckeditor"
                                              name="args[goodsdescribe]">{x2;$goods['goodsdescribe']}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="itemtext" class="control-label col-sm-2"></label>
                                <div class="col-sm-9 operate-box">
                                    <button class="btn btn-primary" type="button" data-type="1">提交</button>
                                    <button class="btn yellow-text-reverse" type="button" data-type="2">保存</button>
                                    <button class="btn btn-default ajax " type="button" data-type="3" href="index.php?user-company-items" target="datacontent">取消</button>
                                    <input type="hidden" name="page" value="{x2;$page}">
                                    <input type="hidden" name="submit" value="1">
                                    <input type="hidden" name="goodsid" value="{x2;$goodsid}">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!--我的模块结束-->
            </div>
        </div>
        <!-- 右侧  end -->
    </div>
</div>
</div>

{x2;include:footer2}
{x2;include:purchasejs}
<script type="text/javascript" src="app/core/styles/js/user/company/goods_edit.js"></script>
</body>

<script>
    $(function(){
        $(".shui_sel").keyup(function() {
            var suibian = $(this).next('.comp_sel');
            var code = $(this).val();
            if (code != '') {
                $.ajax({
                    type: 'GET',
                    data: {
                        code: code
                    },
                    url: "index.php?item-app-ajax-getShuiByKey",
                    dataType: 'json',
                    success: function(res) {
                        if (res.statusCode == 200) {
                            suibian.html(res.data);
                        } else {
                            var data = {
                                result: false,
                                message: res.message
                            };
                            $.zoombox.show('ajax', data);
                        }
                    }
                })
            }
            $(this).next("div").slideDown();
        });

        $(".s_select").on("click", "li", function() {
            $(this).parent("ul").parent("div").siblings(".shui_sel").val($(this).text());
            $(this).parent("ul").parent("div").siblings("input[type=hidden]").val($(this).attr("id"));
            $(this).parent("ul").parent("div").hide();
        });
       //  下拉菜单
        $("#catid").click(function(){

            var code = $(this).val();

            if (code == "-1") {
                $("#catid1").empty();
                $("#catid2").empty();
                $("#catid1").append("<option value='-1'>请选择</option>");
                $("#catid2").append("<option value='-1'>请选择</option>");

                return false;
            } else {
                $.ajax({
                    type: "GET",
                    url: "index.php?user-app-register-ajaxCategory&catid=" + code,
                    dataType: "json",
                    success: function(data) {
                        $("#catid1").empty();
                        $("#catid1").append("<option value='-1'>请选择</option>");
                        console.log(data);
                        $.each(data, function(index, value) {
                            $("#catid1").append("<option value=" + value.catid + ">" + value.catname + "</option>")
                        })
                    }
                })
            }
        })
        $("#catid1").click(function() {
            var code = $(this).val();
            if (code == "-1") {
                $("#catid2").empty();
                $("#catid2").append("<option value='-1'>请选择</option>");
                return false;
            } else {
                $.ajax({
                    type: "GET",
                    url: "index.php?user-app-register-ajaxCategory&catid=" + code,
                    dataType: "json",
                    success: function(data) {
                        console.log(data);
                        $("#catid2").empty();
                        $("#catid2").append("<option value='-1'>请选择</option>");
                        $.each(data, function(index, value) {
                            $("#catid2").append("<option value=" + value.catid + ">" + value.catname + "</option>")
                        })

                    }
                })
            }
        });
        var num = {x2;$lenth};
        $("#add_lists").click(function(){
		    num += 1;
			var purch = $("#tab_es");
			var addtr =$("<tr>"+
					"<td><input class='form-control' name='args[goodparameter]["+num+"][title]' type='text' /></td>"+
					"<td><input class='form-control' name='args[goodparameter]["+num+"][val]' type='text'/></td>"+
					"<td><a class='delects'>删除</a></td>"+
				"</tr>");
				addtr.appendTo(purch)
		})
		$("#tab_es").on("click","tr .delects",function(){
			$(this).parent().parent().remove();
		})

    });
</script>

</html>
