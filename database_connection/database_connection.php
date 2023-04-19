<?php

//used for debugging
error_reporting(-1);
ini_set('display_errors', 1);
include '../config.php'; 

//aws database host parameters
$servername = 'awseb-e-kjywjhzu8p-stack-awsebrdsdatabase-eqsp4bnalizd.chttsa0blrl0.us-east-1.rds.amazonaws.com';
$username = 'admin';
$password = 'admin123';
$dbname = 'ebdb';

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

//check if connection is established
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
} else {
    //connection is established
}

?>
