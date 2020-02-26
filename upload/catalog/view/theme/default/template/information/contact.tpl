<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<div class="row">
			<div class="col-sm-9">
				<form title="<?php echo $text_contact; ?>" class="form-<?php echo ($span > 6) ? 'horizontal' : 'inline'; ?>" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-sm-3" for="name"><?php echo $entry_name; ?></label>
						<div class="col-sm-8">
							<input type="text" name="name" value="<?php echo $name; ?>" id="name" class="form-control" autofocus="">
							<?php if ($error_name) { ?>
								<span class="help-block error"><?php echo $error_name; ?></span>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="email"><?php echo $entry_email; ?></label>
						<div class="col-sm-8">
							<input type="email" name="email" value="<?php echo $email; ?>" id="email" class="form-control">
							<?php if ($error_email) { ?>
								<span class="help-block error"><?php echo $error_email; ?></span>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="enquiry"><?php echo $entry_enquiry; ?></label>
						<div class="col-sm-8">
							<textarea name="enquiry" class="form-control" rows="4" id="enquiry"><?php echo $enquiry; ?></textarea>
							<?php if ($error_enquiry) { ?>
								<span class="help-block error"><?php echo $error_enquiry; ?></span>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="captcha"><?php echo $entry_captcha; ?></label>
						<div class="col-sm-8">
							<input type="text" name="captcha" value="<?php echo $captcha; ?>" id="captcha" class="form-control">
							<div class="help-block"><img src="index.php?route=information/contact/captcha" alt=""></div>
							<?php if ($error_captcha) { ?>
								<span class="help-block error"><?php echo $error_captcha; ?></span>
							<?php } ?>
						</div>
					</div>
					<div class="form-actions">
						<div class="row">
							<div class="col-sm-4 col-md-offset-4 col-lg-offset-4" style="text-align:center;">
								<button type="submit" class="btn btn-primary"><?php echo $button_continue; ?></button>
						    &nbsp;</div>
						</div>
					</div>
				</form>
			</div>
			<div class="col-sm-3">
				<div class="thumbnail">
					<?php $map = urlencode(strip_tags(html_entity_decode($address, ENT_QUOTES, 'UTF-8'))); ?>
					<a href="https://maps.google.com/maps?q=<?php echo $map; ?>" target="_blank"><img src="http://maps.googleapis.com/maps/api/staticmap?zoom=13&size=256x180&center=<?php echo $map; ?>&sensor=false" alt=""></a>
					<div class="caption">
						<h4><?php echo $text_location; ?></h4>
						<strong><?php echo $store; ?></strong><br>
						<?php echo $text_address; ?><br /><?php echo $address; ?>
						<?php if ($telephone) { ?>
							<br><?php echo $text_telephone; ?> <?php echo $telephone; ?>
						<?php } ?>
						<?php if ($fax) { ?>
							<br><?php echo $text_fax; ?> <?php echo $fax; ?>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<hr>
<?php echo $footer; ?>