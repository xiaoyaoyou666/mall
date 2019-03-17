{x2;include:header}

<body>

{x2;include:nav}
<style type="text/css">

    @font-face {
        font-family: 'iconfont';
        /* project id 814390 */
        src: url('//at.alicdn.com/t/font_814390_w8odnyf6faa.eot');
        src: url('//at.alicdn.com/t/font_814390_w8odnyf6faa.eot?#iefix') format('embedded-opentype'), url('//at.alicdn.com/t/font_814390_w8odnyf6faa.woff') format('woff'), url('//at.alicdn.com/t/font_814390_w8odnyf6faa.ttf') format('truetype'), url('//at.alicdn.com/t/font_814390_w8odnyf6faa.svg#iconfont') format('svg');
    }

    .hln-zx-centent-title {
        padding: 0px;
    }

    .content_s {
        margin-left: 40px;
        margin-bottom: 20px;
    }

    .content_s li p span {
        width: 100px;
        text-align: right;
    }

    .list_name li {
        float: left;
        min-width: 200px;
        margin-right: 100px;
    }

    .list_name li p {
        line-height: 36px;
    }

    .table {
        width: 1110px;
    }

    .dowload li {
        float: left;
    }

    .dowload li a {
        display: block;
    }

    .dowload li a span {
        color: #ff8a00;
    }

    .import_color span {
        color: #ff8a00;
        cursor: pointer;
    }

    #release {
        float: left;
        cursor: pointer;
        border: solid 1px #eeeeee;
        padding: 0 14px;
        border-radius: 4px;
        outline: 0px;
        background: #fff;
        margin-top: 10px;
        font-size: 14px;
    }

    .cons a {
        font-size: 13px;
    }

    .cons li {
        width: 860px;
        height: auto !important;
        border-bottom: dashed 1px #eee;
        padding: 10px 10px;
    }

    .qr {
        background: #ffffff;
        border: 1px solid #009944;
        border-radius: 4px;
        width: 64px;
        height: 26px;
        line-height: 25px;
        font-size: 12px;
        color: #009944;
        position: relative;
        margin-top: 10px;
    }

    .no_qr {
        border: 1px solid #ccc;
        color: #ccc;
    }

    .tips {
        font-size: 14px;
        color: #222222;
        text-align: justify;
        line-height: 24px;
        background: rgba(255, 153, 44, 0.05);
        box-shadow: inset 0 -1px 0 0 rgba(255, 153, 44, 0.15);
        width: 460px;
        padding: 10px;
        font-size: 13px;
    }

    label {
        float: left;
        font-weight: 400;
    }

    .form-group {
        margin-top: 20px;
    }

    p.title_list {
        font-weight: 550;
    }

    .company_name {
        font-weight: 550;
    }

    .company_content {
        color: #666;
    }

    .tables {
        position: absolute;
    }

    .table_box,
    .tables {
        display: inline-block;
    }

    .table_box {
        position: absolute;
        right: 0px;
        top: 0px;
        z-index: 1000;
    }

    table td {
        border: solid 1px #000;
    }

    .tables {
        position: relative;
        left: 0px;
    }

    /*滚动条样式*/

    .tables::-webkit-scrollbar {
        /*滚动条整体样式*/
        width: 4px;
        /*高宽分别对应横竖滚动条的尺寸*/
        height: 6px;
    }

    .tables::-webkit-scrollbar-thumb {
        /*滚动条里面小方块*/
        border-radius: 2px;
        -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, .3);
        background: rgba(0, 0, 0, .3);
    }

    .tables::-webkit-scrollbar-thumb:before {
        /*滚动条里面小方块*/
        content: "台词：";
    }

    .tables::-webkit-scrollbar-track {
        /*滚动条里面轨道*/
        border-radius: 4px;
        -webkit-box-shadow: inset 0 0 2px rgba(0, 0, 0, 0.1);
        border-radius: 0;
        background: rgba(255, 255, 255);
    }

    .table {
        max-width: none !important;
    }

    .table input {
        border: solid 1px #ebebeb;
        height: 24px;
    }

    .load_file p {
        display: inline-block;
        margin-right: 20px;
    }

    .load_d {
        color: #f08f35;
        margin-left: 15px;
    }

    .sc {
        border: 1px solid rgb(204, 204, 204);
        border-radius: 4px;
        height: 30px;
        line-height: 30px;
        width: 100px;
        /* margin-top: 10px; */
        padding-left: 30px;
        background: url(app/core/styles/images/upload.png) 10px center / 15px no-repeat;
        position: relative;
        overflow: hidden;
        direction: ltr;
        background-color: #fff;
    }

    .s_img {
        width: 200px;
        /* background: rgba(0, 153, 68, 0.05); */
        padding-left: 0px;
        float: left;
    }

    #text {
        border: solid 1px #ddd;
        max-width: 300px;
        border-radius: 4px;
    }

    .h {
        background: #eee !important;
        color: #999;
        outline: none;
    }

    #release:hover {
        color: #F08F35;
    }

    .h:hover {
        color: #999 !important;
    }

    .onload {
        color: #F0953A;
    }

    .onload:hover {
        color: #F0953A;
    }

    .table {
        margin-bottom: 0px;
    }

    .uploaded-show {
        position: absolute;
        margin-left: 110px;
        margin-top: -30px;
    }
    span.btn{
    	padding:3px 12px;
    }
    /*#mCSB_1_scrollbar_horizontal {
        height: 24px;
        line-height: 24px;
    }

    .mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar {
        height: 100%;
        margin: 0px;
        font-size: 12px;
        color: rgba(240, 143, 53, 1);
        ;
    }

    .mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
        border-radius: 0px;
        background: rgba(240, 143, 53, .4);
    }

    /*.Drag_reminder.handler {
        background: rgba(240, 143, 53, .4);
    }


    .mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_draggerRail {
        margin: 0px;
        border-radius: 0px;
        background: #fff;
        border: solid 1px #ddd;
        height: 24px;
    }

    .mCSB_scrollTools .mCSB_draggerContainer {
        top: -6px;
    }

    .mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar .handlerLeft {
        position: absolute;
        background: url(app/core/styles/img/left_icon.png) no-repeat center;
        background-size: 12px 12px;
        width: 20px;
        left: 10px;
        height: 24px;
    }

    .mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar .handlerRight {
        position: absolute;
        background: url(app/core/styles/img/right_icon.png) no-repeat center;
        background-size: 12px 12px;
        width: 20px;
        right: 10px;
        top: 0px;
        height: 24px;
    }*/
    .total-no {
        height: 33px;
        text-align: right;
        padding-right: 10px;
        line-height: 30px;
        border-bottom: 1px solid #ddd;
    }

    .tables .total-no {
        border-left: 1px solid #ddd;
    }

    .table_box .total-no {
        border-right: 1px solid #ddd;
    }

    .total-no > span {
        font-size: 14px;
        color: #323232;
    }

    .total-no > span > i {
        font-style: normal;
        color: #009944;
    }

