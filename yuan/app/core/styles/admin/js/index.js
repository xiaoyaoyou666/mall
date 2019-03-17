$(document).ready(function() {
	// 左边导航条二级导航
	$("#u2").children("li").children("span").click(function() {
		$(this).next("ul").toggle(500);
		$(this).parent("li").siblings("li").children("ul").hide();
	})
	$(window).on('resize', function() {
		var $content = $('body');
		$content.find('#content').each(function() {
			//$(this).width($content.width() - 260);
			$(this).prop("style","width:calc(100% - 220px)");
		});
	}).resize();
})