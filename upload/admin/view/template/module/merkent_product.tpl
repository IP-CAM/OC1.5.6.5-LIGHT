<?php echo $header;?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator'];?><a href="<?php echo $breadcrumb['href'];?>"><?php echo $breadcrumb['text'];?></a>
		<?php } ?>
	</div>
	<?php if ($success) { ?>
	<div class="success"><?php echo $success;?></div>
	<?php } ?>
	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning;?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/module.png" width="22" height="22" alt="" /> <?php echo $heading_title;?></h1>
			<div class="buttons">
				<a onclick="$('#form').submit();" class="button"><?php echo $button_save;?></a><a onclick="$('#form').attr('action',$('#form').attr('action') + '&continue=1');$('#form').submit();" class="button"><?php echo $button_save_continue;?></a>
				<a href="<?php echo $cancel;?>" class="button"><?php echo $button_cancel;?></a>
			</div>
		</div>
		<div class="content">
			<form action="<?php echo $action;?>" method="post" enctype="multipart/form-data" id="form">
				<table id="module" class="list">
					<thead>
						<tr>
							<td class="left"><?php echo $entry_limit;?></td>
							<td class="left"><?php echo $entry_span;?></td>
							<td class="left"><?php echo $entry_height;?></td>
							<td class="left"><?php echo $entry_product;?></td>
							<td class="left"><?php echo $entry_description;?></td>
							<td class="left"><?php echo $entry_button;?></td>
							<td class="left"><?php echo $entry_layout;?></td>
							<td class="left"><?php echo $entry_position;?></td>
							<td class="left"><?php echo $entry_status;?></td>
							<td class="right"><?php echo $entry_sort_order;?></td>
							<td class="left"></td>
						</tr>
					</thead>
					<?php $module_row = 0;?>
					<?php foreach ($modules as $module) { ?>
					<tbody id="module-row<?php echo $module_row;?>">
						<tr>
							<td class="left"><input type="text" name="merkent_product_module[<?php echo $module_row;?>][limit]" value="<?php echo $module['limit'];?>" size="1"></td>
							<td class="left"><select name="merkent_product_module[<?php echo $module_row;?>][span]">
								<?php foreach (array(1,2,3,4,6) as $span) { ?>
								<?php if ($span == $module['span']) { ?>
								<option value="<?php echo $span;?>" selected=""><?php echo $span;?></option>
								<?php } else { ?>
								<option value="<?php echo $span;?>"><?php echo $span;?></option>
								<?php } ?>
								<?php } ?>
							</select></td>
							<td class="left"><?php if (!$module['height']) { ?>
								<input type="text" name="merkent_product_module[<?php echo $module_row;?>][height]" value="<?php echo $module['height'];?>" disabled="" size="1"><label class="checkbox"><input type="checkbox" name="merkent_product_module[<?php echo $module_row;?>][height]" value="" class="toggle" checked=""> <?php echo $text_auto;?></label>
							<?php } else { ?>
								<input type="text" name="merkent_product_module[<?php echo $module_row;?>][height]" value="<?php echo $module['height'];?>" size="1"><label class="checkbox"><input type="checkbox" name="merkent_product_module[<?php echo $module_row;?>][height]" value="" class="toggle"> <?php echo $text_auto;?></label>
							<?php } ?></td>
							<td class="left"><select name="merkent_product_module[<?php echo $module_row;?>][product_type]">
								<?php foreach ($product_types as $key => $product_type) { ?>
								<?php if ($key == $module['product_type']) { ?>
								<option value="<?php echo $key;?>" selected=""><?php echo $product_type;?></option>
								<?php } else { ?>
								<option value="<?php echo $key;?>"><?php echo $product_type;?></option>
								<?php } ?>
								<?php } ?>
							</select></td>
							<td class="left"><select name="merkent_product_module[<?php echo $module_row;?>][description]">
								<?php if ($module['description']) { ?>
								<option value="1" selected=""><?php echo $text_enabled;?></option>
								<option value="0"><?php echo $text_disabled;?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled;?></option>
								<option value="0" selected=""><?php echo $text_disabled;?></option>
								<?php } ?>
							</select>
							<?php if (isset($error_asterisk[$module_row]['description'])) { ?>
								<span style="display:inline-block;" class="error"><?php echo $error_asterisk[$module_row]['description'];?></span>
							<?php } ?></td>
							<td class="left"><select name="merkent_product_module[<?php echo $module_row;?>][button]">
								<?php if ($module['button']) { ?>
								<option value="1" selected=""><?php echo $text_enabled;?></option>
								<option value="0"><?php echo $text_disabled;?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled;?></option>
								<option value="0" selected=""><?php echo $text_disabled;?></option>
								<?php } ?>
							</select>
							<?php if (isset($error_asterisk[$module_row]['button'])) { ?>
								<span style="display:inline-block;" class="error"><?php echo $error_asterisk[$module_row]['button'];?></span>
							<?php } ?></td>
							<td class="left"><select name="merkent_product_module[<?php echo $module_row;?>][layout_id]" class="span2">
								<?php foreach ($layouts as $layout) { ?>
								<?php if ($layout['layout_id'] == $module['layout_id']) { ?>
								<option value="<?php echo $layout['layout_id'];?>" selected=""><?php echo $layout['name'];?></option>
								<?php } else { ?>
								<option value="<?php echo $layout['layout_id'];?>"><?php echo $layout['name'];?></option>
								<?php } ?>
								<?php } ?>
							</select></td>
							<td class="left"><select name="merkent_product_module[<?php echo $module_row;?>][position]">
								<option value="content_top"<?php echo ($module['position'] == 'content_top') ? ' selected=""' : '';?>><?php echo $text_content_top;?></option>
								<option value="content_bottom"<?php echo ($module['position'] == 'content_bottom') ? ' selected=""' : '';?>><?php echo $text_content_bottom;?></option>
								<option value="column_left"<?php echo ($module['position'] == 'column_left') ? ' selected=""' : '';?>><?php echo $text_column_left;?></option>
								<option value="column_right"<?php echo ($module['position'] == 'column_right') ? ' selected=""' : '';?>><?php echo $text_column_right;?></option>
							</select></td>
							<td class="left"><select name="merkent_product_module[<?php echo $module_row;?>][status]">
								<?php if ($module['status']) { ?>
								<option value="1" selected=""><?php echo $text_enabled;?></option>
								<option value="0"><?php echo $text_disabled;?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled;?></option>
								<option value="0" selected=""><?php echo $text_disabled;?></option>
								<?php } ?>
							</select></td>
							<td class="center"><input type="text" name="merkent_product_module[<?php echo $module_row;?>][sort_order]" value="<?php echo $module['sort_order'];?>" size="3"></td>
							<td class="center"><a onclick="$('#module-row<?php echo $module_row;?>').remove();" class="reds-btn2"><?php echo $button_remove;?></a></td>
						</tr>
					</tbody>
					<?php $module_row++;?>
					<?php } ?>
					<tfoot>
						<tr>
							<td colspan="10"></td>
							<td class="center"><a onclick="addModule();" class="reds-btn2"><?php echo $button_add_module;?></a></td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
