<div class="clearfix"></div>
<style>
   #cnzz_stat_icon_1273787615{
   	float: left;
   	margin-top:-28px;
   }
</style>
<footer>
	<div class="why-footer bg_c1">
		<div class="container">
			<div class="foot-menu">
				友情链接
			</div>
            <div class="foot-yq pull-left">
                {x2;tree:$links['data'],link,lid}
                    <a target="_blank" href="{x2;v:link['url']}" title="" onclick="changeTableVal('{x2;v:link[linkid]}')">{x2;v:link['name']}</a>|
                {x2;endtree}
            </div>
		</div>
	</div>
    <div class="why-footer">
        <div class="container">
            <div class="foot-menu text-center">
                <img src="app/core/styles/images/qyhy/foot_aboutus.png">
                <img src="app/core/styles/images/qyhy/foot_email.png">
                <img src="app/core/styles/images/qyhy/foot_phone.png">
            </div>
        </div>
    </div>
	<div class="why-footer">
		<div class="container">
			<div class="foot-menu text-center" style="color: #888;">
                版权所有：北京天润新能投资有限公司 京ICP备09014811号 京公网安备11010502024904
			</div>
		</div>
	</div>
</footer>
<!-- 侧边导航 -->
<div class="why-right-menu">
	<ul>
		<li>
						<a href="index.php?user-app-login">
				<img src="app/core/styles/images/right-menu-img01.png">
				<span>发布<br>商机</span>
			</a>
					</li>
				<li>
			<a href="index.php?user-app-login">
				<img src="app/core/styles/images/right-menu-img02.png">
				<span>企业<br>入驻</span>
			</a>
		</li>
				<li>
			<a href="">
				<img src="app/core/styles/images/right-menu-img03.png">
				<span>在线<br>咨询</span>
			</a>
		</li>
		<li>
			<a href="javascript:;" onclick="goTop()">
				<img src="app/core/styles/images/right-menu-img04.png">
				<span>回到<br>顶部</span>
			</a>
		</li>
	</ul>
</div>
<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1273787615'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s13.cnzz.com/z_stat.php%3Fid%3D1273787615%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
</script>
<script>
	function goTop(){
		$('html,body').animate({'scrollTop':0},600);
	}


	function changeTableVal(id_value)
    {
                                                       
        $.ajax({
            url:'index.php?content-app-index-updateStatus&id_value='+id_value,
            dataType:'JSON',        
            success: function(data){
                if(data.statusCode == 200){
                    $(obj).attr('src',src);
                    return false;
                }else{
                    alert('失败了');
                }                                   
                          
            }
        });     
    }
</script>