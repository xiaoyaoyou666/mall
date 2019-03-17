{x2;include:header}
<style type="text/css">
    .zmm-panel-body {
        padding-top: 20px;
        padding-left: 20px;
        padding-right: 20px;
    }

    .zmm-gsjj table {
        width: 100%;
        margin-left: 0 !important;
        margin-bottom: 0 !important;
    }

    .conditions {
        background-color: #eee;
        border: 0 !important;
    }

    .conditions tbody tr, .conditions tbody td {
        border: 0 !important;
    }

    .conditions > tbody > tr > td {
        padding: 5px 2px !important;
    }

    .table > thead > tr > td.info, .table > tbody > tr > td.info, .table > tfoot > tr > td.info, .table > thead > tr > th.info, .table > tbody > tr > th.info, .table > tfoot > tr > th.info, .table > thead > tr.info > td, .table > tbody > tr.info > td, .table > tfoot > tr.info > td, .table > thead > tr.info > th, .table > tbody > tr.info > th, .table > tfoot > tr.info > th {
        background-color: #ededed;
    }

    .search-bar {
        margin: 10px 20px 0;
        border: 1px solid #ededed;
        padding: 20px;
    }

    .actions .btn {
        padding: 6px;
    }

    #remark-input {
        border-radius: 4px;
        border: 1px solid #ccc;
    }

    #clarify-modal .file-type-note {
        margin-bottom: 2px;
    }

    .iconfont {
        font-size: 14px;
    }

    #remark-input {
        padding: 3px;
    }

    #stime, #etime {
        width: 160px;
    }
    select{
        background: url(app/core/styles/img/arrow.png) no-repeat right 2px center transparent!important;
    }
    .condition-table .form-group{
        margin-right: 15px;
    }
    .publish-inquiry-btn{
        background: url(app/core/styles/images/publish_inquiry_bg.png) no-repeat center center;
        width: 139px;
        height: 45px;
        background-size: 100%;
        position: absolute;
        top: -7px;
        display: block;
        right: 0;
    }
</style>
<body>
{x2;include:nav2}

