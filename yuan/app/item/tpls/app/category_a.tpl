<div class="container">
	<div></div>
	<ul id="ss" style="margin-top: 20px;">

		{x2;if:$brands['data']}
		{x2;if:!$brandid && !$brandids}
		<li>
			<p class="sl-key">品牌</p>
			<div class="sl-value">
				<ul class="sl-b-letter J_brandLetter" id="letter">
					<li data-initial="0" class="curr">所有品牌</li>
					<li data-initial="A">A</li>
					<li data-initial="B">B</li>
					<li data-initial="C">C</li>
					<li data-initial="D">D</li>
					<li data-initial="E">E</li>
					<li data-initial="F">F</li>
					<li data-initial="G">G</li>
					<li data-initial="H">H</li>
					<li data-initial="J">J</li>
					<li data-initial="K">K</li>
					<li data-initial="L">L</li>
					<li data-initial="M">M</li>
					<li data-initial="O">O</li>
					<li data-initial="P">P</li>
					<li data-initial="Q">Q</li>
					<li data-initial="R">R</li>
					<li data-initial="S">S</li>
					<li data-initial="T">T</li>
					<li data-initial="V">V</li>
					<li data-initial="W">W</li>
					<li data-initial="X">X</li>
					<li data-initial="Y">Y</li>
					<li data-initial="Z">Z</li>
				</ul>
				<div class="clr"></div>
				<div class="sl-v-logos">
					<ul class="J_valueList v-fixed" id="img_list">

						{x2;tree:$brands['data'],brand,brandsid}
						<li id="{x2;v:brand['brandtitle']}" data-initial="{x2;v:brand['first']}" style="display: block;">
							<a href="{x2;v:brand['href']}" rel="nofollow" title="{x2;v:brand['brandtitle']}">
								<i></i><img src="{x2;v:brand['brandthumb']}" ><span>{x2;v:brand['brandtitle']}</span> </a>
						</li>
						{x2;endtree}
						
					</ul>
				</div>
				<div class="sl-b-selected J_brandSelected" style="clear: both;display: none;">
					<span class="sl-b-key">已选条件：</span>
					<ul class="sl-v-list brand-selected" id="brand-sl">
					</ul>
				</div>
				<div class="sl-btns">
					<a class="btn btn-primary J_btnsConfirm disabled" href="javascript:;" id="sub1">确定</a>
					<a class="btn btn-default J_btnsCancel" href="javascript:;">取消</a>
				</div>
			</div>
			<div class="sl-ext">
				<a class="sl-e-more J_extMore" href="javascript:;" style="visibility: visible;"><i><img src="app/core/styles/images/more_x.png"></i><span>更多</span></a>
				<a class="sl-e-multiple J_extMultiple"><i><img src="app/core/styles/images/add1.png"></i>多选</a>
			</div>

		</li>

		{x2;endif}
		{x2;endif}



		
		{x2;if:$_user['userid']}
		{x2;if:!$price}
		<li>
			<p class="sl-key">价格</p>
			<div class="sl-value">
				<div class="sl-v-list">
					<ul class="J_valueList">
						{x2;tree:$pricearr,price,priceid}
						<li><a href="{x2;v:price['url']}" rel="nofollow"><i></i>{x2;v:price['txt']}</a></li>
						{x2;endtree}

					</ul>
				</div>

				<div class="sl-btns">
					<a class="btn btn-primary J_btnsConfirm disabled" href="javascript:;">确定</a>
					<a class="btn btn-default J_btnsCancel" href="javascript:;">取消</a>
				</div>
			</div>
			<div class="sl-ext">
				<a class="sl-e-more J_extMore" href="javascript:;" style="visibility: hidden;">更多<i></i></a>
				<!--  <a class="sl-e-multiple J_extMultiple" href="javascript:;">多选<i></i></a> -->
			</div>
		</li>
		{x2;endif}
		{x2;endif}
		
		{x2;if:!$applytype}
		<li>
			<p class="sl-key">适用机型</p>
			<div class="sl-value">
				<div class="sl-v-list">
					<ul class="J_valueList">
						{x2;tree:$applytypearr,applytype,applytypearrid}
						<li><a href="{x2;v:applytype['url']}" rel="nofollow"><i></i>{x2;v:applytype['txt']}</a></li>
						{x2;endtree}
						

					</ul>
				</div>
			</div>
		</li>
		{x2;endif}
		
		{x2;if:$agreementarrinfos}
			{x2;if:!$agreement}
			<li>
				<p class="sl-key">协议商品</p>
				<div class="sl-value">
					<div class="sl-v-list">
						<ul class="J_valueList">
							
							{x2;tree:$agreementarr,agreementtype,agreementtypearrid}
							<li><a href="{x2;v:agreementtype['url']}" rel="nofollow"><i></i>{x2;v:agreementtype['txt']}</a></li>
							{x2;endtree}
						</ul>
					</div>
				</div>
			</li>
			{x2;endif}
		{x2;endif}


	</ul>
	<input type="hidden" id="hcatid" value="{x2;$catid}">
	<input type="hidden" id="hprice" value="{x2;$price}">
	<input type="hidden" id="happlytype" value="{x2;$applytype}">
	<input type="hidden" id="keyword" value="{x2;$keyword}">
