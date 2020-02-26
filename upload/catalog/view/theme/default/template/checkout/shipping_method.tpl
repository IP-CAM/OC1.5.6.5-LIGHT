<div class="panel-body">
	<form class="">
		<?php if ($error_warning) { ?>
		<div class="alert alert-error alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $error_warning; ?></div>
		<?php } ?>
		<?php if ($shipping_methods) { ?>
		<h4><?php echo $text_shipping_method; ?></h4>
		<table class="table table-striped form-inline">
			<?php foreach ($shipping_methods as $shipping_method) { ?>
				<?php if (!$shipping_method['error']) { ?>
					<?php $i = 0; ?>
					<?php foreach ($shipping_method['quote'] as $quote) { ?>
						<tr>
							<?php if (!$i) { ?>
							<td rowspan="<?php echo count($shipping_method['quote']); ?>"><?php echo $shipping_method['title']; ?></td>
							<?php } ?>
							<td><label class="radio" for="<?php echo $quote['code']; ?>">
							<?php if ($quote['code'] == $code || !$code) { ?>
								<?php $code = $quote['code']; ?>
								<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="">
							<?php } else { ?>
								<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>">
							<?php } ?>
							<?php echo $quote['title']; ?></label></td>
							<td class="text-right"><label class="radio" for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label></td>
						</tr>
						<?php $i++; ?>
					<?php } ?>
				<?php } else { ?>
					<tr>
						<td><?php echo $shipping_method['title']; ?></td>
						<td colspan="2"><span class="text-error"><?php echo $shipping_method['error']; ?></span></td>
					</tr>
				<?php } ?>
			<?php } ?>
		</table>
		<hr>
		<?php } ?>
		<h5><?php echo $text_comments; ?></h5>
		<textarea name="comment" rows="4" class="form-control"><?php echo $comment; ?></textarea>
	</form>
</div>
<div class="panel-footer text-right">
	<button type="button" id="button-shipping-method" class="btn btn-primary load-left"><?php echo $button_continue; ?></button>
</div>
<script>
$(document).on('click','#button-shipping-method',function(){
	$.ajax({
		url:'index.php?route=checkout/shipping_method/validate',
		type:'post',
		data:$('#shipping-method input[type="radio"]:checked, #shipping-method textarea'),
		dataType:'json',
		success:function(json){
			$('#notification>.alert,.help-block.error').remove();
			$('.has-error').removeClass('has-error');
			
			if(json['redirect']){
				location=json['redirect'];
			} else if(json['error']){
				$('html,body').animate({scrollTop:$('#shipping-method>.panel-collapse').offset().top-30},'slow');
				
				if(json['error']['warning']){
					alertMessage('danger',json['error']['warning']);
				}
			}else{
				$.ajax({
					url:'index.php?route=checkout/payment_method',
					dataType:'html',
					success:function(html){
						$('#payment-method .panel-collapse').html(html);
						$('#shipping-method .panel-collapse').slideUp('fast');
						$('#payment-method .panel-collapse').slideDown('fast');
						$('#shipping-method .panel-heading a,#payment-method .panel-heading a').remove();
						$('#shipping-method .panel-heading').append('<a class="close"><i class="fa fa-angle-down fa-lg"></i></a>');	
					}
				});
			}
		}
	});
});
</script>
