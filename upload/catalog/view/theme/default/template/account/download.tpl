<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="text-right hidden-xs"><?php echo $text_order; ?></th>
					<th><?php echo $text_size; ?></th>
					<th><?php echo $text_name; ?></th>
					<th class="text-right hidden-xs"><?php echo $text_date_added; ?></th>
					<th class="text-right"><?php echo $text_remaining; ?></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<?php foreach ($downloads as $download) { ?>
				<tr>
					<td class="text-right hidden-xs"><?php echo $download['order_id']; ?></td>
					<td><?php echo $download['size']; ?></td>
					<td><?php echo $download['name']; ?></td>
					<td class="text-right hidden-xs"><?php echo $download['date_added']; ?></td>
					<td class="text-right"><?php echo $download['remaining']; ?></td>
					<td class="text-right"><?php if ($download['remaining'] > 0) { ?>
						<a class="btn btn-default" href="<?php echo $download['href']; ?>"><i class="fa fa-download"></i><span class="hidden-xs"> <?php echo $button_download; ?></span></a>
					<?php } ?></td>
				</tr>
			<?php } ?>
			</tbody>
		</table>
		<div class="pagination"><?php echo str_replace('....','',$pagination); ?></div>
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