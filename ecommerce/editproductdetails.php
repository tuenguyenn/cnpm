<style type="text/css">
<!--
.ed{
border-style:solid;
border-width:thin;
border-color:#00CCFF;
padding:5px;
margin-bottom: 4px;
}
#button1{
text-align:center;
font-family:Arial, Helvetica, sans-serif;
border-style:solid;
border-width:thin;
border-color:#00CCFF;
padding:5px;
background-color:#00CCFF;
height: 34px;
}
-->
</style>
<?php
	include('db.php');
	$id=$_GET['id'];
	$result = mysqli_query($conn,"SELECT * FROM products where Product_ID='$id'");
		while($row = mysqli_fetch_array($result))
			{
				$pname=$row['Product'];
				$desc=$row['Description'];
				$price=$row['Price'];
				$cat=$row['Category'];
			}
?>
<form action="execeditproduct.php" method="post">
	<input type="hidden" name="prodid" value="<?php echo $id=$_GET['id'] ?>">
	Tên:<br><input type="text" name="pname" value="<?php echo $pname ?>" class="ed"><br>
	Mô tả:<br><input type="text" name="desc" value="<?php echo $desc ?>" class="ed"><br>
	Giá:<br><input type="text" name="price" value="<?php echo $price ?>" class="ed"><br>
	Loại:<br>
        <select name="cat" class="ed">
            <?php
                include('db.php');
                $r = mysqli_query($conn,"select * from category"); 
                while($row = mysqli_fetch_array($r)){
                    $selected = ($cat == $row['title']) ? " selected='selected'" : "";
                     echo '<option '.$selected.'>'.$row['title'].'</option>';
                }
            ?>
              </select>
    <br>
	<input type="submit" value="Update" id="button1">
</form>