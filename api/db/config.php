<?php

$di = new \Phalcon\DI\FactoryDefault();
use Phalcon\Mvc\View\Simple as SimpleView;

$di->set('db', function(){
    return new \Phalcon\Db\Adapter\Pdo\Postgresql(array(
        "host" => "localhost",
        "username" => "postgres",
        "password" => "1234",
        "dbname" => "sci2",
        'schema' => "public"
    ));
});

function response($app,$data,$status){

$response = new \Phalcon\Http\Response();

$response->setStatusCode($status);

$response->setContentType('application/json');

$response->setContent(json_encode($data,JSON_PRETTY_PRINT));

$response->send();

}

function arrayToSQLQuery($array){
    $sql = "";
    foreach ($array as $key => $value) {
        $sql.=$key."= :".$key.": AND ";
    }
    return substr($sql,0,strlen($sql)-4);
}    
 ?>

