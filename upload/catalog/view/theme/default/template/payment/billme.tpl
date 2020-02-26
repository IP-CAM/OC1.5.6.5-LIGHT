<legend>Shipment By Invoice</legend>
	<h5>Important Details:</h5>
	<p>Payable within 10 days after receipt of the Merchandise.</p>
	<hr>
	<p>Bill Me Checkout</p>
</fieldset>
<button type="button" id="button-confirm" class="btn btn-primary btn-lg btn-block"><?php echo $button_confirm; ?></button>
<script>
$('#button-confirm').click(function(){
	$.ajax({
		type:'get',
		url: 'index.php?route=payment/billme/confirm',
		success:function(){
			location='<?php echo $continue; ?>';
		}		
	});
});
</script>