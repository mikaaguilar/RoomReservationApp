<?php
session_start();
$ID = $_GET['SID'];
include 'connect.php';

//$SQL = "DELETE FROM tbl_sched WHERE id='$ID'";


$SQL2 ="UPDATE tbl_sched SET Status = 0 WHERE id = '$ID'";
mysqli_query($con,$SQL2);
mysqli_close($con);

$_SESSION['users'] = false;
$_SESSION['admin'] = true;
$_SESSION['deleted'] = true;
header('location:update_room.php');
?>