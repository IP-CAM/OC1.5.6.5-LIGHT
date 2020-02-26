<?php echo $header; ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span=trim($column_left) ? 9 : 12; $span=trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>
		<div id="checkout-container" class="panel-group">
			<div id="checkout" class="panel panel-default">
				<div class="panel-heading"><?php echo $text_checkout_option; ?></div>
				<div id="checkout-collapse" class="panel-collapse collapse"></div>
			</div>
			<div id="payment-address" class="panel panel-default">
				<div class="panel-heading"><span><?php echo !$logged ? $text_checkout_account : $text_checkout_payment_address; ?></span></div>
				<div class="panel-collapse collapse"></div>
			</div>
			<?php if ($shipping_required) { ?>
			<div id="shipping-address" class="panel panel-default">
				<div class="panel-heading"><?php echo $text_checkout_shipping_address; ?></div>
				<div class="panel-collapse collapse"></div>
			</div>
			<div id="shipping-method" class="panel panel-default">
				<div class="panel-heading"><?php echo $text_checkout_shipping_method; ?></div>
				<div class="panel-collapse collapse"></div>
			</div>
			<?php } ?>
			<div id="payment-method" class="panel panel-default">
				<div class="panel-heading"><?php echo $text_checkout_payment_method; ?></div>
				<div class="panel-collapse collapse"></div>
			</div>
			<div id="confirm" class="panel panel-default">
				<div class="panel-heading"><?php echo $text_checkout_confirm; ?></div>
				<div class="panel-collapse collapse"></div>
			</div>
		</div>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<script>
