<?php
session_start();
session_destroy();

echo "<script>alert('Anda Telah Logout sebagai Admin');</script>";
echo "<script>location='index.php'</script>";

// header("location:../login.php");
