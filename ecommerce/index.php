<?php include 'include/home/header.php'; ?>
<a href="index.php"><img src="images/home/header.png" alt="" class="img-responsive"/></a>
<?php



function displayProducts($category, $conn) {
    $query = "SELECT * FROM products WHERE Category = '$category' LIMIT 4";
    $result = mysqli_query($conn, $query);

    if ($result) {
        while ($row = mysqli_fetch_array($result)) {
            $prodID = $row["Product_ID"];
            echo '<ul class="col-sm-3">';
            echo '<div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center"  >
                                <a href="product-details.php?prodid=' . $prodID . '" rel="bookmark" title="' . $row['Product'] . '">
                                    <img src="reservation/img/products/' . $row['imgUrl'] . '" alt="' . $row['Product'] . '" title="' . $row['Product'] . '" width="150" height="150" />
                                </a>
                                <h2><a href="product-details.php?prodid=' . $prodID . '" rel="bookmark" title="' . $row['Product'] . '">' . $row['Product'] . '</a></h2>
                                <h3>' . $row['Price'] . '$</h3>
                      
                              
                            </div>
                        </div>
                    </div>';
            echo '</ul>';
        }
    }
}
?>

<section>

    <div class="container" style="max-width:1200px;">
        <h2 class="text-center" style="padding-bottom: 20px;"><strong>Iphone</strong></h2>
         
        <div class="row justify-content-center">
            <div class="col-sm-12">
                <div class="row justify-content-center">
                    <?php displayProducts("iphone", $conn); ?>
                </div>
                <div class="text-center">
                    <a href="category.php?filter=Iphone" class="nut">Xem tất cả Iphone</a>
                </div>
            </div>
        </div>
    </div>

    <h2 class="text-center" style="padding-bottom: 20px;"><strong>Ipad</strong></h2>
    <div class="container" style="max-width:1200px">
        <div class="row justify-content-center">
            <div class="col-sm-12">
                <div class="row justify-content-center">
                    <?php displayProducts("Ipad", $conn); ?>
                </div>
                <div class="text-center">
                    <a href="category.php?filter=Ipad" class="nut">Xem tất cả Ipad</a>
                </div>
            </div>
        </div>
    </div>
    <h2 class="text-center" style="padding-bottom: 20px;"><strong>Watch</strong></h2>
    <div class="container" style="max-width:1200px">
        <div class="row justify-content-center">
            <div class="col-sm-12">
                <div class="row justify-content-center">
                    <?php displayProducts("Watch", $conn); ?>
                </div>
                <div class="text-center">
                    <a href="category.php?filter=Watch" class="nut">Xem tất cả Watch</a>
                </div>
            </div>
        </div>
    </div>
    <h2 class="text-center" style="padding-bottom: 20px;"><strong>Mac</strong></h2>
    <div class="container" style="max-width:1200px">
        <div class="row justify-content-center">
            <div class="col-sm-12">
                <div class="row justify-content-center">
                    <?php displayProducts("Mac", $conn); ?>
                </div>
                <div class="text-center">
                    <a href="category.php?filter=Mac" class="nut">Xem tất cả Mac</a>
                </div>
            </div>
        </div>
    </div>
    <h2 class="text-center" style="padding-bottom: 20px;"><strong>Phụ kiện</strong></h2>
    <div class="container" style="max-width:1200px">
        <div class="row justify-content-center">
            <div class="col-sm-12">
                <div class="row justify-content-center">
                    <?php displayProducts("Phụ kiện", $conn); ?>
                </div>
                <div class="text-center">
                    <a href="category.php?filter=Phụ kiện" class="nut">Xem tất cả Phụ kiện</a>
                </div>
            </div>
        </div>
    </div>


    
</section>
