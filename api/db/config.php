<?php

$di = new \Phalcon\DI\FactoryDefault();
use Phalcon\Mvc\View\Simple as SimpleView;

$di->set('db', function(){
    return new \Phalcon\Db\Adapter\Pdo\Postgresql(array(
        "host" => "localhost",
        "username" => "az_admin",
        "password" => "impacto.1309.",
        "dbname" => "transbarca",
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
 ?>
