<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<?php if ($categories) { ?>
			<p><?php echo $text_index; ?>
			<?php foreach ($categories as $category) { ?>
				<a class="btn btn-primary btn-xs" href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><strong><?php echo $category['name']; ?></strong></a> 
			<?php } ?></p>
			<?php foreach ($categories as $category) { ?>
				<hr>
				<div class="row" id="<?php echo $category['name']; ?>">
					<div class="col-sm-1"><b><?php echo $category['name']; ?></b></div>
					<div class="col-sm-11">
						<?php if ($category['manufacturer']) { ?>
							<div class="row">
							<?php foreach ($category['manufacturer'] as $manufacturer) { ?>
								<div class="col-sm-3"><a href="<?php echo $manufacturer['href']; ?>">
			<!-- JTI ManufacturerLogo -->
					<?php if ($manufacturer['logo']) { ?>
					<a href="<?php echo $manufacturer['href']; ?>"><img class="img-thumbnail" src="<?php echo $manufacturer['logo']; ?>" alt="<?php echo $manufacturer['name']; ?>" class="img-rounded" /></a><br />
					<?php } ?>
					<a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a>
			<!-- JTI ManufacturerLogo end -->
								</div>
							<?php } ?>
							</div>
						<?php } ?>
					</div>
				</div>
			<?php } ?>
		<?php } else { ?>
			<div class="alert alert-warning"><?php echo $text_empty; ?></div>
			<div class="form-actions">
				<div class="form-actions-inner text-right">
					<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
				</div>
			</div>
			<?php } ?>
					<hr>	
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>