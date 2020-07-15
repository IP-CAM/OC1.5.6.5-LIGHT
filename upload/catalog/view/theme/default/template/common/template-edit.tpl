<div class="form-group">
	<label class="control-label col-sm-3" for="firstname"><b class="required">*</b> <?php echo $entry_firstname; ?></label>
	<div class="col-sm-6">
		<input type="text" name="firstname" value="<?php echo $firstname; ?>" class="form-control" autofocus="" id="firstname">
		<?php if ($error_firstname) { ?>
		<span class="help-block error"><?php echo $error_firstname; ?></span>
		<?php } ?>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-sm-3" for="lastname"><b class="required">*</b> <?php echo $entry_lastname; ?></label>
	<div class="col-sm-6">
		<input type="text" name="lastname" value="<?php echo $lastname; ?>" class="form-control" id="lastname">
		<?php if ($error_lastname) { ?>
		<span class="help-block error"><?php echo $error_lastname; ?></span>
		<?php } ?>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-sm-3" for="email"><b class="required">*</b> <?php echo $entry_email; ?></label>
	<div class="col-sm-6">
		<input type="text" name="email" value="<?php echo $email; ?>" class="form-control" id="email">
		<?php if ($error_email) { ?>
		<span class="help-block error"><?php echo $error_email; ?></span>
		<?php } ?>
	</div>
</div>
<div class="form-group">
	<label class="control-label col-sm-3" for="telephone"><b class="required">*</b> <?php echo $entry_telephone; ?></label>
	<div class="col-sm-6">
		<input type="text" name="telephone" value="<?php echo $telephone; ?>" class="form-control" id="telephone">
		<?php if ($error_telephone) { ?>
		<span class="help-block error"><?php echo $error_telephone; ?></span>
		<?php } ?>
	</div>
</div>