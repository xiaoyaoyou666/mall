{x2;include:header}
<style>
	
	table tr td{
		border:0px;
	}
	 table.f tr td{
		height:50px;
		border:0px;
		line-height: 50px;
	}
	table.f tr td span{
		margin-right:10px;
		display: inline-block;
		width:70px;
	}
	table td input{
		width:240px;
		border-radius: 4px;
		height:32px;
		border:solid 1px #ccc;
		display: inline-block;
	}
	input[type="file"] {
       display: inline-block;
   }
  
   .files{
   	 display: inline-block;
   	 width:100px;
   	 height:30px;
   	 position: relative;
   	 border:1px solid #eeeeee;
     border-radius:4px;
    line-height: 30px; 
    top:9px;
      }
    .files input{
     position: absolute;
   	 opacity: 0;
   	 z-index: 1000;
   }
   .files span{
   	 position: absolute;
   	 left:0px;
   	 top:0px;
   	 width:100px!important;
     background:url(app/core/styles/img/sc.png) no-repeat  5px;
     background-size: 14px;
     padding-left:24px;
   }
   .why-btn-big-green{
   	border-radius: 4px;
   	height: 30px;
   	line-height: 30px;
   	padding: 0 20px;
   }
   .why-btn-big-green:hover{
   	 color:#fff;
   }
  
   .spec{   
   	padding:0px 20px;
   	height:21px;
   	line-height: 21px;
   	margin-right:25px;
   	background:rgba(0,153,68,0.10);
    border-radius:20px;

   }
   .pri input{
   	 width:60px;
   	 height:20px;
   	 margin-right:25px;
   }
  .pit {
  	background:rgba(0,153,68,0.03);
    box-shadow:inset 0 -1px 0 0 rgba(0,153,68,0.10);
  }
  #xz_show tr{
  cursor: pointer;
 
  }
  #xz_show tr td{
  	border: 0px!important;
  }
  #xz_show tr ul li{
  	float: left;
  }
  #xz_show tr ul li span{
  	display: block;
  }
  #xz_show div{
  	height: 30px;
    line-height: 30px;
  }
  .xz ul{
  	display: none;
  }
  .pit ul{
  	display: block;
  }
    .ul_select,.sl_select{
        display:inline-block;
    }
   .select{
  	background:rgba(0,153,68,0.80)!important;
  	color: #fff!important;

  }
  input[type="checkbox"] {
    -webkit-appearance: none;
    background-color: #fff;
    border: solid 1px #ccc;
    border-radius: 2px;
}
  input:checked {
    -webkit-appearance: none;
    background: url(app/core/styles/img/checked.png) no-repeat center;
    background-size: 12px;
    background-color: #fff;
    border: solid 1px #ccc;
    outline: none;
}
    .fineuploader{
        float:left;
    }
