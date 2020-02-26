<?php echo $header; ?>
<?php if ($attention){ ?>
<div class="alert alert-warning alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $attention; ?></div>
<?php } ?>
<?php if ($success){ ?>
<div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning){ ?>
<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><?php echo $error_warning; ?></div>
<?php } ?>
<div class="row">
	<?php echo $column_left; ?>
	<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
		<div class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb){ ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<?php } ?>
		</div>
		<?php echo $content_top; ?>
		<div class="page-header"><h1><?php echo $heading_title; echo ($weight) ? '&nbsp;<small>(' . $weight . ')</small>' : ''; ?></h1></div>
		<form class="form-inline" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="hidden-xs text-center"><?php echo $column_image; ?></th>
						<th><?php echo $column_name; ?></th>
						<th class="hidden-xs"><?php echo $column_model; ?></th>
						<th class="text-right"><?php echo $column_quantity; ?></th>
						<th class="text-right hidden-xs"><?php echo $column_price; ?></th>
						<th class="text-right col-sm-2"><?php echo $column_total; ?></th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($products as $product){ ?>
					<tr>
						<td class="hidden-xs text-center"><?php if ($product['thumb']){ ?>
							<a href="<?php echo $product['href']; ?>"><img class="img-thumbnail" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"></a>
						<?php } ?></td>
						<td><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							<?php if (!$product['stock']){ ?>
								<b class="required">***</b>
							<?php } ?>
							<?php foreach ($product['option'] as $option){ ?>
								<div class="help"><?php echo $option['name']; ?>: <?php echo $option['value']; ?></div>
							<?php } ?>
							<?php if ($product['reward']){ ?>
								<div class="help"><?php echo $product['reward']; ?></div>
							<?php } ?></td>
						<td class="hidden-xs"><?php echo $product['model']; ?></td>
						<td class="text-right">
							<input type="number" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" class="form-control" min="1" autocomplete="off">
							<div class="btn-group">
								<a class="btn btn-default" onclick="$('#form').submit();"><i class="fa fa-refresh" data-toggle="tooltip" title="<?php echo $button_update; ?>"></i></a>
								<a class="btn btn-default" href="<?php echo $product['remove']; ?>"><i class="fa fa-times" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i></a>
							</div>
						</td>
						<td class="text-right hidden-xs"><?php echo $product['price']; ?></td>
						<td class="text-right"><?php echo $product['total']; ?></td>
					</tr>
					<?php } ?>
					<?php foreach ($vouchers as $vouchers){ ?>
					<tr>
						<td class="hidden-xs text-center"><i class="fa fa-gift fa-2x"></i></td>
						<td><?php echo $vouchers['description']; ?></td>
						<td class="hidden-xs"></td>
						<td class="text-right"><a class="btn btn-default" href="<?php echo $vouchers['remove']; ?>"><i class="fa fa-times" data-toggle="tooltip" title="<?php echo $button_remove; ?>"></i></a></td>
						<td class="text-right hidden-xs"><?php echo $vouchers['amount']; ?></td>
						<td class="text-right"><?php echo $vouchers['amount']; ?></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
		</form>
		<?php if ($coupon_status || $voucher_status || $reward_status || $shipping_status){ ?>
			<fieldset>
			<legend><?php echo $text_next; ?></legend>
			<p><?php echo $text_next_choice; ?></p>
			<div class="panel-group" id="next-container">
				<?php if ($coupon_status){ ?>
					<div class="panel panel-default">
						<a class="panel-heading" data-toggle="collapse" data-parent="#next-container" href="#coupon"><?php echo $text_use_coupon; ?></a>
						<div id="coupon" class="panel-collapse collapse<?php echo ($next == 'coupon' ? ' in' : ''); ?>">
							<div class="panel-body">
								<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
									<label for="next_coupon"><?php echo $entry_coupon; ?></label>
									<div class="form-group">
										<div class="col-sm-6">
											<input type="text" name="coupon" value="<?php echo $coupon; ?>" class="form-control" id="next_coupon">
										</div>
									</div>
									<input type="submit" value="<?php echo $button_coupon; ?>" class="btn btn-default">
									<input type="hidden" name="next" value="coupon">
								</form>
							</div>
						</div>
					</div>
				<?php } ?>
				<?php if ($voucher_status){ ?>
					<div class="panel panel-default">
						<a class="panel-heading" data-toggle="collapse" data-parent="#next-container" href="#voucher"><?php echo $text_use_voucher; ?></a>
						<div id="voucher" class="panel-collapse collapse<?php echo ($next == 'voucher' ? ' in' : ''); ?>">
							<div class="panel-body">
								<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
									<label for="next_voucher"><?php echo $entry_voucher; ?></label>
									<div class="form-group">
										<div class="col-sm-6">
											<input type="text" name="voucher" value="<?php echo $voucher; ?>" class="form-control" id="next_voucher">
										</div>
									</div>
									<input type="hidden" name="next" value="voucher">
									<input type="submit" value="<?php echo $button_voucher; ?>" class="btn btn-default">
								</form>
							</div>
						</div>
					</div>
				<?php } ?>
				<?php if ($reward_status){ ?>
					<div class="panel panel-default">
						<a class="panel-heading" data-toggle="collapse" data-parent="#next-container" href="#reward"><?php echo $text_use_reward; ?></a>
						<div id="reward" class="panel-collapse collapse<?php echo ($next == 'reward' ? ' in' : ''); ?>">
							<div class="panel-body">
								<form class="form-horizontal" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
									<label for="next_reward"><?php echo $entry_reward; ?></label>
									<div class="form-group">
										<div class="col-sm-6">
											<input type="text" name="reward" value="<?php echo $reward; ?>" class="form-control" id="next_reward">
										</div>
									</div>
									<input type="hidden" name="next" value="reward">
									<input type="submit" value="<?php echo $button_reward; ?>" class="btn btn-default">
								</form>
							</div>
						</div>
					</div>
				<?php } ?>
				<?php if ($shipping_status){ ?>
					<div class="panel panel-default">
						<a class="panel-heading" data-toggle="collapse" data-parent="#next-container" href="#shipping"><?php echo $text_shipping_estimate; ?></a>
						<div id="shipping" class="panel-collapse collapse<?php echo ($next == 'shipping' ? ' in' : ''); ?>">
							<div class="panel-body">
								<form class="form-horizontal" id="form-shipping">
									<h5><?php echo $text_shipping_detail; ?></h5><hr>
									<div class="form-group">
										<label class="control-label col-sm-3" for="country_id"><b class="required">*</b> <?php echo $entry_country; ?></label>
										<div class="col-sm-6">
											<select name="country_id" class="form-control" id="country_id" data-param="<?php echo htmlentities('{"zone_id":"' . $zone_id . '","select":"' . $text_select . '","none":"' . $text_none . '"}'); ?>">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($countries as $country){ ?>
											<?php if ($country['country_id'] == $country_id){ ?>
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
									<div class="form-group">
										<label class="control-label col-sm-3" for="postcode"><b id="postcode-required" class="required">*</b> <?php echo $entry_postcode; ?></label>
										<div class="col-sm-6">
											<input type="text" name="postcode" value="<?php echo $postcode; ?>" class="form-control" id="postcode">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-6 col-sm-offset-3">
											<button type="button" id="button-quote" class="btn btn-default" data-loading-text="Loading Quotes"><?php echo $button_quote; ?></button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				<?php } ?>
			</div>
			</fieldset>
		<?php } ?>
		<table class="table">
			<?php foreach ($totals as $total){ ?>
				<tr>
					<td class="text-right"><?php echo $total['title']; ?>:</td>
					<td class="text-right col-sm-2"><?php echo $total['text']; ?></td>
				</tr>
			<?php } ?>
		</table>
		<div class="form-actions">
			<div class="form-actions-inner">
				<div class="row">

					<div class="col-xs-6">
						<input class="btn btn-default" type="button" VALUE="Return to Item" ONCLICK="history.go(-1);"> &nbsp; 
						<a href="<?php echo $continue; ?>" class="hidden-xs btn btn-default"><?php echo $button_shopping; ?></a>
					</div>
					<div class="col-xs-6">
						<a href="<?php echo $checkout; ?>" class="btn btn-primary btn-block"><i class="fa fa-shopping-cart"></i> <?php echo $button_checkout; ?></a>
					</div>
				</div>
			</div>
		</div>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
</div>
<?php if ($shipping_status){ ?>
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-hidden="true">
	<form class="modal-dialog" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title"><?php echo $text_shipping_method; ?></h4>
			</div>
			<div class="modal-body">
				<table id="modal-table" class="table table-striped"></table>
				<input type="hidden" name="next" value="shipping">
			</div>
			<div class="modal-footer">
				<button type="submit" id="button-shipping" class="btn btn-primary"<?php echo (!$shipping_method) ? ' disabled=""' : ''; ?>><?php echo $button_shipping; ?></button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</form>
</div>
<script>
$(document).on('click','#button-quote',function(e){
	var $btn=$(this);
	$.ajax({
		url:'index.php?route=checkout/cart/quote',
		type:'post',
		data:$('#form-shipping').serialize(),
		dataType:'json',
		success:function(json){
			$('.help-block.error').remove();
			$('.has-error').removeClass('has-error');
			if(json['error']){
				if(json['error']['warning']){
					alertMessage('danger',json['error']['warning']);
				}
				if(json['error']['country']){
					$('select[name="country_id"]').after('<span class="help-block error">'+json['error']['country']+'</span>').closest('.form-group').addClass('has-error');
				}
				if(json['error']['zone']){
					$('select[name="zone_id"]').after('<span class="help-block error">'+json['error']['zone']+'</span>').closest('.form-group').addClass('has-error');
				}
				if(json['error']['postcode']){
					$('input[name="postcode"]').after('<span class="help-block error">'+json['error']['postcode']+'</span>').closest('.form-group').addClass('has-error');
				}					
			}
			if(json['shipping_method']){
				html='';
				for(i in json['shipping_method']){
					html+='<thead>';
					html+='<tr>';
					html+='<th colspan="2">'+json['shipping_method'][i]['title']+'</th>';
					html+='</tr>';
					html+='</thead>';
					if(!json['shipping_method'][i]['error']){
						for(j in json['shipping_method'][i]['quote']){
							html+='<tr>';
							html+='<td><label class="radio-inline">';
							html+='<input type="radio" name="shipping_method" value="'+json['shipping_method'][i]['quote'][j]['code']+'" id="'+json['shipping_method'][i]['quote'][j]['code']+'"';
							if(json['shipping_method'][i]['quote'][j]['code']=='<?php echo $shipping_method; ?>')html+=' checked=""';
							html+='>';
							html+=json['shipping_method'][i]['quote'][j]['title']+'</label></td>';
							html+='<td class="text-right">'+json['shipping_method'][i]['quote'][j]['text']+'</td>';
							html+='</tr>';
						}		
					}else{
						html+='<tr><td colspan="2"><div class="text-danger">'+json['shipping_method'][i]['error']+'</div></td></tr>';					
					}
				}
				$('#modal-table').append(html);
				$('#modal').modal('show');
				$('input[name="shipping_method"]').change(function(){
					$('#button-shipping').removeAttr('disabled');
				});
			}
		}
	});
});
</script>
<?php } ?>
<?php echo $footer; ?>