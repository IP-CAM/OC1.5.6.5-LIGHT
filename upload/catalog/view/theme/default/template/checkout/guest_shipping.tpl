<div class="panel-body">
	<form class="form-horizontal">
		<div class="form-group">
			<label class="control-label col-sm-3" for="guest-firstname"><b class="required">*</b> <?php echo $entry_firstname; ?></label>
			<div class="col-sm-6">
				<input type="text" name="firstname" value="<?php echo $firstname; ?>" class="form-control" id="guest-firstname">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="guest-lastname"><b class="required">*</b> <?php echo $entry_lastname; ?></label>
			<div class="col-sm-6">
				<input type="text" name="lastname" value="<?php echo $lastname; ?>" class="form-control" id="guest-lastname">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="guest-company"><?php echo $entry_company; ?></label>
			<div class="col-sm-6">
				<input type="text" name="company" value="<?php echo $company; ?>" class="form-control" id="guest-company">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="guest-address_1"><b class="required">*</b> <?php echo $entry_address_1; ?></label>
			<div class="col-sm-6">
				<input type="text" name="address_1" value="<?php echo $address_1; ?>" class="form-control" id="guest-address_1">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="guest-address_2"><?php echo $entry_address_2; ?></label>
			<div class="col-sm-6">
				<input type="text" name="address_2" value="<?php echo $address_2; ?>" class="form-control" id="guest-address_2">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="guest-city"><b class="required">*</b> <?php echo $entry_city; ?></label>
			<div class="col-sm-6">
				<input type="text" name="city" value="<?php echo $city; ?>" class="form-control" id="guest-city">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="guest-postcode"><b id="postcode-required" class="required">*</b> <?php echo $entry_postcode; ?></label>
			<div class="col-sm-6">
				<input type="text" name="postcode" value="<?php echo $postcode; ?>" class="form-control" id="guest-postcode">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="guest-country_id"><b class="required">*</b> <?php echo $entry_country; ?></label>
			<div class="col-sm-6">
				<select name="country_id" class="form-control" id="guest-country_id" data-param="<?php echo htmlentities('{"zone_id":"' . $zone_id . '","select":"' . $text_select . '","none":"' . $text_none . '"}'); ?>">
					<option value=""><?php echo $text_select; ?></option>
					<?php foreach ($countries as $country) { ?>
					<?php if ($country['country_id'] == $country_id) { ?>
					<option value="<?php echo $country['country_id']; ?>" selected=""><?php echo $country['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
					<?php } ?>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="guest-zone_id"><b class="required">*</b> <?php echo $entry_zone; ?></label>
			<div class="col-sm-6">
				<select name="zone_id" class="form-control" id="guest-zone_id"></select>
			</div>
		</div>
	</form>
</div>
<div class="panel-footer text-right">
	<button type="button" id="button-guest-shipping" class="btn btn-primary load-left"><?php echo $button_continue; ?></button>
</div>
<script>
$(document).on('click','#button-guest-shipping',function(e){
	$.ajax({
		url:'index.php?route=checkout/guest_shipping/validate',
		type:'post',
		data:$('#shipping-address input[type="text"], #shipping-address select'),
		dataType:'json',
		success:function(json){
			$('#notification>.alert,.help-block.error').remove();
			$('.has-error').removeClass('has-error');
			
			if(json['redirect']){
				location=json['redirect'];
			} else if(json['error']){
				$('html,body').animate({scrollTop:$('#shipping-address>.panel-collapse').offset().top-30},'slow');

				$.each(json['error'],function(key,val){
					if(key!='warning'){
						$('#shipping-address [name^="'+key+'"]').after('<span class="help-block error">'+val+'</span>').closest('.form-group').addClass('has-error');
					}else{
						alertMessage('danger',json['error']['warning']);
					}
				});
			}else{
				$.ajax({
					url:'index.php?route=checkout/shipping_method',
					dataType:'html',
					success:function(html){
						$('#shipping-method .panel-collapse').html(html);
						$('#shipping-address .panel-collapse').slideUp('fast');
						$('#shipping-method .panel-collapse').slideDown('fast');
						$('#shipping-address .panel-heading a,#shipping-method .panel-heading a,#payment-method .panel-heading a').remove();
						$('#shipping-address .panel-heading').append('<a class="close"><i class="fa fa-angle-down fa-lg"></i></a>');
					}
				});	
			}	 
		}
	});
});
</script>