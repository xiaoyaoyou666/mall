{x2;include:header}

<body>
	<style>
		.dis-select {
			border: 1px solid #ff8a00!important;
		}
		
		.closes {
			display: none;
		}
		
		.di-style span {
			border: solid 1px #fff;
			padding: 3px 20px;
		}
		
		td input,
		td select,
		td textarea {
			border: solid 1px #ccc;
			padding-left: 10px;
			height: 30px;
			line-height: 30px;
			width: 200px;
			border-radius: 4px;
		}
		td  textarea{
			width:80%;
			height:100px;
			margin-left:10%;
		}
		td select {
			width: 120px;
			text-align: center!important padding-left: 0px;
		}
		
		.why-cartbg table td {
			text-align: left;
			font-size: 14px;
		}
		
		.why-cartbg table td>span:first-child,.li_input li span:first-child{
			text-align: right;
			margin-right: 10px;
			display: inline-block;
			width: 120px;
		}
		.title_c {
			width: auto!important;
			font-size: 14px;
			text-align: left!important;
			font-weight: 600;
			color: #555;
		}
		.why-cartbg table th,
		.why-cartbg table td {
			padding: 8px 10px;
			font-weight: 500;
		}
		
		#com_name {
			background: url(app/core/styles/images/market/sj-icon.png) no-repeat center left;
			padding-left: 20px;
			margin-left: 10px;
			width: 100%;
			text-align: left;
		}
		
		.why-cartbg table .info td {
			text-align: center;
		}
		
		td li {
			height: 40px;
			line-height: 40px;
		}
		
		#address_more li {
			height:34px;
			line-height:34px;
			margin-left:20px;
			margin-right:20px;
			border:solid 1px #fff;
			color:#666;
			font-size:13px;
			padding-left: 10px;
			
		}
		#address_more li span:first-child{
			width:80px;
		}
		#address_more li:hover{
			border:solid 1px #fff;
			background-color: #fff0e0;
			border:solid 1px #ff992c!important;
			cursor: pointer;
			color:#323232;
			
		}
		.li_hover{
			 background:url(app/core/styles/img/address.png) 10px no-repeat;
		    background-size:14px;
			border: solid 1px #ff992c!important;
			font-size: 14px!important;
			font-weight: 600;
			padding-left: 10px;
		    background-color: #fff0e0;
		}
		#address_more .li_hover span:first-child::before{
			content: "寄送至";
			color:#ff992c;
			font-weight: 100;
						
		}
		#address_more li .del{
			float: right;
			margin-right:10px;
			display: none;
			font-weight: 100;
		}

		#address_more .li_hover .del{
			display: block;
		}
		#address_more span{
			text-align:center;
			margin-right:0px;
		}
		.add{
			display: block;
			width:130px;
			height:24px;
			line-height: 24px;
			font-size:13px;
			border-radius:2px;
			border:solid 1px #EBEBEB;
			margin-left:100px;
			/*position: relative;
			left:50%;
			margin-left:-100px;*/
			text-align: center;
			margin-top:20px;
			
		}
		li button{
			width:100px;
			height:30px;
			line-height:30px;
			margin-left:10px;
		}
        .ul_select,.s_select {
            position: relative;
            display: inline-block;
        }

        .ul_select div,.s_select  div{
            display: none;
            display: none;
            position: absolute;
            z-index: 100;
            background: rgba(255, 255, 255, 0.9);
            width: 200px;
            height: 150px;
            border: solid 1px #ebebeb;
            overflow-y: scroll;
        }
        .s_select  div{
            width:140px !important;
        }
        .comp_sel ul li {
            padding-left: 2px;
            width: 100%;
            height: 30px;
            cursor: pointer;
        }
        .new_add{
            font-size:13px;
            margin-top:20px;
            margin-left:80px;
            display: none;
        }
        .new_add input {
			width: 210px;
			height: 34px;
			line-height: 34px;
		}
		
		.why-btn-big-green,
		.why-btn-big-border-green {
			padding: 0 15px;
			height: 30px;
			line-height: 30px;
			border-radius: 4px;
		}
