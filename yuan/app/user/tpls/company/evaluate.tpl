<html>

	<head>
		<title>供应商评价列表</title>
		<link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico" />
		<script src="app/core/styles/js/jquery.min.js"></script>
		<script type="text/javascript" src="app/core/styles/js/pdfobject.js"></script>
		<link rel="stylesheet" type="text/css" href="app/core/styles/css/bootstrap.css" />
		<style>
			* {
				margin: 0px;
				padding: 0px;
			}
			
			.head {
				width: 100%;
				height: 60px;
				background: #18bc9c;
			}
			
			.head ul li {
				display: inline-block;
				line-height: 60px;
				cursor: pointer;
			}
			
			.title {
				height: 30px;
				line-height: 30px;
				margin-top: 20px;
			}
			
			.title span:first-child {
				display: inline-block;
				background: #18bc9c;
				width: 8px;
				height: 8px;
				margin-right: 10px;
			}
			
			.forms {
				border: 1px solid #ededed;
				border-radius: 4px;
				/*	width: 1398px;*/
				height: 108px;
				font-size: 13px;
				margin-bottom: 30px!important;
			}
			
			.forms>div {
				margin-top: 15px;
			}
			
			.pad {
				padding: 0px!important;
			}
			
			.inputs {
				background: #ffffff;
				border: 1px solid #cccccc;
				box-shadow: inset 0 1px 4px 0 rgba(0, 0, 0, 0.15);
				border-radius: 6px;
				width: 140px;
				height: 28px;
			}
			
			.row {
				margin: 10px 50px
			}
			
			.search {
				background: #18bc9c;
				border-radius: 4px;
				width: 60px;
				height: 30px;
				border: solid 1px #18BC9C;
				outline: none!important;
				color: #fff;
			}
			
			table {
				color: #666666;
				text-align: center;
			}
			
			table td {
				height: 40px;
			}
			
			.blue {
				color: #5cd0b9;
			}
			
			tr {
				cursor: pointer;
			}
			
			input {
				padding-left: 10px;
			}
			
			.head ul li img {
				width: 30px;
				height: 30px;
				border-radius: 50%;
			}
			
			.head ul li span {
				padding-left: 10px;
				color: #fff;
			}
			
			.out_login {
				width: 100px;
				height: 40px;
				line-height: 40px;
				background: #D0E9F5;
				padding-left: 10px;
				position: absolute;
				right: 103px;
				z-index: 100;
				display: none;
			}
			.out_login a{
				color: #fff;
			}
			.pagination > li > a:hover{
				color: #fff!important;
				background-color: #18bc9c!important;
			}
			.pagination > li > a,
			.pagination > li > span {
				position: relative;
				color: #888;
			}
			
			.current {
				color: #fff!important;
				background-color: #18bc9c!important;
				
			}
			.form-control{
				padding:0px;
				padding-left: 5px;
				height: 28px;
				line-height: 28px;
			}
			.forms .col-md-2{
				padding-right: 0px!important;
			}
			.table{
				border: solid 1px #ddd!important;
			}
			.pagination > li > a{
				margin: 5px;
			}
			.pagination > li:first-child > a, .pagination > li:first-child > span{
				border-radius: 0px;
			}
		</style>
	</head>

	<body>
		<div class="container-fluid" style="margin: 0px;padding: 0px;">
			<div class="head">
				<ul>
                    <a href="index.php?item">
					    <li style="width:200px;background:#16a589;color: #fff;text-align: center;font-size: 20px;"><img src="app/core/styles/img/p_logo.png" style="margin-top: -5px;margin-right: 3px;">天润新能</li>
                    </a>
					
					<li style="float:right;margin-right:0px;margin-right: 50px;"><a class="ajax" href="index.php?user-app-logout" style="color: #fff;"><em class="glyphicon glyphicon-log-out" style="margin-right: 5px;"></em>退出登录</a></li>
					<li class="userInfo" style="float: right;margin-right: 50px;"><span>{x2;$_user['username']}</span></li>
				</ul>
			</div>
			
			<div class="row">
				<div class="col-md-12 pad">
					<p class="title" style="float: left;"><span></span>供应商评价列表</p>
					<button onclick="export1()" class="search" style="display: block;text-align: center;float: right;line-height: 30px;margin-top: 16px;">导出</button>
				</div>
			</div>
			<form action="index.php?user-company-index-evaluate_list" method="post" class="form-inline condition-table">
				<div class="row forms">
                    <div style="width: 230px" class="col-md-2"><span>公司名称：</span><input type="text" class="inputs" id="supplier_name" value="{x2;$supplier_name}"></div>
                    <div style="width: 240px" class="col-md-2"><span>项目名称：</span><input type="text" class="inputs" id="project_name" value="{x2;$project_name}"></div>
                    <div class="col-md-3" style="width: 260px">
                        <span>评价等级：</span>
                        <select class="form-control" name="eval_level" id="eval_level" style="width: 140px">
                            <option value=''>请选择等级</option>
                            <option value='1' {x2;if:$eval_level == 1} selected="selected" {x2;endif} >A级供应商</option>
                            <option value='2' {x2;if:$eval_level == 2} selected="selected" {x2;endif} >B级供应商</option>
                            <option value='3' {x2;if:$eval_level == 3} selected="selected" {x2;endif} >C级供应商</option>
                            <option value='4' {x2;if:$eval_level == 4} selected="selected" {x2;endif} >D级供应商</option>
                        </select>
                    </div>
                    <div  class="col-md-2" style="width:240px"><span>标段名称：</span><input type="text" class="inputs" id="contract_name" value="{x2;$contract_name}"></div>
					<div class="col-md-3" style="width:260px;">
						<span>供应商类别：</span>
						<select class="form-control" name="company_type" id="company_type" style="width: 140px;">
                            <option value=''>请选择类型</option>
                            <option value='1' {x2;if:$company_type == 1} selected="selected" {x2;endif} >主要类</option>
                            <option value='2' {x2;if:$company_type == 2} selected="selected" {x2;endif} >一般类</option>
                            <option value='3' {x2;if:$company_type == 3} selected="selected" {x2;endif} >零星类</option>
                        </select>
					</div>

                    <div class="col-md-3" style="width:auto">
                        <span>分&nbsp;&nbsp;&nbsp;&nbsp;类&nbsp;&nbsp;：</span>
                        <select class="form-control" name="class_type" id="class_type" style="width: 140px;">
                            <option value=''>请选择类型</option>
                            <option value='1' {x2;if:$class_type == 1} selected="selected" {x2;endif} >物资类</option>
                            <option value='2' {x2;if:$class_type == 2} selected="selected" {x2;endif} >运检类</option>
                            <option value='3' {x2;if:$class_type == 3} selected="selected" {x2;endif} >技术服务类</option>
                            <option value='4' {x2;if:$class_type == 3} selected="selected" {x2;endif} >其他类</option>
                        </select>
                        <select class="form-control" name="eval_cate" id="eval_cate">
                            <option value=''>请选择类型</option>
                            {x2;tree:$eval_cate_arr,cate,catid}
                            <option value='{x2;v:cate['id']}' {x2;if:$eval_cate == v:cate['id']} selected="selected" {x2;endif}>{x2;v:cate['cate_name']}</option>
                            {x2;endtree}
                        </select>
                    </div>

					<div class="col-md-2" style="width:100px"><button class="search" type="button" onclick="doSearch()">搜索</button></div>
				</div>
			</form>
			<div class="row table-responsive">
				<table class="table">
					<tr style="background: #f5f5f5;">
						<td style="text-align: center;width: 56px;">序号</td>
                        <td>供应商分类</td>
                        <td>一级分类</td>
                        <td>二级分类</td>
						<td>标段名称</td>
                        <td>公司名称</td>
						<td style="width: 400px;">合作项目</td>
						<td>评价等级</td>
						<td>得分</td>
					</tr>
                    {x2;eval:$num_first = ($page - 1)*15}
					{x2;tree:$data['data'],vv,id}
                    {x2;eval:++$num_first}
					<tr>
						<td style="display: none;">{x2;v:vv['id']}</td>
						<td style="text-align: center;">{x2;$num_first}</td>
                        <td>{x2;$company_type_arr[v:vv['company_type']]}</td>
                        <td>{x2;$class_type_arr[v:vv['class_type']]}</td>
                        <td>{x2;v:vv['cate_name']}</td>
						<td class="blue">{x2;v:vv['contract_name']}</td>
                        <td>{x2;v:vv['supplier_name']}</td>
						<td class="blue" style="width: 400px;">{x2;v:vv['project_name']}</td>
						<td>{x2;$leval_arr[v:vv['eval_level']]}</td>
						<td class="blue"><a href="index.php?user-company-index-evaluateInfo&t={x2;v:vv['eval_type']}&id={x2;v:vv['id']}">{x2;v:vv['total_score']}分</a></td>

					</tr>

					{x2;endtree}

				</table>
				<ul class="pagination pull-right">
					{x2;$data['pages']}
				</ul>
			</div>
		</div>
		</div>

	</body>

