<?php

header("content-type: application/Json");

include('../../includes/init.php');

$todaysdate = date("y-m-d");


$query = "SELECT * FROM `create_ride` WHERE `start_ride` = ? AND `date` >= ?";
$params = array(false, $todaysdate);

$rides = select($query, $params);

if ($rides) {
    http_response_code(200);
    echo json_encode(["success" => true, "data" => $rides]);
} else {
    http_response_code(400);
    echo json_encode(["success" => true, "message" => "No Rides Found"]);
}
