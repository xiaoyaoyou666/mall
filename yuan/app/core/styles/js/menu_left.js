$(function(){
	$("#menu_content span").click(function(){
		$(this).next("ul").slideDown();
		$(this).parent("li").siblings("li").children("ul").slideUp();
	});
	$("footer").load("../html/footer.html");
})
