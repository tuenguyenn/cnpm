<?php include('include/home/header.php')?>

<section id="form">
    <div class="container">
        <div class="row">
            <?php if(isset($_SESSION['customer_id'])): ?>
                <div class="col-md-7">
                    <?php 
                    // Kết nối đến cơ sở dữ liệu
                    include('db.php');
                    
                    // Lấy customer_id từ session
                    $customer_id = $_SESSION['customer_id'];

                    // Truy vấn SQL để lấy thông tin các sản phẩm trong giỏ hàng của người dùng đăng nhập
                    $query = "SELECT * FROM cart WHERE customer_id = $customer_id";
                    $result = mysqli_query($conn, $query);
                    $total = 0;
                    // Kiểm tra xem có sản phẩm nào trong giỏ hàng hay không
                    if(mysqli_num_rows($result) > 0): ?>
                        <?php while($row = mysqli_fetch_assoc($result)): ?>
                            <?php if ($row['Quantity'] > 0): ?>
                                <?php $itotal = $row['Price'] * $row['Quantity']; ?>
                                <div class="order-item col-md-6">
                                    <div class="order-wrapper"> 
                                        <table class="table">
                                            <tbody>
                                            <img src="reservation/img/products/<?php echo $row['imgUrl']; ?>" alt="<?php echo $row['Product']; ?>" class="product-image" style="width: 30px; height: 30px;">

                                                <tr>
                                                    <th scope="row">Sản phẩm</th>
                                                    <td><?php echo $row['Product'];?></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Số lượng</th>
                                                    <td>
                                                        <form action="cart/data.php?q=updatecart&id=<?php echo $row['ID'];?>" method="POST">
                                                            <input type="number" name="qty" value="<?php echo $row['Quantity'];?>" min="0" style="width:50px;"/>
                                                            <button type="submit" class="btn btn-info btn-sm">Cập nhật</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Tổng</th>
                                                    <td><?php echo $itotal; ?>$</td>
                                                </tr>
                                                <?php $total = $total + $itotal;?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <?php endif;?>
                        <?php endwhile; ?> 
                    <?php else: ?>
                        <div class="alert alert-danger text-center">
                            <strong>Không có sản phẩm nào trong giỏ hàng của bạn.</strong>
                        </div>
                    <?php endif; ?>
                    <?php mysqli_close($conn); ?>
                </div>
                <div class="col-md-5">
                    <?php if(mysqli_num_rows($result) > 0): ?>
                        <div class="price-info">
                            <strong>Giá: <?php echo number_format($total, 2) ?>$</strong> 
                        </div>
                        <div class="action-buttons">
                            <!-- Nút Xoá giỏ hàng -->
                            <a href="cart/data.php?q=emptycart" class="btn btn-danger btn-lg">Xoá tất cả</a>
                            <!-- Nút Đặt hàng -->
                            <a href="#" class="btn btn-success btn-lg" data-toggle="modal" data-target="#checkout_modal">Đặt Hàng</a>
                        </div>
                    <?php endif; ?>
                </div>
            <?php else: ?>
                <div class="col-md-12">
                    <div class="alert alert-danger text-center">
                        <strong>Bạn chưa đăng nhập.</strong>
                    </div>
                </div>
            <?php endif; ?>
        </div>
    </div>
</section>

<?php include('include/home/modal.php'); ?>
<?php include('include/home/footer.php'); ?>
