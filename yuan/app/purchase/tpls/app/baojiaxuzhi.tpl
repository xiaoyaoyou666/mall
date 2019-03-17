{x2;include:header}

<body>
	{x2;include:nav}
	<style>

		.div_s p{
			width: 60%;
			margin: 0 auto;
			text-indent: 2rem;
			line-height: 42px;
			font-size: 16px;
		}
	</style>
	<div style="background-color:#fff; width: 100%;margin-bottom:100px;" class="div_s">
		<p style="text-align: center;font-weight: bold;font-size: 24px;margin:40px auto 10px">报价人须知</p>
		<p class="one">一、天工e购电子询比价采购平台，网址：http://tgkw.tianrun.cn:8221（以下简称“询比价平台”）是询价采购文件的专业发布平台，报价人须在询比价平台上注册并经审核通过后才能参与具体项目的报价，报价文件须通过询比价平台递交。</p>
		<p class="one">二、报价文件编制要求详见报价文件。请将报价文件中的商务文件（含报价部分）、技术文件分别单独编辑成册上传。报价人须在询比价平台上规定的递交截止时间前，将完整的报价文件电子版压缩打包后，上传至询比价平台。单个上传文件容量必须小于100M。</p>
		<p class="one">三、电子版文件应为两套，一套为盖公司公章的PDF文件，一套为Word或Excel可编辑的文件，两套文件内容须完全一致，所有报价价格表须同时提供Excel格式文件。当两套文件不一致时，以PDF文件为准。若询比价平台报价与商务文件中报价汇总表总金额有差异，则以PDF文件为准。若各分项价格表中累计的总金额和报价汇总表中总金额有差异，则以前者为准，后者做数字修正。</p>
		<p class="one">四、报价文件命名统一采用如“##公司（报价人）+##项目商务文件”、“##公司（报价人）+##项目技术文件”方式。</p>
		<p class="one">五、报价文件应附法定代表人证明文件和法定代表人签署的授权委托书。报价部分须按要求由报价人的法定代表人或其授权代理人签字并加盖公章。</p>
		<p class="one" style="margin-bottom: 60px">六、报价人只须递交电子版报价文件，不接受纸质版报价文件。</p>

	</div>

	<script>
		$('#tologin').on('click', function() {
			var username = $('#username').val();
			var userpassword = $('#userpassword').val();
			$.ajax({
				type: 'get',
				url: 'index.php?user-app-login-login&un=' + username + '&up=' + userpassword,
				dataType: 'JSON',
				async: true,
				success: function(res) {
					console.log(res);
					if (res.statusCode == 201) {
						var data = {
							result: false,
							message: "登录成功"
						};
						$.zoombox.show('ajaxOK', data);
						setTimeout(function() {
							window.location.href = 'index.php?purchase-app-content'
						}, 2000);
						return false;
					} else {
						var message = res.message;
						var data = {
							result: false,
							message: message
						};
						$.zoombox.show('ajax', data);
						return false;
					}
				},
				error: function(e) {
					console.log(e);
				}
			})
		})
		$(function() {
			var i = 0;
			$('.why-ph-list li').each(function() {
				i++;
				//$(this).find('span').html(i);
				if (i == 1) {
					$(this).find('span').html("<img src='app/core/styles/images/cg-ph0" + i + ".jpg'>");
				} else if (i == 2) {
					$(this).find('span').html("<img src='app/core/styles/images/cg-ph0" + i + ".jpg'>");
				} else if (i == 3) {
					$(this).find('span').html("<img src='app/core/styles/images/cg-ph0" + i + ".jpg'>");
				} else {
					$(this).find('span').html(i);
				}
			})
		});
		//时间倒计时
var intDiff = parseInt({x2;$time});//倒计时总秒数量
function timer(intDiff){
	window.setInterval(function(){
	var day=0,
		hour=0,
		minute=0,
		second=0;//时间默认值		
	if(intDiff > 0){
		day = Math.floor(intDiff / (60 * 60 * 24));
		hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
		minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
		second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
	}
	if (minute <= 9) minute = '0' + minute;
	if (second <= 9) second = '0' + second;
	$('#day_show').html(day+"天");
	$('#hour_show').html('<s id="h"></s>'+hour+'时');
	$('#minute_show').html('<s></s>'+minute+'分');
	$('#second_show').html('<s></s>'+second+'秒');
if(intDiff<=0){
	$(".timer_as").hide();
	$(".timer_sa").show();
}
	intDiff--;
	}, 1000);
} 
$(function(){
	timer(intDiff);
});
	</script>
	{x2;include:footer2}
</body>
</html>