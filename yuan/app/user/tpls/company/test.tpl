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
		height:30px;
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
     background:url(app/core/styles/img/sc.png) no-repeat 10px;
     background-size: 14px;
     padding-left:30px;
   }
   .why-btn-big-green{
   	border-radius: 4px;
   	height: 30px;
   	line-height: 30px;
   	padding: 0 20px;
   	border: solid 1px #009944;
   }
   .why-btn-big-green:hover{
   	 color:#fff;
   }
   .spec,.pri{
   	height:30px;
   }
   .spec{
   	display: inline-block;
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
  #xz_show li{
  	float: left;
  }
  .xz ul{
  	display: none;
  }
  .pit ul{
  	display: block;
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
							<form action="index.php?user-company-items-lite" method="post">
								<fieldset>
									<table class="f">
										<tr>
											<td><span>甲&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;方：</span><input type="text"></td>
											<td><span>乙&nbsp;&nbsp;&nbsp;&nbsp;方：</span><input type="text" style="border: 0px;"  readonly="readonly"></td>
										</tr>
									
										<tr>
											<td><span>协议编号：</span><input type="text"></td>
											<td><span>有&nbsp;效&nbsp;期：</span><input type="text" style="width: 140px;" class="datetimepicker"> - <input type="text" style="width: 140px;"  class="datetimepicker"></td>
										</tr>
									  
									   	<tr>
											<td colspan="2">
											  <span>协议上传:</span>
											  <a class="files"><input type="file" id="file" style="width:100%;"><span>点击上传</span></a>
											  <a id="file_a" href="?{x2;$_app}-company-privatement-test2" target="_blank">dsfds</a>
											</td>
										</tr>
										 <tr>
									     <td colspan="2">
									     	<span>协议商品:</span>
									     	<a class="why-btn-big-green" id="xz_file">选 择</a>
									     	<a class="why-btn-big-green" id="save" style="display: none;">保存</a>
									     </td>
									   </tr>
									</table>
									<!--展示选中信息-->
								    <table class="table table-hover table-bordered" id="show">
										<thead style="background:#f5f5f5;color:#333">
											<tr>
												<th>物料编码</th>
												<th>商品名称</th>
												<th>规格</th>
												<th>协议价</th>
												
											</tr>
										</thead>
										<tbody>
											
										</tbody>
									</table>
									<!--可以选择的-->
									<div>
									  <table class="table table-hover table-bordered xz" style="display: none;width: 600px;" id="xz_show"> 
										<thead style="background:#f5f5f5;color:#333">
											<tr>
												<th width="120px">选择</th>
												<th >商品名称</th>
											
												
											</tr>
										</thead>
										<tbody>
											
											 <tr>
											 	<td>
											 		<input type="checkbox">
											 		<ul>
											 			<li>
											 				<div>规格</div>
											 		    	<div>协议价</div>
											 			</li>
											 		</ul>
											 	
											 	</td>
											 	<td>
											 		<span  class="shop_name">我是商品名称</span>
											 		<ul>
											 			<li>
											 				  <div style="padding-top:5px;">
											 				  	<input type="checkbox" style="display: none;" name="">
											 				  	<span class="spec">sdfds</span>
											 				  </div>
											 			      <div class="pri">&yen; <input type="text"></div>
											 			</li>
											 			<li>
											 				  <div style="padding-top:5px;">
											 				  	<input type="checkbox" style="display: none;" name="">
											 				  	<span class="spec">sdfds</span>
											 				  </div>
											 			      <div class="pri">&yen; <input type="text"></div>
											 			</li>
											 		</ul>
											 	</td>
											 </tr>
											  <tr>
											 	<td>
											 		<input type="checkbox">
											 		<ul>
											 			<li>
											 				<div>规格</div>
											 		    	<div>协议价</div>
											 			</li>
											 		</ul>
											 	
											 	</td>
											 	<td>
											 		<span class="shop_name">我是商品名称</span>
											 		<ul>
											 			<li>
											 				  <div style="padding-top:5px;">
											 				  	<input type="checkbox" style="display: none;" name="">
											 				  	<span class="spec">sdfds</span>
											 				  </div>
											 			      <div class="pri">&yen; <input type="text"></div>
											 			</li>
											 			<li>
											 				  <div style="padding-top:5px;">
											 				  	<input type="checkbox" style="display: none;" name="">
											 				  	<span class="spec">sdfds</span>
											 				  </div>
											 			      <div class="pri">&yen; <input type="text"></div>
											 			</li>
											 		</ul>
											 	</td>
											 </tr>
										</tbody>
									 </table>
								</div>
								<div style="text-align: center;">
								    	
									    <a class="why-btn-big-green" id="tj">提交</a>
									    <a class="why-btn-big-green" id="qx" style="background: #fff;color:#000000;">取消</a>
								</div>
								</fieldset>
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
//        function pdf(){
//         var myPDF = new PDFObject({ url: "app/core/styles/js/sample.pdf" }).embed("file_a");
//         };
       
  
        $('.submenu:eq(1)').delay(400).slideDown(700);
        $('.submenu:eq(1) li:eq(1)').addClass("active");
        $("#xz_file").click(function(){
        	$("#xz_show").show();
        	$("#save").show()
        })
        $("#xz_show").on("click","tr",function(){
        	$(this).addClass("pit")
        })
         $("#xz_show").on("click",".spec",function(){
        	$(this).addClass("select")
        })
        $("#file_a").click(function(){
        	var a="app/core/styles/js/sample.pdf";
            $(this).attr("href","?{x2;$_app}-company-privatement-test2&"+a);
        	pdf();
        })
        $("#tj").click(function(){
        	$("#xz_show").find("li").each(function(){
        		
        		if($(this).find(".select").parent("div").siblings(".pri").find("input").val()==""){
        			alert("选中规格下的价格不能为空");
        			return;
        		}
        	})
        })
        
        $("#save").click(function(){
        	$("#show tbody").empty();
        	$("#xz_show tbody").find("tr").each(function(){       		
        		if($(this).find(".select").parent("div").siblings(".pri").find("input").val()==""){
        			alert("选中规格下的价格不能为空");
        			return;
        		}else{
        			if($(this).find(".select").length>0){
        			    $(this).addClass("order");
        		     }
        			
        		}
        	})
        	$("#xz_show tbody").find("tr.order").each(function(){
        		var shop_name=$(this).find(".shop_name").text();
        		
        		$("#show tbody").append("<tr><td>"+shop_name+"</td></tr>");
        		
        	})
        
        })
    });
  
    </script>
</body>

</html>