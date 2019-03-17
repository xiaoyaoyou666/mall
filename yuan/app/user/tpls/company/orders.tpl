{x2;include:header2}

<body>

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


#detailOrderDialog .modal-header{
    border-bottom: 0 !important;
    padding: 0 15px 15px !important;
}
#detailOrderDialog .modal-footer {
    text-align: center;
    border-top: 0 !important;
    padding: 0 15px 15px !important;
}
#detailOrderDialog .modal-body{
    padding: 5px 15px !important;
}
.modalCenter{
    position:fixed;
    top:50%;
    left:50%;
    height: 500px;
}
.star-orange{
    color: orange;
}
.star-gray{
    color: #ccc;
}
/*.pagination > li > a.current {*/
    /*color: #009944!important;*/
/*}*/
/*.pagination > li > a, .pagination > li > span {*/
    /*position: relative;*/
    /*float: left;*/
    /*padding: 6px 12px;*/
    /*margin-left: -1px;*/
    /*line-height: 1.42857143;*/
    /*color: #323232;*/
    /*text-decoration: none;*/
    /*background-color: #fff;*/
    /*border: 1px solid #ddd;*/
    /*text-align: center;*/
    /*text-indent:0rem;*/
/*}*/
.conditions>tbody>tr>td {
    padding: 5px 20px !important;
}
.model{
		position: fixed;
		 left: 0px;
		 top: 0px; width: 100%;
		 height: 100%;
		 background-color: rgba(0,0,0,0.7);
		 z-index: 1003;
    display: none;
	}
	.closes:hover{
		color: green;
		cursor: pointer;
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
        text-align: center;
        /*border:none;*/
    }

    #detailOrderDialog .modal-header {
        border-bottom: 0 !important;
        padding: 0 15px 15px !important;
    }

    #detailOrderDialog .modal-footer {
        text-align: center;
        border-top: 0 !important;
        padding: 0 15px 15px !important;
    }

    #detailOrderDialog .modal-body {
        padding: 5px 15px !important;
    }

    .modalCenter {
        position: fixed;
        top: 50%;
        left: 50%;
        height: 500px;
    }

    .star-orange {
        color: orange;
    }

    .star-gray {
        color: #ccc;
    }
    .pagination{
        bottom: -10px;
    }

    /*.pagination > li > a.current {*/
        /*color: #009944 !important;*/
    /*}*/

    /*.pagination > li > a, .pagination > li > span {*/
        /*position: relative;*/
        /*float: left;*/
        /*padding: 6px 12px;*/
        /*margin-left: -1px;*/
        /*line-height: 1.42857143;*/
        /*color: #323232;*/
        /*text-decoration: none;*/
        /*background-color: #fff;*/
        /*border: 1px solid #ddd;*/
        /*text-align: center;*/
        /*text-indent: 0rem;*/
    /*}*/

    .conditions > tbody > tr > td {
        padding: 5px 20px !important;
    }

    .model {
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        z-index: 1003;
        display: none;
    }

    .models {
        position: absolute;
        left: 0px;
        top: 0px;
        right: 0;
        bottom: 0;
        margin: auto;
        width: 494px;
        height: 326px;
        background: inherit;
        background-color: #fff;
        border: none;
    }

    .closes:hover {
        color: green;
        cursor: pointer;
    }


</style>
{x2;include:nav}

