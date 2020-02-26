<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<?php if ($products) { ?>
			<?php include(DIR_TEMPLATE . 'default/template/common/template-toolbar.tpl');
			if (isset($this->request->cookie['display']) && ($this->request->cookie['display'] == 'grid')) {
				$image_width = $this->config->get('config_image_product_width');
				include(DIR_TEMPLATE . 'default/template/common/template-product-grid.tpl');
			} else { 
				include(DIR_TEMPLATE . 'default/template/common/template-product-list.tpl');
			} ?>
			<div class="pagination"><?php echo str_replace('....','',$pagination); ?></div>
		<hr>
		<?php } else { ?>
			<div class="alert alert-warning"><?php echo $text_empty; ?></div>
		<?php }?>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>