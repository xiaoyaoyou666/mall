{x2;include:header}
<body>
<style>
    .ym_on{ background-color: #ff8a00; color: #fff; border: 1px solid #ff8a00; }
    .qyk-filter td button{
        background:#009944;
    }
    .qyk-filter td button:hover{
        background:#037034;
    }
    .qyk-list-tab .nav-tabs > li.active > a,.qyk-list-tab .nav-tabs > li.active > a:hover{
        background:#009944;
    }
</style>
{x2;include:nav}
<!--面包屑-->
<div class="zmm-zx-centent">
    <div class="container" id="datacontent">

        <!-- 面包屑 start -->
        <div class="hln-zx-centent-title t20 b20">
            搜索结果
        </div>
        <!-- 面包屑 end -->
        <!-- 左侧 start -->
        <div class="pull-left" style="width: 880px; background-color: #ededed;">
            <!-- 企业列表 start -->
            <div class="box_1">
                <div class="zmm-qydt-title zmm-qydt-shsj1"><p>企业列表</p></div>
                <div class="qyk-list-tab t20">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs">
                        <li {x2;if:$category == false}class="active"{x2;endif}><a href="index.php?company-app-index">全部</a></li>
                        <li {x2;if:$category == '设备商'}class="active"{x2;endif}><a href="index.php?company-app-index&cat=设备商">设备商</a></li>
                        <li {x2;if:$category == '材料商'}class="active"{x2;endif}><a href="index.php?company-app-index&cat=材料商">材料商</a></li>
                        <li {x2;if:$category == '施工商'}class="active"{x2;endif}><a href="index.php?company-app-index&cat=施工商">施工商</a></li>
                        <li {x2;if:$category == '服务商'}class="active"{x2;endif}><a href="index.php?company-app-index&cat=服务商">服务商</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <!--其他服务商-->
                        <div class="tab-pane active" id="qyk-list-fws">
                            <form action="index.php?company-app-index&page={x2;$page}" method="post" class="form-inline">
                                <table class="qyk-filter t20 demo" width="100%">
                                    <tr>
                                        <td align="right" width="100px"><b>快速检索：</b></td>
                                        <td class="pull-left">
                                            <input type="text" id="keyword" value="{x2;$keyword}" name="keyword" placeholder="请输入您要搜索的企业名称">
                                            <button type="submit">搜索</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                </table>
                            </form>
                            <!--排序-->
                            <div class="sjzx-list-px">
                                <span class="pull-left t5">排序</span>
                                <span class="pull-left t5 l30 orderBy" name="rec"><a href="index.php?company-app-index&cat={x2;$category}&page={x2;$page}&=keyword={x2;$keyword}&level=1">按推荐指数<i class="glyphicon glyphicon-triangle-top l5"></i></a></span>
                                <span class="pull-left t5 l30 orderBy" name="time"><a href="index.php?company-app-index&cat={x2;$category}&page={x2;$page}&=keyword={x2;$keyword}&time=1">按发布时间<i class="glyphicon glyphicon-triangle-top l5"></i></a></span>
                                <!--
                                <span class="pull-left t5 l30 orderBy" name="fav">
                                    <a href="index.php?company-app-index&cat={x2;$category}&page={x2;$page}&=keyword={x2;$keyword}">按收藏数<i class="glyphicon glyphicon-triangle-top l5"></i>
                                    </a>
                                </span>
                                -->
                                <b class="pull-right t5">
                                    共搜索到<font class="cff7">{x2;$companyData['number']}</font>家企业
                                </b>
                            </div>
                            <div class="cp-list">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    {x2;tree:$companyData['data'],vvv,iid}
                                    <tr>
                                        <td width="210" valign="middle"><div class="img-bor"><img src="{x2;if:v:vvv['company_logo_da']}{x2;v:vvv['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}" style="width: 195px;height: 130px;max-height:none;max-width:none"/></div></td>
                                        <td valign="top" width="580">
                                            <a href="index.php?company-app-company-index&companyid={x2;v:vvv['userid']}" class="cp-list-title"><h4>{x2;v:vvv['company_name']}</h4>
                                            </a>
                                            <p class="t10">
                                                    <span class="sjzx-detail-title">

                                                        {x2;if:v:vvv['company_level'] == 0}
                                                        <i class="zs zs03" style="background-position:right 0px;font-style: normal;">推荐指数</i>
                                                        {x2;elseif:v:vvv['company_level'] == 1}
                                                        <i class="zs zs03" style="background-position:right -22px;font-style: normal;">推荐指数</i>
                                                        {x2;elseif:v:vvv['company_level'] == 2}
                                                        <i class="zs zs03" style="background-position:right -44px;font-style: normal;">推荐指数</i>
                                                        {x2;elseif:v:vvv['company_level'] == 3}
                                                        <i class="zs zs03" style="background-position:right -66px;font-style: normal;">推荐指数</i>
                                                        {x2;elseif:v:vvv['company_level'] == 4}
                                                        <i class="zs zs03" style="background-position:right -88px;font-style: normal;">推荐指数</i>
                                                        {x2;else}
                                                        <i class="zs zs03" style="background-position:right -110px;font-style: normal;">推荐指数</i>
                                                        {x2;endif}
                                                    </span>

                                                <span>收藏：<font class="cff7">1</font> </span>
                                                <span>注册资金：{x2;v:vvv['company_capital']}</span>
                                                <span>主营产品：{x2;substring:v:vvv['company_scope'],81}</span>

                                            </p>
                                        </td>
                                        <td align="center">
                                            <p>
                                                <a href="index.php?item-app-company&companyid={x2;v:vvv['userid']}" class="btn-border-gray">进入网格超市</a>
                                            </p>
                                        </td>
                                    </tr>
                                    {x2;endtree}
                                </table>
                            </div>
                            <!--分页-->
                            <div class="why-page text-center t40">
                                <ul>
                                    {x2;$companyData['pages']}
                                </ul>
                            </div>
                        </div>
                        <!--其他服务商-->
                    </div>
                </div>
            </div>
        </div>
        <!-- 企业列表 end -->
        <div class="pull-right" style="width: 300px;">
            <!--入驻-->
            <div class="qyk-list-rz">
                <p class="text-center"><span>海量项目<br>商机</span><span>商机精准<br>匹配</span><span>高效在线<br>合作</span></p>
                <p class="text-center t30" style="color: #fff">深度挖掘项目合作商机</p>
            </div>
            <!--投资项目-->
            <div class="sjzx-detail-wrap sjzx-detail-rightitem t20" style="padding: 0;">
                <div class="zmm-qydt-title zmm-qydt-shsj1"><p>成功案例</p></div>
                {x2;tree:$caseData,val,k}
                <a class="case_box" href="index.php?company-app-company-caseinfo&case_id={x2;v:val['case_id']}&companyid={x2;v:val['company_id']}" title="">
                    <dl>
                        <dt><img src="{x2;if:v:val['case_logo']}{x2;v:val['case_logo']}{x2;else}app/core/styles/images/default02.jpg{x2;endif}" alt="" width="106"></dt>
                        <dd>
                            <h4>{x2;v:val['case_title']}</h4>
                            <p class="c999 t5">
                                案例类型：
                                <br>
                                {x2;v:val['case_category']}
                            </p>
                        </dd>
                    </dl>
                </a>
                {x2;endtree}
            </div>
        </div>
    </div>
</div>

<!--foot-->
<div class="clearfix"></div>
{x2;include:footer2}
</body>
</html>
