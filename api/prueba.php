

<?php
/*
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Micro;

$app->get('/api/configuracion', function () use ($app) {

            $phql = "SELECT * FROM configuracion_bien ORDER BY id";
            $configuracions = $app->modelsManager->executeQuery($phql);
                        //Imprime a ver que te trae configuracions, tal vez ahi te diga el error
  
                    var_dump($configuracions);
  
                    // Por qué no lo haces con el modelo y el findBy, como los otros services?
  
            $data = array();
            foreach ($configuracions as $configuracion) {
                $data[] = array(
                    'id'   => $configuracion->id,
                    'codigo' => $configuracion->codigo,
                    'descripcion'   => $configuracion->descripcion,
                    'tipo'   => $configuracion->tipo
                );
            }
                        //tienes uqe imprimir en json para que puedas manipular los datos con javascript
            echo $configuracions;
});
*/
?>













<?php
$string_connection = "host=localhost port=5432 user=postgres password=12345 dbname=sci3";
$conn = pg_connect($string_connection );
$colores=pg_query("SELECT configuracion_bien.descripcion FROM configuracion_bien WHERE configuracion_bien.tipo::text = 'Color'::text") or die(pg_result_error());

?>

<select name="colores">
    <?php
    while ($ccolores=pg_fetch_assoc($colores)) {
        echo "<option>".$ccolores["descripcion"] ."</option>";
    }
    ?>
</select>
