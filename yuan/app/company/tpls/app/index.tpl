{x2;include:header}
<body id="datacontent">
<style>
    .ym_on{ background-color: #009944; color: #fff!important; border: 1px solid #ff8a00; }
    .qyk-filter td button{
        background:#009944;
    }
    .qyk-filter td button:hover{
        background:#037034;
    }
    .qyk-list-tab .nav-tabs > li.active > a,.qyk-list-tab .nav-tabs > li.active > a:hover{
        background:#009944;
    }
/*    .qyk-lists li a{
        width:260px;
    }*/
     .qyk-lists li a h4{
        width:240px;
        margin-left:10px;
        height:20px!important;
        overflow: hidden!important;
    }
    .sjzx-detail-title{
        padding-left:35px;
    }
    .why-page li a:hover{
        background:#009944!important;
        border:solid 1px #009944;
    }
    .why-page li a {

        padding: 2px 12px;

    }
    .btn-border-gray{
        background:#009944;
        border:solid 1px #009944;
        border-radius: 2px;
        color:#fff;
    }
    .btn-border-gray:hover{
        background: #057d3b;
        border:solid 1px #057d3b;
    }
    .zmm-zx-centent{
        background:#fff;
    }
    .hln-zx-centent-title{
        background: #fff;
    }
     .qyk-list-tab .nav > li > a{
          color:#666;
         border: none;
     }
     .nav-tabs > li > a:hover{
        background:#009944!important;
        /*border:solid 1px #009944!important;*/
        border-radius: 0px;
     }
    .qyk-list-tab .nav > li > a:hover{
        background-color:#999;
        color: #fff;
        border: none;
    }
     .qyk-list-tab .nav {
        background-color: #f5f5f5;
      
      }
      .sjzx-list-px {
          border-bottom:solid 1px #efefef;
          background: #fff;
          height:40px;
      }
      .box_1{
        border:solid 1px #ebebeb;
        border-radius: 4px;
      }
  </style>
{x2;include:nav}
<!--面包屑-->
<div class="zmm-zx-centent">
    <div class="container">

        <!-- 面包屑 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php">首页</a> > <a>供应商列表</a></span>
        </div>
        <!-- 面包屑 end -->
        <!-- 左侧 start -->
        <div class="pull-left" style="width: 880px; background-color: #fff;">
            <!-- 优秀企业推荐 start -->
            {x2;if:!$keyword}
            <div class="box_1">
                <div class="zmm-qydt-title zmm-qydt-shsj1"><p>优秀企业推荐</p></div>
                <ul class="qyk-lists pull-left">
                    {x2;tree:$levelData,vv,id}
                        <li>
                            <a href="index.php?company-app-company-index&companyid={x2;v:vv['userid']}" title="">
                                <em style="width:56px;height:28px;overflow: hidden;"title={x2;v:vv['company_category']}>{x2;v:vv['company_category']}</em>
                                <img src="{x2;if:v:vv['company_logo_da']}{x2;v:vv['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}" height="60" alt=""> <br>
                                <h4 class="t20">{x2;v:vv['company_name']}</h4>
                                <div class="sjzx-detail-title">
                                    <!--指数0-5分别对应zs00-zs05-->
                                    {x2;if:v:vv['company_level'] == 1}
                                    <span class="pull-left zs zs05" style="background-position:right -22px;">推荐指数</span>
                                    {x2;elseif:v:vv['company_level'] == 2}
                                    <span class="pull-left zs zs05" style="background-position:right -44px;">推荐指数</span>
                                    {x2;elseif:v:vv['company_level'] == 3}
                                    <span class="pull-left zs zs05" style="background-position:right -66px;">推荐指数</span>
                                    {x2;elseif:v:vv['company_level'] == 4}
                                    <span class="pull-left zs zs05" style="background-position:right -88px;">推荐指数</span>
                                    {x2;elseif:v:vv['company_level'] == 5}
                                    <span class="pull-left zs zs05" style="background-position:right -110px;">推荐指数</span>
                                    {x2;else}
                                    <span class="pull-left zs zs05" style="background-position:right 0px;">推荐指数</span>
                                    {x2;endif}

                                </div>
                            </a>
                        </li>
                    {x2;endtree}
                </ul>
            </div>
            {x2;endif}
            <!-- 优秀企业推荐 end -->
            <!-- 企业列表 start -->
            <div class="box_1">
                <div class="zmm-qydt-title zmm-qydt-shsj1"><p>企业列表</p></div>
                <input type="hidden"  value="{x2;$category}" id="cat">
                <div class="qyk-list-tab t10">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs">
                        <li {x2;if:$category == false}class="active"{x2;endif}><a href="index.php?company-app-index">全部</a></li>
                        <li {x2;if:$category == '设备商'}class="active"{x2;endif}><a href="index.php?company-app-index&cat=设备商">设备商</a></li>
                        <li {x2;if:$category == '材料商'}class="active"{x2;endif}><a href="index.php?company-app-index&cat=材料商">材料商</a></li>
                        <li {x2;if:$category == '施工商'}class="active"{x2;endif}><a href="index.php?company-app-index&cat=施工商">施工商</a></li>
                        <li {x2;if:$category == '服务商'}class="active"{x2;endif}><a href="index.php?company-app-index&cat=服务商">服务商</a></li>
                        <li style="float:right;margin-right:14px;">
                          <!-- <form action="index.php?company-app-index&page={x2;$page}" method="post" class="form-inline"> -->
                                <table class="qyk-filter demo" width="100%" >
                                    <tr>
                                        <td class="pull-left">
                                            <input type="text" id="keyword" value="{x2;$keyword}" name="keyword" placeholder="请输入您要搜索的企业名称" style="font-size:14px;">
                                            <button type="button" onclick="doSearch()" style="font-size:14px;">搜索</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"></td>
                                    </tr>
                                </table>
                            <!-- </form> -->
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <!--其他服务商-->
                        <div class="tab-pane active" id="qyk-list-fws">
                            
                            <!--排序-->
                            <div class="sjzx-list-px">
                                <span class="pull-left t5">排序</span>
                                <span class="pull-left t5 l30 orderBy" name="rec"><a href="index.php?company-app-index&cat={x2;$category}&page={x2;$page}&=keyword={x2;$keyword}&level=1" id="zs">按推荐指数<img src="app/core/styles/images/px.png" style="height:12px;margin-left:3px;"></a></span>
                                <span class="pull-left t5 l30 orderBy" name="time"><a href="index.php?company-app-index&cat={x2;$category}&page={x2;$page}&=keyword={x2;$keyword}&time=1" id="sj">按发布时间<img src="app/core/styles/images/px.png" style="height:12px;margin-left:3px;"></a></span>
                                <!--
                                <span class="pull-left t5 l30 orderBy" name="fav">
                                    <a href="index.php?company-app-index&cat={x2;$category}&page={x2;$page}&=keyword={x2;$keyword}">按收藏数<i class="glyphicon glyphicon-triangle-top l5"></i>
                                    </a>
                                </span>
                                -->
                                <b class="pull-right t5">
                                    共搜索到<font class="cff7">{x2;$companyData['number']}</font>家企业
                                </b>
                            </div>
                            <div class="cp-list">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    {x2;tree:$companyData['data'],vvv,iid}
                                        <tr>
                                            <td width="210" valign="middle"><div class="img-bor" style="display: block;overflow: hidden;"><img src="{x2;if:v:vvv['company_logo_da']}{x2;v:vvv['company_logo_da']}{x2;else}app/core/styles/images/default06.png{x2;endif}" style="width: 150px;height: auto;max-height:none;max-width:none;position:relative;top:50%;left:40%;transform: translate(-50%,-50%);"/></div></td>
                                            <td valign="top" width="580">
                                                <a href="index.php?company-app-company-index&companyid={x2;v:vvv['userid']}" class="cp-list-title"><h4>{x2;v:vvv['company_name']}</h4>
                                                </a>
                                                <p class="t10">
                                                    <span class="sjzx-detail-title" style="padding-left:0px;">

                                                        {x2;if:v:vvv['company_level'] == 0}
                                                        <i class="zs zs03" style="background-position:right 0px;font-style: normal;">推荐指数</i>
                                                        {x2;elseif:v:vvv['company_level'] == 1}
                                                        <i class="zs zs03" style="background-position:right -22px;font-style: normal;">推荐指数</i>
                                                        {x2;elseif:v:vvv['company_level'] == 2}
                                                        <i class="zs zs03" style="background-position:right -44px;font-style: normal;">推荐指数</i>
                                                        {x2;elseif:v:vvv['company_level'] == 3}
                                                        <i class="zs zs03" style="background-position:right -66px;font-style: normal;">推荐指数</i>
                                                        {x2;elseif:v:vvv['company_level'] == 4}
                                                        <i class="zs zs03" style="background-position:right -88px;font-style: normal;">推荐指数</i>
                                                        {x2;else}
                                                        <i class="zs zs03" style="background-position:right -110px;font-style: normal;">推荐指数</i>
                                                        {x2;endif}
                                                    </span>

                                                    <span>收藏：<font style="color:#323232">{x2;v:vvv['company_num']}</font> </span>
                                                    <span>注册资金：{x2;v:vvv['company_capital']}万元</span>
                                                    <span>主营产品：{x2;substring:v:vvv['company_scope'],81}</span>

                                                </p>
                                            </td>
                                            <td align="center">
                                                <p><a href="index.php?company-app-company-index&companyid={x2;v:vvv['userid']}" title="" class="btn-border-gray">查看详情</a></p>
                                            </td>
                                        </tr>
                                    {x2;endtree}
                                </table>
                            </div>
                            <!--分页-->
                            <div class="why-page text-center t40" style="margin-top: 0;">
                                <ul>
                                    {x2;$companyData['pages']}
                                </ul>
                            </div>
                        </div>
                        <!--其他服务商-->
                    </div>
                </div>
            </div>
        </div>
        <!-- 企业列表 end -->
        <div class="pull-right" style="width: 300px;">
            <!--入驻-->
            <div class="qyk-list-rz" style="height: 254px!important;">
                <p class="text-center"><span>海量项目<br>商机</span><span>商机精准<br>匹配</span><span>高效在线<br>合作</span></p>
                <p class="text-center t30" style="color: #fff">深度挖掘项目合作商机</p>
            </div>
            <!--投资项目-->
            <div class="sjzx-detail-wrap sjzx-detail-rightitem t20 box_1" style="padding: 0;">
                <div class="zmm-qydt-title zmm-qydt-shsj1"><p>成功案例</p></div>
                {x2;tree:$caseData,val,k}
                    <a class="case_box" href="index.php?company-app-company-caseinfo&case_id={x2;v:val['case_id']}&companyid={x2;v:val['company_id']}" title="">
                    <dl>
                        <dt>
                        <div style="width:106px;height:68px;overflow:hidden;"><img src="{x2;if:v:val['case_logo']}{x2;v:val['case_logo']}{x2;else}app/core/styles/images/default02.jpg{x2;endif}" alt="" style="width: 100%;height: auto; vertical-align: middle; position: relative; top: 50%; transform: translate(0,-50%);"></dt>
                        <dd>
                            <h4>{x2;v:val['case_title']}</h4>
                            <p class="c999 t5">
                                案例类型：
                                <br>
                                {x2;v:val['case_category']}
                            </p>
                        </dd>
                    </dl>
                </a> 
                {x2;endtree}
            </div>
        </div>
    </div>
</div>

<!--foot-->
<div class="clearfix"></div>
{x2;include:footer2}
</body>
</html>
<script>
   var c=[];
    var thisURL = document.URL;
	var getval = thisURL.split('?')[1];
//	var status = getval.split("=")[1];
	var c_nub=getval.split("&");
	c.push(c_nub);
	console.log(c);
	for(var i=0;i<c.length;i++){
		console.log(c[i])
		for(var g=0;g<c[i].length;g++){
			console.log(c[i][g]);
			if(c[i][g]=="level=1"){
			   $("#zs").css("color","#009944")
			}
			if(c[i][g]=="time=1"){
				$("#sj").css("color","#009944")
			}
		}

	}
    $(".orderBy").click(function() {
        var url = "index.php" + location.search;
        var name = $(this).attr("name");
        var sort = '';
        if(sort == "") {
            url += "&sort=" + name + "_desc";
        } else {
            var sortArr = sort.split("_");
            var field = sortArr[0];
            var direction = sortArr[1];

            var okw = "sort=" + sort;
            var arr = url.split("&");
            var ki = arr.indexOf(okw);

            if(field != name) {
                var direc = "desc";
            } else {
                if(direction == "asc") {
                    var direc = "desc";
                } else {
                    var direc = "asc";
                }
            }
            if(ki > 0) {
                arr[ki] = "sort=" + name + "_" + direc;
            }else{
                arr.push("sort=" + name + "_" + direc);
            }
            url = arr.join("&");
        }
        location.href = url;
    })

    function isIE() { //ie?
        if (!!window.ActiveXObject || "ActiveXObject" in window)
            return true;
        else
            return false;
    }

    function doSearch() {
        var keyword = $("#keyword").val();
        var cat = $("#cat").val();
        //alert(ordersn);
        var url = 'index.php?company-app-index&stype=2&page={x2;$page}';
        if (keyword != '') {
            url += '&keyword=' + keyword;
            
        }

        if (cat != '') {
            url += '&cat=' + cat;
        }


        window.location.href = url;
    }

//    $('.sx').sx({
//        nuv:".zj",//筛选结果
//        zi:"sx_child",//所有筛选范围内的子类
//        qingchu:'.qcqb',//清除全部
//        over:'on'//选中状态样式名称
//    });
</script>
