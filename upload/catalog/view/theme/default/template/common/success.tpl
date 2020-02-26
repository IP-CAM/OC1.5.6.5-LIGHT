<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php echo $content_top; ?>
		<div class="page-header"><h1><?php echo $heading_title; ?></h1></div>
		<p><?php echo $text_message; ?></p>
		<div class="form-actions">
			<div class="form-actions-inner">
				<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
			</div>
<hr>
		</div>
	<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>