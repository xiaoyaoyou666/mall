{x2;include:header}

<body>





{x2;include:nav}
<style>
	.thumbnail .qq-thumbnail-selector{
		width: 210px;
		height: 150px;
	}
</style>
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company-items">网格超市货架管理</a> > <a>库存添加</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->

            <!-- 右侧  start -->
            <div class="right-content col10 pull-right add-repertory">
                <!--公司简介-->
                <div>

				<!--我的模块开始-->
				<div class="zmm_panel panel-default" >
					<!-- <h4 class="title" style="padding:10px;">发布商机</h4> -->
					<div class="zmm-qydt-title zmm-qydt-shsj1"><p><em class="title-triangle"></em>库存添加</p >

                        <a href="javascript:;" onclick="JavaScript:history.back(-1);" class="yellow-text pull-right" style="padding: 0px 40px 0px 20px;height: 40px;line-height: 40px;">返回库存列表</a>
				</div>
			
					
					<div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
					
					<form style="position: relative" action="index.php?user-company-items-additem" method="post" class="form-horizontal">
                        <p style="position: absolute;top:5px;right: 90px;color: #999">该图片作为规格图片展示在商品详情页面，当用户选择不同的规格时，<br/>切换展示相应规格的图片，支持jpg、jpeg、png格式</p>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">
                                <span class="hln-cue">*</span>
				            	图片：</label>
				            <div class="col-sm-9">
					            <script type="text/template" id="pe-template-itemthumb">
						    		<div class="qq-uploader-selector" style="width:30%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
						            	<div class="qq-upload-button-selector" style="clear:both;">
						                	<ul  class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;max-width:206px;max-height: 207px; ">
								                <li class="text-center">
								                    <div class="thumbnail">
														<img style="max-width: 206px;max-height: 207px" class="qq-thumbnail-selector" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[itemthumb]" tabindex="0">
													</div>
								                </li>
								            </ul>
								            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
									            <li class="text-center">
									                <div class="thumbnail">
														<img class="qq-thumbnail-selector" src="{x2;if:$item['itemthumb']}{x2;$item['itemthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[itemthumb]" tabindex="0" value="{x2;if:$item['itemthumb']}{x2;$item['itemthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
						                			</div>
									            </li>
									        </ul>
						                </div>
						            </div>
						        </script>
						        <div  class="fineuploader" attr-type="thumb" attr-template="pe-template-itemthumb"></div>
							</div>
				        </div>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">
				            	<span class="hln-cue">*</span>
				            	价格：
				            </label>
				            <div class="col-sm-4">
				            	<input type="text" class="form-control" name="args[itemprice]" needle="needle" msg="您必须输入批发价" maxlength="9" value="{x2;$item['itemprice']}" datatype="price" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" >
				            </div>
				        </div>
		                <div class="form-group">
		                    <label style="padding-left: 0"  for="block" class="control-label col-sm-2">
                                <span class="hln-cue">*</span>
		                    	免运费量：</label>
		                    <div class="col-sm-4">
		                        <input class="form-control" type="text" name="args[itemfreenumber]" needle="needle" msg="您必须输入免运费量" maxlength="9" value="{x2;$item['itemfreenumber']}" datatype="number" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
		                    </div>
		                </div>
				        <div class="form-group">
				            <label for="block" class="control-label col-sm-2">
                                <span class="hln-cue">*</span>
				            	库存：</label>
				            <div class="col-sm-4">
				            	<input type="text" maxlength="9" name="args[itemnumber]" needle="needle" class="form-control" msg="您必须输入库存" onkeyup="value=value.replace(/[^\d]/g,'')">
				            </div>
				        </div>
				        <div id="itemforms">
				    		{x2;tree:$forms,form,fid}
							<div class="form-group">
								<label for="{x2;v:form['id']}" class="control-label col-sm-2">
                                    {x2;if:v:form['id'] != 'FJLSBJCL_WLBH'}<span class="hln-cue">*</span>{x2;endif}
									{x2;v:form['title']}：</label>
								<div class="col-sm-4">{x2;v:form['html']}</div>
							</div>
							{x2;endtree}
				    	</div>
				    	<div class="form-group">
				            <label for="block" class="control-label col-sm-2">
                                <span class="hln-cue">*</span>
				            	状态：</label>
				            <div class="col-sm-9">
				            	<label class="radio-inline"><input type="radio" name="args[itemstatus]" value="1" checked/> 显示该库存</label>
				            	<label class="radio-inline"><input type="radio" name="args[itemstatus]" value="0" /> 不显示该库存</label>
				            </div>
				        </div>
				        <div class="form-group">
				            <label class="control-label col-sm-2"></label>
				            <div class="col-sm-9">
					            <button class="btn btn-primary" type="submit">提交</button>
					            
					           
					            <input type="hidden" name="args[itemgoodsid]" value="{x2;$goods['goodsid']}">
					            <input type="hidden" name="submit" value="1">
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
<script>
    $(function() {
        $('.submenu:eq(1)').delay(400).slideDown(700);
        $('.submenu:eq(1) li:eq(0)').addClass("active");
    });
</script>
</body>

</html>