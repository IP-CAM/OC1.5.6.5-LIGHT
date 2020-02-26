<div class="list-group hidden-xs">
	<div class="list-group-item list-group-heading hidden-xs"><?php echo $heading_title; ?></div>
	<?php foreach ($categories as $category) { ?>
		<a class="list-group-item hidden-xs <?php echo ($category['category_id'] == $category_id) ? ' active' : ''; ?>" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?><span class="pull-right"><i class="fa fa-bars"></i></span></a>
		<?php if ($category['category_id'] == $category_id) { ?>
			<?php foreach ($category['children'] as $child) { ?>
				<?php if ($child['category_id'] == $child_id) { ?>
					<a class="list-group-item list-group-subitem active" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
				<?php } else { ?>
					<a class="list-group-item list-group-subitem" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
				<?php } ?>
			<?php } ?>
		<?php	} ?>
	<?php } ?>
</div>
