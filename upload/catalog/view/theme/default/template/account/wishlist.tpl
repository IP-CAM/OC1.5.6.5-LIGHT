<?php echo $header; ?>
<?php if ($success) { ?>
<div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $success; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<?php if ($products) { ?>
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="text-center"><?php echo $column_image; ?></th>
						<th><?php echo $column_name; ?></th>
						<th class="hidden-xs"><?php echo $column_model; ?></th>
						<th class="text-right hidden-xs"><?php echo $column_stock; ?></th>
						<th class="text-right"><?php echo $column_price; ?></th>
						<th class="text-right"><?php echo $column_action; ?></th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($products as $product) { ?>
						<tr id="wishlist-row<?php echo $product['product_id']; ?>">
							<td class="text-center"><?php if ($product['thumb']) { ?>
								<a href="<?php echo $product['href']; ?>"><img class="img-thumbnail" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"></a>
							<?php } ?></td>
							<td><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
							<td class="hidden-xs"><?php echo $product['model']; ?></td>
							<td class="text-right hidden-xs"><?php echo $product['stock']; ?></td>
							<td class="text-right"><?php if ($product['price']) { ?>
								<?php if (!$product['special']) { ?>
									<strong><?php echo $product['price']; ?></strong>
								<?php } else { ?>
									<s class="text-danger"><?php echo $product['price']; ?></s> <strong><?php echo $product['special']; ?></strong>
								<?php } ?>
							<?php } ?></td>
							<td class="text-right">
								<button type="button" data-cart="<?php echo $product['product_id']; ?>" class="btn btn-primary load-left"><?php echo str_replace('Cart', '<i title="Cart" class="fa fa-shopping-cart"></i>', $button_cart); ?></button>
								<a class="btn btn-danger" href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>"><i class="fa fa-trash-o"></i></a>
							</td>
						</tr>
					<?php } ?>
				</tbody>
			</table>
		<?php } else { ?>
			<div class="alert alert-warning"><?php echo $text_empty; ?></div>
		<?php } ?>
		<div class="form-actions">
			<div class="form-actions-inner text-right">
				<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
			</div>
		</div>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>