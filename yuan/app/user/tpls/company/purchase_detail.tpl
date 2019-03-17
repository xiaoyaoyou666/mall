{x2;include:header}

<body>




<style type="text/css">
	.imgds{width: 18px;margin-right: 5px;}
	.cols{margin-top: 7px!important;}
</style>
{x2;include:nav}

<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>采购信息管理</a> > <a>采购详细信息</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right purchase-detail">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}


				<!--我的模块开始-->
				<div class="zmm_panel panel-default" >
					<!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
					<div class="zmm-qydt-title zmm-qydt-shsj1">
					<p><em class="title-triangle"></em>采购详细信息</p >
					<a href="#" onClick="javascript :history.back(-1);" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 40px;line-height: 40px;">返回上一页</a>
				    
				</div>
			
					
					<div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
					<form action="index.php?user-company-purchases-edit" method="post" class="form-horizontal">
						
						{x2;if:$purchase['purchasemoduleid']==5}
							{x2;include:detailequipment}
						{x2;endif}
						{x2;if:$purchase['purchasemoduleid']==7}
							{x2;include:detailservice}
						{x2;endif}

						
						<h4 class="title">联系方式</h4>
						<div class="form-group">
							<label for="purchasecontacter" class="control-label col-sm-2">联系人：</label>
							<div class="col-sm-3 cols">
                                {x2;$purchase['purchasecontacter']}						

                            </div>
						</div>

                        <div class="form-group">
							<label for="purchasephone" class="control-label col-sm-2">联系电话：</label>
							<div class="col-sm-3 cols">
                                {x2;$purchase['purchasephone']}							

                            </div>
							
                            
                                <label class="radio-line"><input type="radio" name="args[purchaseisopen]" id="purchaseisopen0" disabled="disabled" value="1" 
                                	{x2;if:$purchase['purchaseisopen']=='1'}
										checked='true';
	                                {x2;endif}
	                                /> 公开</label>&nbsp;&nbsp;<label class="radio-line"><input type="radio" name="args[purchaseisopen]" id="purchaseisopen" disabled="disabled" value="0" {x2;if:$purchase['purchaseisopen']=='0'}
										checked='true';
	                                {x2;endif}
	                                /> 不公开</label>&nbsp;&nbsp;							

                            <span style="color:#bbb">选择不公开将显示平台客服电话</span>
						</div>
                     

						<div class="form-group">
							<label for="purchasewechat" class="control-label col-sm-2">联系人微信：</label>
							<div class="col-sm-3 cols">
                                {x2;$purchase['purchasewechat']}				
                            </div>
						</div>

				        
					</form>

</div>


				</div>
				<!--我的模块结束-->




                </div>
            </div>
            <!-- 右侧  end -->
        </div>
    </div>
</div>

{x2;include:footer2}
<?php
if($_GET['a']==1){
?>
<script>
    $(function() {
        $('.submenu:eq(2)').delay(400).slideDown(700);
        $('.submenu:eq(2) li:eq(2)').addClass("active");
    });
</script>

<?php
}else{
?>
<script>
    $(function() {
        $('.submenu:eq(2)').delay(400).slideDown(700);
        $('.submenu:eq(2) li:eq(1)').addClass("active");
    });
</script>

<?php
}
?>
</body>

</html>
