{x2;include:header}
<style type="text/css">
    .table a {
        color: #ff8a00
    }

    .table a:hover {
        color: #009944
    }

    .zmm-panel-body {
        padding-top: 20px;
        padding-left: 20px;
        padding-right: 20px;
    }

    .zmm-gsjj table {
        width: 100%;
        margin-bottom: 0;
    }

    .conditions tbody tr, .conditions tbody td {
        border: 0 !important;
    }

    .table > thead > tr > td.info, .table > tbody > tr > td.info, .table > tfoot > tr > td.info, .table > thead > tr > th.info, .table > tbody > tr > th.info, .table > tfoot > tr > th.info, .table > thead > tr.info > td, .table > tbody > tr.info > td, .table > tfoot > tr.info > td, .table > thead > tr.info > th, .table > tbody > tr.info > th, .table > tfoot > tr.info > th {
        background-color: #ededed;
        text-align: center;
    }

</style>
<body>
{x2;include:nav}

<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?{x2;$_app}-company">企业中心</a> > <a href="index.php?user-company-items">网格超市货架管理</a>> <a>货架维护</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right">
                <!--公司简介-->
                <div>
                    <!--我的模块开始-->
                    <div class="zmm_panel panel-default cybershop-shelf-maintenance">
                        <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <p><em class="title-triangle"></em>货架维护</p>
                            <a href="index.php?user-company-items-add" class="yellow-text pull-right"
                               style="padding: 0px 40px 0px 20px;height: 50px;line-height: 50px;">添加商品</a>
                        </div>
                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                            <form action="index.php?user-company-items" method="post" class="form-inline" style="padding-top: 15px;">
                                <table class="table conditions">
                                    <tbody>
                                        <tr>
                                            <div class="condition-row">
                                                <div class="form-group" style="font-size: 14px;margin-top: 5px">
                                                    关键字：
                                                    <input class="form-control goods-input" id="keyword" name="search[keyword]"
                                                           type="text" value="{x2;$search['keyword']}" />
                                                </div>
                                                <div class="form-group classify-col" style="font-size: 14px;margin-top: 5px">
                                                    分类：
                                                    <select id="catid" msg="您必须选择一个分类" style="width: 91px" class="autocombox form-control" name="search[goodscatid]" refUrl="index.php?user-company-items-ajax-getchildcategory&catid={value}">
                                                        <option value="">全部</option>
                                                        {x2;tree:$parentcat,cat,cid}
                                                        <option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
                                                        {x2;endtree}
                                                    </select>
                                                </div>
                                                <div class="form-group" style="font-size: 14px;margin-top: 5px">
                                                    状态：
                                                    <select class="form-control" id="goodstatus" name="search[goodstatus]" style="width: 77px">
                                                        <option value="">全部</option>
                                                        <option value="1" {x2;if:$search[goodstatus]== 1} selected{x2;endif}>
                                                            上架中
                                                        </option>
                                                        <option value="-1" {x2;if:$search[goodstatus]== -1} selected{x2;endif}>
                                                            下架中
                                                        </option>
                                                    </select>
                                                </div>
                                                <div class="form-group" style="font-size: 14px;margin-top: 5px">
                                                    录入时间：
                                                    <input class="form-control goods-time-input" type="text" name="search[stime]" id="stime" value="{x2;$search['stime']}" style="width:155px;"/>
                                                    - <input class="form-control goods-time-input" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}" style="width:155px;"/>
                                                </div>



                                                <div class="form-group" style="margin-top: 5px">
                                                    <button class="btn btn-primary" type="submit"
                                                            onclick="doSearch();return false;">搜索
                                                    </button>
                                                </div>
                                            </div>

                                        </tr>
                                        <tr>
                                            <div class="condition-row">

                                            </div>

                                        </tr>
                                    </tbody>
                                </table>
                                <div class="input">
                                    <input type="hidden" value="1" name="search[argsmodel]"/>
                                </div>
                            </form>
                            <form action="index.php?user-company-items-lite" method="post">
                                <fieldset>
                                    {x2;if:$pageStatus == '1'}
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                        <tr class="info">
                                            <th><input type="checkbox" class="checkall" target="delids"/></th>
                                            <!-- <th>权重</th>
                                            <th>ID</th> -->
                                            <th>缩略图</th>
                                            <th>标题</th>
                                            <th>分类</th>
                                            <th>上下架</th>
                                            <th>发布时间</th>
                                            <th width="180">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {x2;tree:$goods['data'],good,cid}
                                        <tr>
                                            <td class="cell-align-center"><input type="checkbox"
                                                                                 name="delids[{x2;v:good['goodsid']}]"
                                                                                 value="1"></td>
                                            <!-- <td><input class="form-control" type="text" name="ids[{x2;v:good['goodsid']}]" value="{x2;v:good['goodssequence']}" style="width:36px;padding:2px 5px;"/></td>
                                            <td>{x2;v:good['goodsid']}</td> -->
                                            <td class="picture"><img src="{x2;if:v:good['goodsthumb']}{x2;v:good['goodsthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:24px;"/></td>
                                            <td class="table-text">
                                                <a class="yellow-text" href="index.php?item-app-item&goodsid={x2;v:good['goodsid']}" target="_blank">{x2;v:good['goodstitle']}</a>
                                            </td>
                                            <td>
                                                {x2;$categories[v:good['goodscatid']]['catname']}
                                            </td>
                                            <td>{x2;if:v:good['goodsstatus'] == 1}上架中 <a title="点击设置下架" class="ajax yellow-text" href="index.php?user-company-items-goodsdown&goodsid={x2;v:good['goodsid']}"><em
                                                    class="glyphicon glyphicon-import"></em></a>{x2;else}下架中 <a
                                                    title="点击设置上架" class="ajax yellow-text"
                                                    href="index.php?user-company-items-goodsup&goodsid={x2;v:good['goodsid']}"><em
                                                    class="glyphicon glyphicon-export"></em></a>{x2;endif}
                                            </td>
                                            <td class="cell-align-center">
                                                {x2;date:v:good['goodstime'],'Y-m-d H:i:s'}
                                            </td>
                                            <td class="actions" style="padding: 0;">
                                                <div class="btn-group">

                                                    <a class="btn yellow-text"
                                                       href="index.php?user-company-items-stock&goodsid={x2;v:good['goodsid']}{x2;$u}"
                                                       title="库存管理"><em class="glyphicon glyphicon-briefcase"></em></a>

                                                    {x2;if:v:good['goodsstatus'] == 1}
                                                    <a class="btn yellow-text shangjiatip"
                                                       href="index.php?user-company-items-edit&catid={x2;v:good['goodscatid']}&goodsid={x2;v:good['goodsid']}&page={x2;$page}{x2;$u}&edittype=1"
                                                       title="修改"><em class="glyphicon glyphicon-edit"></em></a>

                                                    {x2;else}
                                                    <a class="btn yellow-text"
                                                       href="index.php?user-company-items-edit&catid={x2;v:good['goodscatid']}&goodsid={x2;v:good['goodsid']}&page={x2;$page}{x2;$u}&edittype=1"
                                                       title="修改"><em class="glyphicon glyphicon-edit"></em></a>

                                                    {x2;endif}


                                                    <a class="btn yellow-text" target="_blank"
                                                       href="index.php?user-company-items-history&goodsid={x2;v:good['goodsid']}&page={x2;$page}{x2;$u}"
                                                       title="操作历史"><em class="glyphicon glyphicon-paperclip"></em></a>
                                                    <a class="btn yellow-text confirm"
                                                       href="index.php?user-company-items-del&catid={x2;v:good['goodscatid']}&goodsid={x2;v:good['goodsid']}&page={x2;$page}{x2;$u}"
                                                       title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                                    <!--    <a class="btn" href="index.php?item-company-items-setcuxiao&goodsid={x2;v:good['goodsid']}" title="设置为促销产品"><em class="icon-cog"></em></a>-->
                                                </div>
                                            </td>
                                        </tr>
                                        {x2;endtree}
                                        </tbody>
                                    </table>

                                    <div class="control-group operate-bar">
                                        <div class="controls">
                                            <label class="radio-inline">
                                                <input type="radio" name="action" value="up" checked/>上架
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="action" value="down"/>下架
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="action" value="delete"/>删除
                                            </label>
                                            {x2;tree:$search,arg,sid}
                                            <input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
                                            {x2;endtree}
                                            <label class="radio-inline">
                                                <button class="btn btn-primary" type="submit"
                                                        style="background-color:#009944;border:solid 1px #009944;float: right;margin-top:4px;outline:none;">
                                                    提交
                                                </button>
                                            </label>
                                            <input type="hidden" name="modifycontentsequence" value="1"/>
                                            <input type="hidden" name="catid" value="{x2;$catid}"/>
                                            <input type="hidden" name="page" value="{x2;$page}"/>
                                        </div>
                                    </div>
                                    {x2;endif}
                                    {x2;if:$pageStatus == '2'}
                                    <div class="empty-box">
                                        <div class="empty-item">
                                            <img src="app/core/styles/img/empty_offer.png" alt="">
                                        </div>

                                        <div class="empty-item">
                                            <p class="empty-title">非常抱歉，没有找到与搜索内容相符的内容</p>
                                            建议您：
                                            <ul>
                                                <li>1、判断输入的文字是否有误</li>
                                                <li>2、尝试一下其他相关字段</li>
                                                <li>3、拆分要搜索的关键词，分成几个词语再次搜索</li>
                                            </ul>
                                        </div>
                                    </div>
                                    {x2;endif}

                                    {x2;if:$pageStatus == '3'}
                                    <div class="empty-content-box">
                                        <div class='empty-content-img'>
                                            <img src="app/core/styles/img/empty-content.png" alt="内容为空" style="width: 224px">
                                        </div>
                                        <p class="empty-content-title">尚未创建相关信息哦～</p>
                                    </div>
                                    {x2;endif}

                                    <ul class="pagination pull-right">{x2;$goods['pages']}</ul>
                                </fieldset>
                            </form>
                        </div>
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
<script>
    $(function() {
        $('.submenu:eq(1)').delay(400).slideDown(700);
        $('.submenu:eq(1) li:eq(0)').addClass("active");
        $('.shangjiatip').on('click', function() {
            var data = {result: false, message: '请将商品下架后再修改'};
            $.zoombox.show('', data);
            return false;

        });
    });
