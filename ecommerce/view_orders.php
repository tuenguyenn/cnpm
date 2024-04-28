<?php include 'include/home/header.php'?>

<section>
    <!-- Tạo các liên kết hoặc nút để người dùng có thể chọn trạng thái -->
    <div class="status">
        <a href="view_orders.php?status=unconfirmed">Unconfirmed</a> |
        <a href="view_orders.php?status=delivered">Delivered</a> |
        <a href="view_orders.php?status=confirmed">Confirmed</a>
    </div>

    <div class="container" style="max-width:1000px">
        <div class="order-list">
            <?php
            include 'db.php';
            
            if (isset($_SESSION['customer_id'])) {
                $customer_id = $_SESSION['customer_id'];

                if (isset($_GET['status'])) {
                    $status = $_GET['status'];
                    $sql = "SELECT * FROM `order` WHERE `customer_id` = $customer_id AND `status` = '$status' ORDER BY STR_TO_DATE(dateOrdered, '%m/%d/%y %h:%i:%s %p') DESC"; // Sắp xếp theo ngày đặt hàng giảm dần
                } else {
                    $sql = "SELECT * FROM `order` WHERE `customer_id` = $customer_id ORDER BY STR_TO_DATE(dateOrdered, '%m/%d/%y %h:%i:%s %p') DESC"; // Sắp xếp theo ngày đặt hàng giảm dần
                }

                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        echo "<div class='order'>";
                        echo "<div class='product-info'>";
                        echo "<img src='reservation/img/products/" . $row["imgUrl"] . "' />";
                        echo "<h4>" . $row["item"] . "</h4>";
                        echo "<p style='color: red;'>Giá: " . $row["amount"] . "</p>";
                        echo "</div>"; // Kết thúc .product-details
                        echo "<div class='product-details'>";
                        echo "<h2>icc</h2>";
         
                        echo "</div>"; // Kết thúc .product-info
                       

                     
                       
                        echo "</div>"; // Kết thúc .order
                    }
                } else {
                    echo "<p>Không có đơn hàng nào được tìm thấy.</p>";
                }
            } else {
                echo "<p>Bạn chưa đăng nhập.</p>";
            }
            $conn->close();
            ?>
        </div>
    </div>
    <style>
        .status {
            text-align: center;
        }
        .order-list {
            display: flex;
            flex-direction: column;
        }
        .order {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            display: flex;
            flex-direction: column;
        }
        .product-info {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .product-details {
            margin-left: 10px;
            border-top: 1px solid black;
        }
        .product-details h4 {
            margin-top: 0;
        }
        .product-details p {
            margin: 5px 0;
        }
        .product-info img {
            max-width: 100px;
        }
        /* Điều chỉnh tỷ lệ rộng của các cột */
        .order:nth-child(odd) {
            flex-grow: 2; /* Thẻ div bên trên */
        }
        .order:nth-child(even) {
            flex-grow: 1; /* Thẻ div dưới */
        }
    </style>
</section>
