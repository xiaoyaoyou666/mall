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

	private function add()
	{

		//var_dump($this->ev->get('catevalue_select'));
		//var_dump($this->ev->get('catevalue_argscatparent_auto_1'));die;
		//var_dump($this->ev->get('args'));die;


		//一级父类ID
		$parentcatid1 = $this->ev->get('catevalue_select');


		//二级分类
		$parentcatid2 = $this->ev->get('catevalue_argscatparent_auto_1');


		if ($this->ev->get('args')) {
			//var_dump($parentcatid1);die;
			$args = $this->ev->get('args');
            $catenamearr = explode(",",$args['catname']);

            foreach ($catenamearr as $k => $v) {
            	if ($parentcatid2) {
					$args1['catparent'] = $parentcatid2;
				}else{
					$args1['catparent'] = $parentcatid1;
				}

				$args1['catname'] = $v;
				$args1['catinmenu'] = $args['catinmenu'];
				$args1['catmoduleid'] = $args['catmoduleid'];
				$args1['catimg'] = $args['catimg'];
	            $args1['caturl'] = $args['caturl'];
	            $args1['cattpl'] = $args['cattpl'];//分类模板
	            $this->category->addCategory($args1);

            }




			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "target" => "",
			    "rel" => "",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?item-master-category&parent={$parent}&page={$page}"
			);
			exit(json_encode($message));

		} else {
			$parent = $this->ev->get('parent');
			$tpls = array();
			foreach(glob("app/content/tpls/app/category_*.tpl") as $p)
			{
				$tpls[] = substr(basename($p),0,-4);
			}
			$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
			$this->tpl->assign('parentcat',$parentcat);
			$this->tpl->assign('parent',$parent);
			$this->tpl->assign('tpls',$tpls);
			$this->tpl->display('category_add2');



		}










		/*if($this->ev->get('addcategory'))
		{
			//echo "111";die;
			$args = $this->ev->get('args');
			$page = $this->ev->get('page');
			$this->category->addCategory($args);
			if($args['catparent'])
			{
				$parent = $this->category->getCategoryById($args['catparent']);
				$parent = intval($parent['catparent']);
			}
			else $parent = 0;
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "target" => "",
			    "rel" => "",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?item-master-category&parent={$parent}&page={$page}"
			);
			exit(json_encode($message));
		}
		else
		{
			//echo "2222";die;
			$parent = $this->ev->get('parent');
			$tpls = array();
			foreach(glob("app/content/tpls/app/category_*.tpl") as $p)
			{
				$tpls[] = substr(basename($p),0,-4);
			}
			$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
			$this->tpl->assign('parentcat',$parentcat);
			$this->tpl->assign('parent',$parent);
			$this->tpl->assign('tpls',$tpls);
			$this->tpl->display('category_add2');
		}*/

		//-----------------老的版本-----------------------
		/*if($this->ev->get('addcategory'))
		{
			//echo "111";die;
			$args = $this->ev->get('args');
			$page = $this->ev->get('page');
			$this->category->addCategory($args);
			if($args['catparent'])
			{
				$parent = $this->category->getCategoryById($args['catparent']);
				$parent = intval($parent['catparent']);
			}
			else $parent = 0;
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "target" => "",
			    "rel" => "",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?item-master-category&parent={$parent}&page={$page}"
			);
			exit(json_encode($message));
		}
		else
		{
			//echo "2222";die;
			$parent = $this->ev->get('parent');
			$tpls = array();
			foreach(glob("app/content/tpls/app/category_*.tpl") as $p)
			{
				$tpls[] = substr(basename($p),0,-4);
			}
			$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
			$this->tpl->assign('parentcat',$parentcat);
			$this->tpl->assign('parent',$parent);
			$this->tpl->assign('tpls',$tpls);
			$this->tpl->display('category_add2');
		}*/
	}

	private function lite()
	{
		$ids = $this->ev->get('ids');
		foreach($ids as $key => $p)
		{
			$args = array('catlite' => $p);
			$this->category->modifyCategory($key,$args);
		}
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "callbackType" => "forward",
		    "forwardUrl" => "reload"
		);
		$this->G->R($message);
	}

	private function ajax()
	{
		switch($this->ev->url(4))
		{
			case 'getchildcategory':
			$catid = $this->ev->get('catid');
			//var_dump($catid );
			$out = '';
			if($catid)
			{
				$child = $this->category->getCategoriesByArgs(array(array("AND","catparent = :catparent",':catparent',$catid)));
				foreach($child as $c)
				{
					$out .= '<option value="'.$c['catid'].'">'.$c['catname'].'</option>';
				}
			}
			if($out)
			{
				$message = array(
					'statusCode' => 200,
				    "html" => $out
				);
				exit(json_encode($message));
			}
			else
			{
				$message = array(
					'statusCode' => 300
				);
				exit(json_encode($message));
			}
			break;

			case 'getchilddata':
			$catid = $this->ev->get('catid');
			$child = $this->category->getCategoriesByArgs(array(array("AND","catparent = :catparent",':catparent',$catid)));
			exit(json_encode($child));
			$this->tpl->assign('child',$child);
			$this->tpl->assign('catid',$catid);
			$this->tpl->display('category_ajax_data');
			break;

			default:
			break;
		}
	}

	private function edit()
	{

		$parent = $this->ev->get('parent');
		$catid = $this->ev->get('catid');
		$page = $this->ev->get('page');


		//var_dump($this->ev->get('args'));die;
		if($this->ev->get('submit'))
		{
			$args = $this->ev->get('args');
			$cat = $this->category->getCategoryById($catid);
			$this->category->modifyCategory($catid,$args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?item-master-category&parent={$cat['catparent']}&page={$page}"
			);
			exit(json_encode($message));
		}
		else
		{
			$category = $this->category->getCategoryById($catid);
			$tpls = array();
			foreach(glob("app/content/tpls/app/category_*.tpl") as $p)
			{
				$tpls[] = substr(basename($p),0,-4);
			}
			$this->tpl->assign('tpls',$tpls);
			$this->tpl->assign('parent',$parent);
			$this->tpl->assign('category',$category);
			$this->tpl->assign('catid',$catid);
			$this->tpl->assign('page',$page);
			$this->tpl->display('category_update');
		}
	}

	private function del()
	{
		$catid = $this->ev->get('catid');
		$page = $this->ev->get('page');
		$cat = $this->category->getCategoryById($catid);
		$catstring = $this->category->getChildCategoryString($catid,0);
		$contents = $this->content->getContentList(array(array("AND","contentcatid = :contentcatid",'contentcatid',$catid)));
		if($catstring || $contents['number'])
		{
			$message = array(
				'statusCode' => 300,
				"message" => "操作失败，请先删除该分类下所有子分类和内容"
			);
			exit(json_encode($message));
		}
		$this->category->delCategory($catid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "target" => "",
		    "rel" => "",
		    "callbackType" => "forward",
		    "forwardUrl" => "index.php?item-master-category&parent={$cat['catparent']}&page={$page}"
		);
		exit(json_encode($message));
	}

    // 批量删除
	private function Alldel()
	{
		$catid = $this->ev->get('catid');
        $catid= explode(',', $catid);
        foreach($catid as $oid )
        {
           $catstring = $this->category->getChildCategoryString($oid,0);
		   $contents = $this->content->getContentList(array(array("AND","contentcatid = :contentcatid",'contentcatid',$oid)));
		   if($catstring || $contents['number'])
		   {
			    $message = array(
				  'statusCode' => 300,
				  "message" => "操作失败，请先删除该分类下所有子分类和内容"
			    );
			   exit(json_encode($message));
		    }
		   $res = $this->category->delCategory($oid);

        }

        if ($res) {
        	$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
		    );
		    exit(json_encode($message));
        } else {
        	$message = array(
				'statusCode' => 300,
				"message" => "服务器繁忙请稍后重试",
		    );
		    exit(json_encode($message));
        }




	}

	private function index()
	{
		$page = intval($this->ev->get('page'));
		$page = $page?$page:1;
		$parent = intval($this->ev->get('parent'));
		$categorys = $this->category->getCategoryList(array(array("AND","catparent = :catparent",'catparent',$parent)),$page,20);
		$categories = $this->category->getAllCategory();
		$parentarr = $this->category->getCategoryById($parent);

		$grandpar = $this->category->getCategoryById($parentarr['catparent']);
		/*echo "<pre/>";
		print_r($grandpar);
		echo "<pre/>";*/

		$this->tpl->assign('parent',$parent);
		$this->tpl->assign('parentarr',$parentarr);
		$this->tpl->assign('grandpar',$grandpar);
		$this->tpl->assign('categorys',$categorys);
		$this->tpl->assign('categories',$categories);
		$this->tpl->assign('page',$page);
		$this->tpl->display('category2');
	}


	private function updateStatus()
	{
		$catid = $this->ev->get('id_value');
		$status = $this->ev->get('value');
		$args = array();
		$args['catinmenu'] = $status;
        $result = $this->category->modifyCategory($catid,$args);

        if ($result) {
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功"

			);
		} else {
			$message = array(
				'statusCode' => 300,
				"message" => "修改失败了"

			);
		}

		exit(json_encode($message));


	}






}


?>
