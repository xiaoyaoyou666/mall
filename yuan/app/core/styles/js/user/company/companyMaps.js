widget = {}
widget = {
    DEFAULTS: {
        refreshMapType: 'default',
        selectedWindPlace: true
    },
    init: function () {
        //展开面板？
        $(document).on('click', '.selector-header .is-right', function () {
            var $this = $(this);
            if ($('.selector-content').hasClass('active')) {
                $this.find('em').html('&#xe6d7;');
                $('.selector-content').removeClass('active');
            } else {
                $this.find('em').html('&#xe6b2;');
                $('.selector-content').addClass('active');
            }
        })

        //供应商？风场？
        $(document).on('click', '.company-type', function () {
            var $this = $(this);

            if ($this.hasClass('active')) {
                //供货商反选
                if ($this.hasClass('type-company')) {
                    //设置标示获取供应商所有数据
                    widget.DEFAULTS.refreshMapType = 'all';
                    $('.selector-panel').hide();
                } else {
                    widget.DEFAULTS.selectedWindPlace = false;
                }
                $this.removeClass('active');
            } else {
                if ($this.hasClass('type-company')) {
                    widget.DEFAULTS.refreshMapType = 'default';
                    //筛选面板
                    $('.selector-panel').show();
                } else {
                    widget.DEFAULTS.selectedWindPlace = true;
                }
                $this.addClass('active');
            }
            widget.refreshMaps();
        })

        //更多筛选
        $(document).on('click', '.more-selector', function () {

            var $selector = $('.all-selector');

            if ($selector.hasClass('active')) {
                $(this).find('em').html('&#xe60b;');
                $selector.removeClass('active');
            } else {
                $(this).find('em').html('&#xe60c;');
                $selector.addClass('active');
            }
        })

        //供应商分类onchange
        $('#company-type').change(function () {
            widget.refreshMaps();
        })

        //供货范围
        $('#supply-range-first').change(function () {
            widget.refreshMaps();

            var id = $('#supply-range-first option:selected').val();

            if (id) {

                widget.getListByCatId(id).done(function (data) {
                    data = JSON.parse(data);
                    $('#supply-range-second').html(widget.buildSelectOption(data, {val: -1, text: '请选择二级分类'}));
                });
            } else {
                //晴空第三级选项
                widget.removeOption('#supply-range-second', '请选择二级分类');
            }
            //晴空第三级选项
            widget.removeOption('#supply-range-third', '请选择三级分类');
        })

        $('#supply-range-second').change(function () {
            widget.refreshMaps();
            var id = $('#supply-range-second option:selected').val();
            if (id) {
                widget.getListByCatId(id).done(function (data) {
                    data = JSON.parse(data);
                    $('#supply-range-third').html(widget.buildSelectOption(data, {val: -1, text: '请选择三级分类'}));
                });
            } else {

                //晴空第三级选项
                widget.removeOption('#supply-range-third', '请选择三级分类');
            }

        })

        $('#supply-range-third').change(function () {
            widget.refreshMaps();
        })

        //地域筛选
        $('#province').change(function () {
            widget.refreshMaps();
            var id = $('#province option:selected').val();
            if (id) {
                widget.getCityDataByProvinceId(id).done(function (data) {
                    data = JSON.parse(data);
                    $('#citys').html(widget.buildSelectOption(data, {val: -1, text: '请选择市'}, 'city'));
                });
            } else {
                widget.removeOption('#citys', '请选择市');
            }

        })
        $('#citys').change(function () {
            widget.refreshMaps();
        })
        //聚合点冒泡对话框 点击其他地方
        // $(document).on('click',':not(.leaflet-marker-icon)',function () {
        //     $('.popup').hide();
        // })
        //聚合点的冒泡对话框
        $(document).on('click', '.marker-icon-center', function () {
            $('.popup').hide();
            $(this).next('.popup').show();
            $('.leaflet-paneB-pane,.leaflet-paneA-pane').css('z-index', '400');
            $(this).closest('.leaflet-pane').css('z-index', '900');
        })
        $(document).on('click', '.close-popup', function () {
            $(this).closest('.popup').hide();
        })


    },
    removeOption: function (selector, defaultText) {
        $(selector).empty();
        $(selector).html('<option value="-1">' + defaultText + '</option>');
    },
    //获取供货范围byid
    getListByCatId: function (id) {
        return $.ajax({
            type: 'Get',
            url: 'index.php?user-company-index-ajaxCategory&catid=' + id,
        })
    },
    //获取供应商经纬度
    getAllSupplierData: function () {
        var result, conditions = '';
        if (widget.DEFAULTS.refreshMapType === 'default') {
            conditions = widget.setUrlParam(widget.getSearchParam());
        } else {
            conditions = "&noData=-1";
        }

        return $.ajax({
            type: 'Get',
            async: false,
            url: 'index.php?user-company-index-map_info' + conditions,
        })
        // return result;
    },
    getAllWindPlaceData: function () {
        var result;
        return $.ajax({
            type: 'Get',
            async: false,
            url: 'index.php?user-company-index-wind_info',

        })
        // return result;
    },
    //获取城市列表
    getCityDataByProvinceId: function (id) {
        return $.ajax({
            type: 'Get',
            url: 'index.php?user-company-index-getCityByFather&fid=' + id,
        })
    },
    //构建下拉框选项
    buildSelectOption: function (json, defaultOption, type) {
        var option = '<option value="' + defaultOption.val + '">' + defaultOption.text + '</option>';
        if (json && json.length) {
            $.each(json, function (i, item) {
                if (type === 'city') {
                    option += '<option value="' + item.cityid + '">' + item.city + '</option>';
                } else {
                    option += '<option value="' + item.catid + '">' + item.catname + '</option>';
                }

            })
        }
        return option;
    },
    refreshMaps: function () {
        markersA.clearLayers();
        markersB.clearLayers();
        if (widget.DEFAULTS.selectedWindPlace) {
            populate(markersA, 'green');
            map.addLayer(markersA);
        }
        if (widget.DEFAULTS.refreshMapType === 'default') {
            populate(markersB, 'blue');
            map.addLayer(markersB);
        }

    },
    getSearchParam: function () {
        //供应商类型选中值
        var purchasetype = $('#company-type option:selected').val();

        //供货范围
        var productType1 = $("#supply-range-first option:selected").val(),
            productType2 = $("#supply-range-second option:selected").val(),
            productType3 = $("#supply-range-third option:selected").val();

        //地区
        var province = $("#province option:selected").val(), city = $("#citys option:selected").val();

        var param = {};
        if (purchasetype && purchasetype !== -1) {
            param.userType = purchasetype;
        }
        if (productType1 && productType1 !== '-1') {
            param.topcateId = productType1;
        }
        if (productType2 && productType2 !== '-1') {
            param.fathcateId = productType2;

        }
        if (productType3 && productType3 !== '-1') {
            param.catId = productType3;
        }
        if (province && province !== '-1') {
            param.province = province;
        }
        if (city && city !== '-1') {
            param.city = city;
        }
        return param;
    },
    //拼接搜索条件的url参数
    setUrlParam: function (obj) {
        var resultStr = '';
        $.each(obj, function (i, val) {
            resultStr += '&';
            resultStr += i + "=" + val;
        })
        return resultStr;
    },
}
widget.init();
