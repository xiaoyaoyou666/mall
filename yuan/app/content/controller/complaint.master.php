<?php

class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        $this->complaint = $this->G->make('complaint', 'content');
        if (!method_exists($this, $action))
            $action = "index";
        $this->$action();
        exit;
    }

    // 列 表
    private function index(){
        $page = intval($this->ev->get('page'));
        $page = $page ? $page : 1;
        $complaint = $this->complaint->getcomplaintList(0,$page, 10);
        $this->tpl->assign('complaint', $complaint);
        $this->tpl->assign('page', $page);
        $this->tpl->display('complaint');
    }

}