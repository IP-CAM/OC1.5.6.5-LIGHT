<div class="panel-body">
	<form class="form-horizontal">
		<fieldset>
			<legend><?php echo $text_your_details; ?></legend>
			<div class="form-group">
				<label class="control-label col-sm-3" for="firstname"><b class="required">*</b> <?php echo $entry_firstname; ?></label>
				<div class="col-sm-6">
					<input type="text" name="firstname" value="" class="form-control" id="firstname" autofocus="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="lastname"><b class="required">*</b> <?php echo $entry_lastname; ?></label>
				<div class="col-sm-6">
					<input type="text" name="lastname" value="" class="form-control" id="lastname">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="email"><b class="required">*</b> <?php echo $entry_email; ?></label>
				<div class="col-sm-6">
					<input type="text" name="email" value="" class="form-control" id="email">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="telephone"><b class="required">*</b> <?php echo $entry_telephone; ?></label>
				<div class="col-sm-6">
					<input type="text" name="telephone" value="" class="form-control" id="telephone">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="fax"><?php echo $entry_fax; ?></label>
				<div class="col-sm-6">
					<input type="text" name="fax" value="" class="form-control" id="fax">
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend><?php echo $text_your_password; ?></legend>
			<div class="form-group">
				<label class="control-label col-sm-3" for="password"><b class="required">*</b> <?php echo $entry_password; ?></label>
				<div class="col-sm-6">
					<input type="password" name="password" value="" class="form-control" id="password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="confirm"><b class="required">*</b> <?php echo $entry_confirm; ?></label>
				<div class="col-sm-6">
					<input type="password" name="confirm" value="" class="form-control" id="confirm">
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend><?php echo $text_your_address; ?></legend>
			<div class="form-group">
				<label class="control-label col-sm-3" for="company"><?php echo $entry_company; ?></label>
				<div class="col-sm-6">
					<input type="text" name="company" value="" class="form-control" id="company">
				</div>
			</div>
			<div class="form-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
				<label class="control-label col-sm-3" for="customer_group_id"><?php echo !empty($entry_account) ? $entry_account : $entry_customer_group; ?></label>
				<div class="col-sm-6">
					<select name="customer_group_id" class="form-control" id="customer_group_id">
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
					<input type="text" name="company_id" value="" class="form-control" id="company_id">
				</div>
			</div>
			<div class="form-group" id="tax-id-display">
				<label class="control-label col-sm-3" for="tax_id"><b id="tax-id-required" class="required">*</b> <?php echo $entry_tax_id; ?></label>
				<div class="col-sm-6">
					<input type="text" name="tax_id" value="" class="form-control" id="tax_id">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="address_1"><b class="required">*</b> <?php echo $entry_address_1; ?></label>
				<div class="col-sm-6">
					<input type="text" name="address_1" value="" class="form-control" id="address_1">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="address_2"><?php echo $entry_address_2; ?></label>
				<div class="col-sm-6">
					<input type="text" name="address_2" value="" class="form-control" id="address_2">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="city"><b class="required">*</b> <?php echo $entry_city; ?></label>
				<div class="col-sm-6">
					<input type="text" name="city" value="" class="form-control" id="city">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="postcode"><b id="postcode-required" class="required">*</b> <?php echo $entry_postcode; ?></label>
				<div class="col-sm-6">
					<input type="text" name="postcode" value="" class="form-control" id="postcode">
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
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="zone_id"><b class="required">*</b> <?php echo $entry_zone; ?></label>
				<div class="col-sm-6">
					<select name="zone_id" class="form-control" id="zone_id"></select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-3">
					<div class="checkbox"><label><input type="checkbox" name="newsletter" value="1"><?php echo $entry_newsletter; ?></label></div>
					<?php if ($shipping_required) { ?>
						<div class="checkbox"><label><input type="checkbox" name="shipping_address" value="1"><?php echo $entry_shipping; ?></label></div>
					<?php } ?>
					<?php if ($text_agree) { ?>
						<div class="checkbox"><label><input type="checkbox" name="agree" value="1"><?php echo $text_agree; ?></label></div>
					<?php } ?>
				</div>
			</div>
		</fieldset>
	</form>
</div>
<div class="panel-footer text-right">
	<button type="button" id="button-register" class="btn btn-primary load-left"><?php echo $button_continue; ?></button>
</div>
<script>
var customer_group=[];
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]=[];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display']=<?php echo $customer_group['company_id_display']; ?>;
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required']=<?php echo $customer_group['company_id_required']; ?>;
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display']=<?php echo $customer_group['tax_id_display']; ?>;
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required']=<?php echo $customer_group['tax_id_required']; ?>;
<?php } ?>

$('#payment-address select[name="customer_group_id"]').change();
</script>