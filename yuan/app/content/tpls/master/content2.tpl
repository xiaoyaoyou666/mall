<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
        <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
		<title>banner位管理</title>
		
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/jquery-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap-treeview.css" />
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/datetimepicker.css" />
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
        <link rel="stylesheet" href="app/core/styles/admin/index.css">
        <link rel="stylesheet" href="app/core/styles/admin/friendlink.css" />
       
		<script src="app/core/styles/js/jquery.min.js"></script>
		<script src="app/core/styles/js/jquery-ui.min.js"></script>
		<script src="app/core/styles/js/bootstrap.min.js"></script>
		<script src="app/core/styles/js/bootstrap-datetimepicker.js"></script>
		<script src="app/core/styles/js/all.fine-uploader.min.js"></script>
		<script src="app/core/styles/js/ckeditor/ckeditor.js"></script>
		<script src="app/core/styles/js/plugin.js"></script>
		<script src="app/core/styles/js/bootstrap-treeview.js"></script>
		<script src="app/core/styles/admin/layui/layui.js"></script>
		<script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
		<style>
			input {
				width: 30px;
			}
			
			
			.modal-dialog {
				width: 500px!important;
			}


			.imgs{  
				cursor: pointer;  
				transition: all 0.6s;  
			}  
			.imgs:hover{  
				transform: scale(6);  
			}
			table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}

		</style>
	</head>
	
        
    
	<body>
		<header>
		{x2;include:nav2}
		</header>
		<div class="layui-row" id="content">
            <div class="g-content">
            <div class="head">当前位置：<a href="index.php?content-master-contents">系统管理</a>&nbsp;>&nbsp;banner位管理</div>
			<div class="layui-col-sm12" >
			<div class="add-link"><a class="layui-btn  layui-btn-sm" style="padding:0 10px" href="index.php?content-master-contents-add"><i class="layui-icon">&#xe654;</i> 新增</a></div>
				<!--选项卡-->
				<div class="layui-tab">
					<ul class="layui-tab-title">
						<li class="layui-this">首页banner</li>
						<li>网格超市banner</li>

					</ul>
					<div class="layui-tab-content">
						<!--第一个选项卡-->
						<div class="layui-tab-item layui-show">
							<table class="layui-table" >
								<thead>
									<tr>
										<th>ID</th>
										<th>图片</th>
										<th>排序</th>
										
										<th>名称</th>
										<th>链接</th>
										<th>上架时间</th>
										<td>是否显示</td>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								{x2;tree:$contents1['data'],content1,cid}
									<tr>
										<td>{x2;v:content1[contentid]}</td>
										<td><img src="{x2;v:content1[contentthumb]}" width="40" height="40" class="imgs"></td>
										<td><input type="text" value="{x2;v:content1['contentsequence']}" onchange="updateSort('{x2;v:content2[contentid]}',this)" onkeyup="value=value.replace(/[^\d]/g,'')"></td>
										<td>{x2;v:content1['contenttitle']}</td>
										<td>{x2;v:content1['contentlink']}</td>
										<td>{x2;date:v:content1['contentinputtime'],'y-m-d'}</td>
										<td>
										<img width="20" height="20" src="app/core/styles/images/{x2;if:v:content1['contentstatus']}yes.png{x2;else}cancel.png{x2;endif}" onclick="changeTableVal('{x2;v:content1[contentid]}',this)"/>
										
										</td>
										<td>
											<a href="index.php?content-master-contents-edit&catid={x2;v:content1['contentcatid']}&contentid={x2;v:content1['contentid']}&page={x2;$page}{x2;$u}"><button class="layui-btn layui-btn-xs layui-btn-radius" data-toggle="modal" data-target="#myModal"><i class="layui-icon ">&#xe642;</i>编辑</button></a>
											
											<a class="btn confirm" href="index.php?content-master-contents-del&catid={x2;v:content1['cncatid']}&contentid={x2;v:content1['contentid']}&page={x2;$page}{x2;$u}" title="删除">
											<button type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger deluser" value="{x2;v:user['userid']}"><i class="layui-icon ">&#xe640;</i>删除</button></a>

										</td>
									</tr>
								{x2;endtree}
								</tbody>
							</table>
						</div>
						<!--第二个选项卡-->
						<div class="layui-tab-item">
							<table class="layui-table">
								<thead>
									<tr>
										<th>ID</th>
										<th>图片</th>
										<th>排序</th>
										<th>名称</th>
										<th>链接</th>
										<th>上架时间</th>
										<td>是否显示</td>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									{x2;tree:$contents2['data'],content2,cid}
									<tr>
										<td>{x2;v:content2['contentid']}</td>
										<td><img src="{x2;v:content2[contentthumb]}" width="40" height="40" class="imgs"></td>
										<td><input type="text" value="{x2;v:content2['contentsequence']}" onchange="updateSort('{x2;v:content2[contentid]}',this)"></td>
										<td>{x2;v:content2['contenttitle']}</td>
										<td>{x2;v:content2['contentlink']}</td>
										<td>{x2;date:v:content2['contentinputtime'],'y-m-d'}</td>
										<td>
										<img width="20" height="20" src="app/core/styles/images/{x2;if:v:content2['contentstatus']}yes.png{x2;else}cancel.png{x2;endif}" onclick="changeTableVal('{x2;v:content2[contentid]}',this)" onkeyup="value=value.replace(/[^\d]/g,'')"/>
										
										</td>
										<td>
											<a href="index.php?content-master-contents-edit&catid={x2;v:content2['contentcatid']}&contentid={x2;v:content2['contentid']}&page={x2;$page}{x2;$u}"><button class="layui-btn layui-btn-xs layui-btn-radius" data-toggle="modal" data-target="#myModal"><i class="layui-icon ">&#xe642;</i>编辑</button></a>
											<a class="btn confirm" href="index.php?content-master-contents-del&catid={x2;v:content1['cncatid']}&contentid={x2;v:content2['contentid']}&page={x2;$page}{x2;$u}" title="删除">
											<button type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger deluser" value="{x2;v:user['userid']}"><i class="layui-icon ">&#xe640;</i>删除</button></a>
										</td>
									</tr>
								{x2;endtree}  
								</tbody>
							</table>

						</div>
					</div>
				</div>
				<!--弹出层-->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">添加banner</h4>
							</div>
							<div class="modal-body">
								<ul>
									<li class="layui-form-item">
										<label class="layui-form-label">名称:</label>
										<input type="text" name="title" placeholder="请输入名称" autocomplete="off" class="layui-input">
									</li>
									<li class="layui-form-item">
										<label class="layui-form-label">链接:</label>
										<input type="text" name="title" placeholder="请输入链接" autocomplete="off" class="layui-input">
									</li>
									<li>
										<label class="layui-form-label ">图片:</label>
										<input type="file" class="layui-btn  layui-btn-small" id="file">
										<div class="layui-upload-list" style="text-align: center;">
											<img src="" height="200" id="img">
										</div>
									</li>
								</ul>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary">提交</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>

			</div>
		</div>
        </div>

		<script>
			//-------------改变显示状态-------------
			function changeTableVal(id_value,obj)
			{
				var src = "";
				if($(obj).attr('src').indexOf("cancel.png") > 0 )
				{          
					src = 'app/core/styles/images/yes.png';
					var value = 1;	
				}else{                    
						src = 'app/core/styles/images/cancel.png';
						var value = 0;
				}                                                 
				$.ajax({
					url:'index.php?content-master-contents-updateStatus&id_value='+id_value+'&value='+value,
					dataType:'JSON',		
					success: function(data){
						if(data.statusCode == 200){
	                		$(obj).attr('src',src); 
		                   // window.location.href = 'index.php?content-master-contents';
		                    return false;
		                }else{
		                    alert('失败了');
		                }									
						          
					}
				});		
			}

			//------------修改排序字段------------------------------------
			function updateSort(id_value,obj){
				var value = $(obj).val();
				$.ajax({
					url:'index.php?content-master-contents-updateSort&id_value='+id_value+'&value='+value,
					dataType:'JSON',		
					success: function(data){
						if(data.statusCode == 200){
	                		alert('修改成功');
		                    return false;
		                }else{
		                    alert('失败了');
		                }									
						          
					}
				});


			}
			

			//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
			layui.use('element', function() {
				var element = layui.element;
				//…
			});
			var fileInput = document.querySelector('input[type=file]'),
				previewImg = document.getElementById('img');
			fileInput.addEventListener('change', function() {
				var file = this.files[0];
				var reader = new FileReader();
				// 监听reader对象的的onload事件，当图片加载完成时，把base64编码賦值给预览图片
				reader.addEventListener("load", function() {
					previewImg.src = reader.result;
				}, false);
				// 调用reader.readAsDataURL()方法，把图片转成base64
				reader.readAsDataURL(file);
			}, false);
			$(".modal-footer").find("button").click(function() {
				$("#img").attr("src", "");
				var file = $("#file")
				file.after(file.clone().val(""));
				file.remove();
			})
		</script>
	</body>

</html>