<?php

function clean($db){
    exec("psql -d $db -a -f drop.sql");
    exec("psql -d $db -a -f sci.sql");
}

clean("sci");

?>
