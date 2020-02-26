<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $error_warning; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<div class="alert alert-warning"><?php echo $text_account_already; ?></div>
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
				<div class="form-group<?php echo (count($customer_groups) > 1 ? '' : ' hide'); ?>">
					<label class="control-label col-sm-3" for="customer_group_id"><?php echo $entry_customer_group; ?></label>
					<div class="col-sm-6">
						<select name="customer_group_id" class="col-sm-3" id="customer_group_id">
							<?php foreach ($customer_groups as $customer_group) { ?>
							<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
							<option value="<?php echo $customer_group['customer_group_id']; ?>" selected=""><?php echo $customer_group['name']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
							<?php } ?>
							<?php } ?>
						</select>
					</div>
				</div>
				<div class="form-group" id="company-id-display">
					<label class="control-label col-sm-3" for="company_id"><b id="company-id-required" class="required">*</b> <?php echo $entry_company_id; ?></label>
					<div class="col-sm-6">
						<input type="text" name="company_id" value="<?php echo $company_id; ?>" class="form-control" id="company_id">
						<?php if ($error_company_id) { ?>
						<span class="help-block error"><?php echo $error_company_id; ?></span>
						<?php } ?>
					</div>
				</div>
				<div class="form-group" id="tax-id-display">
					<label class="control-label col-sm-3" for="tax_id"><b id="tax-id-required" class="required">*</b> <?php echo $entry_tax_id; ?></label>
					<div class="col-sm-6">
						<input type="text" name="tax_id" value="<?php echo $tax_id; ?>" class="form-control" id="tax_id">
						<?php if ($error_tax_id) { ?>
						<span class="help-block error"><?php echo $error_tax_id; ?></span>
						<?php } ?>
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
					<label class="control-label col-sm-3"><b class="required">*</b> <?php echo $entry_country; ?></label>
					<div class="col-sm-6">
						<select name="country_id" class="form-control" data-param="<?php echo htmlentities('{"zone_id":"' . $zone_id . '","select":"' . $text_select . '","none":"' . $text_none . '"}'); ?>">
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
					<label class="control-label col-sm-3"><b class="required">*</b> <?php echo $entry_zone; ?></label>
					<div class="col-sm-6">
						<select name="zone_id" class="form-control"></select>
						<?php if ($error_zone) { ?>
						<span class="help-block error"><?php echo $error_zone; ?></span>
						<?php } ?>
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
						<span class="help-block error"><?php echo $error_password; ?></span>
						<?php } ?>
					</div>
				</div>
			</fieldset>
			<fieldset>
				<legend><?php echo $text_newsletter; ?></legend>
				<div class="form-group">
					<label class="control-label col-sm-3"><?php echo $entry_newsletter; ?></label>
					<div class="col-sm-6">
						<?php if ($newsletter) { ?>
						<label class="radio-inline"><input type="radio" name="newsletter" value="1" checked=""> <?php echo $text_yes; ?></label>
						<label class="radio-inline"><input type="radio" name="newsletter" value="0"> <?php echo $text_no; ?></label>
						<?php } else { ?>
						<label class="radio-inline"><input type="radio" name="newsletter" value="1"> <?php echo $text_yes; ?></label>
						<label class="radio-inline"><input type="radio" name="newsletter" value="0" checked=""> <?php echo $text_no; ?></label>
						<?php } ?>
					</div>
				</div>
			</fieldset>
			<?php if ($text_agree) { ?>
				<div class="form-group">
					<div class="col-sm-6 col-sm-offset-3">
						<div class="checkbox"><label>
							<input type="checkbox" name="agree" value="1"<?php echo $agree ? ' checked=""' : ''; ?>><?php echo $text_agree; ?>
						</label></div>
					</div>
				</div>
			<?php } ?>
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-3">
					<button type="submit" class="btn btn-primary"><?php echo $button_continue; ?></button>
				</div>
			</div>
		</form>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<hr>
<script>
var customer_group=[];
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]=[];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display']=<?php echo $customer_group['company_id_display']; ?>;
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required']=<?php echo $customer_group['company_id_required']; ?>;
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display']=<?php echo $customer_group['tax_id_display']; ?>;
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required']=<?php echo $customer_group['tax_id_required']; ?>;
<?php } ?>
</script>
<?php echo $footer; ?>