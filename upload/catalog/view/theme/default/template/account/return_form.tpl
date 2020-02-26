<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $error_warning; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<div class="alert alert-warning"><?php echo $text_description; ?></div>
			<fieldset>
				<legend><?php echo $text_order; ?></legend>
				<?php include(DIR_TEMPLATE . 'default/template/common/template-edit.tpl'); ?>
				<div class="form-group">
					<label class="control-label col-sm-3" for="order_id"><b class="required">*</b> <?php echo $entry_order_id; ?></label>
					<div class="col-sm-6">
						<input type="text" name="order_id" value="<?php echo $order_id; ?>" class="form-control" id="order_id">
						<?php if ($error_order_id) { ?>
						<span class="help-block error"><?php echo $error_order_id; ?></span>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="date_ordered"><?php echo $entry_date_ordered; ?></label>
					<div class="col-sm-6">
						<label class="input-group">
							<input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" class="form-control date" id="date_ordered" data-date-today-btn="1" data-min-view="2" data-date-format="yyyy-mm-dd" autocomplete="off">
							<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
						</label>
					</div>
				</div>
			</fieldset>
			<fieldset>
				<legend><?php echo $text_product; ?></legend>
				<div class="form-group">
					<label class="control-label col-sm-3" for="product"><b class="required">*</b> <?php echo $entry_product; ?></label>
					<div class="col-sm-6">
						<input type="text" name="product" value="<?php echo $product; ?>" class="form-control" id="product">
						<?php if ($error_product) { ?>
						<span class="help-block error"><?php echo $error_product; ?></span>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="model"><b class="required">*</b> <?php echo $entry_model; ?></label>
					<div class="col-sm-6">
						<input type="text" name="model" value="<?php echo $model; ?>" class="form-control" id="model">
						<?php if ($error_model) { ?>
						<span class="help-block error"><?php echo $error_model; ?></span>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="quantity"><?php echo $entry_quantity; ?></label>
					<div class="col-sm-6">
						<input type="text" name="quantity" value="<?php echo $quantity; ?>" class="form-control" id="quantity">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><b class="required">*</b> <?php echo $entry_reason; ?></label>
					<div class="col-sm-6">
						<?php foreach ($return_reasons as $return_reason) { ?>
							<div class="radio"><label>
							<?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
								<input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" checked="">
							<?php } else { ?>
								<input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>">
							<?php	} ?>
							<?php echo $return_reason['name']; ?></label></div>
						<?php	} ?>
						<?php if ($error_reason) { ?>
						<span class="help-block error"><?php echo $error_reason; ?></span>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><?php echo $entry_opened; ?></label>
					<div class="col-sm-6">
						<?php if ($opened) { ?>
							<div class="radio"><label><input type="radio" name="opened" value="1" checked=""> <?php echo $text_yes; ?></label></div>
						<?php } else { ?>
							<div class="radio"><label><input type="radio" name="opened" value="1"> <?php echo $text_yes; ?></label></div>
						<?php } ?>
						<?php if (!$opened) { ?>
							<div class="radio"><label><input type="radio" name="opened" value="0" checked=""> <?php echo $text_no; ?></label></div>
						<?php } else { ?>
							<div class="radio"><label><input type="radio" name="opened" value="0"> <?php echo $text_no; ?></label></div>
						<?php } ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="comment"><?php echo $entry_fault_detail; ?></label>
					<div class="col-sm-6">
						<textarea name="comment" rows="4" class="form-control" id="comment"><?php echo $comment; ?></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3"><?php echo $entry_captcha; ?></label>
					<div class="col-sm-6">
						<input type="text" name="captcha" value="<?php echo $captcha; ?>" class="form-control">
						<div class="help-block">
						<img src="index.php?route=account/return/captcha" alt=""></div>
						<?php if ($error_captcha) { ?>
						<span class="help-block error"><?php echo $error_captcha; ?></span>
						<?php } ?>
					</div>
				</div>
			</fieldset>
			<?php include(DIR_TEMPLATE . 'default/template/common/template-form-actions.tpl'); ?>
		</form>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<script src="catalog/view/theme/default/js/bootstrap-datetimepicker.js"></script>
<?php echo $footer; ?>