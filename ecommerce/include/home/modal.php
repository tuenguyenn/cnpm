<?php
include 'db.php';

// Kiểm tra nếu người dùng nhấn nút "Lưu" trong form thêm địa chỉ mới
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['save_new_address'])) {
    // Lấy customer_id của người dùng hiện tại từ session
    $customer_id = $_SESSION['customer_id'];
    
    // Lấy thông tin địa chỉ mới từ form
    $new_name = $_POST['new_name'];
    $new_address = $_POST['new_address'];
    $new_phone_number = $_POST['new_phone_number'];
    
    // Thực hiện truy vấn để thêm địa chỉ mới vào cơ sở dữ liệu
    $sql = "INSERT INTO customer_address (customer_id, name, address, phone_number) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("isss", $customer_id, $new_name, $new_address, $new_phone_number);
    
    // Kiểm tra và thực hiện truy vấn
    if ($stmt->execute()) {
        // Địa chỉ mới đã được thêm thành công
        echo "Địa chỉ mới đã được thêm thành công!";
    } else {
        // Xảy ra lỗi khi thêm địa chỉ mới
        echo "Có lỗi xảy ra khi thêm địa chỉ mới: " . $conn->error;
    }
}

// Truy vấn cơ sở dữ liệu để lấy thông tin của người dùng từ bảng customer
$query = "SELECT name, address, phone_number FROM customer WHERE customer_id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $_SESSION['customer_id']);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();
?>

<!-- Modal thanh toán -->
<div class="modal fade" id="checkout_modal" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><i class="fa fa-shopping-cart text-success fa-lg"></i> Thanh toán<small class='text-primary'> Thông tin</small></h4>
            </div>
            <div class="modal-body">
                <form id="checkout_form" action="cart/data.php?q=checkout" method="POST">
                    <input type="hidden" name="customer_id" value="<?php echo $_SESSION['customer_id']; ?>">
                    <div class="form-group">
                        <input type="text" name="name" id="name" class="form-control" value="<?php echo $row['name']; ?>" readonly>
                        <input type="text" name="address" id="address" class="form-control" value="<?php echo $row['address']; ?>" readonly>
                        <input type="text" name="contact" id="contact" class="form-control" value="<?php echo $row['phone_number']; ?>" readonly>
                    </div>
                    <!-- Thêm nút "Thêm địa chỉ" -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add_address_modal">Thêm địa chỉ</button>
                    <div class="alert alert-info">
                        Phương thức thanh toán: <strong>Thanh toán khi nhận hàng</strong>
                    </div>
                    <div class="alert alert-warning">
                        *** Vui lòng chờ xác thực ***
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                <button type="submit" class="btn btn-success">OK</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal thêm địa chỉ -->
<div class="modal fade" id="add_address_modal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Thêm địa chỉ mới</h4>
            </div>
            <div class="modal-body">
                <form id="add_address_form" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
                    <div class="form-group">
                        <label for="new_name">Tên:</label>
                        <input type="text" name="new_name" class="form-control" id="new_name">
                    </div>
                    <div class="form-group">
                        <label for="new_address">Địa chỉ:</label>
                        <input type="text" name="new_address" class="form-control" id="new_address">
                    </div>
                    <div class="form-group">
                        <label for="new_phone_number">Số điện thoại:</label>
                        <input type="text" name="new_phone_number" class="form-control" id="new_phone_number">
                    </div>
                    <!-- Sử dụng type="submit" cho nút "Lưu" -->
                    <button type="button" class="btn btn-success" name="save_new_address">Lưu</button>
                </form>
            </div>
        </div>
    </div>
</div>
