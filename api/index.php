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

$app->post("/equipos",function() use ($app,$equipoService){
    $equipo = json_decode($app->request->getRawBody());
    $data = $equipoService->nuevo($equipo);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/equipos/token",function() use ($app,$equipoService) {
    $equipo = json_decode($app->request->getRawBody());
    $data = $equipoService->solicitarToken($equipo);
    response($app,$data,$data['status']);
});

$app->put("/equipos/{id:[0-9]+}",function($id) use ($app,$equipoService) {
    $equipo = json_decode($app->request->getRawBody());
    $data = $equipoService->modificar($id,$equipo);
    response($app,$data['mensaje'],$data['status']);
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

//Endpoints Categoría General

$catgenService = new CatgenService;

$app->get("/catgen",function() use ($app,$catgenService) {
    $data = $catgenService->listar();
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/catgen",function() use ($app,$catgenService){
    $catgen = json_decode($app->request->getRawBody());
    $data = $catgenService->nuevo($catgen);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/catgen/token",function() use ($app,$catgenService) {
    $catgen = json_decode($app->request->getRawBody());
    $data = $catgenService->solicitarToken($catgen);
    response($app,$data,$data['status']);
});

$app->put("/catgen/{id:[0-9]+}",function($id) use ($app,$catgenService) {
    $catgen = json_decode($app->request->getRawBody());
    $data = $catgenService->modificar($id,$catgen);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/catgen/{id:[0-9]+}",function($id) use($app){
    echo "eliminacion de código general numero $id";
});

//Endpoints subategoría 

$subcatService = new SubcatService;

$app->get("/subcat",function() use ($app,$subcatService) {
    $data = $subcatService->listar();
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/subcat",function() use ($app,$subcatService){
    $subcat = json_decode($app->request->getRawBody());
    $data = $subcatService->nuevo($subcat);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/subcat/token",function() use ($app,$subcatService) {
    $subcat = json_decode($app->request->getRawBody());
    $data = $subcatService->solicitarToken($subcat);
    response($app,$data,$data['status']);
});

$app->put("/subcat/{id:[0-9]+}",function($id) use ($app,$subcatService) {
    $subcat = json_decode($app->request->getRawBody());
    $data = $subcatService->modificar($id,$subcat);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/subcat/{id:[0-9]+}",function($id) use($app){
    echo "eliminacion de código de subcategoría numero $id";
});

//Endpoints Categoría Especifica

$catespService = new CatespService;

$app->get("/catesp",function() use ($app,$catespService) {
    $data = $catespService->listar();
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/catesp",function() use ($app,$catespService){
    $catesp = json_decode($app->request->getRawBody());
    $data = $catespService->nuevo($catesp);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/catesp/token",function() use ($app,$catespService) {
    $catesp = json_decode($app->request->getRawBody());
    $data = $catespService->solicitarToken($catesp);
    response($app,$data,$data['status']);
});

$app->put("/catesp/{id:[0-9]+}",function($id) use ($app,$catespService) {
    $catesp = json_decode($app->request->getRawBody());
    $data = $catespService->modificar($id,$catesp);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/catesp/{id:[0-9]+}",function($id) use($app){
    echo "eliminacion de código general numero $id";
});

//Endpoint 

$app->notFound(function () use ($app) {
    response($app,array("estatus" => "404 Not Found", "mensaje" => 'Este no es el recurso que estás buscando'),404);
});

$app->handle();
