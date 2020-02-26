<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend><?php echo $text_password; ?></legend>
				<div class="form-group">
					<label class="control-label col-sm-3" for="password"><b class="required">*</b> <?php echo $entry_password; ?></label>
					<div class="col-sm-6">
						<input type="password" name="password" value="<?php echo $password; ?>" class="form-control" autofocus="" id="password">
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
			<?php include(DIR_TEMPLATE . 'default/template/common/template-form-actions.tpl'); ?>
		</form>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>