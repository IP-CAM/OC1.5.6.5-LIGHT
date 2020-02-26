<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error) { ?>
<div class="alert alert-danger"><?php echo $error; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
	<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
	<table class="table">
	<thead>
		<tr>
		<td colspan="2"><?php echo $text_recurring_detail; ?></td>
		</tr>
	</thead>
	<tbody>
	<tr>
		<td class="col-sm-6">
			<p><b><?php echo $text_recurring_id; ?></b> #<?php echo $profile['order_recurring_id']; ?></p>
			<p><b><?php echo $text_date_added; ?></b> <?php echo $profile['created']; ?></p>
			<p><b><?php echo $text_status; ?></b> <?php echo $status_types[$profile['status']]; ?></p>
			<p><b><?php echo $text_payment_method; ?></b> <?php echo $profile['payment_method']; ?></p>
		</td>
		<td style="width: 50%; vertical-align: top;">
			<p><b><?php echo $text_product; ?></b> <a href="<?php echo $profile['product_link']; ?>"><?php echo $profile['product_name']; ?></a></p>
			<p><b><?php echo $text_quantity; ?></b> <?php echo $profile['product_quantity']; ?></p>
			<p><b><?php echo $text_order; ?></b> <a href="<?php echo $profile['order_link']; ?>">#<?php echo $profile['order_id']; ?></a></p>
		</td>
	</tr>
	</tbody>
	</table>
	<table class="table">
		<thead>
			<tr>
				<td><?php echo $text_recurring_description; ?></td>
				<td><?php echo $text_ref; ?></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="col-sm-6"><p><?php echo $profile['profile_description']; ?></p></td>
				<td class="col-sm-6"><p><?php echo $profile['profile_reference']; ?></p></td>
			</tr>
		</tbody>
	</table>
	<h2><?php echo $text_transactions; ?></h2>
	<table class="table">
		<thead>
			<tr>
			<td><?php echo $column_created; ?></td>
			<td class="text-center"><?php echo $column_type; ?></td>
			<td class="text-right"><?php echo $column_amount; ?></td>
			</tr>
		</thead>
		<tbody>
			<?php if(!empty($profile['transactions'])){
			foreach ($profile['transactions'] as $transaction) { ?>
			<tr>
				<td><?php echo $transaction['created']; ?></td>
				<td class="text-center"><?php echo $transaction_types[$transaction['type']]; ?></td>
				<td class="text-right"><?php echo $transaction['amount']; ?></td>
			</tr>
			<?php } } else { ?>
			<tr>
				<td colspan="3" class="text-center"><?php echo $text_empty_transactions; ?></td>
			</tr>
		<?php } ?>
		</tbody>
	</table>
	<div class="well">
		<div class="text-right">
			<?php if ($cancel_link){ ?>
				<a href="<?php echo $cancel_link; ?>" class="btn btn-default" onclick="return confirmCancel();"><?php echo $button_cancel_profile; ?></a>
			<?php } ?>
			<a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_continue; ?></a>
		</div>
	</div>
	<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
<script>
function confirmCancel(){
	var confirmed = confirm("<?php echo $text_confirm_cancel; ?>");
	return confirmed;
}
</script>