<?php if (!isset($redirect)) { ?>
<div class="panel-body">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Image</th>
				<th><?php echo $column_name; ?></th>
				<th><?php echo $column_model; ?></th>
				<th class="text-right"><?php echo $column_quantity; ?></th>
				<th class="text-right"><?php echo $column_price; ?></th>
				<th class="text-right"><?php echo $column_total; ?></th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($products as $product) { ?>
			<tr>
			<td><a href="<?php echo $product['href']; ?>"><img class="img-thumbnail" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></td>
				<td><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
					<?php foreach ($product['option'] as $option) { ?>
					<div class="help"><?php echo $option['name']; ?>: <?php echo $option['value']; ?></div>
					<?php } ?></td>
				<td><?php echo $product['model']; ?></td>
				<td class="text-right"><?php echo $product['quantity']; ?></td>
				<td class="text-right"><?php echo $product['price']; ?></td>
				<td class="text-right"><?php echo $product['total']; ?></td>
			</tr>
			<?php } ?>
			<?php foreach ($vouchers as $voucher) { ?>
			<tr>
				<td><?php echo $voucher['description']; ?></td>
				<td colspan="2"></td>
				<td class="text-right">1</td>
				<td class="text-right"><?php echo $voucher['amount']; ?></td>
				<td class="text-right"><?php echo $voucher['amount']; ?></td>
			</tr>
			<?php } ?>
		</tbody>
		<tfoot>
			<?php foreach ($totals as $total) { ?>
			<tr>
				<td colspan="5" class="text-right"><?php echo $total['title']; ?>:</td>
				<td class="text-right"><b><?php echo $total['text']; ?></b></td>
			</tr>
			<?php } ?>
		</tfoot>
	</table>
	<div class="payment"><?php echo $payment; ?></div>
</div>
<?php } else { ?>
<script>
location='<?php echo $redirect; ?>';
</script>
<?php } ?>