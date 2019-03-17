{x2;include:header}
<body>
{x2;include:nav}
<style>
    .draft-item-a:hover{
        color: #222;
    }
</style>
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>采购信息管理</a> > <a>采购信息发布</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right publish-purchase-info">
                <!--公司简介-->
                <div>
                    <!--我的模块开始-->
                    <!--草稿箱-->
                    {x2;if:$purchasedraft['data']}
                    <div class="zmm_panel panel-default">
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <p><em class="title-triangle"></em>草稿箱</p>
                        </div>
                        <ul class="draft-list">
                            {x2;tree:$purchasedraft['data'],purchase,pid}
                            <li class="draft-item">
                                <i class="tr-icon icon-draft-item yellow-text"></i>
                                <div class="draft-item-content">
                                    <a href="index.php?user-company-purchases-edit&catid={x2;v:purchase['purchasecatid']}&purchaseid={x2;v:purchase['draftid']}&edittype=2">
                                        <span class="draft-item-title">{x2;v:purchase['purchasetitle']}</span>
                                        <span class="draft-item-time">{x2;date:v:purchase['purchaseinputtime'],'Y-m-d H:i:s'}</span>
                                    </a>
                                </div>
                                <div class="draft-item-handle">
                                    <a  class="draft-item-a" href="index.php?user-company-purchases-edit&catid={x2;v:purchase['purchasecatid']}&purchaseid={x2;v:purchase['draftid']}&edittype=2"><span class="draft-item-handle-edit">编辑</span></a>
                                    <a class="btn yellow-text confirm" href="index.php?user-company-purchases-draftDel&purchaseid={x2;v:purchase['draftid']}"><span class="draft-item-handle-delete yellow-text">删除</span></a>
                                </div>
                            </li>
                            {x2;endtree}
                        </ul>
                    </div>
                    {x2;endif}
                    <div class="zmm_panel panel-default">
                        <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <p><em class="title-triangle"></em>采购信息发布</p>
                        </div>
                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                            <form action="index.php?user-company-purchases-add" method="post" class="form-horizontal add-purchase-from">
                                <label for="purchasetitle" class="control-label col-sm-2"><span class="hln-cue">*</span>需求选择：</label>
                                <div class="form-group" style="">
                                    <a class="col-xs-3" href="index.php?user-company-purchases-add&moduleid=5">
                                        <?php if($_GET['moduleid']==5){ ?>
                                        <div class="well demand-choice" id="well1"
                                             style="background-color:#009944; color: #fff;">
                                            <h5>设备/材料需求</h5>
                                        </div>
                                        <?php }else{ ?>
                                        <div class="well demand-choice" id="well1">
                                            <h5>设备/材料需求</h5>
                                        </div>
                                        <?php } ?>
                                    </a>
                                    <a class="col-xs-3 text-center"
                                       href="index.php?user-company-purchases-add&moduleid=7">
                                        <?php if($_GET['moduleid']==7){ ?>
                                        <div class="well demand-choice" id="well2 " style="background-color:#009944; color: #fff;">
                                            <h5>施工/服务需求</h5>
                                        </div>
                                        <?php }else{ ?>
                                        <div class="well demand-choice" id="well2">
                                            <h5>施工/服务需求</h5>
                                        </div>
                                        <?php } ?>
                                    </a>
                                    {x2;if:!$_user['company_istrue']}
                                    <input type="hidden" class="require" name="" needle="needle" msg="您还没有经过审核">
                                    {x2;endif}
                                </div>
                                <?php if($_GET['moduleid']==5){ ?>
                                {x2;include:equipment}
                                <?php }else{ ?>
                                {x2;include:service}
                                <?php } ?>
                                <h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">联系方式</h4>
                                <div class="form-group">
                                    <label for="purchasecontacter" class="control-label col-sm-2"><span class="hln-cue">*</span>联系人：</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control require" name="args[purchasecontacter]" id="purchasecontacter" needle="needle" msg="您必须输入联系人"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="purchasephone" class="control-label col-sm-2"><span class="hln-cue">*</span>联系电话：</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control require" name="args[purchasephone]" id="purchasephone" needle="needle" msg="您必须输入联系电话" onkeyup="value=value.replace(/[^\d]/g,'')"/>
                                    </div>
                                    <label class="radio-line"><input type="radio" name="args[purchaseisopen]" id="purchaseisopen0" value="1" checked/> 公开</label>&nbsp;&nbsp;<label class="radio-line"><input type="radio" name="args[purchaseisopen]" id="purchaseisopen1" value="0"/> 不公开</label>&nbsp;&nbsp;
                                    <span style="color:#bbb">选择不公开将显示平台客服电话</span>
                                </div>
                                <div class="form-group">
                                    <label for="purchasewechat" class="control-label col-sm-2">联系人微信：</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" name="args[purchasewechat]" id="purchasewechat"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2"></label>
                                    <div class="col-sm-9 operate-box">
                                        <button class="btn btn-primary" type="button" data-type="1">发&nbsp;&nbsp;布</button>
                                        <button class="btn yellow-text-reverse" type="button" data-type="2" >保&nbsp;&nbsp;存</button>
                                        <button class="btn btn-default ajax " type="button" data-type="3"  target="datacontent">取&nbsp;&nbsp;消</button>
                                        <?php if($_GET['moduleid']==5){ ?>
                                        <input type="hidden" name="args[purchasemoduleid]" value="5">
                                        <?php }else{ ?>
                                        <input type="hidden" name="args[purchasemoduleid]" value="7">
                                        <?php } ?>
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
    $(function () {

        $("#aa").change(function () {

            var b = $("#bb").val();
            var a = $("#aa").val();
            //var $parent = $(this).parent();
            //var $html = $("<span style='color:red'>收货时间不能小于开始时间</span>");
            if (a < b) {
                //alert("收货时间不能小于开始时间");
                //
                $("#messModal").modal();
                //$parent.append($html);
                $("#aa").val("");
            } else {

            }
        });
    });

    $(function () {
        $('.submenu:eq(2)').delay(400).slideDown(700);
        $('.submenu:eq(2) li:eq(0)').addClass("active");

        $(".operate-box").on('click', 'button', function () {
            var clickType = $(this).data('type');
            $('input[name=submit]').val(clickType);
            if(clickType === 3){
                validateFormByType('draft');
                var data = {result: false, msg: "是否保存当前信息到草稿箱",buttons:[
                        {text:'确定',url:'index.php?user-company-purchases-add',formSelector:'.add-purchase-from'},
                        {text:'取消',url:'index.php?user-company-purchases',isHref:true,},
                        ]};
                $.zoombox.show('customConfirm', data);
            }else{
                if(clickType === 2){
                    validateFormByType('draft');
                }else{
                    validateFormByType('commit');
                }
                $('.add-purchase-from').submit();
            }
        })


        function validateFormByType(type) {
            var $formItems = $('.add-purchase-from').find('.require');
            $formItems.each(function(i){
                if(type === 'draft'){
                    if($(this).attr("needle") === 'needle'){
                        $(this).removeAttr("needle");
                    }
                }else{
                    if(!$(this).attr("needle")){
                        $(this).attr("needle","needle");
                    }
                }

            });

        }
        if($('.draft-list').find('.draft-item').length >= 8){
            $(".draft-list").mCustomScrollbar({
                axis:"y", // horizontal scrollbar
            });
            var hander = "<div class='Drag_reminder handler'>" +
                " <div class='handlerTop fl' >" +
                " </div>" +
                " <p class='slide-block'>拖动滑块查看更多内容</p>" +
                " </div>" +
                "</div>";

            $(".mCSB_dragger_bar").html(hander);
            setTimeout(function () {
                $(".mCSB_dragger").css({
                    'width':'30px',
                    'height':'230px',
                })
            },1000);
        }


    });
</script>

{x2;include:purchasejs}
</body>

</html>
