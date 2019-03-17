<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
    <link rel="stylesheet" href="app/core/styles/admin/bootstrap.css" />
    <link rel="stylesheet" href="app/core/styles/admin/checkbox.css" />
    <link rel="stylesheet" href="app/core/styles/admin/font-awesome.css" />
    <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/friendlink.css" />
    <link rel="stylesheet" href="app/core/styles/admin/indent.css" />
    <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
    <link rel="stylesheet" href="app/core/styles/admin/index.css">
    	<link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css" />
    <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
    <!--<script type="text/javascript" src="app/core/styles/admin/js/jquery-ui.min.css"></script>-->
     <!--<link rel="stylesheet" href="app/core/styles/css/admin/jquery-ui.min.css">-->
     <script src="app/core/styles/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/layui/layui.js"></script>
    <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
    <!---->
    <script type="text/javascript">
    	$(document).ready(function(){
			$('.check_ss').find('input[type=checkbox]').bind('click', function(){
			$('.check_ss').find('input[type=checkbox]').not(this).attr("checked", false);
		});
	});

    </script>
</head>
<style type="text/css">
	.model_s{padding: 0;}
	/*#myModal{display: block;}*/
	.checkbox label::before {
    content: "";
    display: inline-block;
    position: absolute;
    width: 20px;
    height: 20px;
    left: 0;
    margin-left: -20px;
    border: 1px solid #cccccc;
    border-radius: 3px;
    background-color: #fff;
    -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
    -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
    transition: border 0.15s ease-in-out, color 0.15s ease-in-out;

}

