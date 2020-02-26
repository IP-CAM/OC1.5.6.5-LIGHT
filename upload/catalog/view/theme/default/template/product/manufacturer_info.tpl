<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
</div>
<div class="page-header"><h2><?php if($logo){ ?>
<img class="img-rounded" src="<?php echo $logo; ?>" alt="test"  style="vertical-align:middle; margin-right:10px" /><?php } ?><?php echo $heading_title; ?></h2>
<?php echo $content_top; ?>

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
			<div class="form-actions">
				<div class="form-actions-inner text-right">
					<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
				</div>
			</div>
		<?php }?>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>	</div>
<?php echo $footer; ?>