<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $error_warning; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
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
					<label class="control-label col-sm-3" for="zone_id"><b class="required">*</b> <?php echo $entry_zone; ?></label>
					<div class="col-sm-6">
						<select name="zone_id" class="form-control" id="zone_id"></select>
						<?php if ($error_zone) { ?>
						<span class="help-block error"><?php echo $error_zone; ?></span>
						<?php } ?>
					</div>
				</div>
			</fieldset>
			<?php include(DIR_TEMPLATE . 'default/template/common/template-form-actions.tpl'); ?>
		</form>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>