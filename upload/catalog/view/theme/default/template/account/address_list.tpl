<?php echo $header; ?>
<?php if ($success) { ?>
<div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $error_warning; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<h4><?php echo $text_address_book; ?></h4>
		<table class="table table-striped">
			<tbody>
			<?php foreach ($addresses as $result) { ?>
				<tr>
					<td><?php echo $result['address']; ?></td>
					<td class="text-right"><a href="<?php echo $result['update']; ?>" class="btn btn-primary"><i class="fa fa-pencil-square-o"></i> <?php echo $button_edit; ?></a>
					<a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i><span class="hidden-xs"> <?php echo $button_delete; ?></span></a></td>
				</tr>
			<?php } ?>
			</tbody>
		</table>
		<div class="form-actions">
			<div class="form-actions-inner">
				<a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a>
				<a href="<?php echo $insert; ?>" class="btn btn-primary pull-right"><i class="hidden-xs icon-plus"></i> <?php echo $button_new_address; ?></a>
			</div>
		</div>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php echo $footer; ?>