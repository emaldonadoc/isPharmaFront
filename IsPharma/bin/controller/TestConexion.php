<?php

$conn = new mysqli("127.0.0.1", "root", "", "RailtronixDB");

$result = $conn->query("select id,name from customer");

$outp = "[";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) {
    if ($outp != "[") {$outp .= ",";}
    $outp .= '{"Name":"'  . $rs["name"] . '",';
    $outp .= '"City":"'   . $rs["id"]        . '"}';
}
$outp .="]";

$conn->close();

echo($outp);

?>
