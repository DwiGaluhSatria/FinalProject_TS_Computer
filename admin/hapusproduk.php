<?php
session_start();
include '../dbconnect.php';
$id   = $_GET['idproduk'];

$sql = "DELETE FROM produk WHERE idproduk='" . $id . "'";

mysqli_query($conn, $sql);
header("location:produk.php");