</html>
<script>
    $(function() {
        $("#class_type").change(function() {
            var parentid = $('#class_type').val();
            var html = '<option value="">请选择类型</option>';
            if(parentid == '')
            {
                $('#eval_cate').html(html);
                return false;
            }
            //alert(parentid);return false;
            $.ajax({
                type: 'GET',
                url: "index.php?core-api-evaluate-getCategoryByType&type="+parentid,
                dataType: 'json',
                success: function(res) {
                    if (res.statusCode == 200) {
                        $.each(res.data,function() {
                            html += '<option value="'+this.id+'">'+this.cate_name+'</option>';
                        })
                        $('#eval_cate').html(html);
                        //console.log(html)

                    } else {
                        var data = {
                            result: false,
                            message: res.message
                        };
                        $.zoombox.show('ajax', data);
                    }
                }
            })
        })
    })
	$(".userInfo").on('mouseover', function() {
		$(".out_login").show();
	})
	$(".out_login").on("mouseleave", function() {
		$(".out_login").hide()
	})

	function doSearch() {
        var supplier_name = $("#supplier_name").val();
        var project_name = $("#project_name").val();
        var eval_level = $("#eval_level").val();
		var contract_name = $("#contract_name").val();
		var company_type = $("#company_type").val();
        var class_type = $("#class_type").val();
        var eval_cate = $("#eval_cate").val();
		var url = 'index.php?user-company-index-evaluate_list';
		if (eval_level != '') {
			url += '&eval_level=' + eval_level;
		}
		if (contract_name != '') {
			url += '&contract_name=' + contract_name;
		}
		if (supplier_name != '') {
			url += '&supplier_name=' + supplier_name;
		}
        if (project_name != '') {
            url += '&project_name=' + project_name;
        }
		if (company_type != '') {
			url += '&company_type=' + company_type;
		}
        if (class_type != '') {
            url += '&class_type=' + class_type;
        }
        if (eval_cate != '') {
            url += '&eval_cate=' + eval_cate;
        }
		window.location.href = url;
	}

    function export1() {
        var supplier_name = $("#supplier_name").val();
        var project_name = $("#project_name").val();
        var eval_level = $("#eval_level").val();
        var contract_name = $("#contract_name").val();
        var company_type = $("#company_type").val();
        var class_type = $("#class_type").val();
        var eval_cate = $("#eval_cate").val();
        var url = 'index.php?core-api-evaluate-export';
        if (eval_level != '') {
            url += '&eval_level=' + eval_level;
        }
        if (contract_name != '') {
            url += '&contract_name=' + contract_name;
        }
        if (supplier_name != '') {
            url += '&supplier_name=' + supplier_name;
        }
        if (project_name != '') {
            url += '&project_name=' + project_name;
        }
        if (company_type != '') {
            url += '&company_type=' + company_type;
        }
        if (class_type != '') {
            url += '&class_type=' + class_type;
        }
        if (eval_cate != '') {
            url += '&eval_cate=' + eval_cate;
        }
        window.location.href = url;
    }
</script>