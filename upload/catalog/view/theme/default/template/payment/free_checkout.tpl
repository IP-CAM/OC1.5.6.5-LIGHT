<button type="button" id="button-confirm" class="btn btn-primary btn-lg btn-block"><?php echo $button_confirm; ?></button>
<script>
$('#button-confirm').click(function(){
	$.ajax({
		type:'get',
		url:'index.php?route=payment/free_checkout/confirm',
		success:function(){
			location='<?php echo $continue; ?>';
		}		
	});
});
</script>