<div class="zmm-zx-centent" id="datacontent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company-ordersbuy">我的订单</a> > <a>采购管理</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right purchase-orders orders-table">
                <!--公司简介-->
                <div>


                    <!--我的模块开始-->
                    <div class="zmm_panel panel-default">
                        <!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
                        <div class="zmm-qydt-title zmm-qydt-shsj1">

                            <p><em class="title-triangle"></em>我的采购订单</p>
                            <a href="index.php?user-company-ordersbuy&type=2" class="yellow-text pull-right right-tab">本月订单</a>
                            <a href="index.php?user-company-ordersbuy&type=1" class="yellow-text pull-right right-tab">上月订单</a>

                        </div>

                        <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                            <div class="row">
                                <!--订单状态tab-->
                                <ul class="order-status col-md-8">
                                    <li id="all" class="active">
                                        <a href="index.php?user-company-ordersbuy">全部</a>
                                    </li>
                                    <li id="seller-confirm">
                                        <a href="index.php?user-company-ordersbuy&orderstatus=1">
                                            待卖家确认{x2;if:$orderstatus_1}<span class="total">{x2;$orderstatus_1}</span>{x2;endif}</a>
                                    </li>

                                    <li id="pending-delivery">
                                        <a href="index.php?user-company-ordersbuy&orderstatus=2">待发货{x2;if:$orderstatus_2}<span class="total">{x2;$orderstatus_2}</span>{x2;endif}</a></li>
                                    <li id="received-good">
                                        <a href="index.php?user-company-ordersbuy&orderstatus=3">待收货{x2;if:$orderstatus_3}<span class="total">{x2;$orderstatus_3}</span>{x2;endif}</a></li>
                                    <li id="completed-order">
                                        <a href="index.php?user-company-ordersbuy&orderstatus=4">已完成{x2;if:$orderstatus_4}<span class="total">{x2;$orderstatus_4}</span>{x2;endif}</a></li>
                                    <li id="refundable-order">
                                        <a href="index.php?user-company-ordersbuy&orderstatus=5">退换货{x2;if:$orderstatus_5}<span class="total">{x2;$orderstatus_5}</span>{x2;endif}</a></li>
                                    <li id="canceled-order">
                                        <a href="index.php?user-company-ordersbuy&orderstatus=99">已取消{x2;if:$orderstatus_99}<span class="total">{x2;$orderstatus_99}</span>{x2;endif}</a></li>
                                </ul>

                                <div class="search-bar col-md-4">
                                    <div>
                                        <div class="input-group">
                                            <input type="text" class="form-control search-content" placeholder="输入订单号"
                                                   id="searchsn" value="{x2;$ordersn}">
                                            <span class="input-group-btn">
                                    <button class="btn btn-default btn-primary" disabled="disabled" type="button"
                                            onclick="doSearch()">订单搜索</button>
                                  </span>
                                        </div><!-- /input-group -->
                                    </div><!-- /.col-lg-6 -->
                                </div>
                            </div>

                            <form action="index.php?user-company-ordersbuy-batremove" method="post">
                                <fieldset>

                                    <table class="table table-responsive table-hover table-bordered">
                                        <thead>
                                        <tr class="info">
                                            <th>商品</th>
                                            <th>订单号</th>
                                            <!--<th>商品</th>-->
                                            <th>收货人</th>
                                            <th>金额</th>
                                            <th>下单时间</th>
                                            <th>状态</th>
                                            <th width="250px">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        {x2;tree:$orders['data'],order,oid}
                                        <tr class="order-list-table">
                                            <!--<td class="cell-align-center">{x2;v:oid}</td>-->
                                            <td class="cell-align-center"><span class="glyphicon glyphicon-triangle-bottom yellow-text"></span></td>

                                            <td>{x2;v:order['ordersn']}</td>
                                            <!--<td>-->
                                                <!--<a class="btn-group" onclick="catDetail({x2;v:oid},'{x2;v:order['ordersn']}')">查看商品详情</a>-->
                                                <!--<div class="dropdown">-->
                                                    <!--<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"-->
                                                            <!--aria-haspopup="true" aria-expanded="true">-->
                                                        <!--{x2;v:order['orderitems'][0]['goodstitle']}等{x2;v:order['ordertitle']}商品-->
                                                        <!--<span class="glyphicon glyphicon-triangle-bottom yellow-text"></span>-->
                                                    <!--</button>-->
                                                    <!--<div class="dropdown-menu">-->
                                                        <!--<div class="top-angle">-->
                                                            <!--<span></span>-->
                                                        <!--</div>-->
                                                        <!--<table class="table product-list">-->
                                                            <!--<thead>-->
                                                            <!--<tr>-->
                                                                <!--<th>商品名称</th>-->
                                                                <!--<th>价格</th>-->
                                                                <!--<th>数量</th>-->
                                                            <!--</tr>-->
                                                            <!--</thead>-->
                                                            <!--<tbody>-->
                                                            <!--{x2;tree:v:order['orderitems'],order1,oid1}-->
                                                            <!--<tr class="product-name">-->
                                                                <!--<td><a class="yellow-text" href=""-->
                                                                       <!--title="{x2;v:order1['goodstitle']}">{x2;v:order1['goodstitle']}</a>-->
                                                                <!--</td>-->
                                                                <!--<td>{x2;v:order1['itemprice']}</td>-->
                                                                <!--<td>{x2;v:order1['number']}</td>-->
                                                            <!--</tr>-->
                                                            <!--{x2;endtree}-->
                                                            <!--&lt;!&ndash;  <tr>-->
                                                                <!--<td><a class="yellow-text" href="">风机备件</a></td>-->
                                                                <!--<td>124</td>-->
                                                                <!--<td>122</td>-->
                                                            <!--</tr> &ndash;&gt;-->
                                                            <!--</tbody>-->
                                                        <!--</table>-->
                                                    <!--</div>-->
                                                <!--</div>-->
                                            <!--</td>-->

                                            <td>{x2;v:order['orderaddress']['receiver']}</td>
                                            <td>￥{x2;v:order['orderprice']}</td>
                                            <td class="cell-align-center">{x2;date:v:order['ordercreatetime'],'Y-m-d H:i:s'}</td>
                                            <td>{x2;$orderstatus[v:order['orderstatus']]}</td>
                                            <td width="120px" class="cell-align-center handler">
                                                <a class="btn-group yellow-text"
                                                   href="index.php?user-company-ordersbuy-orderBuydetail&ordertype=1&sn={x2;v:order['ordersn']}">详情</a>

                                                {x2;if:v:order['orderstatus']=='4' || v:order['orderstatus']=='99'}
                                                <a class="btn-group yellow-text"
                                                   href="index.php?item-app-order3&ordertype=1&sn={x2;v:order['ordersn']}">再次购买</a>
                                                {x2;endif}


                                                {x2;if:v:order['orderstatus']=='1' || v:order['orderstatus']=='2'}
                                                <!-- <a class="btn yellow-text confirm"   onclick="cacelOrder('{x2;v:order[ordersn]}')">取消</a> -->
                                                <a class="btn yellow-text"
                                                   onclick="cacelOrder('{x2;v:order[ordersn]}')">取消</a>
                                                {x2;endif}


                                                {x2;if:v:order['orderstatus']=='3'}
                                            <!--
                                            <a id="{x2;v:order['ordersn']}" class="yellow-text shouhuo" href="javascript:;">收货</a>
                                            -->
                                                <a href="index.php?user-company-ordersbuy-ordercollect&ordersn={x2;v:order['ordersn']}&sellerId={x2;v:order['sellerId']}" data-sellerId="" class="btn yellow-text confirm" msg="确认已收到货？" id="shouhuo">收货</a>
                                            {x2;endif}
                                            {x2;if:v:order['orderstatus']=='4'}
                                                {x2;if:v:order['buy_comment']}
                                                <a class="btn-group yellow-text">已评论</a>
                                                {x2;else}
                                                <a class="btn-group yellow-text"
                                                   onclick="catComment('{x2;v:order[ordersn]}')">评价</a>
                                                {x2;endif}

                                                <a class="btn-group yellow-text Complaint fuct" value="{x2;v:order[ordersn]}">投诉</a>
                                                {x2;endif}

                                                <!--{x2;if:v:order['orderstatus']=='99' || v:order['orderstatus']=='4'}-->
                                                <!--<a href="index.php?user-company-ordersbuy-orderDel&ordertype=1&sn={x2;v:order['ordersn']}"-->
                                                   <!--class="btn-group yellow-text confirm">删除</a>-->
                                                <!--{x2;endif}-->
                                            </td>

                                        </tr>
                                        <!--每个订单list-->
                                        <tr class="order-product-list">
                                            <td colspan="8" class="product-list-td">
                                                <table class="table product-list">
                                                    <thead>
                                                    <tr>
                                                        <th>商品名称</th>
                                                        <th>规格</th> <!--todo-->
                                                        <th>单价</th>
                                                        <th>数量</th>
                                                        <th>小计</th><!--todo-->
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <!-- sap订单显示 -->
                                                    {x2;if:v:order['order_type']==0}    
                                                    {x2;eval: v:price = 0}
                                                    {x2;tree:v:order['orderitems'],order1,oid1}
                                                    <tr class="product-name">
                                                        <td>
                                                            <a class="yellow-text" target="_blank" href="index.php?item-app-item&goodsid={x2;v:order1['goodsid']}" title="{x2;v:order1['goodstitle']}">{x2;v:order1['goodstitle']}</a>
                                                        </td>
                                                        <td>
                                                            {x2;tree:$mfields[$categories[v:order1['goodscatid']]['catmoduleid']],field,fid}
                                                            {x2;if:v:field['fieldsystem']}
                                                            {x2;v:field['fieldtitle']} : {x2;v:order1[v:field['field']]}<br />
                                                            {x2;endif}
                                                            {x2;endtree}
                                                        </td>
                                                        <td>{x2;v:order1['itemprice']}</td>
                                                        <td>{x2;v:order1['number']}</td>
                                                        <td>{x2;eval: echo v:price = v:order1['itemprice']*v:order1['number']}</td>
                                                    </tr>
                                                    {x2;endtree}
                                                    {x2;endif}
                                                    <!-- btb订单显示 -->
                                                    {x2;if:v:order['order_type']==1}
                                                    {x2;tree:v:order['orderitems'],order1,oid1} 
                                                    <tr class="product-name">
                                                        <td><a class="yellow-text" target="_blank" href="index.php?item-app-item&goodsid={x2;v:order1['goodsid']}" title="{x2;v:order1['goodstitle']}">{x2;v:order1['goodstitle']}</a></td>
                                                        <td>
                                                            {x2;tree:$mfields[$categories[v:order1['goodscatid']]['catmoduleid']],field,fid}
                                                            {x2;if:v:field['fieldsystem']}
                                                            {x2;v:field['fieldtitle']} : {x2;v:order1[v:field['field']]}<br />
                                                            {x2;endif}
                                                            {x2;endtree}
                                                        </td>
                                                        <td>{x2;v:order1['itemprice']}</td>
                                                        <td>{x2;v:order1['number']}</td>
                                                        <td>{x2;eval: echo v:price = v:order1['itemprice']*v:order1['number']}</td>
                                                    </tr>
                                                    {x2;endtree}
                                                    {x2;endif}    
                                                    <!-- 询价订单显示 -->
                                                    {x2;if:v:order['order_type']==3}
                                                         {x2;tree:v:order['orderitems'],order2,oid2}
                                                    <tr class="product-name">
                                                        <td><a class="yellow-text" target="_blank" href="" title="{x2;v:order1['goodstitle']}">{x2;v:order1['goodstitle']}</a></td>
                                                        <td>
                                                           询价订单无规格
                                                        </td>
                                                        <td>{x2;v:order2['itemprice']}</td>
                                                        <td>{x2;v:order2['number']}</td>
                                                        <td>{x2;eval: echo v:price = v:order2['itemprice']*v:order2['number']}</td>
                                                    </tr>
                                                    {x2;endtree}
                                                    {x2;endif}   
                                                    <!--  <tr>
                                                        <td><a class="yellow-text" href="">风机备件</a></td>
                                                        <td>124</td>
                                                        <td>122</td>
                                                    </tr> -->
                                                    </tbody>
                                                </table>
                                            </td>

                                        </tr>
                                        {x2;endtree}
                                        </tbody>
                                    </table>
                                    <div class="model complain-modal" id="asd">
                                        <div class="models">
                                            <div class="complain-modal-head">
                                                <span class="complain-modal-title">
                                                    投诉
                                                </span>
                                                <p class="closes" style="float: right;clear: both;font-size: 28px;color: #a59f9f">×</p>
                                            </div>
                                            <div class="complain-modal-body">
                                                <input type="hidden" value="" id="aaa">
                                                <p style="text-align: left;">
                                                    <span style="margin-left:22px;margin-top:20px;">
                                                        <em style="color: red;padding-right: 4px">*</em>
                                                        投诉问题：
                                                    </span>
                                                    <input type="text" id='b_name' na="width:300px;border-radius:4px"/>
                                                </p>
                                                <p style="height: 148px;margin-top:10px;">
                                                    <span style="float: left;display: inline-block;margin-left:30px;">&nbsp;问题描述：&nbsp;&nbsp;</span>
                                                    <textarea style="width: 300px;height: 122px;float: left;"
                                                              id="c_desc"></textarea>
                                                </p>
                                                <input id="btns btn btn-primary" type="button" value="提交"
                                                       style="margin: 0 auto;display: block;width: 140px;text-align: center;background-color: #009944;color: #fff;border-radius: 4px;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade modalCenter" id="detailOrderDialog" tabindex="-1"
                                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-hidden="true">
                                                        &times;
                                                    </button>
                                                    <div class="xunjia-title text-center" style="text-indent:0;"><h4>
                                                        <span id="order_id"></span>订单详情</h4></div>
                                                </div>
                                                <div class="modal-body text-center">
                                                    <table class="table table-bordered table-responsive">
                                                        <thead>
                                                        <tr>
                                                            <td>序号</td>
                                                            <td>商品缩略图</td>
                                                            <td>商品名称</td>
                                                            <td>数量</td>
                                                            <td>商品金额</td>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="goods_text">
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn-green r20" data-dismiss="modal"
                                                            style="border: none;"> 确&nbsp;&nbsp;定
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <ul class="pagination pull-right">
                                        {x2;$orders['pages']}
                                    </ul>
                                </fieldset>
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

