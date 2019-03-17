<div class="clearfix"></div>

<footer style="position:relative;bottom:0">
<div id="footerab">
			<div class="foot">
				<div class="foots clearfix">
					<ul class="feet " >
						<li class="shopzn"><h3>客户服务</h3></li>
						<li class="linkof"><span><a href="index.php?user-app-register-shop">采买方操作手册</a></span></li>
						<li class="linkof"><span><a href="index.php?user-app-register-shop_head">培训手册</a></span></li>
						<li class="linkof"><span><a href="index.php?user-app-register-pro">常见问题</a></span></li>
					</ul>
					<ul class="feet ">
						<li class="shopzn"><h3>关于我们</h3></li>
						<li class="linkof"><span><a href="index.php?user-app-register-aboutus">公司介绍</a></span></li>
						<li class="linkof"><span><a href="index.php?user-app-register-contactus">联系方式</a></span></li>
					</ul>

					<div class="feets">
					<ul style="">
						<li class="shopzn"><h3>友情链接</h3></li>
						<li class="fried">
							{x2;tree:$links['data'],link,lid}
							<a target="_blank" href="{x2;v:link['url']}">{x2;v:link['name']}</a>
							 {x2;endtree}

							<!-- {x2;tree:$links['data'],link,lid}
										                    <a target="_blank" href="{x2;v:link['url']}" title="" onclick="changeTableVal('{x2;v:link[linkid]}')">{x2;v:link['name']}</a>|
										                {x2;endtree} -->
						</li>
					</ul>
					</div>
					<ul class="service">
						<li class="shopzn" style="margin-bottom: 10px;"><h3>服务热线</h3></li>
						<li class="tel" style="font-size: 15px;">010-57672968&nbsp;&nbsp;010-57672985</li>
						<li class="tel" style="font-size: 15px;">010-57672819&nbsp;&nbsp;010-57672724</li>
						<li class="timer" style="color:#666!important">服务时间：7*24小时</li>
						<li class="timer" style="color:#666!important">客服邮箱：tianrun@163.com</li>
					</ul>
				</div>
				<p class="firm">粤ICP备 18083013号 ©天工开物网络技术服务(深圳)有限公司   <a href="http://www.cnzz.com/stat/website.php?web_id=1273787615" target="_blank" title="站长统计">站长统计</a>
                    <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1275259758'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s96.cnzz.com/z_stat.php%3Fid%3D1275259758%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
                </p>
			</div>
		</div>
</footer>
<!-- 侧边导航 -->
<div class="why-right-menu">
    <ul>
        <li>
            <a href="javascript:;" onclick="goTop()">
                <img src="app/core/styles/images/right-menu-img04.png">
                <span>回到<br>顶部</span>
            </a>
        </li>
    </ul>
</div>
<script>
    function goTop(){
        $('html,body').animate({'scrollTop':0},600);
    }
</script>


<script>
    $(document).ready(function () {
        // setTimeout(function () {
            var $submenu = $('.submenu');//<ul class="submenu">
            var $mainmenu = $('.mainmenu');//<ul class="mainmenu">
            //在同级的二级菜单中切换不会隐藏一级菜单,反之
            //  $mainmenu.find('li:not(.br_b)').next('.submenu').hide();
            $submenu.hide();

			/*
			 delay()对被选元素的所有排队函数（仍未运行）设置延迟
			 slideDown() 方法以滑动方式显示被选元素。
			 注意：slideDown() 适用于通过 jQuery 方法隐藏的元素，或在 CSS 中声明 display:none 隐藏的元素（不适用于通过 visibility:hidden 隐藏的元素）。
			 提示：如需以滑动方式隐藏元素，请查看 slideUp() 方法。
			 */
            //二级菜单点击事件
            $submenu.first().delegate('li', 'click', function () {
                console.info($(this).text())
                $(this).siblings().removeClass("active");
                $(this).addClass("active");
            });

			/*
			 next() 方法返回被选元素的后一个同级元素。
			 同级元素是共享相同父元素的元素。注意：该方法只返回一个元素。

			 slideToggle() 方法在被选元素上进行 slideUp() 和 slideDown() 之间的切换。
			 该方法检查被选元素的可见状态。如果一个元素是隐藏的，则运行 slideDown()，如果一个元素是可见的，则运行 slideUp() - 这会造成一种切换的效果。

			 slideUp() 方法以滑动方式隐藏被选元素。
			 注意：隐藏的元素不会被完全显示（不再影响页面的布局）。
			 */
            //一级菜单点击事件
            $mainmenu.on('click', 'li', function () {
                var sub_menu = $(this).next('.submenu');
                sub_menu.slideToggle().siblings('.submenu').slideUp();
            });
        // },300)


    });
</script>

</body>

</html>