/*	/*	/*
		.ul_select input {
			min-width: 270px;
		}*/
		td.td_c{
        	color:#666;
        }
		.btn {
			background: none;
			outline: none;
			border: 0px;
		}
		
		.li_input input {
			width: 280px;
		}
		.form-inline .form-control {
          width:210px;
        }
        .why-cartbg{
              background-color: #fff; 
        }
        .why-cartbg table .info{
        	background:rgba(255,153,44,0.02);
            border:solid 1px #f2f2f2;
            border-bottom: 0px;
        }
        .t_li li{
        	height: 43px;
        	line-height: 43px;
        }
	</style>
	{x2;include:nav}

	<div class="container why-cartbg">
		<form class="wrap" action="index.php?item-app-order" method="post" id="form1">
            <input type="hidden" value="1" name="createorder">
			<table>
				<tr  style="background: rgba(0,153,68,0.03);border:1px solid rgba(0,153,68,0.10);border-bottom: 0px;">
					<td style="text-align: left;padding:5px 10px;" colspan="6">
						<span class="title_c">采购详情</span>
						<span style="font-size: 13px;">(请填写采购信息，并自动同步至SAP “采购订单”)</span>
					</td>
				</tr>
				<tr  style="background: rgba(0,153,68,0.03);border:1px solid rgba(0,153,68,0.10);border-top: 0px;">
					<!--<td>
						<span>公司</span>
                        <div class="ul_select">
                            <input type="hidden" value="{x2;$sapOrderInfoArr[bukrs]}" name="comp_code">
                            <input type="text" value="{x2;$companyName}" placeholder="主数据模糊搜索" autocomplete="off" class="selects" id="company_name">
                            <div class="comp_sel">
                            </div>
                        </div>
					</td>-->
					<td>
						<span>采购组织 :</span> <span>天润新能</span>
					</td>
					<td>
						<span>采购组</span>
                        <div class="ul_select">
                            <input type="hidden" value="{x2;$sapOrderInfoArr[ekgrp]}" name="caigou_code">
                            <input type="text" value="{x2;$purchaseDesc}" placeholder="主数据模糊搜索" autocomplete="off" class="selects">

                            <div class="comp_sel">
                            </div>
                        </div>
					</td>
				</tr>
				<!--<tr >
					<td colspan="3">
						<span>付款条款代码</span>
                        <div class="ul_select">
                            <input type="hidden" value="{x2;$sapOrderInfoArr[zterm]}" name="fukuan_code">
                            <input type="text" value="{x2;$fkuanDesc}" placeholder="主数据模糊搜索" autocomplete="off" class="selects">

                            <div class="comp_sel">
                            </div>
                        </div>
                    </td>
				</tr>-->
			</table>
			<table class="cart-list" style="border:1px solid #ededed;margin-top:30px;">
				<tr>
					<td style="text-align: left;padding:5px 10px;" colspan="8">
						<span class="title_c">订单详情</span>
					</td>
				</tr>

				<tr >
					<th width="50px">序号</th>
					<th width="300px">商品描述</th>
					<th width="100px">单价</th>
					<th width="100px">数量</th>
					<th width="140px">物料编码</th>
					<th width="200px">采购税</th>					
					<th>项目主体</th>
					<th>小计</th>
				</tr>
				{x2;tree:$orders['orderitems'],item,itid}
				<div>

					<div>
						<tr>
							<td colspan="8"><span style="font-size: 13px;" id="com_name">{x2;$companyName}</span></td>
						</tr>
					</div>
					<tr class="info">
						<td>{x2;v:item['goodsid']}</td>
						<td valign="middle">
							<p style="float: left;width:80px;height:80px;overflow: hidden;border:solid 1px #EBEBEB"><img src="{x2;v:item['itemthumb']}"  style="width:100%;"/></p>
							<p style="color:#333;float: left;width:200px;font-size: 13px;height:80px;overflow: hidden;text-align: left;padding-left:10px;">
								{x2;v:item['goodstitle']}
							</p>
						</td>
						<td>
							&yen;{x2;v:item['itemprice']}
							<!--净价-->
						</td>
						<td>
                            {x2;v:item['number']}
						</td>
						<td>{x2;v:item['wuliaocode']}</td>
						<td>
                            <div class="s_select">
                                <input type="hidden" value="{x2;$orderSapInfoAll[v:item['goodsid']]['data_value']}" name="goods[mwskz][{x2;v:item['goodsid']}]">
                                <input type="text" value="{x2;$orderSapInfoAll[v:item['goodsid']]['data_desc']}" placeholder="主数据模糊搜索" autocomplete="off" style="width:140px;text-align: center;padding-left:0px;" class="shui_sel">
                                <div class="comp_sel">
                                </div>
                            </div>
                        </td>
                     
						<td>
							<select name="goods[ewerk][{x2;v:item['goodsid']}]" id="ewerk_{x2;v:item['goodsid']}" class="getproject" style="width:136px;">
                              <option>{x2;$orderSapInfoAll[v:item['goodsid']]['factory_desc']}</option>
                           </select>
						</td>
						   <td><label class="color-red">&yen;{x2;eval: echo v:item['itemprice']*v:item['number']}</label></td>
					</tr>
				</div>
                {x2;endtree}
                  <tr style="background:rgba(255,153,44,0.02);">
				   <td colspan="8">给卖家留言 &nbsp;&nbsp;<input name="args[message]" rows="2" style="width:470px;"></input></td>
				</tr>
            </table>
        <table style="border:1px solid #ededed;margin-top:30px;">
            <tr>
                <td style="text-align: left;padding:5px 10px;" colspan="8">
                    <span class="title_c">收货信息</span>
                </td>
            </tr>
            <tr>
                <td colspan="8" style="background:#fff;">
                    {x2;if:$addressinfo['data']}
                    {x2;eval:v:cadd = current($addressinfo['data'])}
                    <input type="hidden" name="args[orderaddress]" id="orderaddress" value="{x2;v:cadd['addressid']}"/>
                    <ul id="address_more">
                        {x2;tree:$addressinfo['data'],address,aid}
                        <li class="sel_addr {x2;if:v:aid == '1'}li_hover{x2;endif}" value="{x2;v:address['addressid']}">
                            <span></span>
                            <span>
                                {x2;v:address['province']}&nbsp;{x2;v:address['city']}&nbsp;{x2;v:address['area']}&nbsp;{x2;v:address['addressinfo']}&nbsp;&nbsp;{x2;v:address['receiver']}&nbsp;&nbsp;{x2;v:address['phone']}<em></em>
                            </span>
                            <span class="del"><a class="btn confirm" href="index.php?item-app-order-deladdress&addressid={x2;v:address['addressid']}">删除</a></span>
                        </li>
                        {x2;endtree}
                    </ul>
                    {x2;endif}
                    <span class="add" id="add"><img src="app/core/styles/images/add_da.png" style="width:10px;margin-right: 3px;margin-top:-2px;">创建并添加新地址</span>

                    <div class="new_add">
                        <form>
                            <div class="add-address form-inline" id="newaddress" style="padding-left:10px;">
								<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">收货人：</span><input type="text"  class="form-control aa-ipt-text addaddress" name="ads[receiver]" id="receiver" /></p>
								<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">所在地区：</span>
									<select id="provinces" target="cities" autoload="index.php?core-api-index-getProvince" class="form-control autoloaditem combox it-select" style="width:120px;" name="ads[provinceid]"  refUrl="index.php?core-api-index-getcity&parent={value}">
										<option value="">选择所在地区</option>
									</select>
									<select id="cities" target="areas" class="form-control combox it-select" style="width:120px;" name="ads[cityid]"  refUrl="index.php?core-api-index-getarea&parent={value}">
										<option value="">选择所在城市</option>
									</select>
									<select id="areas" current="{x2;$areaid}"  class="form-control it-select 110" style="width:120px;" name="ads[areaid]">
										<option value="">选择所在县区</option>
									</select>
								</p>
								<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">详细地址：</span>
									<input type="text"  class="form-control aa-ipt-text addaddress" name="ads[addressinfo]" id="addressinfo" />
								</p>
								<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">邮政编码：</span>
									<input type="text"  class="form-control aa-ipt-text addaddress" name="ads[zipcode]" id="zipcode" />
								</p>
								<p style="margin-bottom: 16px;"><span style="width:112px; border:none; text-align:right;">电话：</span><input  type="text" class="form-control aa-ipt-text addaddress" name="ads[phone]" id="phone" /></p>
								<p><button type="button" class="why-btn-big-green" id="addressbtn">保存</button></p>
							</div>
                        </form>
                    </div>
                </td>
            </tr>
        </table>
        <table style="border:1px solid #ededed;margin-top:30px;">
            <tr>
                <td style="text-align: left;padding:5px 10px;">
                    <span class="title_c">发票信息</span>
                </td>
                <!--<td style="text-align: left;padding:5px 10px;">
                    <span class="title_c">留言</span>
                </td>-->
            </tr>
            <tr style="background:#fff;">
                <td style="width: 50%;" class="li_input">
                    <ul>
                        <li><span>名称</span>：<input type="text" placeholder="请输入名称" name="args[title]" value="{x2;$invoicearr['title']}"></li>
                        <li><span>纳税人识别号</span>：<input type="text" placeholder="请输入纳税人识别号" name="args[number]"	value="{x2;$invoicearr['number']}"></li>
                        <li><span>地址、电话</span>：<input type="text" placeholder="请输入地址、电话" name="args[mobile]"	value="{x2;$invoicearr['mobile']}"></li>
                        <li><span>开户行及账号</span>：<input type="text" placeholder="请输入开户行及账号" name="args[card_number]"	value="{x2;$invoicearr['card_number']}"></li>
                    </ul>

                </td>
                <!--<td>
                    <textarea placeholder="你想和卖家说~~~~~~~" name="args[message]"></textarea>
                </td>-->
            </tr>
              </table>
            <tr>
               <td colspan="2">
                    <ul style="float:right;text-align: right;">
                       <li><span>{x2;$orders['ordertitle']}</span>件商品金额总计：&nbsp;&nbsp;<span>&yen;{x2;$orders['orderprice']}</span></li>
                       <li>应付总额（运费提付)：&nbsp;&nbsp;<span style="font-size:24px;color:#f00">&yen;{x2;$orders['orderprice']}</span></li>
                       <li><button onClick="javascript :history.back(-1);" class="why-btn-big-green" style="background: #fff;border:solid 1px #009944;color:#009944;">取消订单</button>
                       	<button type="button" id="btn" class="why-btn-big-green" >提交订单</button></li>
                       <input type="hidden" name="createorder" value="1"/>
						<input type="hidden" name="sn" value="{x2;$orders['ordersn']}"/>
						<input type="hidden" name="args[znumber]" value="{x2;$orders['ordertitle']}"/>
                    </ul>
               </td>
            </tr>
      
	</form>
	</div>
	<script>
		$(".di-style").on("mouseover", function() {
			$(this).children($(".closes")).show()
		})
		$(".di-style").on("mouseout", function() {
			$(".closes").hide()
		})
		$('.di-style').find('span').on('click', function() {
			var _this = $(this);
			_this.parents('.di-style').parent().find('span').removeClass('active');
			_this.addClass('active');
			if (_this.attr('data-element')) {
				$('#' + _this.attr('data-element')).val(_this.attr('data-value'));
			}
		});
	</script>
	{x2;include:menu}
    {x2;include:footer}
	<script>		
		$("#address_more").on("click","li",function(){		  
		    $(this).addClass("li_hover");	
		    $(this).siblings().removeClass("li_hover");		
		});
		
	</script>

    <script>
        $(function(){

            $(".selects").keyup(function() {
                var s_t=$(this).parent(".ul_select").prev("span").text();
                var action = '';
                if(s_t == '公司'){
                    action = 'getCompanyByCode';
                }else if(s_t == '采购组'){
                    action = 'getCaigouByCode';
                }else{
                    action = 'getFukuanByCode';
                }

                var suibian = $(this).next('.comp_sel');
                var code = $(this).val();
                if(code != ''){
                    $.ajax({
                        type: 'GET',
                        data: {code:code},
                        url: "index.php?item-app-ajax-"+action,
                        dataType: 'json',
                        success: function (res) {
                            if(res.statusCode == 200){
                                suibian.html(res.data);
                            }else{
                                var data = {result: false, message: res.message};
                                $.zoombox.show('ajax', data);
                            }
                        }
                    })
                }
                $(this).next("div").slideDown();
            })

            $(".ul_select").on("click", "li", function() {
                $(this).parent("ul").parent("div").siblings(".selects").val($(this).text());
                $(this).parent("ul").parent("div").siblings("input[type=hidden]").val($(this).attr("name"));
                $(this).parent("ul").parent("div").hide();
                if($(this).parents(".comp_sel").prev("input[type=text]").attr("id")=="company_name"){
                    var compid = $(this).attr("name");
                    if(compid != ''){
                        $.ajax({
                            type: 'GET',
                            data: {code:compid},
                            url: "index.php?item-app-ajax-getFactoryByCode",
                            dataType: 'json',
                            success: function (res) {
                                if(res.statusCode == 200){
                                    $('.getproject').html(res.data);
                                }else{
                                    var data = {result: false, message: res.message};
                                    $.zoombox.show('ajax', data);
                                }
                            }
                        })
                    }
                }

            });

            $(".shui_sel").keyup(function() {
                var suibian = $(this).next('.comp_sel');
                var code = $(this).val();
                if(code != ''){
                    $.ajax({
                        type: 'GET',
                        data: {code:code},
                        url: "index.php?item-app-ajax-getShuiByKey",
                        dataType: 'json',
                        success: function (res) {
                            if(res.statusCode == 200){
                                suibian.html(res.data);
                            }else{
                                var data = {result: false, message: res.message};
                                $.zoombox.show('ajax', data);
                            }
                        }
                    })
                }
                $(this).next("div").slideDown();
            });

            $(".s_select").on("click", "li", function() {
                $(this).parent("ul").parent("div").siblings(".shui_sel").val($(this).text());
                $(this).parent("ul").parent("div").siblings("input[type=hidden]").val($(this).attr("id"));
                $(this).parent("ul").parent("div").hide();
            });


            //提交订单
            $('#btn').on('click', function() {
                var trip = '';
                var shuiisok = 0;
                if($('input[name="fukuan_code"]').val() == ''){
                    trip = '请选择付款条款代码';
                }
                if($('input[name="caigou_code"]').val() == ''){
                    trip = '请选择采购组';
                }
                if($('input[name="comp_code"]').val() == ''){
                    trip = '请选择公司';
                }
                $(".s_select").children("input[type=hidden]").each(function(){
                    if($(this).val() == ''){
                        shuiisok = 1;
                    }
                });
                if(trip != ''){
                    var data = {result: false, message: trip};
                    $.zoombox.show('ajax', data);
                    return false;
                }

                $.ajax({
                    type: 'POST',
                    data: $("#form1").serializeArray(),
                    url: "index.php?item-app-order3-index",
                    dataType: 'json',
                    success: function (res) {
                        if(res.statusCode == 200){
                            var data = {result: false, message: res.message};
                            $.zoombox.show('ajaxOK', data);
                            window.location.href = res.forwardUrl;
                        }else{
                            var data = {result: false, message: res.message};
                            $.zoombox.show('ajax', data);
                        }
                    }
                })

            });

            //-----增加收货地址----------------
            $("#addressbtn").click(function(){
                var receiver = $("#receiver").val();
                var provinces = $("#provinces").val();
                var cities = $("#cities").val();
                var areas = $("#areas").val();
                var addressinfo = $("#addressinfo").val();
                var zipcode = $("#zipcode").val();
                var phone = $("#phone").val();

                if (receiver==false) {
                	alert('请填写收货人姓名');
                	return false;
                }
                if (provinces==false) {
                	alert('请选择省份');
                	return false;
                }
                if (cities==false) {
                	alert('请选择市');
                	return false;
                }
                if (areas==false) {
                	alert('请选择地区');
                	return false;
                }
                if (addressinfo==false) {
                	alert('请选择详细地址');
                	return false;
                }
                if (zipcode==false) {
                	alert('请填写邮政编码');
                	return false;
                }
                if (phone==false) {
                	alert('请填收货人电话');
                	return false;
                }

                $.ajax({
		            type:'get',
		            url: 'index.php?item-app-order-addaddress&receiver='+receiver+'&provinces='+provinces+'&cities='+cities+'&areas='+areas+'&addressinfo='+addressinfo+'&zipcode='+zipcode+'&phone='+phone,
		            dataType:'JSON',
		            success:function(res){
		                if(res.statusCode == 200){
		                	
		                    $("#address_more").append("<li class='sel_addr' value='"+res.data.addressid+"'><span></span><span>"+res.data.province+"&nbsp;"+res.data.city+"&nbsp;"+res.data.area+"&nbsp;"+res.data.addressinfo+"&nbsp;&nbsp;"+res.data.addressinfo+"&nbsp;&nbsp;"+res.data.receiver+"&nbsp;&nbsp;"+res.data.phone+"</span><span class='del'><a class='btn confirm' href='index.php?item-app-order-deladdress&addressid='"+res.data.addressid+">删除</a></span></li>");

		                }else{
		                    alert('失败了');
		                }
		            },
		            error: function(e){
		                console.log(e);
		            }
		        })

            })



            //新增收货地址
            $("#add").click(function() {
				if ($(this).next(".new_add").is(":hidden")) {
					$(this).next(".new_add").show();
				} else {
					$(this).next(".new_add").hide();
				}
			})

            //选择收货地址
            $(".sel_addr").click(function(){
                $('#orderaddress').val($(this).val());
            })

        });
    </script>
</body>

</html>