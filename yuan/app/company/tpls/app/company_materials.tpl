{x2;include:header}
<body>
<style>
    .img-box {
        padding: 5px;
    }

    .img-box .example-image {
        width: 100%;
        height: 100%;
    }

    .img-box .img-item {
        width: 120px;
        height: 85px;
        margin: 0 3px;
    }

    table thead {
        background: rgba(0, 153, 68, 0.10);
        box-shadow: inset 0 -1px 0 0 rgba(0, 153, 68, 0.20);
    }

    .table > thead > tr > th {
        border-bottom: none;
    }

    .table > tbody > tr > td {
        border-top: none;
    }

    .table > tbody > tr {
        border-bottom: 1px solid #eeeeee;
    }

    .yellow-text {
        color: #ff8a00;
    }

    .yellow-text:hover {
        color: #ff6100;
    }

    .lb-closeContainer .lb-close {
        position: absolute;
        width: 30px;
        height: 30px;
        background: url(app/core/styles/images/close.png) top right no-repeat;
        transition: opacity .2s;
        opacity: .7;
        display: block;
        top: -26px;
        right: -30px;
    }
    .heading{background: none!important;color: #595656!important;text-align: left!important;border-bottom: 1px solid #f2f2f2;font-weight: bold;}
	.pull-left ul li{border: none!important;}
    .heading img{width: 25px;height: 25px;margin: 0 20px;}
	.active{color: #333;
    	background: url(app/core/styles/img/menu_icon/active.png) no-repeat!important;
    	background-size: auto 50px!important;
    	background-color: rgba(83,181,126,0.08)!important;}
    .yellow-text {
          font-size: 14px;
         color: #ff8a00;
    }
</style>
{x2;include:nav}
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a>供应商展示</a> > <a>{x2;$data['company_name']}</a></span>
        </div>
        <!-- 导航 end -->
        <!-- 左侧栏 start -->
        <div class="pull-left" style="border: 1px solid #f2f2f2;">
            <div class="heading"><img src="app/core/styles/images/qyhy/header_sd.png"/>导&nbsp;&nbsp;&nbsp;&nbsp;航</div>
            <ul>
                <li><a href="index.php?company-app-company-index&companyid={x2;$data['userid']}">企业简介</a></li>
                <li><a href="index.php?company-app-company-news&companyid={x2;$data['userid']}">企业动态</a></li>
                <li><a href="index.php?company-app-company-product&companyid={x2;$data['userid']}">供货范围</a></li>
                <li><a href="index.php?company-app-company-qualification&companyid={x2;$data['userid']}">荣誉资质</a></li>
                <li><a href="index.php?company-app-company-project&companyid={x2;$data['userid']}">成功案例</a></li>
                <li><a href="index.php?company-app-company-contact&companyid={x2;$data['userid']}">联系方式</a></li>
                {x2;if:in_array($role,[1,2])}
                <li class="active"><a href="index.php?company-app-company-companyMaterials&companyid={x2;$data['userid']}" class="select">企业资质</a></li>
                {x2;endif}
            </ul>
        </div>
        <!-- 左侧栏 end -->

        <!-- 右侧  start -->
        <div class="pull-right">
            <!--公司简介-->
            <div>
                <!--公司信息-->
                <div class="zmm_panel panel-default zmm-gsxi">
                    <div>
                        <div class="zmm-gs-pj">
                            <table style="width: 100%">
                                <tr>
                                    <td align="center" valign="top" width="240px">
                                        <div class="pull-left zmm-gs-pj-logo t20 l20">
                                            <img src="{x2;if:$data['company_logo_da']}{x2;$data['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}"
                                                 alt="" style="width: 100%;height: 100%;">
                                        </div>
                                    </td>
                                    <td>
                                        <ul class="pull-left">
                                            <li><span class="zmm-gs-title">{x2;$data['company_name']}</span>
                                            </li>
                                            <li class="zmm-gs-dj">
												<span id="levelhtml">
                                                    <input type="hidden" id="level" value="{x2;$data['company_level']}">
												</span>
                                                <span class="zmm-gs-djl">点击量：
                                                    <span class="zmm-font-bold">{x2;$data['userreferrer']}</span></span>
                                            </li>
                                            <button onclick="toShop();return false;" class="button_tt dw_tt pull-right"
                                                    autocomplete="off">进入网格超市
                                            </button>
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div>
                    <!--成功案例-->
                    <div>
                        <div class="zmm_panel panel-default">
                            <div class="zmm-qydt-title zmm-qydt-shsj1"><p>合作资料</p>
                                {x2;if:in_array($role,[1,2])}
                                <a href="index.php?company-app-company-information&companyid={x2;$data['userid']}" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 40px;line-height: 40px;">编辑</a>
                                {x2;endif}
                            </div>
                            <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj">
                                <table class="table table-responsive table-hover">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>合作资料名称</th>
                                       
                                        <th>展示</th>
                                       
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>三证合一/五证合一/营业执照</td>
                                        <td class="img-box">
                                            <a class="example-image-link img-item" href="{x2;$data['company_licence_pic']}" data-lightbox="example-set" data-title="">
                                                <img class="example-image" src="{x2;$data['company_licence_pic']}" alt=""/>
                                            </a>
                                        </td>
                                    </tr>
                                    {x2;if:$certificateJpg && $certificatePdf }
                                    <tr>
                                        {x2;tree:$certificateJpg,info,kid}
                                    <tr>
                                        {x2;tree:v:info,val,kid1}
                                        <td>{x2;eval:echo v:kid+1}</td>
                                        <td>{x2;v:val['certificate_name']}</td>
                                        <td class="img-box">
                                            {x2;if:!is_array(v:val['certificate_url'])}
                                            <a class="example-image-link img-item" href="{x2;v:val['certificate_url']}" data-lightbox="example-set" data-title="">
                                                <img class="example-image" src="{x2;v:val['certificate_url']}" alt=""/>
                                            </a>
                                            {x2;else}
                                            {x2;tree:v:val['certificate_url'],url,kid2}
                                            <a class="example-image-link img-item" href="{x2;v:url}" data-lightbox="example-set" data-title="">
                                                <img class="example-image" src="{x2;v:url}" alt=""/>
                                            </a>
                                            {x2;endif}
                                            {x2;endtree}
                                        </td>
                                        {x2;endtree}
                                    </tr>
                                    {x2;endtree}
                                    {x2;tree:$certificatePdf,cat,cid}
                                    <tr>
                                        <td>{x2;eval: echo $certificateJpgcount+v:cid+1 }</td>
                                        <td>{x2;v:cat['certificate_name']}</td>
                                        <td class="img-box">
                                            <a href="{x2;v:cat['certificate_url']}" download="{x2;v:cat['file_name']}" class="yellow-text">{x2;v:cat['file_name']}</a>
                                        </td>
                                    </tr>
                                    {x2;endtree}

                                    </tr>
                                    {x2;else}
                                    <td>未添加其他合作资料</td>
                                    {x2;endif}
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <!-- 右侧  end -->
    </div>
</div>
{x2;include:footer2}
</body>
</html>
<script>
    lightbox.option({
        'resizeDuration': 200,
        'wrapAround': true,
        'albumLabel': ''
    })
    setTimeout(function () {
        $('.lb-outerContainer').append($('.lb-closeContainer'));
    }, 500);

    $(function () {
        var level = $('#level').val();
        var htmla = '';
        var htmlb = '';
        var reshtml = '推荐指数：';
        for (var i = 0; i < level; i++) {
            htmla += "<img src='app/core/styles/images/qyhy/qy_star_on.png'>"
        }
        for (var j = 0; j < 5 - level; j++) {
            htmlb += "<img src='app/core/styles/images/qyhy/qy_star.png'>"
        }
        reshtml += htmla + htmlb;
        $('#levelhtml').html(reshtml);
    });

    function toShop() {
        window.location.href = 'index.php?item-app-company&companyid={x2;$data['userid']}';
    }
</script>