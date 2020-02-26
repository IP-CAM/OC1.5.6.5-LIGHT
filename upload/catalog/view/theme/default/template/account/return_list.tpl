<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<?php if ($returns) { ?>
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="text-right hidden-xs"><?php echo $text_return_id; ?></th>
						<th><?php echo $text_status; ?></th>
						<th class="hidden-xs"><?php echo $text_date_added; ?></th>
						<th class="text-right"><?php echo $text_order_id; ?></th>
						<th><?php echo $text_customer; ?></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<?php foreach ($returns as $return) { ?>
					<tr>
						<td class="text-right hidden-xs">#<?php echo $return['return_id']; ?></td>
						<td><?php echo $return['status']; ?></td>
						<td class="hidden-xs"><?php echo $return['date_added']; ?></td>
						<td class="text-right"><?php echo $return['order_id']; ?></td>
						<td><?php echo $return['name']; ?></td>
						<td class="text-right"><a class="btn btn-default" href="<?php echo $return['href']; ?>"><i class="fa fa-search-plus"></i><span class="hidden-xs"> <?php echo $button_view; ?></span></a></td>
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