</div>
<script>
$('.toggle').live('click',function(){
	var obj = $(this).parent().prev();
	
	if ($(this).is(':checked')){
      $(obj).attr('disabled',true).val('');
	}else{
      $(obj).attr('disabled',false).select();
	}
});
</script>
<script>
var module_row = <?php echo $module_row;?>;

function addModule(){
	html	= '<tbody id="module-row' + module_row + '">';
	html += '<tr>';
	html += '<td class="left"><input type="text" name="merkent_product_module[' + module_row + '][limit]" value="6" size="1"></td>';
	html += '<td class="left"><select name="merkent_product_module[' + module_row + '][span]">';
	<?php foreach (array(1,2,3,4,6) as $span) { ?>
	html += '<option value="<?php echo $span;?>"<?php echo $span == 2 ? ' selected=""' : '';?>><?php echo $span;?></option>';
	<?php } ?>
	html += '</select></td>';
	html += '<td class="left"><input type="text" name="merkent_product_module[' + module_row + '][height]" value="150" size="1"><label class="checkbox"><input type="checkbox" name="merkent_product_module[' + module_row + '][height]" value="" class="toggle"> <?php echo $text_auto;?></label></td>';
	html += '<td class="left"><select name="merkent_product_module[' + module_row + '][product_type]">';
	<?php foreach ($product_types as $key => $product_type) { ?>
	html += '<option value="<?php echo $key;?>"><?php echo addslashes($product_type);?></option>';
	<?php } ?>
	html += '</select></td>';
	html += '<td class="left"><select name="merkent_product_module[' + module_row + '][description]">';
	html += '<option value="1" selected=""><?php echo $text_enabled;?></option>';
	html += '<option value="0"><?php echo $text_disabled;?></option>';
	html += '</select></td>';
	html += '<td class="left"><select name="merkent_product_module[' + module_row + '][button]">';
	html += '<option value="1" selected=""><?php echo $text_enabled;?></option>';
	html += '<option value="0"><?php echo $text_disabled;?></option>';
	html += '</select></td>';
	html += '<td class="left"><select name="merkent_product_module[' + module_row + '][layout_id]" class="span2">';
	<?php foreach ($layouts as $layout) { ?>
	html += '<option value="<?php echo $layout['layout_id'];?>"><?php echo addslashes($layout['name']);?></option>';
	<?php } ?>
	html += '</select></td>';
	html += '<td class="left"><select name="merkent_product_module[' + module_row + '][position]">';
	html += '<option value="content_top"><?php echo $text_content_top;?></option>';
	html += '<option value="content_bottom"><?php echo $text_content_bottom;?></option>';
	html += '<option value="column_left"><?php echo $text_column_left;?></option>';
	html += '<option value="column_right"><?php echo $text_column_right;?></option>';
	html += '</select></td>';
	html += '<td class="left"><select name="merkent_product_module[' + module_row + '][status]">';
	html += '<option value="1" selected=""><?php echo $text_enabled;?></option>';
	html += '<option value="0"><?php echo $text_disabled;?></option>';
	html += '</select></td>';
	html += '<td class="right"><input type="text" name="merkent_product_module[' + module_row + '][sort_order]" value="" size="3"></td>';
	html += '<td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="reds-btn2"><?php echo $button_remove;?></a></td>';
	html += '</tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	$('#module-row' + module_row + ' input[type=text]:first').select();
	
	module_row++;
}
</script>
<?php echo $footer;?>