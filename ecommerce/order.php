<?php include('include/admin/header.php'); ?>
<section>
		<div class="container">
			<div class="row">
                <?php include('include/admin/sidebar.php'); ?>
                <div class="col-sm-9 padding-right">
					<div class="features_ordersinfors">
						<h2 class="title text-center">Đơn hàng</h2>                                            					

<ul class="nav nav-tabs" role="tablist">
  <li class="active"><a href="#data1" role="tab" data-toggle="tab">Chờ thanh toán</a></li>
  <li><a href="#data2" role="tab" data-toggle="tab">Đã giao</a></li>
  <li><a href="#data3" role="tab" data-toggle="tab">Thành công</a></li>
</ul>


<div class="tab-content">
    <div class="tab-pane active" id="data1">
        <table class="table table-bordered">
            <thead class="bg-primary">
                <th>Ngày đặt hàng</th>
                <th>Khách hàng</th>
                <th>Sản phẩm</th>
                <th>Thao tác</th>
            </thead>
            <?php $unpaid = $jim->getunpaidorders(); ?>
            <?php while($row = mysqli_fetch_array($unpaid)){ ?>
                <tr>
                    <td class="text-center"><?php echo $row['dateOrdered']; ?></td>
                    <td><?php echo $row['name']; ?></td>
                    <td class="text-center"><a href="ordersinfor.php?id=<?php echo $row['id']?>&&p=unconfirmed" target="_blank"><i class="fa fa-external-link"></i>Xem sản phẩm</a></td>
                    <td class="text-center"><a href="order.php?p=deliver&&id=<?php echo $row['id']; ?>" class="btn btn-warning">Giao hàng</a></td>
                </tr>
            <?php } ?>
        </table>
    </div>
    <div class="tab-pane" id="data2">
        <table class="table table-bordered">
            <thead class="bg-primary">
                <th>Ngày giao</th>
                <th>Khách hàng</th>
                <th>Sản Phẩm</th>
                <th>Thao tác</th>
            </thead>
            <?php $delivered = $jim->getdeliveredorders(); ?>
            <?php while($row = mysqli_fetch_array($delivered)){ ?>
                <tr>
                    <td class="text-center"><?php echo $row['dateDelivered']; ?></td>
                    <td><?php echo $row['name']; ?></td>
                    <td class="text-center"><a href="ordersinfor.php?id=<?php echo $row['id']?>&&p=delivered" target="_blank"><i class="fa fa-external-link"></i>Xem sản phẩm</a></td>
                    <td class="text-center"><a href="order.php?p=paid&&id=<?php echo $row['id']; ?>" class="btn btn-warning">Đã thanh toán</a></td>
                </tr>
            <?php } ?>
        </table>
    </div>
    <div class="tab-pane" id="data3">
        <table class="table table-bordered">
            <thead class="bg-primary">
                <th>Ngày thanh toán</th>
                <th>Khách hàng</th>
                <th>Sản phẩm</th>
            </thead>
            <?php $paid = $jim->getpaidorders(); ?>
            <?php while($row = mysqli_fetch_array($paid)){ ?>
                <tr>
                    <td class="text-center"><?php echo $row['dateDelivered']; ?></td>
                    <td><?php echo $row['name']; ?></td>
                    <td class="text-center"><a href="ordersinfor.php?id=<?php echo $row['id']?>" target="_blank"><i class="fa fa-external-link"></i> Xem sản phẩm</a></td>                    
                </tr>
            <?php } ?>
        </table>
    </div>
</div>
              </section>



<?php include('include/admin/footer.php'); ?>