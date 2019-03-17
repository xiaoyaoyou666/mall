<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
		<title>系统消息-选择供应商</title>
        <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
        <script src="app/core/styles/js/jquery.min.js"></script>
        <script src="app/core/styles/admin/layui/layui.js"></script>
        <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
        <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
        <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
        <link rel="stylesheet" href="app/core/styles/admin/index.css">
		<style>
          label{
          	text-align:left!important;
          	width:auto!important;
          	padding:5px 5px;
          }	
          li div.layui-input-block{
          	margin-left:90px;
          }
		</style>
	</head>
	<body>
    <header>
        {x2;include:nav2}
    </header>
		<div class="layui-row">
		
			<div class="layui-col-sm12" id="content">
				<div class="head">当前位置：<a href="index.php?user-master-user-systemmessage">系统消息</a>&nbsp;>&nbsp;选择供应商</div>
                <form class="layui-form" action="index.php?user-master-user" method="post">
                    <ul>
                        <li class="layui-inline">
                            <label class="layui-form-label">用户名：</label>
                            <div class="layui-input-block">
                                <input class="form-control" name="search[username]" size="15" type="text" value="{x2;$search['username']}"/>
                            </div>
                        </li>
                        <li class="layui-inline">
                            <label class="layui-form-label">企业名称：</label>
                            <div class="layui-input-block">
                                <input class="form-control" name="search[company_name]" size="15" type="text" value="{x2;$search['company_name']}"/>
                            </div>
                        </li>
                        <li class="layui-inline">
                            <label class="layui-form-label">手机号：</label>
                            <div class="layui-input-block">
                                <input class="form-control" name="search[company_mobile]" size="15" type="text" value="{x2;$search['company_mobile']}"/>
                            </div>
                        </li>
                        <li class="layui-inline">
                            <label class="layui-form-label">企业类型：</label>
                            <div class="layui-input-block">
                                <select name="search[company_category]" lay-verify="required">
                                    <option value="">其他</option>
                                    <option value="设备商" {x2;if:$search['company_category'] == '设备商'} selected{x2;endif}>设备商</option>
                                    <option value="施工商" {x2;if:$search['company_category'] == '施工商'} selected{x2;endif}>施工商</option>
                                    <option value="材料商" {x2;if:$search['company_category'] == '材料商'} selected{x2;endif}>材料商</option>
                                    <option value="服务商" {x2;if:$search['company_category'] == '服务商'} selected{x2;endif}>服务商</option>
                                </select>
                            </div>
                        </li>
                        <li class="layui-inline">
                            <lable class="layui-form-label" style="width:auto;margin-top:-5px;">
                                <button class="layui-btn  layui-btn-sm"><i class="layui-icon ">&#xe615;</i> 查询 </button>
                            </lable>
                        </li>
                    </ul>

                    <!--表格-->
                    <table class="layui-table" >
                        <colgroup>
                            <col width="30">
                            <col width="100">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <td><input type="checkbox" value="0" lay-skin="primary" lay-filter="allChoose"></td>
                            <th>ID</th>
                            <th>用戶名</th>
                            <th>企业名称</th>
                            <th>注册手机</th>
                            <th>注册时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        {x2;tree:$users['data'],user,uid}
                        <tr>
                            <td><input type="checkbox" value="{x2;v:user['userid']}" lay-skin="primary"></td>
                            <td>{x2;v:user['userid']}</td>
                            <td>{x2;v:user['username']}</td>
                            <td>{x2;v:user['company_name']}</td>
                            <td>{x2;v:user['company_mobile']}</td>
                            <td>{x2;date:v:user['userregtime'],'Y-m-d'}</td>
                        </tr>
                        {x2;endtree}
                        </tbody>
                    </table>
                </form>
                <ul class="pagination pull-right">
                    {x2;$users['pages']}
                </ul>
                <!--全部发送-->
                <input type="hidden" id="title" value="{x2;$title}">
                <input type="hidden" id="content_desc" value="{x2;$content}">
                <input type="hidden" id="type" value="{x2;$type}">
                <button type="button" class="layui-btn" style="float:left" id="send"><i class="layui-icon ">&#xe62f;</i>发送</button>
			</div>
		</div>
    <script>
        layui.use('form', function() {
            var form = layui.form;
            form.on('checkbox(allChoose)', function(data){
                var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
                child.each(function(index, item){
                    item.checked = data.elem.checked;
                });
                form.render('checkbox');
            });
        });

        $(function() {
            $('#send').on('click',function(){
                var arr = new Array();
                $.each($('input:checkbox:checked'),function(i){
                    arr[i] = $(this).val();
                });
                var vals = arr.join(",");
                if(vals == ''){
                    alert('请至少选择一个供应商');
                    return false;
                }
                var type = $("#type").val();
                var title = $("#title").val();
                var content = $("#content_desc").val();
                if(title == '') {
                    alert('请返回上一页重新输入标题');
                    return false;
                }
                if(content == '') {
                    alert('请返回上一页重新输入内容');
                    return false;
                }
                $.ajax({
                    type:'get',
                    data: {type: type,title: title,content: content,uid: vals},
                    url: "index.php?user-master-user-sendmessage",
                    dataType:'JSON',
                    async:true,
                    success:function(res){
                        if(res.statusCode == 200){
                            alert('发送成功');
                            window.location.href = 'index.php?user-master-user-systemmessage';
                            return false;
                        }
                    },
                    error: function(e){
                        console.log(e);
                    }
                })
            });

        })
		</script>
	</body>
</html>