<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div class="text-center" style="font-size:18px;">评价</div>
            </div>
            <div class="modal-body">
                <div class="pingjia">
                    <div class="pingjia-tit" id="goods_text1">

                    </div>

                    <div id="stardiv0" class="popstar">
                        <p style="float:left;margin-left:140px;font-size:16px;">商品与描述相符：</p>
                        <ul class="fa-ul starul">
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                        </ul>
                        <input id="goodstar" type="hidden" name="spms" value="0"/>
                    </div>
                    <div id="stardiv1" class="popstar">
                        <div style="float:left;margin-left:140px;font-size:16px;">卖家的服务态度：</div>
                        <ul class="fa-ul starul">
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                        </ul>
                        <input id="sellerstar" type="hidden" name="mjfw" value="0"/>
                    </div>
                    <div id="stardiv2" class="popstar">
                        <div style="float:left;margin-left:140px;font-size:16px;">物流的服务态度：</div>
                        <ul class="fa-ul starul">
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                            <li class="fa fa-star fa-2x star-gray"></li>
                        </ul>
                        <input id="wuliustar" type="hidden" name="wlfw" value="0"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="text-align: center !important;">
                <button type="button" class="btn btn-default r20 btn-primary" id="tocomment" > 确&nbsp;&nbsp;定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal"> 取&nbsp;&nbsp;消</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade"  id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">确认收货</h4>
            </div>
            <div class="modal-body" style="height:200px;">

                <select class="form-control" id="stock">
                </select>
            </div>

            <div class="modal-footer">
                <button type="button" class="layui-btn  layui-btn-sm" data-dismiss="modal">关闭</button>
                <button type="button" class="layui-btn  layui-btn-sm" id="comtStock">提交</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

