<?php

$response['status'] = array(
    'type' => 'error',
    'value' => 'No JSON value set',
  );

$encoded = json_encode($response);
header('Content-type: application/json');
exit($encoded);
?>
