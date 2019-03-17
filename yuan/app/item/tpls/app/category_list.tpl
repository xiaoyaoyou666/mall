    	<header class="container-fluid" style="background-color:#FFFFFF;border-bottom:1px solid #cccccc;">
			<h5 class="text-center">
				<em style="font-size:2.6rem;color:#000000;" class="pull-left glyphicon glyphicon-menu-left" onclick="javascript:$.goPrePage();"></em>
				<span class="ttlo" style="color:#000000;">{x2;$cat['catname']}</span>
				<em style="font-size:2.6rem;color:#000000;" class="pull-right glyphicon glyphicon-phone" onclick="javascript:$.goPage($('#page1'));"></em>
			</h5>
		</header>
    	<div class="container-fluid">
			{x2;tree:$goodslist['data'],item,iid}
			<div style="clear:both;overflow:hidden;background:#FFFFFF;margin-top:0.5rem">
				<div class="col-xs-4">
					<a href="index.php?item-app-item&goodsid={x2;v:item['goodsid']}" class="ajax" data-page="detail" data-target="detail">
						<img src="{x2;v:item['goodsthumb']}" style="width:10rem;margin-top:0.5rem"/>
					</a>
				</div>
				<div class="col-xs-8" style="padding:0.2rem;">
					<div class="text-left" style="padding:0.2rem;">
						<a href="index.php?item-app-item&goodsid={x2;v:item['goodsid']}" class="ajax" data-page="detail" data-target="detail">
							<h5>{x2;v:item['goodstitle']}</h5>
							<p style="font-size:1rem;">{x2;v:item['goodsadv']}</p>
							<p class="text-warning">￥{x2;v:item['goodsminprice']}</p>
						</a>
					</div>
				</div>
			</div>
			{x2;endif}
			{x2;if:$page <= 1}
			{x2;if:$goodslist['pages']}
			<h4 class="text-center" style="background:#FFFFFF;margin-top:0.5rem">
				<a href="index.php?item-app-category-lists&catid={x2;$cat['catid']}&page=2" class="ajax" data-page="list" data-target="list" style="line-height:4rem;">查看更多</a>
			</h4>
			{x2;endif}
			{x2;else}
			<h4 class="text-center" style="background:#FFFFFF;margin-top:0.5rem">
				<ul class="pagination">{x2;$goodslist['pages']}</ul>
			</h4>
			{x2;endif}
		</div>