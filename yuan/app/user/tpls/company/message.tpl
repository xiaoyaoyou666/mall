{x2;include:header}
<body id="datacontent">
<style type="text/css">
    .pagination {
        bottom: 36px;
        right: -6px;
    }
    .icons a{
        padding: 0 5px;
    }
</style>
{x2;include:nav}
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>系统消息</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right message-centre">
                <!--公司简介-->
                <div>

                    <div class="zmm_panel panel-default">
                        <div class="zmm-qydt-title zmm-qydt-shsj1"><p><em class="title-triangle"></em>系统消息</p></div>
                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                            <form action="index.php?user-company-message-delall" method="post">
                            <table class="table table-responsive table-hover table-bordered">
                            <thead>
                                 <tr>
                                     <td width="30px">
                                         <input type="checkbox" class="checkall" target="delids"/>
                                     </td>
                                     <td>
                                         标题
                                     </td>
                                     <td>
                                         发布时间
                                     </td>
                                     <td>
                                         状态
                                     </td>
                                     <td>
                                         操作
                                     </td>
                                 </tr>
                            </thead>
                                <tbody>
                                    {x2;tree:$data['data'],vv,cid}
                                    <tr class="table-tr2">
                                        <td class="cell-align-center"><input type="checkbox" name="delids[{x2;v:vv['msg_id']}]" value="1"></td>
                                        <td>
                                            {x2;if:v:vv['status'] == 0}
                                            <a href="{x2;v:vv['msg_url']}&msg_id={x2;v:vv['msg_id']}" class="yellow-text">{x2;v:vv['msg_title']}</a>
                                            {x2;else}
                                            <a href="{x2;v:vv['msg_url']}&msg_id={x2;v:vv['msg_id']}" style="color: #666" class="yellow-text">{x2;v:vv['msg_title']}</a>
                                            {x2;endif}
                                        </td>
                                        <td>
                                            {x2;date:v:vv['msg_time'],'Y-m-d'}
                                        </td>
                                        <td>
                                        {x2;if:v:vv['status'] == 0}
                                            未查看
                                        {x2;else}
                                            已查看
                                        {x2;endif}
                                        </td>
                                        <td class="cell-align-center icons">
                                            {x2;if:v:vv['msg_url'] != ''}
                                            <a class="bj_a yellow-text" href="{x2;v:vv['msg_url']}&msg_id={x2;v:vv['msg_id']}" title="查看"><em class="glyphicon glyphicon-search"></em>
                                            </a>
                                            <a class="bj_a yellow-text confirm" href="index.php?user-company-message-del&&msg_id={x2;v:vv['msg_id']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                            {x2;else}
                                            <a class="bj_a yellow-text" href="index.php?user-company-message-messageinfo&msg_id={x2;v:vv['msg_id']}" title="查看"><em class="glyphicon glyphicon-search"></em></a>
                                            <a class="bj_a yellow-text confirm" href="index.php?user-company-message-del&&msg_id={x2;v:vv['msg_id']}&page={x2;$page}{x2;$u}" title="删除"><em class="glyphicon glyphicon-remove"></em></a>
                                            {x2;endif}
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                </tbody>

                            </table>
                                <div class="control-group">
                                    <div class="controls">
                                        <label class="radio-inline" style="padding-left: 0px;">
                                            <button class="btn btn-primary" type="submit" style="background-color:#009944;border:solid 1px #009944;float: left;margin-top:4px;outline:none;">批量删除</button>
                                        </label>
                                        <input type="hidden" name="page" value="{x2;$page}"/>
                                    </div>
                                </div>
                            </form>
                            <ul class="pagination pull-right">{x2;$data['pages']}</ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 右侧  end -->
        </div>
    </div>
</div>
{x2;include:footer2}
</body>
</html>
<script>
    $(function() {
        $('.submenu:eq(7)').delay(400).slideDown(700);
        $('.submenu:eq(7) li:eq(0)').addClass("active");
    });
    function doSearch()
    {
        var stime = $("#stime").val();
        var etime = $("#etime").val();
        var searchKeyword = $("#keyword").val();
        var url = 'index.php?user-company-basic-news&page={x2;$page}&companyid={x2;$companyid}';
        if(searchKeyword != ''){
            url += '&search[keyword]='+searchKeyword;
        }
        if(stime != ''){
            url += '&search[stime]='+stime;
        }
        if(etime != ''){
            url += '&search[etime]='+etime;
        }
        window.location.href = url;
    }

    function toAdd()
    {
        window.location.href = 'index.php?user-company-basic-newsadd';
    }

</script>