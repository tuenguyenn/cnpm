<?php 
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh'); 
ini_set('display_errors', 1);
$jim = new Shopping();
$q = $_GET['q'];




if(!isset($_SESSION['cart'])){
    $_SESSION['cart'] = array(); 
    $_SESSION['proID'] = 0;
}
if($q == 'addtocart'){
    $product = $_POST['product'];
    $price = $_POST['price'];
    $qty = $_POST['qty'];
    $jim->addtocart($product,$price,$qty);
}else if($q == 'emptycart'){
   $jim->emptycart();
}else if($q == 'removefromcart'){
    $id = $_GET['id'];
    $jim->removefromcart($id);
}else if($q == 'updatecart'){
    $id = $_GET['id'];
    $qty = $_POST['qty'];
    $product = $_GET['product'];
    $jim->updatecart($id,$qty,$product);
}else if($q == 'countcart'){  
    $jim->countcart();
}else if($q == 'countorder'){
    $jim->countorder();
}else if($q == 'countproducts'){
    $jim->countproducts();
}else if($q == 'countcategory'){
    $jim->countcategory();
}else if($q == 'checkout'){
    $jim->checkout();
    
}else if($q == 'verify'){
    $jim->verify();   
}

class Shopping {
    private $conn;
   public function __construct() {
    include('../db.php');
    $this->conn = $conn;
    }
    function addtocart($product, $price, $qty) {
        if (!isset($_SESSION['customer_id'])) {
            header("Location: cuslogin.php");
            exit(); 
        }
    
        // Người dùng đã đăng nhập
        $customer_id = $_SESSION['customer_id'];
    
        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng hay chưa
        if (isset($_SESSION['cart'][$product])) {
            // Nếu sản phẩm đã tồn tại trong giỏ hàng, cập nhật số lượng
            $_SESSION['cart'][$product]['qty'] += 1;
            $new_qty = $_SESSION['cart'][$product]['qty'];
            $q = "UPDATE cart SET Quantity = $new_qty WHERE customer_id = '$customer_id' AND Product = '$product'";
        } else {
            // Nếu sản phẩm chưa tồn tại trong giỏ hàng, thêm mới vào giỏ hàng
            $_SESSION['cart'][$product] = array(
                'proID' => $_SESSION['proID'],
                'product' => $product,
                'price' => $price,
                'qty' => $qty
            );
    
            // Thêm vào cơ sở dữ liệu
            $q = "INSERT INTO cart (customer_id, Product, Price, Quantity) VALUES ('$customer_id', '$product', '$price', '$qty')";
           
        }
         mysqli_query($this->conn, $q); 
        // Tăng proID để đảm bảo mỗi sản phẩm có một ID duy nhất
        $_SESSION['proID']++;
    
        // Trả về true để cho biết quá trình thêm vào giỏ hàng đã thành công
        return true;
    }
    
    
    
    
    function removefromcart($id) {
        if(isset($_SESSION['cart'][$id])) {
            $_SESSION['cart'][$id]['qty'] = 0;
        }
    
        $customer_id = $_SESSION['customer_id'];

        // Xoá sản phẩm từ giỏ hàng của khách hàng hiện tại
        $q = "DELETE FROM cart WHERE ID='$id' AND customer_id='$customer_id'";
        mysqli_query($this->conn, $q);
    
        // Chuyển hướng đến trang giỏ hàng
        header("location: ../cart.php");
        exit(); // Đảm bảo kết thúc chương trình sau khi chuyển hướng
    }
    
    function updatecart($id,$qty,$product){
        $_SESSION['cart'][$product]['qty'] = $qty;
       
        $customer_id = $_SESSION['customer_id'];

        // Cập nhật số lượng sản phẩm trong giỏ hàng của khách hàng hiện tại
        $q = "UPDATE cart SET Quantity='$qty' WHERE ID='$id' AND customer_id='$customer_id'";
        mysqli_query($this->conn, $q);
    
        // Chuyển hướng đến trang giỏ hàng
        header("location:../cart.php");
    }
    
