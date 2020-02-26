<?php
$class_prefix = '';
$btn_class = 'btn btn-primary';
$btn_view = false;
$wishlist = false;

if (!empty($button_wishlist) && !empty($button_compare)) {
	$wishlist = true;
}

if (!empty($image_width)) {
	if ($image_width < 100) {
		$image_width = 100;
	}
	
	if ($image_width < 140) {
		$class_prefix = 'slim-';
		$btn_class .= ' btn-sm';
	}
		
	if ($image_width < 160) {
		$wishlist = false;
	}
	
	if ($image_width > 160) {
		$btn_view = true;
	}

	$width = ' style="width:' . $image_width . 'px;"';
} else {
	$width = '';
} ?>
<div class="<?php echo $class_prefix; ?>row product-block" style="text-align:center">
	<?php foreach ($products as $product) { ?>
		<div class="thumbnail-grid <?php echo $class_prefix; ?>col-sm-2"<?php echo $width; ?>>
<div style="text-align:center">
			<?php if ($product['thumb']) { ?>
				<a href="<?php echo $product['href']; ?>"><img class="img-thumbnail" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a>
			<?php } ?>
			<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
			<?php if (!$product['special']) { ?>
				<div class="price"><big><strong><?php echo $product['price']; ?></strong></big></div>
			<?php } else { ?>
				<div class="price"><big><strong><?php echo $product['special']; ?></strong></big><br /><s><?php echo $product['price']; ?></s></div>
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
			</div>
				<div class="cart">
				<?php if ($btn_view) { ?>
	<div style="text-align:center">				
					<a class="<?php echo $btn_class; ?>" href="<?php echo $product['href']; ?>">View <i class="fa fa-search-plus"></i></a> 
				<?php } ?>
				<button type="button" data-cart="<?php echo $product['product_id']; ?>" class="<?php echo $btn_class; ?>"><?php echo str_replace('Cart', '<i title="Cart" class="fa fa-shopping-cart"></i>', $button_cart); ?></button>
			</div></div>
			<?php if ($wishlist) { ?>
			<div style="text-align:center">
			<ul class="wishlist">
				<li><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></li>
				<li><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></li>
			</ul></div>
			<?php } ?>
		</div>
	<?php } ?>
	</div>
		</div>
<hr>