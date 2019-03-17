{x2;include:header}

<body>

{x2;include:nav}

<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">采购信息管理</a> > <a>修改采购信息</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right edit-purchase">
                <!--公司简介-->
                <div>
                    <!--我的模块开始-->
                    <div class="zmm_panel panel-default">
                        <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                        <div class="zmm-qydt-title zmm-qydt-shsj1"><p><em class="title-triangle"></em>修改采购信息</p></div>
                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                            <form action="index.php?user-company-purchases-edit&edittype={x2;$edittype}" method="post"
                                  class="form-horizontal edit-purchase-from">

                                {x2;if:$purchase['purchasemoduleid']==5}
                                {x2;include:editequipment}
                                {x2;endif}
                                {x2;if:$purchase['purchasemoduleid']==7}
                                {x2;include:editservice}
                                {x2;endif}


                                <h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">联系方式</h4>
                                <div class="form-group">
                                    <label for="purchasecontacter" class="control-label col-sm-2"><span
                                                class="hln-cue">*</span>联系人：</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control require" name="args[purchasecontacter]"
                                               id="purchasecontacter" value="{x2;$purchase['purchasecontacter']}"
                                               needle="needle" msg="您必须输入联系人"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="purchasephone" class="control-label col-sm-2"><span
                                                class="hln-cue">*</span>联系电话：</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control require" name="args[purchasephone]"
                                               id="purchasephone" value="{x2;$purchase['purchasephone']}"
                                               needle="needle" msg="您必须输入联系电话"/>
                                    </div>

                                    <label class="radio-line"><input type="radio" name="args[purchaseisopen]"
                                                                     id="purchaseisopen0" value="1"
                                                {x2;if:$purchase['purchaseisopen']=='1'}
                                                                     checked='true' ;
                                                {x2;endif}
                                        /> 公开</label>&nbsp;&nbsp;<label class="radio-line"><input type="radio"
                                                                                                  name="args[purchaseisopen]"
                                                                                                  id="purchaseisopen"
                                                                                                  value="0" {x2;if:$purchase['purchaseisopen']=='0'}
                                                                                                  checked='true' ;
                                                {x2;endif}
                                        /> 不公开</label>&nbsp;&nbsp;

                                    <span style="color:red">选择不公开将显示平台客服电话</span>
                                </div>


                                <div class="form-group">
                                    <label for="purchasewechat" class="control-label col-sm-2">联系人微信：</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="args[purchasewechat]"
                                               id="purchasewechat" value="{x2;$purchase['purchasewechat']}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="purchasetemplate" class="control-label col-sm-2"></label>
                                    <div class="col-sm-9 operate-box">
                                        <button class="btn btn-primary" type="button" data-type="1"
                                                style="background-color:#009944">提交
                                        </button>
                                        <button class="btn yellow-text-reverse" type="button" data-type="2">保存</button>
                                        <button class="btn btn-default ajax " type="button" data-type="3"
                                                target="datacontent">取消
                                        </button>
                                        <input type="hidden" name="purchaseid" value="{x2;$purchaseid}">
                                        <input type="hidden" name="submit" value="1">
                                        <input type="hidden" name="args[purchasemoduleid]"
                                               value="{x2;$purchase['purchasemoduleid']}">
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
{x2;include:purchasejs}

<script>

    $(function () {
        $('.submenu:eq(2)').delay(400).slideDown(700);
        $('.submenu:eq(2) li:eq(1)').addClass("active");

        function validateFormByType(type) {
            var $formItems = $('.edit-purchase-from').find('.require');
            $formItems.each(function (i) {
                if (type === 'draft') {
                    if ($(this).attr("needle") === 'needle') {
                        $(this).removeAttr("needle");
                    }
                } else {
                    if (!$(this).attr("needle")) {
                        $(this).attr("needle", "needle");
                    }
                }

            });

        }

        //表单提交 1,直接提交；2，保存草稿，3，取消按钮
        $(".operate-box").on('click', 'button', function () {
            var clickType = $(this).data('type');
            $('input[name=submit]').val(clickType);
            if (clickType === 3) {
                validateFormByType('draft');
                var data = {
                    result: false, msg: "是否保存当前信息到草稿箱", buttons: [
                        {text: '确定', url: 'index.php?user-company-purchases-edit', formSelector: '.edit-purchase-from'},
                        {text: '取消', url: 'index.php?user-company-purchases', isHref: true,},
                    ]
                };
                $.zoombox.show('customConfirm', data);
            } else {
                if (clickType === 2) {
                    validateFormByType('draft');
                } else {
                    validateFormByType('commit');
                }

                $('.edit-purchase-from').submit();
            }
        })

    });
</script>
</body>

</html>
