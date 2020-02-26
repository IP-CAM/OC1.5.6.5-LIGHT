<div class="panel-body">
	<form id="form-guest" class="form-horizontal">
		<fieldset>
			<legend><?php echo $text_your_details; ?></legend>
			<div class="form-group">
				<label class="control-label col-sm-3" for="firstname"><b class="required">*</b> <?php echo $entry_firstname; ?></label>
				<div class="col-sm-6">
					<input type="text" name="firstname" value="<?php echo $firstname; ?>" class="form-control" id="firstname" autofocus="">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="lastname"><b class="required">*</b> <?php echo $entry_lastname; ?></label>
				<div class="col-sm-6">
					<input type="text" name="lastname" value="<?php echo $lastname; ?>" class="form-control" id="lastname">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="email"><b class="required">*</b> <?php echo $entry_email; ?></label>
				<div class="col-sm-6">
					<input type="text" name="email" value="<?php echo $email; ?>" class="form-control" id="email">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="telephone"><b class="required">*</b> <?php echo $entry_telephone; ?></label>
				<div class="col-sm-6">
					<input type="text" name="telephone" value="<?php echo $telephone; ?>" class="form-control" id="telephone">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="fax"><?php echo $entry_fax; ?></label>
				<div class="col-sm-6">
					<input type="text" name="fax" value="<?php echo $fax; ?>" class="form-control" id="fax">
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend><?php echo $text_your_address; ?></legend>
			<div class="form-group">
				<label class="control-label col-sm-3" for="company"><?php echo $entry_company; ?></label>
				<div class="col-sm-6">
					<input type="text" name="company" value="<?php echo $company; ?>" class="form-control" id="company">
				</div>
			</div>
			<div class="form-group" style="display:<?php echo count($customer_groups) > 1 ? 'block' : 'none'; ?>;">
				<label class="control-label col-sm-3" for="customer_group_id"><?php echo !empty($entry_account) ? $entry_account : $entry_customer_group; ?></label>
				<div class="col-sm-6">
					<select name="customer_group_id" class="form-control" id="customer_group_id">
						<?php foreach ($customer_groups as $customer_group) { ?>
						<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
						<option value="<?php echo $customer_group['customer_group_id']; ?>" selected=""><?php echo $customer_group['name']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
			</div>
			<div class="form-group" id="company-id-display">
				<label class="control-label col-sm-3" for="company_id"><b id="company-id-required" class="required">*</b> <?php echo $entry_company_id; ?></label>
				<div class="col-sm-6">
					<input type="text" name="company_id" value="<?php echo $company_id; ?>" class="form-control" id="company_id">
				</div>
			</div>
			<div class="form-group" id="tax-id-display">
				<label class="control-label col-sm-3" for="tax_id"><b id="tax-id-required" class="required">*</b> <?php echo $entry_tax_id; ?></label>
				<div class="col-sm-6">
					<input type="text" name="tax_id" value="<?php echo $tax_id; ?>" class="form-control" id="tax_id">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="address_1"><b class="required">*</b> <?php echo $entry_address_1; ?></label>
				<div class="col-sm-6">
					<input type="text" name="address_1" value="<?php echo $address_1; ?>" class="form-control" id="address_1">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="address_2"><?php echo $entry_address_2; ?></label>
				<div class="col-sm-6">
					<input type="text" name="address_2" value="<?php echo $address_2; ?>" class="form-control" id="address_2">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="city"><b class="required">*</b> <?php echo $entry_city; ?></label>
				<div class="col-sm-6">
					<input type="text" name="city" value="<?php echo $city; ?>" class="form-control" id="city">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="postcode"><b id="postcode-required" class="required">*</b> <?php echo $entry_postcode; ?></label>
				<div class="col-sm-6">
					<input type="text" name="postcode" value="<?php echo $postcode; ?>" class="form-control" id="postcode">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="country"><b class="required">*</b> <?php echo $entry_country; ?></label>
				<div class="col-sm-6">
					<select name="country_id" class="form-control" id="country" data-param="<?php echo htmlentities('{"zone_id":"' . $zone_id . '","select":"' . $text_select . '","none":"' . $text_none . '"}'); ?>">
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
				<label class="control-label col-sm-3" for="zone_id"><b class="required">*</b> <?php echo $entry_zone; ?></label>
				<div class="col-sm-6">
					<select name="zone_id" class="form-control" id="zone_id"></select>
				</div>
			</div>
			<?php if ($shipping_required) { ?>
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-3">
					<?php if ($shipping_address) { ?>
					<div class="checkbox"><label><input type="checkbox" name="shipping_address" value="1" checked=""><?php echo $entry_shipping; ?></label></div>
					<?php } else { ?>
					<div class="checkbox"><label><input type="checkbox" name="shipping_address" value="1"><?php echo $entry_shipping; ?></label></div>
					<?php } ?>
				</div>
			</div>
			<?php } ?>
		</fieldset>
	</form>
</div>
<div class="panel-footer text-right">
	<button type="button" id="button-guest" class="btn btn-primary load-left"><?php echo $button_continue; ?></button>
</div>
<script>
var customer_group=[];
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]=[];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display']=<?php echo $customer_group['company_id_display']; ?>;
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required']=<?php echo $customer_group['company_id_required']; ?>;
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display']=<?php echo $customer_group['tax_id_display']; ?>;
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required']=<?php echo $customer_group['tax_id_required']; ?>;
<?php } ?>

