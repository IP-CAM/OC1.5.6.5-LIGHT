<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $error_warning; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<div class="alert alert-warning"><?php echo $text_account_already; ?></div>
		<p><?php echo $text_signup; ?></p>
		<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend><?php echo $text_your_details; ?></legend>
				<?php include(DIR_TEMPLATE . 'default/template/common/template-edit.tpl'); ?>
				<div class="form-group">
					<label class="control-label col-sm-3" for="fax"><?php echo $entry_fax; ?></label>
					<div class="col-sm-6">
						<input type="text" name="fax" value="<?php echo $fax; ?>" class="form-control" id="fax">
					</div>
				</div>
			</fieldset>
			<fieldset>
				<legend><?php echo $text_your_address; ?></legend>
				<div class="form-group">
					<label class="control-label col-sm-3" for="company"><?php echo $entry_company; ?></label>
					<div class="col-sm-6">
						<input type="text" name="company" value="<?php echo $company; ?>" class="form-control" id="company">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="website"><?php echo $entry_website; ?></label>
					<div class="col-sm-6">
						<input type="text" name="website" value="<?php echo $website; ?>" class="form-control" id="website">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="address_1"><b class="required">*</b> <?php echo $entry_address_1; ?></label>
					<div class="col-sm-6">
						<input type="text" name="address_1" value="<?php echo $address_1; ?>" class="form-control" id="address_1">
						<?php if ($error_address_1) { ?>
						<span class="help-block error"><?php echo $error_address_1; ?></span>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="address_2"><?php echo $entry_address_2; ?></label>
					<div class="col-sm-6">
						<input type="text" name="address_2" value="<?php echo $address_2; ?>" class="form-control" id="address_2">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="city"><b class="required">*</b> <?php echo $entry_city; ?></label>
					<div class="col-sm-6">
						<input type="text" name="city" value="<?php echo $city; ?>" class="form-control" id="city">
						<?php if ($error_city) { ?>
						<span class="help-block error"><?php echo $error_city; ?></span>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="postcode"><b id="postcode-required" class="required">*</b> <?php echo $entry_postcode; ?></label>
					<div class="col-sm-6">
						<input type="text" name="postcode" value="<?php echo $postcode; ?>" class="form-control" id="postcode">
						<?php if ($error_postcode) { ?>
						<span class="help-block error"><?php echo $error_postcode; ?></span>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="country"><b class="required">*</b> <?php echo $entry_country; ?></label>
					<div class="col-sm-6">
						<select name="country_id" class="form-control" id="country" data-param="<?php echo htmlentities('{"zone_id":"' . $zone_id . '","select":"' . $text_select . '","none":"' . $text_none . '"}'); ?>">
							<option value=""><?php echo $text_select; ?></option>
							<?php foreach ($countries as $country) { ?>
							<?php if ($country['country_id'] == $country_id) { ?>
							<option value="<?php echo $country['country_id']; ?>" selected=""><?php echo $country['name']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
							<?php } ?>
							<?php } ?>
						</select>
						<?php if ($error_country) { ?>
						<span class="help-block error"><?php echo $error_country; ?></span>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="zone_id"><b class="required">*</b> <?php echo $entry_zone; ?></label>
					<div class="col-sm-6">
						<select name="zone_id" class="form-control" id="zone_id"></select>
						<?php if ($error_zone) { ?>
						<span class="help-block error"><?php echo $error_zone; ?></span>
						<?php } ?>
					</div>
				</div>
			</fieldset>
			<fieldset>
				<legend><?php echo $text_payment; ?></legend>
				<div class="form-group">
					<label class="control-label col-sm-3" for="tax"><?php echo $entry_tax; ?></label>
					<div class="col-sm-6">
						<input type="password" name="tax" value="<?php echo $tax; ?>" class="form-control" id="tax">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><?php echo $entry_payment; ?></label>
					<div class="col-sm-6">
						<?php if ($payment == 'cheque') { ?>
						<div class="radio"><label><input type="radio" name="payment" value="cheque" checked=""> <?php echo $text_cheque; ?></label></div>
						<?php } else { ?>
						<div class="radio"><label><input type="radio" name="payment" value="cheque"> <?php echo $text_cheque; ?></label></div>
						<?php } ?>
						<?php if ($payment == 'paypal') { ?>
						<div class="radio"><label><input type="radio" name="payment" value="paypal" checked=""> <?php echo $text_paypal; ?></label></div>
						<?php } else { ?>
						<div class="radio"><label><input type="radio" name="payment" value="paypal" > <?php echo $text_paypal; ?></label></div>
						<?php } ?>
						<?php if ($payment == 'bank') { ?>
						<div class="radio"><label><input type="radio" name="payment" value="bank" checked=""> <?php echo $text_bank; ?></label></div>
						<?php } else { ?>
						<div class="radio"><label><input type="radio" name="payment" value="bank"> <?php echo $text_bank; ?></label></div>
						<?php } ?>
					</div>
				</div>
				<div id="payment-cheque" class="form-group payment">
					<label class="control-label col-sm-3" for="payment_cheque"><?php echo $entry_cheque; ?></label>
					<div class="col-sm-6">
						<input type="text" name="cheque" value="<?php echo $cheque; ?>" class="form-control" id="payment_cheque">
					</div>
				</div>
				<div id="payment-paypal" class="form-group payment">
					<label class="control-label col-sm-3" for="payment_paypal"><?php echo $entry_paypal; ?></label>
					<div class="col-sm-6">
						<input type="text" name="paypal" value="<?php echo $paypal; ?>" class="form-control" id="payment_paypal">
					</div>
				</div>
				<div id="payment-bank" class="payment">
					<div class="form-group">
						<label class="control-label col-sm-3" for="payment_bank_name"><?php echo $entry_bank_name; ?></label>
						<div class="col-sm-6">
							<input type="text" name="bank_name" value="<?php echo $bank_name; ?>" class="form-control" id="payment_bank_name">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="payment_bank_branch_number"><?php echo $entry_bank_branch_number; ?></label>
						<div class="col-sm-6">
							<input type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" class="form-control" id="payment_bank_branch_number">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="payment_bank_swift_code"><?php echo $entry_bank_swift_code; ?></label>
						<div class="col-sm-6">
							<input type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" class="form-control" id="payment_bank_swift_code">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="payment_bank_account_name"><?php echo $entry_bank_account_name; ?></label>
						<div class="col-sm-6">
							<input type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" class="form-control" id="payment_bank_account_name">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="payment_bank_account_number"><?php echo $entry_bank_account_number; ?></label>
						<div class="col-sm-6">
							<input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" class="form-control" id="payment_bank_account_number">
						</div>
					</div>
				</div>
			</fieldset>
			<fieldset>
				<legend><?php echo $text_your_password; ?></legend>
				<div class="form-group">
					<label class="control-label col-sm-3" for="password"><b class="required">*</b> <?php echo $entry_password; ?></label>
					<div class="col-sm-6">
						<input type="password" name="password" value="<?php echo $password; ?>" class="form-control" id="password">
						<?php if ($error_password) { ?>
						<span class="help-block error"><?php echo $error_password; ?></span>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="confirm"><b class="required">*</b> <?php echo $entry_confirm; ?></label>
					<div class="col-sm-6">
						<input type="password" name="confirm" value="<?php echo $confirm; ?>" class="form-control" id="confirm">
						<?php if ($error_confirm) { ?>
						<span class="help-block error"><?php echo $error_confirm; ?></span>
						<?php } ?>
					</div>
				</div>
			</fieldset>
			<?php if ($text_agree) { ?>
				<div class="form-group">
					<div class="col-sm-5 col-sm-offset-3">
						<div class="checkbox"><label>
							<input type="checkbox" name="agree" value="1"<?php echo $agree ? ' checked=""' : ''; ?>><?php echo $text_agree; ?>
						</label></div>
					</div>
				</div>
			<?php } ?>
			<div class="form-group">
				<div class="col-sm-5 col-sm-offset-3">
					<button type="submit" class="btn btn-primary"><?php echo $button_continue; ?></button>
				</div>
			</div>
		</form>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>