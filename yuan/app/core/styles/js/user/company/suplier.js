widget = {}
/*
 * 0：普通人员；1：业务人员；2：业务管理人员；3：资管人员
 * 所有可展开业务管理人员和业务人员均可点击；所有新增按钮即类别和所属部门只有业务管理人员可以点击；
 */
widget = {
    DEFAULTS: {
        CURRENT_ROLE: '',//0：普通人员；1：业务人员；2：业务管理人员；3：资管人员
        USER: {},
        CURRENT_SELECTESD_CHANGE: '',
        addPurchaseItem: false,
        selectedDepartmentVal: '',//当前选中所属部门值
    },
    init: function () {
        widget.bindEventlistener();
        widget.getCurrentRole();
        widget.showSearchCondition();
    },
    bindEventlistener: function () {
        var userid;
        //click 供应商类别
        $(document).on('click', '.category', function () {
            //判断是否是管理人员
            if (widget.DEFAULTS.CURRENT_ROLE && widget.DEFAULTS.CURRENT_ROLE !== 2) {
                return false;
            }
            var userid = $(this).data('id');
            $('#category').find('#userids').attr('data-id', userid);
            $('#category').modal();
        })

        //click 所属部门
        $(document).on('click', '.department', function () {
            //判断是否是管理人员
            if (widget.DEFAULTS.CURRENT_ROLE && widget.DEFAULTS.CURRENT_ROLE !== 2) {
                return false;
            }

            widget.setSelectedDepartmentVal(this);
            widget.showDepartmentModal();
            $('#department').find('.modal-header div').html('修改所属部门');
            var userid = $(this).data('id');
            $('#department').find('#branchs').attr('data-id', userid);
            $('#department').modal();
        })
        //click 评价
        $(document).on('click', '.evaluate', function () {
            var $tr = $(this).closest('tr');
            $('.info-list').hide();
            var $thisPanel = $tr.nextAll().eq(0);
            if ($thisPanel.hasClass('lay')) {
                $thisPanel.hide('slow');
                $thisPanel.removeClass('lay')
            } else {
                $('.info-list').removeClass('lay');
                $thisPanel.show('slow');
                $thisPanel.addClass('lay');
            }
        })

        //click 合作项目
        $(document).on('click', '.project', function () {
            var $tr = $(this).closest('tr');
            $('.info-list').hide();
            var $thisPanel = $tr.nextAll().eq(1);
            if ($thisPanel.hasClass('lay')) {
                $thisPanel.hide('slow');
                $thisPanel.removeClass('lay');

            } else {
                $('.info-list').removeClass('lay');
                $thisPanel.show('slow');
                $thisPanel.addClass('lay');
            }
        })

        //click 备注
        $(document).on('click', '.remarks', function () {
            var $tr = $(this).closest('tr');
            $('.info-list').hide();
            var $thisPanel = $tr.nextAll().eq(2);
            if ($thisPanel.hasClass('lay')) {
                $thisPanel.hide('slow');
                $thisPanel.removeClass('lay');
            } else {
                $('.info-list').removeClass('lay');
                $thisPanel.show('slow');
                $thisPanel.addClass('lay')
            }
        })

        //下拉列表的添加按钮事件
        $(document).on('click', '.add-btn', function (e) {
            e.stopPropagation();
            var userid;
            var $this = $(this);
            userid = $(this).data('id');
            //判断是否是管理人员和业务人员
            if ($this.hasClass('remark-add-btn') && widget.DEFAULTS.CURRENT_ROLE && widget.DEFAULTS.CURRENT_ROLE === 1) {
                return false;
            }
            //判断是否是管理人员
            if (!$this.hasClass('remark-add-btn') && widget.DEFAULTS.CURRENT_ROLE && widget.DEFAULTS.CURRENT_ROLE !== 2) {
                return false;
            }


            // 保存数据到sessionStorage
            sessionStorage.setItem('bcd', userid);
            //现场评价
            if ($this.hasClass('evalution-add-btn')) {
                $("#upload-file-modal").find('.upload-file-confirm').attr('data-type', '1');
                $("#upload-file-modal").find('.modal-title').text('现场评价');
                $("#upload-file-modal").modal('show');
            } else if ($this.hasClass('project-add-btn')) {//合作项目
                $("#upload-file-modal").find('.upload-file-confirm').attr('data-type', '2');
                $("#upload-file-modal").find('.modal-title').text('合作项目');
                $("#upload-file-modal").modal('show');
            } else if ($this.hasClass('remark-add-btn')) {
                $("#add-remark-modal").find('.remark-confirm-btn').attr('data-type', '3');
                $("#add-remark-modal").modal('show');
            } else {
                $("#department").attr('current-id', userid);
                widget.DEFAULTS.selectedDepartmentVal = '';
                //清空已选中的
                $('#department').find('input[name=users_branch]').attr('checked', false);

                $('#department').find('.modal-header div').html('新增所属部门');
                $("#department").modal('show');
            }
        })

        //打开pdf
        $(document).on('click', '.open-file a', function () {
            //          var $this = $(this);
            //          var a_herf=$(this).parent("td").attr("data-url");
            //          alert("d");
            //          alert(a_herf);
            //
            //         window.location.href="?{x2;$_app}-company-privatement-test2&" + a_href;
            //          if ($('#pdf-box').hasClass('pdfactive')) {
            //              $('#pdf-box').removeClass('pdfactive');
            //          } else {
            //              $('#pdf-box').addClass('pdfactive');
            //          }
            //
            //          $('#pdf-box').css('display', 'block');
            //          var url = $this.data('url');
            //          $('#pdf-box').attr('src', url);
            //
            //          $('.close-pdf').show();

        })

        //点击评分
        $( '.score-box').click(function (e) {
            e.stopPropagation();
            //step1：关闭其他评分输入框
            $('.sjzx-detail-title').show();
            $('.score-input').hide();

            //step2：当前星星样式转化为输入框
            $(this).find('.sjzx-detail-title').hide();
            $(this).find('.score-input').show();
            $(this).find('.score-input').find('input').val($(this).find('.sjzx-detail-title').find('.zs').attr('data-grade'));
            $(this).find('.score-input').find('input')[0].focus();
        })

        $(".score-input").keydown(function (e) {
            var curKey = e.which;
            if (curKey == 13) {
                if (!$(this).find('input').val()) {
                    return false;
                }
                widget.commitScoreValue({
                    'value': $(this).find('input').val(),
                    'id': $(this).find('input').attr('data-id'),
                    'target': this,
                });
                return false;
            }
        });
        //点击星评之外的区域
        $(':not(.score-box)').on('click' , function (e) {
            // e.stopPropagation();
            $('.sjzx-detail-title').show();
            $('.score-input').hide();
        })

        // 请选择供应商
        $("#userids").click(function () {
            //判断是否是管理人员
            if (widget.DEFAULTS.CURRENT_ROLE && widget.DEFAULTS.CURRENT_ROLE !== 2) {
                return false;
            }
            var company = $("#company").val();
            if (company == "") {
                alert('请选择供应商');
                return false;
            }


            var userid = $(this).data('id'),
                companyType = $(this).parents('.modal').find('#company option:selected').val();
            $.ajax({
                type: 'get',
                url: 'index.php?user-company-index-companys&company=' + companyType + '&userid=' + userid,
                dataType: 'JSON',
                success: function (res) {
                    $('#category').modal('hide');
                    if (res.statusCode == 200) {
                        // alert("修改供应商成功")
                        window.location.href = "index.php?user-company-index-suplier_list" + widget.setUrlParam(widget.getSearchCondition());
                    } else {
                        // window.location.href = "index.php?user-company-index-suplier_list";
                        alert('修改供应商失败')
                    }
                },
                error: function (e) {
                    $('#category').modal('hide');
                    console.log(e);
                }
            })
        })

        // 选择部门所属
        $("#branchs").click(function () {
            //判断是否是管理人员
            if (widget.DEFAULTS.CURRENT_ROLE && widget.DEFAULTS.CURRENT_ROLE !== 2) {
                return false;
            }
            var checkID = [];//定义一个空数组
            $("input[name='users_branch']:checked").each(function (i) {
                //把所有被选中的复选框的值存入数组
                checkID[i] = $(this).val();
            });
            // //判断是否选择
            // if (checkID == "") {
            //     alert('请选择所属部门');
            //     return false;
            // }

            var userid = $(this).closest('#department').attr('current-id') || $(this).attr('data-id');
            $.ajax({
                type: 'get',
                url: 'index.php?user-company-index-upCompanybranch&companybranch=' + checkID + '&userid=' + userid,
                dataType: 'JSON',
                success: function (res) {
                    // $('#category').modal('hide');
                    if (res.statusCode == 200) {
                        // alert("修改供应商成功")
                        window.location.href = "index.php?user-company-index-suplier_list";
                    } else {
                        alert('修改供应商失败')
                    }
                },
                error: function (e) {
                    // $('#category').modal('hide');
                    console.log(e);
                }
            })
        })

        //打开备注详情弹框
        $('.open-remark').on('click', function () {
            var text = $(this).text();
            $("#remark-detail-modal").find('.remark-detail').text(text);
            $("#remark-detail-modal").modal('show');
        })

        //pdf模态框点击关闭
        $('.close-pdf').on('click', function () {
            if ($('#pdf-box').hasClass('pdfactive')) {
                //隐藏弹框
                $('#pdf-box').removeClass('pdfactive');
                $('#pdf-box').css('display', 'none');
                $('#pdf-box').attr('src', '');

                //隐藏关闭按钮
                $(this).hide();
            }

        })

        //审核点击事件
        $('.review-btn').on('click', function () {
            //判断是否是管理人员
            //          if (widget.DEFAULTS.CURRENT_ROLE && widget.DEFAULTS.CURRENT_ROLE !== 3) {
            //              return false;
            //          }
            var $this = $(this), type = $this.data('type'), id = $(this).data('id'), phone = $(this).data('phone');
            if (type === 'allow') {
                var data = {
                    result: false, msg: "操作确认", buttons: [
                        {text: '确定', isCancel: true, url: '1'},
                    ]
                };
                $.zoombox.show('confirm', data, 'allow' + '*' + id + '*' + phone);

            } else if (type === 'forbid') {
                var data = {
                    result: false, msg: "操作确认", buttons: [
                        {text: '确定', isCancel: true},
                    ]
                };
                $.zoombox.show('confirm', data, 'forbid' + '*' + id + '*' + phone);
            }

        })

        //上传文档.提交
        $('.upload-file-confirm').on('click', function () {
            //判断是否是管理人员
            if (widget.DEFAULTS.CURRENT_ROLE && widget.DEFAULTS.CURRENT_ROLE !== 2) {
                return false;
            }

            //判断文件上传是否成功
            // if(!UPLOADFILE_STATUS){
            //     return false;
            // }
            widget.addPurchaseItem(this);
        })

        //提交备注
        $('.remark-confirm-btn').on('click', function () {
            if ($(this).parents('#add-remark-modal').find('textarea').val() === "") {
                $('#add-remark-modal').find('.error-text').show();
                return false;
            }
            widget.addRemark(this);
        })

        //隐藏区选择
        setTimeout(function () {
            $('#company_area').hide();
        });

        //备注输入框 在input时
        $('textarea[name=remark-input]').bind('input propertychange', function () {
            if ($(this).val() !== '') {
                $(this).parent().find('.error-text').hide();
            }

        })

        //删除按钮
        $(document).on('click', '.delete-btn', function () {
            if (widget.DEFAULTS.CURRENT_ROLE && widget.DEFAULTS.CURRENT_ROLE !== 2) {
                return false;
            }
            var type = $(this).data('type'), doc_type = '', curUserId = $(this).data('id'),
                docId = $(this).data('docId');
            $('#delete-comfirm-modal').find('.delete-item-btn').attr('data-docId', docId);
            $('#delete-comfirm-modal').modal();
        })

        $(document).on('click', '.delete-item-btn', function () {
            var docId = $(this).attr('data-docId');
            widget.deleteItem(docId);
        })

        //供应商类型onchange
        // $('#purchasetype').on('change', function () {
        //     window.location.href = "index.php?user-company-index-suplier_list" + widget.setUrlParam(widget.getSearchCondition());
        // })

        //搜索
        $('.search-btn').on('click', function () {
            window.location.href = "index.php?user-company-index-suplier_list" + widget.setUrlParam(widget.getSearchCondition());
        })

        //搜索
        $('.condition-table select').on('change', function () {
            widget.DEFAULTS.CURRENT_SELECTESD_CHANGE = $(this);
            window.location.href = "index.php?user-company-index-suplier_list" + widget.setUrlParam(widget.getSearchCondition());
        })
    },
    //
    deleteItem: function (id) {
        $.ajax({
            type: 'delete',
            url: 'index.php?user-company-index-del_docment&doc_id=' + id,
            dataType: 'JSON',
            success: function (res) {
                if (res.statusCode == 200) {
                    window.location.href = "index.php?user-company-index-suplier_list" + widget.setUrlParam(widget.getSearchCondition());
                }
            }
        })
    },
    //回车点击提交分数
    commitScoreValue: function (obj) {
        //uid：企业id；gid：分值
        $.ajax({
            type: 'post',
            data: {},
            url: 'index.php?user-company-index-upSupliergrade&uid=' + obj.id + '&gid=' + obj.value,
            dataType: 'JSON',
            success: function (res) {
                if (res.statusCode !== 300) {
                    $(obj.target).closest('td').find('.sjzx-detail-title i').attr('class', '');
                    $(obj.target).closest('td').find('.sjzx-detail-title i').attr('data-grade', obj.value);
                    //标注星星等级
                    $(obj.target).closest('td').find('.sjzx-detail-title i').addClass('zs zs0' + res.statusCode);

                    //清空输入框
                    $(obj.target).find('input').val('');

                    $(obj.target).hide();
                    $(obj.target).closest('td').find('.sjzx-detail-title').show();
                }
            }
        })
    },

    //回显所属部门的选中状态
    showDepartmentModal: function () {
        //清空已选中的
        $('#department').find('input[name=users_branch]').attr('checked', false);
        if (widget.DEFAULTS.selectedDepartmentVal) {
            var arr = widget.DEFAULTS.selectedDepartmentVal.split(',');
            var checkbox = $('#department').find('input[name=users_branch]');
            $.each(arr, function (index, item) {
                $.each(checkbox, function (indexj, itemj) {
                    if (item === $(itemj).val()) {
                        $(itemj).prop('checked', true);
                        return false;
                    }
                })
            })
        }

    },
    setSelectedDepartmentVal: function (e) {
        widget.DEFAULTS.selectedDepartmentVal = '';
        widget.DEFAULTS.selectedDepartmentVal = $(e).attr('data-branchId');
    },
    //------------------------ 添加最新评论   合作项目 addPurchaseItem
    addPurchaseItem: function (_this) {
        if (!widget.DEFAULTS.addPurchaseItem) {
            var uds = $('#uds').val(), title = $("#title").text(), docType = $(_this).data('type');
            // 从sessionStorage获取数据
            var userd = sessionStorage.getItem('bcd');
            $.ajax({
                type: 'get',
                url: 'index.php?user-company-index-addNew&uds=' + uds + '&title=' + title + '&userid=' + userd + '&doc_type=' + docType,
                dataType: 'JSON',
                success: function (res) {
                    if (res.statusCode == 200) {
                        //alert("上传成功");
                        widget.DEFAULTS.addPurchaseItem = true;
                        window.location.href = "index.php?user-company-index-suplier_list" + widget.setUrlParam(widget.getSearchCondition());
                    } else {
                        alert("上传失败");
                    }
                }
            });
        }

    },
    addRemark: function (_this) {
        var uds = $('textarea[name=remark-input]').val(), title = uds.substring(0, 11), docType = $(_this).data('type');
        // 从sessionStorage获取数据
        var userd = sessionStorage.getItem('bcd');
        $.ajax({
            type: 'get',
            url: 'index.php?user-company-index-addNew&uds=' + uds + '&title=' + title + '&userid=' + userd + '&doc_type=' + docType,
            dataType: 'JSON',
            success: function (res) {
                if (res.statusCode == 200) {
                    //alert("提交成功");
                    window.location.href = "index.php?user-company-index-suplier_list" + widget.setUrlParam(widget.getSearchCondition());
                } else {
                    alert("提交失败");
                }
            }
        })
    },
    getCurrentRole: function () {
        var user = JSON.parse(sessionStorage.getItem('userInfo'));
        widget.DEFAULTS.CURRENT_ROLE = user.users_role;
        widget.DEFAULTS.USER = user;
        return user;
    },
    //-------------改变审核状态-------------
    changeTableVal: function (id_value, value, phone) {
        var resultObj;
        //value ：准入-》1，不准入-》0 ，id_value:curuserid
        $.ajax({
            url: 'index.php?user-company-index-updCompanyStatus&id_value=' + id_value + '&value=' + value,
            dataType: 'JSON',
            success: function (data) {
                if (data.statusCode === 200) {
                    $('#zoombox').modal('hide');
                    $("#" + id_value).children("td:last-child").html('<span class="green-text">已通过<span style="display: block;line-height: 14px;">' + data.time + '</span></span>');
                    //给用户发送审核通过通知
                    $.ajax({
                        type: 'POST',
                        data: {mobile: phone, action: 'reply'},
                        url: "index.php?core-api-index-sendcode",
                        dataType: 'json',
                        success: function (data2) {
                            if (data2.statusCode != 200) {
                                alert(data2.message);
                                return false;
                            }
                        }
                    });
                } else {
                    $('#zoombox').modal('hide');
                    $('#zoombox').modal('hide');
                    $("#" + id_value).children("td:last-child").html('<span class="fail-text">未通过<span style="display: block;line-height: 14px;">' + data.time + '</span></span>');
                }
            }
        });
    },
    //拼接搜索条件
    getSearchCondition: function () {
        //供应商类型选中值
        var purchasetype = $('#purchasetype option:selected').val();
        //所属部门
        var departmentVal = $("#departmentVal option:selected").val();
        //供货范围
        var productType1 = $("#first_select option:selected").val(),
            productType2 = $("#sed_select option:selected").val(),
            productType3 = $("#three_selct option:selected").val();
        // alert(department);
        //地区
        var province = $("#company_province option:selected").val(), city = $("#company_city option:selected").val();

        //企业名称
        var name = $('#keyword').val();

        //触发搜索的dom元素
        var currentCLickDom;
        if (widget.DEFAULTS.CURRENT_SELECTESD_CHANGE) {
            currentCLickDom = widget.DEFAULTS.CURRENT_SELECTESD_CHANGE.attr('id');
        }

        var param = {};
        if (purchasetype && purchasetype !== -1) {
            param.userType = purchasetype;
        }

        if (departmentVal && departmentVal !== -1) {
            param.userBranch = departmentVal;
        }

        if (productType1 && productType1 !== '-1') {
            param.topcateId = productType1;
            if (currentCLickDom && currentCLickDom === "first_select") {
                //查看第二级有没有搜索值
                if (widget.getParamByurl('fathcateId') && widget.getParamByurl('fathcateId') === productType2) {
                    productType2 = '-1';
                }
                if (widget.getParamByurl('catId') && widget.getParamByurl('catId') === productType3) {
                    productType3 = '-1';
                }
            }

        }
        if (productType2 && productType2 !== '-1') {
            param.fathcateId = productType2;
            if (currentCLickDom && currentCLickDom === "sed_select") {
                //查看第三极有没有搜索值
                if (widget.getParamByurl('catId') && widget.getParamByurl('catId') === productType3) {
                    productType3 = '-1';
                }
            }
        }
        if (productType3 && productType3 !== '-1') {
            param.catId = productType3;
        }
        if (province) {
            param.province = province;
            if (currentCLickDom && currentCLickDom === "company_province") {
                if (widget.getParamByurl('city') && widget.getParamByurl('city') === city) {
                    param.city = 0;
                }
            }
        }
        if (city) {
            param.city = city;
        }
        if (name) {
            param.query = name;
        }
        return param;
    },
    //拼接搜索条件的url参数
    setUrlParam: function (obj) {
        var resultStr = '';
        $.each(obj, function (i, val) {
            resultStr += '&';
            resultStr += i + "=" + val;
        })
        return resultStr;
    },
    //回显搜索条件
    showSearchCondition: function () {
        var userType = widget.getParamByurl('userType');
        var department = widget.getParamByurl('userBranch');
        var name = widget.getParamByurl('query');
        var province = widget.getParamByurl('province'), city = widget.getParamByurl('city');
        var department = widget.getParamByurl('userBranch');
        if (userType) {
            $("#purchasetype").find("option[value='" + userType + "']").attr("selected", true);
        }

        if (department) {
            $("#departmentVal").find("option[value='" + department + "']").attr("selected", true);
        }
        // if (name) {
        //     $('#keyword').val(decodeURI(decodeURI(name)));
        // }

        // if(department){
        //     $('#departmentVal').val(department);
        // }

        if (province) {
            // setTimeout(function () {
            $('#company_province').val(province);
            // $("#company_province").trigger("change");
            // },1000)
        }
        //
        //
        // if (city) {
        //     setTimeout(function () {
        //         $('#company_city').val(city);
        //         $("#company_city").trigger("change");
        //     },2000)
        // }
    },
    getParamByurl: function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;

    }
}