</style>
<body>
	{x2;include:nav}
	<div class="zmm-zx-centent">
		<div class="container">
			<!-- 导航 start -->
			<div class="hln-zx-centent-title t20 b20">
				你所在的位置：
				<span><a href="index.php">企业中心</a> > <a>网格超市货架维护</a> > <a>框架协议</a></span>
			</div>
			<!-- 导航 end -->
			<div class="qycenter-content">
				<!-- 左侧栏 start -->
				{x2;include:menu}
				<!-- 左侧栏 end -->

				<!-- 右侧  start -->
				<div class="right-content col10 pull-right">
					<div class="zmm_panel panel-default">
						<div class="zmm-qydt-title zmm-qydt-shsj1">
							<p><em class="title-triangle"></em>协议上传</p>
						
						</div>
						<div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
							<form action="index.php?user-company-items-lite" method="post" id="form1">
								<fieldset>
									<table class="f">
										<tr>
											<td>
                                                <span>甲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;方：</span>
                                                <div class="ul_select" style="margin-left: -4px">
                                                    <input type="hidden" value="{x2;$agreement['salerid']}" name="args[comp_code]" id="comp_id">
                                                    <input type="text" value="{x2;$agreement['salername']}" class="comp_sel" name="args[comp_name]">
                                                    <div class="selects" style="width:310px;height:200px;overflow: hidden;display: none;border:solid 1px #eee;">
                                                    </div>
                                                </div>
                                            </td>
											<td><span>乙&nbsp;&nbsp;&nbsp;&nbsp;方：</span><input type="text" style="border: 0px;"  readonly="readonly" value="{x2;$_user['company_name']}"></td>
										</tr>
									
										<tr>
											<td><span>协议编号：</span><input id="agr_num" type="text" name="args[agreement_number]" value="{x2;$agreement['agreement_number']}"></td>
											<td><span>有效期：</span><input id="start" value="{x2;date:$agreement['starttime'],'Y-m-d'}" type="text" style="width: 140px;" class="datetimepicker" name="args[starttime]" data-date-format="yyyy-mm-dd"> - <input id="endt" name="args[endtime]" type="text" value="{x2;date:$agreement['endtime'],'Y-m-d'}" style="width: 140px;" class="datetimepicker" data-date-format="yyyy-mm-dd"></td>
										</tr>

                                        <tr> 
                                            <td colspan="2">
                                                <span>付款条款：</span>
                                                <div class="sl_select" style="margin-left: -4px;">
                                                    <input type="hidden" value="{x2;$agreement['payment_code']}" name="args[fukuan_code]" id="fukuan_id">
                                                    <input type="text" value="{x2;$agreement['payment_text']}" class="fukuan_sel">
                                                    <div class="selects" style="width:310px;height:200px;overflow: hidden;display: none;border:solid 1px #eee;">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
									  
									   	<tr>
											<td colspan="2">
											  <span style="float:left">协议上传:</span>
                                                <script type="text/template" id="pe-template-url">
                                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                                        <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                                            <div class="qq-upload-button-selector" style="border:solid 1px #ccc;border-radius: 4px;height:30px;line-height: 30px;margin-top:10px;padding-left: 30px;background:url(app/core/styles/images/upload.png) no-repeat 15px;background-size:16px;">
                                                                <ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                                    <li class="text-center">
                                                                        <span>点击上传</span>
                                                                        <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[pdf]" tabindex="0" value="" needle="needle" style="width:20px;" id="file_address">
                                                                        <span class="qq-upload-file-selector" style="display: none;" id="file_w"></span>
                                                                    </li>

                                                                </ul>
                                                                <ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                                    <li class="text-center">
                                                                        <span>点击上传</span>
                                                                        <input type="hidden" class="qq-edit-filename-selector"
                                                                               name="args[pdf]" tabindex="0"
                                                                               value="{x2;$agreement['file']}">
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </script>
                                                <div class="fineuploader" attr-list="true" attr-template="pe-template-url" attr-ftype="pdf"></div>
											  <a id="file_a" href="?{x2;$_app}-company-privatement-test2" target="_blank" style="margin-left:10px;">{x2;$agreement['filename']}.pdf</a>
											</td>
										</tr>
										 <tr>
									     <td colspan="2">
									     	<span>协议商品:</span>
									     	<a class="why-btn-big-green" id="xz_file">选 择</a>
									     	<a class="why-btn-big-green" id="save" style="display: none">保存</a>
									     </td>
									   </tr>
									</table>
									<!--展示选中信息-->
								    <table class="table table-hover table-bordered" style="display:none;width:600px;" id="show">
										<thead style="background:#f5f5f5;color:#333">
											<tr>
												<th>物料编码</th>
												<th>商品名称</th>
												<th>规格</th>
												<th>协议价</th>
											</tr>
										</thead>
										<tbody>
											 <tr>
											 	<td>1</td>
											 	<td>1</td>
											 	<td>1</td>
											 	<td>1</td>

											 </tr>
										</tbody>
									</table>
									<!--可以选择的-->
									<div>
									  <table class="table table-hover table-bordered xz" style="display: none;" id="xz_show">
										<thead style="background:#f5f5f5;color:#333">
											<tr>
												<th width="60px">选择</th>
												<th >商品名称</th>
																					
											</tr>
										</thead>
										<tbody>
                                        {x2;tree:$goods,good,cid}
											 <tr>
											 	<td style="text-align: center;">
											 		<div><input type="checkbox"></div>
											 		<ul>
											 			<li>
											 				<div>规格</div>
											 		    	<div>协议价</div>
											 			</li>
											 		</ul>
											 	
											 	</td>
											 	<td>
											 		<div class="shop_name">{x2;v:good['goodstitle']}</div>
											 		<ul>

                                                        {x2;tree:v:good['goodsitem'],gooditem,itid}
											 			<li>
											 				 <div style="padding-top:5px;">
                                                                 <input type="checkbox" name="goods[{x2;v:good['goodsid']}][{x2;v:gooditem['itemid']}][item]" {x2;if:v:gooditem['is_agr']=='1'}checked="checked"{x2;endif} style="display: none">
                                                                 <span class="spec {x2;if:v:gooditem['is_agr']=='1'}select{x2;endif}"><span class="spec2" style="display: inline">{x2;v:gooditem['FJLSBJCL_XHGG']}</span>(<span class="code" style="display: inline">{x2;v:gooditem['FJLSBJCL_WLBH']}</span>)</span>
                                                             </div>
											 			      <div class="pri">&yen; <input type="text" name="goods[{x2;v:good['goodsid']}][{x2;v:gooditem['itemid']}][pric]" class="price" value="{x2;v:gooditem['agreement_price']}"></div>
                                                            <input type="hidden" name="goods[{x2;v:good['goodsid']}][{x2;v:gooditem['itemid']}][name]" value="{x2;v:good['goodstitle']}">
											 			</li>
                                                        {x2;endtree}

                                                    </ul>
											 	</td>
											 </tr>
                                        {x2;endtree}
											
										</tbody>
									 </table>
								</div>
								<div style="text-align: center;">

									    <span class="why-btn-big-green" id="tj">提交</span>
                                    <a class="why-btn-big-green" id="qx" style="background: #fff;color:#000000;border:solid 1px #009944" href="index.php?user-company-agreement-agreement">取消</a>
								</div>
								</fieldset>
                                <input type="hidden" value="{x2;$agreement['filename']}.pdf" name="args[pdf_name]" id="pdf_name">
                                <input type="hidden" value="1" name="edit">
                                <input type="hidden" value="{x2;$agreementid}" name="agreementid">
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	{x2;include:footer2}
	<script type="text/javascript" src="app/core/styles/js/pdfobject.js"></script>
	
	<script>
	  $(function() {
          //提交
          $('#tj').on('click',function(){
              if($('#comp_id').val() == '')
              {
                  $.zoombox.show('ajax', {result: false,message: '请选择甲方'});
                  return false;
              }
              if($('#agr_num').val() == '')
              {
                  $.zoombox.show('ajax', {result: false,message: '请填写协议编号'});
                  return false;
              }
              if($('#start').val() == '' || $('#endt').val() == '')
              {
                  $.zoombox.show('ajax', {result: false,message: '请选择有效期'});
                  return false;
              }
              if ($('#start').val() > $('#endt').val())
              {
                  $.zoombox.show('ajax', {result: false, message: '请选择有效期'});
                  return false;
              }
              if($('#fukuan_id').val() == '')
              {
                  $.zoombox.show('ajax', {result: false,message: '请选择付款条款'});
                  return false;
              }
              //console.log($('#file_address').val());return false;
              //if(typeof($('#file_address').val()) == 'undefined')
              //{
              //    $.zoombox.show('ajax', {result: false,message: '请上传协议'});
              //    return false;
              //}
              var submits=true;
              $("#xz_show").find("li").each(function(){

                  if($(this).find(".select").parent("div").siblings(".pri").find("input").val()==""){

                      submits=false;
                  }
              })

              if(submits==true){

                  $.ajax({
                      type: 'POST',
                      data: $("#form1").serializeArray(),
                      url: "index.php?user-company-agreement-agreementEdit",
                      dataType: 'json',
                      success: function(res) {
                          if (res.statusCode == 200) {
                              var data = {
                                  result: false,
                                  message: res.message
                              };
                              $.zoombox.show('ajaxOK', data);
                              window.location.href = "index.php?user-company-agreement-agreement";
                          } else {
                              var data = {
                                  result: false,
                                  message: res.message
                              };
                              $.zoombox.show('ajax', data);
                          }
                      }
                  })
              }else{
                  alert("请完整填写协议商品信息");
              }



          });
//        function pdf(){
//         var myPDF = new PDFObject({ url: "app/core/styles/js/sample.pdf" }).embed("file_a");
//         };
        var a_href;
        $('.submenu:eq(1)').delay(400).slideDown(700);
        $('.submenu:eq(1) li:eq(1)').addClass("active");
          $(document).on('change', 'input[type=file]', function () {
              if ($("#file_w").text() !== "") {
                  $("#file_a").text($("#file_w").text());
                  $("#pdf_name").val($("#file_w").text());
              }
          })

        $("#xz_file").click(function(){
        	$("#xz_show").show();
        	$("#save").show()
            $(this).hide();
        })
        $("#xz_show").on("click","tr",function(){
        	$(this).addClass("pit");
            $(this).find("input[type=checkbox]").attr("checked","checked");
            $(this).siblings("tr").removeClass("pit");
        })
         $("#xz_show").on("click",".spec",function(){
        	
        	if($(this).hasClass("select")){
        		$(this).removeClass("select");
                $(this).prev("input").removeAttr("checked");
        	}else{
        		$(this).addClass("select");

                $(this).prev("input").prop("checked", true);
        	}
        })
       
        $("#file_a").click(function(){
        	var a=$(".qq-edit-filename-selector").val();
        
            $(this).attr("href","?{x2;$_app}-company-privatement-test2&"+a);
        })
          //选择公司
          $(".comp_sel").keyup(function() {
              var suibian = $(this).next('.selects');
              var code = $(this).val();
              if (code != '') {
                  $.ajax({
                      type: 'GET',
                      data: {
                          code: code
                      },
                      url: "index.php?item-app-ajax-getCompanyByCode",
                      dataType: 'json',
                      success: function(res) {
                          if (res.statusCode == 200) {
                              suibian.html(res.data);
                          } else {
                              var data = {
                                  result: false,
                                  message: res.message
                              };
                              $.zoombox.show('ajax', data);
                          }
                      }
                  })
              }
              $(this).next("div").slideDown();
          });

          $(".ul_select").on("click", "li", function() {
              $(this).parent("ul").parent("div").siblings(".comp_sel").val($(this).text());
              $(this).parent("ul").parent("div").siblings("input[type=hidden]").val($(this).attr("name"));
              $(this).parent("ul").parent("div").hide();
          });


          //选择付款条码
          $(".fukuan_sel").keyup(function() {
              var suibian = $(this).next('.selects');
              var code = $(this).val();
              if (code != '') {
                  $.ajax({
                      type: 'GET',
                      data: {
                          code: code
                      },
                      url: "index.php?item-app-ajax-getFukuanByCode",
                      dataType: 'json',
                      success: function(res) {
                          if (res.statusCode == 200) {
                              suibian.html(res.data);
                          } else {
                              var data = {
                                  result: false,
                                  message: res.message
                              };
                              $.zoombox.show('ajax', data);
                          }
                      }
                  })
              }
              $(this).next("div").slideDown();
          });

          $(".sl_select").on("click", "li", function() {
              $(this).parent("ul").parent("div").siblings(".fukuan_sel").val($(this).text());
              $(this).parent("ul").parent("div").siblings("input[type=hidden]").val($(this).attr("name"));
              $(this).parent("ul").parent("div").hide();
          });
//


          $("#save").click(function() {
              $("#show tbody").empty();
              $("#xz_show tbody").find("tr").each(function () {
                  if ($(this).find(".select").parent("div").siblings(".pri").find("input").val() == "") {
                      $.zoombox.show('ajax', {
                          result: false,
                          message: '选中规格下的价格不能为空'
                      });
                      return false;
                  } else {
                      if ($(this).find(".select").length > 0) {
                          $(this).addClass("order");
                      }

                  }
              })
              show();
              $("#xz_file").show();
              $(this).hide();
              $("#xz_show").hide();
          })

            function show(){
                $("#xz_show tbody").find("tr.order").each(function () {
                    var shop_name = $(this).find(".shop_name").text();

                    $(this).find(".select").each(function(){

                        var code= $(this).find(".code").text();
                        var price=$(this).parent("div").next().find(".price").val();
                        var spec=$(this).find(".spec2").text();
                        $("#show").show();
                        $("#show tbody").append("<tr><td>"+code+"</td><td>" + shop_name + "</td><td>"+spec+"</td><td>"+price+"</td></tr>");

                    })
                })
            }
          $("#save").trigger("click");

    });

    </script>
</body>

</html>