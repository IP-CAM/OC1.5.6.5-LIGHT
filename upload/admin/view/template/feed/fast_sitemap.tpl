<?php echo $header; ?>

	<div id="content">
	<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
	</div>

	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

	<div class="box">
	<div class="heading">
	<h1><img src="view/image/feed.png" alt="" /> <?php echo $heading_title; ?></h1>
	<div class="buttons">
	<a class="info"></a>
	<a id="clear_cache" class="button"><?php echo $bt_clear_cache; ?></a>
	<a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
	<a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
	</div>
	</div>

	<div class="content">
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	<table class="form">
	<tr>
	<td><?php echo $entry_status; ?></td>
	<td><select name="fast_sitemap_status">
	<?php if ($fast_sitemap_status) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
	</select></td>
	</tr>
	<tr>
	<td><?php echo $entry_cache_status; ?></td>
	<td><select name="f_s_cache_status">
	<?php if ($f_s_cache_status) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
	</select></td>
	</tr>
	<tr>
	<td><?php echo $entry_data_feed; ?></td>
	<td><textarea cols="40" rows="5"><?php echo $data_feed; ?></textarea></td>
	</tr>
	</table>
	</form>
	</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){  
	$('#clear_cache').click(function() {
	$.ajax({
	url: '<?php echo str_replace('&amp;', '&', $clear_cache); ?>',
	dataType: 'json',
	success: function(data){
	if (data.success) {
	$('.info').html(data.success);
	}
	}
	});
	});
	});
</script>
<?php echo $footer; ?>