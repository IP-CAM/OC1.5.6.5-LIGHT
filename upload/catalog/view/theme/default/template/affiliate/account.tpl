<?php echo $header; ?>
<?php if ($success) { ?>
<div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $success; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<fieldset>
			<legend><?php echo $text_my_account; ?></legend>
			<ul>
				<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
				<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
				<li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
			</ul>
		</fieldset>
		<fieldset>
			<legend><?php echo $text_my_tracking; ?></legend>
			<ul>
				<li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
			</ul>
		</fieldset>
		<fieldset>
			<legend><?php echo $text_my_transactions; ?></legend>
			<ul>
				<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
			</ul>
		</fieldset>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>