.center_item{padding: 20px 60px;color: #7f7f7f;}
.center_item .item_input{line-height: 46px;}
.memo{margin-top: 25px;position: relative;}
.memo .txt{width: 360px;height: 170px;resize: none;border-radius: 5px;padding: 4px;border: 1px solid #eaeaea;}
.memo .byte{position: absolute;top:142px;right: 40px;color: #858585;}

.check_class{width: 400px;height: 62px;display: inline-block;}
.check_class li{width: 33.3%;float:left;line-height: 23px;height: 40px;color: #949494;}
.check_class li span{display: inline-block;}
.check_class li span input[type="checkbox"]{width: 20px!important;height:20px!important;}
.check_ss{margin: 0!important;}
</style>
<body>
<header>{x2;include:nav2}</header>

<div class="goods" id="content">
    <div class="g-content">
        <div class="head">当前位置：<a href="index.php?user-master-user">订单中心</a>&nbsp;>&nbsp;<span>订单详情</span></div>
        <!--content-->
        <p class="good">订单信息详情</p>
        <div class="present">
        	<div class="presents">
        		<p class="current">当前订单（<span class="codes">13123112312</span>）状态：<span class="state">已关闭</span><span class="cause">关闭原因：<i>买家取消交易</i></span></p>
        		<p class="currents">买方：<span class="buyer">wo8848</span>联系电话：<span class="telphone">15510195634</span>卖方：<span class="user">张三</span>联系电话：<span class="telphone">183524984</span></p>
        	</div>
        	<div class="layui-btn  layui-btn-sm alter btn btn-primary btn-lg"  data-toggle="modal" data-target="#myModal">更改状态</div>
        </div>
        
        
        
        <table class="layui-table goods-table table_l" lay-even lay-size="lg" id="friendLinkTable">
            <thead>
                <tr>
                    <th>商品</th>
                    <th>规格</th>
                    <th>供应商</th>
                    <th>单价</th>
                    <th>小计</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="table_a" style="width: 236px;height: 80px;">
                    	<div class="shop_img">
                    		<img src="app/core/styles/images/shop_img.png" />
                    	</div>
                    	<p class="good_state">变压器</p>
                    </td>
                    <td>do330</td>
                    <td>北京天润集团</td>
                    <td>10000</td>
                    <td>10000</td>
                </tr>
                <tr style="background: #fff;">
                	<td colspan="5" style="text-align: left;">运费：<span style="margin-left: 152px;">99999</span></td>
                </tr>
                <tr style="background: #f2f2f2;">
                	<td style="text-align: right;color: #159587;" colspan="5">订单实收金额（元）：<span>21000</span></td>
                </tr>
            </tbody>
        </table>
        <p class="good">订单信息详情</p>
        <div class="line_item">
        	<p>收货地址：<span class="location_url">北京天润国际中心</span><span class="user_name">张三</span><span class="phone_number">3434343234242</span></p>
        	<p>物流公司：<span class="location_url">顺丰快递</span></p>
        	<p>物流单号：<span class="location_url">2324324343</span></p>
        	<p>支付方式：<span class="location_url">货到付款</span></p>
        	<p>买家留言：<span class="location_url">请尽快发货！</span></p>
        	<p>评价状态：<span class="location_url">买家已评价、双方已评价</span></p>
        </div>
        <ul class="pagination pull-right">
            {x2;$data['pages']}
        </ul>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 564px;">
            <div class="modal-header model_s">
                <!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>-->
                <h4 class="modal-title" id="myModalLabel" style="background: #f2f2f2;display: block;height: 38px;line-height: 38px;padding-left: 16px;color: #828282;">
                    订单备注
                </h4>
            </div>
            <div>
            	<!--<div class="checkbox checkbox-primary">
            		<input id="checkbox2" class="styled" type="checkbox" />
            		<label for="checkbox2"></label>
            	</div>-->
            </div>
            <!--商品信息-->
            <div class="center_item">
            	<p class="item_input">订单编号：<span>4324234324324</span></p>
            	<p class="item_input">成交时间：2017-03-29 15:03：48</p>
            	<p class="item_input">订单实收款（元）：21000</p>
            	<p class="check_all"><span style="float:left">状态：</span><ul class="check_class">
            		<li><span class="checkbox checkbox-info check_ss">
                        	<input id="checkbox1" class="styled" type="checkbox">
                       		<label for="checkbox1">待买家确认</label>
                        </span></li>
            		<li><span class="checkbox checkbox-info check_ss">
            				<input id="checkbox2" class="styled" type="checkbox"  value="option1">
                       		<label for="checkbox2">待买家发货</label>
            		</span></li>
            		<li><span class="checkbox checkbox-info check_ss">
            				<input id="checkbox3" class="styled" type="checkbox"  value="option1">
                       		<label for="checkbox3">待买家收货</label>
            		</span></li>
            		<li><span class="checkbox checkbox-info check_ss">
            				<input id="checkbox4" class="styled" type="checkbox"  value="option1">
                       		<label for="checkbox4">买家已发货</label>
            		</span></li>
            		<li><span class="checkbox checkbox-info check_ss">
            				<input id="checkbox5" class="styled" type="checkbox"  value="option1">
                       		<label for="checkbox5">已退/换货</label>
            		</span></li>
            		<li><span class="checkbox checkbox-info check_ss">
            				<input id="checkbox6" class="styled" type="checkbox"  value="option1">
                       		<label for="checkbox6">交易关闭</label>
            		</span></li>
            	</ul></p>
            	
            	<p class="memo"><span style="float: left;">备忘录：</span>
            		<textarea class="txt" id="words"></textarea>
            		<span class="byte">最多还可输入<i id="word">200</i>字</span></p>
            </div>          	
            <div class="modal-footer" style="float: right;border: none;margin-right: 73px;">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消
                </button>
                <button type="button" class="btn  layui-btn  layui-btn-sm">
                    确定
                </button>
            </div>
            <div style="clear: both;"></div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
 $(function(){
	$(' #words').keyup(function(){      //输入字符后键盘up时触发事件
		var txtLeng = $(' #words').val().length;//把输入字符的长度赋给txtLeng
			//拿输入的值做判断
		if( txtLeng>200 ){  
			//输入长度大于300时span显示0
			$(' #word').text(' 0 '); 
				//截取输入内容的前300个字符，赋给fontsize
				var fontsize = $('#words').val().substring(0,200);
				//显示到textarea上
				$(' #words').val( fontsize );
				}else{
				//输入长度小于300时span显示300减去长度
				$('#word').text(200-txtLeng);  
				}
  			});
  	});
  	 function changeState(el) {
        if (el.readOnly) el.checked=el.readOnly=false;
        else if (!el.checked) el.readOnly=el.indeterminate=true;
    }
</script>
</html>