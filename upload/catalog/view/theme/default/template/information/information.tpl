<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<p><?php echo $description; ?></p>
		<div class="form-actions">
			<div class="form-actions-inner text-right">
				<span style="text-align:right;"><input class="btn btn-default" type="button" VALUE="Return to last Page" ONCLICK="history.go(-1);">
		</span>&nbsp; 
		<span style="text-align:left;"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
		</span>
			</div>
		</div>
		<?php echo $content_bottom; ?>
	<hr>		
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>