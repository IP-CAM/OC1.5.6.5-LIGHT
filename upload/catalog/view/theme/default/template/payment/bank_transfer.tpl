<fieldset>
	<legend><?php echo $text_instruction; ?></legend>
	<h5><?php echo $text_description; ?></h5>
	<p><?php echo $bank; ?></p>
	<hr>
	<p><?php echo $text_payment; ?></p>
</fieldset>
<button type="button" id="button-confirm" class="btn btn-primary btn-lg btn-block"><?php echo $button_confirm; ?></button>
<script>
$('#button-confirm').click(function(){
	$.ajax({
		type:'get',
		url:'index.php?route=payment/bank_transfer/confirm',
		success:function(){
			location='<?php echo $continue; ?>';
		}		
	});
});
</script>