<div class="container container-list">
    <!--我的模块开始-->
    <div class="zmm_panel panel-default">
        <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
        <div class="zmm-qydt-title zmm-qydt-shsj1">
            <p>
                <em class="title-triangle"></em>
                询价管理
            </p>
            <div class="pull-right" style="position:relative;margin-right: 20px;">
                <a href="index.php?user-company-purchases-xunJianPush" class="yellow-text publish-inquiry-btn"></a>
            </div>
        </div>
        <div class="search-bar">
            <div class="condition-table form-inline">
                <div class="form-group">
                    询价单名称：
                    <input style="width: 93px;" class="form-control" name="search[keyword]" size="6"
                           type="text" value="{x2;$keyword}" id="keyword" placeholder=""/>
                </div>
                <div class="form-group">
                    采购类型：
                    <select class="form-control" name="search[purchasetype]" id="purchasetype">
                        <option value=''>请选择</option>
                        <option value='1' {x2;if:$type== 1} selected="selected" {x2;endif}>邀请询价</option>
                        <option value='2' {x2;if:$type== 2} selected="selected" {x2;endif}>公开询价</option>


                    </select>
                </div>
                <div class="form-group">
                    状态：
                    <select class="form-control" name="search[purchasetype]" id="purchasestatus">
                        <option value=''>请选择</option>
                        <option value='1' {x2;if:$status== 1} selected="selected" {x2;endif}>询价中
                        </option>
                        <option value='2' {x2;if:$status== 2} selected="selected" {x2;endif}>待定标
                        </option>
                        <option value='3' {x2;if:$status== 3} selected="selected" {x2;endif}>已完成
                        </option>
                        <option value='4' {x2;if:$status== 4} selected="selected" {x2;endif}>已终止
                        </option>

                    </select>
                </div>
                <div class="form-group">
                    发布时间：
                    <input class="form-control" type="text" name="search[stime]" size="10" id="stime"
                           value="{x2;$stime}"/>-<input class="form-control" size="10" type="text"
                                                        name="search[etime]" id="etime"
                                                        value="{x2;$etime}"/>
                </div>
                <button class="btn btn-primary search-btn"
                        style="background-color:#009944;margin-left: 20px" onclick="doSearch()">搜索
                </button>
            </div>
        </div>
        <div class="zmm-panel-body">
            {x2;if:$pageStatus == '1'}
            <table class="table table-hover table-bordered">
                <thead>
                <tr class="info">
                    <th width="50px">序号</th>
                    <th width="260px">询价单名称</th>
                    <th>类型</th>
                    <th>状态</th>
                    <th>报价截止时间</th>
                    <th>报价数量</th>
                    <th width="200">操作</th>
                </tr>
                </thead>
                <tbody>

                {x2;tree:$contentarr['data'],content,cid}
                <tr>
                    <td>{x2;v:content['ordernum']}</td>
                    <td class="picture" style="line-height: 1.5em"><div class="line2-style">{x2;v:content['xunjia_title']}</div></td>
                    {x2;if:v:content['xunjia_type']==1}
                    <td>邀请询价</td>
                    {x2;else}
                    <td>公开询价</td>
                    {x2;endif}
                    {x2;if:v:content['status']==1}
                    <td>询价中</td>
                    {x2;elseif:v:content['status']==2}
                    <td>待定标</td>
                    {x2;elseif:v:content['status']==3}
                    <td>已完成</td>
                    {x2;elseif:v:content['status']==4}
                    <td>已终止</td>
                    {x2;endif}
                    <td>{x2;date:v:content['end_time'],'Y-m-d H:i'}</td>

                    {x2;if:v:content['offernum']}
                    <td><a href="index.php?user-company-purchases-inquiryinfo&id={x2;v:content['id']}"
                           class="btn yellow-text">{x2;v:content['offernum']}</a></td>
                    {x2;else}
                    <td><p class="btn yellow-text">{x2;v:content['offernum']}</p></td>
                    {x2;endif}

                    <td class="actions">
                        <div class="btn-group">
                            {x2;if:v:content['status']==1}

                                            <a class="btn yellow-text" onclick="catComment('{x2;v:content[id]}')"
                                               title="澄清"><em class="iconfont">&#xe616;</em></a>

                                            {x2;endif}


                                            <a class="btn yellow-text"
                                               href="index.php?user-company-purchases-inquiryinfo&id={x2;v:content['id']}"
                                               title="详情"><em class="iconfont">&#xe63c;</em></a>

                                            {x2;if:v:content['status']==2}
                                            <a class="btn yellow-text"
                                               href="index.php?user-company-purchases-inquiryinfo&id={x2;v:content['id']}#offerinfo"
                                               title="定标"><em class="iconfont">&#xe613;</em></a>
                                            {x2;endif}
                                            <!-- <a class="btn yellow-text" href="index.php?user-company-clarify&id={x2;v:content['id']}" title="导出" download="index.php?user-company-clarify&id={x2;v:content['id']}"><em class="iconfont">&#xe612;</em></a> -->

                            {x2;if:v:content['status']==1 || v:content['status']==2}
                            <a class="btn yellow-text enddel"
                               href="index.php?user-company-purchases-delpurchase&id={x2;v:content['id']}"
                               title="终止"><em class="iconfont">&#xe672;</em></a>
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
            <!--空内容警告-->
            {x2;if:$pageStatus == '3'}
            <div class="empty-content-box">
                <div class='empty-content-img'>
                    <img src="app/core/styles/img/empty-content.png" alt="内容为空" style="width: 224px">
                </div>
                <p class="empty-content-title">尚未创建相关信息哦～</p>
            </div>
            {x2;endif}
        </div>

        <ul class="pagination pull-right">
            {x2;$contentarr['pages']}
        </ul>
        <!--我的模块结束-->
    </div>
</div>
</div>
<div class="modal fade" id="clarify-modal">
    <div class="modal-dialog" style="width: 460px;margin-top: 160px;border-radius: 5px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div style="font-size: 16px">澄清</div>
            </div>
            <div id="test"></div>
            <div class="modal-body">
                <div class="form-group">
                    <div style="margin: 0 auto;">
                        <div class="form-group">
                            <span style="float: left">澄清内容：</span>
                            <textarea name="remark-input" id="remark-input" cols="40" rows="3" placeholder="请输入200个字以内澄清信息"
                                      maxlength="200" style="width: 355px;resize:none"></textarea>
                        </div>

                        <div class="form-group" style="margin-bottom: 0">
                            <span style="float: left">澄清文件：</span>
                            <script type="text/template" id="pe-template-url2">
                                <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传">
                                        <div class="qq-upload-button-selector">
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals">
                                                <li>
                                                <span class="btn btn-default" style="color: #009944">
                                                    <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>
                                                    上传文档
                                                </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" id="clarify-files" tabindex="0" value="">
                                                    <div style="position: relative;float: right;margin-top: 4px;margin-left: 5px;" class="uploaded-show">
                                                        <span class="qq-upload-file-selector qq-upload-file upload-file-name" id="clarify-title" style="width: 200px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"></span>
                                                        <span class="delete-file-btn yellow-text" style="float: right;">&times;</span>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions">
                                                <li style="text-align: left">
                                                    <span class="btn btn-default" style="border:1px solid #009944;color: #009944">
                                                        <em class="iconfont" style="padding-right: 5px">&#xe6a0;</em>上传文档
                                                    </span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="urls" tabindex="0" value="">
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </script>
                            <div class="fineuploader" attr-list="true" attr-template="pe-template-url2"
                                 attr-ftype="pdf,rar,zip,doc,docx,xls,xlsx" load-type="inner" style="display: inline-block" ></div>


                        </div>
                        <div class="form-group file-type-note" style="padding-left: 70px;color: #999999">支持pdf,rar,zip,doc,docx,xls,xlsx文件</div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-primary r20 clarify-confirm-btn" id="tocomment"> 确&nbsp;&nbsp;定
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
{x2;include:footer2}


