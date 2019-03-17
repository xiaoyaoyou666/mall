layui.use(['laydate', 'form'], function() {
	    var laydate = layui.laydate
		laydate.render({
	    elem: '#test1'//指定元素
		,type: 'datetime'
		});
		laydate.render({
		elem: '#test2'//指定元素
		,type: 'datetime'
		});
	});
			//全选和反选
                //实现全选反选
                $("#checkall").on('click', function() {
                    $("tbody tr td input:checkbox").prop("checked", $(this).prop('checked'));
                });
			//全选
			$("#qx").click(function(){
				$("tbody tr td input:checkbox").prop("checked", $(this).prop('checked'));
					$("#checkall").prop("checked", true)
			});
			
			//反选
			$("#fx").click(function(){ 
				$("input.checkedres").each(function(){ 
					if($(this).prop("checked")) { 											
							$(this).removeProp("checked"); 
							$("#checkall").prop("checked", false)
					} else {
						$(this).prop("checked","true"); 
   					} 
				}) 
			}) 			
		function selectAll(){ 
    		if ($("#checkall").prop("checked")) {          
        			$("input[type='checkbox'][name='delids[{x2;v:order['ordersn']}]']").prop("checked",true);//全选
        			$("#qx").prop("checked", true)
   			 } else {            
        		$("input[type='checkbox'][name='delids[{x2;v:order['ordersn']}]']").prop("checked",false); 
        		//取消全选
        		$("#qx").prop("checked", false)
    		}  
		} 
		function setSelectAll(){  
    			//当没有选中某个子复选框时，SelectAll取消选中  
    		if ($(".checkedres").checked) {  
        		$("#checkall").prop("checked", true);
        		
   			 }  
    			var chsub = $("input[type='checkbox'][name='delids[{x2;v:order['ordersn']}]']").length; //获取subcheck的个数  
    			var checkedsub = $("input[type='checkbox'][name='delids[{x2;v:order['ordersn']}]']:checked").length; //获取选中的subcheck的个数  
    			if (checkedsub == chsub) {  
        			$("#checkall").prop("checked", false);  
    			}   			
    	}
		  $("tbody input:checkbox").on('click', function() {
                    //当选中的长度等于checkbox的长度的时候,就让控制全选反选的checkbox设置为选中,否则就为未选中
                    if($("tbody input:checkbox").length === $("tbody input:checked").length) {
                        $("#checkall").prop("checked", true);
                        $("#qx").prop("checked", true)
                    } else {
                        $("#checkall").prop("checked", false);
                        $("#qx").prop("checked", false)
                    }
                });
		  		  
		  //批量删除
		         $('#btn_cores').on('click',function(){	
                    var isconfirm = confirm('确定要删除吗');
                    if(isconfirm){
                        var orderIds = getCheckedOrders();
                        $.ajax({
                            type:'get',
                          	url: "index.php?core-master-audit-delall&delids="+orderIds+"",
                            dataType:'JSON',
                            async:true,
                            success:function(res){
                                if(res.statusCode = 200){
//                              	console.log(res);
                               	
                                    alert(res.message);                                  
                                    window.location.reload();
                                    return false;                                   
                                }else if(res.statusCode = 300){
                                	alert(res.message); 
                                }else{
//                              	console.log(res.delids)
//                              	var data = {result: false, message: res.message};
//                                  $.zoombox.show('ajax', data);
                                     return false;
                                }
                            }
                            
                        })
                    }

                })
		         
		        function getCheckedOrders(){
		        	var checkeds = [];
		        	$("input.checkedres").each(function(){ 		        			
						if($(this).prop("checked")) {
							checkeds.push($(this).closest("tr").find("td:eq(2)").text())
						}
					})
		        	return checkeds;
		        }

//点击切换变换












