<?php
/*
 * Created on 2016-5-19
 * CREated 1122
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class action extends app
{
	public function display()
	{
		if($this->ev->isMobile())
		{
			header("location:index.php?content-phone");
			exit;
		}
		$action = $this->ev->url(3);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

    private function additem()
    {
        $args = $this->ev->get('args');
        $randid = TIME . rand(1111, 9999);
        $parm = '';
        $picparm = '';
        foreach ($args as $key => $p) {
            if (is_array($p)) {
                foreach ($p as $tp) {
                    $parm .= '<input type="hidden" name="args[purchase_items][' . $randid . '][' . $key . '][]" value="' . $tp . '" />';
                }
            } else {
                $parm .= '<input type="hidden" name="args[purchase_items][' . $randid . '][' . $key . ']" value="' . $p . '" />';
            }
        }
        foreach($args['pics'] as $key => $pic)
        {
            $picparm .= '<a href="'.$pic.'" target="_blank">图'.intval($key + 1).'</a> &nbsp;';
        }
        echo "<tr><td>{$parm}{$args['purchaseName']}</td><td>{$args['deviceModule']}</td><td>{$args['deviceBrand']}</td><td>{$args['summary']}</td><td>{$args['deviceCount']}</td><td><a href=\"{$args['attach']}\">下载</a></td><td>".$picparm."</td><td><a href=\"javascript:;\" onclick=\"javascript:$(this).parents('tr').first().remove();\">删除</a></td></tr>";
    }

}
?>
