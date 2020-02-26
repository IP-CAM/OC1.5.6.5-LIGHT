<?php if ($error_warning) { ?>
<div class="alert alert-danger"><?php echo $error_warning; ?></div>
<?php } ?>
<p><img src="https://cdn.klarna.com/public/images/<?php echo $iso_code_2; ?>/badges/v1/invoice/<?php echo $iso_code_2; ?>_invoice_badge_std_blue.png?width=150&eid=<?php echo $merchant ?>"></p>
<div id="payment">
	<div class="alert alert-warning"><?php echo $text_additional; ?></div>
	<div class="form-horizontal">
		<?php if (!$company) { ?>
			<?php if ($iso_code_3 == 'DEU' || $iso_code_3 == 'NLD') { ?>
			<div class="form-group">
				<label class="control-label col-sm-3"><?php echo $entry_dob; ?></label>
				<div class="col-sm-2">
					<select name="pno_day" class="form-control">
						<option value=""><?php echo $text_day; ?></option>
						<?php foreach ($days as $day) { ?>
							<option value="<?php echo $day['value']; ?>"><?php echo $day['text']; ?></option>
						<?php } ?>
					</select>
				</div>
				<div class="col-sm-2">
					<select name="pno_month" class="form-control">
						<option value=""><?php echo $text_month; ?></option>
						<?php foreach ($months as $month) { ?>
							<option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
						<?php } ?>
					</select>
				</div>
				<div class="col-sm-2">
					<select name="pno_year" class="form-control">
						<option value=""><?php echo $text_year; ?></option>
						<?php foreach ($years as $year) { ?>
							<option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
						<?php } ?>
					</select>
				</div>
			</div>
			<?php } else { ?>
			<div class="form-group">
				<label class="control-label col-sm-3" for="pno"><?php echo $entry_pno; ?></label>
				<div class="col-sm-6">
					<input type="text" name="pno" value="" class="form-control" id="pno">
				</div>
			</div>
			<?php } ?>
		<?php } else { ?>
			<div class="form-group">
				<label class="control-label col-sm-3" for="pno"><?php echo $entry_company; ?></label>
				<div class="col-sm-6">
					<input type="text" name="pno" value="" class="form-control" id="pno">
				</div>
			</div>
		<?php } ?>
		<?php if ($iso_code_3 == 'DEU' || $iso_code_3 == 'NLD') { ?>
			<div class="form-group">
				<label class="control-label col-sm-3"><?php echo $entry_gender; ?></label>
				<div class="col-sm-6">
					<label class="radio-inline"><input type="radio" name="gender" value="1"><?php echo $text_male; ?></label>
					<label class="radio-inline"><input type="radio" name="gender" value="0"><?php echo $text_female; ?></label>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="street"><?php echo $entry_street; ?></label>
				<div class="col-sm-6">
					<input type="text" name="street" value="<?php echo $street; ?>" class="form-control" id="street">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3" for="street_number"><?php echo $entry_house_no; ?></label>
				<div class="col-sm-6">
					<input type="text" name="house_no" value="<?php echo $street_number; ?>" class="form-control" id="street_number">
				</div>
			</div>
		<?php } ?>
		<?php if ($iso_code_3 == 'NLD') { ?>
			<div class="form-group">
				<label class="control-label col-sm-3" for="street_extension"><?php echo $entry_house_ext; ?></label>
				<div class="col-sm-6">
					<input type="text" name="house_ext" value="<?php echo $street_extension; ?>" class="form-control" id="street_extension">
				</div>
			</div>
		<?php } ?>
		<div class="form-group">
			<label class="control-label col-sm-3" for="phone_no"><?php echo $entry_phone_no; ?></label>
			<div class="col-sm-6">
				<input type="text" name="phone_no" value="<?php echo $phone_number; ?>" class="form-control" id="phone_no">
			</div>
		</div>
		<?php if ($iso_code_3 == 'DEU') { ?>
			<div class="form-group">
				<div class="col-sm-6 col-sm-offset-3">
					<input type="checkbox" name="deu_terms" value="1">
					Mit der �bermittlung der f�r die Abwicklung des Rechnungskaufes und einer Identit�ts - und Bonit�tspr�fung erforderlichen 
					Daten an Klarna bin ich einverstanden. Meine <a href="https://online.klarna.com/consent_de.yaws" target="_blank">Einwilligung</a> kann ich jederzeit mit Wirkung f�r die Zukunft widerrufen.
				</div>
			</div>
		<?php } ?>
	</div>
</div>
<button type="button" id="button-confirm" class="btn btn-primary btn-lg btn-block"><?php echo $button_confirm; ?></button>
<script>
$('#button-confirm').click(function(){
	$.ajax({
		url:'index.php?route=payment/klarna_invoice/send',
		type:'post',
		data:$('#payment input[type=\'text\'],#payment input[type=\'checkbox\']:checked,#payment input[type=\'radio\']:checked,#payment select'),
		dataType:'json',
		success:function(json){
			$('#notification>.alert').remove();
			if(json['error']){
				alertMessage('danger',json['error']);
			}
			if(json['redirect']){
				location=json['redirect'];
			}
		}
	});
});
</script>