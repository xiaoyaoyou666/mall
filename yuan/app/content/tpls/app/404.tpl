{x2;include:header}
<div class="clear"></div>

<script>
    function doSearch() {
        var searchType = $("#searchType").val();
        var searchKeyword = $('#searchKeyword').val();

        var ie = isIE();
        if(ie) {
            var okw = 'searchKeyword=';
        } else {
            var okw = 'searchKeyword=' + encodeURIComponent('');
        }
        var ost = 'searchType=';
        var url = "index.php" + location.search;

        var arr = url.split("&");
        arr[0] = "index.php?content-app-search";

        var opage = "page=";
        var pi = arr.indexOf(opage);
        if(pi > -1) {
            arr.splice(pi, 1);
        }

        var sti = arr.indexOf(ost);
        if(sti > -1) {
            arr[sti] = "searchType=" + searchType;
        } else {
            arr.push("searchType="+searchType);
        }

        var ki = arr.indexOf(okw);
        if(searchKeyword != '') {
            if(ki > 0) {
                arr[ki] = "searchKeyword=" + searchKeyword;
            }else{
                arr.push("searchKeyword=" + searchKeyword);
            }
        } else {
            if(ki > 0) {
                arr.splice(ki, 1);
            }
        }
        url = arr.join("&");
        location.href = url;
    }

    function isIE() { //ie?
        if (!!window.ActiveXObject || "ActiveXObject" in window)
            return true;
        else
            return false;
    }
</script>

<div class="zmm-zx-centent" style="background-color: #fff;">
    <div class="container">
        <img style="float: left; margin:100px 80px 30px 340px;width: 300px; " src="app/core/styles/images/dkf_img.png">
        <div class="dkf_back">
            <p>待开放中，敬请期待！</p>
            <a class="back_sy" href="index.php?">返回首页</a>
        </div>
    </div>
</div>

<div class="clearfix"></div>
{x2;include:footer}
<script>
    function goTop(){
        $('html,body').animate({'scrollTop':0},600);
    }
</script></body>

</html>

