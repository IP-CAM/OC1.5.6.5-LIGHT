<?php
//	Catch all languages
	$listlanguages = scandir(DIR_CATALOG . 'language/');
	unset($listlanguages[0]);		// deletes the .
	unset($listlanguages[1]); 		// deletes the ..

//	Checks if the FILE parameter is being passed via URL and sets the header of the page if so.
	if (isset($this->request->get['file']) && substr($this->request->get['file'], 0, 1) != "."){
	$title = explode('/', $this->request->get['file']);
	$selectedfile  = ucfirst($name_language).' :: ';
	$selectedfile .= ucwords(str_replace('_', ' ', $title[0])).' :: ';
	$selectedfile .= ucwords(str_replace('_', ' ', $title[1]));
	$selectedfile .= ' <span>('.$title[1].'.php)</span>';
	}else{
	$selectedfile = ucfirst($name_language).' :: '.ucfirst($name_language).' <span>('.$name_language.'.php)</span>';
	};
	?>

	<?php echo $header; ?>
	<div id="content">
	<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
	</div>
	<div class="box">
	<div class="heading">
	<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
	</div>
	<div class="content">
	<?php
	if(isset($showmsg)){
	if($showmsg == "success"){
	?>
	<div class="success"><?php echo $msg_success; ?></div>
	<?php
	}
	if($showmsg == "error"){
	?>
	<div class="warning"><?php echo $msg_error; ?></div>
	<?php
	}
	}
	?>
	<div class="headinglanguageEditor">
	<h3 class="languageEditorTitle">
	<?php echo $selectedfile ?>
	</h3>
	</div>
	<table width = "100%" cellpadding = "4" cellspacing = "0" border = "0" style = "border:collapse;">
	<tr>
	<td width = "50%" align = "right" valign = "top">
	<table width = "100%" cellpadding = "2" cellspacing = "0" border = "0" style = "border:collapse;">
	<tr>
	<td align = "center" valign = "top">
	<form action = "<?php echo $action_select; ?>" method = "POST" id="form">
	<?php echo $entry_selectSection;
	$selected_back_end = null;
	$selected_front_end = null;
	if($section == $menu_frontend){
	$selected_front_end = 'selected="selected"';
	}else{
	$selected_back_end = 'selected="selected"';
	}
	?>
	<select name="sectionlist">
	<option value="catalog"<?php echo $selected_front_end; ?>><?php echo ucwords($menu_frontend); ?></option>
	<option value="admin"<?php echo $selected_back_end; ?>><?php echo ucwords($menu_backend); ?></option>
	</select></td><td>
	<?php echo $entry_selectLang; ?>
	<select name="listlanguages">
	<?php foreach ($listlanguages as $language){
	if (isset($name_language) && $name_language == $language){
	?><option value="<?php echo $language; ?>" selected="selected"><?php echo ucwords($language); ?></option><?php
	}else{
	?><option value="<?php echo $language; ?>"><?php echo ucwords($language); ?></option><?php
	}
	}
	?>
	</select><p>
	<a class="button" onclick = "$('#form').submit()"><span><?php echo $btn_select; ?></span></a>
	</form><br></td></tr></thead></table>

	<table width = "100%" cellpadding = "2" cellspacing = "0" border = "1" bordercolor = "#DDDDDD" style = "border-collapse:collapse;" class="list">
	<thead>
	<tr>
	<td class="left" height = "20"><?php echo $menu_variable; ?></td>
	<td class="left" width="240"><?php echo $menu_value; ?></td>
	<?php
	if(!isset($string)){
	?>
	<td align = "center"><?php echo $menu_edit; ?></td>
	<?php
	}else{
	?>
	<td align = "center"><?php echo $menu_action; ?></td>
	<?php
	}
	?>
	</tr>
	</thead>
	<tbody>
	<?php
	if($file_vars){
	if(!isset($string)){
	foreach($file_vars as $key => $val){
	?>
	<tr>
	<td class="left"><?php echo $key; ?></td>
	<td class="left"><?php echo $val; ?></td>
	<td align = "center"><a class="button" href = "<?php echo $action_edit.$key; ?>"><?php echo $entry_edit; ?></a></td>
	</tr>
	<?php
	}
	}else{
	?>
	<tr>
	<td align = "left" valign = "top"><?php echo $string; ?></td>
	<td class="left">
	<form id = "updateform" action = "<?php echo $viewing_file_link; ?>" method = "POST">
	<textarea name = "strvalue" cols = "40" rows = "4"><?php echo $file_vars[$string]; ?></textarea>
	<input type = "hidden" name = "poststr" value = "<?php echo $string; ?>">
	</form>
	</td>
	<td align = "center" valign = "top"><a class="button" onclick = "$('#updateform').submit()"><span><?php echo $btn_save; ?></a></span><p><a class="button" href = "<?php echo $viewing_file_link; ?>"><span><?php echo $btn_back; ?></span></td>
	</tr>
	<?php
	}
	}else{
	?>
	<tr>
	<td class="left" colspan = "3"><?php echo $msg_nofile; ?></td>
	</tr>
	<?php
	}
	?>
	</tbody>
	</table>
	</td>
	<td align = "left" valign = "top">
	<?php
	if(file_exists(DIR_CATALOG."language/".$name_language."/".$name_language.".php")){
	?>
	<table width = "100%" cellpadding = "4" cellspacing = "0" border = "1" style = "border:collapse;" bordercolor = "#DDDDDD" class="list">
	<thead>
	<tr>
	<td colspan = "3" align = "center"><b>Core Language File</b></td>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td width = "33%"><a href = "<?php echo $file_link.'./'.$name_language; ?>" style = "text-decoration:none"><font color = "#207DC1"><?php echo $name_language; ?></font></a></td>
	<td></td>
	<td></td>
	</tr>
	</tbody>
	</table>
	<br>
	<?php
	}
	foreach($files as $key => $value){
	foreach($value as $dir => $filenames){
	if($dir == "."){
	continue;
	}
	?>
	<table width = "99%" cellpadding = "0" cellspacing = "0" border = "1" style = "border:collapse;" bordercolor = "#DDDDDD" class="list">
	<thead>
	<tr>
	<td colspan = "3" align = "center"><b><?php echo ucfirst($dir); ?></b></td>
	</tr>
	</thead>
	<tbody>
	<tr>
	<?php
	$i = 0;
	$passes = 0;
	foreach($filenames as $filename){
	?>
	<td width = "33%"><a href = "<?php echo $file_link.$dir.'/'.$filename; ?>" style = "text-decoration:none"><font color = "#207DC1"><?php echo $filename; ?></font></a></td>
	<?php
	$i++;
	$passes++;
	if($i%3 == 0 && $passes < count($filenames)){
	echo "</tr><tr>";
	$i=0;
	}else{
	if($passes == count($filenames) && $i%3 == 2){
	echo "<td></td>";
	}
	if($passes == count($filenames) && $i%3 == 1){
	echo "<td></td><td></td>";
	}
	}
	}
	?>
	</tr>
	</tbody>
	</table>
	<br>
	<?php
	}
	}
	?>
	</td>
	</tr>
	</table>
	</td>
	</tr>
	</table>
	</div>
</div>
<?php
echo $footer;
?>