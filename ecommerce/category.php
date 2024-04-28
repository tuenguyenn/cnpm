<?php include('include\home\header.php') ?>

<section>
	<div class="container">
		<div class="row">
		    <?php $filter = isset($_GET['filter']) ? $_GET['filter'] : '';?>     
    		<div class="col-sm-12">
				<div class="features_items">
					<h2 class="text-center"><strong><?php echo $filter;?></strong></h2>
					<?php											
						$result = mysqli_query($conn,"SELECT * FROM products where  Category like '%$filter%'");
						if($result){				
						while($row=mysqli_fetch_array($result)){
							
						$prodID = $row["Product_ID"];	
							echo '<ul class="col-sm-3">';
							echo '<div class="product-image-wrapper">
								<div class="single-products">
								<div class="productinfo text-center">
							<a href="product-details.php?prodid='.$prodID.'" rel="bookmark" title="'.$row['Product'].'"><img src="reservation/img/products/'.$row['imgUrl'].'" alt="'.$row['Product'].'" title="'.$row['Product'].'" width="150" height="150" />
							</a>
							
							<h2><a href="product-details.php?prodid='.$prodID.'" rel="bookmark" title="'.$row['Product'].'">'.$row['Product'].'</a></h2>
							<h3>'.$row['Price'].'$</h3>
							
							</div>';		
							echo '</ul>';			
						}
						}
						?>
					</div>
         	</div>
		</div>
	</div>
</section>

<?php include('include/home/footer.php'); ?>