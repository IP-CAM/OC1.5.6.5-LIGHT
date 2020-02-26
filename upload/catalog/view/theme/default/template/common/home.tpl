<?php echo $header; ?>
	<hr>	
	<div class="row">
		<?php echo $column_left; ?>
		<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
			<?php echo $content_top; ?>
			<?php echo $content_bottom; ?>
			<h1 class="hide"><?php echo $heading_title; ?></h1>
		</div>
		<?php echo $column_right; ?>
	</div>
	<hr>	
<?php echo $footer; ?>