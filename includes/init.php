<?php

define("BASE_DIR", $_SERVER['DOCUMENT_ROOT'] . "/road-mates-APi");
define("BASE_URL", "http://localhost/road-mates-Api");

date_default_timezone_set('Asia/Kolkata');

$connection = new PDO("mysql:host=localhost;port=3306;dbname=road-mates", "root", "");

function pathOf($path)
{
    return BASE_DIR . "/" . $path;
}

function urlOf($path)
{
    return BASE_URL . '/' . $path;
}

function execute($query, $params = null)
{
    global $connection;
    
    $statement = $connection->prepare($query);
    return $statement->execute($params);
}

function selectOne($query, $params = null)
{
    global $connection;

    $statement = $connection->prepare($query);
    $statement->execute($params);

    $row = $statement->fetch(PDO::FETCH_OBJ);
    return $row;
}

function select($query, $params = null)
{
    global $connection;

    $statement = $connection->prepare($query);
    $statement->execute($params);

    $rows = $statement->fetchAll(PDO::FETCH_OBJ);
    return $rows;
}

function loginCheck($query, $params = null)
{
    global $connection;

    $statement = $connection->prepare($query);
    $statement->execute($params);

    $row = $statement->fetch(PDO::FETCH_ASSOC);
    return $row;
}

function getCount($query, $params = null)
{
    global $connection;

    $statement = $connection->prepare($query);
    $statement->execute($params);


    $row = $statement->fetch(PDO::FETCH_ASSOC);
    return $row;
}


function lastInsertId()
{
    global $connection;
    return $connection->lastInsertId();
}

function getLastError()
{
    global $connection;
    return $connection->errorInfo();
}

session_start();