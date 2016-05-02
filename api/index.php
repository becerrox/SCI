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
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $usuarioService->listar($query);
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

$app->put("/usuarios/{id:[0-9]+}",function($id) use ($app,$usuarioService) {
    $usuario = json_decode($app->request->getRawBody());
    $data = $usuarioService->modificarPass($id,$usuario);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/usuarios/{id:[0-9]+}",function($id) use ($app,$usuarioService) {
    $data = $usuarioService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints Equipo

$equipoService = new EquipoService;

$app->get("/equipos",function() use ($app,$equipoService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $equipoService->listar($query);
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

$app->delete("/equipos/{id:[0-9]+}",function($id) use ($app,$equipoService) {
    $data = $equipoService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints personal

$personalService = new PersonalService();

$app->get("/personal",function() use ($app,$personalService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $personalService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/personal",function() use ($app,$personalService) {
    $personal = json_decode($app->request->getRawBody());
    $data = $personalService->nuevo($personal);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/personal/{id:[0-9]+}",function($id) use ($app,$personalService) {
    $personal = json_decode($app->request->getRawBody());
    $data = $personalService->modificar($id,$personal);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/personal/{id:[0-9]+}",function($id) use ($app,$personalService) {
    $data = $usuarioService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints Categoría General

$catgenService = new CatgenService;

$app->get("/catgen",function() use ($app,$catgenService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $catgenService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/catgen",function() use ($app,$catgenService){
    $catgen = json_decode($app->request->getRawBody());
    $data = $catgenService->nuevo($catgen);
    response($app,$data['mensaje'],$data['status']);
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
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $subcatService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/subcat",function() use ($app,$subcatService){
    $subcat = json_decode($app->request->getRawBody());
    $data = $subcatService->nuevo($subcat);
    response($app,$data['mensaje'],$data['status']);
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
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $catespService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/catesp",function() use ($app,$catespService){
    $catesp = json_decode($app->request->getRawBody());
    $data = $catespService->nuevo($catesp);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/catesp/{id:[0-9]+}",function($id) use ($app,$catespService) {
    $catesp = json_decode($app->request->getRawBody());
    $data = $catespService->modificar($id,$catesp);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/catesp/{id:[0-9]+}",function($id) use($app){
    echo "eliminacion de código general numero $id";
});

//Endpoints bienes

$bienesService = new BienesService;

$app->get("/bienes",function() use ($app,$bienesService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $bienesService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/bienes",function() use ($app,$bienesService){
    $bienes = json_decode($app->request->getRawBody());
    $data = $bienesService->nuevo($bienes);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/bienes/{id:[0-9]+}",function($id) use ($app,$bienesService) {
    $bienes = json_decode($app->request->getRawBody());
    $data = $bienesService->modificar($id,$bienes);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/bienes/{id:[0-9]+}",function($id) use ($app,$bienesService) {
    $data = $bienesService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints configuracion

$configuracionService = new ConfiguracionService;

$app->get("/configuracion",function() use ($app,$configuracionService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $configuracionService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/configuracion",function() use ($app,$configuracionService){
    $configuracion = json_decode($app->request->getRawBody());
    $data = $configuracionService->nuevo($configuracion);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/configuracion/{id:[0-9]+}",function($id) use ($app,$configuracionService) {
    $configuracion = json_decode($app->request->getRawBody());
    $data = $configuracionService->modificar($id,$configuracion);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/configuracion/{id:[0-9]+}",function($id) use($app){
    echo "eliminacion de configuracion numero $id";
});


//Endpoint 

$app->notFound(function () use ($app) {
    response($app,array("estatus" => "404 Not Found", "mensaje" => 'Este no es el recurso que estás buscando'),404);
});

$app->handle();
?>
