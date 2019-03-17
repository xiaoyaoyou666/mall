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
		$this->cart = $this->G->make('cart','item');
		$this->order = $this->G->make('orders','bank');
        $this->msg = $this->G->make('msg','user');
        $this->sap = $this->G->make('sap','item');
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}


    //根据公司code查工厂数据
    private function getFactoryByCode()
    {
        $code = $this->ev->get('code');
        $data = $this->sap->getFactoryByCode($code);
        $html = '';
        foreach ($data as $key=>$val) {
            $checked = $key == 0 ? 'checked' : '';
            $html .= '<option '.$checked.' value="'.$val['werks'].'">'.$val['name1'].'</option>';
        }
        $message = array(
            "statusCode" => 200,
            "message" => '查询成功',
            "data" => $html,
        );
        exit(json_encode($message));

    }

    //确认订单页面 公司模糊搜索
    private function getCompanyByCode()
    {
        $code = $this->ev->get('code');
        $data = $this->sap->getCompanyByCode($code);
        $html = '<ul>';
        foreach ($data as $key=>$val) {
            $html .= '<li name="'.$val['bukrs'].'">'.$val['butxt'].'</li>';
        }
        $html .= '</ul>';
        $message = array(
            "statusCode" => 200,
            "message" => "操作成功",
            "data" => $html,
        );
        exit(json_encode($message));

    }


    //采购组模糊搜索
    private function getCaigouByCode()
    {
        $code = $this->ev->get('code');
        $data = $this->sap->getCaigouByCode($code);
        $html = '<ul>';
        foreach ($data as $key=>$val) {
            $html .= '<li name="'.$val['ekgrp'].'">'.$val['ekorg'].'('.$val['ekgrp'].')'.'</li>';
        }
        $html .= '</ul>';
        $message = array(
            "statusCode" => 200,
            "message" => "操作成功",
            "data" => $html,
        );
        exit(json_encode($message));

    }

    //付款代码模糊搜索
    private function getFukuanByCode()
    {
        $code = $this->ev->get('code');
        $data = $this->sap->getFukuanByCode($code);
        $html = '<ul>';
        foreach ($data as $key=>$val) {
            $html .= '<li name="'.$val['zterm'].'">'.$val['text1'].'</li>';
        }
        $html .= '</ul>';
        $message = array(
            "statusCode" => 200,
            "message" => "操作成功",
            "data" => $html,
        );
        exit(json_encode($message));

    }

    //采购税模糊搜索--根据描述
    private function getShuiByKey()
    {
        $code = $this->ev->get('code');
        $data = $this->sap->getShuiByKey($code);
        $html = '<ul>';
        foreach ($data as $key=>$val) {
            $html .= '<li id="'.$val['mwskz'].'">'.$val['text1'].'</li>';
        }
        $html .= '</ul>';
        $message = array(
            "statusCode" => 200,
            "message" => "操作成功",
            "data" => $html,
        );
        exit(json_encode($message));

    }


    //根据订单号SAP数据获取仓储地点
    private function getDbByOrder()
    {
        $ordersn = $this->ev->get('ordersn');
        $userid = $this->_user['sessionuserid'];
        $orderData = $this->sap->getSapByOrdersn($ordersn,$userid);
        if($orderData)
        {
            $param = json_decode($orderData['param'], true);
            $stockInfo = $this->sap->getCangByCompidAndFacid($param['is_header']['bukrs'],$param['it_item'][0]['ewerk']);
            $html = '';
            foreach($stockInfo as $key => $val)
            {
                $checked = $key == 0 ? 'checked' : '';
                $html .= '<option '.$checked.' value="'.$val['lgort'].'">'.$val['lgort'].'</option>';
            }
            $message = array(
                "statusCode" => 200,
                "message" => "操作成功",
                "data" => $html,
            );
            exit(json_encode($message));
        }

    }




}


?>
