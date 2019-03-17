<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
		<title>搜索关键字统计</title>
        <link rel="stylesheet" href="app/core/styles/admin/layui/css/layui.css" media="all" />
        <link rel="stylesheet" href="app/core/styles/admin/goods/goods-index.css" />
        <link rel="stylesheet" href="app/core/styles/admin/base.css" media="all" />
        <link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
        <link rel="stylesheet" href="app/core/styles/admin/index.css">
        <script type="text/javascript" src="app/core/styles/admin/js/jquery.min.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/layui/layui.js"></script>
        <script type="text/javascript" src="app/core/styles/admin/js/index.js"></script>
		<style type="text/css">
			table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
			
		</style>
	</head>
	<body>
		<header>{x2;include:nav2}</header>
		<div class="layui-row">
			<div class="layui-col-sm12" id="content">
                <div class="head">当前位置：<a href="javascript:;">系统管理</a>&nbsp;>&nbsp;搜索关键字数据</div>
				<form class="layui-form" action="index.php?user-master-user-searchcount" method="post">
					<ul>
						<li class="layui-inline">
							<label class="layui-form-label" style="margin-right: 0;">关键字：</label>
							<div class="layui-input-block" style="float: left;margin-left: -9px;">
								<input type="text" name="search[keyword]" autocomplete="off" class="layui-input" value="{x2;$search['keyword']}">
							</div>
						</li>
						<li class="layui-inline">
							<label class="layui-form-label" >模块：</label>
							<div class="layui-input-block" style="float: left;margin-left: -9px;">
                                <select  name="search[searchtype]" lay-verify="required">
                                    <option value="0">选择模块</option>
                                    <option value="1" {x2;if:$search['searchtype'] == '1'} selected{x2;endif}>采购信息</option>
                                    <option value="2" {x2;if:$search['searchtype'] == '2'} selected{x2;endif}>供应商</option>
                                </select>
							</div>
						</li>
						<li class="layui-inline">
							<label class="layui-form-label">排序：</label>
							<div class="layui-input-block" style="float: left;margin-left: -9px;">
								<select name="search[orderby]" lay-verify="required">
                                     <option value="0"{x2;if:$search['orderby'] == '0'} selected{x2;endif}>由多到少</option>
                                     <option value="1"{x2;if:$search['orderby'] == '1'} selected{x2;endif}>由少到多</option>
                               </select>
							</div>
						</li>
						<li class="layui-inline"> 
							<label class="layui-form-label" style="width:auto;margin-top:-5px;">
							    <button class="layui-btn  layui-btn-sm"><i class="layui-icon ">&#xe615;</i> 查询 </button>
                            </label>
						</li>
					</ul>

					<!--表格-->
					<table class="layui-table">
						<colgroup>
							<col width="150">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>ID</th>
								<th>关键字</th>
								<th>搜索次数</th>
								<th>模块</th>
								<th>最新搜索时间</th>
							</tr>
						</thead>
						<tbody>
                            {x2;tree:$data['data'],dd,uid}
                                <tr>
                                    <td>{x2;v:dd['id']}</td>
                                    <td>{x2;v:dd['keyword']}</td>
                                    <td>{x2;v:dd['num']}</td>
                                    <td>{x2;if:v:dd['searchtype'] == '1'}采购信息{x2;else}供应商{x2;endif}</td>
                                    <td>{x2;date:v:dd['updatetime'],'Y-m-d H:i:s'}</td>
                                </tr>
                            {x2;endtree}
						</tbody>
					</table>
				</form>
                <ul class="pagination pull-right">
                    {x2;$data['pages']}
                </ul>
			</div>
		</div>
		<script>
			layui.use('form', function() {
				var form = layui.form;
			});
		</script>
	</body>
</html>

