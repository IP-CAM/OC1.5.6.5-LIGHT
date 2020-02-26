<?php if ($checkout_method == 'iframe') { ?>
	<iframe src="<?php echo $iframe_url ?>" scrolling="no" width="560px" height="540px" frameBorder="0"></iframe>
<?php } else { ?>
	<a href="<?php echo $iframe_url; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_confirm; ?></a>
<?php } ?>