<div class="panel-body">
	<div class="row">
		<div class="col-sm-6">
			<fieldset>
				<legend><?php echo $text_new_customer; ?></legend>
				<p><?php echo $text_checkout; ?></p>
				<?php if ($account == 'register') { ?>
				<label><input type="radio" name="account" value="register" checked=""> <?php echo $text_register; ?></label>
				<?php } else { ?>
				<label><input type="radio" name="account" value="register"> <?php echo $text_register; ?></label>
				<?php } ?>
				<br>
				<?php if ($guest_checkout) { ?>
					<?php if ($account == 'guest') { ?>
					<label><input type="radio" name="account" value="guest" checked=""> <?php echo $text_guest; ?></label>
					<?php } else { ?>
					<label><input type="radio" name="account" value="guest"> <?php echo $text_guest; ?></label>
					<?php } ?>
				<?php } ?>
				<br>
				<p><?php echo $text_register_account; ?></p>
				<button type="button" id="button-account" class="btn btn-primary"><?php echo $button_continue; ?></button>
			</fieldset>
		</div>
		<div class="col-sm-6">
			<form id="form-login">
				<fieldset>
					<legend><?php echo $text_returning_customer; ?></legend>
					<p><?php echo $text_i_am_returning_customer; ?></p>
					<label><?php echo $entry_email; ?></label>
					<div class="form-group">
						<input type="text" name="email" value="" class="form-control">
					</div>
					<label><?php echo $entry_password; ?></label>
					<div class="form-group">
						<input type="password" name="password" value="" class="form-control">
						<div class="help-block"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
					</div>
					<button type="button" id="button-login" class="btn btn-primary"><?php echo $button_login; ?></button>
				</fieldset>
			</form>
		</div>
	</div>
</div>
<script>
$(document).on('click','#button-account',function(){
	$.ajax({
		url:'index.php?route=checkout/'+$('input[name="account"]:checked').val(),
		dataType:'html',
		success:function(html){
			$('#notification>.alert,.help-block.error').remove();
			$('.has-error').removeClass('has-error');
			
			$('#payment-address .panel-collapse').html(html);
			$('#checkout .panel-collapse').slideUp('fast');
			$('#payment-address .panel-collapse').slideDown('fast',function(){
				$('#firstname').select();
				$(this).find('select[name="country_id"]').change();
			});
			$('.panel-heading a').remove();
			$('#checkout .panel-heading').append('<a class="close"><i class="fa fa-angle-down fa-lg"></i></a>');
		}
	});
});
$(document).on('click','#button-login',function(){
	$.ajax({
		url:'index.php?route=checkout/login/validate',
		type:'post',
		data:$('#form-login :input'),
		dataType:'json',
		success:function(json){
			$('#notification>.alert,.help-block.error').remove();
			$('.has-error').removeClass('has-error');
			
			if(json['redirect']){
				location=json['redirect'];
			} else if(json['error']){
				alertMessage('danger',json['error']['warning']);
			}
		}
	});	
});
</script>