<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
        <link rel="stylesheet" href="app/core/styles/admin/bootstrap.css" />
        <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
        <link rel="stylesheet" href="app/core/styles/admin/friendlink.css" />
        <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
        <link rel="stylesheet" href="app/core/styles/admin/index.css">
        <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/layui/layui.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
	</head>

	<body>
    <header>{x2;include:nav2}</header>
		<div class="layui-row" id="content">
            <div class="head">当前位置：<a href="index.php?user-master-user-position">推荐位管理</a>&nbsp;>&nbsp;内容管理</div>
            <!--<div class="add-link"><a href="index.php?user-master-user-poscontentadd"><i class="layui-icon">&#xe654;</i>推荐新内容</a></div>-->
			<div class="layui-col-sm12" >
				<table class="layui-table">
					<colgroup>
						<col width="100">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>ID</th>
                            <th>企业/信息/商品/ID</th>
							<th>名称/标题</th>
							<th>推荐时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
                    {x2;tree:$data['data'],dd,uid}
						<tr>
							<td>{x2;v:dd['id']}</td>
                            <td>{x2;v:dd['dataid']}</td>
                            <td>{x2;v:dd['title']}</td>
							<td>{x2;date:v:dd['createtime'],'Y-m-d H:i:s'}</td>
							<td>
                                <button type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger delposcont" value="{x2;v:dd['id']}"><i class="layui-icon ">&#xe640;</i>删除</button>
							</td>
						</tr>
                    {x2;endtree}
					</tbody>
				</table>
			</div>
		</div>
	</body>

</html>

<script>
    $(function(){
        $('.delposcont').on('click',function(){
            var isconfirm = confirm('确定要删除吗');
            if(isconfirm){
                var id = this.value;
                $.ajax({
                    type:'get',
                    url: "index.php?user-master-user-delposcontbyid&id="+id,
                    dataType:'JSON',
                    async:true,
                    success:function(res){
                        if(res.statusCode == 200){
                            alert('删除成功');
                            window.location.reload();
                        }
                    },
                    error: function(e){
                        console.log(e);
                    }
                })
            }

        })
    })

</script>