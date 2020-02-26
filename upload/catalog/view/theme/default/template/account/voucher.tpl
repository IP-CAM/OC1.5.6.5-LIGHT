<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $error_warning; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<div class="alert alert-warning"><?php echo $text_description; ?></div>
		<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-3" for="to_name"><b class="required">*</b> <?php echo $entry_to_name; ?></label>
				<div class="col-sm-6">
					<input type="text" name="to_name" value="<?php echo $to_name; ?>" class="form-control" id="to_name" autofocus="">
					<?php if ($error_to_name) { ?>
						<span class="help-block error"><?php echo $error_to_name; ?></span>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="to_email"><b class="required">*</b> <?php echo $entry_to_email; ?></label>
				<div class="col-sm-6">
					<input type="text" name="to_email" value="<?php echo $to_email; ?>" class="form-control" id="to_email">
					<?php if ($error_to_email) { ?>
						<span class="help-block error"><?php echo $error_to_email; ?></span>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="from_name"><b class="required">*</b> <?php echo $entry_from_name; ?></label>
				<div class="col-sm-6">
					<input type="text" name="from_name" value="<?php echo $from_name; ?>" class="form-control" id="from_name">
					<?php if ($error_from_name) { ?>
						<span class="help-block error"><?php echo $error_from_name; ?></span>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="from_email"><b class="required">*</b> <?php echo $entry_from_email; ?></label>
				<div class="col-sm-6">
					<input type="text" name="from_email" value="<?php echo $from_email; ?>" class="form-control" id="from_email">
					<?php if ($error_from_email) { ?>
						<span class="help-block error"><?php echo $error_from_email; ?></span>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3"><b class="required">*</b> <?php echo $entry_theme; ?></label>
				<div class="col-sm-6">
					<?php foreach ($voucher_themes as $voucher_theme) { ?>
						<div class="radio"><label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>">
						<?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
							<input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="">
						<?php } else { ?>
							<input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>">
						<?php } ?>
						<?php echo $voucher_theme['name']; ?></label></div>
					<?php } ?>
					<?php if ($error_theme) { ?>
						<span class="help-block error"><?php echo $error_theme; ?></span>
					<?php } ?>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="message"><?php echo $entry_message; ?></label>
				<div class="col-sm-6">
					<textarea name="message" class="form-control" rows="4" id="message"><?php echo $message; ?></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="amount"><b class="required">*</b> <?php echo $entry_amount; ?></label>
				<div class="col-sm-6">
					<input type="text" name="amount" value="<?php echo $amount; ?>" class="form-control" id="amount">
					<?php if ($error_amount) { ?>
						<span class="help-block error"><?php echo $error_amount; ?></span>
					<?php } ?>
				</div>
			</div>
			<?php if ($text_agree) { ?>
				<div class="form-group">
					<div class="col-sm-6 col-sm-offset-3">
						<div class="checkbox"><label>
							<input type="checkbox" name="agree" value="1"<?php echo $agree ? ' checked=""' : ''; ?>><?php echo $text_agree; ?>
						</label></div>
					</div>
				</div>
			<?php } ?>
			<div class="form-actions">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<button type="submit" class="btn btn-primary"><?php echo $button_continue; ?></button>
					</div>
				</div>
			</div>
		</form>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>