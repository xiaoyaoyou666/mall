var widget = {}
widget = {
    init: function () {
        widget.bindEvent();
        widget.showActiveTab();

    },
    bindEvent: function () {
        // $(document).on('click',".order-status li a",function (e) {
        //     e.preventDefault();
        //     $(this).closest("ul").find("li").removeClass("active");
        //     $(this).closest("li").addClass("active");
        //     var thisHref=$(this).attr('href');
        //     window.location.href=thisHref;
        //     // $(this).tab('show');
        // })

        $(document).on('input propertychange change', ".search-content", function (e) {
            e.preventDefault()
            var searchBtn = $(this).closest(".input-group").find(".input-group-btn button"),
                searchVal = $(this).val();
            if (searchVal.length) {
                searchBtn.removeAttr('disabled');
            } else {
                searchBtn.attr('disabled', "disabled");
            }
        })

        //查看所有商品列表
        $(".order-list-table td").not(".handler").on("click", function () {
            var $this = $(this).closest(".order-list-table");
            var $tr = $this.closest("tr"), $goodPanel = $this.next();
            if ($goodPanel.hasClass('lay')) {
                $tr.find('.glyphicon').removeClass("glyphicon-triangle-top").addClass("glyphicon-triangle-bottom");
                $goodPanel.hide('slow');
                $goodPanel.removeClass('lay');


            } else {
                $tr.find('.glyphicon').removeClass("glyphicon-triangle-bottom").addClass("glyphicon-triangle-top");
                $goodPanel.show('slow');
                $goodPanel.addClass('lay');

            }
        })
    },

    showActiveTab: function () {
        var type = widget.getParamByurl('orderstatus');
        switch (type) {
            case '1':
                widget.addActiveClass("#seller-confirm");
                break;
            case '2':
                widget.addActiveClass("#pending-delivery");
                break;
            case '3':
                widget.addActiveClass("#received-good");
                break;
            case '4':
                widget.addActiveClass("#completed-order");
                break;
            case '5':
                widget.addActiveClass("#refundable-order");
                break;
            case '99':
                widget.addActiveClass("#canceled-order");
                break;
            default:
                widget.addActiveClass("#all");
        }
    },

    //为dom添加className
    addActiveClass: function (dom) {
        $(".order-status li").removeClass('active');
        $(dom).addClass('active');
    },
    getParamByurl: function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;

    }
}
widget.init();