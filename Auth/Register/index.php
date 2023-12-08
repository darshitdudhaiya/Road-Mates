<?php

header("Content-Type: application/Json");
include("../../includes/init.php");

$data = file_get_contents("php://input");

$jsonData = json_decode($data);

$username = $jsonData->username;
$password = $jsonData->password;
$confirm_password = $jsonData->confirm_password;
$email = $jsonData->email;
$mo_number = $jsonData->mo_number;
$alternate_mo_number = $jsonData->alternate_mo_number;
$gender = $jsonData->gender;
$age = $jsonData->age;
$instagram = $jsonData->instagram;
$whatsapp = $jsonData->whatsapp;
$facebook = $jsonData->facebook;
$x = $jsonData->x;
$threads = $jsonData->threads;
$discord = $jsonData->discord;


if ($password != $confirm_password) {
    http_response_code(400);
    die(json_encode(["status" => "faild", "message" =>"Passwords do not match !"]));
}


$query = "SELECT COUNT(*) AS Count FROM `users` WHERE `name` = ?";
$params = array($username);

$row = getCount($query, $params);
print_r($row);
if ($row["Count"] == 0) {

    $query = "INSERT INTO `users` (`name`, `password`, `email`, `mo_number`, `alternate_mo_number`, `gender`, `age`, `instagram`, `whatsapp`, `facebook`, `x`, `threads`, `discord`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
    $params = array($username, $password, $email, $mo_number, $alternate_mo_number, $gender, $age, $instagram, $whatsapp, $facebook, $x, $threads, $discord);
    
    execute($query, $params);

    http_response_code(200);
    return json_encode(["success" => true, "message" =>"Regised successfully"]);
} else {
    http_response_code(400);
    return json_encode(["success" => false, "message" => "Username already in taken !"]);
}