</style>

<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">采购寻源</a> > <a>询价管理</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right published-purchase" id="content-box">
                <!--右侧内容-->
                <div class="zmm_panel panel-default">
                    <!--内容开始-->
                    <div class="zmm-qydt-title zmm-qydt-shsj1">
                        <p class="clarify-title"><em class="title-triangle"></em>{x2;$one['xunjia_title']}</p>
                    </div>
                    <!--tilte_list************************************************-->
                    <div class="content_s">
                        <ul class="list_name" style="width: 100%;">
                            <li>
                                <p><span>询价类型：</span>{x2;$purchasestatus[$one['xunjia_type']]}</p>
                                <p><span>发布时间：</span>{x2;date:$one['create_time'],'Y-m-d H:i:s'}</p>
                                <p><span>截止时间：</span>{x2;date:$one['end_time'],'Y-m-d H:i:s'}</p>
                                <!-- <p><span>补充说明：</span>{x2;$inquiryData['xunjia_explain']}</p> -->
                            </li>
                            <li>
                                <p><span>要求到货时间：</span>{x2;date:$one['expire_time'],'Y-m-d H:i:s'}</p>
                                <p><span>税率：</span>{x2;$one['taxrate']}</p>
                                <p><span style="float: left;">付款方式：</span> <span style="width: 400px;text-align: left;">{x2;$one['pay_type']}</span>
                                </p>
                            </li>
                        </ul>
                        <!--补充说明-->
                        <!--补充说明内容-->
                        <div style="margin-left: 30px;">
                            <p><span style="float: left;">补充说明：</span><span style="width:740px;text-align: left;">{x2;$one['xunjia_explain']}</span>
                            </p>
                        </div>
                    </div>

                    <!--澄清信息************************************************************************-->
                    <div class="zmm-qydt-title zmm-qydt-shsj1">
                        <p class="clarify-title title_list">澄清信息</p>
                        {x2;if:$demo == $one['xunjia_ren']} {x2;if:$one['status'] == '3' || $one['status'] == '4' ||
                        $one['status'] == '2'}
                        <button id="release" data-toggle="modal" data-target="#myModal"
                                style="float: left;cursor:pointer;border: solid 1px #eeeeee;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;"
                                disabled="disabled" class="h">
                            <i class="iconfont" style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清
                        </button>
                        {x2;else}
                        <button id="release" data-toggle="modal" data-target="#myModal"
                                style="float: left;cursor:pointer;border: solid 1px #F0953A;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;color: #F0953A;">
                            <i class="iconfont" style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清
                        </button>
                        {x2;endif} {x2;else}
                        <!-- 报价方判断逻辑 234及time内 无法发表 time内及1 可以发表 -->
                        {x2;if:v:bao['supplier_id'] == $demo} {x2;else} {x2;if:$one['status'] == '3' || $one['status']
                        == '4' || $one['status'] == '2'}
                        <button id="release" disabled="disabled" class="h">
                            <i class="iconfont" style="color: #ccc;margin-right: 2px;">&#xe616;</i>发布澄清
                        </button>
                        {x2;else}
                        <button id="release" data-toggle="modal" data-target="#myModal" onclick="filepost1()"
                                style="float: left;cursor:pointer;border: solid 1px #F0953A;padding:0 14px;border-radius: 4px;outline: 0px;background:#fff;color: #F0953A;">
                            <i class="iconfont" style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清
                        </button>
                        {x2;endif} {x2;endif} {x2;endif}

                        <!-- <button id="release" onclick="filepost1()">
                            <i class="iconfont"  style="color: #F0953A;margin-right: 2px;">&#xe616;</i>发布澄清
                         </button> -->

                    </div>
                    <ul class="content_s cons dowload" style="width:870px;margin-left: 60px;">
                        {x2;tree:$two3,two,cid}
                        <li class="dowload">
                            <div style="float: left;">
                                <p class="company_name">{x2;v:two['clarify_name']}<span
                                        style="font-size: 13px;font-weight: 500;color: #666;width:200px;text-align:left;margin-left:20px">{x2;date:v:two['addtime'],'Y-m-d H:i:s'}</span>
                                </p>
                                <!--在这写时间-->
                                <p class="company_content">{x2;v:two['clarify_des']}</p>
                                <p class="onload_f">{x2;v:two['clarify_fillename']} {x2;if:v:two['clarify_file']}<a
                                        href="{x2;v:two['clarify_file']}" download="{x2;v:two['clarify_fillename']}"
                                        class="onload">下载</a> {x2;endif}
                                </p>
                            </div>
                            {x2;if:$one['xunjia_ren'] != $demo} {x2;if:v:two['clarify_uid'] != $demo} 　　
                            {x2;if:v:two['clarifydetail'] == '200'}
                            <div style="float: right;"><input type="button" value="已确认" class="qr"
                                                              style=" border:1px solid #cccccc;color: #666;"></div>
                            <p style="clear: both;"></p>
                            {x2;else} {x2;if:v:two['clarify_uid'] != $demo}
                            <!-- 确定 -->
                            {x2;if:$dingbiao == '1'}  
                            <div style="float: right;"><input type="button" value="确认" class="sub_add qr">
                            </div>
                            <p style="clear: both;"></p>
                            {x2;else}
                            <div style="float: right;"><input type="button" value="确认" class="qr h" style=" border:1px solid #cccccc;color: #666;"> </div>  
                            <p style="clear: both;"></p>
                            {x2;endif} {x2;endif} {x2;endif} {x2;endif} {x2;endif}
                            <input type="hidden" class="charifyid" name="charifyid" value="{x2;v:two['clarify_uid']}">
                            <input type="hidden" class="charifyxid" name="charifyxid" value="{x2;v:two['clarify_id']}">
                            <input type="hidden" class="bao_id" name="charifyxid" value="{x2;v:two['clarify_xid']}">
                            <p style="clear: both;"></p>
                        </li>
                        {x2;endtree}

                        <input type="hidden" value="{x2;$one['id']}" id="xun_id">
                    </ul>
                    <!--报价信息-->
                    <div class="zmm-qydt-title zmm-qydt-shsj1" id="offerinfo">
                        <p class="clarify-title title_list">报价信息</p>
                    </div>
                    <div class="content_s" style="position: relative;width: 940px;margin-left: 30px;margin-top: 20px;">
                        <form>
                            <div class="tables" id="table_scroll" style="width: 440px;overflow-x:scroll ;">
                                <table class="table table-hover table-responsive table-bordered">
                                    <thead>
                                    <tr style="background:#f5f5f5!important;">
                                        <th style="width: 50px;">序号</th>
                                        <th>物资名称</th>
                                        <th>型号/规格</th>
                                        <th>采购量</th>
                                        <th>单位</th>
                                        <th>项目单位</th>
                                        <th>说明</th>
                                    </tr>
                                    </thead>
                                    {x2;tree:$baojias,baosd,bid}
                                    <tr>
                                        <td>{x2;v:baosd['keys']}</td>
                                        <td>{x2;v:baosd['material_title']}</td>
                                        <td>{x2;v:baosd['material_norms']}</td>
                                        <td>{x2;v:baosd['material_num']}</td>
                                        <td>{x2;v:baosd['material_unit']}</td>
                                        <td>{x2;v:baosd['xiangmuDanwei']}</td>
                                        <td>{x2;v:baosd['material_explain']}</td>
                                    </tr>
                                    {x2;endtree}
                                </table>
                                <div class="total-no">

                                </div>
                            </div>

                            <div class="table_box" style="width: 500px;">
                                <table class="table table-hover table-responsive table-bordered "
                                       style="width: 500px;table-layout: fixed;">
                                    <tr style="background:#f5f5f5!important;">
                                        <td>承诺到货时间</td>
                                        <td>报价单价</td>
                                        <td style="width: 100px;">报价金额</td>
                                        <td>备注</td>
                                    </tr>
                                    {x2;if:$dingbiao == '1'}
                                    {x2;if:$one['status'] == '1'}
                                    {x2;tree:$baojias,baod,bid}
                                    <!-- 显示 -->
                                    <tr>
                                        <input type="hidden" name="p_id" value="{x2;v:baod['ppid']}" class="pp_id">
                                        <input type="hidden" name="xun_id" value="{x2;v:baod['pricerecordid']}"
                                               class="ma_id">
                                        <td><input type="text" class="stime" value="{x2;date:v:baod['addtime'],'Y-m-d'}"
                                                   style="width:120px;"></td>
                                        <td><input type="text"
                                                   onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                   style="width: 80px;" class="price"
                                                   value="{x2;v:baod['single_price']}">
                                            <input type="hidden" class="num" value="{x2;v:baod['material_num']}"></td>
                                        <td class="total_amount">{x2;v:baod['total_price']}</td>
                                        <!-- 无备注时显示无 -->
                                        {x2;if:v:baod['remarks'] != ''}
                                        <td><input type="text" class="remark" value="{x2;v:baod['remarks']}"
                                                   style="width:115px"></td>
                                        {x2;else}
                                        <td><input type="text" class="remark" value="无" style="width:115px"></td>

                                        {x2;endif}
                                    </tr>
                                    {x2;endtree}
                                    {x2;else}
                                    {x2;tree:$baojias,baod,bid}
                                    <tr>
                                        <!--不显示 不可编辑的时候去掉stime -->
                                        <td><input type="text" value="{x2;date:v:baod['addtime'],'Y-m-d'}"
                                                   readonly="readonly" style="width:100px;"></td>
                                        <td><input type="text"
                                                   onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                   style="width:100px;" class="price"
                                                   value="{x2;v:baod['single_price']}" readonly="readonly">
                                            <input type="hidden" class="num" value="{x2;v:baod['material_num']}"></td>
                                        <td class="total_amount">{x2;v:baod['total_price']}</td>
                                        {x2;if:v:baod['remarks'] != ''}
                                        <td><input type="text" class="remark" value="{x2;v:baod['remarks']}"
                                                   style="width:115px"></td>
                                        {x2;else}
                                        <td><input type="text" class="remark" value="无" style="width:115px"></td>
                                        {x2;endif}
                                    </tr>
                                    {x2;endtree}
                                    {x2;endif}
                                    {x2;elseif:$dingbiao == '2'}
                                    {x2;tree:$baojias,baod,bid}
                                    <tr>
                                        <!-- 不显示 不可编辑的时候去掉stime -->
                                        <td><input type="text" value="{x2;date:v:baod['addtime'],'Y-m-d'}"
                                                   readonly="readonly" style="width:100px;"></td>
                                        <td><input type="text"
                                                   onkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')"
                                                   style="width:100px;" class="price"
                                                   value="{x2;v:baod['single_price']}" readonly="readonly">
                                            <input type="hidden" class="num" value="{x2;v:baod['material_num']}"></td>
                                        <td class="total_amount">{x2;v:baod['total_price']}</td>
                                        {x2;if:v:baod['remarks'] != ''}
                                        <td><input type="text" class="remark" value="{x2;v:baod['remarks']}"
                                                   style="width:115px"></td>
                                        {x2;else}
                                        <td><input type="text" class="remark" value="无" style="width:115px"></td>
                                        {x2;endif}
                                    </tr>
                                    {x2;endtree}
                                    {x2;endif}
                                </table>
                                <div class="total-no">
                                    <span>合计：<i></i></span>
                                </div>
                            </div>

                            <div style="clear: both;"></div>
                            <!--文件附件-->
                            <div class="load_file">
                                {x2;if:$one['technicalfile_url']}
                                <p>技术附件：<a href="{x2;$one['technicalfile_url']}"
                                           download="{x2;$one['technicalfile_title']}">{x2;$one['technicalfile_title']}<span
                                        class="load_d">下载</span></a></p>
                                {x2;endif} {x2;if:$one['businessfile_url']}
                                <p>商务附件：<a href="{x2;$one['businessfile_url']}"
                                           download="{x2;$one['businessfile_title']}">{x2;$one['businessfile_title']}<span
                                        class="load_d">下载</span></a></p>
                                {x2;endif} {x2;if:$one['other_url']}
                                <p>其他附件：<a href="{x2;$one['other_url']}" download="{x2;$one['other_title']}">{x2;$one['other_title']}<span
                                        class="load_d">下载</span></a></p>
                                {x2;endif}
                            </div>
                            <!--文件上传-->
                            <div class="form-group why-cg-detail t20" style="margin:10px 0px">
                                <div class="head" style="display: inline-block;float: left;">报价文件：</div>
                                <!-- 不可上传 -->
                                <!-- <div class="s_img">
                                    <div style="width:120px;text-align: left;float: left;">
                                         <span class="sc" style="background-color:#e4e4e4;color:#999">点击上传</span>
                                    </div>
                                    <a class="qq-upload-file-selector clarify_name load" id="clarify-title">
                                            {x2;if:$baourl} {x2;$baourl} {x2;endif}
                                         </a>
                                    </div> -->

                                {x2;if:$dingbiao == '1'}
                                {x2;if:$one['status'] == '1'}
                                <!-- 可以上传 -->
                                <div class="s_img">
                                    <script type="text/template" id="pe-template-url3">
                                        <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传"
                                             style="clear:both;left:0px;margin-left: 0px;height:60px">
                                            <div class="qq-upload-button-selector"
                                                 style="overflow: auto!important;width: 600px;">
                                                <ul class="qq-upload-list-selector list-unstyled pull-left"
                                                    aria-live="polite" aria-relevant="additions removals"
                                                    style="clear:both;">
                                                    <li class="text-center" style="float: left;">
                                                        	<span class="btn btn-default" style="color: #009944;border: solid 1px #009944;">
	                                                                  <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
	                                                        </span>
                                                        <input size="60" class="form-control qq-edit-filename-selector"
                                                               type="hidden" name="args[attach]" tabindex="0" value=""
                                                               needle="needle" style="width:20px;" id="bj_file">
                                                               
                                                        <div style="position: relative;float: right;margin-top: 4px;margin-left: 5px;"
                                                             class="uploaded-show">
                                                            <span class="qq-upload-file-selector qq-upload-file upload-file-name"
                                                                  id="clarify-title"
                                                                  style="width: 200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"></span>
                                                            <span class="delete-file-btn yellow-text"
                                                                  style="float: right;">&times;</span>
                                                        </div>

                                                    </li>

                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled pull-left"
                                                    aria-live="polite" aria-relevant="additions removals"
                                                    style="clear:both;">
                                                    <li class="text-center">
                                                        <div style="width:120px;text-align: left;float: left;">
                                                        	<span class="btn btn-default" style="color: #009944;border: solid 1px #009944;">
	                                                             <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
	                                                        </span>
                                                        </div>
                                                        <a class="qq-upload-file-selector clarify_name load"
                                                           id="clarify-title">
                                                            {x2;if:$baourl}
                                                            {x2;$baourl}
                                                            {x2;endif}
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-list="true" attr-template="pe-template-url3"
                                         attr-ftype="pdf,rar,zip,doc,docx,xls,xlsx" load-type="inner"></div>
                                    <div style="width: 600px;color: #999;margin-top: -30px;">
                                        支持doc、docx、pdf、xls、xlsx、rar、zip格式文件
                                    </div>
                                </div>
                                {x2;else}
                                <!-- 不可上传 -->
                                <div class="s_img">
                                    <div style="width:120px;text-align: left;float: left;">
                                        <span class="btn btn-default"  style="background-color:#e4e4e4;color:#999">
	                                          <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
	                                    </span>
                                    </div>
                                    <a class="qq-upload-file-selector clarify_name load">
                                        {x2;if:$baourl} {x2;$baourl} {x2;endif}
                                    </a>
                                </div>
                                {x2;endif}
                                {x2;elseif:$dingbiao == '2'}
                                <!-- 超过时间不可上传 -->
                                <div class="s_img">
                                    <div style="width:120px;text-align: left;float: left;">
                                         <span class="btn btn-default"  style="background-color:#e4e4e4;color:#999">
	                                          <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
	                                    </span>
                                    </div>
                                    <a class="qq-upload-file-selector clarify_name load">
                                        {x2;if:$baourl} {x2;$baourl} {x2;endif}
                                    </a>
                                </div>
                                {x2;endif}

                            </div>

                            <div class="why-cg-detail t20" style="margin-top: 20px;clear: both;margin-left: 0px;">

                                {x2;if:$dingbiao == '1'} {x2;if:$one['status'] == '3' || $one['status'] == '4' ||
                                $one['status'] == '2'}
                                <input type="button" value="更新报价" disabled="disabled" class="h"
                                       class="why-btn-big-green"
                                       style="background:#ccc;color:#000;border-radius:4px;height:30px;width:100px;text-align: center;line-height:30px;padding: 0;border:solid 1px #ccc">
                                {x2;else}
                                <input type="button" value="更新报价" id="submits" class="why-btn-big-green"
                                       style="background:#009944;color: #fff;border-radius:4px;height:30px;width:100px;text-align: center;line-height:30px;padding: 0;">
                                {x2;endif} {x2;elseif:$dingbiao == '2'}
                                <input type="button" value="更新报价" disabled="disabled" class="h"
                                       class="why-btn-big-green"
                                       style="background:#ccc;color:#000;border-radius:4px;height:30px;width:100px;text-align: center;line-height:30px;padding: 0;border:solid 1px #ccc">
                                {x2;endif}

                            </div>

                        </form>
                    </div>
                    <!--结束****** disabled="disabled" class="h"**********************************************************************************************************************************-->
                </div>
            </div>
        </div>
    </div>
