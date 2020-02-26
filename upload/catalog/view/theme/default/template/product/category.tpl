<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<?php if ($thumb || $description) { ?>
			<div class="media">
				<?php if ($thumb) { ?>
					<div class="pull-left"><img class="media-object img-thumbnail" src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>"></div>
				<?php } ?>
				<?php if ($description) { ?>
					<div class="media-body">
						<?php echo $description; ?>
					</div>
				<?php } ?>
			</div>
			<hr>
		<?php } ?>
		<?php if ($categories) { ?>
			<h4><?php echo $text_refine; ?></h4>
			<div class="row">
				<?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
				<div class="col-sm-3">
					<div class="list-group">
						<?php foreach ($categories as $category) { ?>
						<a class="list-group-item" href="<?php echo $category['href']; ?>">
						<?php if($category['image']){ ?>
							<img class="img-thumbnail" src="<?php echo $category['image']; ?>" alt="Category" width="160" height="125" /><br>
						  <?php } ?>
						<?php echo $category['name']; ?></a>
						<?php } ?>
					</div>
				</div>
				<?php } ?>
			</div>
		<?php } ?>
		<?php if ($products) { ?>
			<?php include(DIR_TEMPLATE . 'default/template/common/template-toolbar.tpl');
			if (isset($this->request->cookie['display']) && ($this->request->cookie['display'] == 'grid')) {
				$image_width = $this->config->get('config_image_product_width');
				include(DIR_TEMPLATE . 'default/template/common/template-product-grid.tpl');
			} else { 
				include(DIR_TEMPLATE . 'default/template/common/template-product-list.tpl');
			} ?>
			<div class="pagination"><?php echo str_replace('....','',$pagination); ?></div>
		<?php } else { ?>
			<div class="alert alert-warning"><?php echo $text_empty; ?></div>
			<div class="form-actions">
				<div class="form-actions-inner text-right">
					<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
				</div>
				</div>			
		<?php }?>
<hr>
		</div></div>
		<?php echo $content_bottom; ?>
		<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>