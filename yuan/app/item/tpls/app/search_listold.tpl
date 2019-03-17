{x2;include:header}
<body>
{x2;include:nav}
<!--面包屑-->
<style type="text/css">
    .buycp_list li>a>img,.buycp_list li .gys img {
        margin-bottom:0px !important;
    }
    .jiage, .gys {
        overflow: hidden;
        margin-bottom: 2px;
        font-size: 12px;
    }
    ul.buycp_list .jiage p {
        margin-bottom: 0px !important;
    }
    .gray-color {
        color: #888;
    }
    .guige {
        color: #323232;
        line-height: 20px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width: 246px;
        margin-bottom: 10px;
    }
    :
    .gys {
        width: 246px;
        line-height: 20px;
    }
    :
    .gys div:first-child {
        width: 13%;
    }
    .gys div>img {
        width: 16px;
        height: 14px;
        margin-right:10px;
    }
    .gys div:last-child {
        width: 85%;
        overflow: hidden;
        text-overflow: ellipsis;
        display: block;
        white-space: nowrap;
    }
</style>
<div class="zmm-zx-centent bg_fff">
    <div class="container t20">
        <div class="cpbox" style="padding:10px 20px;">
            搜索结果
        </div>
        
        
        <ul class="buycp_list">
            {x2;tree:$goodslist['data'],good,gid}
            <li>
                <a href="index.php?item-app-item&goodsid={x2;v:good['goodsid']}">
                    <img src="{x2;v:good['goodsthumb']}">
                    <div class="jiage">
                        <div class="pull-left">
                            <p>价格：<span class="col_red">¥{x2;v:good['goodsminprice']}起</span></p>
                        </div>
                        <div class="pull-right"><span class="gray-color">{x2;v:good['goodspv']}人看过</span></div>
                    </div>
                    <div class="guige">{x2;v:good['company_name']}</div>
                    <div class="gys">
                        <div class="pull-left">
                            <img src="app/core/styles/images/market/sj-icon.png">
                        </div>
                        <div class="pull-left">{x2;v:good['goodstitle']}</div>
                    </div>
                </a>
            </li>



            {x2;endtree}
        </ul>
        <ul class="pagination pull-right">{x2;$goods['pages']}</ul>
    </div>
</div>
{x2;include:menu}
{x2;include:footer2}
</body>
</html>