</div>
<!--澄清彈框-->
<div class="modal fade" id="cq_model">
    <div class="lodin">
        <div class="log">
            <img src="app/core/styles/images/qio.png"/>
        </div>
    </div>
    <div class="modal-dialog" style="width: 460px;margin-top: 160px;border: 1px solid #ccc;border-radius: 5px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4>澄清</h4>
            </div>
            <div id="test"></div>
            <div class="modal-body">
                <div class="form-group">
                    <div style="margin: 0 auto;">
                        <div class="form-group">
                            <span style="float: left">澄清内容：</span>
                            <textarea name="remark-input" id="text" cols="40" rows="3" placeholder="请输入200个字以内澄清信息"
                                      maxlength="200" style="width: 355px;resize:none"></textarea>
                        </div>

                        <div class="form-group" style="margin-bottom: 0">
                            <span style="float: left">澄清文件：</span>
                            <script type="text/template" id="pe-template-url">
                                <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                        <div class="qq-upload-button-selector">
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                aria-relevant="additions removals">
                                                <li style="width: 300px;">
													<span class="btn btn-default" style="color: #009944;border: solid 1px #009944;">
	                                                    <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
	                                                </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector"
                                                           type="hidden" name="urls" id="clarify-files" tabindex="0"
                                                           value="">
                                                    <div style="position: absolute" class="uploaded-show">
                                                        <span class="qq-upload-file-selector qq-upload-file upload-file-name"
                                                              id="title"
                                                              style="width: 200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;text-align: left;"></span>
                                                        <!-- <span class="delete-file-btn yellow-text" style="float: right;text-align: left;" >&times;</span>-->
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                aria-relevant="additions">
                                                <li style="text-align: left">
														<span class="btn btn-default" style="color: #009944;border: solid 1px #009944;">
	                                                        <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
	                                                    </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector"
                                                           type="hidden" name="urls" tabindex="0" value="">
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </script>
                            <div class="fineuploader" attr-list="true" attr-template="pe-template-url"
                                 attr-ftype="rar,zip" load-type="inner" style="display: inline-block"></div>

                        </div>
                        <div class="form-group file-type-note" style="padding-left: 70px;color: #999999">仅支持zip,rar文档
                        </div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <input type="hidden" name="" value="{x2;$one['id']}" id='offer_id'>
                <input type="hidden" name="" value="{x2;$baoid}" id='bao_id'>
                <button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="sub_btn"
                        style="outline: none;background: #009944;"> 确&nbsp;&nbsp;定
                </button>
                <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal"> 取&nbsp;&nbsp;消
                </button>
            </div>
        </div>
    </div>
