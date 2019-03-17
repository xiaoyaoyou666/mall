{x2;include:header}
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css"/>
<link rel="stylesheet" href="https://leaflet.github.io/Leaflet.markercluster/dist/MarkerCluster.css"/>
<link rel="stylesheet" href="https://leaflet.github.io/Leaflet.markercluster/dist/MarkerCluster.Default.css"/>
<style>
    .mycluster {
        width: 40px;
        height: 40px;
        background-color: greenyellow;
        text-align: center;
        font-size: 24px;
    }

    #map {
        height: 500px;
    }

    /*聚合点样式1*/
    .myclusterA {
        background: rgba(0, 153, 68, 0.20);
        text-align: center;
        border-radius: 100%;
        padding: 5px;
    }

    .myclusterA span {
        background: rgba(0, 153, 68, 0.80);
        width: 30px;
        height: 30px;
        line-height: 30px;
        display: inline-block;
        border-radius: 100%;
        color: #fff;
    }

    /*聚合点样式2*/
    .myclusterB {
        background: rgba(10, 141, 234, 0.20);
        text-align: center;
        border-radius: 100%;
        padding: 5px;
    }

    .myclusterB span {
        width: 30px;
        height: 30px;
        line-height: 30px;
        background: rgba(10, 141, 234, 0.60);
        display: inline-block;
        border-radius: 100%;
        color: #fff;
    }

    /*.leaflet-paneB-pane .marker-cluster {*/
    /*background: rgba(10, 141, 234, 0.20);*/
    /*}*/

    /*.leaflet-paneB-pane .marker-cluster div {*/
    /*width: 30px;*/
    /*height: 30px;*/
    /*line-height: 30px;*/
    /*background: rgba(10, 141, 234, 0.60);*/
    /*display: inline-block;*/
    /*border-radius: 100%;*/
    /*color: #fff;*/
    /*}*/

    .right-content {
        position: relative;
    }

    .selector-bar {
        position: absolute;
        top: 30px;
        z-index: 99999;
        background-color: rgba(255, 255, 255, 0.8);
        left: 56px;
        box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.08);
        width: 280px;

    }

    .selector-title {
        text-align: center;
    }

    .selector-panel {
        margin-bottom: 10px;
    }

    .selector-panel .control-label {
        font-weight: normal;
    }

    .selector-panel .col-sm-7 {
        padding-left: 0;
    }

    .selector-header {
        line-height: 36px;
        display: flex;
        background: rgba(0, 153, 68, 0.80);
        height: 36px;
        color: #fff;
    }

    .selector-content {
        display: none;
    }

    .selector-content.active {
        display: block;
    }

    .is-left {
        text-align: left;
    }

    .is-left a {
        color: #fff;
    }

    .is-right {
        text-align: right;
    }

    .selector-header .is-left, .selector-header .is-right {
        flex: .5;
        padding: 0 10px;
        cursor: pointer;
    }

    .selector-header .selector-title {
        flex: 1;
    }

    .chose-type {
        text-align: center;
        padding: 15px 0;
    }

    .chose-type div {
        display: inline-block;
        border-radius: 100px;
        width: 78px;
        height: 22px;
        background: #eeeeee;
        border: 1px solid rgba(102, 102, 102, 0.80);
        line-height: 20px;
    }

    /*.chose-type div.active {*/
    /*background: #ffffff;*/
    /*border: 1px solid rgba(10, 141, 234, 0.80);*/
    /*}*/

    .company-type {
        cursor: pointer;
    }

    .company-type .iconfont {
        font-size: 12px;
        padding: 0 5px;
    }

    .type-company.active {
        color: rgba(10, 141, 234, 0.80);
        background-color: #fff;
        border: 1px solid rgba(10, 141, 234, 0.80);
    }

    .type-place.active {
        color: #009944;
        background-color: #fff;
        border: 1px solid #009944;
    }

    .more-selector {
        border-bottom: 1px solid #ddd;
        margin: 0px 5px 10px;
        cursor: pointer;
    }

    .more-selector .iconfont {
        color: #ccc;
    }

    .right-content {
        width: 100%;
    }

    .selector-panel select {
        width: 140px;
        padding-left: 10px;
    }

    .form-horizontal .control-label {
        padding-top: 0;
    }

    /*img.leaflet-marker-icon{*/
    /*width: 22px !important;*/
    /*height: 28px !important;*/
    /*}*/
    .all-selector {
        display: none;
    }

    .all-selector.active {
        display: block;
    }

    .popup {
        display: none;
    }

    .popup .leaflet-popup {
        z-index: 99999 !important;
        position: absolute;
    }

    .popup .leaflet-popup-content {
        margin: 13px 0;
        padding: 0 13px;
        line-height: 1.4;
    }

    .leaflet-popup-pane .leaflet-popup {
        bottom: -69px !important;
        width: 208px;
        left: -78px;
    }

    .leaflet-popup a {
        color: #666;
        padding: 4px 0;
        display: block;
        line-height: 16px;
    }

    .leaflet-paneB-pane .leaflet-popup a:hover {
        color: rgba(10, 141, 234, 0.80);
    }
    .leaflet-paneB-pane .leaflet-popup .close-popup:hover {
        color: #666;
    }
    .leaflet-paneA-pane .leaflet-popup a {
        cursor: initial;
    }
    /*风场最小点*/
   .paneB-detail-marker:hover{
       color: rgba(10, 141, 234, 0.80);
   }

    .paneA-detail-marker{
        cursor: initial !important;
    }

    /*.myclusterB .leaflet-popup a:hover {*/
    /*color: rgba(10, 141, 234, 0.80);*/
    /*}*/

    .leaflet-container a.leaflet-popup-close-button {
        top: -18px;
        width: 28px;
        height: 18px;
        background-color: rgba(255, 255, 255, .8);
        text-align: center;
        font-weight: normal;
        padding: 2px 0 0;
        font-size: 24px;
        border-top-left-radius: 4px;
        border-top-right-radius: 4px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
        cursor: pointer;
    }

    .myclusterB:focus, .myclusterA:focus {
        border: none;
        outline: none;
    }

    .leaflet-popup-content-wrapper, .leaflet-popup-tip {
        background: rgba(255, 255, 255, .8);
        color: #333;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
    }

    .leaflet-popup-content::-webkit-scrollbar { /*滚动条整体样式*/
        width: 10px; /*高宽分别对应横竖滚动条的尺寸*/
        height: 1px;
    }

    .leaflet-popup-content::-webkit-scrollbar-thumb { /*滚动条里面小方块*/
        border-radius: 10px;
        -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
        background: #d3d3d3;
    }

    .leaflet-popup-content::-webkit-scrollbar-track { /*滚动条里面轨道*/
        -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
        background: #EDEDED;
    }

    /*.myclusterB .popup .close-popup:hover {*/
    /*color: #666;*/
    /*}*/

    .leaflet-popup-content-wrapper {
        border-top-left-radius: 12px;
        border-top-right-radius: 0px;
        border-bottom-right-radius: 12px;
        border-bottom-left-radius: 12px;
    }

