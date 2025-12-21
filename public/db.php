<?php
function getDBConnection($dbname , $user) {
    $host = "localhost";
    // $user = "sqluser"; // or postgres
    $pass = "root";
    
    $conn = pg_connect("host=$host dbname=$dbname user=$user password=$pass");
    
    if (!$conn) {
        die("Connection failed: " . pg_last_error());
    }
    return $conn;
}
?>