<?php echo $header; ?>
<?php if ($success) { ?>
<div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $success; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<?php if ($products) { ?>
			<h4><?php echo $text_product; ?></h4>
			<table class="table table-striped">
				<tbody>
					<tr>
						<td><?php echo $text_image; ?></td>
						<?php foreach ($products as $product) { ?>
							<td><?php if ($products[$product['product_id']]['thumb']) { ?>
							<img class="img-thumbnail" src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>">
							<?php } ?></td>
						<?php } ?>
					</tr>
					<tr>
						<td><?php echo $text_name; ?></td>
						<?php foreach ($products as $product) { ?>
						<td class="name"><a href="<?php echo $products[$product['product_id']]['href']; ?>"><?php echo $products[$product['product_id']]['name']; ?></a></td>
						<?php } ?>
					</tr>
					<tr>
						<td><?php echo $text_price; ?></td>
						<?php foreach ($products as $product) { ?>
						<td><?php if ($products[$product['product_id']]['price']) { ?>
							<?php if (!$products[$product['product_id']]['special']) { ?>
								<?php echo $products[$product['product_id']]['price']; ?>
							<?php } else { ?>
								<s class="text-danger"><?php echo $products[$product['product_id']]['price']; ?></s> <?php echo $products[$product['product_id']]['special']; ?>
							<?php } ?>
							<?php } ?></td>
						<?php } ?>
					</tr>
					<tr>
						<td><?php echo $text_model; ?></td>
						<?php foreach ($products as $product) { ?>
						<td><?php echo $products[$product['product_id']]['model']; ?></td>
						<?php } ?>
					</tr>
					<tr>
						<td><?php echo $text_manufacturer; ?></td>
						<?php foreach ($products as $product) { ?>
						<td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
						<?php } ?>
					</tr>
					<tr>
						<td><?php echo $text_availability; ?></td>
						<?php foreach ($products as $product) { ?>
						<td><?php echo $products[$product['product_id']]['availability']; ?></td>
						<?php } ?>
					</tr>
					<tr>
						<td><?php echo $text_rating; ?></td>
						<?php foreach ($products as $product) { ?>
						<td>
							<?php if ($products[$product['product_id']]['rating']) { ?>
								<div class="reviews" title="<?php echo $products[$product['product_id']]['reviews']; ?>">
								<?php for ($i = 1; $i <= 5; $i++) {
									if ($products[$product['product_id']]['rating'] < $i) {
										echo '<i class="glyphicon glyphicon-star-empty"></i>';
									} else {
										echo '<i class="glyphicon glyphicon-star"></i>';
									}
								} ?></div>
							<?php } ?>
							</td>
						<?php } ?>
					</tr>
					<tr>
						<td><?php echo $text_summary; ?></td>
						<?php foreach ($products as $product) { ?>
						<td><?php echo $products[$product['product_id']]['description']; ?></td>
						<?php } ?>
					</tr>
					<tr>
						<td><?php echo $text_weight; ?></td>
						<?php foreach ($products as $product) { ?>
						<td><?php echo $products[$product['product_id']]['weight']; ?></td>
						<?php } ?>
					</tr>
					<tr>
						<td><?php echo $text_dimension; ?></td>
						<?php foreach ($products as $product) { ?>
						<td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
						<?php } ?>
					</tr>
					<?php foreach ($attribute_groups as $attribute_group) { ?>
						<tr>
							<th colspan="<?php echo count($products) + 1; ?>"><?php echo $attribute_group['name']; ?></th>
						</tr>
						<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
							<tr>
								<td><?php echo $attribute['name']; ?></td>
								<?php foreach ($products as $product) { ?>
								<?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
								<td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
								<?php } else { ?>
								<td></td>
								<?php } ?>
								<?php } ?>
							</tr>
						<?php } ?>
					<?php } ?>
					<tr>
						<td></td>
						<?php foreach ($products as $product) { ?>
							<td class="text-center">
								<a class="btn btn-danger" href="<?php echo $product['remove']; ?>"><i class="fa fa-trash-o"></i><span class="hidden-xs"> <?php echo $button_remove; ?></span></a>
								<button type="button" data-cart="<?php echo $product['product_id']; ?>" class="btn btn-primary"><?php echo str_replace('Cart', '<i title="Cart" class="fa fa-shopping-cart"></i>', $button_cart); ?></button>
							</td>
						<?php } ?>
					</tr>
				</tbody>
			</table>
		<?php } else { ?>
			<div class="alert alert-warning"><?php echo $text_empty; ?></div>
			<div class="form-actions">
				<div class="form-actions-inner text-right">
					<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
				</div>
			</div>
		<?php } ?>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>