{x2;include:header}
<body id="datacontent">
{x2;include:nav}
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>系统消息</a> > <a>消息详情</a></span>
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

                    <div class="zmm_panel panel-default">
                        <div class="zmm-qydt-title zmm-qydt-shsj1"><p>系统消息详情</p></div>
                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                            <table>
                                <tr class="table-tr2">
                                    <td class="table-td1">
                                        标题
                                    </td>
                                    <td class="table-td2">
                                        {x2;$data['msg_title']}
                                    </td>
                                </tr>
                                <tr class="table-tr2">
                                    <td class="table-td1">
                                        发送时间
                                    </td>
                                    <td class="table-td2">
                                        {x2;date:$data['msg_time'],'Y-m-d'}
                                    </td>
                                </tr>
                                <tr class="table-tr2">
                                    <td class="table-td1">
                                        消息内容
                                    </td>
                                    <td class="table-td2">
                                       <div style="width:700px;word-wrap:break-word;text-align: left;"> {x2;$data['msg_content']}</div>
                                    </td>
                                </tr>
                            </table>
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
	  var cc = document.getElementById("footerab");
		window.onload = window.onscroll = function () {
    	var st = document.body.scrollTop || document.documentElement.scrollTop;
    	var deh = document.documentElement.clientHeight;
    	cc.style.top = st+deh-cc.offsetHeight+"px";
    $(function() {
        $('.submenu:eq(7)').delay(400).slideDown(700);
        $('.submenu:eq(7) li:eq(0)').addClass("active");
	}
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