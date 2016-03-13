<?php

use Phalcon\Mvc\Micro;
use \Phalcon\Http;

$loader = new \Phalcon\Loader();
$loader->registerDirs(array(
        'models',
        'services',
        "auth"
        ));

$loader->register();

include("db/config.php");

$app = new \Phalcon\Mvc\Micro($di);

$app->get('/', function () {
    echo "SCI API REST";
});

//Auth
    //Auth::middlewareAuth($app);

    //Publicaciones

//$publicaciones = new PublicacionesService;

$usuarioService = new UsuariosService();

$app->get("/usuarios",function() use ($app,$usuarioService) {
    $data = $usuarioService->listar();
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/usuarios",function() use ($app,$usuarioService) {
    $usuario = json_decode($app->request->getRawBody());
    $data = $usuarioService->nuevo($usuario);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/usuarios/token",function() use ($app,$usuarioService) {
    $usuario = json_decode($app->request->getRawBody());
    $data = $usuarioService->solicitarToken($usuario);
    response($app,$data,$data['status']);
});

$app->put("/usuarios/{id:[0-9]+}",function($id) use ($app,$usuarioService) {
    $usuario = json_decode($app->request->getRawBody());
    $data = $usuarioService->modificar($id,$usuario);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/usuarios/{id:[0-9]+}",function($id) use ($app,$usuarioService) {
    $data = $usuarioService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints Equipo

$equipoService = new EquipoService;

$app->get("/equipos",function() use ($app,$equipoService) {
    $data = $equipoService->listar();
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/equipos",function() use ($app){
    echo 'registra un equipo';
});

$app->put("/equipos/{id:[0-9]+}",function($id) use($app){
    echo "edicion de equipo numero $id";
});

$app->delete("/equipos/{id:[0-9]+}",function($id) use($app){
    echo "eliminacion de equipo numero $id";
});

//Endpoints personal

$personalService = new PersonalService;

$app->get("/personal",function() use ($app,$personalService) {
    $data = $personalService->listar();
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/personal",function() use ($app,$personalService){
    $personal = json_decode($app->request->getRawBody());
    $data = $personalService->nuevo($personal);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/personal/{id:[0-9]+}",function($id) use($app){
    echo "edicion de personal numero $id";
});

$app->delete("/personal/{id:[0-9]+}",function($id) use($app){
    echo "eliminacion de personal numero $id";
});

//Endpoint 

$app->notFound(function () use ($app) {
    response($app,array("estatus" => "404 Not Found", "mensaje" => 'This is not the resource you are looking for'),404);
});

$app->handle();