$('#payment-address select[name="customer_group_id"]').change();
</script>
<script>
$('#button-guest').off().on('click',function(){
	$.ajax({
		url:'index.php?route=checkout/guest/validate',
		type:'post',
		data:$('#payment-address input[type="text"],#payment-address input[type="checkbox"]:checked,#payment-address select'),
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
				var shipping_address = $('#payment-address input[name="shipping_address"]:checked').val();
				
				if(shipping_address){
					$.ajax({
						url:'index.php?route=checkout/shipping_method',
						dataType:'html',
						success:function(html){
							$('#shipping-method .panel-collapse').html(html);
							$('#payment-address .panel-collapse').slideUp('fast');
							$('#shipping-method .panel-collapse').slideDown('fast');
							$('#payment-address .panel-heading a,#shipping-address .panel-heading a,#shipping-method .panel-heading a,#payment-method .panel-heading a').remove();
							$('#payment-address .panel-heading').append('<a class="close"><i class="fa fa-chevron-left"></i></a>');	
							$('#shipping-address .panel-heading').append('<a class="close"><i class="fa fa-chevron-left"></i></a>');	
							
							$.ajax({
								url:'index.php?route=checkout/guest_shipping',
								dataType:'html',
								success:function(html){
									$('#shipping-address .panel-collapse').html(html);
								}
							});
						}
					});
				}else{
					$.ajax({
						url:'index.php?route=checkout/guest_shipping',
						dataType:'html',
						success:function(html){
							$('#shipping-address .panel-collapse').html(html);
							$('#payment-address .panel-collapse').slideUp('fast');
							$('#shipping-address .panel-collapse').slideDown(500,function(){
								$('#guest-firstname').select();
								$(this).find('select[name="country_id"]').change();
							});
							$('#payment-address .panel-heading a,#shipping-address .panel-heading a,#shipping-method .panel-heading a,#payment-method .panel-heading a').remove();
							$('#payment-address .panel-heading').append('<a class="close"><i class="fa fa-chevron-left"></i></a>');	
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
						$('#payment-address .panel-heading a,#payment-method .panel-heading a').remove();
						$('#payment-address .panel-heading').append('<a class="close"><i class="fa fa-chevron-left"></i></a>');
					}
				});	
				<?php } ?>
			}	 
		}
	});
});
</script>