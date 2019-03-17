<?php
/**
 * Created by PhpStorm.
 * User: 50165
 * Date: 2018-11-21
 * Time: 14:57
 */
class fastdfs_document
{
    public $host = 'http://10.72.8.90/';
    //public $host = 'http://10.72.4.39:8015/';
    //public $host = 'http://119.254.146.180:8015/';
    public $path = __DIR__.DIRECTORY_SEPARATOR;//当前文件路径（使用DIRECTORY_SEPARATOR防止win和linux路径由歧义）

    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->ev = $this->G->make('ev');
    }

    /**
     * FastDFS上传文件
     * @param $fileurl 上传文件的url
     * @param array $sizes 附属文件
     * @return string
     * @throws FastDFSException
     */
    public function applydfs($fileurl,$sizes=array())
    {
        if (in_array(RUNTIME, ['qa', 'online']))
        {
            $this->host = 'http://119.254.146.180:8015/';
        }

        $result = [];
        require_once ($this->path.'../../../fastDFS/FastDFS.php');//引入注册类文件
        $dfs=new FastDFS();
        $tracker = $dfs->tracker_get_connection();
        $location = "";
        if($dfs->active_test($tracker))
        {
            $storaged = $dfs->tracker_query_storage_store("group1",$tracker);
            if(!empty($sizes)){
                $count = 0;
                $filename = $dfs->storage_upload_by_filename($fileurl);
                if(isset($filename['group_name'])&&isset($filename['filename'])){
                    $location =$filename['group_name']."/".$filename['filename'];
                }
                foreach($sizes as $key=>$val){
                    $snapshot_file_info =$dfs->storage_upload_slave_by_filename($val,"group1",$filename['filename'],$key);
                    if($snapshot_file_info){
                        $count++;
                    }
                }
                if($count <> count($sizes)){
                    $location = "";
                }
            }else{
                $filename = $dfs->storage_upload_by_filename($fileurl);
                if(isset($filename['group_name'])&&isset($filename['filename'])){
                    $location =$filename['group_name']."/".$filename['filename'];
                }
            }
        }
        if (!empty($filename))
        {
            $result['fileUrl'] = $this->host.$location;
            $result['path'] = $location;
        }
        return $result;
    }
    
    public function addFileInfo($args)
    {
        $args['create_time'] = date("Y-m-d H:i:s");
        $data = array('file_info',$args);
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        return $this->db->lastInsertId();
    }
}