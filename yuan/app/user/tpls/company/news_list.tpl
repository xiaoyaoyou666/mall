{x2;include:header}
<body id="datacontent">
{x2;include:nav}
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>企业动态</a></span>
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
                    {x2;include:companyinfo}

                    <div class="zmm_panel panel-default cybershop-corporate-news">
                        <div class="zmm-qydt-title zmm-qydt-shsj1"><p><em class="title-triangle"></em>企业动态</p></div>
                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                            <div class="qydt_search">
                                <form action="index.php?company-app-company-news&page={x2;$page}&companyid={x2;$companyid}" method="post" class="form-inline">
                                   <div class="dt_keyword pull-left">
                                       <p>关键字：</p>
                                       <input type="text" id="keyword" value="{x2;$search['keyword']}" placeholder="请输入关键字" name="search[keyword]">
                                   </div>
                                    <div class="dt_keyword dt_time pull-left">
                                        <p>发布时间：</p>
                                        <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/><input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>

                                    </div>
                                    <div class="dt_keyword right-btn  pull-right">
                                        <button class="button_tt pull-left" type="submit" onclick="doSearch();return false;">搜索</button>
                                        <button class="button_tt pull-left" type="submit" onclick="toAdd();return false;">发布新动态</button>
                                    </div>

                                </form>
                            </div>
                            <div class="table-div">
                                <table class="table table-bordered table-responsive table-hover text-center">
                                 <thead>
                                    <tr>
                                         <th>
                                             标题
                                         </th>
                                         <th>
                                             发布时间
                                         </th>
                                         <th>
                                             操作
                                         </th>
                                     </tr>
                                 </thead>
                                 <tbody>
                                     {x2;tree:$data['data'],vv,cid}
                                     <tr class="table-tr2">
                                         <td class="table-td1 table-text">
                                             {x2;v:vv['news_title']}
                                         </td>
                                         <td class="table-td1">
                                             {x2;date:v:vv['create_time'],'Y-m-d'}
                                         </td>
                                         <td class="table-td2">
                                             <a class="bj_a yellow-text" target="_blank" href="index.php?company-app-company-newsInfo&news_id={x2;v:vv['news_id']}">查看</a>
                                             <a class="bj_a yellow-text" target="_blank" href="index.php?user-company-basic-newsedit&news_id={x2;v:vv['news_id']}">编辑</a>
                                             <a class=" yellow-text confirm" href="index.php?user-company-basic-newsdel&news_id={x2;v:vv['news_id']}">删除</a>
                                         </td>
                                     </tr>
                                     {x2;endtree}
                                 </tbody>
                                </table>
                            </div>


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
        $('.submenu:eq(0)').delay(400).slideDown(700);
        $('.submenu:eq(0) li:eq(2)').addClass("active");
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