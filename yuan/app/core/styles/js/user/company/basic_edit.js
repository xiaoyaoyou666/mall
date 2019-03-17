$(function () {
    $('.submenu:eq(0)').delay(400).slideDown(700);
    $('.submenu:eq(0) li:eq(1)').addClass("active");


    // $(".operate-box").on('click', 'button', function () {
    //     var clickType = $(this).data('type');
    //     if(clickType === 2){
    //         alert('确定要离开表单？');
    //     }else{
    //         $('input[name=submit]').val(clickType);
    //         $('.edit-from').submit();
    //     }
    // })
});