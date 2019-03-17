<?php	
include 'conf.php';
require_once ("./lib/YopClient3.php");
 
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


 
function upload(){
	
	   
	   global $merchantNo;
	   global $parentMerchantNo;
	   global $private_key;
	   global $yop_public_key;
	     
       $request = new YopRequest("OPR:10014929805", $private_key, "https://open.yeepay.com/yop-center",$yop_public_key);
  
       $request->addParam("fileType", "IMAGE");
       $request->addParam("_file", $_REQUEST['fileURI']);
	   
       $response = YopClient3::upload("/rest/v1.0/file/upload", $request);
      // print_r($response);
      //取得返回结果
    $data=object_array($response);
 
    return $data;
 }
   
$array=upload();  
  
 if( $array['result'] == NULL)
 {
 	echo "error:".$array['error'];
  return;}
 else{
 $result= $array['result'] ;
 //var_dump($result['files'][0]);
}
?> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> 文件上传返回参数</title>
</head>
	<body>	
		<br /> <br />
		<table width="70%" border="0" align="center" cellpadding="5" cellspacing="0" style="border:solid 1px #107929">
			<tr>
		  		<th align="center" height="30" colspan="5" bgcolor="#6BBE18">
					文件上传返回参数
				</th>
		  	</tr>

			<tr >
				<td width="25%" align="left">&nbsp;文件上传总数量</td>
				<td width="5%"  align="center"> : </td> 
				<td width="45"  align="left"> <?php echo $result['total_count'];?> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">total_count</td> 
			</tr>

			<tr>
				<td width="25%" align="left">&nbsp;上传成功数量</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <?php echo $result['success_count'];?> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">success_count</td> 
			</tr>

						<tr>
				<td width="25%" align="left">&nbsp;处理结果</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <?php echo $result['message'];?></td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">message</td> 
			</tr>
			<tr>
				<td width="25%" align="left">&nbsp;文件信息如下</td>
				<td width="5%"  align="center"> : </td> 
				
			</tr>
			 
			<tr>
				<td width="25%" align="left">&nbsp;文件ID</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <?php echo $result['files'][0]['fileId'];?> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">fileId</td> 
			</tr>
			 
			 			<tr>
				<td width="25%" align="left">&nbsp;appKey</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <?php echo $result['files'][0]['appKey'];?> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">appKey</td> 
			</tr>
			 
			 		 			<tr>
				<td width="25%" align="left">&nbsp;文件类型</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <?php echo $result['files'][0]['fileType'];?> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">fileType</td> 
			</tr>
			 
			 			 		 			<tr>
				<td width="25%" align="left">&nbsp;文件名</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <?php echo $result['files'][0]['fileName'];?> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">fileName</td> 
			</tr>
						 		 			<tr>
				<td width="25%" align="left">&nbsp;文件大小</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <?php echo $result['files'][0]['fileSize'];?> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">fileSize</td> 
			</tr>			 		 			<tr>
				<td width="25%" align="left">&nbsp;文件地址</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <?php echo $result['files'][0]['fileLocation'];?> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">fileLocation</td> 
			</tr>			 		 			<tr>
				<td width="25%" align="left">&nbsp;暂存</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <?php echo $result['files'][0]['tempStorage'];?> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">tempStorage</td> 
			</tr>
				</tr>			 		 			<tr>
				<td width="25%" align="left">&nbsp;md5</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <?php echo $result['files'][0]['md5'];?> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">md5</td> 
			</tr>			 		 			<tr>
				<td width="25%" align="left">&nbsp;创建时间</td>
				<td width="5%"  align="center"> : </td> 
				<td width="35%" align="left"> <?php echo $result['files'][0]['createdDateTime'];?> </td>
				<td width="5%"  align="center"> - </td> 
				<td width="30%" align="left">createdDateTime</td> 
			</tr>		
			
	 

		</table>

	</body>
</html>
 