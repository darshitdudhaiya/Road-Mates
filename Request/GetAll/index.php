<?php

header("content-type: application/Json");

include('../../includes/init.php');

$data = file_get_contents("php://input");

$jsonData = json_decode($data);

$id = $jsonData->id;

$todaysdate = date("y-m-d");

if (!empty($id)) {

    $query = "SELECT request.id, request.user_id, request.create_user_id, request.ride_id, request.description, request.status, create_ride.start_ride  FROM `request` INNER JOIN `create_ride` ON create_ride.id = request.ride_id WHERE request.create_user_id = ? AND request.status = ? AND create_ride.start_ride = ? AND create_ride.date >= ?";
    $params = array($id, false, false, $todaysdate);

    $requests = select($query, $params);

    if ($requests) {
        http_response_code(200);
        echo json_encode(["success" => true, "data" => $requests]);
    } else {
        http_response_code(200);
        echo json_encode(["success" => true, "message" => "No Rides Found"]);
    }
} else {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Please enter all required parameters"]);
}
