{x2;include:header}
<body style="position: relative">
{x2;include:nav2}
<style>
    /*.modal-backdrop.in{*/
    /*opacity: 0;*/
    /*}*/
    .orders-table .product-list thead tr, .info-list thead tr {
        border-bottom: none;
        background-color: #fefbf8;
    }

    .product-list tbody .product-name td {
        border-top: none;
        background-color: #fefbf8;
    }

    .tr-icon {
        width: 16px;
        height: 17px;
        cursor: pointer;
        position: relative;
        top: 3px;
    }

    #pdf-box {
        display: none;
        position: absolute;
        top: 0;
        z-index: 99;
        overflow-y: hidden;
    }

    .close-pdf {
        position: fixed;
        right: 22px;
        color: white;
        top: 7px;
        width: 20px;
        z-index: 9999;
        font-size: 27px;
        display: none;
        cursor: pointer;
    }

    .open-file {
        cursor: pointer;
    }

    .condition-table {
        margin: 0 20px;
        clear: both;
    }

    .condition-table .form-group {
        padding: 10px 5px;
        float: left;
    }

    .table-div .table thead {
        background-color: #ededed;
    }

    .remark-detail {
        word-break: break-all;
        border: 1px solid #ededed;
        cursor: pointer;
        padding: 10px;
        border-radius: 4px;
    }

    .table > tbody > tr > td.product-list-td {
        padding: 0;
    }

    #upload-file-modal .modal-dialog {
        width: 400px;
        margin-top: 160px;
    }

    .file-type-note {
        text-align: center;
        color: #999;
        margin-top: 20px;
    }


    .modal-footer button {
        width: 100px;
    }

    .modal-header {
        font-size: 16px;
    }

    .modal-body {
        padding: 20px 15px 10px !important;
    }

    .modal-footer {
        padding-bottom: 26px;
    }

    .form-horizontal .form-group {
        margin-left: 0;
        margin-right: 0;
    }

    .btn-cancel {
        background-color: #e4e4e4;
        border: none;
    }

    textarea[name=remark-input] {
        padding: 10px;
    }

    /*.contact-row span{*/
    /*width: 80px;*/
    /*display: inline-block;*/
    /*text-align: left;*/
    /*word-break: break-all;*/
    /*}*/
    .contact-row {
        width: 110px;
    }

    .fail-text {
        color: #999;
    }

    .green-text {
        color: #009944;
    }

    .form-inline .form-control {
        display: inline-block;
        width: auto;
        vertical-align: middle;
        width: 110px !important;
        font-size: 12px;
        padding: 1px 4px;
    }

    .product-list .add-btn {
        border: 1px solid #009944;
        border-radius: 4px;
        color: #009944;
        padding: 0 5px;
        line-height: 20px;
        font-size: 12px;
    }

    #keyword {
        padding: 0 10px;
    }

    .drop li {
        opacity: 0;
        transform-origin: top center;
        padding-left: 5px;
    }

    .drop li a {
        background-color: rgba(23, 23, 50, .7);
        padding: 10px 0
    }

    .main {
        width: 110px;
        position: relative;
    }

    .table > thead > tr > th {
        border-bottom: none;
    }

    .menu6 {
        display: none;
        position: absolute;
        z-index: 220;
        background-color: #f5f5f5;
        color: #666;
        width: 110px;
        padding-bottom: 5px;
        margin-left: -5px;
        left: 5px;
    }

    .main a:hover .menu6 {
        display: block;
    }

    .main a:hover .menu6 li:first-of-type {
        animation: menu6 .3s ease-in-out forwards;
        animation-delay: .2s
    }

    .main a:hover .menu6 li:last-of-type {
        animation: menu6 .3s ease-in-out forwards;
        animation-delay: .3s
    }
    .contact-row.drop .line-style{
        color: #009944;
    }

    .line2-style {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
    }

    .line-style {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        /*display:-webkit-box;*/
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
    }

    .bottom-line-style {
        overflow: hidden;
        text-overflow: ellipsis;
        /*display:-webkit-box;*/
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
    }


    @keyframes menu6 {
        0% {
            opacity: 0;
            transform: scale(2)
        }

        100% {
            opacity: 1;
            transform: scale(1)
        }
    }

    .error-text {
        color: #ff3333;
        text-align: left;
        display: none;
    }

    #add-remark-modal .error-text {
        padding-left: 5px;
        line-height: 14px;
    }

    .open-remark {
        cursor: pointer;
    }

    .empty-content {
        padding: 0 20px 30px;
    }

    .frd_hint {
        width: 100%;
        border: 2px solid #ff8700;
        box-sizing: border-box;
        margin-top: 30px
    }

    .frd_hint .frd_hints {
        width: 100%;
        height: 100%;
        background: #fff3e3;
        padding: 36px 60px;
    }

    .frd_hint .frd_hints p {
        font-size: 14px;
        color: #666666;
    }

    .frd_hint .frd_hints .hint_sorry {
        font-size: 16px;
        font-weight: bold;
    }

    .table-content a {
        font-size: 12px;
    }

    #company {
        padding: 0 8px;
        width: 117px;
    }
    .sjzx-detail-title .zs{
        padding-right: 80px;
        margin-top: 5px;
        background: url('app/core/styles/img/star_new.png') top right no-repeat;
        height: 15px;
        line-height: 15px;
    }
    .sjzx-detail-title .zs00{ background-position: right 1px; }
    .sjzx-detail-title .zs01{ background-position: right -14px; }
    .sjzx-detail-title .zs02{ background-position: right -30px; }
    .sjzx-detail-title .zs03{ background-position: right -46px; }
    .sjzx-detail-title .zs04{ background-position: right -62px; }
    .sjzx-detail-title .zs05{ background-position: right -78px; }
    .sjzx-detail-title .zs06{ background-position: right -95px; }
    .sjzx-detail-title .zs07{ background-position: right -111px; }
    .table-div-title .pull-right{
        padding: 10px 20px 6px;
    }

    .table-div-title .pull-right div{
        height: 24px;
        line-height: 21px;
        border-radius: 5px;
        color: #323232;
        width: 100px;
        text-align: center;
        cursor: pointer;
    }
    .table-div-title .pull-right div:hover{
        color: #009944;
    }
    .table-div-title .pull-right .iconfont{
        color: #009944;
        padding-right: 3px;
    }
    .yellow-text{
        font-size: 12px;
    }
    #department .modal-body{
        display: flex;
        flex-wrap: wrap;
    }
    #department .modal-body .checkbox{
        margin: 0;
        padding: 0 5px;
    }
    /*#sed_select,#three_selct{*/
        /*display: none;*/
    /*}*/
    .score-input{
        display: none;
        width: 80px;
    }
    .score-input input{
        width: 100%;
        text-indent: 5px;
    }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		if($(window).width()>1600){
			$(".float_box .ul_df li p").css("line-height","30px")
		}
	})
