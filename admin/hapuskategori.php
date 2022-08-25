<?php
session_start();
include '../dbconnect.php';
$id   = $_GET['kategoriid'];

$sql = "DELETE FROM kategori WHERE idkategori='" . $id . "'";

mysqli_query($conn, $sql);
header("location:kategori.php");
