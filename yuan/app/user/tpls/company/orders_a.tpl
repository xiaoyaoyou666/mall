{x2;include:header2}
{x2;include:nav}
<script>
    window.readay=function(){
        ajaxIn()

    }
</script>
<body>
<!--判断是否有兄弟元素改变样式-->


<script type="text/javascript">
    $(document).ready(function () {
        //console.log($(" .ofGoods"))
        if($(".orderBy_list").children($(".ofGoods")).length%2!=0){
            $(".orderBy_list").children("div:last-child").addClass("ofGood_width")
        }else{
            $(".orderBy_list").children("div:last-child").removeClass("ofGood_width")
        }
    });
</script>

<div class="zmm-zx-centent"  id="datacontent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">订单信息管理</a> > <a>我的订单</a></span>

        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right purchase-orders">
                <!--公司简介-->

                <!--我的模块开始-->
                <div class="zmm_panel panel-default" >
                    <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                    <div class="zmm-qydt-title zmm-qydt-shsj1">


                        <p><em class="indent_code"></em>订单号：<span>{x2;$order['ordersn']}</span></p>

                    </div>
                    <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                        <ul class="flow ">
                            <li class="backOne flow_tab {x2;if:$order['orderstatus']==1 ||$order['orderstatus']==2 || $order['orderstatus']==3 || $order['orderstatus']==4 || $order['orderstatus']==7}back-qz{x2;endif}">
                                <p class="dtur" style="padding-bottom: 10px">待确认</p>
                                <p class="times timer">{x2;date:$order['ordercreatetime'],'Y-m-d H:i:s'}</p>
                            </li>
                            <li class="backTwo flow_tabs nbs {x2;if:$order['orderstatus']==2 || $order['orderstatus']==3 || $order['orderstatus']==4 || $order['orderstatus']==7}back-fh{x2;endif} ">
                                <p class="dtur">待发货</p>
                                <p class="times timer">{x2;date:$order['orderpaytime'],'Y-m-d H:i:s'}</p>
                            </li>
                            <li class="backThree nbs {x2;if:$order['orderstatus']==3 || $order['orderstatus']==4 || $order['orderstatus']==7}back-sh{x2;endif} ">
                                <p class="dtur">待收货</p>
                                <p class="times timer">{x2;date:$order['orderouttime'],'Y-m-d H:i:s'}</p>
                            </li>
                            <li class="backFore nbs {x2;if:$order['orderstatus']==4 || $order['orderstatus']==5 || $order['orderstatus']==7}back-wc{x2;endif}">
                                <p class="dtur">完成</p>
                                <p class="times timer ">{x2;date:$order['orderrecivetime'],'Y-m-d H:i:s'}</p>
                            </li>
                        </ul>
                        <!--商品状态-->
                        {x2;if:$order['orderstatus']==99}
                        <div class="shop_status">
                            <p class="status_a">订单状态：<span style="color: #ff9f39;">{x2;if:$order['orderstatus']==99}【已取消】{x2;endif}</span></p>
                            <p class="status_b">卖方（<span>{x2;$selleruserinfo['company_name']}</span>）：<span style="color: #666;">{x2;$order['orderdescribe']}</span></p>
                        </div>
                        {x2;endif}
                    </div>
                    <!--table-->
                    <div class="table-div-body">
                        <div class="table-div-body-content">
                            <table class="table table-bordered table-responsive table-hover text-center table_style">
                                <thead>
                                <tr>
                                    <th style="width: 5%;">序号</th>
                                    <th style="width: 20%;">商品描述</th>
                                    <th style="width: 5%;">单价</th>
                                    <th style="width: 5%;">数量</th>
                                    <th style="width: 10%;">付款条码</th>
                                    <th style="width: 10%;">采购税</th>
                                    <th style="width: 5%;">小计</th>
                                    <th style="width: 15%;">项目</th>
                                    <th style="width: 10%;">物科编码</th>
                                    <th style="width: 6%;">物料组</th>
                                    <th style="width: 8%;">单位</th>
                                </tr>
                                </thead>
                                <tbody>
                                {x2;if:$order['order_type']==0}
                                {x2;tree:$order['orderitems'],cart,cid}
                                <tr>
                                    <td>{x2;v:cid}</td>
                                    <td class="shopImg">
                                        <div class="shopImages">
                                            <img src="{x2;v:cart['itemthumb']}"/>
                                        </div>
                                        <span class="art">{x2;v:cart['goodstitle']}</span>
                                    </td>
                                    <td>￥{x2;v:cart['itemprice']}</td>
                                    <td>{x2;v:cart['number']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['fukuancode']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['data_desc']}</td>
                                    <td style="color: red;" class="allcartprice">￥{x2;eval: echo v:cart['itemprice']*v:cart['number']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['factory_desc']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['wuliucode']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['wuliuzu']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['danwei']}</td>
                                </tr>
                                {x2;endtree}
                                {x2;endif} 
                                {x2;if:$order['order_type']==1}
                                {x2;tree:$order['orderitems'],cart,cid}
                                <tr>
                                    <td>{x2;v:cid}</td>
                                    <td class="shopImg">
                                        <div class="shopImages">
                                            <img src="{x2;v:cart['itemthumb']}"/>
                                        </div>
                                        <span class="art">{x2;v:cart['goodstitle']}</span>
                                    </td>
                                    <td>￥{x2;v:cart['itemprice']}</td>
                                    <td>{x2;v:cart['number']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['fukuancode']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['data_desc']}</td>
                                    <td style="color: red;" class="allcartprice">￥{x2;eval: echo v:cart['itemprice']*v:cart['number']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['factory_desc']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['wuliucode']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['wuliuzu']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['danwei']}</td>
                                </tr>
                                {x2;endtree}
                                {x2;endif} 
                                {x2;if:$order['order_type']==3}
                                {x2;tree:$order['orderitems'],cart,cid}
                                <tr>
                                    <td>{x2;v:cid}</td>
                                    <td class="shopImg">
                                        <div class="shopImages">
                                            <img src="{x2;v:cart['itemthumb']}"/>
                                        </div>
                                        <span class="art">{x2;v:cart['goodstitle']}</span>
                                    </td>
                                    <td>￥{x2;v:cart['itemprice']}</td>
                                    <td>{x2;v:cart['number']}</td>
                                    <td>{x2;v:cart['pay_num']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['data_desc']}</td>
                                    <td style="color: red;" class="allcartprice">￥{x2;eval: echo v:cart['itemprice']*v:cart['number']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['factory_desc']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['wuliucode']}</td>
                                    <td>{x2;$orderSapInfoAll[v:cart['goodsid']]['wuliuzu']}</td>
                                    <td>{x2;v:cart['danwei']}</td>
                                </tr>
                                {x2;endtree}
                                {x2;endif} 
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="11"><p>合计：<span class="allcartprice">￥{x2;$order['orderprice']}</span> 元</p></td>
                                </tr>
                                </tfoot>
                            </table>
                            <!--改动的地方-->
                            <div class="orderBy_list">
                                <div class="ofGoods">
                                    <p class="header_message"><em class="image_a"></em><span>收货信息</span></p>
                                    <div class="ofGoods_mess">
                                        <p>{x2;$order['orderaddress']['receiver']} <span style="margin-left: 10px;">{x2;$order['orderaddress']['phone']}</span></p>
                                        <p>{x2;$order['orderaddress']['province']}{x2;$order['orderaddress']['city']}{x2;$order['orderaddress']['area']}{x2;$order['orderaddress']['addressinfo']} </p>
                                    </div>
                                </div>
                                <div class="ofGoods">
                                    <p class="header_message"><em class="image_b"></em><span>支付方式</span></p>
                                    <div class="ofGoods_mess">
                                        <p>线下支付</p>
                                        <!--<p>北京市朝阳区北滨路72号5号楼3层209室</p>-->
                                    </div>
                                </div>

                                {x2;if:$order['orderstatus']==4}
                                {x2;if:$order['orderpost']}
                                <div class="ofGoods">
                                    <p class="header_message"><em class="image_a"></em><span>商品物流信息</span></p>
                                    <div class="ofGoods_mess">
                                        <p>物流名称：<span style="margin-left: 10px;">{x2;$order['orderpost']['postname']}</span></p>
                                        <p>快递单号：<span style="margin-left: 10px;">{x2;$order['orderpost']['postorder']}</span></p>
                                    </div>
                                </div>
                                {x2;endif}

                                {x2;else}
                                {x2;if:$order['orderstatus']==3 || $order['orderstatus']==4}
                                <div class="ofGoods">
                                    <p class="header_message"><em class="image_a"></em><span>商品物流信息</span><span  value="{x2;$order['ordersn']}" class="btn btn-primary" id="logistics_btns" style="float: right" value="{x2;$order['ordersn']}">修改</span></p>
                                    <div class="ofGoods_mess">
                                        <div class="divs">
                                            <div class="divc">
                                                <p class="client"><i style="text-indent: 2em;font-style: normal;
    ">物流名称：&nbsp;&nbsp;&nbsp;</i><input style="width: 262px;display: inline-block;" class="form-control" placeholder="请输入物流名称" type="text" id="logistics_names" value="{x2;$order['orderpost']['postname']}"/></p>
                                                <p class="urls urlsa"><i style="text-indent: 2em;font-style:
                                                        normal;">快递单号：&nbsp;&nbsp;&nbsp;</i><input class="form-control" style="width: 262px;display: inline-block;" placeholder="请输入快递单号" type="text"  id="logistics_nums" value="{x2;$order['orderpost']['postorder']}"/></p>
                                            </div>
                                            <div class="divcs" style="display: block;">
                                                <p class="client"><i style="font-style: normal;
    ">物流名称：&nbsp;&nbsp;&nbsp;</i><span id="aaaa">{x2;$order['orderpost']['postname']}</span></p>
                                                <p class="urls urlsa"><i style="font-style:
                                                        normal;">快递单号：&nbsp;&nbsp;&nbsp;</i><span id="bbbb">{x2;$order['orderpost']['postorder']}</span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                {x2;endif}

                                {x2;endif}

                                {x2;if:$order['orderstatus'] !=99 && $order['orderstatus'] !=1  && $order['orderstatus'] !=2}

                                <div class="ofGoods">
                                    <p class="header_message"><em class="image_a"></em><span>发票物流信息</span>
                                        <span style="float:right" class="btn-primary btn" id="logistics_btn" value="{x2;$order['ordersn']}">{x2;if:$order['invoice_post'] != ''}修改{x2;else}提交{x2;endif}</span>
                                    </p>
                                    <div class="ofGoods_mess">
                                        <div class="divsc">
                                            <div class="divcsop" {x2;if:$order['invoice_post'] == ''} style="display: none;" {x2;else}style="display: block;"{x2;endif}>
                                                <p class="client"><i style="font-style: normal;