</div>
<script>
	var arr = []; //定义空数组
	$("body").on("click", ".multiple .J_valueList li", function() { //多选
		if ($(this).hasClass("selected")) {
			$(this).removeClass("selected");
			var yc = $(this).children("a").attr("title");
			$("#brand-sl").find("a").each(function() {
				if ($(this).attr("title") == yc) {
					$(this).parent("li").remove();
				}
			})
		} else {
			$(this).addClass("selected");
			$(this).parents(".multiple").find(".J_btnsConfirm").removeClass("disabled");
			if ($(this).find("img").length >= 1) {
				$(".sl-b-selected").css("display", "block");
				var xz = "<li class='selected' id=" + $(this).attr("id") + "><a title=" + $(this).children("a").attr("title") + "><i></i>" + $(this).children("a").attr("title") + "</a></li>";
				$("#brand-sl").append(xz)
			}
		}
		return false;
	})
	$("#brand-sl").on("click", "li", function() {
		var xc = $(this).children("a").attr("title");
		$("#img_list").find("a").each(function() {
			if ($(this).attr("title") == xc) {
				$(this).parent("li").removeClass("selected");;
			}
		})
		$(this).remove();
	})
	$("body").on("click", ".J_extMore", function() { //更多
		if ($(this).text() == "更多") {
			$(this).parent().siblings(".sl-value").find(".sl-v-logos").css("overflow-y","scroll");
			$(this).find("span").text("收起");
			$(this).find("img").attr("src","app/core/styles/images/more_s.png");
		}else{
			$(this).parents("li").removeClass("multiple");
			$(this).find("span").text("更多");
		   $(this).parent().siblings(".sl-value").find(".sl-v-logos").css("overflow-y","hidden");
			$(this).find("img").attr("src","app/core/styles/images/more_x.png");
		}
		
	})
	$("body").on("click", ".sl-e-multiple", function() { //多选
		$(this).parents("li").addClass("multiple");
		$(this).parents("li").siblings("li").removeClass("multiple");
	})
	$("body").on("click", ".J_btnsCancel", function() { //取消
		$(this).parents("li").removeClass("multiple");
		$(this).parents(".sl-btns").prevAll("div").find(".J_valueList li").removeClass("selected");
		$(".sl-b-selected").css("display", "none");
		$("#brand-sl").children("li").remove();		
		arr.splice(0, arr.length);
	})
	$("body").on("mouseenter", "#ss .sl-v-logos li", function() {
		$(this).find("img").hide()
		$(this).find("span").addClass("bl");
	})
	$("body").on('mouseleave', "#ss .sl-v-logos li", function() { //绑定鼠标划出事件
		$(this).find("img").show();
		$(this).find("span").removeClass("bl");
	});
	//---多个品牌筛选提交----------
	$("#sub1").click(function() {
		$("#brand-sl li").each(function() {
			arr.push($(this).attr("id"));
		})

		var hprice = $("#hprice").val();//获取价格
		var hcatid = $("#hcatid").val();//获取分类
		var happlytype = $("#happlytype").val();//获取适用机型
		var keyword = $("#keyword").val();//获取关键字
		

		if (keyword) {
			var url = 'index.php?item-app-index-search&stype=1&keyword='+keyword;
		}else{
			var url = 'index.php?item-app-category&page={x2;$page}';
		}
		
		
		if (hcatid != '')url += '&catid=' + hcatid;
        if (hprice != '') url += '&price=' + hprice;
        if (happlytype != '')url += '&applytype=' + happlytype;
        if (arr != '')url += '&brandids=' + arr;
            
       

        window.location.href = url;

		
	})
	//根据首字母筛选
	$("#letter").on("click", "li", function() {
		$(this).addClass("curr").siblings().removeClass("curr");
		var lettrs = $(this).attr("data-initial");
		if (lettrs == "0") {
			$("#img_list").children("li").show();
		} else {
			$("#img_list li").each(function() {
				if ($(this).attr("data-initial") != lettrs) {
					$(this).hide();
				} else {
					$(this).show();
				}
			})
		}
	})
</script>