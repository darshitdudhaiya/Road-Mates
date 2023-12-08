<?php

header("content-type: application/Json");

include('../../includes/init.php');

$data = file_get_contents("php://input");

$jsonData = json_decode($data);

$request_id = $jsonData->request_id;
$user_id = $jsonData->user_id;
$create_user_id = $jsonData->create_user_id;
$ride_id = $jsonData->ride_id;
$description = $jsonData->description;
$status = $jsonData->status;


if (!empty($user_id) && !empty($create_user_id) && !empty($ride_id) && !empty($description)) {

    if (empty($status)) $status = "false";
    else $status;

    $query = "UPDATE `request` SET `user_id` = ?, `create_user_id` = ?, `ride_id` = ?, `description` = ?, `status` = ? WHERE `id` = ?";
    $params  = array($user_id, $create_user_id, $ride_id, $description, $status, $request_idb);

    if (execute($query, $params)) {
        http_response_code(200);
        echo json_encode(["success" => true, "message" => "Request Updated Successfully"]);
    } else {
        http_response_code(500);
        echo json_encode(["success" => true, "message" => "Somethings went wrong on server."]);
    }
} else {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Please enter all required parameters"]);
}