">物流名称：&nbsp;&nbsp;&nbsp;</i><span id="ccc">{x2;$invoice['logistics_name']}</span></p>
                                                <p class="urls urlsa"><i style="font-style:normal;">快递单号：&nbsp;&nbsp;&nbsp;</i><span id="ddd">{x2;$invoice['logistics_num']}</span></p>
                                            </div>

                                            <div class="divcop" {x2;if:$order['invoice_post'] == ''} style="display: block;" {x2;else}style="display: none;"{x2;endif}>
                                                <p class="client"><i style="text-indent: 2em;font-style: normal;
">物流名称：&nbsp;&nbsp;&nbsp;</i><input style="width: 262px;display: inline-block;" class="form-control" placeholder="请输入物流名称" type="text" id="logistics_name" value="{x2;$invoice['logistics_name']}"/></p>
                                                <p class="urls urlsa"><i style="text-indent: 2em;font-style:
												normal;">快递单号：&nbsp;&nbsp;&nbsp;</i><input class="form-control" style="width: 262px;display: inline-block;" placeholder="请输入快递单号" type="text"  id="logistics_num" value="{x2;$invoice['logistics_num']}"/></p>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                {x2;endif}

                                <div class="ofGoods">
                                    <p class="header_message"><em class="image_a"></em><span>发票信息</span></p>
                                    <div class="ofGoods_mess">
                                        <p><i style="font-style: normal;text-indent: 4em;">名称：</i><span style="margin-left: 10px;">{x2;$invoiceinfo['title']}</span></p>
                                        <p>纳税人识别号：<span style="margin-left: 10px;">{x2;$invoiceinfo['number']}</span></p>
                                        <p><i style="font-style: normal;text-indent: 1em;">地址、电话：</i><span style="margin-left: 10px;">{x2;$invoiceinfo['mobile']}</span><span style="margin-left: 26px;"></span></p>
                                        <p>开户行及账号：<span style="margin-left: 10px;">{x2;$invoiceinfo['card_number']}</span><span style="margin-left: 0px;"></span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--信息-->




                    {x2;if:$order['orderstatus'] ==5 }
                    <div class="zmm_panel panel-default zmm_panels" >
                        <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <p class="mess" style="color: #ffb566;"><em class="trade_shop"></em>退换货</p>
                        </div>
                    </div>
                    <!--table-->
                    <div class="table-div-body">
                        <div class="table-div-body-content">
                            <table class="table table-bordered table-responsive table-hover text-center tab_back table_style">
                                <thead>
                                <tr>
                                    <th>退换货</th>
                                    <th>商品</th>
                                    <th>数量</th>
                                    <th>状态</th>
                                    <th>原因</th>
                                    <th>描述</th>
                                    <th>图片/文件</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>退货</td>
                                    <td class="shopImg">
                                        <div class="shopImages">
                                            <img src="app/core/styles/images/qywh_img2.png"/>
                                        </div>
                                        <span class="art">正泰 微型短路器</span>
                                    </td>
                                    <td>1</td>
                                    <td>商家 确认</td>
                                    <td>商品有瑕疵</td>
                                    <td>xxxxxxxxxxxx</td>
                                    <td>xxxx.txt</td>
                                </tr>
                                </tbody>

                            </table>
                            <!--新退换物流信息-->
                            <div class="retreat">
                                <p class="header_messages"><em class="image_d"></em><span>收货信息</span></p>
                                <div class="ofGoods_mess">
                                    <p>物流名称：<span style="margin-left: 10px;">xxxxx物流</span></p>
                                    <p>快递单号：<span style="margin-left: 10px;">43234234324324</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!---->
                    <!--退换物流信息-->
                    <div class="zmm_panel panel-default zmm_panels" >
                        <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                        <div class="zmm-qydt-title zmm-qydt-shsj1">
                            <p class="mess"><em class="title-triangle"></em>退换物流信息</p>
                        </div>
                    </div>
                    <div class="userMessage" style="clear: both;">
                        <p class="client"><i style="text-indent: 2em;font-style: normal;">物流名称：</i>  <span>xxxxx物流</span></p>
                        <p class="urls"><i style="text-indent: 2em;font-style: normal;">快递单号：</i><span>32423423342</span></p>
                    </div>
                    {x2;endif}


                    <p class="tfot">
                        <a style="background:#fff;color:#888;border: 1px solid #ccc;display: inline-block;width: 182px;height: 36px;text-align: center;line-height: 36px;border-radius: 5px;" {x2;if:$order['orderstatus']!=1}class="span_btns"{x2;endif} href="index.php?user-company-orders-mysale">
                            返&nbsp;
                            &nbsp;&nbsp;&nbsp;回</a>
                        {x2;if:$order['orderstatus']==1}
                        <span class="span_btn" id="tactives" value="{x2;$order['ordersn']}">确&nbsp;&nbsp;&nbsp;认</span>
                        {x2;endif}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
{x2;include:footer2}
</body>
<script>
    function catDetail(id,ordid){
        $("#order_id").text('序号'+id);

        $.ajax({
            type:'get',
            url: 'index.php?user-company-orders-ajaxgetorder&ordersn='+ordid,
            dataType:'JSON',
            async:true,
            success:function(res){
                if(res.statusCode == 201){
                    $("#goods_text").html(res.data);
                }else{
                    var message = res.message;
                    return false;
                }
            },
            error: function(e){
                console.log(e);
            }
        })


        $("#detailOrderDialog").modal();
    }


    //确认买家订单
    $("#tactives").on("click",function(){
        $(".model").show();
        var orderid = $(this).attr('value');
        $.ajax({
            type:'get',
            url: 'index.php?user-company-orders-orderque',
            data:{
                ordersn:orderid
            },
            dataType:'JSON',
            //async:true,
            success:function(res){
                if(res.statusCode == 200){
                    window.location.href="index.php?user-company-orders";
                }else{
                    alert('失败了');
                }
            },
            error: function(e){
                console.log(e);
            }
        })
    })



    //-----------获取评价的商品信息-----------
    function catComment(ordid){
        $.ajax({
            type:'get',
            url: 'index.php?user-company-orders-ajaxgetcomment&ordersn='+ordid,
            dataType:'JSON',
            async:true,
            success:function(res){
                if(res.statusCode == 201){
                    $("#goods_text1").html(res.data);
                }else{
                    var message = res.message;
                    return false;
                }
            },
            error: function(e){
                console.log(e);
            }
        })

        $("#myModal").modal();
    }

    //发票信息
    $('#logistics_btn').click(function(){
        if($(this).html()=="修改"){
            $(".divcsop").hide();
            $(".divcop").show();
            $(this).html("保存");
        }else{
            if($("#logistics_name").val()=="" || $("#logistics_num").val()=="") {
                alert("请输入完整信息");
            }else{

                var  logistics_name=$('#logistics_name').val();
                var  logistics_num=$('#logistics_num').val();
                var  ordersn=$(this).attr('value');
                var  status=$(this).attr('status');

                $.ajax({
                    type:'get',
                    url: 'index.php?user-company-orders-invoice&sn='+ordersn+'&logistics_name='+logistics_name+'&logistics_num='+logistics_num,
                    dataType:'JSON',
                    //async:true,
                    success:function(res){
                        if(res.statusCode == 200){
                            //alert('提交成功');
                            $("#logistics_btn").text('修改');
                            $(".divcsop").show();
                            $(".divcop").hide();
                            $("#ccc").html(logistics_name);
                            $("#ddd").html(logistics_num);
                            return true;
                        }else{
                            alert('失败了');
                        }
                    },
                    error: function(e){
                        console.log(e);
                    }
                })
            }
        }

    })

    //---提交评价----
    $('#tocomment').on('click',function(){

        var goodstar = $('#goodstar').val();
        var sellerstar = $('#sellerstar').val();
        var wuliustar = $('#wuliustar').val();
        var ordersn1 = $('#ordersn1').val();
        $.ajax({
            type:'get',
            url: 'index.php?user-company-orders-ajaxpostcomment&ordersn='+ordersn1+'&goodstar='+goodstar+'&sellerstar='+sellerstar+'&wuliustar='+wuliustar,
            dataType:'JSON',
            //async:true,
            success:function(res){
                if(res.statusCode == 200){
                    $("#myModal").modal('hide');
                    window.location.href = 'index.php?user-company-orders';
                    return true;
                }else{
                    alert('失败了');
                }
            },
            error: function(e){
                console.log(e);
            }
        })
    })



    $(function() {
        $('.submenu:eq(3)').delay(400).slideDown(700);
        $('.submenu:eq(3) li:eq(1)').addClass("active");
    });



    $(function() {
        $("#stardiv0").find(".starul>li").mouseenter(function() {
            if($(this).hasClass("star-gray")){
                $(this).removeClass("star-gray").addClass("star-orange");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
            }else if($(this).hasClass("star-orange")){
                $(this).removeClass("star-orange").addClass("star-gray");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
            }
        });
        $("#stardiv0 ul.starul").mouseleave(function () {
            var orangeNum = 0;
            $(this).children().each(function (index,item) {
                if($(item).hasClass("star-orange")){
                    orangeNum++;
                }
            })
            $("#goodstar").val(orangeNum);
        });

        var orderid = '';

        $(".closes").on("click",function(){
            $(this).parent().parent().hide();

        })

        $("#btns").on("click",function(){
            if($("#b_name").val()==""){
                alert("请输入信息");
            }else{

                var  name= $('#b_name').val() ;
                var  content= $('#c_desc').val();
                $(this).parent().parent().hide();
                $.ajax({
                    type:'get',
                    url: 'index.php?user-company-orders-ordercomplaint',
                    data: {
                        name: name,
                        content: content,
                        ordersn:orderid
                    },
                    dataType:'JSON',
                    success:function(res){
                        if(res.statusCode == 200){
                            alert("提交成功");
                            $(".fuct").unbind("click")
                            $(".fuct").attr('disabled',"true");
                            return;
//                                location.href="index.php?user-company-orders";

                        }else{
                            alert(res.message);
                            return false;
                        }
                    },
                    error: function(e){
                        console.log(e);
                    }
                })
            }


        })


        $(".Complaint").on("click",function(){
            $(".model").show();
            orderid = $(this).attr('value');
        })





        $("#stardiv1").find(".starul>li").mouseenter(function() {
            if($(this).hasClass("star-gray")){
                $(this).removeClass("star-gray").addClass("star-orange");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
            }else if($(this).hasClass("star-orange")){
                $(this).removeClass("star-orange").addClass("star-gray");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
            }
        });
        $("#stardiv1 ul.starul").mouseleave(function () {
            var orangeNum = 0;
            $(this).children().each(function (index,item) {
                if($(item).hasClass("star-orange")){
                    orangeNum++;
                }
            })
            $("#sellerstar").val(orangeNum);
        });


        $("#stardiv2").find(".starul>li").mouseenter(function() {
            if($(this).hasClass("star-gray")){
                $(this).removeClass("star-gray").addClass("star-orange");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
            }else if($(this).hasClass("star-orange")){
                $(this).removeClass("star-orange").addClass("star-gray");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
            }
        });
        $("#stardiv2 ul.starul").mouseleave(function () {
            var orangeNum = 0;
            $(this).children().each(function (index,item) {
                if($(item).hasClass("star-orange")){
                    orangeNum++;
                }
            })
            $("#wuliustar").val(orangeNum);
        });
    })


    function doSearch()
    {
        var orderstatus = $("#keyword").val();
        var url = 'index.php?user-company-orders&page={x2;$page}';
        if(orderstatus != ''){
            url += '&search[orderstatus]='+orderstatus;
        }
        window.location.href = url;
    }

    //添加
    $("#logistics_btns").on("click",function(){
        if($(this).html()=="修改"){
            $(".divc").show();
            $(".divcs").hide();
            $(this).html("保存");
        }else{
            if($("#logistics_names").val()=="" && $("#logistics_nums").val()=="") {
                alert("请输入完整信息");
            }else{
                $(this).html("修改");
                $(".divc").hide();
                $(".divcs").show();
                var  logistics_names=$('#logistics_names').val();
                var  logistics_nums=$('#logistics_nums').val();
                var  ordersn=$(this).attr('value');
                $.ajax({
                    type:'get',
                    url: 'index.php?user-company-orders-invoices&sn='+ordersn+'&logistics_names='+logistics_names +'&logistics_nums='+logistics_nums,
                    dataType:'JSON',
                    //async:true,
                    success:function(res){
                        if(res.statusCode == 200){

                            $("#aaaa").html(logistics_names);
                            $("#bbbb").html(logistics_nums);
                            //window.location.href = 'index.php?user-company-orders-mysale';
                            return true;
                        }else{
                            alert('失败了');
                        }
                    },
                    error: function(e){
                        console.log(e);
                    }
                })
            }
        }
    })




</script>
</html>