<!--取消订单-->
<div class="modal fade" tabindex="-1" role="dialog" id="cancelOrderModal" aria-labelledby="cancelOrderModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">取消订单</h4>
            </div>
            <div id="cancelOrderSn"></div>
            <div class="modal-body">
                <textarea row="10" placeholder="请输入取消订单原因" class="cancelOrderReason"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">暂不取消</button>
                <button type="button" class="btn btn-primary" id="cancelButton">取消订单</button>
            </div>

        </div>
    </div>
</div>
<!-- /.modal -->


<!--退换货-->
<div class="modal fade" tabindex="-1" role="dialog" id="exchangeOrderModal" aria-labelledby="exchangeOrderModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">退换货</h4>
            </div>
            <div class="modal-body">
                <div class="process-status-list">
                    <ul>

                        <li class="process-status-item active">
                            <span class="dot"></span>
                            <div class="status-item-info">
                                <div class="title">提交申请</div>
                                <div class="update-tiem">2018-07-18 13:20</div>
                            </div>
                        </li>
                        <li class="process-status-item">
                            <span class="dot"></span>
                            <div class="status-item-info">
                                <div class="title">提交申请</div>
                                <div class="update-tiem">2018-07-18 13:20</div>
                            </div>
                        </li>
                        <li class="process-status-item">
                            <span class="dot"></span>
                            <div class="status-item-info">
                                <div class="title">提交申请</div>
                                <div class="update-tiem">2018-07-18 13:20</div>
                            </div>
                        </li>
                        <li class="process-status-item">
                            <span class="dot"></span>
                            <div class="status-item-info">
                                <div class="title">提交申请</div>
                                <div class="update-tiem">2018-07-18 13:20:56</div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="custorm-service-info">
                    <h5 class="head">售后信息</h5>
                    <!--提交申请-->
                    <div class="custorm-service-content commit-application invisible">
                        <form action="">
                            <div class="row form-group">
                                <div class="col-md-2"><span class="danger-text">*</span>退货原因</div>
                            </div>
                            <div class="row form-group">
                                <div class="col-md-2">状态</div>
                                <div class="col-md-7 return-reason">
                                    <label>
                                        <input type="checkbox"> 实发商品与订单不符
                                    </label>
                                    <label>
                                        <input type="checkbox"> 商品不适用
                                    </label>
                                    <label>
                                        <input type="checkbox"> 商品运输过程中破损
                                    </label>
                                    <label>
                                        <input type="checkbox"> 其他
                                    </label>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-md-2"><span class="danger-text">*</span>退换商品</div>
                            </div>
                            <div class="row form-group">
                                <div class="col-md-2"></div>
                                <div class="col-md-10">
                                    <div class="row">
                                        <label class="col-md-5">
                                            <input type="checkbox">商品1
                                        </label>
                                        <div class="col-md-7 goods-sku">
                                            <span class="name">退货数量</span>
                                            <div class="counter-box">
                                                <span class="counter-btn minus">-</span>
                                                <input type="text">
                                                <span class="counter-btn add">+</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-md-5">
                                            <input type="checkbox">商品1
                                        </label>
                                        <div class="col-md-7 goods-sku">
                                            <span class="name">退货数量</span>
                                            <div class="counter-box">
                                                <span class="counter-btn minus">-</span>
                                                <input type="text">
                                                <span class="counter-btn add">+</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-md-5">
                                            <input type="checkbox">商品1
                                        </label>
                                        <div class="col-md-7 goods-sku">
                                            <span class="name">退货数量</span>
                                            <div class="counter-box">
                                                <span class="counter-btn minus">-</span>
                                                <input type="text">
                                                <span class="counter-btn add">+</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-md-2"><span class="danger-text">*</span>描述</div>
                                <div class="col-md-9 form-group">
                                    <textarea name="" id="" rows="6" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-md-2">文件/图片</div>
                                <div class="col-md-10">
                                    <button class="btn btn-reverse">上传</button>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-md-2"></div>
                                <div class="col-md-10 next-step-btn">
                                    <button type="submit" class="btn btn-primary">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!--商家确认-->
                    <div class="custorm-service-content sales-confirm invisible">
                        <form action="">
                            <div class="row form-group">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="pull-left"><span class="danger-text">*</span>退货原因</div>
                                        <span class="pull-left">实发商品与实际不符；商品运输过程中破损</span>
                                    </div>
                                    <div class="row">
                                        <div><span class="danger-text">*</span>描述</div>
                                        <span>商品运输过程中破损</span>
                                    </div>
                                    <div class="row">
                                        <div><span class="danger-text">*</span>文件/图片</div>
                                        <span>baidu.com</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">商品1商品1商品1商品1商品1商品1商品1商品1商品1商品1商品1</div>
                                        <div class="col-md-6">退货数量：3</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">商品2</div>
                                        <div class="col-md-6">退货数量：3</div>
                                    </div>
                                </div>
                            </div>
                            <h5 class="head">物流信息</h5>
                            <div class="row form-group">
                                <div class="col-md-6">
                                    <label for="inputPassword" class="col-sm-4 control-label">物流名称</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="inputPassword"
                                               placeholder="Password">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="inputNumber" class="col-sm-4 control-label">物流单号</label>
                                    <div class="col-sm-8">
                                        <input type="password" class="form-control" id="inputNumber"
                                               placeholder="Password">
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group next-step-btn">
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>
                        </form>
                    </div>
                    <!--商家收货-->
                    <div class="custorm-service-content sales-received-goods visible">
                        <form action="">
                            <div class="row form-group">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="pull-left"><span class="danger-text">*</span>退货原因</div>
                                        <span class="pull-left">实发商品与实际不符；商品运输过程中破损</span>
                                    </div>
                                    <div class="row">
                                        <div><span class="danger-text">*</span>描述</div>
                                        <span>商品运输过程中破损</span>
                                    </div>
                                    <div class="row">
                                        <div><span class="danger-text">*</span>文件/图片</div>
                                        <span>baidu.com</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">商品1商品1商品1商品1商品1商品1商品1商品1商品1商品1商品1</div>
                                        <div class="col-md-6">退货数量：3</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">商品2</div>
                                        <div class="col-md-6">退货数量：3</div>
                                    </div>
                                </div>
                            </div>
                            <h5 class="head">物流信息</h5>
                            <div class="row form-group">
                                <div class="col-md-6">
                                    <label for="inputPassword" class="col-sm-4 control-label">物流名称</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="" value="德邦快递" disabled="disabled" >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="inputNumber" class="col-sm-4 control-label">物流单号</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="" value="2347823478239" disabled="disabled" >
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group next-step-btn">
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>
                        </form>
                    </div>
                    <!--完成-->
                    <div class="custorm-service-content progress-completed invisible">
                        <form action="">
                            <div class="row form-group">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="pull-left"><span class="danger-text">*</span>退货原因</div>
                                        <span class="pull-left">实发商品与实际不符；商品运输过程中破损</span>
                                    </div>
                                    <div class="row">
                                        <div><span class="danger-text">*</span>描述</div>
                                        <span>商品运输过程中破损</span>
                                    </div>
                                    <div class="row">
                                        <div><span class="danger-text">*</span>文件/图片</div>
                                        <span>baidu.com</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">商品1商品1商品1商品1商品1商品1商品1商品1商品1商品1商品1</div>
                                        <div class="col-md-6">退货数量：3</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">商品2</div>
                                        <div class="col-md-6">退货数量：3</div>
                                    </div>
                                </div>
                            </div>
                            <h5 class="head">物流信息</h5>
                            <div class="row form-group">
                                <div class="col-md-6">
                                    <label for="inputPassword" class="col-sm-4 control-label">物流名称</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="" disabled="disabled">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="inputNumber" class="col-sm-4 control-label">物流单号</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group next-step-btn">
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- /.modal -->

