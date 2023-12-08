<?php

header("content-type: application/Json");

include('../../includes/init.php');

$data = file_get_contents("php://input");

$jsonData = json_decode($data);

$ride_id = $jsonData->ride_id;

if (!empty($ride_id)) {
    $query = "SELECT * FROM `create_ride` WHERE `id` = ?";
    $params = array($ride_id);

    $ride = selectOne($query, $params);

    if ($ride) {
        http_response_code(200);
        echo json_encode(["success" => true, "data" => $ride]);
    } else {
        http_response_code(500);
        echo json_encode(["success" => true, "message" => "Something went wrong on server."]);
    }
} else {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Please enter all required parameters."]);
}
