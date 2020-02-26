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
				<legend><?php echo $text_your_email; ?></legend>
				<div class="form-group">
					<label class="control-label col-sm-3" for="email"><?php echo $entry_email; ?></label>
					<div class="col-sm-6">
						<input type="text" name="email" value="" class="form-control" autofocus="" id="email">
						<p class="help-block"><?php echo $text_email; ?></p>
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