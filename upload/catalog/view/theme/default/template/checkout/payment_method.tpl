<div class="panel-body">
	<form class="">
		<?php if ($error_warning){ ?>
		<div class="alert alert-error alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $error_warning; ?></div>
		<?php } ?>
		<?php if ($payment_methods) { ?>
		<h4><?php echo $text_payment_method; ?></h4>
		<?php foreach ($payment_methods as $payment_method) { ?>
			<div class="radio"><label><?php if ($payment_method['code'] == $code || !$code) { ?>
				<?php $code = $payment_method['code']; ?>
				<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="">
				<?php } else { ?>
				<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>">
				<?php } ?>
				<?php echo $payment_method['title']; ?></label></div>
			<?php } ?>
		<hr>
		<?php } ?>
		<div class="form-group">
			<h5><?php echo $text_comments; ?></h5>
			<textarea name="comment" rows="4" class="form-control"><?php echo $comment; ?></textarea>
		</div>
		<?php if ($text_agree) { ?>
		<div class="alert alert-warning">
			<label class="checkbox-inline"><input type="checkbox" name="agree" value="1"<?php echo $agree ? ' checked=""' : ''; ?>><?php echo $text_agree; ?></label>
		</div>
		<?php } ?>
	</form>
</div>
<div class="panel-footer text-right">
	<button type="button" id="button-payment-method" class="btn btn-primary load-left"><?php echo $button_continue; ?></button>
</div>
<script>
$(document).on('click','#button-payment-method',function(e){
	$.ajax({
		url:'index.php?route=checkout/payment_method/validate', 
		type:'post',
		data:$('#payment-method input[type="radio"]:checked, #payment-method input[type="checkbox"]:checked, #payment-method textarea'),
		dataType:'json',
		success:function(json){
			$('#notification>.alert,.help-block.error').remove();
			$('.has-error').removeClass('has-error');
			
			if(json['redirect']){
				location=json['redirect'];
			} else if(json['error']){
				if(json['error']['warning']){
					$('html,body').animate({scrollTop:$('#payment-method>.panel-collapse').offset().top-30},'slow');
					alertMessage('danger',json['error']['warning']);
				}
			}else{
				$.ajax({
					url:'index.php?route=checkout/confirm',
					dataType:'html',
					success:function(html){
						$('#confirm .panel-collapse').html(html);
						$('#payment-method .panel-collapse').slideUp('fast');
						$('#confirm .panel-collapse').slideDown('fast');
						$('#payment-method .panel-heading a').remove();
						$('#payment-method .panel-heading').append('<a class="close"><i class="fa fa-angle-down fa-lg"></i></a>');	
					}
				});
			}
		}
	});
});
</script>