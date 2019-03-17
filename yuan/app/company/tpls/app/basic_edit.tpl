{x2;include:header}
<body>
{x2;include:nav}
<style>
    .thumbnail{
        height: 143px;
        margin-bottom: 10px;
    }
    .must_text{color: red;}
        .menu_list{
        margin-left: 40px;
        letter-spacing: 1px;
        color: #777;
    }
    .menu_list span{
        color: #777;
    }
    .heading{background: none!important;color: #595656!important;text-align: left!important;border-bottom: 1px solid #f2f2f2;font-weight: bold;}
    .pull-left ul li{border: none!important;}
    .heading img{width: 25px;height: 25px;margin:0 20px;}
    .active {
            color: #333;
            background: url(app/core/styles/img/menu_icon/active.png) no-repeat;
            background-size: auto 50px;
            background-color: rgba(83,181,126,0.08);
            }
</style>
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php">企业中心</a> ><a>企业简介</a></span>
        </div>
        <!-- 导航 end -->
                    <!-- 左侧栏 end -->
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
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right" style="float:left;width:83%;">
                <div>               <!--公司信息-->
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
                <!--公司简介-->
                <div>

                    <!--企业简介-->
                    <div class="zmm_panel panel-default">
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <p>企业简介</p>
                        </div>
                        <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                            <form action="index.php?company-app-company-indexedit" method="post" class="form-horizontal edit-from">
                                <input type="hidden" name="args[userid]" value="{x2;$data['userid']}">
                                <div class="form-group">
                                    <label for="purchasetitle" class="control-label col-sm-2"><span class="must_text">*</span>企业名称：</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" id="purchasetitle"
                                               name="args[company_name]" needle="needle" msg="您必须输入公司名称"
                                               value="{x2;$data['company_name']}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="purchasetitle" class="control-label col-sm-2">成立时间：</label>
                                    <div class="col-sm-4">
                                        <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}"
                                               data-date-format="yyyy-mm-dd" type="text" size="10"
                                               value="{x2;$data['company_createtime']}" name="args[company_createtime]"
                                               msg="您必须输入成立时间">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="purchasetitle" class="control-label col-sm-2">企业人数：</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" minvalue="1" datatype="number" type="text"
                                               id="purchasetitle" name="args[company_members]"
                                               msg="您必须输入企业人数（整数）" value="{x2;$data['company_members']}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="purchasetitle" class="control-label col-sm-2"><span class="must_text">*</span>注册资本（万元）：</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" id="purchasetitle"
                                               name="args[company_capital]" needle="needle" msg="您必须输入注册资本"
                                               value="{x2;$data['company_capital']}">
                                    </div>
                                </div>
                                <!--
                                <div class="form-group">
                                    <label for="purchasetitle" class="control-label col-sm-2"><span class="must_text">*</span>工商营业执照：</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" id="purchasetitle"
                                               name="args[company_licence]" needle="needle" msg="您必须输入营业执照"
                                               value="{x2;$data['company_licence']}">
                                    </div>
                                </div>
                                -->
                                <div class="form-group">
                                    <label for="purchasetitle" class="control-label col-sm-2">开户银行名称：</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" id="purchasetitle"
                                               name="args[company_bank]"  msg="您必须输入开户银行名称"
                                               value="{x2;$data['company_bank']}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="purchasetitle" class="control-label col-sm-2">开户银行账号：</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" id="purchasetitle"
                                               name="args[company_account]"  msg="您必须输入开户银行账号"
                                               value="{x2;$data['company_account']}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="purchasetitle" class="control-label col-sm-2">企业法人：</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" id="purchasetitle"
                                               name="args[company_leader]"  msg="您必须输入企业法人"
                                               value="{x2;$data['company_leader']}">
                                    </div>
                                </div>
                                <!--
                                <div class="form-group">
                                    <label for="purchasetitle" class="control-label col-sm-2"><span class="must_text">*</span>联系人：</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" type="text" id="purchasetitle"
                                               name="args[company_contacter]" needle="needle" msg="您必须输入联系人"
                                               value="{x2;$data['company_contacter']}">
                                    </div>
                                </div>
                                -->
                                <div class="form-group">
                                    <label for="purchasetext" class="control-label col-sm-2"> 企业简介:</label>
                                    <div class="col-sm-9">
                                        <textarea id="purchasetext" rows="7" cols="4" class="ckeditor"
                                                  name="args[company_intro]">{x2;realhtml:$data['company_intro']}</textarea>
                                    </div>
                                </div>
                                <!--
                                <div class="form-group">
                                    <label for="purchasedescribe" class="control-label col-sm-2">经营范围：</label>
                                    <div class="col-sm-9">
                                        <textarea id="purchasedescribe" class="form-control" name="args[company_scope]"
                                                  rows="7" cols="4">{x2;$data['company_scope']}</textarea>
                                    </div>
                                </div>
                                -->
                                <div class="form-group">
                                    <label for="block" class="control-label col-sm-2">首页Logo：</label>
                                    <div class="col-sm-9">
                                        <script type="text/template" id="pe-template-purchasethumb">
                                            <div class="qq-uploader-selector" style="width:30%"
                                                 qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                                <div class="qq-upload-button-selector" style="clear:both;">
                                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                        aria-relevant="additions removals" style="clear:both;">
                                                        <li class="text-center">
                                                            <div class="thumbnail">
                                                                <img style="height: 100%!important;" class="qq-thumbnail-selector" alt="点击上传新图片">
                                                                <input type="hidden" class="qq-edit-filename-selector"
                                                                       name="args[company_logo]" tabindex="0">
                                                            </div>
                                                        </li>
                                                    </ul>
                                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                        aria-relevant="additions removals" style="clear:both;">
                                                        <li class="text-center">
                                                            <div class="thumbnail">
                                                                <img  style="height: 100%!important;" class="qq-thumbnail-selector"
                                                                     src="{x2;if:$data['company_logo']}{x2;$data['company_logo']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}"
                                                                     alt="点击上传新图片">
                                                                <input type="hidden" class="qq-edit-filename-selector"
                                                                       name="args[company_logo]" tabindex="0"
                                                                       value="{x2;$data['company_logo']}">
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </script>
                                        <div class="fineuploader" attr-ftype="jpg,png,gif" attr-type="thumb"
                                             attr-template="pe-template-purchasethumb">
                                        </div>
                                        <span style="color: #999;">只支持jpg,png,gif格式图片</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="block" class="control-label col-sm-2">黄页Logo：</label>
                                    <div class="col-sm-9">
                                        <script type="text/template" id="pe-template-purchasethumb-da">
                                            <div class="qq-uploader-selector" style="width:30%"
                                                 qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                                <div class="qq-upload-button-selector" style="clear:both;">
                                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                        aria-relevant="additions removals" style="clear:both;">
                                                        <li class="text-center">
                                                            <div class="thumbnail">
                                                                <img style="height: 100%;" class="qq-thumbnail-selector" alt="点击上传新图片">
                                                                <input type="hidden" class="qq-edit-filename-selector"
                                                                       name="args[company_logo_da]" tabindex="0">
                                                            </div>
                                                        </li>
                                                    </ul>
                                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite"
                                                        aria-relevant="additions removals" style="clear:both;">
                                                        <li class="text-center">
                                                            <div class="thumbnail">
                                                                <img style="height: 100%;" class="qq-thumbnail-selector"
                                                                     src="{x2;if:$data['company_logo_da']}{x2;$data['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}"
                                                                     alt="点击上传新图片">
                                                                <input type="hidden" class="qq-edit-filename-selector"
                                                                       name="args[company_logo_da]" tabindex="0"
                                                                       value="{x2;$data['company_logo_da']}">
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </script>
                                        <div class="fineuploader" attr-ftype="jpg,png,gif" attr-type="thumb"
                                             attr-template="pe-template-purchasethumb-da">
                                        </div>
                                        <span style="color: #999;">只支持jpg,png,gif格式图片</span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="purchasetemplate" class="control-label col-sm-2"></label>
                                    <div class="col-sm-9 operate-box">
                                        <button class="btn btn-primary commit" data-type="1" type="submit" style="background:#007222">提交</button>
                                        <!--<button class="btn btn-primary cancel" data-type="2" type="button">取消</button>
                                        <button class="btn btn-primary save-draft" data-type="0" type="button">保存</button>-->
                                        <input type="hidden" name="purchaseid" value="{x2;$purchaseid}">
                                        <!--提交-1；保存-0-->
                                        <input type="hidden" name="submit" value="1">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 右侧  end -->
        </div>
    </div>
</div>
{x2;include:footer2}
<script type="text/javascript" src="app/core/styles/js/user/company/basic_edit.js"></script>
</body>
<script>
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
    // $('.commit').on('click', function() {
          
    // });
</script>
</html>