</script>
<div class="container right-bot-content suplier-list">
    <div class="table-div">
        <div class="table-div-title">
            <span><em class="title-triangle"></em>供应商列表</span>
            <div class="pull-right">
                <a href="index.php?user-company-index-company_maps">
                    <div><em class="iconfont" style="font-size: 20px">&#xe696;</em>供应商地图</div>
                </a>
                {x2;if:$isEmtpy !== 'yes'}
                {x2;if:$_user['users_role']==2}
                <a  href="javascript:exportReport()">
                    <div><em class="iconfont">&#xe6a0;</em>导出</div>
                </a>
                {x2;endif}
                {x2;endif}

            </div>
        </div>
        <div class="search-bar">

            <div class="condition-table form-inline">
                <div class="form-group">
                    供应商类别：
                    <select class="form-control" name="search[purchasetype]" id="purchasetype">
                        <option value=''>全部</option>
                        <option value='1' {x2;if:$querystr['userType'] == 1} selected = "selected" {x2;endif} >普通供应商</option>
                        <option value='2' {x2;if:$querystr['userType'] == 2} selected = "selected" {x2;endif} >合格供应商</option>
                        <option value='3' {x2;if:$querystr['userType'] == 3} selected = "selected" {x2;endif} >战略合作商</option>
                        <option value='4' {x2;if:$querystr['userType'] == 4} selected = "selected" {x2;endif} >黑名单供应商</option>
                        <option value='5' {x2;if:$querystr['userType'] == 5} selected = "selected" {x2;endif} >待复核供应商</option>
                    </select>
                </div>
                <div class="form-group">
                    所属部门：
                    <select class="form-control" name="search[departmentVal]" id="departmentVal">
                        <option value=''>全部</option>
                        <option value='1' {x2;if:$querystr['userBranch'] == 1} selected = "selected" {x2;endif}>资产管理公司</option>
                        <option value='2' {x2;if:$querystr['userBranch'] == 2} selected = "selected" {x2;endif}>工程中心</option>
                        <option value='3' {x2;if:$querystr['userBranch'] == 3} selected = "selected" {x2;endif}>技术服务公司</option>
                        <option value='4' {x2;if:$querystr['userBranch'] == 4} selected = "selected" {x2;endif}>开发中心</option>
                        <option value='5' {x2;if:$querystr['userBranch'] == 5} selected = "selected" {x2;endif}>光合加</option>
                        <option value='6' {x2;if:$querystr['userBranch'] == 6} selected = "selected" {x2;endif}>其他</option>
                    </select>
                </div>
                <div class="form-group">
                    供货范围：

                    <select class="form-control" name="search[purchasestatus]" id="first_select">
                        <option value=''>全部</option>
                        {x2;tree:$parentcat,cat,cid}
                        <option value='{x2;v:cat['catid']}' {x2;if:v:cat['isSet'] == 1} selected = "selected" {x2;endif}
                        >{x2;v:cat['catname']}</option>
                        {x2;endtree}
                    </select>
                    {x2;if:$secondCateArr}
                    <select class="form-control" id="sed_select">
                        <option value="">全部</option>
                        {x2;tree:$secondCateArr,secondcat,cid}
                        <option value='{x2;v:secondcat['catid']}' {x2;if:v:secondcat['isSet'] == 1} selected = "selected" {x2;endif}
                        >{x2;v:secondcat['catname']}</option>
                        {x2;endtree}
                    </select>
                    {x2;endif}
                    {x2;if:$thirdCateArr}
                    <select class="form-control" id="three_selct">
                        <option value="">全部</option>
                        {x2;tree:$thirdCateArr,thirdcat,cid}
                        <option value='{x2;v:thirdcat['catid']}' {x2;if:v:thirdcat['isSet'] == 1} selected = "selected" {x2;endif}
                        >{x2;v:thirdcat['catname']}</option>
                        {x2;endtree}
                    </select>
                    {x2;endif}
                </div>
                <div class="form-group">
                    地域筛选：

                    <select class="autoloaditem combox form-control" id="company_province" current="" autocomplete="off">
                        <option value="">全部</option>
                        {x2;tree:$provinceArr,provinces,pid}
                        <option value='{x2;v:provinces['provinceid']}' {x2;if:v:provinces['isSet'] == 1} selected = "selected" {x2;endif}
                        >{x2;v:provinces['province']}</option>
                        {x2;endtree}
                    </select>
                    {x2;if:$cityArr}
                    <select class="autoloaditem combox form-control" id="company_city" current="" autocomplete="off" style="width: 120px;">
                        <option value="">全部</option>
                        {x2;tree:$cityArr,citys,pid}
                        <option value='{x2;v:citys['cityid']}' {x2;if:v:citys['isSet'] == 1} selected = "selected" {x2;endif}
                        >{x2;v:citys['city']}</option>
                        {x2;endtree}
                    </select>
                    {x2;endif}
                </div>
                <div class="form-group">
                    {x2;if:$querystr['query'] != ''}
                    <input style="width: 126px;" class="form-control" name="search[keyword]" size="6"
                           type="text" value="{x2;$querystr['query']}" id="keyword" placeholder="请输入企业名称"/>
                    {x2;else}
                    <input style="width: 126px;" class="form-control" name="search[keyword]" size="6"
                           type="text" value="{x2;$search['keyword']}" id="keyword" placeholder="请输入企业名称"/>
                    {x2;endif}

                    <button class="btn btn-primary search-btn" style="background-color:#009944;">搜索
                    </button>
                </div>
            </div>
        </div>
        <div class="table-content ">
            <div class="table-div-body-content">
                <table class="table table-responsive table-hover" style="border: 1px solid #ededed;">
                    <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center" width="135px">企业名称</th>
                        <th class="text-center">类别</th>
                        <th class="text-center">现场评价</th>
                        <th class="text-center" width="130px">供货范围</th>
                        <th class="text-center">合作项目</th>
                        <th class="text-center">综合评价</th>
                        <th class="text-center" width="110px">第一联系人</th>
                        <th class="text-center">所属部门</th>
                        <th class="text-center">地域</th>
                        <th class="text-center">备注</th>
                        <th class="text-center">准入审核</th>
                    </tr>
                    </thead>
                    <tbody>
                    {x2;tree:$users['data'],user,oid}
                    {x2;eval: v:number = v:user['userid']}
                    <tr id="{x2;v:user['userid']}">
                        <td>{x2;v:user['userid']}</td>
                        <td><a href="index.php?company-app-company-index&companyid={x2;v:user['userid']}"
                               title="{x2;v:user['company_name']}">{x2;v:user['company_name']}{x2;if:v:user['users_type'] == 5}<span style="color: red;">&nbsp;*</span>{x2;endif}</a></td>
                        <td class="yellow-text category" data-id="{x2;v:user['userid']}">
                            {x2;$type[v:user['users_type']]}
                            <span style="display: block;line-height: 14px;color:#999">{x2;v:user['istrue_updatetime']}</span>
                        </td>
                        <td class="yellow-text evaluate">
                            {x2;if:v:user['comnum'] == 0}
                            <a class="add-btn evalution-add-btn" data-id="{x2;v:user['userid']}">
                                <em class="tr-icon icon-add"></em>新增</a>
                            {x2;endif}
                            {x2;if:v:user['comnum'] != 0}
                            {x2;v:user['comnum']}
                            {x2;endif}
                        </td>
                        <td title="{x2;v:user['cateName']}">
                            <div class="line2-style" style="width:130px">
                                {x2;v:user['cateName']}
                            </div>

                        </td>
                        <td class="yellow-text project">
                            {x2;if:v:user['eval_cum'] == 0}
                            <a class="add-btn project-add-btn" data-id="{x2;v:user['userid']}">
                                <em class="tr-icon icon-add"></em>新增</a>
                            {x2;else}
                            {x2;v:user['eval_cum']}
                            {x2;endif}

                        </td>
                        <td class="score-box">
                            <div>

                                  <!-- 此值 代表 返回评分的值   {x2;v:user['grade']}
                                        *大于等于95，五星；--6
                                        *85-94，四星；--5
                                        *75-84，三星；--4
                                        *65-74，二星；--3
                                        *60-64一星半；  --2
                                        *56-59一星；--1
                                        *小于等于55，半星 --0
                                  -->
                                <span class="sjzx-detail-title" style="padding-left:0px;">
                                    <!-- zs01-zs05代表等级，分别代表1-5个等级-->
                                    <i class="zs zs0{x2;v:user['user_grade']}" data-grade="{x2;v:user['grade']}"></i>
                                </span>
                                <div class="score-input">
                                    <input type="text" minlength="0" data-id="{x2;v:user['userid']}">
                                </div>
                            </div>
                        </td>
                        <td width="120px">
                            <div class="main">
                                <a class="contact-row">
                                    <div class="line-style" title="{x2;v:user['company_contacter']}">
                                        {x2;v:user['company_contacter']}
                                    </div>
                                    <div class="line-style" title="{x2;v:user['company_phone']}" style="height: 24px">
                                        {x2;v:user['company_phone']}
                                    </div>
                                    <ul class="contact-row drop menu6">
                                        <li class="line-style" title="{x2;v:user['company_tel']}">
                                            {x2;v:user['company_tel']}
                                        </li>
                                        <li class="line-style" title="{x2;v:user['company_email']}">
                                            {x2;v:user['company_email']}
                                        </li>
                                    </ul>
                                </a>

                            </div>
                        </td>
                        <td width="100px">
                            <div class="yellow-text department"  data-id="{x2;v:user['userid']}" data-branchId="{x2;v:user['users_branch']}">
                                {x2;if:v:user['users_branch'] == 0}
                                <a class="add-btn department-add-btn" data-id="{x2;v:user['userid']}">
                                    <em class="tr-icon icon-add"></em>新增</a>
                                {x2;endif}
                                {x2;if:v:user['users_branch'] != 0}
                                      {x2;v:user['branch']}
                                {x2;endif}
                            </div>
                        </td>
                        <td width="110px">
                            {x2;v:user['cityName']}
                        </td>

                        <td class="yellow-text remarks">
                            {x2;if:v:user['remarknum'] == 0}
                            <a class="add-btn remark-add-btn" data-id="{x2;v:user['userid']}">
                                <em class="tr-icon icon-add"></em>新增</a>
                            {x2;endif}
                            {x2;if:v:user['remarknum'] != 0}
                            {x2;v:user['remarknum']}
                            {x2;endif}
                        </td>
                        <td>
                            {x2;if:v:user['company_istrue'] == 0}
                            <a class="yellow-text review-btn" data-type="allow"
                               data-phone="{x2;v:user['company_mobile']}" data-id="{x2;v:user['userid']}">准入</a>
                            <a class="yellow-text review-btn" data-type="forbid" data-id="{x2;v:user['userid']}">不通过</a>
                            {x2;elseif:v:user['company_istrue'] == 1}
                            <span class="green-text">已通过<span style="display: block;line-height: 14px;">{x2;v:user['istrue_time']}</span></span>
                            {x2;else}
                            <span class="fail-text">未通过<span style="display: block;line-height: 14px;">{x2;v:user['istrue_time']}</span></span>
                            {x2;endif}

                        </td>
                    </tr>

                    <!--评价list-->
                    <tr class="info-list evalution-info-list">
                        <td colspan="12" class="product-list-td">
                            {x2;eval:v:commentdocs = $documents[v:number]['comment']}
                            {x2;if:v:commentdocs != []}
                            <table class="table product-list">
                                <thead>
                                <tr>
                                    <th width="500px">文档名称</th>
                                    <th>上传人</th>
                                    <th>上传时间</th>
                                    <th>操作</th>
                                    <th><a class="add-btn evalution-add-btn" data-id="{x2;v:user['userid']}">新增</a>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>

                                {x2;tree:$documents[v:number]['comment'],comment,uids}
                                <tr class="product-name">
                                    <td class="open-file" data-url="" data-type="pdf"><a
                                            href="?{x2;$_app}-company-privatement-test2&{x2;v:comment['doc_url']}"
                                            target="_blank">{x2;v:comment['doc_title']}</a></td>
                                    <td>
                                        {x2;v:comment['username']}
                                    </td>
                                    <td>{x2;v:comment['doc_time']}</td>
                                    <td><span class="yellow-text delete-btn" data-type="evalution"
                                              data-id="{x2;v:user['userid']}"
                                              data-doc-id="{x2;v:comment['doc_id']}">删除</span></td>
                                    <td></td>
                                </tr>
                                {x2;endtree}
                                </tbody>
                            </table>
                            {x2;endif}
                        </td>
                    </tr>

                    <!--合作项目list-->
                    <tr class="info-list project-info-list">
                        <td colspan="12" class="product-list-td">
                            {x2;eval:v:projectdocs = $documents[v:number]['project']}
                            <table class="table product-list">
                                <thead>
                                <tr>
                                    <th width="500px">文档名称</th>
                                    <th>上传人</th>
                                    <th>上传时间</th>
                                    <th>操作</th>
                                    <th><a class="add-btn project-add-btn" data-id="{x2;v:user['userid']}">新增</a></th>
                                </tr>
                                </thead>
                                <tbody>
                                {x2;tree:$documents[v:number]['project'],project,uids}
                                <tr class="product-name">
                                    <td class="open-file line-style" data-url="{x2;v:project['doc_url']}"
                                        data-type="pdf">{x2;v:project['doc_title']}
                                    </td>
                                    <td>
                                        {x2;v:project['username']}
                                    </td>
                                    <td>{x2;v:project['doc_time']}</td>
                                    <td><span class="yellow-text delete-btn" data-type="project"
                                              data-id="{x2;v:user['userid']}"
                                              data-doc-id="{x2;v:project['doc_id']}">删除</span></td>
                                    <td></td>
                                </tr>
                                {x2;endtree}
                                <!--评价数据-->
                                {x2;tree:$evaluateArr[v:number],eval,evid}
                                <tr class="product-name">
                                    <td class="open-file line-style"><a href="index.php?user-company-index-evaluateInfo&t={x2;v:eval['eval_type']}&id={x2;v:eval['id']}">{x2;v:eval['project_name']}</a>
                                    </td>
                                    <td>
                                        {x2;v:eval['autograph']}
                                    </td>
                                    <td>{x2;date:v:eval['add_time'],'Y-m-d H:i:s'}</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                {x2;endtree}
                                </tbody>
                            </table>
                        </td>
                    </tr>

                    <!--备注列表-->
                    <tr class="info-list remarks-info-list">
                        <td colspan="12" class="product-list-td">
                            {x2;eval:v:remarkdocs = $documents[v:number]['remark']}
                            {x2;if:v:remarkdocs != []}
                            <table class="table product-list">
                                <thead>
                                <tr>
                                    <th width="500px">文档名称</th>
                                    <th>上传人</th>
                                    <th>上传时间</th>
                                    <th>操作</th>
                                    <th><a class="add-btn remark-add-btn" data-id="{x2;v:user['userid']}">新增</a></th>
                                </tr>
                                </thead>
                                <tbody>
                                {x2;tree:$documents[v:number]['remark'],remark,uids}
                                <tr class="product-name">
                                    <td class="open-remark line-style" data-url="http" data-type="pdf">
                                        {x2;v:remark['doc_title']}
                                    </td>
                                    <td>
                                        {x2;v:remark['username']}
                                    </td>
                                    <td>{x2;v:remark['doc_time']}</td>
                                    <td><span class="yellow-text delete-btn" data-type="remarks"
                                              data-id="{x2;v:user['userid']}"
                                              data-doc-id="{x2;v:remark['doc_id']}">删除</span></td>
                                    <td></td>
                                </tr>
                                {x2;endtree}
                                </tbody>
                            </table>
                            {x2;endif}
                        </td>
                    </tr>
                    {x2;endtree}
                    </tbody>
                </table>
            </div>
        </div>

        <!--空页面提示-->
        {x2;if:$isEmtpy == 'yes'}
        <div class="empty-content">
            <div class="frd_hint">
                <div class="frd_hints">
                    <p class="hint_sorry">很抱歉，没有符合条件的供应商。</p>
                    <p>建议您：</p>
                    <p>1.更改其他搜索条件</p>
                    <p>2.查看其他供应商</p>
                </div>
            </div>
        </div>
        {x2;endif}


        <ul class="pagination pull-right">
            {x2;$users['pages']}
        </ul>
    </div>
