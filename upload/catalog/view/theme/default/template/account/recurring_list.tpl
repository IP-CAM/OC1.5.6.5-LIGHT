<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
<?php if ($profiles) { ?>
<table class="table">
	<thead>
		<tr>
			<td><?php echo $column_profile_id; ?></td>
			<td><?php echo $column_created; ?></td>
			<td><?php echo $column_status; ?></td>
			<td><?php echo $column_product; ?></td>
			<td class="text-right"><?php echo $column_action; ?></td>
		</tr>
	</thead>
	<tbody>
	<?php if ($profiles) { ?>
		<?php foreach ($profiles as $profile) { ?>
		<tr>
			<td>#<?php echo $profile['id']; ?></td>
			<td><?php echo $profile['created']; ?></td>
			<td><?php echo $status_types[$profile['status']]; ?></td>
			<td><?php echo $profile['name']; ?></td>
			<td class="text-right"><a href="<?php echo $profile['href']; ?>"><img src="catalog/view/theme/default/image/info.png" alt="<?php echo $button_view; ?>" title="<?php echo $button_view; ?>"></a></td>
		</tr>
		<?php } ?>
	<?php } else { ?>
	<tr>
		<td class="text-center" colspan="5"><?php echo $text_empty; ?></td>
	</tr>
	<?php } ?>
	</tbody>
</table>
<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="content"><?php echo $text_empty; ?></div>
<?php } ?>
<div class="well">
	<div class="text-right"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_continue; ?></a></div>
</div>
<?php echo $content_bottom; ?></div>
<?php echo $footer; ?>