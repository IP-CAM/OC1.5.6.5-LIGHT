<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<fieldset>
			<legend><?php echo $text_return_detail; ?></legend>
			<div class="row">
				<div class="col-sm-6">
					<b><?php echo $text_return_id; ?></b> #<?php echo $return_id; ?><br>
					<b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?>
				</div>
				<div class="col-sm-6">
					<b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br>
					<b><?php echo $text_date_ordered; ?></b> <?php echo $date_ordered; ?>
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend><?php echo $text_product; ?></legend>
			<div class="row">
				<div class="col-sm-6">
					<b><?php echo $column_product; ?>:</b> <?php echo $product; ?><br>
					<b><?php echo $column_model; ?>:</b> <?php echo $model; ?><br>
					<b><?php echo $column_quantity; ?>:</b> <?php echo $quantity; ?>
				</div>
				<div class="col-sm-6">
					<b><?php echo $column_reason; ?>:</b> <?php echo $reason; ?><br>
					<b><?php echo $column_opened; ?>:</b> <?php echo $opened; ?><br>
					<b><?php echo $column_action; ?>:</b> <?php echo $action; ?>
				</div>
			</div>
		</fieldset>
		<?php if ($comment) { ?>
			<fieldset>
				<legend><?php echo $text_comment; ?></legend>
				<?php echo $comment; ?>
			</fieldset>
		<?php } ?>
		<?php if ($histories) { ?>
			<fieldset>
				<legend><?php echo $text_history; ?></legend>
				<table class="table table-striped">
					<thead>
						<tr>
							<th><?php echo $column_date_added; ?></th>
							<th class="col-sm-3"><?php echo $column_status; ?></th>
							<th class="col-sm-3"><?php echo $column_comment; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($histories as $history) { ?>
						<tr>
							<td><?php echo $history['date_added']; ?></td>
							<td><?php echo $history['status']; ?></td>
							<td><?php echo $history['comment']; ?></td>
						</tr>
						<?php } ?>
					</tbody>
				</table>
			</fieldset>
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