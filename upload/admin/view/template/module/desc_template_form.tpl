<div class="box" id="template_container">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $text_template; ?></h1>
  </div>
  <div class="content">
	<form id="tpl_form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	  <input type="hidden" name="template_id" value="<?php echo $template_id; ?>" />
      <table class="form">
      	<tr>
          <td><span class="required">*</span> <?php echo $entry_status; ?></td>
          <td><select name="template_status">
                <?php if ($template_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_name; ?></td>
          <td><input type="text" name="template_name" value="<?php echo $template_name; ?>" size="30"/></td>
        </tr>
        <tr>
          <td><?php echo $entry_body; ?></td>
          <td><textarea id="template_body" name="template_body"><?php echo $template_body; ?></textarea></td>
        </tr>
      </table>
      
      <div class="buttons">
      	<img id="tpl_loading" src="view/image/loading.gif" style="display:none;" />
      	<span id="tpl_buttons">
      		<a id="tpl_save" class="button"><span><?php echo $button_save; ?></span></a>  
      		<a id="tpl_cancel" class="button"><span><?php echo $button_cancel; ?></span></a>
      	</span>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	delete CKEDITOR.instances['template_body'];
	
	CKEDITOR.replace('template_body', {
		filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});

	$('#tpl_save').bind('click', function() {
		$.ajax({
			url: 'index.php?route=module/desc_template/<?php echo $ajax_action; ?>&token=<?php echo $token; ?>',
			type: 'post',
			data: $('#tpl_form').serialize() + '&template_body=' + encodeURIComponent(CKEDITOR.instances.template_body.getData()),
			dataType: 'json',
			beforeSend: function(jqXHR, settings) {
				$('#tpl_loading').fadeIn();
				$('#tpl_buttons').fadeOut();
			},
			success: function(json) {
				if (json.success) {
					$('#template_container').slideUp();
					$('#template_container').remove();
					$('#templates').removeAttr('disabled');
					$('#template_buttons').fadeIn();

					if (json.tpl_id) {
						$('#templates').append('<option value="' + json.tpl_id + '">(' + (json.tpl_status ? '+' : '-') + ') ' + json.tpl_name + '</option>');
					}
				} 
				
				if (json.error) {
					alert(json.error);
				}

				$('#tpl_loading').fadeOut();
				$('#tpl_buttons').fadeIn();
			},
			error: function(xhr, ajaxOptions, thrownError) {
				$('#tpl_loading').fadeOut();
				$('#tpl_buttons').fadeIn();
				
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});

	$('#tpl_cancel').bind('click', function() {
		$('#template_container').slideUp();
		$('#template_container').remove();
		$('#templates').removeAttr('disabled');
		$('#template_buttons').fadeIn();
	});
});
</script>