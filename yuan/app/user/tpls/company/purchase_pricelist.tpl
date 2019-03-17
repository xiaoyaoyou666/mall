{x2;include:header}
<body>
{x2;include:nav}

<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">采购信息管理</a> > <a>意向列表</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}


				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
					<h4 class="title" style="padding:10px;">
                        {x2;$purchase['purchasetitle']}
					</h4>
					<table class="table table-hover table-bordered">
						<thead>
							<tr class="info">
								<!-- <th width="40">ID</th> -->
								<th width="40" style="background-color:#ebebeb">联系人</th>
								<th width="40" style="background-color:#ebebeb">报价企业名称</th>
								<th width="40" style="background-color:#ebebeb">报价时间</th>
								<th width="40" style="background-color:#ebebeb">是否达成合作</th>
								<th width="40" style="background-color:#ebebeb">操作</th>
							</tr>
						</thead>
						<tbody>
							{x2;tree:$prices['data'],price,pid}
							<tr>
								<!-- <td>{x2;v:price['ppeid']}</td> -->
								<td>{x2;v:price['username']}</td>
								<td>
									<a href="index.php?company-app-company-index&companyid={x2;v:price['ppeuserid']}">{x2;v:price['company_name']}</a>
								</td>
								<td>
									{x2;date:v:price['ppetime'],'Y-m-d H:i'}
								</td>
								<td>
                                    {x2;if:v:price['ppestatus']==1}
										达成合作
                                    {x2;elseif:v:price['ppestatus']==2}
										已拒绝
                                    {x2;else}
                                    	已收到
                                    {x2;endif}
								</td>

								<td>
                                   <a href="index.php?user-company-purchases-pricedetail&ppeid={x2;v:price['ppeid']}&ppeuserid={x2;v:price['ppeuserid']}">查看</a> 
								</td>

							</tr>
							{x2;endtree}
						</tbody>
					</table>
					<ul class="pagination pull-right">
						{x2;$prices['pages']}
					</ul>
				</div>



</div>
            </div>
            <!-- 右侧  end -->
        </div>
    </div>
</div>
{x2;include:footer2}
{x2;include:purchasejs}

<script>
	$(function() {
        
        $("#aa").change(function(){

        	var b = $("#bb").val();
       		var a = $("#aa").val();
       		//var $parent = $(this).parent();
       		//var $html = $("<span style='color:red'>收货时间不能小于开始时间</span>");
		  	if(a<b){
		  		//alert("收货时间不能小于开始时间");
		  		//
		  		$("#messModal").modal();
		  		//$parent.append($html);
		  		$("#aa").val("");
		  	}else{
		  		
		  	}
		});
    });



    $(function() {
        $('.submenu:eq(2)').delay(400).slideDown(700);
        $('.submenu:eq(2) li:eq(1)').addClass("active");
    });
</script>
</body>

</html>
