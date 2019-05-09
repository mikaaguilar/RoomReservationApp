<?php

session_start();

?>
<html>
    <head>
        <title>Room Overview</title>
    </head>
    <style>
        .table{
        width: 30%;
        margin: 0 auto;
    }
    .container{
        margin-top: 7%;
        text-align: center;
   
    }
    #headers{
        border: 0px;
    }
    .cont{
             margin-right: 2%;
        margin-left: 10%;
    }
    .headers{
        text-align: center;
        font-size: medium;
    }
    td{
        font-size: small;
        text-align: center;
       
    }
    #addroom{
        display: block;
    }
    #delete,#edit{
        width: 50px;
    }
    #room_flr{
        width: 100px;
    }
    #room_bldg{
        width: 200px;
    }
    #container-table{
        margin-top: 3%;
    }
    #room_name{
        width: 200px;
    }
    .glyphicon-remove{
        color: #ff572d;
        font-size: medium;
    }
    .glyphicon-pencil,.glyphicon-floppy-disk{
        font-size: medium;
    }
    .table_cell{
        background: transparent;
        border: none;
        text-align: center;
    }
     #room_id{
        width: 100px;
    }
    #emp_id{
        width: 80px;
    }
    .save{
        padding: 0 0;

    }
    </style>
    <script type="text/javascript">
               function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var n= today.getMonth();
    var o= today.getDate();
    if (h>12){h= h-12; }
    h = checkTime(h);
    m = checkTime(m);
    n = n+1;
    n = checkTime(n);
    o = checkTime(o);
     document.getElementById('time').innerHTML =
     h + ":" + m 
     document.getElementById('date').innerHTML =
     n + "/" + o 
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
        function logout()
        {
	     var confirmdel = confirm("Confirm Log Out?");
	     if (confirmdel==true)
	     {
	     	return true;
	     }
	     else
	     {
	     	return false;
	     }
        }
   function openaccNav() {
             document.getElementById("myAccountnav").style.width = "250px";
             document.getElementById("myAccountnav").style.border = "1px solid black";
}
        function closeaccNav() {
            document.getElementById("myAccountnav").style.width = "0";
            document.getElementById("myAccountnav").style.border = "none";
}
 </script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="bren/side_bar.css" type="text/css">
    <link rel="stylesheet" href="mika/about.css" type="text/css">
    <link rel="stylesheet" href="mika/jumbotron.css" type="text/css">
    <body onload="startTime()">
        <div class="sidebar">
    <ul>
        <li> <img src ='logo3.png' style="width: 78%; border-radius: 100%; margin-left: 7px; margin-top: 7px; margin-bottom: 5px"></li>
        <li><a onclick="return openaccNav()"><span class="glyphicon glyphicon-user"></span><span class="menu_label">Account</span></a></li>
        <li><a href="userpage.php"><span class="glyphicon glyphicon-cloud"></span><span class="menu_label">Home</span></a></li>
        <li><a href="aboutususer.php"><span class="glyphicon glyphicon-info-sign"></span><span class="menu_label">About</span></a></li>
        <li><a href="user_schedtable.php"><span class="glyphicon glyphicon-calendar"></span><span class="menu_label">Reservations</span></a></li>
        <li><a href="user_reservation.php"><span class="glyphicon glyphicon-list"></span><span class="menu_label">Your Reservations</span></a></li>
        <li> <div class="selected"><a href="Room_View_User.php"><span class="glyphicon glyphicon-blackboard"></span><span class="menu_label">Rooms</span></a></div></li>
        <li><div id="time" style="padding-top:180px; font-size: 18px; color:white;text-align: center"></div> </li>
        <li><div id="date" style=" font-size: 12px; color:#ff7a24; text-align: center"></div> </li></ul>
    </div>
       
        <div id="myAccountnav" class="accnav" style="top:70px;">
  <a href="javascript:void(0)" class="closebtn hoverable" onclick="closeaccNav()">&times;</a>
            <?php
            include 'connect.php';
            $sql ="select * from accounts where Acc_Uname='".$_SESSION['username']."'";
            $res = mysqli_query($con, $sql);
            $row = mysqli_fetch_array($res);
            $sql1 ="select * from employee where Employee_ID='".$row['Employee_ID']."'";
            $res1 = mysqli_query($con, $sql1);
            $row1 = mysqli_fetch_array($res1);
            ?>
            <div class="center"> <img src= "<?php  if (empty($row1['Emp_Photo'])){ echo "Male User_96px.png";} else {echo $row1['Emp_Photo'];}?>" style="border-radius: 100%; max-height: 90px;">
            <div class="name"> <?php echo $row1['Emp_FN']; ?> <?php echo $row1['Emp_LN']; ?> </div>
            <div class="id"> ID Number: <?php echo $row['Employee_ID']; ?> </div>
            <hr>
            <a class="hoverable" href="user_account.php">Account Info</a> 
            <a  class="hoverable" href="change_pass.php">Change Password</a> 
            <div class="logoutbtn"> <a class="btn btn-danger" onclick="return logout()" <?php 
                $_SESSION["login"] = 'logout'; ?> href="login_page.php">Logout</a></div>
            </div>
</div>
        
        <div class="container cont" id="container-table">
            <table class="table">
            <tr>
		<td id="headers" COLSPAN=8>
		<form NAME="searchArea" METHOD="POST" ACTION="">
			<label>Search by Room ID:</label>
			<input TYPE="text" ID="txtSearchLN" NAME="txtSearchLN">
                        <input class="btn btn-primary search_button" TYPE="submit" VALUE=" Search ">
		</form>
		</td>
            </tr>   
                <tr class="headers" style="color:#00b3b3">
                    <td>More Info</td>
                    <td id="room_id">Room ID</td>
                    <td id="room_name">Room Name</td>
                    <td id="room_bldg">Room Building</td>
                    <td id="room_flr">Room Floor</td>
                    <td id="room_mac">MAC Address</td>
                    <td id="timeframe_in">Opening Time</td>
                    <td id="timeframe_out">Closing Time</td>
            </tr>
            <?php
include 'connect.php';
if (!isset($_POST['txtSearchLN']))
  {
     $_POST['txtSearchLN'] = "undefined";
  }
$searchLN = $_POST['txtSearchLN'];
if ($searchLN=="undefined")
 {
   $SQL = mysqli_query($con,"SELECT * FROM tbl_roomlist ORDER BY room_id");  
 }
else 
 {
   $SQL=mysqli_query($con,"SELECT * FROM tbl_roomlist WHERE room_id LIKE '$searchLN%'");
 }
while($row=mysqli_fetch_array($SQL))
	{
 ?>
	<tr>
                <td><a href="room_details_user.php?SID=<?php echo $row['room_id']; ?>"><span class="glyphicon glyphicon-info-sign"></span></a></td>
		<td><?php echo $row['room_id']; ?></td>
		<td><?php echo $row['room_name']; ?></td>
		<td><?php echo $row['room_bldg']; ?></td>
		<td><?php echo $row['room_floor']; ?></td>
		<td><?php echo $row['mac_address']; ?></td>
                <td><?php echo $row['timeframe_in']; ?></td>
                <td><?php echo $row['timeframe_out']; ?></td>
               
	</tr>
	<?php //open of second php
	}//close of while
	mysqli_close($con);
	?><!-- close of second php -->
            </table>
        </div>
        
        
        
        
    </body>
    
    
</html>