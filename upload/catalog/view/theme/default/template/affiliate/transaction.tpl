<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<?php if ($transactions) { ?>
		<div class="alert alert-info"><?php echo $text_balance; ?> <b><?php echo $balance; ?></b></div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th><?php echo $column_date_added; ?></th>
					<th><?php echo $column_description; ?></th>
					<th class="text-right"><?php echo $column_amount; ?></th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($transactions	as $transaction) { ?>
				<tr>
					<td><?php echo $transaction['date_added']; ?></td>
					<td><?php echo $transaction['description']; ?></td>
					<td class="text-right"><?php echo $transaction['amount']; ?></td>
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