{x2;include:footer2}
<script>



    function catDetail(id, ordid) {
        $("#order_id").text('序号' + id);

        $.ajax({
            type: 'get',
            url: 'index.php?user-company-ordersbuy-ajaxgetorder&ordersn=' + ordid,
            dataType: 'JSON',
            async: true,
            success: function (res) {
                if (res.statusCode == 201) {
                    $("#goods_text").html(res.data);
                } else {
                    var message = res.message;
                    return false;
                }
            },
            error: function (e) {
                console.log(e);
            }
        })


        $("#detailOrderDialog").modal();
    }

    //-----------获取评价的商品信息-----------
    function catComment(ordid) {
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-ordersbuy-ajaxgetcomment&ordersn=' + ordid,
            dataType: 'JSON',
            async: true,
            success: function (res) {
                if (res.statusCode == 201) {
                    $("#goods_text1").html(res.data);
                } else {
                    var message = res.message;
                    return false;
                }
            },
            error: function (e) {
                console.log(e);
            }
        })

        $("#myModal").modal();
    }


    //---提交评价----
    $('#tocomment').on('click', function () {

        var goodstar = $('#goodstar').val();
        var sellerstar = $('#sellerstar').val();
        var wuliustar = $('#wuliustar').val();
        var ordersn1 = $('#ordersn1').val();
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-ordersbuy-ajaxpostcomment&ordersn=' + ordersn1 + '&goodstar=' + goodstar + '&sellerstar=' + sellerstar + '&wuliustar=' + wuliustar,
            dataType: 'JSON',
            //async:true,
            success: function (res) {
                if (res.statusCode == 200) {
                    //                      $("#myModal").modal('hide');
                    window.location.href = 'index.php?user-company-ordersbuy';
                    return true;
                } else {
                    alert('失败了');
                }
            },
            error: function (e) {
                console.log(e);
            }
        })
    })


    //------------取消订单弹出框-----------------------
    function cacelOrder(orderid) {
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-ordersbuy-ajaxcacelorder&ordersn=' + orderid,
            dataType: 'JSON',
            async: true,
            success: function (res) {
                if (res.statusCode == 201) {
                    $("#cancelOrderSn").html(res.data);
                } else {
                    var message = res.message;
                    return false;
                }
            },
            error: function (e) {
                console.log(e);
            }
        })
        $("#cancelOrderModal").modal();


    }


    $('#cancelButton').on('click', function () {
        var ordersn2 = $('#ordersn2').val();
        var cancelOrderReason = $('.cancelOrderReason').val();
        if (cancelOrderReason == '') {
            alert('请填写取消订单的原因');
            $("#cancelOrderModal").modal();
            return false;
        }

        $.ajax({
            type: 'get',
            url: 'index.php?user-company-ordersbuy-ordercancel&sn=' + ordersn2 + '&reason=' + cancelOrderReason,
            dataType: 'JSON',
            //async:true,
            success: function (res) {
                if (res.statusCode == 200) {
                    $("#cancelOrderModal").modal('hide');
                    window.location.href = 'index.php?user-company-ordersbuy';
                    return true;
                } else {
                    alert('失败了');
                }
            },
            error: function (e) {
                console.log(e);
            }
        })
    })


    $(function () {
        $('.submenu:eq(3)').delay(400).slideDown(700);
        $('.submenu:eq(3) li:eq(0)').addClass("active");
    });


    $(function () {
        $("#stardiv0").find(".starul>li").mouseenter(function () {
            if ($(this).hasClass("star-gray")) {
                $(this).removeClass("star-gray").addClass("star-orange");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
            } else if ($(this).hasClass("star-orange")) {
                $(this).removeClass("star-orange").addClass("star-gray");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
            }
        });
        $("#stardiv0 ul.starul").mouseleave(function () {
            var orangeNum = 0;
            $(this).children().each(function (index, item) {
                if ($(item).hasClass("star-orange")) {
                    orangeNum++;
                }
            })
            $("#goodstar").val(orangeNum);
        });

        var orderid = '';

        $(".closes").on("click", function () {
            $(this).parents('.complain-modal').hide();

        })

        $("#btns").on("click", function () {
            if ($("#b_name").val() == "") {
                alert("请输入信息");
            } else {

                var name = $('#b_name').val();
                var content = $('#c_desc').val();
                $(this).parent().parent().hide();
                $.ajax({
                    type: 'get',
                    url: 'index.php?user-company-ordersbuy-ordercomplaint',
                    data: {
                        name: name,
                        content: content,
                        ordersn: orderid
                    },
                    dataType: 'JSON',
                    success: function (res) {
                        if (res.statusCode == 200) {
                            alert("提交成功");
                            $(".fuct").unbind("click")
                            $(".fuct").attr('disabled', "true");
                            return;
                            //                                location.href="index.php?user-company-orders";

                        } else {
                            alert(res.message);
                            return false;
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                })
            }


        })


        $(".Complaint").on("click", function () {
            $(".model").show();
            orderid = $(this).attr('value');
        })


        $("#stardiv1").find(".starul>li").mouseenter(function () {
            if ($(this).hasClass("star-gray")) {
                $(this).removeClass("star-gray").addClass("star-orange");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
            } else if ($(this).hasClass("star-orange")) {
                $(this).removeClass("star-orange").addClass("star-gray");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
            }
        });
        $("#stardiv1 ul.starul").mouseleave(function () {
            var orangeNum = 0;
            $(this).children().each(function (index, item) {
                if ($(item).hasClass("star-orange")) {
                    orangeNum++;
                }
            })
            $("#sellerstar").val(orangeNum);
        });


        $("#stardiv2").find(".starul>li").mouseenter(function () {
            if ($(this).hasClass("star-gray")) {
                $(this).removeClass("star-gray").addClass("star-orange");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
            } else if ($(this).hasClass("star-orange")) {
                $(this).removeClass("star-orange").addClass("star-gray");
                $(this).nextAll().removeClass("star-orange").addClass("star-gray");
                $(this).prevAll().removeClass("star-gray").addClass("star-orange");
            }
        });
        $("#stardiv2 ul.starul").mouseleave(function () {
            var orangeNum = 0;
            $(this).children().each(function (index, item) {
                if ($(item).hasClass("star-orange")) {
                    orangeNum++;
                }
            })
            $("#wuliustar").val(orangeNum);
        });

        //点击收货按钮，渲染仓储地点数据
        var odn = '';   //要确认收货的订单id
        $(".shouhuo").on('click',function(){
            odn = $(this).attr('id');
            $("#myModal2").modal();
            if(odn != ''){
                $.ajax({
                    type: 'GET',
                    data: {ordersn:odn},
                    url: "index.php?item-app-ajax-getDbByOrder",
                    dataType: 'json',
                    success: function (res) {
                        if(res.statusCode == 200){
                            $('#stock').html(res.data);
                        }else{
                            var data = {result: false, message: res.message};
                            $.zoombox.show('ajax', data);
                        }
                    }
                })
            }
        });

        //确认收货，修改订单状态，调sap采购入库接口
        $("#comtStock").on('click',function(){
            var stockid = $('#stock').val();
            if(stockid == ''){
                var data = {result: false, message: '请选择仓储地点'};
                $.zoombox.show('ajax', data);
                return false;
            }
            if(odn != ''){
                $.ajax({
                    type: 'GET',
                    data: {ordersn:odn,stockid:stockid},
                    url: "index.php?user-company-ordersbuy-ordercollect",
                    dataType: 'json',
                    success: function (res) {
                        if(res.statusCode == 200){
                            var data = {result: false, message: res.message};
                            $.zoombox.show('ajaxOK', data);
                            window.location.reload();
                        }else{
                            var data = {result: false, message: res.message};
                            $.zoombox.show('ajax', data);
                        }
                    }
                })
            }
        });


    })


    function doSearch() {
        var ordersn = $("#searchsn").val();
        //alert(ordersn);
        var url = 'index.php?user-company-ordersbuy&page={x2;$page}';
        if (ordersn != '') {
            url += '&ordersn=' + ordersn;
        }
        window.location.href = url;
    }

</script>
<script src="app/core/styles/js/corporatePurchase.js"></script>
</body>

</html>




