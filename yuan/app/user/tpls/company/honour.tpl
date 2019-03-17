{x2;include:header}
<body id="datacontent">
{x2;include:nav}
<style>
    .delete-btn{
        display: none;
        position: relative;
        border: none;
    }

    .thumbnail{
        width: 210px;
        height: 150px;
    }
    .thumbnail .qq-thumbnail-selector{
        width: 100%;
        height: 100%;
    }
    .thumbnail:hover .delete-btn{
        display: inline-block;
    }
</style>
<div class="zmm-zx-centent">
    <div class="container">
        <!-- 导航 start -->
        <div class="hln-zx-centent-title t20 b20">
            你所在的位置：
            <span><a href="index.php?user-company">企业中心</a> > <a>荣誉资质</a></span>
        </div>
        <!-- 导航 end -->
        <div class="qycenter-content">
            <!-- 左侧栏 start -->
            {x2;include:menu}
            <!-- 左侧栏 end -->
            <!-- 右侧  start -->
            <div class="right-content col10 pull-right honour">
                <!--公司简介-->
                <div>
                    {x2;include:companyinfo}

                <div class="zmm_panel panel-default">
                    <div class="zmm-qydt-title zmm-qydt-shsj1"><p><em class="title-triangle"></em>荣誉资质</p></div>

                    <div class="zmm-panel-body zmm-qy-dtxx zmm-qydt-shsj zmm-gsjj">
                        <form action="" method="post" class="form-horizontal">

                            <div class="form-group">
                                <div class="col-sm-12" style="clear:both;">
                                    <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="padding-bottom: 30px;clear:both;">
                                        {x2;tree:$honors,form,fid}
                                        <li class="text-center" style="float:left; margin-left: 10px;">
                                            <div class="thumbnail">
                                                <a class="btn yellow-text confirm delete-btn" href="index.php?user-company-basic-honourdel&id={x2;v:form['honor_id']}" title="删除" style="float: right;padding: 0;">
                                                    <div class="img-delete-bg" style="display: block">
                                                        <em class="img-delete-icon">×</em>
                                                    </div>
                                                </a>

                                                <img class="qq-thumbnail-selector" src="{x2;v:form['honor_url']}">
                                            </div>
                                            <span>{x2;v:form['honor_title']}</span>
                                        </li>
                                        {x2;endtree}
                                        <a href="index.php?{x2;$_app}-company-basic-honouredit">
                                            <li class="text-center" style="float: left;  margin-left: 10px;">
                                                <div class="thumbnail">
                                                    <img class="qq-thumbnail-selector" src="app/core/styles/images/noimage.gif" alt="点击上传新图片">
                                                </div>
                                            </li>
                                        </a>

                                    </ul>
                                </div>
                            </div>

                        </form>

                    </div>


                </div>

                </div>
            </div>
            <!-- 右侧  end -->

        </div>
    </div>
</div>
{x2;include:footer2}
<script>
    $(function() {
        $('.submenu:eq(0)').delay(400).slideDown(700);
        $('.submenu:eq(0) li:eq(4)').addClass("active");
    });
</script>
</body>
</html>
<script>
//    $(".del").click(function(){
//        var id = this.title;
//        $.ajax({
//            type:'get',
//            url:'index.php?user-company-basic-honourdel',
//            dataType:'json',
//            success:function (data){
//                console.log(data);
//            },
//            error:function(){
//                alert('error')
//            }
//        })
//    });
</script>