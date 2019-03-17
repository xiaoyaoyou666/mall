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
		$this->link = $this->G->make('link','content');
		$this->collect = $this->G->make('collect','user');
        $args22[] = array("AND","status = :status",'status',1);
        $links = $this->link->getLinkList($args22,$page,10);
        $this->tpl->assign('links',$links);

        $this->cart = $this->G->make('cart','item');
        $cartNumArr = $this->cart->getCartUserNum();
        foreach ($cartNumArr as $k => $v) {
            $cartnums[] = $v['number'];
        }
       $cartNum = array_sum($cartnums)?array_sum($cartnums):0;
        $this->tpl->assign('cartNum',$cartNum);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function index()
	{
		$page = intval($this->ev->get('page'));
		$ordertype = intval($this->ev->get('ordertype'));
		$companyid = intval($this->ev->get('companyid'));

		#增加点击量
		$company = $this->user->getUserById($companyid);
		$args6['userreferrer'] = $company['userreferrer'] + 1;
		$this->user->modifyUserInfo($args6,$company['userid']);


		$page = $page?$page:1;
		if($ordertype == 1)
        $order = 'goodsminprice asc';
        else
        $order = 'goodstime desc';
        $goods = $this->item->listGoods(array(array("AND","goodsstatus = 1"),array("AND","goodsuserid = :goodsuserid","goodsuserid",$companyid)),$page,20,$order);

        $islogin = $this->_user ? 1 : 0;

        $this->tpl->assign('islogin',$islogin);
        $this->tpl->assign('goods',$goods);
        $this->tpl->assign('company',$company);
        $this->tpl->assign('page',$page);
        $this->tpl->display('company');
	}

	/**
     * @action   ajax 收藏供应商
     * @param    select  collectlist
     */
	private function companyshow()
    {
        $number = 1;
        $param = array();
        $param['collecttype'] = $this->ev->get('type');
        $param['collectuid'] =  $this->_user['sessionuserid'];
        $param['collectgoodsid'] =  $this->ev->get('companyname');
        $param['status'] = 1;
        $param['createtime'] = time();
        $companylist = $this->collect->getGoodsList($param['collecttype'],$param['collectuid'],$param['collectgoodsid']);
        if ($this->_user['sessionuserid']) {
            //var_dump(111);die;
           if(!empty($companylist)){
                //var_dump(333);die;
                //供应商收藏减一
               $red = $this->collect->companycollectminus($param['collectgoodsid'],$number);
                $type = $companylist['collecttype'];
                $cid = $companylist['collectid'];
                //删除企业收藏记录
                $res = $this->collect->delCollectById($cid,$type);
                if($res){
                    $message = array(
                        'statusCode' => 300,
                        "message" => "取消收藏成功"
                    );
                    exit(json_encode($message));
                }
            }else{
                //var_dump(333);die;
                //供应商数量加一
                $red = $this->collect->companycollectadd($param['collectgoodsid'],$number);
                //添加企业收藏记录
                $res = $this->collect->addGoodsrecord($param);
                if($res){
                    $message = array(
                        'statusCode' => 200,
                        "message" => "收藏成功"
                    );
                    exit(json_encode($message));
                }
            } 
        } else {
            //var_dump(222);die;
           $message = array(
                'statusCode' => 301,
                "message" => "收藏成功"
            );
            exit(json_encode($message));
        }
        

        
    }

    /**
     * @action  供应商 自动显示 是否收藏状态
     * @param   $type        int      类型
     * @param   $paramuid    string   用户id
     * @param   $paramgid    string   商品id
     */
    private function collectshows()
    {
        $paramtype = 2;
        $paramuid = $this->_user['sessionuserid'];
        $paramgid =$this->ev->get('companyname');
        $collectlist = $this->collect->getGoodsList($paramtype,$paramuid,$paramgid);
        if($collectlist){
            $message = array(
                'statusCode' => 200,
                "message" => "收藏成功"
            );
            exit(json_encode($message));
        }else{
            $message = array(
                'statusCode' => 300,
                "message" => "取消收藏成功"
            );
            exit(json_encode($message));
        }
    }
	
	
	
}


?>
