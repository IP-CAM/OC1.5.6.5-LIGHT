<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<div class="alert alert-warning"><?php echo $text_error; ?></div>
		<div class="form-actions">
			<div class="form-actions-inner text-right">
				<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
			</div>
		</div>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>