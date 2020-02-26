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
			<?php include(DIR_TEMPLATE . 'default/template/common/template-form-actions.tpl'); ?>
		</form>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>