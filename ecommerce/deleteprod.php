<?php

include('db.php');
if($_GET['Product_ID'])
{
$id=$_GET['Product_ID'];
 $sql = "delete from products where Product_ID='$id'";
 mysqli_query($conn,$sql);
}

?>