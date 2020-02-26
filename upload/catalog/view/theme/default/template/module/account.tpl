<div class="list-group">
	<div class="list-group-item list-group-heading"><?php echo $heading_title; ?></div>

	<a class="list-group-item" href="<?php echo $account; ?>"><?php echo $text_account; ?></a>

	<?php if ($logged) { ?>
	<a class="list-group-item" href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a>
	<a class="list-group-item" href="<?php echo $password; ?>"><?php echo $text_password; ?></a>
	<a class="list-group-item" href="<?php echo $address; ?>"><?php echo $text_address; ?></a>
	<a class="list-group-item" href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a>
	<a class="list-group-item" href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
	<a class="list-group-item" href="<?php echo $download; ?>"><?php echo $text_download; ?></a>
	<a class="list-group-item" href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a>
	<a class="list-group-item" href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a>
	<a class="list-group-item" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
	<?php } ?>

	<?php if (!$logged) { ?>
		<a class="list-group-item" href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
		<a class="list-group-item" href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
		<a class="list-group-item" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
	<?php } ?>

	</div>