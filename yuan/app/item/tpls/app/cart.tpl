{x2;include:header}
<style>
.dis-select{border:1px solid #ff8a00!important;}
.closes{display: none;}
.di-style span{
    border:solid 1px #fff;
    padding:3px 20px;
}
.why-cartbg table .total {
    background-color: #fff;
}
input.form-control {
    height: 30px!important;
}
input[type="radio"], input[type="checkbox"] {
	
	
	color: #ccc;
    height: 1em;  
}
input[type="checkbox"]{
	-webkit-appearance:none;background-color: #fff;
	border:solid 1px #ccc;
}
input:checked{
	-webkit-appearance:none;
    background:url(app/core/styles/img/checked.png) no-repeat center;
    background-size: 12px;
    background-color: #fff;
    border:solid 1px #ccc;
    outline: none;
    }
.why-cartbg table .info td{
	padding: 10px 10px 10px 10px;
}
.why-cartbg table th{
	font-weight: 400;
}
.why-cartbg {
    background-color: #fff;
}
.why-cartbg table .info {
    background-color: #fff;
    border: solid 1px #ccc;
    border-radius: 4px;
    border-collapse:separate;border-radius: 6px;
    	
}
.lose{
    display:block;
    width:50px;
    height:20px;
    line-height: 20px;
    background:#ddd;
    color:#888;
    text-align: center;
    border-radius: 4px;
    margin-top:30px;
}
.valid{
    background: #f3f3f3!important;
    color:#aaa!important;

}


</style>
<body>

{x2;include:nav}
<div class="container why-cartbg" {x2;if:$isNull == 1}style="display: none;"{x2;else}style="display: block;"{x2;endif}>
	<form class="wrap" action="index.php?item-app-cart" method="post" id="form1">
		<table>
			<tr>
				<th width="7%" style="text-align: left;"><input type="checkbox" id="selectall" {x2;if:!$mycartall}checked{x2;endif}/><span class="l5">全选</span></th><th width="7%">商品图片</th><th width="30%">商品名称</th><th width="18%">规格</th><th width="12%">单价</th><th width="10%">数量</th><th width="10%">小计</th><th width="10%">操作</th>
			</tr>
            {x2;eval: v:number = 0}
            {x2;eval: v:price = 0}
            {x2;tree:$scarts,cart,cid}
			<tr>
				<td colspan="8" style="text-align: left;height:60px;">
                        <input name="test" type="checkbox"  value="{x2;$susers[v:key][userid]}" {x2;if:$susers[v:key][istrue]==2}checked{x2;endif} />
					
                    {x2;$susers[v:key]['company_name']}
                    {x2;if:$susers[v:key]['company_qq'] != ''}
                    <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin={x2;$susers[v:key]['company_qq']}&site=qq&menu=yes">
                       <img style="height:auto;width:16px;" border="0" src="app/core/styles/img/lx.png" alt="联系卖家" title="联系卖家"/>
                    </a>
                   {x2;endif}
                </td>

			</tr>
            {x2;tree:v:cart,ct,ctid}
			<tr class="info{x2;if:v:ct['isvalid'] == '0'} {x2;endif}">
				<td style="vertical-align: top;text-align: left;">{x2;if:v:ct['number'] <= v:ct['itemnumber']}<input type="checkbox" autocomplete="off" value="1" class="checkitem" name="args[{x2;v:ct['cartid']}][cartstatus]"{x2;if:v:ct['cartstatus']} checked{x2;endif}/>{x2;endif}</td>
				<td style="vertical-align: top;">
					<img src="{x2;v:ct['itemthumb']}" height="80" width="80"/>
				</td>
				<td style="text-align:left;vertical-align:top;">
					<a href="index.php?item-app-item&goodsid={x2;v:ct[goodsid]}" target="_blank">{x2;v:ct['goodstitle']}</a>{x2;if:v:ct['number'] > v:ct['itemnumber']}【<span color="red">库存不足</span>】{x2;endif}
					<br />

				</td>
				<td style="vertical-align: top;text-align: left;padding-left: 50px;padding-right: 0px;">
                    {x2;tree:$mfields[$categories[v:ct['goodscatid']]['catmoduleid']],field,fid}
                    {x2;if:v:field['fieldsystem']}
                    {x2;v:field['fieldtitle']} : {x2;v:ct[v:field['field']]}<br />
                    {x2;endif}
                    {x2;endtree}
				</td>
				<td style="vertical-align:top;" class="lis_t">
					<label {x2;if:v:ct['isvalid'] == '0'}style="background: papayawhip;width: 100%;"{x2;endif}>&yen;{x2;v:ct['itemprice']}</label>
					{x2;if:v:ct['isvalid'] == '0'}
                    <!--
					<div class="show_b" style="background: orange;color: #fff;font-size: 12px;">非框架协议物资&nbsp; <img style="width: 11px;opacity: 0.6;" src="app/core/styles/images/down_sss.png"></div>
					<div class="show_s" style="display:none;position: absolute;background:#fff;z-index:100;border:1px solid #ccc;padding: 10px 7px;text-align: left;line-height: 18px;color: #bbb;">此商品所属框架协议已失效，<br/>将以公开价交易</div>
					-->
					{x2;endif}
				</td>
				<td style="vertical-align: top;" class="cl-num">
					<div class="input-group">
						<a class="input-group-addon adddel" rel="remove">-</a>
						<input type="text" class="form-control text-center changeitem" style="padding:6px 2px;width:40px;" id="numbers" value="{x2;v:ct['number']}" placeholder="1"  name="args[{x2;v:ct['cartid']}][number]" needle="needle" datatype="number"  onkeyup="value=value.replace(/[^0-9]/g,'')">
						<a class="input-group-addon adddel" rel="add">＋</a>
						<!--<a class="input-group-addon">－</a>-->

					</div>
					<div style="height:32px; line-height:16px; margin-top:10px; color:#f00; text-align:left;">{x2;if:v:ct['limit_number'] != 0}起订量最少为{x2;v:ct['limit_number']}件{x2;endif}</div>
				</td>
				<td style="vertical-align:top;"><label class="color-red">&yen;{x2;eval: echo v:ct['itemprice']* v:ct['number']}</label></td>
				<td style="vertical-align:top;"><!--<a>收藏</a></br>--><a class="confirm" href="index.php?item-app-cart-delcartitem&cartid={x2;v:ct['itemid']}">删除</a></td>
                {x2;if:v:ct['cartstatus']}
                {x2;eval: v:number = v:number + v:ct['number']}
                {x2;eval: v:price = v:price + v:ct['itemprice']*v:ct['number']}
                {x2;endif}
			</tr>
            {x2;endtree}
            {x2;endtree}
			<tr><td colspan="8"></td></tr>

			<tr class="total">
				<td colspan="8" style="text-align: right">
					<div><span class="allnumber">{x2;v:number}</span>件商品金额总计：&yen;<span class="allcartprice">{x2;v:price}</span></div><br>
					<em class="clearfix"></em>

					<p>应付金额（运费提付）：<b class="color-red" style="font-size: 24px;">&yen;<span class="allcartprice">{x2;v:price}</span></b></p>
                    <input type="hidden" name="tidycart" id="tidycart" value="1"/>
					<input type="hidden" name="pnumber" id="pnumber" value="{x2;v:number}"/>
					<button style="border-radius: 2px;margin-top: 20px;" class="why-btn-big-green" type="button" onclick="loadXMLDoc()">平台结算</button>
					<button class="why-btn-big-green" style="background:none;color:#666666;border: 1px solid #979797;border-radius:2px;margin-top: 20px;">spa结算</button>
				</td>
			</tr>
		</table>
	</form>
</div >
 <!--购物车为空得时候显示-->

<div style="position: relative;height:540px; {x2;if:$isNull == 1}display: block;{x2;else}display: none;{x2;endif}">
   <div style="position: absolute;left:50%;transform: translate(-50%);top:50px;">
	<img src="app/core/styles/img/gwc.png" style="display: inline-block">
    <p style="display: inline-block;font-size: 20px;">购物车还是空的呢！快去采购吧！</p>
   </div>
</div>
{x2;include:footer2}
<script type="text/javascript">
    yuanlai = $('#numbers').val()
    $('#numbers').keyup(function(){
        var _val = $(this).val()
        if(_val==0) {
            $(this).val(1);
        };
    })
    //控制显示隐藏
    $(".lis_t .show_b").hover(function(){
    	$(this).parent().find($(".show_s")).show();
    	$(this).children("img").attr("src","app/core/styles/images/top_sss.png")
    },function(){
    	$(this).parent().find($(".show_s")).hide();
    	$(this).children("img").attr("src","app/core/styles/images/down_sss.png")
    })
    //http://m.tb.cn/h.33iSY5K

//BTB 结算 方式 页面
var cart = $("#tidycart").val();
var number = $("#pnumber").val();

// var urld = "index.php?user-company-yeeorder&tidycart=" + cart +'&pnumber=' + number;
    function loadXMLDoc()
    {
        $.ajax({
        type: "get",
        url: "index.php?user-company-yeeorder&tidycart=" + cart +'&pnumber=' + number,
        dataType: "json",
        success:function(res){     
           if(res.statusCode == 200){
              window.location.href = 'index.php?user-company-yeeorder-orders';
           }else{
              var data = {
                  result: false,
                  message: res.message
                 };
              $.zoombox.show('ajax', data);
              // alert("请勾选商品");
           }
         }
       })
        //alert(urls);
        // window.location.href = urld;
    }

    $(".di-style").on("mouseover",function () {
        $(this).children($(".closes")).show()
    })
    $(".di-style").on("mouseout",function () {
        $(".closes").hide()
    })
    $('.di-style').find('span').on('click',function(){
        var _this = $(this);
        _this.parents('.di-style').parent().find('span').removeClass('active');
        _this.addClass('active');
        if(_this.attr('data-element'))
        {
            $('#'+_this.attr('data-element')).val(_this.attr('data-value'));
        }
    });

    $(function(){
        //失效商品
        $(document).on("click",".valid a",function(){
            return false;
        })
        //加数量
        $('#plus').click(function(){

        });
        $('.adddel').bind("click",function(){
            var _this = this;
            var p = $(_this).parent().find("input");
            if($(_this).attr('rel') == 'add')
            {
                p.val(parseInt(p.val())+1);
                $.getJSON("index.php?item-app-cart-tidy&"+p.serialize()+'&userhash='+Math.random(),function(data){
                    if(data.statusCode == 200)
                        window.location.reload();
                    else
                    {
                        $.zoombox.show('ajax',data);
                        p.val(data.errnum);
                    }
                });
            }
            else if($(_this).attr('rel') == 'remove')
            {
                if(parseInt(p.val()) > 1)
                {
                    p.val(parseInt(p.val())-1);

                    $.getJSON("index.php?item-app-cart-tidy&"+p.serialize()+'&userhash='+Math.random(),function(data){
                        if(data.statusCode == 200)window.location.reload();

                        else
                        {
                            $.zoombox.show('ajax',data);
                            p.val(data.errnum);
                        }
                    });
                }
            }
        });
        $(".changeitem").bind("blur",function(){var _this = $(this);$.getJSON("index.php?item-app-cart-tidy&"+_this.serialize()+'&userhash='+Math.random(),function(data){if(data.statusCode == 200)window.location.reload();else {$.zoombox.show('ajax',data);_this.val(data.errnum);}});})
        $(".checkitem").bind("click",function(){
            var _this = $(this);
            if(_this.is(':checked'))
                var query = _this.attr('name')+'=1';
            else
                var query = _this.attr('name')+'=0';
            $.getJSON("index.php?item-app-cart-tidy&"+query+'&userhash='+Math.random(),function(data){if(data.statusCode == 200)window.location.reload();else {$.zoombox.show('ajax',data);}});
        });
    });

    /**
     * [购物车的全选功能]
     * @Author   Zhangjianchao
     * @DateTime 2018-08-27
     */
    $("#selectall").click(function(){
        var url = 'index.php?item-app-cart';
        if ($(this).prop("checked") == true){
            //全选
            $.ajax({
                type:'get',
                url: "index.php?item-app-cart-selectall&type=1",
                dataType:'JSON',
                success:function(res){
                    if(res.statusCode == 200){
                         window.location.href = url;
                    }else{
                        alert('网络异常请稍后重试');
                    }
                },
                error: function(e){
                    console.log(e);
                }
            })

           
        } else{
            //全不选
            $.ajax({
                type:'get',
                url: "index.php?item-app-cart-selectall&type=2",
                dataType:'JSON',
                success:function(res){
                    if(res.statusCode == 200){
                         window.location.href = url;
                    }else{
                        alert('网络异常请稍后重试');
                    }
                },
                error: function(e){
                    console.log(e);
                }
            })
        }
    });
    
     $("body").on("click","input:checkbox[name='test']",function(){
        var sellerid=$(this).val();
        var url = 'index.php?item-app-cart';
         if($(this).is(':checked')) {
             
             $.ajax({
                type:'get',
                url: "index.php?item-app-cart-comselect&type=1&sellerid="+sellerid,
                dataType:'JSON',
                success:function(res){
                    if(res.statusCode == 200){
                         window.location.href = url;
                    }else{
                        alert('网络异常请稍后重试');
                    }
                },
                error: function(e){
                    console.log(e);
                }
            })
         }else{
             
             $.ajax({
                type:'get',
                url: "index.php?item-app-cart-comselect&type=2&sellerid="+sellerid,
                dataType:'JSON',
                success:function(res){
                    if(res.statusCode == 200){
                         window.location.href = url;
                    }else{
                        alert('网络异常请稍后重试');
                    }
                },
                error: function(e){
                    console.log(e);
                }
            })
         }
     })
</script>
</body>

</html>