<style>.search-field{margin:0 0 8px;width:100%;max-width:220px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}</style>
	<div class="box">
	<div class="box-heading"><?php echo $heading_title; ?></div>
	<div class="box-content">
	<input type="text" id="filter_name<?php echo $module; ?>" class="search-field" value="" placeholder="<?php echo $text_search; ?>">
	<?php if ($categories){ ?>
	<select id="filter_category_id<?php echo $module; ?>" class="search-field">
	<option value="0"><?php echo $text_category; ?></option>
	<?php foreach ($categories as $category_1) { ?>
	<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
	<?php foreach ($category_1['children'] as $category_2) { ?>
	<option value="<?php echo $category_2['category_id']; ?>"><?php echo str_repeat('&nbsp;', 6) . $category_2['name']; ?></option>
	<?php foreach ($category_2['children'] as $category_3) { ?>
	<option value="<?php echo $category_3['category_id']; ?>"><?php echo str_repeat('&nbsp;', 12) . $category_3['name']; ?></option>
	<?php } ?>
	<?php } ?>
	<?php } ?>
	</select>
	<?php } ?>
	<?php if ($option){ ?>
	<div><label><input type="checkbox" id="filter_sub_category<?php echo $module; ?>" value="1"> <?php echo $text_sub_category; ?></label></div>
	<div class="order-list"><label><input type="checkbox" id="filter_description<?php echo $module; ?>" value="1"> <?php echo $text_description; ?></label></div>
	<?php } ?>
	<a class="button" id="button-search<?php echo $module; ?>"><?php echo $button_search; ?></a>
	</div>
	</div>
<script>
$('#button-search<?php echo $module; ?>').bind('click',function(){
	url = $('base').attr('href') + 'index.php?route=product/search';
	var filter_name = $('#filter_name<?php echo $module; ?>').val();
	if(filter_name){
	url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	var filter_category_id = $('#filter_category_id<?php echo $module; ?>').val();
	if(filter_category_id > 0){
	url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
	}
	if($('#filter_sub_category<?php echo $module; ?>').is(':checked')){
	url += '&filter_sub_category=true';
	}
	if($('#filter_description<?php echo $module; ?>').is(':checked')){
	url += '&filter_description=true';
	}
	location = url;
});
$('#filter_name<?php echo $module; ?>').bind('keydown',function(e){
	if(e.keyCode == 13){
	$('#button-search<?php echo $module; ?>').click();
	}
});
</script>