/**
 * [exportReport 导出搜索条件下excel文档方法]
 * @Author   Zhangjianchao
 * @DateTime 2018-08-15
 * @return   {[type]}      [description]
 */
function exportReport() {
    var purchasetype = $("#purchasetype").val();//供应商类别
    var first_select = $("#first_select").val();//供应商范围 一级
    var sed_select = $("#sed_select").val();//供应商范围 二级
    var three_selct = $("#three_selct").val();//供应商范围 三级
    var company_province = $("#company_province").val();//地域筛选[省]
    var company_city = $("#company_city").val();//地域筛选[市]
    var keyword = $("#keyword").val();//企业名称
    var userBranch = $("#departmentVal").val();//所属部门


    //alert(first_select);
    var url = 'index.php?user-company-index-export_suplier';


    if (purchasetype != '') {
        url += '&purchasetype=' + purchasetype;
    }
    if (first_select != '') {
        url += '&topcateId=' + first_select;
    }

    if (sed_select != '') {
        url += '&fathcateId=' + sed_select;
    }
    if (three_selct != '') {
        url += '&catId=' + three_selct;
    }
    if (company_province != '') {
        url += '&company_province=' + company_province;
    }
    if (company_city != '') {
        url += '&company_city=' + company_city;
    }


    if (keyword != '') {
        url += '&keyword=' + keyword;
    }

    if (userBranch != '') {
        url += '&userBranch=' + userBranch;
    }


    window.location.href = url;
}