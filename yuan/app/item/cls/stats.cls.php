<?php
/*
数据统计类
*/
class stats_item
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()//框架里面的类初始化函数。执行一些初始化操作。类工厂生成一个对象的时候自动调用
	{
		$this->sql = $this->G->make('sql');//用于生成CRUD的SQL语句。
		$this->db = $this->G->make('db');//数据库类
		$this->tpl = $this->G->make('tpl');
		$this->ev = $this->G->make('ev');
		$this->files = $this->G->make('files');
		$this->item = $this->G->make('item','item');
		$this->user = $this->G->make('user','user');
	}
	
	public function statUserDrictSale($userid,$starttime='2014-01-01 00:00:00',$endtime='2099-12-31 23:59:59',$itemids='all',$itemCats='all'){
		//统计某个用户的直接销售.$itemids，要统计的商品编号。多个商品用逗号分隔。$itemcats，要统计的商品分类编号，多个分类用逗号分隔
		$wherestr="userid=".$userid." AND accounttime>='{$starttime}' AND accounttime<='{$endtime}' AND outuserid=".$userid;//查找出货人为自己的。即为直接销售。
		if($itemids!='all'){
			$itemids=explode(',',$itemids);
			$wherestr.=' AND (';
			foreach($itemids as $itemid){
				$wherestr.='aisitemid='.$itemid.' OR ';	
			}
			$wherestr.=' 1=1)';
		}
		
		if($itemCats!='all'){
			$itemCats=explode(',',$itemCats);
			$wherestr.=' AND (';
			foreach($itemCats as $itemcat){
				$wherestr.=' aisitemcatid='.$itemcat.' OR ';	
			}
			$wherestr.=' 1=1)';
		}
		$data=array('SUM(outamount) as s0,SUM(inamount) as s1,SUM(aisitemnumber) as s2,SUM(profit) as s3,SUM(itemlirun) as s4','accountitems',$wherestr,false,false,false);
		$sql=$this->sql->makeSelect($data);
		$sums=$this->db->fetch($sql);//统计用户的直接销售相关参数，包括销售商品数量、总进价、总出价、用户总利润。酒好买毛利润
		return array('outamount'=>$sums['s0'],'inamount'=>$sums['s1'],'aisitemnumber'=>$sums['s2'],'profit'=>$sums['s3'],'itemlirun'=>$sums['s4']);//分别为：用户出货总金额，用户进货总金额，用户销售商品总数，用户利润总额，酒好买利润总额（未计入平台分成）
	}
	
	public function statUserTreeDrictSale($leaderid,$starttime='2014-01-01 00:00:00',$endtime='2099-12-31 23:59:59',$itemids='all',$itemCats='all'){//获取家族所有成员的直接销售
		$userTree=$this->user->getUserTreeById($leaderid);
		$result=array('outamount'=>0,'inamount'=>0,'aisitemnumber'=>0,'profit'=>0,'itemlirun'>=0);
		foreach($userTree as $u){
			$sums=$this->statUserDrictSale($u['userid'],$starttime,$endtime,$itemids,$itemCats);
			$result['outamount']+=$sums['outamount'];	
			$result['inamount']+=$sums['inamount'];	
			$result['aisitemnumber']+=$sums['aisitemnumber'];	
			$result['profit']+=$sums['profit'];	
			$result['itemlirun']+=$sums['itemlirun'];	
		}
		return $result;
	}
	
	public function statUserSonDrictSale($leaderid,$starttime='2014-01-01 00:00:00',$endtime='2099-12-31 23:59:59',$itemids='all',$itemCats='all'){//获取直接下线的直接销售
		$sons=$this->user->getUserSonsById($leaderid);
		$result=array('outamount'=>0,'inamount'=>0,'aisitemnumber'=>0,'profit'=>0,'itemlirun'>=0);
		foreach($sons as $u){
			$sums=$this->statUserDrictSale($u['userid'],$starttime,$endtime,$itemids,$itemCats);
			$result['outamount']+=$sums['outamount'];	
			$result['inamount']+=$sums['inamount'];	
			$result['aisitemnumber']+=$sums['aisitemnumber'];	
			$result['profit']+=$sums['profit'];	
			$result['itemlirun']+=$sums['itemlirun'];	
		}
		return $result;
	}

}

?>
