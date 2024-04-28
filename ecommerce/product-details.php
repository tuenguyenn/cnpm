<?php
    include("db.php");
    
    $prodID = $_GET['prodid'];

    if (!empty($prodID)) {
        $sqlSelectSpecProd = mysqli_query($conn, "SELECT * FROM products WHERE Product_ID = '$prodID'") or die(mysqli_error($conn));
    
        $getProdInfo = mysqli_fetch_array($sqlSelectSpecProd);
        $prodname= $getProdInfo["Product"];
        $prodcat = $getProdInfo["Category"];
        $prodprice = $getProdInfo["Price"];
        $proddesc = $getProdInfo["Description"];
        $prodimage = $getProdInfo["imgUrl"];
    }
?>
<?php include('include/home/header.php'); ?>
    
    <section>
        <div class="container">
            <div class="row">
                    <div class="col-sm-9">
                    <div class="container">
                    <div class="product-details">
                        <div class="col-sm-4" >
                            <div class="view-product">
                            
                            <img src="reservation/img/products/<?php echo $prodimage; ?>" />    
                                
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="product-information">
                            <h2 class="product"><?php echo $prodname; ?></h2>
                                <p>Loại hàng: <?php echo $prodcat; ?></p>
                                <p>Giá: <span class="price"><?php echo $prodprice;?> </span></p>
                                <br>
                                
                                <a class="btn btn-default add-to-cart" id="add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
                                <p class="info hidethis" style="color:green;"><strong>Đã thêm vào giỏ</strong></p>
                                <p><b>Mô tả: </b><?php echo $proddesc; ?></p>
                                <p><b>Liên hệ:</b> 0828427851</p>
                                <p><b>Email:</b> tatcorp@gmail.com</p>
                                
                            </div>
                        </div>
                    </div>
                    </div>
                    
                </div>
            </div>
        </div>
        </div>



    </section>
    
    <?php include('include/home/footer.php'); ?>
