<?php

header("content-type: application/Json");

include('../../includes/init.php');

$data = file_get_contents("php://input");

$jsonData = json_decode($data);

$request_id = $jsonData->request_id;

if (!empty($request_id)) {
    $query = "SELECT * FROM `request` WHERE `id` = ?";
    $params = array($request_id);

    $request = selectOne($query, $params);

    if ($request) {
        http_response_code(200);
        echo json_encode(["success" => true, "data" => $request]);
    } else {
        http_response_code(500);
        echo json_encode(["success" => true, "message" => "Something went wrong on server."]);
    }
} else {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Please enter all required parameters."]);
}
