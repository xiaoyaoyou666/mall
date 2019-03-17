


   
<!doctype html>
<html>
<head>

	
	<script type="text/javascript">
		function skipPage(curpage, pages){
			if(curpage < 1)
				curpage = 1;
			if(curpage > pages)
				curpage = pages;
			document.getElementById("pageNo").value = curpage;
			document.getElementById("multiOrderQueryForm").submit();
		}
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大算标准版接口示例</title>
</head>
<body>
<div>
	<form action="sendMultiOrderQuery.php" id="multiOrderQueryForm">
		<input type="hidden" size="80" id="pageNo" name="pageNo" value="1" >
		<input type="hidden" size="80" id="pageSize" name="pageSize" value="20" >
		<table align="center" style="border:solid 1px #107929; margin-top: 40px; width: 90%">
			<tr>
			  	<th align="center" height="30" colspan="5" bgcolor="#6BBE18">
					批量订单查询接口
				</th>
			</tr>
			<tr height="50">
				<td width="25%" align="center">订单状态(status)&nbsp;:</td>
				<td width="25%" align="left"><input type="text" size="40" name="status" value="" ></td>
				<td width="25%" align="center">请求开始时间(requestDateBegin)&nbsp;:<span style="color:red" >&nbsp;*</span></td>
				<td width="25%" align="left"><input type="text" size="40" name="requestDateBegin" value="" placeholder="格式：yyyy-MM-dd HH:mm:ss" required></td>
			</tr>
			<tr height="50">
				<td width="25%" align="center">请求结束时间(requestDateEnd)&nbsp;:<span style="color:red" >&nbsp;*</span></td>
				<td width="25%" align="left"><input type="text" size="40" name="requestDateEnd" value="" placeholder="格式：yyyy-MM-dd HH:mm:ss" required></td>
				<td colspan="2" align="right"><input style="font-size: medium;" type="submit" onclick="skipPage(1,1)" value="查询"></td>
			</tr>
		</table>
	</form>
	<table align="center" style="border:solid 1px #107929;text-align: center;width: 90%;table-layout: fixed; word-wrap: break-word;">
		<tr bordercolor="black">
			<td width="3%">序号<br>NO</td>
			<td width="7%">收款商户编号<br>merchantNo</td>
			<td width="10%">商户订单号<br>orderId</td>
			<td width="10%">易宝流水号<br>uniqueOrderNo</td>
			<td width="5%">订单状态<br>status</td>
			<td width="7%">订单金额<br>orderAmount</td>
			<td width="7%">实付金额<br>payAmount</td>
			<td width="7%">用户手续费<br>customerFee</td>
			<td width="7%">商户手续费<br>merchantFee</td>
			<td width="10%">请求时间<br>requestDate</td>
			<td width="10%">支付时间<br>paySuccessDate</td>
			<td width="15%">商品信息<br>goodsParamExt</td>
			<td width="10%">自定义对账备注<br>memo</td>
		</tr>
		
		
		
		
		
		
		<tr>
		<td colspan="12" align="right">
				第1页 共<span id="pages">1</span>页 
				<input type="button" onclick="skipPage(1,1)" value="首页">&nbsp;
				<input type="button" onclick="skipPage(0,1)" value="上一页">&nbsp;
				<input type="button" onclick="skipPage(2,1)" value="下一页">
				<input type="button" onclick="skipPage(1,1)" value="末页">
				<input type="text" size="5" id="gopage">
				<input type="button" onclick="skipPage(document.getElementById('gopage').value,1)" value="GO">
		</td>
		</tr>
		</table>
	</div>
</body>
</html>