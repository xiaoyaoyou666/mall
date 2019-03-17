{x2;include:header}
<style type="text/css">
    .table a {
        color: #ff8a00
    }

    .table a:hover {
        color: #009944
    }

    .zmm-panel-body {
        padding-top: 15px;
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

    .tips{
        font-size:12px; 
        color:red;
        margin-right: 550px;
    }

    .btn-group > .btn:last-child:not(:first-child).disable-text, .btn-group > .dropdown-toggle:not(:first-child).disable-text{
        color: #999;
        cursor: not-allowed;
    }

    .disable-text{
        color: #999;
        cursor: not-allowed;
    }
</style>
<body>
{x2;include:nav}

<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?{x2;$_app}-company">企业中心</a> > <a href="index.php?user-company-items">网格超市货架管理</a>> <a>框架协议</a></span>
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
                            <p><em class="title-triangle"></em>框架协议&nbsp;</p><br/>

                        </div>
                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj agreement-list">

                            <form action="#" method="post" class="form-inline">
                                <table class="table conditions">
                                    <tbody>
                                    <tr>
                                        <div style="background-color: #fefaf5;border-bottom: #fdf2e5 !important;margin-bottom: 15px;padding-left: 10px;">
                                            <span class="tips" style="margin-right: 0">*上传框架协议前，请确认框架协议所包含的商品已添加至‘货架维护’</span>
                                        </div>
                                        <div class="condition-row form-inline" style="border: none;margin-bottom: 0;padding: 0 15px;">
                                            <div class="form-group" style="font-size: 14px;">
                                                关键字：
                                                <input class="form-control goods-input" id="keyword"
                                                       name="search[keyword]"
                                                       type="text" value="{x2;$keyword}" style="width: 100px"/>
                                            </div>
                                            <div class="form-group" style="font-size: 14px;">
                                                状态：
                                                <select class="form-control" id="status"
                                                        name="search[status]" style="width: 80px;padding: 3px 5px">
                                                    <option value="">请选择</option>
                                                    <option value="1" {x2;if:$status== 1}
                                                            selected{x2;endif}>
                                                        未生效
                                                    </option>
                                                    <option value="2" {x2;if:$status== 2}
                                                            selected{x2;endif}>
                                                        待生效
                                                    </option>

                                                    <option value="3" {x2;if:$status== 3}
                                                            selected{x2;endif}>
                                                        生效
                                                    </option>
                                                    <option value="4" {x2;if:$status== 4}
                                                            selected{x2;endif}>
                                                        已失效
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="form-group" style="font-size: 14px;">
                                                甲方：
                                                <input class="form-control goods-input" id="salername"
                                                       name="search[salername]"
                                                       type="text" value="{x2;$salername}" style="width: 100px"/>
                                            </div>

                                            <div class="form-group" style="font-size: 14px;">
                                                有效期至：
                                                <input class="form-control goods-time-input" type="text"
                                                       name="search[endtime]"
                                                       id="entering-time" value="{x2;$endtime}" style="width: 100px"/>
                                            </div>
                                            <div class="form-group classify-col" style="font-size: 14px;">
                                                上传日期：
                                                <input class="form-control goods-time-input" type="text"
                                                       name="search[addtime]" id="upfile-time"
                                                       value="{x2;$addtime}" style="width: 100px"/>
                                            </div>
                                            <div class="form-group" style="text-align: right;padding-left: 20px">
                                                <button class="btn btn-primary" type="button" onclick="doSearch()">搜索
                                                </button>
                                            </div>
                                        </div>
                                    </tr>
                                    <!--<tr>-->
                                        <!--<div class="condition-row" style="padding: 3px 0;">-->
                                            <!--<div class="col-md-8 classify-col" style="font-size: 14px;">-->
                                                <!--上传日期：-->
                                                <!--<input class="form-control goods-time-input" type="text"-->
                                                       <!--name="search[addtime]" id="upfile-time"-->
                                                       <!--value="{x2;$addtime}" style="width: 100px"/>-->
                                            <!--</div>-->
                                            <!--<div class="col-md-4" style="text-align: right;padding-right: 54px;">-->
                                                <!--<button style="margin-left: 93px;" class="btn btn-primary" type="button" onclick="doSearch()">搜索-->
                                                <!--</button>-->
                                            <!--</div>-->
                                        <!--</div>-->
                                    <!--</tr>-->
                                    </tbody>
                                </table>
                                
                            </form>

                            <div class="operater-bar">
                                {x2;if:$pageStatus == '1'}
                                    {x2;if:$agreementarr['data']}
                                    <div><a href="javascript:exportReport()"><em class="tr-icon icon-upload"></em>导出</a></div>
                                    {x2;else}
                                    <div><a href="#"><em class="tr-icon icon-upload-disable"></em>导出</a></div>
                                    {x2;endif}
                                {x2;endif}
                                <div><a href="index.php?user-company-agreement-agreementAdd"><em class="tr-icon icon-add"></em>新增</a></div>
                            </div>

                            <form action="#" method="post">
                                {x2;if:$pageStatus == '1'}
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                        <tr class="info">
                                            <th>ID</th>
                                            <th>协议名称</th>
                                            <th>甲方</th>
                                            <th width="100px">有效期至</th>
                                            <th width="100px">上传时间</th>
                                            <th width="80px">协议状态</th>
                                            <th width="77px">审核状态</th>
                                            <th width="200px">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {x2;tree:$agreementarr['data'],agreement,aid}
                                        <tr>
                                            <td class="picture">
                                               {x2;v:agreement['agreementid']}
                                            </td>
                                            <td class="table-text">
                                                {x2;v:agreement['filename']}
                                            </td>
                                            <td>
                                                 {x2;v:agreement['salername']}
                                            </td>

                                            <td>
                                                {x2;date:v:agreement['endtime'],'Y-m-d'}
                                            </td>
                                            <td class="cell-align-center">
                                                {x2;date:v:agreement['addtime'],'Y-m-d'}
                                            </td>

                                            <td>{x2;$xieyistatus[v:agreement['status']]}</td>
                                            <td>
                                               <!--  <span>{x2;$lookstatus[v:agreement['auditor_status']]}</span> -->
                                                <span style="position: relative">{x2;$lookstatus[v:agreement['auditor_status']]}
                                                    {x2;if:v:agreement['auditor_status']==4}
                                                    <em class="tr-icon icon-more">
                                                        <div class="dialog-box">
                                                        {x2;v:agreement['reason']}
                                                        </div>
                                                    </em>
                                                    {x2;endif}
                                                
                                                </span>
                                            </td>
                                            <td class="actions" style="padding: 0;">
                                                <div class="btn-group">

                                                    <a class="btn yellow-text" href="index.php?user-company-agreement-agreementInfo&agreementid={x2;v:agreement['agreementid']}" title="详情">
                                                        <em class="iconfont">&#xe605;</em>
                                                    </a>
                                                   
                                                    {x2;if:v:agreement['status']==3}
                                                        {x2;if:v:agreement['auditor_status']==2}
                                                        <a class="ajax btn disable-text" title="失效">
                                                            <em class="iconfont icon-disable">&#xe606;</em>
                                                        </a>
                                                        {x2;else}
                                                        <a class="invalid btn yellow-text"  href="index.php?user-company-agreement-agreementApply&agreementid={x2;v:agreement['agreementid']}&type=2" title="失效">
                                                            <em class="iconfont icon-disable">&#xe606;</em>
                                                        </a>
                                                        {x2;endif} 
                                                    {x2;endif}



                                                    <!--（未生效,未申请的可以提交生效申请或者未通过）-->
                                                    {x2;if:(v:agreement['auditor_status']==4 && v:agreement['status']!=3) || (v:agreement['auditor_status']==1 && v:agreement['status']==1)}
                                                    <a class="collect btn yellow-text" href="index.php?user-company-agreement-agreementApply&agreementid={x2;v:agreement['agreementid']}&type=1" title="生效">
                                                        <em class="iconfont">&#xe607;</em>
                                                    </a>
                                                   
                                                    {x2;elseif:v:agreement['status']==1 && v:agreement['auditor_status']==2}
                                                    <a class="ajax btn disable-text" title="生效">
                                                        <em class="iconfont icon-disable">&#xe607;</em>
                                                    </a>
                                                    {x2;endif}



                                                    <!--生效的协议不能修改-->
                                                    {x2;if:v:agreement['status']==1 && v:agreement['auditor_status']==1}
                                                    <a class="btn yellow-text" href="index.php?user-company-agreement-agreementEdit&agreementid={x2;v:agreement['agreementid']}" title="修改">
                                                        <em class="glyphicon glyphicon-edit"></em>
                                                    </a>
                                                    {x2;endif}
                                                    
                                                     <!--已失效和（未生效和未提交的）可以删除-->
                                                    {x2;if:v:agreement['status']==4 || (v:agreement['status']==1 && v:agreement['auditor_status']==1)}
                                                    <a class="btn yellow-text confirm" href="index.php?user-company-agreement-agreementDel&agreementid={x2;v:agreement['agreementid']}" title="删除">
                                                        <em class="glyphicon glyphicon-remove"></em>
                                                    </a>

                                                    {x2;endif}
                                                </div>
                                            </td>
                                        </tr>
                                        {x2;endtree}


                                        </tbody>
                                    </table>

                                {x2;endif}
                                <!--空警告-->
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
                                <!--空内容警告-->
                                    <div class="empty-content-box">
                                        <div class='empty-content-img'>
                                            <img src="app/core/styles/img/empty-content.png" alt="内容为空" style="width: 224px">
                                        </div>
                                        <p class="empty-content-title">尚未创建相关信息哦～</p>
                                    </div>
                                {x2;endif}

                                    <ul class="pagination pull-right">{x2;$agreementarr['pages']}</ul>
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
<script type="text/javascript" src="app/core/styles/js/user/company/agreementinfo.js"></script>
</body>

</html>
