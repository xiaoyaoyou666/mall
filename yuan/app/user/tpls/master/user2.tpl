<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <link rel="shortcut icon" href="app/core/styles/images/tianrunLogo.ico"/>
		<title>供应商管理</title>
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
          input[type='checkbox']{
              width:15px!important;
          }
          #userName{
              width:180px!important;
          }
          #xl{
              display: none;
              border: 1px solid #ccc;
              width:180px!important;
              height:120px;
              overflow-y: scroll;
          }
            #xl li{
                height:30px!important;
                cursor: pointer;
                width:100%;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 30px;
                color: #555;
                background-color: #fff;
                height:30px;
                line-height:30px;
            }
            table td, table th{text-align: left!important;padding: 4px 8px!important;font-size: 12px!important;}
            .lable_ol li{margin-right: 30px;}
            .span_close{float: right;display: block;width: 20px;height: 20px;text-align: center;line-height: 20px;cursor: pointer;font-size: 20px;}
			.span_close:hover{color: #ccc;}
            .lable_ol li{margin-right:18px;}
		</style>
	</head>
	<body>
    <header>
        {x2;include:nav2}
    </header>
		<div class="layui-row">

			<div class="layui-col-sm12" id="content">
                <div class="head">当前位置：<a href="index.php?user-master-user">供应商管理</a>&nbsp;>&nbsp;用户管理</div>
				<form class="layui-form" action="index.php?user-master-user" method="post">
					<ul class="lable_ol">
						<li class="layui-inline">
							<label class="layui-form-label">用户名：</label>
							<div class="layui-input-block" style="float: left;margin-left: -9px;">
                                <input class="form-control" name="search[username]" size="15" type="text" value="{x2;$search['username']}"/>
							</div>
						</li>
						<li class="layui-inline">
							<label class="layui-form-label">企业名称：</label>
							<div class="layui-input-block" style="float: left;margin-left: -9px;">
                                <input class="form-control" name="search[company_name]" size="15" type="text" value="{x2;$search['company_name']}"/>
							</div>
						</li>
						<li class="layui-inline">
							<label class="layui-form-label">手机号：</label>
							<div class="layui-input-block" style="float: left;margin-left: -9px;">
                                <input class="form-control" name="search[company_mobile]" size="15" type="text" value="{x2;$search['company_mobile']}"/>
							</div>
						</li>
						<li class="layui-inline">
							<label class="layui-form-label">企业类型：</label>
							<div class="layui-input-block" style="float: left;margin-left: -9px;">
								<select name="search[company_category]" lay-verify="required">
                                     <option value="">其他</option>
                                     <option value="设备商" {x2;if:$search['company_category'] == '设备商'} selected{x2;endif}>设备商</option>
                                     <option value="施工商" {x2;if:$search['company_category'] == '施工商'} selected{x2;endif}>施工商</option>
                                     <option value="材料商" {x2;if:$search['company_category'] == '材料商'} selected{x2;endif}>材料商</option>
                                     <option value="服务商" {x2;if:$search['company_category'] == '服务商'} selected{x2;endif}>服务商</option>
                               </select>
							</div>
						</li>
                        <li class="layui-inline" style="margin-right:0">
                            <label class="layui-form-label">供应商角色：</label>
                            <div class="layui-input-block" style="float: left;margin-left: -9px;">
                                <select name="search[users_role]" lay-verify="required">
                                     <option value="">全部</option>
                                     <option value="0" {x2;if:$search['users_role'] == '0'} selected{x2;endif}>一般用户</option>
                                     <option value="1" {x2;if:$search['users_role'] == '1'} selected{x2;endif}>业务人员</option>
                                     <option value="2" {x2;if:$search['users_role'] == '2'} selected{x2;endif}>业务管理人员</option>
                                     <option value="3" {x2;if:$search['users_role'] == '3'} selected{x2;endif}>资管人员</option>
                                     <option value="4" {x2;if:$search['users_role'] == '4'} selected{x2;endif}>采购人员</option>
                               </select>
                            </div>
                        </li>



						<li class="layui-inline" style="float:right;margin:20px 0 20px 0;">
							<lable class="layui-form-label" style="width:auto;margin-top:-5px;padding: 0;">
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
							<tr >
								<th>ID</th>
								<th>用戶名</th>
								<th style="width: 122px;">企业名称</th>
                                <th>供应商编码</th>
								<th>注册手机</th>
                                <th>注册时间</th>
								<th>是否审核</th>
								<th>合同协议</th>
                                <th>供应商角色</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
                        {x2;tree:$users['data'],user,uid}
							<tr>
								<td>{x2;v:user['userid']}</td>
								<td>{x2;v:user['username']}</td>
								<td>{x2;v:user['company_name']}</td>
                                <td>{x2;v:user['useropenid']}</td>
								<td>{x2;v:user['company_mobile']}</td>
								<td>{x2;date:v:user['userregtime'],'Y-m-d'}</td>
                                <td>
                                    <img width="20" height="20" src="app/core/styles/images/{x2;if:v:user['company_istrue']==1}yes.png{x2;else}cancel.png{x2;endif}" onclick="changeTableVal('{x2;v:user[userid]}',this)"/>
                                </td>

								<td>{x2;if:v:user['agreementnums']}
                                <a href="index.php?agreement-master-agreement-agreement&userid={x2;v:user['userid']}&salerid={x2;v:user['sap_company_id']}">{x2;v:user['agreementnums']}</a>
                                {x2;else}
                                <a>{x2;v:user['agreementnums']}</a>
                                {x2;endif}</td>
                                <td>{x2;if:v:user['users_role']==0}一般用户{x2;elseif:v:user['users_role']==1}业务人员{x2;elseif:v:user['users_role']==2}业务管理人员{x2;elseif:v:user['users_role']==3}资管人员{x2;else}采购人员

                                    {x2;endif}</td>
								<td style="width: 32%;padding: 4px 0px!important;">
                                    <button type="button" value="{x2;v:user['userid']}" class="layui-btn layui-btn-xs layui-btn-radius juese" >角色</button>
                                    <button style="margin-left: 0px;" type="button" value="{x2;v:user['userid']}" attr="{x2;v:user['company_name']}" class="layui-btn layui-btn-xs layui-btn-radius code" ><i class="layui-icon "></i>编码</button>
									<a style="margin-left: 0px;" href="index.php?user-master-user-info&userid={x2;v:user['userid']}" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal"><i class="layui-icon "></i>详情 </a>
                                    <a style="margin-left: 0px;" href="index.php?user-master-user-level&userid={x2;v:user['userid']}" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-warm"><i class="layui-icon"></i>星级</a>
									<button style="margin-left: 0px;" type="button" value="{x2;v:user['userid']}" attr="{x2;v:user['company_name']}" class="layui-btn layui-btn-xs layui-btn-radius tjw" ><i class="layui-icon "></i>推荐位</button>
                                    <button style="margin-left: 0px;" type="button" value="{x2;v:user['userid']}" attr="{x2;v:user['company_name']}" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-warm pwd" ><i class="layui-icon"></i>改密</button>
                                    <button style="margin-left: 0px;" type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger deluser" value="{x2;v:user['userid']}"><i class="layui-icon ">&#xe640;</i>删除</button>
								</td>
							</tr>
                        {x2;endtree}
						</tbody>
					</table>
				</form>
                <div style="float: right">
                    <ul class="pagination" style="margin:10px 0 50px 0;">
                        {x2;$users['pages']}
                    </ul>
                </div>
                <div style="clear:both"></div>
			</div>
		</div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="height: 48px;">
                    <h4 style="float: left;" class="modal-title" id="myModalLabel">推介位管理</h4>
                    <span class="span_close" data-dismiss="modal">x</span>
                </div>
                <div class="modal-body">
                    <table class="layui-table" lay-size="sm">
                        <colgroup>
                            <col width="50">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>推荐位名称</td>
                            <td>推荐位描述</td>
                        </tr>
                        </thead>
                        <tbody class="posids">
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="layui-btn  layui-btn-sm" id="addposition">提交</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
    <div class="modal fade"  id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="height: 48px;">
                    <h4 style="float: left;" class="modal-title" id="myModalLabel">供应商编码管理</h4>
                    <span class="span_close" data-dismiss="modal">x</span>
                </div>
                <div class="modal-body" style="height:200px;">
                    <input class="form-control" value="" type="text" id="userName" placeholder="请输入供应商编码" autocomplete="off">
                        <div id="xl">
                        </div>
                    </div>
                <div class="modal-footer">
<!--                    <button type="button" class="layui-btn  layui-btn-sm" data-dismiss="modal">关闭</button>-->
                    <button type="button" class="layui-btn  layui-btn-sm" id="addcode">提交</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
    <div class="modal fade"  id="myModal3"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="height: 48px;">
                    <h4 style="float: left;" class="modal-title" id="myModalLabel">角色修改</h4>
                     <span class="span_close" data-dismiss="modal">x</span>
                </div>
                <div class="modal-body" style="height:200px;">
                    <select id="jueseid" msg="您必须选择一个角色"  class="autocombox form-control require" name="jueseid">
                        <option value="0">一般用户</option>
                        <option value="1">业务人员</option>
                        <option value="2">业务管理人员</option>
                        <option value="3">资管人员</option>
                        <option value="4">采购人员</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <!--<button type="button" class="layui-btn  layui-btn-sm" data-dismiss="modal">关闭</button>-->
                    <button type="button" class="layui-btn  layui-btn-sm" id="editjuese">提交</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade"  id="myModal4"  >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="height: 48px;">
                    <h4 style="float: left;" class="modal-title" id="myModalLabel">密码修改</h4>
                    <span class="span_close" data-dismiss="modal">x</span>
                </div>
                <div class="modal-body" style="height:200px;">
                    <input class="form-control" value="" type="password" id="pwd" placeholder="请输新入密码" autocomplete="off"><input class="form-control" value="" type="password" id="pwdagain" placeholder="请输入确认密码" autocomplete="off">
                </div>
                <div class="modal-footer">
                    <!--<button type="button" class="layui-btn  layui-btn-sm" data-dismiss="modal">关闭</button>-->
                    <button type="button" class="layui-btn  layui-btn-sm" id="savepwd">提交</button>
                </div>
            </div>
        </div>
    </div>
		<script>
			layui.use('form', function() {
				var form = layui.form;
			});
            $(function(){
                $("#xl").on("click","li",function(){
                    $("#userName").val($(this).text());
                    $("#xl").slideUp();
                })
                //删除企业用户
                $('.deluser').on('click',function(){
                    var isconfirm = confirm('确定要删除吗');
                    if(isconfirm){
                        var userid = this.value;
                        $.ajax({
                            type:'get',
                            url: "index.php?user-master-user-del&userid="+userid+"&page={x2;$page}{x2;$u}",
                            dataType:'JSON',
                            async:true,
                            success:function(res){
                                if(res.statusCode == 200){
                                    alert('删除成功');
                                    window.location.reload();
                                    return false;
                                }
                            },
                            error: function(e){
                                console.log(e);
                            }
                        })
                    }

                })
                //全局变量 企业id
                var uid = '';
                var uname = '';
                var code = '';
                $(".tjw").on('click',function(){
                    $("[name='posids']").removeAttr("checked");//取消全选
                    $("#myModal").modal();
                    uid = $(this).val();
                    uname = $(this).attr('attr');
                    $.ajax({
                        type:'get',
                        url: "index.php?user-master-user-getPosByUserid&t=2&userid="+uid,
                        dataType:'JSON',
                        async:true,
                        success:function(res){
                            if(res.statusCode == 200){
                                $(".posids").html(res.message);
                            }
                        },
                        error: function(e){
                            console.log(e);
                        }
                    })
                })
                //供应商编码设置
                $(".code").on('click',function(){
                    uid = $(this).val();
                    $("#myModal2").modal();
                })
                //角色修改
                $(".juese").on('click',function(){
                    uid = $(this).val();
                    $("#myModal3").modal();
                })
                //密码修改
                $(".pwd").on('click',function(){
                    uid = $(this).val();
                    $("#myModal4").modal();
                })
                $("#userName").keyup(function() {
                    //$(this).next("#xl").slideUp();
                    var code = $(this).val();
                    if(code != ''){
                        $(this).next("#xl").slideDown();
                        $.ajax({
                            type: 'GET',
                            data: {code:code},
                            url: "index.php?core-api-index-getCompanyByCode",
                            dataType: 'json',
                            success: function (res) {
                                if(res.statusCode == 200){
                                    $("#xl").html(res.data);
                                }else{
                                    var data = {result: false, message: res.msg};
                                    $.zoombox.show('ajax', data);
                                }
                            }
                        })
                    }
                });
                $("#addcode").on('click',function(){
                    //console.log($("#userName").val());return false;
                    var cc = $("#userName").val();
                    if(cc == ''){
                        alert('请重新选择供应商编码');
                        return false;
                    }
                    if(uid == ''){
                        alert('请重新选择企业');
                        return false;
                    }
                    $.ajax({
                        type:'get',
                        url: "index.php?core-api-index-setCompCode&userid="+uid+"&code="+cc,
                        dataType:'JSON',
                        async:true,
                        success:function(res){
                            if(res.statusCode == 200){
                                alert('设置成功');
                                window.location.reload();
                            }
                        },
                        error: function(e){
                            console.log(e);
                        }
                    })
                })
                $("#editjuese").on('click',function(){
                    var jueseId = $("#jueseid").find("option:selected").val();
                    $.ajax({
                        type:'get',
                        url: "index.php?user-master-user-editRole&role="+jueseId+"&user_id="+uid,
                        dataType:'JSON',
                        async:true,
                        success:function(res){
                            if(res.statusCode == 200){
                                alert('设置成功');
                                window.location.reload();
                            }
                        },
                        error: function(e){
                            console.log(e);
                        }
                    })
                })
                //企业推荐位管理
                $("#addposition").on('click',function(){
                    var arr = new Array();
                    $.each($('input:checkbox:checked'),function(i){
                        arr[i] = $(this).val();
                    });
                    var vals = arr.join(",");
                    if(vals == ''){
                        alert('请至少选择一个推荐位');
                        return false;
                    }
                    if(uid == ''){
                        alert('请重新选择企业');
                        return false;
                    }

                    if(uname == ''){
                        alert('请重新选择企业');
                        return false;
                    }
                    $.ajax({
                        type:'get',
                        url: "index.php?user-master-user-poscontentadd&t=2&userid="+uid+"&posid="+vals+"&uname="+uname,
                        dataType:'JSON',
                        async:true,
                        success:function(res){
                            if(res.statusCode == 200){
                                alert('推荐成功');
                                window.location.reload();
                            }
                        },
                        error: function(e){
                            console.log(e);
                        }
                    })
                });

                //修改密码
                $("#savepwd").on('click',function(){
                    var pwd = $("#pwd").val();
                    var pwdagain = $("#pwdagain").val();
                    if(pwd == ''){
                        alert('请输入新密码');
                        return false;
                    }
                    if(pwdagain == ''){
                        alert('请确认新密码');
                        return false;
                    }
                    if(pwd != pwdagain){
                        alert('两次密码不一致');
                        return false;
                    }
                    $.ajax({
                        type:'get',
                        url: "index.php?core-api-index-saveUserPwd&userid="+uid+"&pwd="+pwd+"&pwdagain="+pwdagain,
                        dataType:'JSON',
                        async:true,
                        success:function(res){
                            if(res.statusCode == 200){
                                alert('设置成功');
                                window.location.reload();
                            }else{
                                alert(res.message);
                            }
                        },
                        error: function(e){
                            console.log(e);
                        }
                    })
                })

            })
             //-------------改变显示状态-------------
            function changeTableVal(id_value,obj)
            {
                //alert(aaa);
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
                    url:'index.php?user-master-user-updateStatus&id_value='+id_value+'&value='+value,
                    dataType:'JSON',
                    success: function(data){
                        if(data.statusCode == 200){
                            $(obj).attr('src',src);
                            return false;
                        }else{
                            alert('失败了');
                        }

                    }
                });
            }

		</script>
	</body>

</html>