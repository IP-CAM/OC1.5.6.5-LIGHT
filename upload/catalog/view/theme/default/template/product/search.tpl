<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<form id="search-complete" title="<?php echo $text_critea; ?>">
			<div class="form-inline">
				<select name="category_id" class="form-control">
					<option value="0"><?php echo $text_category; ?></option>
					<?php foreach ($categories as $category_1) { ?>
						<option value="<?php echo $category_1['category_id']; ?>"<?php echo ($category_1['category_id'] == $category_id) ? ' selected=""' : ''; ?>><?php echo $category_1['name']; ?></option>
						<?php foreach ($category_1['children'] as $category_2) { ?>
							<option value="<?php echo $category_2['category_id']; ?>"<?php echo ($category_2['category_id'] == $category_id) ? ' selected=""' : ''; ?>><?php echo str_repeat('&nbsp;',5); echo $category_2['name']; ?></option>
							<?php foreach ($category_2['children'] as $category_3) { ?>
								<option value="<?php echo $category_3['category_id']; ?>"<?php echo ($category_3['category_id'] == $category_id) ? ' selected=""' : ''; ?>><?php echo str_repeat('&nbsp;',10); echo $category_3['name']; ?></option>
							<?php } ?>
						<?php } ?>
					<?php } ?>
				</select>
				<input type="search" name="search" value="<?php echo $search; ?>" class="form-control" placeholder="<?php echo $entry_search; ?>">
				<button type="submit" form="search-complete" class="btn btn-primary"><i class="fa fa-search"></i> <?php echo $button_search; ?></button>
			</div>
			<div class="checkbox"><label><input type="checkbox" name="sub_category" value="1"<?php echo $sub_category ? ' checked=""' : ''; ?>> <?php echo $text_sub_category; ?></label></div>
			<div class="checkbox"><label><input type="checkbox" name="description" value="1"<?php echo $description ? ' checked=""' : ''; ?>> <?php echo $entry_description; ?></label></div>
		</form>
		<?php if ($products) { ?>
			<p class="lead"><?php echo $text_search; ?></p>
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