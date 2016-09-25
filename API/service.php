<?php

// Get unique id form iPhone
$udidiphone = $_POST['udidiphone'];
// Get inserts from de songs
$song1 = $_POST['song1'];
$song2 = $_POST['song2'];
$song3 = $_POST['song3'];
// Create connection
$con=mysqli_connect("wwww.shailinbiharie.nl",
										"shaili1q_smart",
										"bassist12",
										"shaili1q_afstuderen");

// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

// This SQL statement insert and update the table 'voting'
$sql = "INSERT INTO voting (id, song1, song2, song3) VALUES ('$udidiphone', song1, song2, song3)
  ON DUPLICATE KEY UPDATE song1=VALUES(song1), song2=VALUES(song2), song3=VALUES(song3)";

// Check if there are results
$result = mysqli_query($con, $sql);


// Close connections
mysqli_close($con);

