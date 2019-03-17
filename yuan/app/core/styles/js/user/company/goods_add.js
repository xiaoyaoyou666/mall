$(function () {
    $('.submenu:eq(1)').delay(400).slideDown(700);
    $('.submenu:eq(1) li:eq(0)').addClass("active");

    //表单提交 1,直接提交；2，保存草稿，3，取消按钮
    $(".operate-box").on('click', 'button', function () {
        var clickType = $(this).data('type');
        $('input[name=submit]').val(clickType);
        if (clickType === 3) {
            validateFormByType('draft');
            var data = {
                result: false, msg: "是否保存当前信息到草稿箱", buttons: [
                    {text: '确定', url: 'index.php?user-company-items-add', formSelector: '.add-goods-from'},
                    {text: '取消', url: 'index.php?user-company-items', isHref: true,},
                ]
            };
            $.zoombox.show('customConfirm', data);
        } else {
            if (clickType === 2) {
                validateFormByType('draft');
            } else {
                validateFormByType('commit');
            }
            $('.add-goods-from').submit();
        }
    })

    function validateFormByType(type) {
        var $formItems = $('.add-goods-from').find('.require');
        $formItems.each(function (i) {
            if (type === 'draft') {
                if ($(this).attr("needle") === 'needle') {
                    $(this).removeAttr("needle");
                }
            } else {
                if (!$(this).attr("needle")) {
                    $(this).attr("needle", "needle");
                }
            }

        });

    }

    $(document).on('click', '.img-delete-bg', function () {
        //判断是否在已经满足最大值缩略图的时候删除图片
        var maxImgLen = parseInt($('.breviary  .fineuploader').attr('max-length'));
        if (maxImgLen === $('.breviary .sortable').find(".listimgselector").length) {
            $('.breviary .fineuploader').show();
        }

        $(this).closest(".listimgselector").remove();
    })


    if ($('.draft-list').find('.draft-item').length >= 8) {

        $(".draft-list").mCustomScrollbar({
            axis: "y", // horizontal scrollbar
        });

        var hander = "<div class='Drag_reminder handler'>" +
            " <div class='handlerTop fl' >" +
            " </div>" +
            " <p class='slide-block'>拖动滑块查看更多内容</p>" +
            " </div>" +
            "</div>";

        $(".mCSB_dragger_bar").html(hander);
        setTimeout(function () {
            $(".mCSB_dragger").css({
                'width': '30px',
                'height': '230px',
            })
        }, 1000);

    }
});
