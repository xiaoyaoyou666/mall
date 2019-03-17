<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">采购需求基本概况</h4>

<div class="form-group">
    <label for="purchasetitle" class="control-label col-sm-2"><span
                class="hln-cue">*</span>采购标题：</label>
    <div class="col-sm-4">
        <input class="form-control " type="text" id="jj" name="args[purchasetitle]" needle="needle" msg="您必须输入标题"
               placeholder="请简短描述商机情况,限输30汉字" maxlength="30">
    </div>
</div>

<div class="form-group">
    <label for="purchasetype" class="control-label col-sm-2"><span
                class="hln-cue">*</span>采购类型：</label>
    <div class="col-sm-3">
        <select class="form-control require" name="args[purchasetype]" id="purchasetype0" style="" current=""
                needle="needle" msg="您必须选择采购类型">
            <option value=''>标准订单</option>
            <option value='设备'>设备</option>
            <option value='材料'>材料</option>
            <option value='施工'>施工</option>
            <option value='服务'>服务</option>
        </select>

    </div>
</div>

<div class="form-group">
    <label for="purchasetitle" class="control-label col-sm-2"><span
                class="hln-cue">*</span>采购结束时间：</label>
    <div class="col-sm-4">
        <input class="form-control datetimepicker require" data-minview="0" data-date="{x2;date:TIME,'Y-m-d H:i:s'}"
               data-date-format="yyyy-mm-dd hh:ii" type="text" id="bb" name="args[purchase_finishtime]" needle="needle"
               msg="您必须输入发布时间">
    </div>
</div>

<div class="form-group">
    <label for="purchasetitle" class="control-label col-sm-2"><span
                class="hln-cue">*</span>期望收货时间：</label>
    <div class="col-sm-4">
        <input class="form-control datetimepicker require" data-minview="0" data-date="{x2;date:TIME,'Y-m-d H:i:s'}"
               data-date-format="yyyy-mm-dd hh:ii" type="text" id="aa" name="args[purchase_recivetime]" needle="needle"
               msg="您必须输入发布时间">
    </div>
</div>

<div class="form-group" style="margin-bottom: 0">
    <label for="purchase_province" class="control-label col-sm-2"><span
                class="hln-cue">*</span>收货地址：</label>
    <div class="col-md-10 form-group">
        <div class="col-sm-2">
            <select class="autoloaditem combox form-control require" autoload="index.php?core-api-index-getProvince"
                    target="service_city" refurl="index.php?core-api-index-getcity&parent={value}"
                    name="args[service_province]" id="service_province" current="" needle="needle"
                    msg="您必须选择省"></select>

        </div>

        <div class="col-sm-2">
            <select class="autoloaditem combox form-control require" autoload="index.php?core-api-index-getcity"
                    target="service_area" refurl="index.php?core-api-index-getarea&parent={value}"
                    parent="#service_province" name="args[service_city]" id="service_city" current="" needle="needle"
                    msg="您必须选择市">
            </select>

        </div>
        <div class="col-sm-2">
            <select class="autoloaditem form-control require" autoload="index.php?core-api-index-getarea"
                    parent="#service_city"
                    name="args[service_area]" id="service_area" current="" needle="needle" msg="您必须选择区"></select>

        </div>
    </div>
</div>
<div class="form-group">
    <div class="col-sm-2"></div>
    <div class="col-sm-4">
        <input type="text" class="form-control require" name="args[purchase_address]" id="purchase_address"
               placeholder="详细地址"
               needle="needle" msg="您必须输入详细地址"/>

    </div>
</div>
<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">采购物料</h4>
<div class="form-group">
    <label for="block" class="control-label col-sm-2">
        <span class="hln-cue">*</span>采购物料：</label>
    <a href="javascript:;" onclick="javascript:$('#modal').modal();" class="control-label">
        <img src="app/core/styles/images/icon_add.png" alt="" style="width: 20px;height: 20px;margin-right: 5px;">新增
    </a>
    <div class="table-div col-sm-11" style="margin-left: 50px">

        <table class="table table-bordered table-responsive">
            <thead>
            <tr>
                <th>物料名称</th>
                <th>型号</th>
                <th>品牌</th>
                <th>物料描述</th>
                <th>采购量</th>
                <th>附件</th>
                <th>图片/图纸(数量)</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="itemlists">
            </tbody>
        </table>
    </div>
</div>

<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">合作要求</h4>
<div class="form-group">
    <label for="purchasecapital" class="control-label col-sm-2"><span
                class="hln-cue">*</span>注册资本：</label>
    <div class="col-sm-3">
        <input type="text" class="form-control require" name="args[purchasecapital]" id="purchasecapital" size="40px"
               needle="needle" msg="您必须输入注册资本" onkeyup="value=value.replace(/[^\d]/g,'')"/>


    </div>
    <span>万元</span>
</div>

<div class="form-group">
    <label for="purchasefinancial" class="control-label col-sm-2"><span
                class="hln-cue">*</span>财务状况：</label>
    <div class="col-sm-3">
        <select class="form-control require" name="args[purchasefinancial]" id="purchasefinancial" current=""
                needle="needle"
                msg="您必须选择财务状况">
            <option value='优秀'>优秀</option>
            <option value='良好'>良好</option>
        </select>

    </div>
</div>

<div class="form-group">
    <label for="purchasecompsize" class="control-label col-sm-2"><span
                class="hln-cue">*</span>公司规模：</label>
    <div class="col-sm-3">
        <select class="form-control require" name="args[purchasecompsize]" id="purchasecompsize" current=""
                needle="needle"
                msg="您必须选择公司规模">
            <option value='100人以上'>100人以上</option>
            <option value='50-100人'>50-100人</option>
            <option value='50人以下'>50人以下</option>
        </select>

    </div>
</div>

<div class="form-group">
    <label for="purchasestate" class="control-label col-sm-2"><span
                class="hln-cue">*</span>经营状况：</label>
    <div class="col-sm-3">
        <input type="text" class="form-control require" name="args[purchasestate]" id="purchasestate" needle="needle"
               msg="您必须输入经营状况"/>
    </div>
</div>

<div class="form-group">
    <label for="purchaseother" class="control-label col-sm-2"><span
                class="hln-cue">*</span>其他要求：</label>
    <div class="col-sm-3">
        <input type="text" class="form-control require" name="args[purchaseother]" id="purchaseother" needle="needle"
               msg="您必须输入其他要求"/>
    </div>
</div>
<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">补充要求</h4>

<div class="form-group">
    <label for="purchasedescribe" class="control-label col-sm-2"></label>
    <div class="col-sm-9">
        <textarea class="form-control" name="args[purchasesupport]" id="purchasesupport1" rows="7" cols="4">需要包含税价,报价包含运费，不允许对询价单部分物料报价</textarea>
    </div>
</div>

<script type="text/javascript">
    var t = document.getElementById('purchasesupport1');
    t.onfocus = function () {
        if (this.innerHTML == '需要包含税价,报价包含运费，不允许对询价单部分物料报价') {
            this.value = ''
        }
    };

    t.onblur = function () {
        if (this.value == '') {
            this.innerHTML = '需要包含税价,报价包含运费，不允许对询价单部分物料报价'
        }
    };
</script>