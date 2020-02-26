<h3 class="text-muted"><?php echo $heading_title; ?></h3>
<div class="row product-block">
	<?php foreach ($products as $product) { ?>
	<div class="thumbnail-grid col-sm-2">
		<?php if ($product['thumb']) { ?>
			<a class="thumbnail" href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a>
		<?php } ?>
		<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		<div class="price"><strong><?php echo $product['price']; ?></strong></div>
	</div>
	<?php } ?>
</div>
<img src="<?php echo $tracking_pixel; ?>" height="0" width="0">