</style>
<body>
{x2;include:nav}

<div class="zmm-zx-centent">
    <div class="container" style="width: 100%">

        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right">
                <!--地图-->
                <div id="map"></div>

                <!--地图上方的选择框-->
                <div class="selector-bar">
                    <div class="selector-header">
                        <div class="is-left"><a href="index.php?user-company-index-suplier_list"><em class="iconfont">&#xe600;</em>返回</a>
                        </div>
                        <div class="selector-title">供应商地图</div>
                        <div class="is-right"><em class="iconfont">&#xe6b2;</em></div>
                    </div>
                    <div class="selector-content">

                        <div class="chose-type">
                            <div class="company-type type-company active" data-type="company"><em class="iconfont">&#xe609;</em>供应商
                            </div>
                            <div class="company-type type-place active" data-type="place">
                                <em class="iconfont">&#xe60a;</em>风&nbsp;&nbsp;&nbsp;场
                            </div>
                        </div>


                        <div class="selector-panel form-horizontal">
                            <div class="more-selector">
                                更多筛选 <em class="iconfont">&#xe60b;</em>
                            </div>

                            <div class="all-selector active">
                                <form>
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-5 control-label">供应商分类:</label>
                                        <div class="col-sm-7">
                                            <select class="form-control" id="company-type">
                                                <option value="">请选择供应商</option>
                                                {x2;tree:$suplier_fanwei,supl,gid}
                                                <option value="{x2;v:supl['value']}">{x2;v:supl['text']}</option>
                                                {x2;endtree}
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-5 control-label">供货范围:</label>
                                        <div class="col-sm-7">
                                            <select class="form-control" id="supply-range-first">
                                                <option value="">请选择一级分类</option>
                                                {x2;tree:$parentcat,pare,gid}
                                                <option value="{x2;v:pare['catid']}">{x2;v:pare['catname']}</option>
                                                {x2;endtree}
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-offset-5 col-sm-7">
                                            <select class="form-control" id="supply-range-second">
                                                <option value="">请选择二级分类</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-5 col-sm-7">
                                            <select class="form-control" id="supply-range-third">
                                                <option value="">请选择三级分类</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-5 control-label">地域筛选:</label>
                                        <div class="col-sm-7">
                                            <select class="form-control" id="province">
                                                <option value="">请选择省份</option>
                                                {x2;tree:$data,data,gid}
                                                <option value="{x2;v:data['provinceid']}">{x2;v:data['province']}</option>
                                                {x2;endtree}
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-offset-5 col-sm-7">
                                            <select class="form-control" id="citys">
                                                <option value="">请选择市</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>

                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- 右侧  end -->
    </div>
