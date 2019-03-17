<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="app/core/styles/admin/layui/layui.js"></script>
		<link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
        <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
        <link rel="stylesheet" href="app/core/styles/admin/index.css">
        <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
	</head>
	<style type="text/css">
		.layui-table td, .layui-table th{text-align: left;}
	</style>

	<body>
    <header>{x2;include:nav2}</header>
		<div class="layui-row">
			<div class="layui-col-sm12" id="content" style="padding-top:0px;">
                <div class="head">当前位置：<a href="index.php?user-master-user">用户管理</a>&nbsp;>&nbsp;用户详情</div>
				
				<!--第一个表格-->
				<table class="layui-table" lay-size="sm">
					<colgroup>
						<col width="200">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td>用户名</td>
							<td>{x2;$data['username']}</td>
						</tr>
						<tr>
							<td>手机号</td>
							<td>{x2;$data['company_mobile']}</td>
						</tr>
						<tr>
							<td>状态</td>
							<td>正常</td>
						</tr>
						<tr>
							<td>注册时间</td>
							<td>{x2;date:$data['userregtime'],'Y-m-d'}</td>
						</tr>
						<tr>
							<td>用户ID</td>
							<td>{x2;$data['userid']}</td>
						</tr>
					</tbody>
				</table>
				<!--第二个表格-->
			    <table class="layui-table" lay-size="sm">
					<colgroup>
						<col width="200">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td>企业类型</td>
							<td>{x2;$data['company_category']}</td>
						</tr>
						<tr>
							<td>公司名称</td>
							<td>{x2;$data['company_name']}</td>
						</tr>
						<tr>
							<td>所在行业</td>
							<td>{x2;$data['company_scope']}</td>
						</tr>
						<tr>
							<td>公司简介</td>
							<td>{x2;$data['company_intro']}</td>
						</tr>
						<tr>
							<td>公司官网</td>
							<td><a href="{x2;$data['company_url']}" target="_blank">{x2;$data['company_url']}</a></td>
						</tr>
						<tr>
							<td>企业营业执照</td>
							<td>{x2;$data['company_licence']}</td>
						</tr>
						<tr>
							<td>联系人</td>
							<td>{x2;$data['company_contacter']}</td>
						</tr>
						<tr>
							<td>公司地址</td>
							<td>{x2;$data['company_address']}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>

</html>