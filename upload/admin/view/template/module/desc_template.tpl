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
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a> <a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_status; ?></td>
          <td><select name="desc_template_status">
                <?php if ($desc_template_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_templates; ?></td>
          <td><select name="templates" id="templates" style="width:250px">
          		<option value=""></option>
                <?php foreach ($templates as $tpl) : ?>
                <option value="<?php echo $tpl['id']; ?>"><?php echo sprintf('(%s) %s', $tpl['status'] ? '+' : '-', $tpl['name']); ?></option>
                <?php endforeach; ?>
              </select> 
              <img id="loading" src="view/image/loading.gif" style="display:none;" />
              <span id="template_buttons"> 
              <a id="create" title="<?php echo $button_add; ?>"><img src="view/image/add.png" /></a> 
              <a id="edit" title="<?php echo $button_edit; ?>"><img src="view/image/filemanager/edit-rename.png" /></a> 
              <a id="delete" title="<?php echo $button_delete; ?>"><img src="view/image/delete.png" /></a></span> </td>
        </tr>
      </table>
    </form>
    <div id="template_form"></div>
  </div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() { 
$('#create').bind('click', function() {
	$.ajax({
		url: 'index.php?route=module/desc_template/create&token=<?php echo $token; ?>',
		type: 'get',
		dataType: 'json',
		beforeSend: function(jqXHR, settings) {
			$('#loading').fadeIn();
			$('#templates').attr('disabled', 'disabled');
			$('#template_buttons').fadeOut();
			$('#template_form').slideUp();
			$('#templaye_form').html();
		},
		success: function(json) {
			if (json.success) {
				$('#template_form').html(json.form_data);
				$('#template_form').slideDown();
			} 
			
			if (json.error) {
				$('#templates').removeAttr('disabled');
				$('#template_buttons').fadeIn();
				alert(json.error);
			}

			$('#loading').fadeOut();
		},
		error: function(xhr, ajaxOptions, thrownError) {
			$('#loading').fadeOut();
			$('#templates').removeAttr('disabled');
			$('#template_buttons').fadeIn();
			
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$('#edit').bind('click', function() {
	$.ajax({
		url: 'index.php?route=module/desc_template/edit&token=<?php echo $token; ?>',
		type: 'get',
		data: 'template_id=' + $('#templates').val(),
		dataType: 'json',
		beforeSend: function(jqXHR, settings) {
			$('#loading').fadeIn();
			$('#templates').attr('disabled', 'disabled');
			$('#template_buttons').fadeOut();
			$('#template_form').slideUp();
			$('#template_form').html();
		},
		success: function(json) {
			if (json.success) {
				$('#template_form').html(json.form_data);
				$('#template_form').slideDown();
			} 
			
			if (json.error) {
				$('#templates').removeAttr('disabled');
				$('#template_buttons').fadeIn();
				alert(json.error);
			}

			$('#loading').fadeOut();
		},
		error: function(xhr, ajaxOptions, thrownError) {
			$('#loading').fadeOut();
			$('#templates').removeAttr('disabled');
			$('#template_buttons').fadeIn();
			
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
$('#delete').bind('click', function() {
	if (!confirm('<?php echo $text_confirm_delete; ?>')) {
		return false;
	}
	
	$.ajax({
		url: 'index.php?route=module/desc_template/remove&token=<?php echo $token; ?>',
		type: 'get',
		data: 'template_id=' + $('#templates').val(),
		dataType: 'json',
		beforeSend: function(jqXHR, settings) {
			$('#loading').fadeIn();
			$('#templates').attr('disabled', 'disabled');
			$('#template_buttons').fadeOut();
			$('#template_form').slideUp();
			$('#template_form').html();
		},
		success: function(json) {
			if (json.success) {
				$('#templates option[value="' + $('#templates').val() + '"]').remove();
			} 
			
			if (json.error) {
				alert(json.error);
			}

			$('#loading').fadeOut();
			$('#templates').removeAttr('disabled');
			$('#template_buttons').fadeIn();
			$('#template_form').html();
		},
		error: function(xhr, ajaxOptions, thrownError) {
			$('#loading').fadeOut();
			$('#templates').removeAttr('disabled');
			$('#template_buttons').fadeIn();
			$('#template_form').html();
			
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
});
//--></script>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<?php echo $footer; ?>