<script>
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
    $(function () {
        //时间控件
        $('#stime').datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd hh:ii:00',
            todayHighlight: 1,
            forceParse: 0,
            showMeridian: 1,
            autoclose: 1
        });
        //时间控件
        $('#etime').datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd hh:ii:00',
            todayHighlight: 1,
            forceParse: 0,
            showMeridian: 1,
            autoclose: 1
        });
        $('.submenu:eq(2)').delay(400).slideDown(700);
        $('.submenu:eq(2) li:eq(1)').addClass("active");

        //点击弹出modal
        $('.clarify-btn').on('click', function () {
            $("#clarify-modal").modal('show');
        })

        //澄清上传文件
        $('.clarify-confirm-btn').on('click', function () {
            var file = $('#clarify-files').val();
        })

        //增加上传文件点击后颜色
        $('.qq-upload-button-selector input').change(function () {
            $('.qq-upload-button-selector').find('.btn-default').css('border','1px solid #009944');
        })
    });

    /**
     * [doSearch 搜索方法]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-15
     * @return   {[type]}      [description]
     */
    function doSearch() {
        var keyword = $("#keyword").val();
        var purchasetype = $("#purchasetype").val();
        var purchasestatus = $("#purchasestatus").val();
        var stime = $("#stime").val();//开始时间
        var etime = $("#etime").val();//结束时间*/

        var url = 'index.php?user-company-purchases-inquiry&t=1';
        if (keyword != '') {
            url += '&keyword=' + keyword;
        }
        if (purchasetype != '') {
            url += '&purchasetype=' + purchasetype;
        }
        if (purchasestatus != '') {
            url += '&purchasestatus=' + purchasestatus;
        }

        if (stime != '') {
            url += '&stime=' + stime;
        }
        if (etime != '') {
            url += '&etime=' + etime;
        }
        window.location.href = url;
    }


    function catComment(ordid) {
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-purchases-ajaxComment&id=' + ordid,
            dataType: 'JSON',
            async: true,
            success: function (res) {
                if (res.statusCode == 201) {
                    $("#test").html(res.data);
                } else {
                    var message = res.message;
                    return false;
                }
            },
            error: function (e) {
                console.log(e);
            }
        })
        //打开modal
        $('#remark-input').val('');

        if ($('#clarify-modal #clarify-files').val()) {
            $('#clarify-modal #clarify-title').closest('.uploaded-show').remove();
        }
        $('#clarify-modal #clarify-files').val('');
        $("#clarify-modal").modal('show');
    }

    var inquiryCommitBtnlock = 0;
    //---提交澄清----
    $('#tocomment').on('click', function () {
        //多次提交？
        if (inquiryCommitBtnlock === 1) {
            return false;
        }

        var sn = $('#sn').val();//询价信息ID
        var text = $('#remark-input').val();
        var fileurl = $('#clarify-files').val();
        var filename = $("#clarify-title").text();
        if (!sn) {

            var data = {
                result: false,
                message: '请填写澄清信息'
            };
            $.zoombox.show('ajax', data);
            return false;
        }
//        if (!fileurl) {
//            var data = {
//                result: false,
//                message: '请上传文档'
//            };
//            $.zoombox.show('ajax', data);
//            return false;
//        }
        inquiryCommitBtnlock = 1;
        var jsons = {text: text, fileurl: fileurl, filename: filename, sn: sn};
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-purchases-ajaxpost',
            dataType: 'JSON',
            data: jsons,
            success: function (res) {
                inquiryCommitBtnlock = 0;
                if (res.statusCode == 200) {
                    //$("#myModal").modal('hide');
                    window.location.href = 'index.php?user-company-purchases-inquiry';
                } else {
                    alert('失败了');
                }
            },
            error: function (e) {
                console.log(e);
                inquiryCommitBtnlock = 0;
            }
        })
    })
</script>
</body>

</html>