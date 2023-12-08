<?php

header("content-type: application/Json");

include('../../includes/init.php');

$data = file_get_contents("php://input");

$jsonData = json_decode($data);

$ride_id = $jsonData->ride_id;
$user_id = $jsonData->user_id;
$to_place = $jsonData->to_place;
$from_place = $jsonData->from_place;
$date = $jsonData->date;
$time_to_leave = $jsonData->time_to_leave;
$expected_time_to_reach = $jsonData->expected_time_to_reach;
$price = $jsonData->price;
$vehicle_name = $jsonData->vehicle_name;
$seats_available = $jsonData->seats_available;
$start_ride = $jsonData->start_ride;
$stop_ride = $jsonData->stop_ride;
$paid_after = $jsonData->paid_after;

if (!empty($ride_id) && !empty($user_id) && !empty($to_place) && !empty($from_place) && !empty($date) && !empty($time_to_leave) && !empty($expected_time_to_reach) && !empty($price) && !empty($vehicle_name) && !empty($seats_available)  && !empty($paid_after)) {

    if (empty($start_ride)) $start_ride = "false";
    else $start_ride;

    if (empty($stop_ride)) $stop_ride = "false";
    else $stop_ride;

    $query = "UPDATE `create_ride` SET `user_id` = ?, `to_place` = ?, `from_place` = ?, `date` = ?, `time_to_leave` = ?, `expected_time_to_reach` = ?, `price` = ?, `vehicle_name` = ?, `seats_available` = ?, `start_ride` = ?, `stop_ride` = ?, `paid_after` = ? WHERE `id` = ?";
    $params = array($user_id, $to_place, $from_place, $date, $time_to_leave, $expected_time_to_reach, $price, $vehicle_name, $seats_available, $start_ride, 0, $paid_after, $ride_id);

    if (execute($query, $params)) {
        http_response_code(200);
        echo json_encode(["success" => true, "message" => "Ride Edited Successfully"]);
    } else {
        http_response_code(500);
        echo json_encode(["success" => true, "message" => "Somethings went wrong on server."]);
    }
} else {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Please enter all required parameters"]);
}
