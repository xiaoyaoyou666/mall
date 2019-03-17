<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>天工e购</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/qycenter.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/header.css"/>
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/about_us.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/contact.css" />
    <link rel="stylesheet" type="text/css" href="app/core/styles/css/base.css" />
    <script src="app/core/styles/js/jquery.min.js"></script>
</head>
{x2;include:header}
<body>
{x2;include:nav2}
<div class="container">
    <div class="col-sm-12 head">
        当前位置：<span>关于我们</span>><span class="current">联系方式</span>
    </div>
    <div class="col-sm-12">
        <div class="left_menu">
            <ul id="menu_content">
                <li>
                    <span>购物指南</span>
                    <ul>
                        <li><a href="index.php?user-app-register-shop">采买方操做手册</a></li>
                        <li><a href="index.php?user-app-register-shop#">培训手册</a></li>
                        <li><a href="index.php?user-app-register-pro">常见问题</a></li>
                    </ul>
                </li>
                <li>
                    <span>关于我们</span>
                    <ul style="display: block;">
                        <li><a href="index.php?user-app-register-aboutus" >公司介绍</a></li>
                        <li><a href="index.php?user-app-register-contactus" style="color:#009944;">联系方式</a></li>
                    </ul>
                </li>

            </ul>
        </div>
        <div class="right_content">
            <img src="app/core/styles/images/lxfs_img.png" class="head_banner1">
            <div style="margin-top:40px;height:360px;">
                <div id="map">
                    <div style="height: 310px;width:520px;border-radius: 10px;" id="allmap"></div>
                </div>
                <p class="adders">

                    <span>北京天润新能投资有限公司</span>
                    地址：北京市朝阳区安定路5号院中建财富国际中心22层<br>电话：010-57672999<br>传真：010-57672888<br>邮编：100029
                </p>
            </div>
            <div>
                <img src="app/core/styles/images/map.png" style="width:100%;">
            </div>
            <div class="fgs">
                <p><span>西北分公司</span>地址：新疆乌鲁木齐经济开发区上海路107号<br>电话：0991-3782906<br>邮编：830026<br></p>
                <p><span>华北分公司</span>地址：内蒙古呼和浩特市赛罕区鄂尔多斯路东街18号<br>　　　华贸大厦11楼<br>电话：0471-2882966<br>邮编：010011</p>

            </div>
            <div class="fgs">
                <p><span>华东分公司</span>地址：南京市建邺区庐山路188号新地中心10F<br>电话：025-82276162<br>邮编：210019</p>
                <p><span>南方分公司</span>地址：四川省成都市锦江区下东大街99号平安金融中心501<br>电话：028-61326503<br>邮编：610021</p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=67jMQ5DmYTe1TLMBKFUTcZAR"></script>
<script type="text/javascript">
    $(function() {
        ShowMap('116.412621,39.985313', '北京天润新能投资有限公司', '', '', '', '17');
    })

    function ShowMap(zuobiao, name, addrsee, phone, chuanzhen, zoom) {
        var arrzuobiao = zuobiao.split(',');
        var map = new BMap.Map("allmap");
        map.centerAndZoom(new BMap.Point(arrzuobiao[0], arrzuobiao[1]), zoom);
        map.addControl(new BMap.NavigationControl());
        var marker = new BMap.Marker(new BMap.Point(arrzuobiao[0], arrzuobiao[1]));
        map.addOverlay(marker);
        //				var infoWindow = new BMap.InfoWindow('<p style="color: #035cac;font-size:15px;">' + name + '</p><p>地址：' + addrsee + '</p><p>电话：' + phone + '</p><p>传真：' + chuanzhen + '</p>');
        marker.addEventListener("click", function() {
            this.openInfoWindow(infoWindow);
        });
        marker.openInfoWindow(infoWindow);
    }
</script>
{x2;include:footer2}
</body>
</html>
<script src="app/core/styles/js/menu_left.js"></script>
<script>
    $(function() {

        $('label').click(function() {
            $('.event_year>li').removeClass('current');
            $(this).parent('li').addClass('current');
            var year = $(this).attr('for');
            $('#' + year).parent().prevAll('div').slideUp(600);
            $('#' + year).parent().slideDown(600).nextAll('div').slideDown(600);
        });

    });

</script>