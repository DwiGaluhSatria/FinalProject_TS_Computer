<?php
session_start();
include '../dbconnect.php';
$id   = $_GET['noid'];

$sql = "DELETE FROM pembayaran WHERE no ='" . $id . "'";

mysqli_query($conn, $sql);
header("location:pembayaran.php");