</div>
</div>


<script type="text/javascript" src="app/core/styles/js/user/company/companyMaps.js"></script>
<script type="text/javascript" src="http://api.tianditu.gov.cn/api?v=3.0"></script>
<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet-src.js"></script>
<script src="https://leaflet.github.io/Leaflet.markercluster/dist/leaflet.markercluster-src.js"></script>
<script type="text/javascript">

    var map, markers, mcg, Mapsdata, windPlaceData, markersB, markersA, mapName = 'map';


    var tiles = L.layerGroup([
        L.tileLayer('http://t{s}.tianditu.cn/DataServer?T=vec_w&X={x}&Y={y}&L={z}', {subdomains: ['0', '1', '2', '3', '4', '5', '6', '7']}),
        L.tileLayer('http://t{s}.tianditu.cn/DataServer?T=cva_w&X={x}&Y={y}&L={z}', {subdomains: ['0', '1', '2', '3', '4', '5', '6', '7']})
    ]);
    //设置中心
    var latlng = L.latLng(40, 116);
    map = L.map(mapName, {attributionControl: false, center: latlng, zoom: 3, minZoom: 4, layers: [tiles]});

    map.createPane('paneB');
    map.createPane('paneA');

    //创建两个不同的聚合类型
    markersB = createMarkerClusterGroup('myclusterB', 'paneB');
    markersA = createMarkerClusterGroup('myclusterA', 'paneA');


    function createMarkerClusterGroup(className, pane) {
        mcg = L.markerClusterGroup({
            maxClusterRadius: 120,
            maxBound: 5,
            iconCreateFunction: function (cluster) {
                markers = cluster.getAllChildMarkers();
                var n = '';

                for (var i = 0; i < markers.length; i++) {
                    if (pane === 'paneB') {
                        n += '<a class="paneB-detail-marker" href="index.php?company-app-company-index&companyid=' + markers[i].id + '">' + markers[i].name + '</a>';
                    } else {
                        n += '<a class="paneA-detail-marker">' + markers[i].name + '</a>';
                    }
                }


                var html = '<span class="marker-icon-center">' + cluster.getChildCount() + '</span>' +
                    '<div class="popup">' +
                    '<div class="leaflet-popup  leaflet-zoom-animated" style="opacity: 1; bottom: 33px;left: -86px;">' +
                    '<a class="leaflet-popup-close-button close-popup iconfont">×</a><div class="leaflet-popup-content-wrapper">' +
                    '<div class="leaflet-popup-content" style="width: 208px;max-height: 200px;overflow-x: hidden;overflow-y: auto">' +
                    '<div class="popup-content">' + n + '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="leaflet-popup-tip-container">' +
                    '<div class="leaflet-popup-tip"></div>' +
                    '</div>' +
                    '</div>' +
                    '</div>';

                //刷新地图的时候恢复初始化设置的z-index
                $('.leaflet-paneB-pane,.leaflet-paneA-pane').css('z-index', '400');
                return L.divIcon({html: html, className: className, iconSize: L.point(40, 40)});
            },
            //Disable all of the defaults & specify the pane:
            spiderfyOnMaxZoom: false, zoomToBoundsOnClick: false, clusterPane: pane
        });
        return (mcg);
    }

    //设置地图数据
    function populate(markers, type) {
        // 使用自己的图标
        var greenIcon = L.icon({
            iconUrl: 'app/core/styles/images/map_green.jpg',
            shadowUrl: '',

            iconSize: [22, 28], // size of the icon
            shadowSize: [50, 64], // size of the shadow
            //iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
            shadowAnchor: [4, 62],  // the same for the shadow
            popupAnchor: [-3, -76] // point from which the popup should open relative to the iconAnchor
        });

        var blueIcon = L.icon({
            iconUrl: 'app/core/styles/images/map_blue.jpg',
            shadowUrl: '',

            iconSize: [22, 28], // size of the icon
            shadowSize: [50, 64], // size of the shadow
            //iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
            shadowAnchor: [4, 62],  // the same for the shadow
            popupAnchor: [-3, -76] // point from which the popup should open relative to the iconAnchor
        });
        var undoGreenIcon = L.icon({
            iconUrl: 'app/core/styles/img/undo-windPlace.png',
            shadowUrl: '',

            iconSize: [22, 28], // size of the icon
            shadowSize: [50, 64], // size of the shadow
            //iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
            shadowAnchor: [4, 62],  // the same for the shadow
            popupAnchor: [-3, -76] // point from which the popup should open relative to the iconAnchor
        });
        if (type === 'blue') {
            widget.getAllSupplierData().done(function (json) {
                json = JSON.parse(json);
                if (json.statusCode === 200) {
                    Mapsdata = json.locationArr;
                    if (Mapsdata) {
                        for (var i = 0; i < Mapsdata.length; i++) {
                            var m;
                            if (type === 'green') {
                                m = L.marker(formatMapsdata(i), {icon: greenIcon, title: i});
                            } else {
                                m = L.marker(formatMapsdata(i), {icon: blueIcon, title: i});
                            }
                            m.number = 1;
                            m.name = Mapsdata[i].name;
                            m.id = Mapsdata[i].id;


                            m.bindPopup('<div class="popup-content"><a class="paneB-detail-marker" href="index.php?company-app-company-index&companyid=' + Mapsdata[i].id + '">' + Mapsdata[i].name + '</a></div>');//弹出框
                            markers.addLayer(m);
                        }
                    }
                }

            })
        } else {
            widget.getAllWindPlaceData().done(function (json) {
                windPlaceData = JSON.parse(json);

                if (windPlaceData) {
                    for (var i = 0; i < windPlaceData.length; i++) {
                        var m;
                        if (type === 'green') {
                            //风场分为已建和在建，type分别对应'1'和'0'
                            if (windPlaceData[i].type === '0') {
                                m = L.marker(formatWindPlaceData(i), {icon: undoGreenIcon, title: i});
                            } else {
                                m = L.marker(formatWindPlaceData(i), {icon: greenIcon, title: i});
                            }
                        } else {
                            m = L.marker(formatWindPlaceData(i), {icon: blueIcon, title: i});
                        }
                        m.number = 1;
                        m.name = windPlaceData[i].name;
                        m.id = windPlaceData[i].id;

                        m.bindPopup('<div class="popup-content"><a class="paneA-detail-marker">' + windPlaceData[i].name + '</a></div>');//弹出框
                        markers.addLayer(m);
                    }
                }
            })
        }

    }

    //清洗数据
    function formatMapsdata(index) {
        return L.latLng(Mapsdata[index].lat, Mapsdata[index].lng);
    }

    //清洗数据
    function formatWindPlaceData(index) {
        return L.latLng(windPlaceData[index].lat, windPlaceData[index].lng);
    }


    populate(markersB, 'blue');
    populate(markersA, 'green');

    map.addLayer(markersB);
    map.addLayer(markersA);


    //resize 地图铺满整个屏幕
    $('html').css('overflow-y', 'hidden');
    $('#map').css('height', parseInt($(window).height()) - 116 + 'px');
    window.onresize = function () {
        $('#map').css('height', parseInt($(window).height()) - 116 + 'px');
    }



</script>
</body>
</html>
