$(function() {
    $('.submenu:eq(1)').delay(400).slideDown(700);
    $('.submenu:eq(1) li:eq(1)').addClass("active");

    $('#entering-time').datetimepicker({
        format: 'yyyy-mm-dd',
        minView: 2,
        autoclose: true,
        todayBtn: true,
        language: "zh-CN"
    });

    $('#upfile-time').datetimepicker({
        format: 'yyyy-mm-dd',
        minView: 2,
        autoclose: true,
        todayBtn: true,
        language: "zh-CN"
    });

    $('.undone-disabled,.done-disabled').on('click',function () {
        var data = {
            result: false, msg: "申请已提交，请耐心等待", buttons: [
                {text: '确定',isCancel:true},
            ]
        };
        $.zoombox.show('customConfirm', data);
    })
});

/**
 * [doSearch 搜索方法]
 * @Author   Zhangjianchao
 * @DateTime 2018-08-15
 * @return   {[type]}      [description]
 */
function doSearch(){
    var keyword = $("#keyword").val();
    var status = $("#status").val();
    var salername = $("#salername").val();
    var enteringTime = $("#entering-time").val();
    var upfileTRime = $("#upfile-time").val();
   
    var url = 'index.php?user-company-agreement-agreement&t=1';
    if (keyword != '') {
        url += '&keyword=' + keyword;
    }
    if (status != '') {
        url += '&status=' + status;
    }
    if (salername != '') {
        url += '&salername=' + salername;
    } 
    if (enteringTime != '') {
        url += '&endtime=' + enteringTime;
    }
    if (upfileTRime != '') {
        url += '&addtime=' + upfileTRime;
    }


    window.location.href = url;
}

/**
 * [exportReport 导出搜索条件下excel文档方法]
 * @Author   Zhangjianchao
 * @DateTime 2018-08-15
 * @return   {[type]}      [description]
 */
function exportReport(){
    var keyword = $("#keyword").val();
    var status = $("#status").val();
    var salername = $("#salername").val();
    var enteringTime = $("#entering-time").val();
    var upfileTRime = $("#upfile-time").val();
   
    var url = 'index.php?user-company-agreement-export_agreement';
    if (keyword != '') {
        url += '&keyword=' + keyword;
    }
    if (status != '') {
        url += '&status=' + status;
    }
    if (salername != '') {
        url += '&salername=' + salername;
    } 
    if (enteringTime != '') {
        url += '&endtime=' + enteringTime;
    }
    if (upfileTRime != '') {
        url += '&addtime=' + upfileTime;
    }


    window.location.href = url;
}