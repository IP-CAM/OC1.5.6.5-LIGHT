<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<?php if ($orders) { ?>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th class="text-left hidden-xs"><?php echo $text_order_id; ?></th>
						<th><?php echo $text_status; ?></th>
						<th><?php echo $text_date_added; ?></th>
						<th class="text-right hidden-xs"><?php echo $text_products; ?></th>
						<th class="hidden-xs"><?php echo $text_customer; ?></th>
						<th class="text-right"><?php echo $text_total; ?></th>
						<th class="text-right"></th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($orders as $order) { ?>
						<tr>
							<td class="text-center hidden-xs">#<?php echo $order['order_id']; ?></td>
							<td class="hidden-xs text-<?php echo strtolower($order['status']); ?>"><?php echo $order['status']; ?></td>
							<td><?php echo $order['date_added']; ?></td>
							<td class="text-right hidden-xs"><?php echo $order['products']; ?></td>
							<td class="hidden-xs"><?php echo $order['name']; ?></td>
							<td class="text-right"><?php echo $order['total']; ?></td>
							<td class="text-center">
								<a style="margin:3px;" class="btn btn-default" href="<?php echo $order['href']; ?>"><i class="fa fa-search-plus"></i><span class="hidden-xs"> <?php echo $button_view; ?></span></a><br />
								<a class="btn btn-default hidden-xs" href="<?php echo $order['reorder']; ?>"><i class="fa fa-repeat"></i> <?php echo $button_reorder; ?></a>
							</td>
						</tr>
					<?php } ?>
				</tbody>
			</table>
			<div class="pagination"><?php echo str_replace('....','',$pagination); ?></div>
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