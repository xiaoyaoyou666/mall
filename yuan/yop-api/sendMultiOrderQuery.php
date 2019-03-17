<?php	
include 'conf.php';
require_once ("./lib/YopClient3.php");
 
$data=array();
$data['parentMerchantNo']=$parentMerchantNo;
$data['merchantNo']=$merchantNo;
$data['requestDateBegin']=$_REQUEST['requestDateBegin'];
$data['requestDateEnd']=$_REQUEST['requestDateEnd'];
$data['pageNo']=$_REQUEST['pageNo'];
$data['pageSize']=$_REQUEST['pageSize']; 
 
$hmacstr = hash_hmac('sha256', toString($data), $hmacKey, true);
$hmac = bin2hex($hmacstr);
 
function object_array($array) { 
    if(is_object($array)) { 
        $array = (array)$array; 
     } if(is_array($array)) { 
         foreach($array as $key=>$value) { 
             $array[$key] = object_array($value); 
             } 
     } 
     return $array; 
}
 #将参数转换成k=v拼接的形式
function toString($arraydata){
        $Str="";
        foreach ($arraydata as $k=>$v){
           $Str .= strlen($Str) == 0 ? "" : "&";
            $Str.=$k."=".$v;
        }
        return $Str;
    }



function multiOrderQuery($hmac){
     global $merchantNo;
	   global $parentMerchantNo;
	   global $private_key;
	   global $yop_public_key;
	     
    $request = new YopRequest("OPR:10014929805", $private_key, "https://open.yeepay.com/yop-center",$yop_public_key);
    $request->addParam("parentMerchantNo", $parentMerchantNo);
    $request->addParam("merchantNo", $merchantNo);
    $request->addParam("status", $_REQUEST['status']);
    $request->addParam("requestDateBegin", $_REQUEST['requestDateBegin']);
    $request->addParam("requestDateEnd", $_REQUEST['requestDateEnd']);
    $request->addParam("pageNo", $_REQUEST['pageNo']);
    $request->addParam("pageSize", $_REQUEST['pageSize']); 
    $request->addParam("hmac",$hmac);
    $response = YopClient3::post("/rest/v1.0/sys/trade/multiorderquery", $request);
    if($response->validSign==1){
        echo "返回结果签名验证成功!\n";
    }
    //取得返回结果
    $data=object_array($response);
    
    return $data;
    
 }
  $array=multiOrderQuery($hmac);  
 if( $array['result'] == NULL)
 {
 	echo "error:".$array['error'];
  return;}
 else{
 $result= $array['result'] ;
  //var_dump($result);
}
?> 




   
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
		<input type="hidden" size="80" id="pageNo" name="pageNo" value="<?php echo $_REQUEST['pageNo'] ?>" >
		<input type="hidden" size="80" id="pageSize" name="pageSize" value="<?php echo $_REQUEST['pageSize'] ?>" >
		<table align="center" style="border:solid 1px #107929; margin-top: 40px; width: 90%">
			<tr>
			  	<th align="center" height="30" colspan="5" bgcolor="#6BBE18">
					批量订单查询接口
				</th>
			</tr>
			<tr height="50">
				<td width="25%" align="center">订单状态(status)&nbsp;:</td>
				<td width="25%" align="left"><input type="text" size="40" name="status" value="<?php echo $_REQUEST['status'] ?>" ></td>
				<td width="25%" align="center">请求开始时间(requestDateBegin)&nbsp;:<span style="color:red" >&nbsp;*</span></td>
				<td width="25%" align="left"><input type="text" size="40" name="requestDateBegin" value="<?php echo $_REQUEST['requestDateBegin'] ?>" placeholder="格式：yyyy-MM-dd HH:mm:ss" required></td>
			</tr>
			<tr height="50">
				<td width="25%" align="center">请求结束时间(requestDateEnd)&nbsp;:<span style="color:red" >&nbsp;*</span></td>
				<td width="25%" align="left"><input type="text" size="40" name="requestDateEnd" value="<?php echo $_REQUEST['requestDateEnd'] ?>" placeholder="格式：yyyy-MM-dd HH:mm:ss" required></td>
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
		<?php
		
		$pagecount=ceil($result['totalRecords']/$_REQUEST['pageSize']);
		$NOcount=0+$_REQUEST['pageSize']*($_REQUEST['pageNo']-1);
		foreach($result['orderList'] as $value)
		{
			$NOcount++;
		?>
		<tr>
					<td><?php echo $NOcount ?></td>
					<td><?php echo $value['merchantNo'] ?></td>
					<td><?php echo $value['orderId'] ?></td>
					<td><?php echo $value['uniqueOrderNo'] ?></td>
					<td><?php echo $value['status'] ?></td>
					<td><?php echo $value['orderAmount'] ?></td>
					<td><?php echo $value['payAmount'] ?></td>
					<td><?php echo $value['customerFee'] ?></td>
					<td><?php echo $value['merchantFee'] ?></td>
					<td><?php echo $value['requestDate'] ?></td>
					<td><?php echo $value['paySuccessDate'] ?> </td>
					<td><?php  if (empty($value['goodsParamExt'])) {echo "";} else {echo str_replace ( "\\", "", str_replace ( "null", "\"\"", preg_replace ( '#\\\u(([0-9a-f]+?){4})#ie', "iconv('UCS-2BE', 'UTF-8', pack('H4', '\\1'))", $value['goodsParamExt'] ))); }?></td>
					<td><?php  if (empty($value['memo'])) {echo "";} else {echo preg_replace("#\\\u([0-9a-f]{4})#ie", "iconv('UCS-2BE', 'UTF-8', pack('H4', '\\1'))", json_encode($value['memo'])), "\n";  }?></td>
				</tr>
		
		
		<?php
		}
		?>
		
		
		<tr>
		<td colspan="12" align="right">
				第<?php echo $_REQUEST['pageNo'] ?>页 共<span id="pages"><?php echo $pagecount ?></span>页 共<?php 
				if (empty($result['totalRecords'])) {echo "0";} 
				else { echo $result['totalRecords'];}?>条记录
				<input type="button" onclick="skipPage(1,<?php echo $pagecount ?>)" value="首页">&nbsp;
				<input type="button" onclick="skipPage(<?php echo $_REQUEST['pageNo']-1 ?>,<?php echo $pagecount ?>)" value="上一页">&nbsp;
				<input type="button" onclick="skipPage(<?php echo $_REQUEST['pageNo']+1 ?>,<?php echo $pagecount ?>)" value="下一页">
				<input type="button" onclick="skipPage(<?php echo $pagecount ?>,<?php echo $pagecount ?>)" value="末页">
				<input type="text" size="5" id="gopage">
				<input type="button" onclick="skipPage(document.getElementById('gopage').value,<?php echo $pagecount ?>)" value="GO">
		</td>
		</tr>
		</table>
	</div>
</body>
</html>