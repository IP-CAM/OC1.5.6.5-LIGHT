<?php echo $header;
if(empty($cookie_text_colour)) $cookie_text_colour	="FFFFFF";
if(empty($accept_text_colour)) $accept_text_colour	="FFFFFF";
if(empty($accept_text_hover)) $accept_text_hover	="FFFFFF";
if(empty($accept_button_colour)) $accept_button_colour	="2ABFF2";
if(empty($accept_button_hover)) $accept_button_hover	="333333";
if(empty($cookie_background_colour)) $cookie_background_colour  ="333333";
if(empty($cookie_url)) $cookie_url	="index.php?route=information/information&information_id=3";
?>
<style type="text/css">
.customhelp { colour: #666; font-size:0.9em; }
</style>

<div id="content">
	<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) {
	echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
</div>

<?php if ($success) { ?>
	<div class="success"><?php echo $success; ?></div>
	<?php } 
	if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>

<div class="box">
	<div class="heading">
	<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
	<div class="buttons">
	<a onclick="$('#form').attr('action', '<?php echo $action; ?>&continue=1');$('#form').submit();" class="button"><?php echo $button_apply; ?></a>
	<a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
	<a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
	</div>
</div>

<div class="content">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	<div style="margin: 10px">
	<label><?php echo $entry_status; ?></label> 
	<select name="cookiepolicy_status">
	<?php if ($cookiepolicy_status) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
	</select>
	</div>

	<div id="settings_tabs" class="htabs clearfix">
	<a href="#tab_settings"><?php echo $tab_settings; ?></a>
	</div>

	<div id="tab_settings" class="divtab">
	<table class="form">
	<tr>
	<td><?php echo $entry_position; ?></td>
	<td colspan="2">
	<select name="cookiepolicy_position">
	<?php switch ($cookiepolicy_position) { 
	case "1": ?>
	<option value="1" selected="selected"><?php echo $text_bottom; ?></option>
	<option value="2"><?php echo $text_top; ?></option>
	<option value="3"><?php echo $text_fullscreen; ?></option>
	<?php break;
	case "2": ?>
	<option value="1"><?php echo $text_bottom; ?></option>
	<option value="2" selected="selected"><?php echo $text_top; ?></option>
	<option value="3"><?php echo $text_fullscreen; ?></option>
	<?php break;
	case "3": ?>
	<option value="1"><?php echo $text_bottom; ?></option>
	<option value="2"><?php echo $text_top; ?></option>
	<option value="3" selected="selected"><?php echo $text_fullscreen; ?></option>
	<?php break;
	default: ?>
	<option value="1" selected="selected"><?php echo $text_bottom; ?></option>
	<option value="2"><?php echo $text_top; ?></option>
	<option value="3"><?php echo $text_fullscreen; ?></option>
	<?php } ?>
	</select>
	</td>
	</tr>
	<tr>
	<td><?php echo $accept_button; ?></td>
	<td>
	<span class="customhelp"><?php echo $colour_caption; ?></span><p>
	<input type="text" name="accept_text_colour" value="<?php echo $accept_text_colour; ?>" size="6" class="color {required:false,hash:true}"  />
<p>
	<span class="customhelp"><?php echo $hover_colour_caption; ?></span><p>
	<input type="text" name="accept_text_hover" value="<?php echo $accept_text_hover; ?>" size="6" class="color {required:false,hash:true}" />
<p>
	<span width="100px" class="customhelp"><?php echo $background_caption; ?></span><p>
	<input type="text" name="accept_button_colour" value="<?php echo $accept_button_colour; ?>" size="6" class="color {required:false,hash:true}"  />
<p>
	<span class="customhelp"><?php echo $background_hover_caption; ?></span><p>
	<input type="text" name="accept_button_hover" value="<?php echo $accept_button_hover; ?>" size="6" class="color {required:false,hash:true}" />
<p>
	<span class="customhelp"><?php echo $rounded_corners_caption; ?></span><p>
	<input type="checkbox" name="rounded_corners"<?php if ($rounded_corners) echo 'checked="checked"';?>> 
	</td>
	</tr>
	<tr>
	<td><?php echo $cookie_text; ?></td>
	<td>
	<span class="customhelp"><?php echo $colour_caption; ?></span><p>
	<input type="text" name="cookie_text_colour" value="<?php echo $cookie_text_colour; ?>" size="6" class="color {required:false,hash:true}"  />
	</td>
	</tr>
	<tr>
	<td><?php echo $cookie_background; ?></td>
	<td>
	<span class="customhelp"><?php echo $background_caption; ?></span><p>
	<input type="text" name="cookie_background_colour" value="<?php echo $cookie_background_colour; ?>" size="6" class="color {required:false,hash:true}"  /><p>
	<?php 
	$opacity = array(
	'0.1'   => '0.1',
	'0.2'   => '0.2',
	'0.3'   => '0.3',
	'0.4'   => '0.4',
	'0.5'   => '0.5',
	'0.6'   => '0.6',
	'0.7'   => '0.7',
	'0.8'   => '0.8',
	'0.9'   => '0.9',
	'1' => '1'
	);
	?>
	<span class="customhelp"><?php echo $opacity_caption; ?></span><p>
	<select name="cookie_opacity" id="cookie_opacity">
	<?php foreach ($opacity as $fv => $fc) { ?>
	<?php ($fv ==  $cookie_opacity) ? $currentop = 'selected' : $currentop=''; ?><p>
	<option value="<?php echo $fv; ?>" <?php echo $currentop; ?> ><?php echo $fc; ?></option>
	<?php } ?>
	</select>
	</td>
	</tr>
	<tr>
	<td><?php echo $cookie_url_text; ?></td>
	<td>
	<span class="customhelp"><?php echo $url_caption; ?></span><p>
	<input type="text" name="cookie_url" value="<?php echo $cookie_url; ?>" /><p>
	<span class="customhelp"><?php echo $url_help; ?></span>
	</td>
	</tr>
	</table>
	</div>
	</form>
	</div>
	</div>
</div>

<?php echo $footer; ?>
	<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script> 
	<script type="text/javascript">
	$('#settings_tabs a').tabs();
</script>