<style type="text/css">
    .menu2{
        /*min-height:430px;*/
        background-color: #fff;

    }
    .menu2 .menu-type2{
        width:240px;
        min-height:1px;
        font-size:14px;
        position:absolute;
    }
    .menu2 .menu-type2>ul{
        height:430px;
        background-color:rgba(0,0,0,0.6);
    }
    .menu2 .menu-type2>ul>li{
        background-color:rgba(0,0,0,0.3);
        border-bottom:1px solid #aaa;
        height:50px;
        line-height:50px;
        color:#ffffff;
        padding-left: 20px;
    }
    .menu2 .menu-type2>ul>li>a{
        margin-right:10px;
    }
    .menu2 .menu-type2>ul>li>a:last-child{
        font-size:13px;
    }
    .menu2 .menu-type2>ul>li>a,.menu2 .menu-type2>ul>li>a:visited{
        color:#ffffff;
        text-decoration: none !important;
    }
    .menu2 .menu-type2>ul>li>a:hover{
        color:#fff;
    }
    .menu2 .menu-type2>ul>li.active{
        background-color:rgba(0,0,0,0.6);
        color:#fff;
    }
    .menu2 .menu-type2>ul>li.active>a,.menu2 .menu-type2>ul>li.active>a:visited{
        color:#fff;
        text-decoration: none !important;
    }
    .menu2 .menu-type2>ul>li.active>a:hover{
        color:#fff;
    }
    .menu2 .menu-type2>ul>li img{
        width:24px;
        height:24px;
        margin-right:15px;
    }
    .menu-type2 .popmenu2{
        position:absolute;
        /*left:0;
        top:0;*/
        width:960px;
        height:430px;
        background-color: #fcfcfc;
        z-index:20;
        padding: 20px 40px 10px 40px;
        color:#888;
        font-size:13px;
    }

    .popmenu2 div.twomenu>span{
        display: block;
        float:left;
        width:15%;
    }
    .popmenu2 div.twomenu>span>a,.popmenu2 div.twomenu>span>a:visited{
        color:#888;
        text-decoration: none !important;
    }
    .popmenu2 div.twomenu>span>a:hover{
        color:#009944;
    }

    .popmenu2 div.twomenu>div{
        float:left;
        border-bottom:1px solid #ccc;
        padding-bottom:5px;
        padding-left:6px;
        margin-bottom:5px;
        width:75%;
    }
    .popmenu2 div.twomenu>div>span{
        margin-right:16px;
    }
    .popmenu2 div.twomenu>div>span>a,.popmenu2 div.twomenu>div>span>a:visited{
        color:#888;
        text-decoration: none !important;
    }
    .popmenu2 div.twomenu>div>span>a:hover{
        color:#009944;
    }
