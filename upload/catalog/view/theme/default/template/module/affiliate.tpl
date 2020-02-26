<div class="list-group">
	<div class="list-group-item list-group-heading"><?php echo $heading_title; ?></div>
	 <?php if (!$logged) { ?>
		<a class="list-group-item" href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
		<a class="list-group-item" href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
		<a class="list-group-item" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
	<?php } ?>
	<a class="list-group-item" href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
	<?php if ($logged) { ?>
		<a class="list-group-item" href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a>
		<a class="list-group-item" href="<?php echo $password; ?>"><?php echo $text_password; ?></a>
	<?php } ?>
	<a class="list-group-item" href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a>
	<a class="list-group-item" href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a>
	<a class="list-group-item" href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a>
	<?php if ($logged) { ?>
		<a class="list-group-item" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
	<?php } ?>
</div>