    function countcart(){
        $count = 0;
    
        // Lấy giỏ hàng từ session, nếu không tồn tại, sử dụng mảng trống
        $cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : array();
    
        // Duyệt qua từng sản phẩm trong giỏ hàng
        foreach($cart as $row):
            // Kiểm tra xem sản phẩm có thuộc tính 'qty' và không bằng 0 không
            if (isset($row['qty']) && $row['qty'] != 0) {
                // Nếu có, cộng vào tổng số lượng
                $count = $count + $row['qty'];
            }            
        endforeach;
    
        // Hiển thị tổng số lượng sản phẩm trong giỏ hàng
        echo $count;   
    }
    function emptycart(){
       
    // Lấy customer_id từ session
    if(isset($_SESSION['customer_id'])) {
        $mysqli_hostname = "localhost";
        $mysqli_user = "root";
        $mysqli_password = "";
        $mysqli_database = "dbmaytinh";
        
        $conn = mysqli_connect($mysqli_hostname, $mysqli_user, $mysqli_password,$mysqli_database) or die("Không thể kết nối database");
        $customer_id = $_SESSION['customer_id'];

        // Xóa tất cả các mục trong bảng cart có customer_id tương ứng
        $query = "DELETE FROM cart WHERE customer_id = $customer_id";

        // Thực thi truy vấn
        mysqli_query($conn, $query);

        // Đóng kết nối đến cơ sở dữ liệu
        mysqli_close($conn);
    }

    // Xóa tất cả các sản phẩm khỏi giỏ hàng trong phiên
        unset($_SESSION['cart']); 
        unset($_SESSION['proID']); 

    // Chuyển hướng người dùng đến trang giỏ hàng
        header("location:../cart.php"); 
    }
    function countorder(){
        $q = "select * from dbmaytinh.order where status='unconfirmed'";
        $result = mysqli_query($this->conn,$q);
        echo mysqli_num_rows($result);
    }
    function countproducts(){
        $q = "select * from dbmaytinh.products";
        $result = mysqli_query($this->conn,$q);
        echo mysqli_num_rows($result);
    }
    function countcategory(){
        $q = "select * from dbmaytinh.category";
        $result = mysqli_query($this->conn,$q);
        echo mysqli_num_rows($result);
    }
    
    function checkout() {
        // Kết nối đến cơ sở dữ liệu
        $mysqli_hostname = "localhost";
        $mysqli_user = "root";
        $mysqli_password = "";
        $mysqli_database = "dbmaytinh";
        
        $conn = mysqli_connect($mysqli_hostname, $mysqli_user, $mysqli_password, $mysqli_database) or die("Không thể kết nối database");
        
        // Lấy thông tin khách hàng từ POST
        $customer_id = $_SESSION['customer_id'];
        $khach_id = $customer_id;
        $contact = $_POST['contact'];   
        $address = $_POST['address'];   
        $fullname = $_POST['name'];
        $date = date('m/d/y h:i:s A');
        $item = '';
        
        // Tạo chuỗi danh sách sản phẩm
        foreach($_SESSION['cart'] as $row):
            if($row['qty'] != 0){
                $product = '('.$row['qty'].') '.$row['product'];
                $item = $product.', '.$item;
                
                // Lấy đường dẫn của ảnh sản phẩm tương ứng
                $sql_get_img = "SELECT imgUrl FROM products WHERE Product = '" . $row['product'] . "'";
                $result_img = mysqli_query($conn, $sql_get_img);
                $row_img = mysqli_fetch_assoc($result_img);
                $imgUrl = $row_img['imgUrl'];
            }
        endforeach;
        
        // Tính tổng giá
        $amount = $_SESSION['total'];
        echo
        // Thêm đơn hàng vào cơ sở dữ liệu
        $q = "INSERT INTO dbmaytinh.order VALUES (NULL, '$khach_id', '$fullname', '$contact', '$address', '$item','$imgUrl', '$amount', 'unconfirmed', '$date', '')";
        mysqli_query($conn, $q);
        
        
        // Xoá các sản phẩm khỏi giỏ hàng sau khi đặt hàng thành công
        $query_delete_cart = "DELETE FROM cart WHERE customer_id = $customer_id";
        mysqli_query($conn, $query_delete_cart);
        
        // Xoá session giỏ hàng
        unset($_SESSION['cart']); 
        
        // Chuyển hướng đến trang thành công
        header("location:../success.php");
    }
    
    
    
    function verify(){
        $username = $_POST['username'];   
        $password = $_POST['password'];   
        
        $q = "SELECT * from dbmaytinh.user where username='$username' and password='$password'";
        $result = mysqli_query($this->conn,$q);
        $_SESSION['login']='yes';
        echo mysqli_num_rows($result);
    }
    
    
}

?>