</div>

<!--pdf预览-->
<!--<embed id="pdf-box" src="" type="application/pdf" width="100%" height="100%">-->
<!--<div class="close-pdf">&times;</div>-->
<a target="_blank" class="pdf-a"></a>


<div class="modal fade" id="category">
    <div class="modal-dialog" style="width: 362px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div>修改类别</div>
            </div>
            <div class="modal-body">
                <select id="company">
                    <option value="">请选择供应商</option>
                    <option value="1">普通供应商</option>
                    <option value="2">合格供应商</option>
                    <option value="3">战略供应商</option>
                    <option value="4">黑名单供应商</option>
                    <option value="5">待复核供应商</option>
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-primary r20" id="userids"> 确&nbsp;&nbsp;定</button>
                <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="department">
    <div class="modal-dialog" style="width: 400px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div>修改所属部门</div>
            </div>
            <div class="modal-body">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="users_branch" value="1">资产管理公司
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="users_branch" value="2">工程中心
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="users_branch" value="3">技术服务公司
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="users_branch" value="4">开发中心
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="users_branch" value="5">光合加
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="users_branch" value="6">其他
                    </label>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-primary r20" id="branchs"> 确&nbsp;&nbsp;定</button>
                <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add-remark-modal">
    <div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div>备注</div>
            </div>
            <div class="modal-body">
                <div class="row form-group text-center">
                    <!--<lable class="control-label col-md-3">上传文档</lable>-->
                    <div style="width: 330px;margin: 0 auto;">
                        <textarea name="remark-input" cols="40" rows="5"></textarea>
                        <div class="error-text">*请输入内容</div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-primary r20 remark-confirm-btn"> 确&nbsp;&nbsp;定
                </button>
                <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="remark-detail-modal">
    <div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div>备注详情</div>
            </div>
            <div class="modal-body">
                <div class="form-group remark-detail">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"> 确&nbsp;&nbsp;定</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade in" id="delete-comfirm-modal">
    <div class="modal-dialog" role="document" style="width:362px!important;margin-top:160px;height:261px;border: 1px solid #ccc;border-radius: 5px;">
        <div class="modal-content" style="box-shadow: 0px 0px 10px 5px rgba(0, 0, 0, .1)!important;height:262px;border-radius:5px!important ;overflow:hidden;><div style=" border:0px;width:362px;>
        <div class="top" style="width:100% ;height:42px;background:#f9f9f9 ;border-bottom: 1px solid #dddddd;box-sizing: border-box;">
            <p style="width: 90%;margin: 0 auto;height: 100%;line-height:42px ;box-sizing: border-box;"><span style="float: left;">提示</span>
                <button type="button" class="close pull-right" data-dismiss="modal" aria-hidden="true" style="font-size:2em;float: right;margin-top: 7px;">×
                </button>
            </p>
        </div>
        <img style="width: 53px;margin:30px auto;display: block;" src="./app/core/styles/img/question.png">
        <p style="text-align:center;color: #323232;font-size: 16px;">确定要删除吗？</p>
        <div class="modal-footer" style="border:none;">
            <button style="margin-right:10px;background:#009944;border-color:#009944" class="btn btn-primary delete-item-btn">确定
            </button>
            <button class="btn btn-default btn-cancel" data-dismiss="modal" aria-hidden="true">取消</button>
        </div>
    </div>
