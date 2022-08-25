<?php
session_start();
session_destroy();
// header("location:login.php");
echo "<script>alert('Anda Telah Logout');</script>";
echo "<script>location='index.php'</script>";
