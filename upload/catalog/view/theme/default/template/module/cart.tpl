<div class="btn-group" title="<?php echo $heading_title; ?>">
	<a class="btn btn-info" href="<?php echo $cart; ?>"><i class="fa fa-shopping-cart fa-lg fa-fw"></i> <span id="cart-total" class="hidden-xs"><?php echo $text_items; ?></span></a>
	<a class="btn btn-info dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>
	<ul id="cart" class="dropdown-menu dropdown-menu-right">
		<?php if ($vouchers || $products) { ?>
			<?php foreach ($products as $product) { ?>
				<li class="media-cart">
				<div class="media">
					<?php if ($product['thumb']) { ?>
						<a class="pull-left" href="<?php echo $product['href']; ?>">
							<img class="img-thumbnail media-object" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>">
						</a>
					<?php } ?>
					<div class="media-body">
						<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
						<?php foreach ($product['option'] as $option) { ?>
							<div class="help"><?php echo $option['name']; ?> <?php echo $option['value']; ?></div>
						<?php } ?>
						<div class="help"><?php echo $product['quantity']; ?>&nbsp;x&nbsp;<?php echo $product['total']; ?></div>
					</div>
				</div>
				</li>
			<?php } ?>
			<?php if ($vouchers) { ?>
				<li class="divider"></li>
				<?php foreach ($vouchers as $voucher) { ?>
					<li class="media-cart"><?php echo $voucher['description']; ?>
						<div class="help">1&nbsp;x&nbsp;<?php echo $voucher['amount']; ?></div>
					</li>
				<?php } ?>
			<?php } ?>
			<li class="divider"></li>
			<?php foreach ($totals as $total) { ?>
				<li class="media-cart"><b class="pull-right"><?php echo $total['text']; ?></b><?php echo $total['title']; ?>:</li>
			<?php } ?>
			<li class="divider"></li>
			<li class="media-cart">
				<div class="btn-group btn-group-justified">
					<div class="btn-group">
						<button type="button" onclick="location='<?php echo $cart; ?>'" class="btn btn-default"><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></button>
					</div>
					<div class="btn-group">
						<button type="button" onclick="location='<?php echo $checkout; ?>'" class="btn btn-default"><?php echo $text_checkout; ?></button>
					</div>
				</div>
			</li>
		<?php } else { ?>
			<li class="media-cart"><span class="text-muted"><?php echo $text_empty; ?></span></li>
		<?php } ?>
	</ul>
</div>