</script>
<script>

    $(function () {
        $('#stime').datetimepicker({
            language:'zh-CN',
            format: 'yyyy-mm-dd hh:ii:ss',
            todayHighlight: 1,//今天高亮
            minView: 0,
            startView: 2,
            forceParse: 0,
            showMeridian: 1,
            autoclose: 1//选择后自动关闭
        });
        $('#etime').datetimepicker({
            language:'zh-CN',
            format: 'yyyy-mm-dd hh:ii:ss',
            todayHighlight: 1,//今天高亮
            minView: 0,
            startView: 2,
            forceParse: 0,
            showMeridian: 1,
            autoclose: 1//选择后自动关闭
        });


        $('.submenu:eq(1)').delay(400).slideDown(700);
        $('.submenu:eq(1) li:eq(0)').addClass("active");

        //        $('#stime').datetimepicker({
        //            format: 'yyyy-mm-dd hh:ii',
        //            autoclose: true,
        //            minuteStep:1
        //        });

    });

    function doSearch() {
        var stime = $("#stime").val();
        var etime = $("#etime").val();
        var catid = $(".classify-col select:last-child").val();
        var keyword = $("#keyword").val();
        var goodstatus = $("#goodstatus").val();
        var url = 'index.php?user-company-items&page={x2;$page}';
        if (catid != '') {
            url += '&search[goodscatid]=' + catid;
        }
        if (stime != '') {
            url += '&search[stime]=' + stime;
        }
        if (etime != '') {
            url += '&search[etime]=' + etime;
        }
        if (keyword != '') {
            url += '&search[keyword]=' + keyword;
        }
        if (goodstatus != '') {
            url += '&search[goodstatus]=' + goodstatus;
        }
        window.location.href = url;
    }
</script>
</body>

</html>
