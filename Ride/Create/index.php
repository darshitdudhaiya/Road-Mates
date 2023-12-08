<?php

header("Content-Type: application/Json");

include('../../includes/init.php');

$data = file_get_contents("php://input");

$jsonData = json_decode($data);

$user_id = $jsonData->user_id;
$to_place = $jsonData->to_place;
$from_place = $jsonData->from_place;
$date = $jsonData->date;
$time_to_leave = $jsonData->time_to_leave;
$expected_time_to_reach = $jsonData->expected_time_to_reach;
$price = $jsonData->price;
$vehicle_name = $jsonData->vehicle_name;
$seats_available = $jsonData->seats_available;
$paid_after = $jsonData->paid_after;

if (!empty($user_id) && !empty($to_place) && !empty($from_place) && !empty($date) && !empty($time_to_leave) && !empty($expected_time_to_reach) && !empty($price) && !empty($vehicle_name) && !empty($seats_available)  && !empty($paid_after)) {

    $query = "INSERT INTO `create_ride` (`user_id`,`to_place`,`from_place`,`date`,`time_to_leave`,`expected_time_to_reach`,`price`,`vehicle_name`,`seats_available`,`start_ride`,`stop_ride`,`paid_after`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?) ";
    $params = array($user_id, $to_place, $from_place, $date, $time_to_leave, $expected_time_to_reach, $price, $vehicle_name, $seats_available, false, false, $paid_after);

    if (execute($query, $params)) {
        http_response_code(200);
        echo json_encode(["success" => true, "message" => "Ride created successfully"]);
    } else {
        http_response_code(500);
        echo json_encode(["success" => true, "message" => "Somethings went wrong on server."]);
    }
} else {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Please enter all required parameters"]);
}
