<?php
/*
 * Created on 2016-5-19
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class action extends app
{
	public function display()
	{
		$action = $this->ev->url(3);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function content()
	{
		$search = $this->ev->get('search') ;
		$page = intval($this->ev->get('page'));
		$this->tpl->assign('page',$page);
		$u = '';
		if($search)
		{
			$this->tpl->assign('search',$search);
			foreach($search as $key => $arg)
			{
				$u .= "&search[{$key}]={$arg}";
			}
		}
		$this->tpl->assign('u',$u);
		$args = array();
        if($search['goodsid'])
        {
            $args[] = array("AND","goodsid = :goodsid",'goodsid',$search['goodsid']);
        }
        if($search['goodsname'])
        {
            $args[] = array("AND","goodstitle like '%".$search['goodsname']."%'");
        }
		$posid = $this->ev->get('posid');
		$position = $this->position->getPosById($posid);
		$args[] = array("AND","pcposid = :pcposid","pcposid",$posid);
		$contents = $this->position->getItemPosContentList($args,$page,20);
        $this->tpl->assign('posid',$posid);
		$this->tpl->assign('position',$position);
		$this->tpl->assign('contents',$contents);
		$this->tpl->display('position_content');
	}

	private function delcontent()
	{
		$pcid = $this->ev->get('pcid');
		$this->position->delPosContent($pcid);
		$message = array(
            'statusCode' => 200,
            "message" => "删除成功",
            "callbackType" => 'forward',
            "forwardUrl" => "reload"
        );
        exit(json_encode($message));
	}

	private function lite()
	{
		$delids = $this->ev->get('delids');
		if($this->ev->get('action') == 'delete')
		{
			foreach($delids as $key => $p)
			{
				$this->position->delPosContent($key);
			}
		}
		elseif($this->ev->get('action') == 'modify')
		{
			$ids = $this->ev->get('ids');
			foreach($ids as $key => $p)
			{
				$this->position->modifyPosContent($key,array("pcsequence" => $p));
			}
		}
		else
		{
			$message = array(
                'statusCode' => 300,
                "message" => "非法操作"
            );
            exit(json_encode($message));
		}
		$message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => 'forward',
            "forwardUrl" => "reload"
        );
        exit(json_encode($message));
	}

	private function add()
	{
		if($this->ev->get('addpos'))
		{
			$args = $this->ev->get('args');
			$args['posapp'] = $this->G->app;
			$args['goodsposstime'] = strtotime($args['goodsposstime']);
			$args['goodsposetime'] = strtotime($args['goodsposetime']);
			$this->position->addPos($args);
			$message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => 'forward',
                "forwardUrl" => "index.php?".$this->G->app."-master-position"
            );
            exit(json_encode($message));
		}
		else
		$this->tpl->display('addpos');
	}

	private function modify()
	{
		$posid = $this->ev->get('posid');
		$position = $this->position->getPosById($posid);
		$this->tpl->assign('position',$position);
		if($this->ev->get('modifypos'))
		{
			$args = $this->ev->get('args');
			$args['goodsposstime'] = strtotime($args['goodsposstime']);
			$args['goodsposetime'] = strtotime($args['goodsposetime']);
			$this->position->modifyPos($posid,$args);
			$message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => 'forward',
                "forwardUrl" => "index.php?".$this->G->app."-master-position"
            );
            exit(json_encode($message));
		}
		else
		$this->tpl->display('modifypos');
	}

	private function del()
	{
		$posid = $this->ev->get('posid');
		$this->position->delPos($posid);
		$this->position->delPosContentsByPosid($posid);
		$message = array(
            'statusCode' => 200,
            "message" => "删除成功",
            "callbackType" => 'forward',
            "forwardUrl" => "reload"
        );
        exit(json_encode($message));
	}

	private function index()
	{
		$page = intval($this->ev->get('page'));
		$this->tpl->assign('page',$page);
		$positions = $this->position->getPosListByApp($this->G->app,$page,10);
		$this->tpl->assign('positions',$positions);
		$this->tpl->display('position');
	}
}


?>
