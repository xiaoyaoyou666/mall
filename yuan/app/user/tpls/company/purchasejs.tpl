<script>
    function addPurchaseItem()
    {
        var status = false;
        $("#publishinvestment").find(":input").not('.ckeditor').each(function(){
            var _this = this;
            var data = xvars($(_this));
            if(!data.result && !status){
                $.zoombox.show('ajax',data);
                status = true;
                return ;
            }
        });
        if(status)return false;
        var r = $("#publishinvestment").find(":input").serialize();
        $.ajax({"url":'index.php?user-api-ajax-additem',
        "type":"post",
        "data":r,
        "success":function(data){
        $('#itemlists').append(data);
        $('#modal').modal('hide');
        $("#publishinvestment")[0].reset();
        $("#pics-range").html('');
        }
    });
    }
</script>
<div id="modal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" class="close" type="button" data-dismiss="modal">×</button>
                <h4 id="myModalLabel">
                    添加采购设备
                </h4>
            </div>
            <div class="modal-body" id="modal-body">
                <form id="publishinvestment" class="form-horizontal">
                    <div class="form-group">
                        <label for="basicexam_auto" class="control-label col-sm-3"><span style="color:red">*</span>物料名称：</label>
                        <div class="col-sm-6 form-inline">
                            <input class="form-control" type="text" needle="needle" msg="请输入物料名称" name="args[purchaseName]" value="" />
                            <input class="form-control" type="hidden"  name="args[deviceType]" value="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="basicexam_auto" class="control-label col-sm-3">型号：</label>
                        <div class="col-sm-6 form-inline">
                            <input class="form-control" type="text" name="args[deviceModule]" value="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="basicexam_auto" class="control-label col-sm-3"><span style="color:red">*</span>品牌：</label>
                        <div class="col-sm-6 form-inline">
                            <input class="form-control" type="text"  needle="needle" msg="请输入品牌" name="args[deviceBrand]" value="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="basicexam_auto" class="control-label col-sm-3"><span style="color:red">*</span>采购量：</label>
                        <div class="col-sm-6 form-inline">
                            <input class="form-control" type="text"  needle="needle" msg="请输入采购量" name="args[deviceCount]" value="" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="basicexam_auto" class="control-label col-sm-3">图片图纸：</label>
                        <div class="col-sm-9">
                            <div class="sortable" id="pics-range"></div>
                            <script type="text/template" id="pe-template-pics">
                                <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                    <div class="qq-upload-list-selector hide" aria-live="polite" aria-relevant="additions removals">
                                        <span></span>
                                    </div>
                                    <div class="listimg hide">
                                        <div class="thumbnail col-xs-3 listimgselector">
                                            <img class="qq-thumbnail-selector" alt="点击上传新图片" src="*value*">
                                            <input type="hidden" class="qq-edit-filename-selector" name="*name*" tabindex="0" value="*value*">
                                        </div>
                                    </div>
                                    <div class="qq-upload-button-selector qq-upload-button" style="clear:both;">
                                        <a class="btn btn-primary">添加图片</a>
                                    </div>
                                </div>
                            </script>
                            <div class="fineuploader" attr-box="pics-range" attr-name="args[pics][]" attr-type="list" attr-list="true" attr-template="pe-template-pics" attr-ftype="jpg,png,gif"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="basicexam_auto" class="control-label col-sm-3"><span style="color:red">*</span>附件：</label>
                        <div class="col-sm-9">
                            <script type="text/template" id="pe-template-url">
                                <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;position: absolute;">
                                    <div class="qq-uploader-selector" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
                                        <div class="qq-upload-button-selector" style="position: absolute;left: 163px;">
                                            <ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <span class="btn btn-primary">已上传</span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[attach]" tabindex="0" value="" needle="needle" msg="您必须上传报价单">
                                                    <span class="qq-upload-file-selector qq-upload-file"></span>
                                                </li>
                                            </ul>
                                            <ul class="qq-upload-list-selector list-unstyled pull-left" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
                                                <li class="text-center">
                                                    <span class="btn btn-default">点击上传附件</span>
                                                    <input size="60" class="form-control qq-edit-filename-selector" type="hidden" name="args[attach]" tabindex="0" value="" needle="needle" msg="您必须上传报价单">
                                                    <span style="color:#999">文件格式（xls,xlsx,zip,word,rar,pdf,excel）</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </script>
                        </div>
                        <div class="fineuploader" attr-list="true" attr-template="pe-template-url" attr-ftype="xls,xlsx,zip,word,rar,pdf,excel,doc">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="basicexam_auto" class="control-label col-sm-3">物料描述：</label>
                        <div class="col-sm-6 form-inline">
                            <textarea style="width: 300px; height: 100px;" class="form-control" type="text"  name="args[summary]" value="" ></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" style="background-color: #009944;border: none;" onclick="javascript:addPurchaseItem();">提交</button>
                <button aria-hidden="true" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>