<div class="form-group">
    <label for="purchasetitle" class="control-label col-sm-2"><span
                class="hln-cue">*</span>采购标题：</label>
    <div class="col-sm-4">
        <input class="form-control " type="text" id="purchasetitle" name="args[purchasetitle]" needle="needle"
               msg="您必须输入标题" value="{x2;$purchase['purchasetitle']}" maxlength="30">
    </div>
</div>
<div class="form-group">
    <label for="purchasetitle" class="control-label col-sm-2"><span
                class="hln-cue">*</span>发布时间：</label>
    <div class="col-sm-4">
        <input class="form-control datetimepicker require" data-minview="0" data-date="{x2;date:TIME,'Y-m-d H:i:s'}"
               data-date-format="yyyy-mm-dd hh:ii:ss" type="text"
               value="{x2;date:$purchase['purchaseinputtime'],'Y-m-d H:i:s'}" name="args[purchaseinputtime]"
               needle="needle" msg="您必须输入发布时间">
    </div>
</div>
<div class="form-group">
    <label for="purchasetype" class="control-label col-sm-2"><span
                class="hln-cue">*</span>采购类型：</label>
    <div class="col-sm-3">
        <select class="form-control require" name="args[purchasetype]" id="purchasetype0" style="text-align" current=""
                needle="needle" msg="您必须选择采购类型">
            <option value=''>标准订单</option>
            <option value='设备'
                    {x2;if:$purchase['purchasetype']=='设备'}
                    selected="true" ;
                    {x2;endif}>设备
            </option>
            <option value='材料'
                    {x2;if:$purchase['purchasetype']=='材料'}
                    selected="true" ;
                    {x2;endif}>材料
            </option>
            <option value='施工'
                    {x2;if:$purchase['purchasetype']=='施工'}
                    selected="true" ;
                    {x2;endif}>施工
            </option>
            <option value='服务'
                    {x2;if:$purchase['purchasetype']=='服务'}
                    selected="true" ;
                    {x2;endif}>服务
            </option>
        </select>
    </div>
</div>
<div class="form-group">
    <label for="purchasetitle" class="control-label col-sm-2"><span
                class="hln-cue">*</span>采购结束时间：</label>
    <div class="col-sm-4">
        <input class="form-control datetimepicker require" data-minview="0" data-date="{x2;date:TIME,'Y-m-d H:i:s'}"
               data-date-format="yyyy-mm-dd hh:ii:ss" type="text" id="purchasetitle" name="args[purchase_finishtime]"
               needle="needle" msg="您必须输入发布时间" value="{x2;if:!empty($purchase['purchase_finishtime'])}{x2;date:$purchase['purchase_finishtime'],'Y-m-d H:i:s'}{x2;endif}">
    </div>
</div>
<div class="form-group">
    <label for="purchasetitle" class="control-label col-sm-2"><span
                class="hln-cue">*</span>期望收货时间：</label>
    <div class="col-sm-4">
        <input class="form-control datetimepicker require" data-minview="0" data-date="{x2;date:TIME,'Y-m-d H:i:s'}"
               data-date-format="yyyy-mm-dd hh:ii:ss" type="text" id="purchasetitle" name="args[purchase_recivetime]"
               needle="needle" msg="您必须输入发布时间" value="{x2;if:!empty($purchase['purchase_recivetime'])}{x2;date:$purchase['purchase_recivetime'],'Y-m-d H:i:s'}{x2;endif}">
    </div>
</div>
<div class="form-group" style="margin-bottom: 0">
    <label for="purchase_province" class="control-label col-sm-2"><span
                class="hln-cue">*</span>收货地址：</label>
    <div class="col-md-10 form-group">
        <div class="col-sm-2">
            <select class="autoloaditem combox form-control require" autoload="index.php?core-api-index-getProvince"
                    target="service_city" refurl="index.php?core-api-index-getcity&amp;parent={value}"
                    name="args[service_province]" id="service_province" current="{x2;$purchase['service_province']}"
                    needle="needle" msg="您必须选择省"></select>
        </div>
        <div class="col-sm-2">
            <select class="autoloaditem combox form-control require" autoload="index.php?core-api-index-getcity"
                    target="service_area" refurl="index.php?core-api-index-getarea&amp;parent={value}"
                    parent="#service_province" name="args[service_city]" id="service_city"
                    current="{x2;$purchase['service_city']}" needle="needle" msg="您必须选择市">
            </select>

        </div>
        <div class="col-sm-2">
            <select class="autoloaditem form-control require" autoload="index.php?core-api-index-getarea"
                    parent="#service_city" name="args[service_area]" id="service_area"
                    current="{x2;$purchase['service_area']}" needle="needle" msg="您必须选择区"></select>
        </div>
    </div>
