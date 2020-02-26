<h3 class="text-muted"><?php echo $heading_title; ?></h3>
<?php if ($products) { ?>
<div class="<?php echo $class_row; ?> product-<?php echo $class_1; ?>">
<?php foreach ($products as $product) { ?>
	<div class="brick <?php echo $class_col; ?>">
		<div class="<?php echo $class_2; ?>" style="padding-bottom:12px;" />
		<div style="text-align:center;">		
			<?php if ($product['thumb']) { ?>
				<a class="img-thumbnail"  href="<?php echo $product['href']; ?>"><img class="img-thumbnail" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a>
			<?php } ?>
			<div class="caption">
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
				<?php if ($product['description']) { ?>
					<div class="description"><?php echo $product['description']; ?></div>
				<?php } ?></div>
				<div style="text-align:center">
				<?php if (!$product['special']) { ?>
					<div class="price"><p><strong class="label label-primary"><?php echo $product['price']; ?></strong></p></div>
				<?php } else { ?>
					<div class="price"><p><small><s><?php echo $product['price']; ?></s></small><br /><strong class="label label-primary"><?php echo $product['special']; ?></strong></p></div>
				<?php } ?>
				<?php if ($product['rating']) { ?>
					<div class="reviews" title="<?php echo $product['reviews']; ?>">
					<?php for ($i = 1; $i <= 5; $i++) {
						if ($product['rating'] < $i) {
							echo '<i class="glyphicon glyphicon-star-empty"></i>';
						} else {
							echo '<i class="glyphicon glyphicon-star"></i>';
						}
					} ?></div>
				<?php } ?>
				<?php if ($button) { ?>
					<div class="cart">
					<div style="text-align:center">			
						<a class="btn btn-default" href="<?php echo $product['href']; ?>">View <i class="fa fa-search-plus"></i></a> 
						<button type="button" data-cart="<?php echo $product['product_id']; ?>" class="btn btn-default"><?php echo $button_add_cart; ?></button>
					</div></div>
				<?php } ?>
			</div></div>
		</div>
	</div>
<?php } ?>
</div>
<hr>
<?php } else { ?>
	<div class="alert alert-warning"><?php echo $text_empty; ?></div>
<?php } ?>
