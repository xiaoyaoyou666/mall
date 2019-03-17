	{x2;include:header}
<style type="text/css">
	.form_ops{width: 100%;display: flex;justify-content: space-between;flex-wrap: wrap;}
	.form_ops .form_op {width: 50%;height: 36px;}
	.form_ops .form_op label{width: 145px;}
	.form_ops .form_op input{width: 260px;}
	.grop_b select{width: 150px;float: left;margin-right: 15px;margin-top: 5px;}
	.grop_b label{width: 114px;}
	.btn_as{margin-left: 16px;background: none;border: 1px solid #ccc;color: #6e6e6e;}
        .heading{background: none!important;color: #595656!important;text-align: left!important;border-bottom: 1px solid #f2f2f2;font-weight: bold;}
    .pull-left ul li{border: none!important;}
    .heading img{width: 25px;height: 25px;margin: 0 20px;}
    .active{color: #333;
        background: url(app/core/styles/img/menu_icon/active.png) no-repeat!important;
        background-size: auto 50px!important;
        background-color: rgba(83,181,126,0.08)!important;}
        .zmm-qydt-shsj{text-indent: 0}
</style>
<body>
{x2;include:nav}

<div class="zmm-zx-centent ">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>联系我们</a></span>
        </div>
       <div class="pull-left" style="border: 1px solid #f2f2f2;">
            <div class="heading"><img src="app/core/styles/images/qyhy/header_sd.png"/>导&nbsp;&nbsp;&nbsp;&nbsp;航</div>
            <ul>
                <li class="active"><a href="index.php?company-app-company-index&companyid={x2;$data['userid']}" class="select">企业简介</a></li>
                <li><a href="index.php?company-app-company-news&companyid={x2;$data['userid']}">企业动态</a></li>
                <li><a href="index.php?company-app-company-product&companyid={x2;$data['userid']}">供货范围</a></li>
                <li><a href="index.php?company-app-company-qualification&companyid={x2;$data['userid']}" >荣誉资质</a></li>
                <li><a href="index.php?company-app-company-project&companyid={x2;$data['userid']}" >成功案例</a></li>
                <li><a href="index.php?company-app-company-contact&companyid={x2;$data['userid']}" >联系方式</a></li>
                {x2;if:in_array($role,[1,2])}
                <li><a href="index.php?company-app-company-companyMaterials&companyid={x2;$data['userid']}" >企业资质</a></li>
                {x2;endif}
            </ul>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right edit-contact-us" style="width:83%;float:left">
                <!--公司简介-->
                 <div>              <!--公司信息-->
                <div class="zmm_panel panel-default zmm-gsxi">
                    <div>
                        <div class="zmm-gs-pj">
                            <table style="width: 100%">
                                <tr>
                                    <td align="center" valign="top" width="240px">
                                        <div class="pull-left zmm-gs-pj-logo t20 l20">
                                            <img src="{x2;if:$data['company_logo_da']}{x2;$data['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}" alt="" style="width: 100%;height: 100%;">
                                        </div>
                                    </td>
                                    <td>
                                        <ul class="pull-left">
                                            <li><span class="zmm-gs-title">{x2;$data['company_name']}</span>
                                                <!--<a class="t_c_on l20">修改企业资料</a>-->
                                                <!--<a class="sc_a r20"><span><img src="app/core/styles/images/qyhy/sc_star.png"></span>收藏</a>
                                                <a class="sc_a sc_a_on r20"><span><img src="app/core/styles/images/qyhy/qy_star_on.png"></span>已收藏</a>
                                                -->
                                            </li>
                                            <li class="zmm-gs-dj">
                                                <span id="levelhtml">
                                                    <input type="hidden" id="level" value="{x2;$data['company_level']}">
                                                </span>
                                                <span class="zmm-gs-djl">点击量：<span class="zmm-font-bold">{x2;$data['userreferrer']}<span></span>
                                            </li>

                                            <button onclick="toShop();return false;" class="button_tt dw_tt pull-right" autocomplete="off">进入网格超市</button>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div>
                    <!--我的模块开始-->
                    <div class="zmm_panel panel-default" >
                        <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <p><em class="title-triangle"></em>修改联系我们</p >
                        </div>

                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                            <form action="index.php?company-app-company-contactedit" method="post" class="form-horizontal">
                            	<div class="form_ops">
                                    <input type="hidden" name="args[userid]" value="{x2;$data['userid']}">
                                    <div class="form-group form_op">
                                        <label for="news_title" class="control-label col-sm-2"><span class="color-red" style="margin-right:5px;display: inline;">*</span>第一联系人</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" type="text" id="news_title" name="args[company_contacter]" needle="needle" msg="您必须输入第一联系人" value="{x2;$data['company_contacter']}">
                                        </div>
                                    </div>
                                    <div class="form-group form_op">
                                        <label for="news_title" class="control-label col-sm-2"><span class="color-red" style="margin-right:5px;display: inline;">*</span>第二联系人</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" type="text" id="news_title" name="args[contact_info][contacts_name]" needle="needle" msg="您必须输入第二联系人" value="{x2;$userContacts['contacts_name']}">
                                        </div>
                                    </div>
                                    <div class="form-group form_op">
                                        <label for="news_title" class="control-label col-sm-2"><span class="color-red" style="margin-right:5px;display: inline;">*</span>手机号</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" type="text" id="news_title" name="args[company_phone]" needle="needle" msg="您必须输入第一联系人手机号" value="{x2;$data['company_phone']}">
                                        </div>
                                    </div>
                                    <div class="form-group form_op">
                                        <label for="news_title" class="control-label col-sm-2"><span class="color-red" style="margin-right:5px;display: inline;">*</span>手机号</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" type="text" id="news_title" name="args[contact_info][user_phone]" needle="needle" msg="您必须输入第二联系人手机号" value="{x2;$userContacts['user_phone']}">
                                        </div>
                                    </div>
                                    <div class="form-group form_op">
                                        <label for="news_title" class="control-label col-sm-2"><span class="color-red" style="margin-right:5px;display: inline;">*</span>固定电话</label>
                                         <div class="col-sm-1" style="width: 65px;">
                                            <input style="width: 65px;" class="form-control" type="text"  needle="needle" id="news_title" name="args[company_quhao]" msg="您人固话" value="{x2;$data['quhao']}" placeholder="区号">
                                        </div>
                                        <div class="col-sm-1" style="width:10px;margin-left: 10px;">-</div>
                                        <div class="col-sm-2" style="width:170px;padding-left: 0px;">
                                            <input style="width:170px;" class="form-control" type="text" id="news_title" name="args[company_tel]" needle="needle" msg="您必须输入第一联系人固话" value="{x2;$data['company_tel']}" >
                                        </div>
                                    </div>
                                    <div class="form-group form_op">
                                        <label for="news_title" class="control-label col-sm-2"><span class="color-red" style="margin-right:5px;display: inline;">*</span>固定电话</label>
                                         <div class="col-sm-1" style="width: 65px;">
                                            <input style="width: 65px;" class="form-control" type="text"  needle="needle" id="news_title" name="args[contact_info][user_quhao]" msg="您人固话" value="{x2;$userContacts['quhao']}" placeholder="区号">
                                        </div>
                                        <div class="col-sm-1" style="width:10px;margin-left: 10px;">-</div>
                                        <div class="col-sm-4" style="width:170px;padding-left: 0px;">
                                            <input style="width:170px;" class="form-control" type="text" id="news_title" name="args[contact_info][user_tel]" needle="needle" msg="您必须输入第二联系人固话" value="{x2;$userContacts['user_tel']}">
                                        </div>
                                    </div>
                                    <div class="form-group form_op">
                                        <label for="news_title" class="control-label col-sm-2"><span class="color-red" style="margin-right:5px;display: inline;">*</span>邮箱</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" type="text" id="news_title" name="args[company_email]" needle="needle" msg="您必须输入第一联系人邮箱" value="{x2;$data['company_email']}">
                                        </div>
                                    </div>
                                    <div class="form-group form_op">
                                        <label for="news_title" class="control-label col-sm-2"><span class="color-red" style="margin-right:5px;display: inline;">*</span>邮箱</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" type="text" id="news_title" name="args[contact_info][user_mail]" needle="needle" msg="您必须输入第二联系人邮箱" value="{x2;$userContacts['user_mail']}">
                                        </div>
                                    </div>
			                        <div class="form-group form_op">
			                            <label for="news_title" class="control-label col-sm-2">客服热线</label>
			                            <div class="col-sm-4">
			                                <input class="form-control" type="text" id="news_title" name="args[company_kefu]"  msg="您必须输入客服热线" value="{x2;$data['company_kefu']}">
			                            </div>
			                        </div>
			                        <div class="form-group form_op">
			                            <label for="news_title" class="control-label col-sm-2">企业邮箱</label>
			                            <div class="col-sm-4">
			                                <input class="form-control" type="text" id="news_title" name="args[useremail]"  msg="您必须输入企业邮箱" value="{x2;$data['useremail']}">
			                            </div>
			                        </div>
			                        <div class="form-group form_op">
			                            <label for="news_title" class="control-label col-sm-2">企业官网</label>
			                            <div class="col-sm-4">
			                                <input class="form-control" type="text" id="news_title" name="args[company_url]"  msg="您必须输入企业官网" value="{x2;$data['company_url']}">
			                            </div>
			                        </div>
			                        <div class="form-group form_op" style="width: 70%;position: relative">
			                            <label for="news_title" class="control-label col-sm-2">QQ</label>
			                            <div class="col-sm-4">
			                                <input class="form-control" type="text" id="news_title" name="args[company_qq]"  msg="您必须输企业QQ" value="{x2;$data['company_qq']}">
			                            </div>
			                        </div>

			                          <div class="form-group form_op">
			                          	 <div class="col-sm-4" style="margin-left:143px;">
			                             	<a style="color:#fe9010"target="_blank" href="http://shang.qq.com/v3/widget.html">点击立即免费开通</a>
			                             </div>
			                          </div>  
			                    </div>
    			                <div class="prover_s">
    			                	<label style="width: 145px;" for="news_title" class="control-label col-sm-2"><span class="color-red" style="margin-right:5px;display:inline;">*</span>企业所在地址&nbsp;&nbsp;&nbsp;&nbsp;</label>
    	                        {x2;tree:$html,form,fid}
    	                        <div class="form-group grop_b" style="display: inline-block;">
    	                            <div class="col-sm-4">
    	                               {x2;v:form['html']}
    	                            </div>
    	                        </div>
                            	{x2;endtree}
                            	</div>
                            <div class="form-group">
                                <label style="width: 145px;" for="news_title" class="control-label col-sm-2" ><span class="color-red" style="margin-right:5px;display: inline;"></span></label>
                                <div class="col-sm-6">
                                    <input style="width: 488px;" placeholder="请输入详细地址" class="form-control" type="text" id="news_title" name="args[company_address]"  needle="needle"  msg="您必须输入详细地址" value="{x2;$data['company_address']}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label style="width: 145px;" for="block" class="control-label col-sm-2">企业位置图</label>
                                <div class="col-sm-9">
                                    <script type="text/template" id="pe-template-purchasethumb">
                                        <div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                            <div class="qq-upload-button-selector" style="clear:both;">
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector" name="args[company_map]" tabindex="0">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                    <li class="text-center">
                                                        <div class="thumbnail">
                                                            <img class="qq-thumbnail-selector" src="{x2;if:$data['company_map']}{x2;$data['company_map']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
                                                            <input type="hidden" class="qq-edit-filename-selector" name="args[company_map]" tabindex="0" value="{x2;$data['company_map']}">
                                                        </div>
                                                    </li>
                                                </ul>
                                                <span style="color: #C0C0C0;">只支持jpg、png 格式图片</span>
                                            </div>
                                        </div>
                                    </script>
                                    <div class="fineuploader" attr-type="thumb" attr-template="pe-template-purchasethumb"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="purchasetemplate" class="control-label col-sm-2"></label>
                                <div class="col-sm-9">
                                    <button class="btn btn-primary bths" type="submit" style="background:#007222">提交</button>
                                    <button class="btn btn_as" type="button" onclick="javascript:history.back(-1);">取消</button>
                                    <input type="hidden" name="submit" value="1">
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
<script> 
   // 头部等级样式
       $(function(){
        var level = $('#level').val();
        var htmla = '';
        var htmlb = '';
        var reshtml = '推荐指数：';
        for (var i=0;i<level;i++)
        {
            htmla += "<img src='app/core/styles/images/qyhy/qy_star_on.png'>"
        }
        for (var j=0;j<5-level;j++)
        {
            htmlb += "<img src='app/core/styles/images/qyhy/qy_star.png'>"
        }
        reshtml += htmla + htmlb;
        $('#levelhtml').html(reshtml);

        //判断企业简介是不是大于3行
        if($('.company-introduction p').length){
            if($('.company-introduction p').height() >= 90){
                // var html = '<span onlick="showMore(this)">...更多</span>';
                $('.company-introduction').addClass('rows-style');
                // $('.company-introduction p').append(html);
            }
        }

        $(document).on('click','.company-introduction.rows-style',function () {
            $(this).removeClass('rows-style');
        })
    });
   
   // 
    $(function() {
        $('.submenu:eq(0)').delay(400).slideDown(700);
        $('.submenu:eq(0) li:eq(6)').addClass("active");
    });
</script>
</body>

</html>
