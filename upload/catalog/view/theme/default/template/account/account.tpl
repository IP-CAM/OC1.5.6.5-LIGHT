<?php echo $header; ?>
<?php if ($success) { ?>
<div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $success; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
</div>
<div id="greeting" style="text-align: left; font-size: 14px; font-family: Verdana, Tahoma, Arial;">&nbsp;<i class="fa fa-thumbs-o-up"></i>&nbsp;<?php echo $text_greeting; ?></div>
<div class="page-header"><h1><?php echo $heading_title; ?></h1></div>
<?php echo $content_top; ?>	
		<fieldset>
			<ul>
				<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
				<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
				<li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
			</ul>
		</fieldset>
		<fieldset>
			<legend><?php echo $text_my_orders; ?></legend>
			<ul>
				<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
				<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
				<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
			</ul>
		</fieldset>
		<p>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<hr>
<?php echo $footer; ?> 