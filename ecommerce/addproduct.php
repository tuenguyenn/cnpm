
<script type="text/javascript">
function validateForm()
{
var a=document.forms["addproduct"]["pname"].value;
if (a==null || a=="")
  {
  alert("Nhập tên sản phẩm");
  return false;
  }
var b=document.forms["addproduct"]["desc"].value;
if (b==null || b=="")
  {
  alert("Nhập mô tả sản phẩm");
  return false;
  }
 var c=document.forms["addproduct"]["price"].value;
if (c==null || c=="")
  {
  alert("Nhập giá");
  return false;
  }
var d=document.forms["addproduct"]["cat"].value;
if (d==null || d=="")
  {
  alert("Nhập loại hàng");
  return false;
  }
 var e=document.forms["addproduct"]["image"].value;
if (e==null || e=="")
  {
  alert("Chọn ảnh sản phẩm");
  return false;
  }

}
</script>

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
<!--sa input that accept number only-->
<SCRIPT language=Javascript>
      <!--
      function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
      //-->
   </SCRIPT>

<form action="addexec.php" method="post" enctype="multipart/form-data" name="addproduct" onsubmit="return validateForm()">
 Tên <br />
  <input name="pname" type="text" class="ed" /><br />
 Mô tả<br />
    <input name="desc" type="text" id="rate" class="ed" /><br />
 Giá<br />
    <input name="price" type="text" id="qty" class="ed" onkeypress="return isNumberKey(event)" /><br />
 Loại<br />
    <select name="cat" class="ed">
    
<?php
    include('db.php');
    $r = mysqli_query($conn,"select * from category"); 
    while($row = mysqli_fetch_array($r)){
         echo '<option>'.$row['title'].'</option>';
    }
?>
  </select>

    
 Chọn Ảnh: <br /><input type="file" name="image" class="ed"><br />
 
    <input type="submit" name="Submit" value="save" id="button1" />
 
</form>
