<?php
session_start();
include '../dbconnect.php';
$id   = $_GET['userid'];

$sql = "DELETE FROM login WHERE userid='" . $id . "'";

mysqli_query($conn, $sql);
header("location:user.php");
