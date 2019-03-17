<?php
require_once 'PHPExcel/Classes/PHPExcel.php';
require_once 'PHPExcel/Classes/PHPExcel/Writer/Excel2007.php';
/*
 * Created on 2018-9-18
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class action extends app
{
    public $_user;
	public function display()
	{
        header("Access-Control-Allow-Origin: *");
        $this->sql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->evaluate = $this->G->make('evaluate','core');
        $this->content = $this->G->make('content','purchase');
		$action = $this->ev->url(3);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}


    //物资类供应商评价
    private function goodsEvaluate()
    {
        $args = array();
        $args['supplier_name'] = $this->ev->get('supplier_name');   //供应商
        $args['supplier_id'] = $this->ev->get('supplier_id');   //供应商ID
        $args['contract_name'] = $this->ev->get('goods_name');      //物资名称
        $args['project_name'] = $this->ev->get('project_name');    //项目名称
        $args['review_time'] = strtotime($this->ev->get('review_time'));       //评审时间
        $args['data1'] = $this->ev->get('data');
        $args['total_score'] = $this->ev->get('total_score');
        $args['autograph'] = $this->ev->get('autograph');
        $args['eval_type'] = 1;
        $args['data1'] = json_encode($args['data1']);
        $args['eval_level'] = $this->ev->get('grade');      //评价等级
        $args['eval_cate_id'] = $this->ev->get('Bid_class');    //标段分类
        $args['add_time'] = TIME;

        //供应商评级等级
        $leval_arr = array(
            1 => 'A级供应商',
            2 => 'B级供应商',
            3 => 'C级供应商',
            4 => 'D级供应商',
        );
        $args['eval_level_name'] = $leval_arr[$args['eval_level']]; //冗余字段，用于导出Excel

        $id = $this->evaluate->insterGoodsEvaluate($args);
        if($id)
        {
            $message = array(
                'statusCode' => 200,
                "message" => "评价成功",
            );
        }
        else
        {
            $message = array(
                'statusCode' => 300,
                "message" => "评价失败，请稍后重试",
            );
        }
        exit(json_encode($message));

    }


    //技术服务类供应商评价
    private function serviceEvaluate()
    {
        $args = array();
        $args['supplier_name'] = $this->ev->get('supplier_name'); //承包商
        $args['supplier_id'] = $this->ev->get('supplier_id');       //供应商ID
        $args['contract_name'] = $this->ev->get('Bid_name');      //标段、物资名称
        $args['project_name'] = $this->ev->get('contract_name');    //项目名称
        $args['review_time'] = strtotime($this->ev->get('review_time'));   //评审时间
        $args['stop_time'] = strtotime($this->ev->get('stop_time'));       //完工时间
        $args['data1'] = $this->ev->get('data');
        $args['total_score'] = $this->ev->get('total_score');
        $args['autograph'] = $this->ev->get('autograph');
        $args['eval_type'] = 3;
        $args['data1'] = json_encode($args['data1']);
        $args['eval_level'] = $this->ev->get('grade');          //评价等级
        $args['eval_cate_id'] = $this->ev->get('Bid_class');    //标段分类
        $args['add_time'] = TIME;
        //供应商评级等级
        $leval_arr = array(
            1 => 'A级供应商',
            2 => 'B级供应商',
            3 => 'C级供应商',
            4 => 'D级供应商',
        );
        $args['eval_level_name'] = $leval_arr[$args['eval_level']]; //冗余字段，用于导出Excel

        $id = $this->evaluate->insterGoodsEvaluate($args);
        if($id)
        {
            $message = array(
                'statusCode' => 200,
                "message" => "评价成功",
            );
        }
        else
        {
            $message = array(
                'statusCode' => 300,
                "message" => "评价失败，请稍后重试",
            );
        }
        exit(json_encode($message));

    }

    //运检类供应商评价
    private function checkEvaluate()
    {
        $args = array();
        $args['supplier_name'] = $this->ev->get('supplier_name');   //供应商
        $args['supplier_id'] = $this->ev->get('supplier_id');       //供应商ID
        $args['contract_name'] = $this->ev->get('Bid_name');        //标段名称
        $args['project_name']  = $this->ev->get('contract_name');   //项目名称
        $args['review_time'] = strtotime($this->ev->get('review_time'));       //评审时间
        $args['data1'] = $this->ev->get('data');
        $args['total_score'] = $this->ev->get('total_score');
        $args['cut_score'] = $this->ev->get('input');       //减分项
        $args['autograph'] = $this->ev->get('autograph');
        $args['eval_type'] = 2;
        $args['cut_score'] = $args['cut_score'] ? json_encode($args['cut_score']) : '';
        $args['data1'] = json_encode($args['data1']);
        $args['eval_level'] = $this->ev->get('grade');          //评价等级
        $args['eval_cate_id'] = $this->ev->get('Bid_class');    //标段分类
        $args['add_time'] = TIME;
        //供应商评级等级
        $leval_arr = array(
            1 => 'A级供应商',
            2 => 'B级供应商',
            3 => 'C级供应商',
            4 => 'D级供应商',
        );
        $args['eval_level_name'] = $leval_arr[$args['eval_level']]; //冗余字段，用于导出Excel

        $id = $this->evaluate->insterGoodsEvaluate($args);
        if($id)
        {
            $message = array(
                'statusCode' => 200,
                "message" => "评价成功",
            );
        }
        else
        {
            $message = array(
                'statusCode' => 300,
                "message" => "评价失败，请稍后重试",
            );
        }
        exit(json_encode($message));

    }


    /**
     * 根据公司名称获取供应商数据
     */
    private function getCompanyByCode()
    {
        $code = $this->ev->get('code');
        $data = $this->evaluate->getCompanyByCode($code);
        $message = array(
            "statusCode" => 200,
            "message" => "操作成功",
            "data" => $data,
        );
        exit(json_encode($message));

    }

    //根据标段分类获取分类数据
    private function getCategoryByType()
    {
        $type = $this->ev->get('type');
        $data = $this->evaluate->getCategoryByType($type);
        $message = array(
            "statusCode" => 200,
            "message" => "操作成功",
            "data" => $data,
        );
        exit(json_encode($message));

    }

    //可用，但是没用
    private function export_old()
    {
        $excel2007=false;
        $indexKey = array('id','username','sex','age');
        $list = array(array('id'=>1,'username'=>'YQJ','sex'=>'男','age'=>24));
        if(empty($filename)) $filename = time();
        if( !is_array($indexKey)) return false;

        $header_arr = array('A','B','C','D','E','F','G','H','I','J','K','L','M', 'N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
        //初始化PHPExcel()
        $objPHPExcel = new PHPExcel();

        //设置保存版本格式
        if($excel2007){
            $objWriter = new PHPExcel_Writer_Excel2007($objPHPExcel);
            $filename = $filename.'.xlsx';
        }else{
            $objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);
            $filename = $filename.'.xls';
        }

        //接下来就是写数据到表格里面去
        $objActSheet = $objPHPExcel->getActiveSheet();
        $startRow = 1;
        foreach ($list as $row) {
            foreach ($indexKey as $key => $value){
                //这里是设置单元格的内容
                $objActSheet->setCellValue($header_arr[$key].$startRow,$row[$value]);
            }
            $startRow++;
        }

        ob_end_clean();//清除缓冲区,避免乱码
        // 下载这个表格，在浏览器输出
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
        header("Content-Type:application/force-download");
        header("Content-Type:application/vnd.ms-execl");
        header("Content-Type:application/octet-stream");
        header("Content-Type:application/download");;
        header('Content-Disposition:attachment;filename='.$filename);
        header("Content-Transfer-Encoding:binary");
        $objWriter->save('php://output');

    }

    private function export()
    {
        $title="供应商评价";
        $cellName=[
            0=>['company_type_name','供应商类别',0,12,'CENTER'],
            1=>['class_type_name','一级分类',0,12,'LEFT'],
            2=>['cate_name','二级分类',0,12,'LEFT'],
            3=>['contract_name','标段名称',0,12,'LEFT'],
            4=>['supplier_name','公司名称',0,12,'LEFT'],
            5=>['store','资质',0,12,'LEFT'],
            6=>['project_name','合作项目',0,12,'LEFT'],
            7=>['num','合作范围',0,12,'LEFT'],
            8=>['story','有无历史事故',0,12,'LEFT'],
            9=>['desc','事故描述',0,12,'LEFT'],
            10=>['pepole','联系人',0,12,'LEFT'],
            11=>['tel','电话',0,12,'LEFT'],
            12=>['tip','备注',0,12,'LEFT'],
            13=>['total_score','评价得分',0,12,'LEFT'],
            14=>['eval_level_name','评价等级',0,12,'LEFT']
        ];
        //按条件取数据
        $supplier_name = $this->ev->get('supplier_name');   //公司名称
        $project_name  = $this->ev->get('project_name');    //项目名称搜索
        $eval_level = intval($this->ev->get('eval_level'));   //评价等级
        $company_type = intval($this->ev->get('company_type'));   //供应商类别
        $contract_name = $this->ev->get('contract_name');   //标段名称
        $class_type  = $this->ev->get('class_type');   //一级分类
        $eval_cate  = $this->ev->get('eval_cate');   //二级分类
        $args = array();
        $args[] = array('AND','evaluate.eval_cate_id = evaluate_category.id');
        if($supplier_name)$args[] = array("AND","evaluate.supplier_name LIKE :supplier_name",'supplier_name',"%{$supplier_name}%");
        if($project_name)$args[] = array("AND","evaluate.project_name LIKE :project_name",'project_name',"%{$project_name}%");
        if($eval_level)$args[] = array("AND","evaluate.eval_level = :eval_level",'eval_level',$eval_level);
        if($contract_name)$args[] = array("AND","evaluate.contract_name LIKE :contract_name",'contract_name',"%{$contract_name}%");
        if($company_type)$args[] = array("AND","evaluate_category.company_type = :company_type",'company_type',$company_type);
        if($class_type)$args[] = array("AND","evaluate_category.class_type = :class_type",'class_type',$class_type);
        if($eval_cate)$args[] = array("AND","evaluate.eval_cate_id = :eval_cate_id",'eval_cate_id',$eval_cate);
        $data = $this->evaluate->getEvaluateList($args);

        $this->exportOrderExcel($title,$cellName,$data);
    }

    function exportOrderExcel($title,$cellName,$data)
    {
        //引入核心文件
        $objPHPExcel = new \PHPExcel();
        //定义配置
        $topNumber = 2;//表头有几行占用
        $xlsTitle = iconv('utf-8', 'gb2312', $title);//文件名称
        $fileName = $title.date('_YmdHis');//文件名称
        $cellKey = array(
            'A','B','C','D','E','F','G','H','I','J','K','L','M',
            'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
        );

        //写在处理的前面
         $objPHPExcel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(20);//所有单元格（行）默认高度
         $objPHPExcel->getActiveSheet()->getDefaultColumnDimension()->setWidth(20);//所有单元格（列）默认宽度
         $objPHPExcel->getActiveSheet()->getRowDimension('1')->setRowHeight(30);//设置行高度
         $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(30);//设置列宽度
         $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setSize(18);//设置文字大小
         $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);//设置是否加粗
         $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_BLACK);// 设置文字颜色
         $objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);//设置文字居左（HORIZONTAL_LEFT，默认值）中（HORIZONTAL_CENTER）右（HORIZONTAL_RIGHT）
         $objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);//垂直居中
         //$objPHPExcel->getActiveSheet()->getStyle('A1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);//设置填充颜色
         $objPHPExcel->getActiveSheet()->getStyle('A1')->getFill()->getStartColor()->setARGB('18bc9c');//设置填充颜色

        //处理表头标题
        $objPHPExcel->getActiveSheet()->mergeCells('A1:'.$cellKey[count($cellName)-1].'1');//合并单元格（如果要拆分单元格是需要先合并再拆分的，否则程序会报错）
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1','供应商评价汇总表');
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setSize(18);
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);

        //处理表头
        foreach ($cellName as $k=>$v)
        {
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellKey[$k].$topNumber, $v[1]);//设置表头数据
            $objPHPExcel->getActiveSheet()->freezePane($cellKey[$k].($topNumber+1));//冻结窗口
            $objPHPExcel->getActiveSheet()->getStyle($cellKey[$k].$topNumber)->getFont()->setBold(true);//设置是否加粗
            $objPHPExcel->getActiveSheet()->getStyle($cellKey[$k].$topNumber)->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);//垂直居中
            if($v[3] > 0)//大于0表示需要设置宽度
            {
                $objPHPExcel->getActiveSheet()->getColumnDimension($cellKey[$k])->setWidth($v[3]);//设置列宽度
            }
        }
        //处理数据
        foreach ($data as $k=>$v)
        {
            foreach ($cellName as $k1=>$v1)
            {
                $objPHPExcel->getActiveSheet()->setCellValue($cellKey[$k1].($k+1+$topNumber), $v[$v1[0]]);
                if($v['end'] > 0)
                {
                    if($v1[2] == 1)//这里表示合并单元格
                    {
                        $objPHPExcel->getActiveSheet()->mergeCells($cellKey[$k1].$v['start'].':'.$cellKey[$k1].$v['end']);
                        $objPHPExcel->getActiveSheet()->getStyle($cellKey[$k1].$v['start'])->getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
                    }
                }
                if($v1[4] != "" && in_array($v1[4], array("LEFT","CENTER","RIGHT")))
                {
                    $v1[4] = eval('return PHPExcel_Style_Alignment::HORIZONTAL_'.$v1[4].';');
                    //这里也可以直接传常量定义的值，即left,center,right；小写的strtolower
                    $objPHPExcel->getActiveSheet()->getStyle($cellKey[$k1].($k+1+$topNumber))->getAlignment()->setHorizontal($v1[4]);
                }
            }
        }
        ob_end_clean();//清除缓冲区,避免乱码
        //导出execl
        header('pragma:public');
        header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsTitle.'.xls"');
        header("Content-Disposition:attachment;filename=$fileName.xls");//attachment新窗口打印inline本窗口打印
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output');
        exit;
    }

}

?>
