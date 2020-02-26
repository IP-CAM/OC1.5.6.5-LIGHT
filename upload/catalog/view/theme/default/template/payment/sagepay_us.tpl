<fieldset>
	<legend><?php echo $text_credit_card; ?></legend>
	<div class="form-horizontal" id="payment">
		<div class="form-group">
			<label class="control-label col-sm-3" for="cc_owner"><?php echo $entry_cc_owner; ?></label>
			<div class="col-sm-6">
				<input type="text" name="cc_owner" value="" class="form-control" id="cc_owner">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="cc_number"><?php echo $entry_cc_number; ?></label>
			<div class="col-sm-6">
				<input type="text" name="cc_number" value="" class="form-control" id="cc_number">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="cc_expire_date_month"><?php echo $entry_cc_expire_date; ?></label>
			<div class="col-sm-3">
				<select name="cc_expire_date_month" class="form-control" id="cc_expire_date_month">
					<?php foreach ($months as $month) { ?>
					<option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
					<?php } ?>
				</select>
			</div>
			<div class="col-sm-3">
				<select name="cc_expire_date_year" class="form-control">
					<?php foreach ($year_expire as $year) { ?>
					<option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="cc_cvv2"><?php echo $entry_cc_cvv2; ?></label>
			<div class="col-sm-6">
				<input type="text" name="cc_cvv2" value="" class="form-control" id="cc_cvv2">
			</div>
		</div>
	</div>
</fieldset>
<button type="button" id="button-confirm" class="btn btn-primary btn-lg btn-block"><?php echo $button_confirm; ?></button>
<script>
$('#button-confirm').click(function(){
	$.ajax({
		url:'index.php?route=payment/sagepay_us/send',
		type:'post',
		data:$('#payment :input'),
		dataType:'json',		
		beforeSend:function(){
			$('#button-confirm').prop('disabled',true);
			$('#payment').before('<div class="alert alert-warning"><i class="icon-loading"></i> <?php echo $text_wait; ?></div>');
		},
		complete:function(){
			$('#button-confirm').prop('disabled',false);
			$('.alert').remove();
		},	
		success:function(json){
			if(json['error']){
				alert(json['error']);
			}
			if(json['success']){
				location=json['success'];
			}
		}
	});
});
</script>