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

$app->put("/usuariosos/{id:[0-9]+}",function($id) use ($app,$usuarioService) {
    $usuario = json_decode($app->request->getRawBody());
    $data = $usuarioService->modificarPregunta($id,$usuario);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/usuarios/{id:[0-9]+}",function($id) use ($app,$usuarioService) {
    $usuario = json_decode($app->request->getRawBody());
    $data = $usuarioService->recuperarUsuario($id,$usuario);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/usuarios/{id:[0-9]+}",function($id) use ($app,$usuarioService) {
    $data = $usuarioService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints Equipo

$equipoService = new EquipoService();

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

$app->put("/equipos/{id:[0-9]+}",function($id) use ($app,$equipoService) {
    $equipo = json_decode($app->request->getRawBody());
    $data = $equipoService->modificar($id,$equipo);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/equiposs/{id:[0-9]+}",function($id) use ($app,$equipoService) {
    $equipo = json_decode($app->request->getRawBody());
    $data = $equipoService->solvencia($id,$equipo);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/equiposss/{id:[0-9]+}",function($id) use ($app,$equipoService) {
    $equipo = json_decode($app->request->getRawBody());
    $data = $equipoService->retiro($id,$equipo);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/equipos/{id:[0-9]+}",function($id) use ($app,$equipoService) {
    $data = $equipoService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints reporteSolvencia

$reporteSolvenciaService = new ReporteSolvenciaService();

$app->get("/reportesolvencias",function() use ($app,$reporteSolvenciaService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $reporteSolvenciaService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/reportesolvencias",function() use ($app,$reporteSolvenciaService){
    $reporteSolvencia = json_decode($app->request->getRawBody());
    $data = $reporteSolvenciaService->nuevo($reporteSolvencia);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/reportesolvencias/{id:[0-9]+}",function($id) use ($app,$reporteSolvenciaService) {
    $reporteSolvencia = json_decode($app->request->getRawBody());
    $data = $reporteSolvenciaService->modificar($id,$reporteSolvencia);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/reportesolvencias/{id:[0-9]+}",function($id) use ($app,$reporteSolvenciaService) {
    $data = $reporteSolvenciaService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints Categoría General

$catgenService = new CatgenService();

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

$subcatService = new SubcatService();

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

$bienesService = new BienesService();

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

//Endpoints responsables

$responsablesService = new ResponsablesService();

$app->get("/responsables",function() use ($app,$responsablesService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $responsablesService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/responsables",function() use ($app,$responsablesService) {
    $responsables = json_decode($app->request->getRawBody());
    $data = $responsablesService->nuevo($responsables);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/responsables/{id:[0-9]+}",function($id) use ($app,$responsablesService) {
    $responsables = json_decode($app->request->getRawBody());
    $data = $responsablesService->modificar($id,$responsables);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/responsables/{id:[0-9]+}",function($id) use ($app,$responsablesService) {
    $data = $responsablesService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints configuracion

$configuracionService = new ConfiguracionService();

$app->get("/configuracion",function() use ($app,$configuracionService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $configuracionService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/configuracion",function() use ($app,$configuracionService) {
    $configuracion = json_decode($app->request->getRawBody());
    $data = $configuracionService->nuevo($configuracion);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/configuracion/{id:[0-9]+}",function($id) use ($app,$configuracionService) {
    $configuracion = json_decode($app->request->getRawBody());
    $data = $configuracionService->modificar($id,$configuracion);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/configuracion/{id:[0-9]+}",function($id) use ($app,$configuracionService) {
    $data = $configuracionService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints configuracionEquipo

$configuracionEquipoService = new ConfiguracionEquipoService();

$app->get("/confequipo",function() use ($app,$configuracionEquipoService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $configuracionEquipoService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/confequipo",function() use ($app,$configuracionEquipoService) {
    $configuracionEquipo = json_decode($app->request->getRawBody());
    $data = $configuracionEquipoService->nuevo($configuracionEquipo);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/confequipo/{id:[0-9]+}",function($id) use ($app,$configuracionEquipoService) {
    $configuracionEquipo = json_decode($app->request->getRawBody());
    $data = $configuracionEquipoService->modificar($id,$configuracionEquipo);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/confequipo/{id:[0-9]+}",function($id) use ($app,$configuracionEquipoService) {
    $data = $configuracionEquipoService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints configuracionAdmin

$configuracionAdminService = new ConfiguracionAdminService();

$app->get("/configadmin",function() use ($app,$configuracionAdminService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $configuracionAdminService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/configadmin",function() use ($app,$configuracionAdminService) {
    $configuracionAdmin = json_decode($app->request->getRawBody());
    $data = $configuracionAdminService->nuevo($configuracionAdmin);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/configadmin/{id:[0-9]+}",function($id) use ($app,$configuracionAdminService) {
    $configuracionAdmin = json_decode($app->request->getRawBody());
    $data = $configuracionAdminService->modificar($id,$configuracionAdmin);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/configadmin/{id:[0-9]+}",function($id) use ($app,$configuracionAdminService) {
    $data = $configuracionAdminService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints detallesConfiguracionAdmin

$detallesConfiguracionAdminService = new DetallesConfiguracionAdminService();

$app->get("/detallesadmin",function() use ($app,$detallesConfiguracionAdminService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $detallesConfiguracionAdminService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/detallesadmin",function() use ($app,$detallesConfiguracionAdminService) {
    $detallesConfiguracionAdmin = json_decode($app->request->getRawBody());
    $data = $detallesConfiguracionAdminService->nuevo($detallesConfiguracionAdmin);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/detallesadmin/{id:[0-9]+}",function($id) use ($app,$detallesConfiguracionAdminService) {
    $detallesConfiguracionAdmin = json_decode($app->request->getRawBody());
    $data = $detallesConfiguracionAdminService->modificar($id,$detallesConfiguracionAdmin);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/detallesadmin/{id:[0-9]+}",function($id) use ($app,$detallesConfiguracionAdminService) {
    $data = $detallesConfiguracionAdminService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints detallesConfiguracionEquipos

$detallesConfiguracionEquiposService = new DetallesConfiguracionEquiposService();

$app->get("/detallesequipos",function() use ($app,$detallesConfiguracionEquiposService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $detallesConfiguracionEquiposService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/detallesequipos",function() use ($app,$detallesConfiguracionEquiposService) {
    $detallesConfiguracionEquipos = json_decode($app->request->getRawBody());
    $data = $detallesConfiguracionEquiposService->nuevo($detallesConfiguracionEquipos);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/detallesequipos/{id:[0-9]+}",function($id) use ($app,$detallesConfiguracionEquiposService) {
    $detallesConfiguracionEquipos = json_decode($app->request->getRawBody());
    $data = $detallesConfiguracionEquiposService->modificar($id,$detallesConfiguracionEquipos);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/detallesequipos/{id:[0-9]+}",function($id) use ($app,$detallesConfiguracionEquiposService) {
    $data = $detallesConfiguracionEquiposService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints detallesConfiguracionBienes

$detallesConfiguracionBienesService = new DetallesConfiguracionBienesService();

$app->get("/detallesbienes",function() use ($app,$detallesConfiguracionBienesService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $detallesConfiguracionBienesService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/detallesbienes",function() use ($app,$detallesConfiguracionBienesService) {
    $detallesConfiguracionBienes = json_decode($app->request->getRawBody());
    $data = $detallesConfiguracionBienesService->nuevo($detallesConfiguracionBienes);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/detallesbienes/{id:[0-9]+}",function($id) use ($app,$detallesConfiguracionBienesService) {
    $detallesConfiguracionBienes = json_decode($app->request->getRawBody());
    $data = $detallesConfiguracionBienesService->modificar($id,$detallesConfiguracionBienes);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/detallesbienes/{id:[0-9]+}",function($id) use ($app,$detallesConfiguracionBienesService) {
    $data = $detallesConfiguracionBienesService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints numeroBien

$numeroBienService = new NumeroBienService();

$app->get("/numerobien",function() use ($app,$numeroBienService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $numeroBienService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/numerobien",function() use ($app,$numeroBienService) {
    $numeroBien = json_decode($app->request->getRawBody());
    $data = $numeroBienService->nuevo($numeroBien);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/numerobien/{id:[0-9]+}",function($id) use ($app,$numeroBienService) {
    $numeroBien = json_decode($app->request->getRawBody());
    $data = $numeroBienService->modificar($id,$numeroBien);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/numerobien/{id:[0-9]+}",function($id) use ($app,$numeroBienService) {
    $data = $numeroBienService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints unidadAdministrativa

$unidadAdministrativaService = new UnidadAdministrativaService();

$app->get("/unidadadministrativa",function() use ($app,$unidadAdministrativaService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $unidadAdministrativaService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/unidadadministrativa",function() use ($app,$unidadAdministrativaService) {
    $unidadAdministrativa = json_decode($app->request->getRawBody());
    $data = $unidadAdministrativaService->nuevo($unidadAdministrativa);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/unidadadministrativa/{id:[0-9]+}",function($id) use ($app,$unidadAdministrativaService) {
    $unidadAdministrativa = json_decode($app->request->getRawBody());
    $data = $unidadAdministrativaService->modificar($id,$unidadAdministrativa);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/unidadadministrativa/{id:[0-9]+}",function($id) use ($app,$unidadAdministrativaService) {
    $data = $unidadAdministrativaService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints Unidades

$unidadesService = new UnidadesService();

$app->get("/unidades",function() use ($app,$unidadesService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $unidadesService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/unidades",function() use ($app,$unidadesService) {
    $unidades = json_decode($app->request->getRawBody());
    $data = $unidadesService->nuevo($unidades);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/unidades/{id:[0-9]+}",function($id) use ($app,$unidadesService) {
    $unidades = json_decode($app->request->getRawBody());
    $data = $unidadesService->modificar($id,$unidades);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/unidades/{id:[0-9]+}",function($id) use ($app,$unidadesService) {
    $data = $unidadesService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints dependencias

$dependenciasService = new DependenciasService();

$app->get("/dependencias",function() use ($app,$dependenciasService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $dependenciasService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/dependencias",function() use ($app,$dependenciasService) {
    $dependencias = json_decode($app->request->getRawBody());
    $data = $dependenciasService->nuevo($dependencias);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/dependencias/{id:[0-9]+}",function($id) use ($app,$dependenciasService) {
    $dependencias = json_decode($app->request->getRawBody());
    $data = $dependenciasService->modificar($id,$dependencias);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/dependencias/{id:[0-9]+}",function($id) use ($app,$dependenciasService) {
    $data = $dependenciasService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints unidadTrabajo

$unidadTrabajoService = new UnidadTrabajoService();

$app->get("/unidadtrabajo",function() use ($app,$unidadTrabajoService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $unidadTrabajoService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/unidadtrabajo",function() use ($app,$unidadTrabajoService) {
    $unidadTrabajo = json_decode($app->request->getRawBody());
    $data = $unidadTrabajoService->nuevo($unidadTrabajo);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/unidadtrabajo/{id:[0-9]+}",function($id) use ($app,$unidadTrabajoService) {
    $unidadTrabajo = json_decode($app->request->getRawBody());
    $data = $unidadTrabajoService->modificar($id,$unidadTrabajo);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/unidadtrabajo/{id:[0-9]+}",function($id) use ($app,$unidadTrabajoService) {
    $data = $unidadTrabajoService->eliminar($id);
    response($app,$data['mensaje'],$data['status']);
});

//Endpoints niveles

$nivelesService = new NivelesService();

$app->get("/niveles",function() use ($app,$nivelesService) {
    $query = $app->request->getQuery();
    unset($query["_url"]);
    $data = $nivelesService->listar($query);
    response($app,$data['mensaje'],$data['status']);
});

$app->post("/niveles",function() use ($app,$nivelesService){
    $niveles = json_decode($app->request->getRawBody());
    $data = $nivelesService->nuevo($niveles);
    response($app,$data['mensaje'],$data['status']);
});

$app->put("/niveles/{id:[0-9]+}",function($id) use ($app,$nivelesService) {
    $niveles = json_decode($app->request->getRawBody());
    $data = $nivelesService->modificar($id,$niveles);
    response($app,$data['mensaje'],$data['status']);
});

$app->delete("/niveles/{id:[0-9]+}",function($id) use($app){
    echo "eliminacion de nivel numero $id";
});

//Endpoint 

$app->notFound(function () use ($app) {
    response($app,array("estatus" => "404 Not Found", "mensaje" => 'Este no es el recurso que estás buscando'),404);
});

$app->handle();
?>