</div>

<div class="form-group">
    <div class="col-sm-2"></div>
    <div class="col-sm-4">
        <input type="text" class="form-control require" name="args[purchase_address]" id="purchase_address"
               placeholder="详细地址" needle="needle" msg="您必须输入详细地址"/ value="{x2;$purchase['purchase_address']}">
    </div>
</div>
<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">采购物料</h4>
<div class="form-group">
    <label for="block" class="control-label col-sm-2">
        <span class="hln-cue">*</span>采购物料：</label>
    <a href="javascript:;" onclick="javascript:$('#modal').modal();" class="control-label">
        <img src="app/core/styles/images/icon_add.png" alt="" style="width: 20px;height: 20px">
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
            {x2;$purchaseinfostr}
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
               needle="needle" msg="您必须输入注册资本" value="{x2;$purchase['purchasecapital']}"
               onkeyup="value=value.replace(/[^\d]/g,'')"/>
    </div>
    <span>万元</span>
</div>
<div class="form-group">
    <label for="purchasefinancial" class="control-label col-sm-2"><span
                class="hln-cue">*</span>财务状况：</label>
    <div class="col-sm-3">
        <select class="form-control require" name="args[purchasefinancial]" id="purchasefinancial" current=""
                needle="needle" msg="您必须选择财务状况">

            <option value='优秀'
                    {x2;if:$purchase['purchasefinancial']=='优秀'}
                    selected="true" ;
                    {x2;endif}>优秀
            </option>
            <option value='良好'
                    {x2;if:$purchase['purchasefinancial']=='良好'}
                    selected="true" ;
                    {x2;endif}>良好
            </option>

        </select>

    </div>
</div>

<div class="form-group">
    <label for="purchasecompsize" class="control-label col-sm-2"><span
                class="hln-cue">*</span>公司规模：</label>
    <div class="col-sm-3">
        <select class="form-control require" name="args[purchasecompsize]" id="purchasecompsize" current=""
                needle="needle" msg="您必须选择公司规模">
            <option value='100人以上'
                    {x2;if:$purchase['purchasecompsize']=='100人以上'}
                    selected="true" ;
                    {x2;endif}>100人以上
            </option>
            <option value='50-100人'
                    {x2;if:$purchase['purchasecompsize']=='50-100人'}
                    selected="true" ;
                    {x2;endif}>50-100人
            </option>
            <option value='50人以下'
                    {x2;if:$purchase['purchasecompsize']=='50人以下'}
                    selected="true" ;
                    {x2;endif}>50人以下
            </option>
        </select>

    </div>
</div>
<div class="form-group">
    <label for="purchasestate" class="control-label col-sm-2"><span
                class="hln-cue">*</span>经营状况：</label>
    <div class="col-sm-3">
        <input type="text" class="form-control require" name="args[purchasestate]" id="purchasestate" needle="needle"
               msg="您必须输入经营状况" value="{x2;$purchase['purchasestate']}"/>
    </div>
</div>

<div class="form-group">
    <label for="purchaseother" class="control-label col-sm-2"><span
                class="hln-cue">*</span>其他要求：</label>
    <div class="col-sm-3">
        <input type="text" class="form-control require" name="args[purchaseother]" id="purchaseother" needle="needle"
               msg="您必须输入其他要求" value="{x2;$purchase['purchaseother']}"/>
    </div>
</div>
<h4 class="title"><img src="app/core/styles/images/icon_inf.png" alt="">补充要求</h4>
<div class="form-group">
    <label for="purchasedescribe" class="control-label col-sm-2"></label>
    <div class="col-sm-9">
        <textarea class="form-control" name="args[purchasesupport]" id="purchasesupport1" rows="7"
                  cols="4">{x2;$purchase['purchasesupport']}</textarea>
    </div>
</div>