</style>
<div class="menu2">
    <div id="menu-div2" class="menu-type2 hide">
        <ul id="menu-type-ul2">
            {x2;tree:$cate,cd,cid}
            <li class="text-left">
                {x2;if:v:cid == '1'}
                <img src="app/core/styles/images/market/biaopin-icon-white.png" alt="" />
                <img src="app/core/styles/images/market/biaopin-icon-green.png" alt="" class="hide"/>
                {x2;elseif:v:cid == '2'}
                <img src="app/core/styles/images/market/shebei-icon-white.png" alt="" />
                <img src="app/core/styles/images/market/shebei-icon-green.png" alt="" class="hide"/>
                {x2;elseif:v:cid == '3'}
                <img src="app/core/styles/images/market/menu2.png" alt=""/>
                <img src="app/core/styles/images/market/cailiao-icon-green.png" alt="" class="hide"/>
                {x2;elseif:v:cid == '4'}
                <img src="app/core/styles/images/market/shigong-icon-white.png" alt=""/>
                <img src="app/core/styles/images/market/shigong-icon-green.png" alt="" class="hide"/>
                {x2;else}
                <img src="app/core/styles/images/market/menu3.png" alt=""/>
                <img src="app/core/styles/images/market/fuwu-icon-green.png" alt="" class="hide"/>
                {x2;endif}
                <a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd['catid']}">{x2;v:cd['catname']}</a>
                <a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd['catid']}"></a>
            </li>
            {x2;endtree}
        </ul>
        <div id="popdiv2" class="popmenu2 hide">
            <div id="divv0">
                {x2;tree:$cate[0]['subcat'],cd0,cid0}
                <div class="twomenu clearfix">
                    <span><a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd0['catid']}">{x2;v:cd0['catname']} >> </a></span>
                    <div>
                        {x2;tree:v:cd0['subcat'],cd01,cid01}
                        <span><a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd01['catid']}">{x2;v:cd01['catname']}</a></span>
                        {x2;endtree}
                    </div>
                </div>
                {x2;endtree}
            </div>
            <div id="divv1">
                {x2;tree:$cate[1]['subcat'],cd1,cid1}
                <div class="twomenu clearfix">
                    <span><a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd1['catid']}">{x2;v:cd1['catname']} >> </a></span>
                    <div>
                        {x2;tree:v:cd1['subcat'],cd11,cid11}
                        <span><a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd11['catid']}">{x2;v:cd11['catname']}</a></span>
                        {x2;endtree}
                    </div>
                </div>
                {x2;endtree}
            </div>
            <div id="divv2">
                {x2;tree:$cate[2]['subcat'],cd2,cid2}
                <div class="twomenu clearfix">
                    <span><a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd2['catid']}">{x2;v:cd2['catname']} >> </a></span>
                    {x2;if:v:cd2['subcat']}
                    <div>
                        {x2;tree:v:cd2['subcat'],cd21,cid21}
                        <span><a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd21['catid']}">{x2;v:cd21['catname']}</a></span>
                        {x2;endtree}
                    </div>
                    {x2;endif}
                </div>
                {x2;endtree}
            </div>
            <div id="divv3">
                {x2;tree:$cate[3]['subcat'],cd3,cid3}
                <div class="twomenu clearfix">
                    <span><a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd3['catid']}">{x2;v:cd3['catname']} >> </a></span>
                    {x2;if:v:cd3['subcat']}
                    <div>
                        {x2;tree:v:cd3['subcat'],cd31,cid31}
                        <span><a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd31['catid']}">{x2;v:cd31['catname']}</a></span>
                        {x2;endtree}
                    </div>
                    {x2;endif}
                </div>
                {x2;endtree}
            </div>
            <div id="divv4">
                {x2;tree:$cate[4]['subcat'],cd4,cid4}
                <div class="twomenu clearfix">
                    <span><a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd4['catid']}">{x2;v:cd4['catname']} >> </a></span>
                    {x2;if:v:cd4['subcat']}
                    <div>
                        {x2;tree:v:cd4['subcat'],cd41,cid41}
                        <span><a href="index.php?item-app-index-search&stype=1&price={x2;$price}&keyword={x2;$keyword}&applytype={x2;$applytype}&catid={x2;v:cd41['catid']}">{x2;v:cd41['catname']}</a></span>
                        {x2;endtree}
                    </div>
                    {x2;endif}
                </div>
                {x2;endtree}
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        //$("#home-nav li:first-child>a.fir").click(function (e) {
        $(".alltypes").click(function (e) {
            e.stopPropagation();
            var offset = $(this).offset();
            $("#menu-div2").removeClass("hide");
            console.info(offset)
            console.info("dian ji le ")
            $("#menu-div2").css({left:offset.left,top:offset.top+48}).show();
            console.info($("#menu-div2"))
        });


        $("#menu-type-ul2 li").mouseover(function () {
            // li backgroud
            $(this).addClass("active").siblings().removeClass("active");
            // 选中 白底绿图，其他元素设置为 绿底白图
            //img:first 白图，img:last 绿图
            //设置选中的li元素$(this)为绿图（第一个图片隐藏第二个图片显示）
           // $(this).children("img").first().removeClass().addClass("hide");
           // $(this).children("img").last().removeClass().addClass("icon-show");
            //设置未选中的兄弟li元素为白图（第一个图片显示第二个图片隐藏）
            var others = $(this).siblings();
            $(others).each(function(){
                $(this).children("img").removeClass();
                $(this).children("img").first().removeClass().addClass("icon-show");
                $(this).children("img").last().removeClass().addClass("hide");
            });
            $("#popdiv2").removeClass("hide");
            $("#popdiv2").css({left: $(this).width()+20, top: 0}).show();
            var index = $(this).index();
            $("#popdiv2").children().removeClass("show").addClass("hide");
            $("#divv"+index).removeClass().addClass("show");
            if(!$("#divv"+index).html()){
                $("#divv"+index).html($(this).text());
            }
        });
        $("#menu-div2").mouseleave(function () {
            $("#menu-type-ul2 li").removeClass("active");
            $("#menu-type-ul2 li").children("img").removeClass();
            $("#menu-type-ul2 li").each(function(){
                $(this).children("img").first().removeClass().addClass("icon-show");
                $(this).children("img").last().removeClass().addClass("hide");
            });
            $("#popdiv2").hide();
            $(this).hide();
        });

    });

</script>





