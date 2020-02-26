<?php echo $header; ?>
<script type="text/javascript">function printDiv(a){var b=document.getElementById(a).innerHTML,c=document.body.innerHTML;document.body.innerHTML=b,window.print(),document.body.innerHTML=c}</script>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
	<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
<div id="print">
	<div class="row">
			<div class="col-sm-12 col-md-4">
				<fieldset class="spacer">
					<h4><?php echo $text_order_detail; ?></h4>
					<?php if ($invoice_no) { ?>
						<b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br>
					<?php } ?>
					<b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br>
					<b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?><br>
					<?php if ($payment_method) { ?>
						<b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br>
					<?php } ?>
					<?php if ($shipping_method) { ?>
						<b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
					<?php } ?>
				</fieldset>
			</div>
			<div class="col-sm-6 col-md-4">
				<fieldset class="spacer">
					<h4><?php echo $text_payment_address; ?></h4>
					<?php echo $payment_address; ?>
				</fieldset>
			</div>
			<?php if ($shipping_address) { ?>
				<div class="col-sm-6 col-md-4">
					<fieldset class="spacer">
						<h4><?php echo $text_shipping_address; ?></h4>
						<?php echo $shipping_address; ?>
					</fieldset>
				</div>
			<?php } ?>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr class="active">
				<th class="col-sm-1" style="text-align:center;"><?php echo $column_image; ?></th>
				<th class="col-sm-3"><?php echo $column_name; ?></th>
					<?php if ($products) { ?>
					<th class="hidden-xs"><?php echo $column_model; ?></th>
					<?php } ?>
					<th class="text-right"><?php echo $column_quantity; ?></th>
					<th class="hidden-xs text-right"><?php echo $column_price; ?></th>
					<th class="text-right"><?php echo $column_total; ?></th>
					<th class="col-sm-1 hidden-xs"></th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($products as $product) { ?>
					<tr>
						<td class="center"><a href="<?php echo $product['href']; ?>"><img width="60" height="45" style="margin:2px;" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></td>
						<td><?php echo $product['name']; ?>
						<?php foreach ($product['option'] as $option) { ?>
							<div class="help"><?php echo $option['name']; ?>: <?php echo $option['value']; ?></div>
						<?php } ?></td>
						<td class="hidden-xs"><?php echo $product['model']; ?></td>
						<td class="text-right"><?php echo $product['quantity']; ?></td>
						<td class="hidden-xs text-right"><?php echo $product['price']; ?></td>
						<td class="text-right"><?php echo $product['total']; ?></td>
						<td class="text-center hidden-xs"><a class="btn btn-warning btn-sm" href="<?php echo $product['return']; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>"><i class="fa fa-reply fa-lg"></i></a></td>
					</tr>
				<?php } ?>
				<?php foreach ($vouchers as $voucher) { ?>
					<tr>
						<td><?php echo $voucher['description']; ?></td>
						<?php if ($products) { ?>
						<td class="hidden-xs"></td>
						<?php } ?>
						<td class="text-right">1</td>
						<td class="hidden-xs text-right"><?php echo $voucher['amount']; ?></td>
						<td class="text-right"><?php echo $voucher['amount']; ?></td>
						<td class="hidden-xs"></td>
					</tr>
				<?php } ?>
			</tbody>
			<tfoot>
				<?php foreach ($totals as $total) { ?>
					<tr>
						<td class="hidden-xs"></td>
						<?php if ($products) { ?>
						<td class="hidden-xs"></td>
						<?php } ?>
						<td colspan="3" class="text-right"><?php echo $total['title']; ?>:</td>
						<td class="text-right"><strong><?php echo $total['text']; ?></strong></td>
						<td class="hidden-xs"></td>
					</tr>
				<?php } ?>
			</tfoot>
		</table>
		<?php if ($comment) { ?>
			<fieldset>
				<h4><?php echo $text_comment; ?></h4>
				<?php echo $comment; ?>
			</fieldset>
		<?php } ?>
		</div>
	<hr>
		<?php if ($histories) { ?>
			<fieldset>
				<h4><?php echo $text_history; ?></h4>
				<?php foreach ($histories as $history) { ?>
					<ul class="unstyled">
						<li><b><?php echo $column_date_added; ?>:</b> <?php echo $history['date_added']; ?></li>
						<li><b><?php echo $column_status; ?>:</b> <?php echo $history['status']; ?></li>
						<?php if ($history['comment']) { ?>
							<li><b><?php echo $column_comment; ?>:</b> <?php echo $history['comment']; ?></li>
						<?php } ?>
					</ul>
				<hr>
				<?php } ?>
			</fieldset>
		<?php } ?>
		<div class="form-actions">
			<div class="form-actions-inner text-right">
				<input class="btn btn-default" type="button" VALUE="Return to Last Page" ONCLICK="history.go(-1);"> 
				<a href="javascript:printDiv('print');" class="btn btn-primary" />Print</a> 
				<a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
			</div>
	</div>
		<?php echo $content_bottom; ?>
		</div>
	<?php echo $column_right; ?>
</div>
	<hr>
<?php echo $footer; ?> 