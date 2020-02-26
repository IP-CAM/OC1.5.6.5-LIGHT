<?php foreach ($products as $product) { ?>
	<div class="media">
	<?php if ($product['thumb']) { ?>
	<a class="pull-left" href="<?php echo $product['href']; ?>"><img class="media-object img-thumbnail" src="<?php echo $product['thumb']; ?>" loading="lazy" alt="<?php echo $product['name']; ?>"></a>
	<?php } ?>
	<div class="pull-right">
	<?php if (!$product['special']) { ?>
	<p><strong><big><?php echo $product['price']; ?></big></strong></p>
	<?php } else { ?>
	<p><s class="reviews"><?php echo $product['price']; ?></s> &nbsp;&nbsp;<strong><big><?php echo $product['special']; ?></big></strong></p>
	<?php } ?>
	<div class="cart">
	<button title="Add to Cart" type="button" data-cart="<?php echo $product['product_id']; ?>" class="btn btn-primary load-left"><?php echo str_replace('to Cart', '<i title="Cart" class="fa fa-shopping-cart"></i>', $button_cart); ?></button>&nbsp;<a class="btn btn-primary" title="View Product" href="<?php echo $product['href']; ?>">View <i class="fa fa-search-plus"></i></a>
	</div>
	<ul class="wishlist">
	<li><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="fa fa-pencil-square-o fa-1x"></i> &nbsp;<?php echo $button_wishlist; ?></a></li>
	<li><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange fa-1x"></i> &nbsp;<?php echo $button_compare; ?></a></li>
	</ul>
	</div>
	<div class="media-body">
	<div class="lead media-heading"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
	<?php if (utf8_strlen($product['description']) > 2) { ?>
	<p class="description"><?php echo $product['description']; ?></p>
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
	</div>
<?php } ?>