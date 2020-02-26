<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend><?php echo $text_your_payment; ?></legend>
				<div class="form-group">
					<label class="control-label col-sm-3" for="tax"><?php echo $entry_tax; ?></label>
					<div class="col-sm-6">
						<input type="text" name="tax" value="<?php echo $tax; ?>" class="form-control" id="tax">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><?php echo $entry_payment; ?></label>
					<div class="col-sm-6">
						<div class="radio"><label for="cheque"><input type="radio" name="payment" value="cheque" id="cheque"<?php echo ($payment == 'cheque') ? ' checked=""' : ''; ?>> <?php echo $text_cheque; ?></label></div>
						<div class="radio"><label for="paypal"><input type="radio" name="payment" value="paypal" id="paypal"<?php echo ($payment == 'paypal') ? ' checked=""' : ''; ?>> <?php echo $text_paypal; ?></label></div>
						<div class="radio"><label for="bank"><input type="radio" name="payment" value="bank" id="bank"<?php echo ($payment == 'bank') ? ' checked=""' : ''; ?>> <?php echo $text_bank; ?></label></div>
					</div>
				</div>
				<div class="form-group payment" id="payment-cheque">
					<label class="control-label col-sm-3" for="cheque"><?php echo $entry_cheque; ?></label>
					<div class="col-sm-6">
						<input type="text" name="cheque" value="<?php echo $cheque; ?>" class="form-control" id="cheque">
					</div>
				</div>
				<div class="form-group payment" id="payment-paypal">
					<label class="control-label col-sm-3" for="paypal"><?php echo $entry_paypal; ?></label>
					<div class="col-sm-6">
						<input type="text" name="paypal" value="<?php echo $paypal; ?>" class="form-control" id="paypal">
					</div>
				</div>
				<div class="payment" id="payment-bank">
					<div class="form-group">
						<label class="control-label col-sm-3" for="bank_name"><?php echo $entry_bank_name; ?></label>
						<div class="col-sm-6">
							<input type="text" name="bank_name" value="<?php echo $bank_name; ?>" class="form-control" id="bank_name">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="bank_branch_number"><?php echo $entry_bank_branch_number; ?></label>
						<div class="col-sm-6">
							<input type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" class="form-control" id="bank_branch_number">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="bank_swift_code"><?php echo $entry_bank_swift_code; ?></label>
						<div class="col-sm-6">
							<input type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" class="form-control" id="bank_swift_code">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="bank_account_name"><?php echo $entry_bank_account_name; ?></label>
						<div class="col-sm-6">
							<input type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" class="form-control" id="bank_account_name">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="bank_account_number"><?php echo $entry_bank_account_number; ?></label>
						<div class="col-sm-6">
							<input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" class="form-control" id="bank_account_number">
						</div>
					</div>
				</div>
				<?php include(DIR_TEMPLATE . 'default/template/common/template-form-actions.tpl'); ?>
			</fieldset>
		</form>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?> 