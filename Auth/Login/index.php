<?php

header("Content-Type: application/Json");
include("../../includes/init.php");

$data = file_get_contents("php://input");

$jsonData = json_decode($data);

$username = $jsonData->username;
$password = $jsonData->password;

$query = "SELECT COUNT(*) As Count,id FROM `users` WHERE `name` = ? AND `password` = ?";
$params = array($username, $password);

$row = loginCheck($query, $params);

if($row["Count"] > 0) {
    http_response_code(200);
    echo json_encode(["id"=>$row["id"]]);
} else {
    http_response_code(400);
    echo json_encode(["success"=>true,"message"=>"Wrong username or password !"]);
}