$('#checkout .panel-collapse input[name="account"]').live('change',function(){
	if($(this).attr('value')=='register'){
		$('#payment-address .panel-heading span').html('<?php echo $text_checkout_account; ?>');
	}else{
		$('#payment-address .panel-heading span').html('<?php echo $text_checkout_payment_address; ?>');
	}
});
<?php if (!$logged) { ?> 
$(document).ready(function(){
	<?php if (isset($quickconfirm)) { ?>
		quickConfirm();
	<?php } else { ?>
		$.ajax({
			url:'index.php?route=checkout/login',
			dataType:'html',
			success:function(html){
				$('#checkout .panel-collapse').html(html).slideDown('fast',function(){
					$(this).find('.form-control:first').select();
				});
			}
		});
	<?php } ?>
});
<?php } else { ?>
$(document).ready(function(){
	<?php if (isset($quickconfirm)) { ?>
		quickConfirm();
	<?php } else { ?>
		$.ajax({
			url:'index.php?route=checkout/payment_address',
			dataType:'html',
			success:function(html){
				$('#payment-address .panel-collapse').html(html);
				$('#payment-address .panel-collapse').slideDown('fast');
			}
		});
	<?php } ?>
});
<?php } ?>
$('#button-register').live('click',function(){
	$.ajax({
		url:'index.php?route=checkout/register/validate',
		type:'post',
		data:$('#payment-address form').serialize(),
		dataType:'json',
		success:function(json){
			$('.warning, .error').remove();
			if (json['redirect']){
				location=json['redirect'];		
			} else if (json['error']){
				$('html,body').animate({scrollTop:$('#payment-address>.panel-collapse').offset().top-30},'slow');
			
				$.each(json['error'],function(key,val){
					if(key!='warning'){
						$('#payment-address [name^="'+key+'"]').after('<span class="help-block error">'+val+'</span>').closest('.form-group').addClass('has-error');
					}else{
						alertMessage('danger',json['error']['warning']);
					}
				});																														
			}else{
				<?php if ($shipping_required) { ?>				
				var shipping_address=$('#payment-address input[name=\'shipping_address\']:checked').attr('value');
				if (shipping_address) {
					$.ajax({
						url:'index.php?route=checkout/shipping_method',
						dataType:'html',
						success:function(html){
							$('#shipping-method .panel-collapse').html(html);
							$('#payment-address .panel-collapse').slideUp('fast');
							$('#shipping-method .panel-collapse').slideDown('fast');
							$('#checkout .panel-heading a').remove();
							$('#payment-address .panel-heading a').remove();
							$('#shipping-address .panel-heading a').remove();
							$('#shipping-method .panel-heading a').remove();
							$('#payment-method .panel-heading a').remove();									
							$('#shipping-address .panel-heading').append('<a class="close" title="<?php echo $text_modify; ?>"><i class="fa fa-angle-down fa-lg"></i></a>');							
							$('#payment-address .panel-heading').append('<a class="close" title="<?php echo $text_modify; ?>"><i class="fa fa-angle-down fa-lg"></i></a>');
							$.ajax({
								url:'index.php?route=checkout/shipping_address',
								dataType:'html',
								success:function(html){
									$('#shipping-address .panel-collapse').html(html);
								}
							});
						}
					});
				}else{
					$.ajax({
						url:'index.php?route=checkout/shipping_address',
						dataType:'html',
						success:function(html){
							$('#shipping-address .panel-collapse').html(html);
							$('#payment-address .panel-collapse').slideUp('fast');
							$('#shipping-address .panel-collapse').slideDown('fast');
							$('#checkout .panel-heading a').remove();
							$('#payment-address .panel-heading a').remove();
							$('#shipping-address .panel-heading a').remove();
							$('#shipping-method .panel-heading a').remove();
							$('#payment-method .panel-heading a').remove();					
							$('#payment-address .panel-heading').append('<a class="close" title="<?php echo $text_modify; ?>"><i class="fa fa-angle-down fa-lg"></i></a>');
						}
					});	
				}
				<?php } else { ?>
				$.ajax({
					url:'index.php?route=checkout/payment_method',
					dataType:'html',
					success:function(html){
						$('#payment-method .panel-collapse').html(html);
						$('#payment-address .panel-collapse').slideUp('fast');
						$('#payment-method .panel-collapse').slideDown('fast');
						$('#checkout .panel-heading a').remove();
						$('#payment-address .panel-heading a').remove();
						$('#payment-method .panel-heading a').remove();						
						$('#payment-address .panel-heading').append('<a class="close" title="<?php echo $text_modify; ?>"><i class="fa fa-angle-down fa-lg"></i></a>');
					}
				});			
				<?php } ?>
				$.ajax({
					url:'index.php?route=checkout/payment_address',
					dataType:'html',
					success:function(html){
						$('#payment-address .panel-collapse').html(html);
						$('#payment-address .panel-heading span').html('<?php echo $text_checkout_payment_address; ?>');
					}
				});
			} 
		}
	});
});
$(document).on('click','#button-payment-address',function(e){
	$.ajax({
		url:'index.php?route=checkout/payment_address/validate',
		type:'post',
		data:$('#payment-address form').serialize(),
		dataType:'json',
		success:function(json){
			$('#notification>.alert,.help-block.error').remove();
			$('.has-error').removeClass('has-error');
			
			if(json['redirect']){
				location=json['redirect'];
			} else if(json['error']){
				$('html,body').animate({scrollTop:$('#payment-address>.panel-collapse').offset().top-30},'slow');

				$.each(json['error'],function(key,val){
					if(key!='warning'){
						$('#payment-address [name^="'+key+'"]').after('<span class="help-block error">'+val+'</span>').closest('.form-group').addClass('has-error');
					}else{
						alertMessage('danger',json['error']['warning']);
					}
				});
			}else{
				<?php if ($shipping_required) { ?>
				$.ajax({
					url:'index.php?route=checkout/shipping_address',
					dataType:'html',
					success:function(html){
						$('#shipping-address .panel-collapse').html(html);
						$('#payment-address .panel-collapse').slideUp('fast');
						$('#shipping-address .panel-collapse').slideDown('fast');
						$('#payment-address .panel-heading a,#shipping-address .panel-heading a,#shipping-method .panel-heading a,#payment-method .panel-heading a').remove();
						$('#payment-address .panel-heading').append('<a class="close"><i class="fa fa-angle-down fa-lg"></i></a>');	
					}
				});
				<?php } else { ?>
				$.ajax({
					url:'index.php?route=checkout/payment_method',
					dataType:'html',
					success:function(html){
						$('#payment-method .panel-collapse').html(html);
						$('#payment-address .panel-collapse').slideUp('fast');
						$('#payment-method .panel-collapse').slideDown('fast');
						$('#payment-address .panel-heading a,#payment-method .panel-heading a').remove();
						$('#payment-address .panel-heading').append('<a class="close"><i class="fa fa-angle-down fa-lg"></i></a>');	
					}
				});
				<?php } ?>
				
				$.ajax({
					url:'index.php?route=checkout/payment_address',
					dataType:'html',
					success:function(html){
						$('#payment-address .panel-collapse').html(html);
					}
				});
			}		
		}
	});
});
function quickConfirm(module){
	$.ajax({
		url:'index.php?route=checkout/confirm',
		dataType:'html',
		success:function(html){
			$('#confirm .panel-collapse').html(html);
			$('#confirm .panel-collapse').slideDown('fast');
			$('.panel-heading a').remove();
			$('#checkout .panel-heading a').remove();
			$('#checkout .panel-heading').append('<a class="close" title="<?php echo $text_modify; ?>"><i class="fa fa-angle-down fa-lg"></i></a>');
			$('#shipping-address .panel-heading a').remove();
			$('#shipping-address .panel-heading').append('<a class="close" title="<?php echo $text_modify; ?>"><i class="fa fa-angle-down fa-lg"></i></a>');
			$('#shipping-method .panel-heading a').remove();
			$('#shipping-method .panel-heading').append('<a class="close" title="<?php echo $text_modify; ?>"><i class="fa fa-angle-down fa-lg"></i></a>');
			$('#payment-address .panel-heading a').remove();	
			$('#payment-address .panel-heading').append('<a class="close" title="<?php echo $text_modify; ?>"><i class="fa fa-angle-down fa-lg"></i></a>');
			$('#payment-method .panel-heading a').remove();
			$('#payment-method .panel-heading').append('<a class="close" title="<?php echo $text_modify; ?>"><i class="fa fa-angle-down fa-lg"></i></a>');
		}
	});
}
</script>
<?php echo $footer; ?>