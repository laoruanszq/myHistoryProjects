<?php
//$arr = $_POST; //ÈôÒÔ$.get()·½Ê½·¢ËÍÊý¾Ý£¬ÔòÒª¸Ä³É$_GET.»òÕß¸É´à:$_REQUEST
$arr = $_REQUEST;
$arr['append'] = 'json_encode 收到请求并返回';


//print_r($arr);
$myjson = my_json_encode($arr);
echo $myjson;

function my_json_encode($phparr)
{
    if(function_exists("json_encode"))
    {
      return json_encode($phparr);
    }
    else
    {
      require_once 'json/json.class.php';
      $json = new Services_JSON;
      return $json->encode($phparr);
    }
}


?>