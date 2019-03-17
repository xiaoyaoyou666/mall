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
        if(!$this->_user['sessionuserid'])
        {
            header("location:index.php?user-app-login");
            exit;
        }
        $action = $this->ev->url(3);
        $this->cart = $this->G->make('cart','item');
        $this->link = $this->G->make('link','content');
        $this->collect = $this->G->make('collect','user');
        $this->agreement = $this->G->make('agreement', 'agreement');
        $this->agreementgoods = $this->G->make('agreementgoods', 'agreement');
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

    private function askprice()
    {
        if($this->ev->get('askprice'))
        {
            $args = $this->ev->get('args');
            $args['askitemuserid'] = $this->_user['sessionuserid'];
            $args['askitemtime'] = TIME;
            $this->item->addAskitem($args);
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        }
    }

    private function index()
    {
        $goodsid = $this->ev->get('goodsid');
        $goods = $this->item->getGoodsById($goodsid);
        //商品参数
        $goodparameter = json_decode($goods['goodparameter'],true);
        $this->item->updatepageviews($goodsid,$goods['goodspv']);   //更新浏览量
        $company = $this->user->getUserById($goods['goodsuserid']);
        $items = $this->item->getGoodsSystemPropertyApi($goodsid);
        $groomList = $this->item->listGoods(array(array("AND","goodsstatus = 1")),1,4);   //热门推荐
        //如果是协议商品，取协议价格和协议规格
        $user = $this->user->getUserById($this->_user['sessionuserid']);
        $resIdArr = $this->agreement->getValidAgreementidArrByCompId($user['sap_company_id']);  //取当前用户所有的协议id
        $validAgreementIdArr = array();
        foreach($resIdArr as $k => $v)
        {
            $validAgreementIdArr[] = $v['agreementid'];
        }
        $validAgreementIdStr = implode(',',$validAgreementIdArr);
        //如果有生效的协议规格，重新渲染商品规格、价格
        if( !empty($validAgreementIdStr))
        {
            //按商品id，公司id，协议ids取协议商品和规格
            $agreementItems = $this->agreementgoods->getItemsByGoodsidAndAgreementid($goodsid,$user['sap_company_id'],$validAgreementIdStr);
            if( !empty($agreementItems))
            {
                $tempItems = array();
                foreach($items['items'] as $key => $item)
                {
                    foreach($agreementItems as $k => $val)
                    {
                        if($item['itemid'] == $val['itemid'])
                        {
                            $item['itemprice'] = $val['agreement_price'];
                            $item['agreementid'] = $val['agreementid'];
                            $tempItems[$key] = $item;
                        }
                    }
                }
                $unsetKey = array_diff_key($items['items'],$tempItems); //找出没有在协议的商品规格
                $items['items'] = $tempItems;
                //删除没有包括在协议的商品规格
                foreach($items['fields'] as $kk => &$field)
                {
                    foreach($unsetKey as $kkk => $vv)
                    {
                        unset($field['pars'][$kkk]);
                    }
                }
            }

        }

        $seeAgainList = array();
        //把已查看的商品存到session
        if( !empty($_SESSION['see_again_ids']))
        {
            //判断该商品是否重复浏览
            if( !in_array($goods['goodsid'],$_SESSION['see_again_ids']))
            {
                if( count($_SESSION['see_again_ids']) > 9)
                {
                    array_shift($_SESSION['see_again_list']);
                    array_shift($_SESSION['see_again_ids']);
                }
                array_push($_SESSION['see_again_list'],$goods);
                array_push($_SESSION['see_again_ids'],$goods['goodsid']);
            }
            $seeAgainList = $_SESSION['see_again_list'];
        }else{
            $_SESSION['see_again_list'][] = $goods;
            $_SESSION['see_again_ids'][] = $goods['goodsid'];
            $seeAgainList = $_SESSION['see_again_list'];
        }

        $agreementPric = ($this->ev->get('p')) ? $this->ev->get('p') : 0;
        $this->tpl->assign('items',$items);
        $this->tpl->assign('company',$company);
        $this->tpl->assign('goods',$goods);
        $this->tpl->assign('groomList',$groomList);
        $this->tpl->assign('agreementid',$agreementid);
        $this->tpl->assign('seeAgainList',$seeAgainList);
        $this->tpl->assign('agreementPric',$agreementPric);
        $this->tpl->assign('goodparameter',$goodparameter);
        $this->tpl->display('item');
    }

    /**
     * @action  收藏商品/取消商品
     * @param   $param  array  insert 数据
     * @param   $collectlist   array    list展示数据 有则删除 无则添加程序
     * @param   delcollect     delete   $cid   $type
     * @param   addStatistics  insert   param
     */
     private function goods()
     {
          $number = 1;
          $param = array();
          $param['collecttype'] = $this->ev->get('type');
          $param['collectuid'] = $this->_user['sessionuserid'];
          $param['collectgoodsid'] =$this->ev->get('collect');
          $param['status'] = 1;
          $param['createtime'] = time();
          $collectlist = $this->collect->getGoodsList($param['collecttype'],$param['collectuid'],$param['collectgoodsid']);

           if(!empty($collectlist)){
               //需要小商品关注次数 减一  分两步  查数据  添加数据
               $this->collect->Goodscollectminus($param['collectgoodsid'],$number);
               $cid = $collectlist['collectid'];
               $type = $collectlist['collecttype'];
              //删除商品记录表
               $res = $this->collect->delCollectById($cid,$type);
               if($res){
                   $message = array(
                       'statusCode' => 300,
                       "message" => "取消收藏成功"
                   );
                   exit(json_encode($message));
               }
           }else{
               //需要小商品关注次数  加一  分两步   查数据  添加数据
               $resd = $this->collect->Goodscollectadd($param['collectgoodsid'],$number);
               //添加商品记录表
               $res = $this->collect->addGoodsrecord($param);
               if($res){
                     $message = array(
                        'statusCode' => 200,
                        "message" => "收藏成功"
                     );
                   exit(json_encode($message));
                }
           }
     }

    /**
     * @action  商品自动显示 是否收藏状态
     * @param   $type        int      类型
     * @param   $paramuid    string   用户id
     * @param   $paramgid    string   商品id
     */
   private function collectshows()
   {
        $paramtype = 1;
        $paramuid = $this->_user['sessionuserid'];
        $paramgid =$this->ev->get('goodsed');
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