</div>
</div>

<div class="modal fade" id="upload-file-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div class="modal-title"></div>
            </div>
            <div class="modal-body form-horizontal">
                <div class="row form-group">
                    <!--<lable>上传文档:</lable>-->
                    <div>
                        <script type="text/template" id="pe-template-url">
                            <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                    <div class="qq-upload-button-selector">
                                        <ul class="qq-upload-list-selector list-unstyled text-center" style="padding: 0 30px;" aria-live="polite" aria-relevant="additions removals">
                                            <li class="text-center">
                                                <span class="btn btn-default" style="border: 1px solid #009944;color: #009944">
                                                    <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>
                                                    上传文档
                                                </span>
                                                <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" id="uds" tabindex="0" value="">
                                                <div style="position: relative" class="uploaded-show">
                                                    <span class="qq-upload-file-selector qq-upload-file upload-file-name text-center" id="title" style=""></span>
                                                    <span class="delete-file-btn yellow-text">&times;</span>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions">
                                            <li class="text-center">
                                                <span class="btn btn-default" style="border: 1px solid #009944;color: #009944">
                                                    <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
                                                </span>
                                                <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" tabindex="0" value="">
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </script>
                    </div>
                    <div class="fineuploader" attr-list="true" attr-template="pe-template-url" attr-ftype="pdf" type-error="文件类型仅支持PDF" load-type="inner">
                    </div>
                </div>
                <div class="row form-group file-type-note">支持PDF文件</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-primary r20 upload-file-confirm"> 确&nbsp;&nbsp;定
                </button>
                <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
            </div>
        </div>
    </div>