</div>
<!--loading-->

<!--js-->
{x2;include:footer2}

<script src="app/core/styles/js/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.debug.js"
        integrity="sha384-THVO/sM0mFD9h7dfSndI6TS0PgAGavwKvB5hAxRRvc0o9cPLohB0wb/PTA7LdUHs"
        crossorigin="anonymous"></script>
<script>
    $('.submenu:eq(2)').delay(400).slideDown(700);
    $('.submenu:eq(2) li:eq(1)').addClass("active");
    //滚动条
    //		if ($('#table_scroll').find('table').width() >= 440) {
    //			$("#table_scroll").mCustomScrollbar({
    //				axis: "x", // horizontal scrollbar
    //			});
    //			var hander = "<div class='Drag_reminder handler'>" +
    //				" <div class='handlerLeft' >" +
    //				" </div>" +
    //				" <p class='slide-block'>拖动滑块查看更多内容</p>" +
    //				" <div class='handlerRight' ></div>" +
    //				"</div>";
    //			$(".mCSB_dragger_bar").html(hander);
    //			setTimeout(function() {
    //				$(".mCSB_dragger").css({
    //					'width': '200px',
    //					'height': '24px',
    //				})
    //			}, 1000);
    //		}
    $(function () {
        $(window).unbind('beforeunload');
        window.onbeforeunload = null;
        $('.stime').datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd hh:ii:00',
            todayHighlight: 1,
            forceParse: 0,
            showMeridian: 1,
            autoclose: 1
        });
        //计算总金额
        $(document).on("blur", ".price", function () {
            var total_amount;
            var price = $(this).val();
            var num = $(this).siblings(".num").val();
            total_amount = Number(price) * Number(num);
            console.log(total_amount);
            $(this).parent("td").siblings(".total_amount").text(total_amount.toFixed(2));
            totalAmountCalculator();
        })
        totalAmountCalculator();
        //报价提交
        $("#submits").on("click", function () {
            var time_list = new Array(); //到货时间数组
            var price_list = new Array(); //单价数组
            var amount_list = new Array(); //总金额数组
            var remark_list = new Array(); //备注数组
            var userid_list = new Array(); //ma_id
            var offerid = $("#offer_id").val();
            var baoid = $("#bao_id").val();
            //到货时间
            $('.stime').each(function () {
                var times = $(this).val();
                if (times == '') {
                    var data = {
                        result: false,
                        message: '请选择承诺到货时间'
                    };
                    $.zoombox.show('ajax', data);
                    return false;
                }
                time_list.push(times);
                console.log(time_list);
            });
            //单价
            $(".price").each(function () {
                var prices = $(this).val();
                if (prices == "") {
                    var data = {
                        result: false,
                        message: '请输入单价'
                    };
                    $.zoombox.show('ajax', data);
                    return false;
                }
                price_list.push(prices);
                console.log(price_list);
            });
            //总金额
            $(".total_amount").each(function () {
                var total_amounts = $(this).text();
                amount_list.push(total_amounts);
                console.log(amount_list);
            });
            //备注
            $(".remark").each(function () {
                var remark = $(this).val();
                remark_list.push(remark);
                console.log(remark_list);
            });
            //备注
            $(".ma_id").each(function () {
                var userid = $(this).val();
                userid_list.push(userid);
                console.log(userid_list);
            });
            //文件主键id
            var pp_id = $(".pp_id").val();
            //文件路径
            var file_urls = $('#bj_file').val(); //文件路径
            // 文件名称
            var url_name = $("#bj_file_name").text();
            console.log(url_name)
            //json数组
            var file_json = {
                userid_list: userid_list, //
                time_list: time_list,
                price_list: price_list,
                amount_list: amount_list,
                remark_list: remark_list,
                pp_id: pp_id, //报价表id
                file_urls: file_urls, //文件 url  報價
                url_name: url_name,
                offerid: offerid
            };
            // data = JSON.stringify(file_json);
            console.log(file_json)
            //ajax
            $.ajax({
                type: 'post',
                url: "index.php?user-company-clarify-updateofferwuzi", //路径
                dataType: 'JSON',
                data: file_json,
                success: function (res) {
                    if (res.statusCode == 200) {
                        var data = {
                            result: false,
                            message: res.message
                        };
                        $.zoombox.show('ajaxOK', data);
                        window.location.href = 'index.php?user-company-clarify&id=' + offerid + '&pid=' + baoid;
                    } else {
                        var data = {
                            result: false,
                            message: res.message
                        };
                        $.zoombox.show('ajax', data);
                    }
                }
            });
        })
    })
    //合计计算器
    function totalAmountCalculator() {
        var cells = $('.total_amount'), total = 0;
        $.each(cells, function (index, item) {
            total += Number($(item).text());
        })
        $(".total-no i").html(total+'元');
        return total;
    }
    //Add发布澄清信息
    function filepost1() {
        $("#cq_model").modal();
        $("#sub_btn").click(function () {
            var uds = $('#clarify-files').val(); //路径
            var title = $("#title").text(); //文档标题
            var text = $("#text").val(); //文字描述
            var xunid = $("#xun_id").val(); //询价单id
            var xunren = $("#xun_ren").val(); //询价表的用户id
            if (text == '') {
                var data = {
                    result: false,
                    message: '请澄清说明'
                };
                $.zoombox.show('ajax', data);
                return false;
            }
            if (uds == '') {
                var data = {
                    result: false,
                    message: '请上传文档'
                };
                $.zoombox.show('ajax', data);
                return false;
            }
            if (text == '') {
                var data = {
                    result: false,
                    message: '请写入标题'
                };
                $.zoombox.show('ajax', data);
                return false;
            }
            var jsons = {
                text: text,
                uds: uds,
                title: title,
                xunid: xunid,
                xunren: xunren
            };
            console.log(jsons);
            $.ajax({
                type: 'post',
                url: "index.php?user-company-clarify-addclarifylists",
                dataType: 'JSON',
                data: jsons,
                beforeSend: function () {
                    // 禁用按钮防止重复提交
                    $("#sub_btn").attr({
                        disabled: "disabled"
                    });
                    $(".lodin").show();
                },
                success: function (res) {
                    if (res.statusCode == 200) {
                        var data = {
                            result: false,
                            message: res.message
                        };
                        //$.zoombox.show('ajaxOK', data);
                        window.location.reload();
                    } else {
                        var data = {
                            result: false,
                            message: res.message
                        };
                        $.zoombox.show('ajax', data);
                    }
                },
                complete: function () {
                    $("#sub_btn").removeAttr("disabled");
                    $(".lodin").hide();
                },
            });
        })
        //清空
        $('#clarify-files').val('');
        $('#text').val('');
        $('#clarify-title').html('');
    }

    /*
     * 添加澄清确定按钮 判断状态
     */
    $("body").on('click', '.sub_add', function () {
        var uid = $(this).parent("div").siblings(".charifyid").val() //询价单id
            ,
            xid = $(this).parent("div").siblings(".charifyxid").val() //澄清发布id  bao_id
            ,
            bid = $(this).parent("div").siblings(".bao_id").val() //询价单id
            ,
            jsons = {
                uid: uid,
                xid: xid,
                bid: bid
            };
        $.ajax({
            type: 'post',
            url: "index.php?user-company-clarify-addclarify",
            dataType: 'JSON',
            data: jsons,
            success: function (res) {
                if (res.statusCode == 200) {
                    window.location.reload();
                } else {
                    var data = {
                        result: false,
                        message: res.message
                    };
                    $.zoombox.show('ajax', data);
                }
            }
        });
    })
    //导出
    $('.export-pdf-btn').on('click', function () {
        //导出html到pdf文件
        html2canvas(document.getElementById('content-box'), {
            onrendered: function (canvas) {
                var contentWidth = canvas.width;
                var contentHeight = canvas.height;
                //一页pdf显示html页面生成的canvas高度;
                var pageHeight = contentWidth / 592.28 * 841.89;
                //未生成pdf的html页面高度
                var leftHeight = contentHeight;
                //页面偏移
                var position = 0;
                //a4纸的尺寸[595.28,841.89]，html页面生成的canvas在pdf中图片的宽高
                var imgWidth = 595.28;
                var imgHeight = 592.28 / contentWidth * contentHeight;
                var pageData = canvas.toDataURL('image/jpeg', 1.0);
                var pdf = new jsPDF('', 'pt', 'a4');
                //有两个高度需要区分，一个是html页面的实际高度，和生成pdf的页面高度(841.89)
                //当内容未超过pdf一页显示的范围，无需分页
                if (leftHeight < pageHeight) {
                    pdf.addImage(pageData, 'JPEG', 0, 0, imgWidth, imgHeight);
                } else {
                    while (leftHeight > 0) {
                        pdf.addImage(pageData, 'JPEG', 0, position, imgWidth, imgHeight)
                        leftHeight -= pageHeight;
                        position -= 841.89;
                        //避免添加空白页
                        if (leftHeight > 0) {
                            pdf.addPage();
                        }
                    }
                }
                var title = $('.clarify-title').text();
                pdf.save(title + ".pdf");
            }
        });
    })
</script>
</body>

</html>