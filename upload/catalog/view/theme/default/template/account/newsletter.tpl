<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-3"><?php echo $entry_newsletter; ?></label>
				<div class="col-sm-6">
					<?php if ($newsletter) { ?>
						<div class="radio"><label><input type="radio" name="newsletter" value="1" checked=""><?php echo $text_yes; ?></label>	</div>
						<div class="radio"><label><input type="radio" name="newsletter" value="0"><?php echo $text_no; ?></label>	</div>
					<?php } else { ?>
						<div class="radio"><label><input type="radio" name="newsletter" value="1"><?php echo $text_yes; ?></label>	</div>
						<div class="radio"><label><input type="radio" name="newsletter" value="0" checked=""><?php echo $text_no; ?></label>	</div>
					<?php } ?>
				</div>
			</div>
			<?php include(DIR_TEMPLATE . 'default/template/common/template-form-actions.tpl'); ?>
		</form>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>