</div>
<!--新增浮框-->
<div class="float_box">
	<img class="left_btn" src="app/core/styles/images/left_box.png" />
	<div class="div_box" style="display: none;">
		<span class="clospl"  style="font-size:3em;padding: 4px 0 0 4px;font-weight: bold;">×</span>
		<p class="class_s"><span>设备类</span><span>服务类</span><span>施工类</span></p>
		<ul class="ul_df">
			<li class="actkss actkss_s">
					<img src="app/core/styles/images/box_a.png"/>
					<p>工程合同</p>
			</li>
			<li class="actkss">
					<img src="app/core/styles/images/box_b.png"/>
					<p>资管合同</p>
			</li>
			<li class="actkss" style="border: none;">
					<img src="app/core/styles/images/box_b.png"/>
					<p>其他合同</p>
			</li>
		</ul>
		<!--切换-->
		<div class="class_ify">
			<div class="ify_s" style="display: block;">
				<ul class="uls_b">
                    {x2;tree:$con[1][2],conn,cid}
					<li><p>{x2;v:conn['file_title']}</p>
						<a href="{x2;v:conn['file_url']}">下载</a>
					</li>
                    {x2;endtree}
				</ul>
				<ul class="uls_b">
                    {x2;tree:$con[1][1],conn,cid}
                    <li><p>{x2;v:conn['file_title']}</p>
                        <a href="{x2;v:conn['file_url']}">下载</a>
                    </li>
                    {x2;endtree}
				</ul>
				<ul class="uls_b">
                    {x2;tree:$con[1][3],conn,cid}
                    <li><p>{x2;v:conn['file_title']}</p>
                        <a href="{x2;v:conn['file_url']}">下载</a>
                    </li>
                    {x2;endtree}
				</ul>
			</div>
			<div class="ify_s">
                <ul class="uls_b">
                    {x2;tree:$con[2][2],conn,cid}
                    <li><p>{x2;v:conn['file_title']}</p>
                        <a href="{x2;v:conn['file_url']}">下载</a>
                    </li>
                    {x2;endtree}
                </ul>
                <ul class="uls_b">
                    {x2;tree:$con[2][1],conn,cid}
                    <li><p>{x2;v:conn['file_title']}</p>
                        <a href="{x2;v:conn['file_url']}">下载</a>
                    </li>
                    {x2;endtree}
                </ul>
                <ul class="uls_b">
                    {x2;tree:$con[2][3],conn,cid}
                    <li><p>{x2;v:conn['file_title']}</p>
                        <a href="{x2;v:conn['file_url']}">下载</a>
                    </li>
                    {x2;endtree}
                </ul>
			</div>
			<div class="ify_s">
                <ul class="uls_b">
                    {x2;tree:$con[3][2],conn,cid}
                    <li><p>{x2;v:conn['file_title']}</p>
                        <a href="{x2;v:conn['file_url']}">下载</a>
                    </li>
                    {x2;endtree}
                </ul>
                <ul class="uls_b">
                    {x2;tree:$con[3][1],conn,cid}
                    <li><p>{x2;v:conn['file_title']}</p>
                        <a href="{x2;v:conn['file_url']}">下载</a>
                    </li>
                    {x2;endtree}
                </ul>
                <ul class="uls_b">
                    {x2;tree:$con[3][3],conn,cid}
                    <li><p>{x2;v:conn['file_title']}</p>
                        <a href="{x2;v:conn['file_url']}">下载</a>
                    </li>
                    {x2;endtree}
                </ul>
			</div>
		</div>
	</div>
