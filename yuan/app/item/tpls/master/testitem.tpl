{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
			{x2;include:menu}
		</div>
		<div class="span10" id="dataitem">
{x2;endif}
			<ul class="breadcrumb">
				<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a> <span class="divider">/</span></li>
				<li class="active">效果预览</li>
			</ul>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#">效果预览</a>
				</li>
				<li class="pull-right">
					<a href="index.php?item-master-items-stock&goodsid={x2;$goods['goodsid']}">库存列表</a>
				</li>
			</ul>
			<h3>{x2;$goods['goodstitle']}</h3>
			<table class="table table-hover">
	            <thead>
	                <tr>
	                    <th></th>
	                </tr>
	            </thead>
	            <tbody>
	            	{x2;tree:$items['fields'],field,fid}
	            	<tr>
	                    <td class="td_{x2;v:field['field']}">{x2;v:field['fieldtitle']}：
	                    	{x2;tree:v:field['pars'],par,pid}
	                    		<a href="javascript:;" onclick="javascript:selectpar('{x2;v:field['field']}','{x2;v:par}',this);" data="{x2;v:par}">{x2;if:v:fid == 1}<img src="{x2;v:field['img'][v:key]}" style="height:24px"/>&nbsp;{x2;endif}{x2;v:par}</a>&nbsp;&nbsp;
	                    	{x2;endtree}
	                    </td>
	                </tr>
	                {x2;endtree}
	                <tr>
	                    <td>
	                    	库存：
	                    	{x2;tree:$items['items'],item,iid}
	                    	<a class="btn parselector"{x2;tree:v:item['pars'],par,pid} data-{x2;v:key}="{x2;v:par}"{x2;endtree}>{x2;v:item['number']}</a>
	                    	{x2;endtree}
	                    </td>
	                </tr>
	        	</tbody>
	        </table>
{x2;if:!$userhash}
		</div>
	</div>
</div>
<script>
var pars = [];
{x2;tree:$items['fields'],field,fid}
var {x2;v:key} = '';
pars.push('{x2;v:key}');
{x2;endtree}
var cnt = [];

function selectpar(parname,parcontent,obj)
{
	//p = $('.parselector[data-'+parname+'="'+parcontent+'"]');
	cnt[parname] = parcontent;
	var cntnumber = 0;
	for(x in cnt)
	{
		if(x != parname)
		{
			//p = p.filter('[data-'+x+'="'+cnt[x]+'"]');
		}
		cntnumber++;
	}
	$(obj).parent().find('a').removeClass('text-error');
	$(obj).addClass('text-error');
	if(pars.length - cntnumber <= 1)
	{
		var ext = '';
		if(pars.length - cntnumber == 1)
		{
			for(x in pars)
			{
				if(!cnt[pars[x]] || cnt[pars[x]]== '')
				{
					ext = pars[x];
					break;
				}
			}
		}
		else
		{
			for(x in pars)
			{
				ext = pars[x];
			}
		}
		if(ext != parname)
		p = $('.parselector[data-'+parname+'="'+parcontent+'"]');
		else
		{
			p = $('.parselector');
		}
		p = $('.parselector');
		for(x in cnt)
		{
			if(x != ext)
			{
				p = p.filter('[data-'+x+'="'+cnt[x]+'"]');
			}
		}
		$('.td_'+ext).find('a').each(function(){
			var _this = this;
			$(_this).show();
			var num = p.filter('[data-'+ext+'="'+$(_this).attr('data')+'"]').html();
			var s = parseInt(num);
			if(pars.length > 1)
			if(s != s || s < 1)$(_this).hide();
		});
	}
	p = $('.parselector');
	for(x in cnt)
	{
		p = p.filter('[data-'+x+'="'+cnt[x]+'"]');
	}
	$('.parselector').removeClass('btn-danger');
	p.addClass('btn-danger');
}
</script>
</body>
</html>
{x2;endif}