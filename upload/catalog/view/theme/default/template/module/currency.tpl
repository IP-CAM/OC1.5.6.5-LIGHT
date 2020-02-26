<?php if (count($currencies) > 1) { ?>
<div class="btn-group">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><?php echo $text_currency; ?> <span class="caret"></span></button>
		<ul class="dropdown-menu">
		<?php foreach ($currencies as $currency) { ?>
			<?php if ($currency['code'] == $currency_code) { ?>
				<li><a href="<?php echo $currency['code']; ?>"><b>(<?php echo $currency['symbol_left'] ? $currency['symbol_left'] : $currency['symbol_right']; ?>) <?php echo $currency['title']; ?></b></a></li>
			<?php } else { ?>
				<li><a href="<?php echo $currency['code']; ?>">(<?php echo $currency['symbol_left'] ? $currency['symbol_left'] : $currency['symbol_right']; ?>) <?php echo $currency['title']; ?></a></li>
			<?php } ?>
		<?php } ?>
		</ul>
		<input type="hidden" name="currency_code" value="">
		<input type="hidden" name="redirect" value="<?php echo $redirect; ?>">
	</form>
</div>
<?php } ?>