</div>
<!---->
{x2;include:footer2}
<script type="text/javascript" src="app/core/styles/js/pdfobject.js"></script>
<script type="text/javascript" src="app/core/styles/js/user/company/suplier.js"></script>
<script type="text/javascript">
    widget.init();
    $(function () {
        //二级菜单
        $("#first_select").change(function () {
            var code = $(this).val();
            console.log(code);
            if (code == "-1") {
                $("#sed_select").empty();
                $("#three_selct").empty();
                $("#sed_select").append("<option value='-1'>请选择二级分类</option>");
                $("#three_selct").append("<option value='-1'>请选择三级分类</option>");
                return false;
            } else {
                $.ajax({
                    type: "GET",
                    url: "index.php?user-app-register-ajaxCategory&catid=" + code,
                    dataType: "json",
                    success: function (data) {
                        $("#sed_select").empty();
                        console.log(data);
                        $.each(data, function (index, value) {
                            $("#sed_select").append("<option value=" + value.catid + ">" + value.catname + "</option>")
                        })
                    }
                })
            }

        })
        $("#sed_select").change(function () {
            var code = $(this).val();
            console.log(code);
            $.ajax({
                type: "GET",
                url: "index.php?user-app-register-ajaxCategory&catid=" + code,
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    $("#three_select").empty();
                    $.each(data, function (index, value) {
                        $("#three_selct").append("<option  value=" + value.catid + " name='three_c'>" + value.catname + "</option>");
                    })
                }
            })
        })
    })

    function submitAjax(param) {
        param = param.url;
        var id = param.split('*')[1];
        var phone = param.split('*')[2];
        var type = param.split('*')[0];
        if (type === 'allow') {
            widget.changeTableVal(id, 1, phone);
        } else {
            widget.changeTableVal(id, 2, phone);
        }
    }
    $(function(){
    	$(".ul_df li").on("click",function(){
    		var i = $(this).index();
    		$(".ify_s").show().eq(i).siblings().hide();
    		$(this).addClass("actkss_s").siblings().removeClass("actkss_s");
    		$(this).children("img").prop("src","app/core/styles/images/box_a.png").parent().siblings().children("img").prop("src","app/core/styles/images/box_b.png")
    	});
    	//点击显示类别
    	$(".left_btn").click(function(){
    		$(".float_box").width($(window).width())
    		 $(".div_box").addClass("show_as");
    	});
    	$(".clospl").click(function(){
    		 $(".div_box").removeClass("show_as");
    		 $(".float_box").width(30)
    	});
    	$(".uls_b li").hover(function(){
    		$(this).children("a").show()
    	},function(){
    		$(this).children("a").hide()
    	})
    	
    })
</script>
</body>

</html>