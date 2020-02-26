<fieldset>
	<legend><?php echo $text_credit_card; ?></legend>
	<div class="form-horizontal" id="payment">
		<div class="form-group">
			<label class="control-label col-sm-3" for="cc_type"><?php echo $entry_cc_type; ?></label>
			<div class="col-sm-6">
				<select name="cc_type" class="form-control" id="cc_type">
					<?php foreach ($cards as $card) { ?>
					<option value="<?php echo $card['value']; ?>"><?php echo $card['text']; ?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="cc_number"><?php echo $entry_cc_number; ?></label>
			<div class="col-sm-6">
				<input type="text" name="cc_number" value="" class="form-control" id="cc_number">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3" for="cc_start_date_month"><?php echo $entry_cc_start_date; ?></label>
			<div class="col-sm-3">
				<select name="cc_start_date_month" class="form-control" id="cc_start_date_month">
					<?php foreach ($months as $month) { ?>
					<option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
					<?php } ?>
				</select>
				<div class="help-block"><?php echo $text_start_date; ?></div>
			</div>
			<div class="col-sm-3">
				<select name="cc_start_date_year" class="form-control">
					<?php foreach ($year_valid as $year) { ?>
					<option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
					<?php } ?>
				</select>
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
		<div class="form-group">
			<label class="control-label col-sm-3" for="cc_issue"><?php echo $entry_cc_issue; ?></label>
			<div class="col-sm-6">
				<input type="text" name="cc_issue" value="" class="form-control" id="cc_issue">
				<div class="help-block"><?php echo $text_issue; ?></div>
			</div>
		</div>
	</div>
</fieldset>
<button type="button" id="button-confirm" class="btn btn-primary btn-lg btn-block"><?php echo $button_confirm; ?></button>
<script>
$('#button-confirm').click(function(){
	$.ajax({
		url:'index.php?route=payment/pp_pro_uk/send',
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
