	{x2;include:header}
<style type="text/css">
	.form_ops{width: 100%;display: flex;justify-content: space-between;flex-wrap: wrap;}
	.form_ops .form_op {width: 50%;height: 36px;}
	.form_ops .form_op label{width: 145px;}
	.form_ops .form_op input{width: 260px;}
	.grop_b select{width: 150px;float: left;margin-right: 15px;margin-top: 5px;}
	.grop_b label{width: 114px;}
	.btn_as{margin-left: 16px;background: none;border: 1px solid #ccc;color: #6e6e6e;}
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
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right edit-contact-us">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}
                    <!--我的模块开始-->
                    <div class="zmm_panel panel-default" >
                        <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <p><em class="title-triangle"></em>修改联系我们</p >
                        </div>

                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                            <form action="index.php?user-company-basic-contactedit" method="post" class="form-horizontal">
                            	<div class="form_ops">
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
			                          	 <div class="col-sm-4" style="margin-left:150px;">
			                             	<a  style="color:#fe9010"target="_blank" href="http://shang.qq.com/v3/widget.html">点击立即免费开通</a>
			                             </div>
			                          </div>
			                    </div>
			                <div class="prover_s">
			                	 <label style="width: 145px;" for="news_title" class="control-label col-sm-2"><span class="color-red" style="margin-right:5px;display: inline;">*</span>企业所在地址&nbsp;&nbsp;&nbsp;&nbsp;</label>
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
                                <button class="btn btn-primary" type="submit">提交</button>
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
    $(function() {
        $('.submenu:eq(0)').delay(400).slideDown(700);
        $('.submenu:eq(0) li:eq(6)').addClass("active");
    });
</script>
</body>

</html>
