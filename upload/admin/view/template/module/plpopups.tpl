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
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

<!--  Вкладки в админке -->
<script type="text/javascript">
$(function () {
    var tabContainers = $('div.tabs > div');
    tabContainers.hide().filter(':first').show();
    $('div.tabs ul.tabNavigation a').click(function () {
        tabContainers.hide();
        tabContainers.filter(this.hash).show();
        $('div.tabs ul.tabNavigation a').removeClass('selected');
        $(this).addClass('selected');
        return false;
    }).filter(':first').click();
});
</script>

<style type="text/css">
div.tabs { background: #f7f7f9; border: 1px solid #e1e1e8; padding-left: 10px; padding-right: 10px; padding-top: 20px; padding-bottom: 10px; }
div.container { margin: auto; width: 90%; margin-bottom: 10px; }
ul.tabNavigation { list-style: none; margin: 0; padding: 0; }
    ul.tabNavigation li {display: inline;}
        ul.tabNavigation li a { padding: 10px 15px; background-color: #fff; color: #000; text-decoration: none; font-size: 14px; font-weight: bold; }
            ul.tabNavigation li a.selected,
ul.tabNavigation li a.selected:hover { background: #3071a9; color: #fff; }
            ul.tabNavigation li a:hover { background: #e6e6e6; color: #000; }
            ul.tabNavigation li a:focus {outline: 0;}
div.tabs div { padding: 5px; margin-top: 10px; border: 1px solid #FFF; background: #FFF; }
    div.tabs div h2 {margin-top: 0;}
    </style>

<!--  cодержимое вкладок старт -->
<table>
<tr>  
  <td>
    <label style="text-decoration: none; color: #FFF; display: inline-block; padding: 5px 10px 3px 10px; background: #d9534f;">
    <?php if ($on_off_plpopups == true) {?>
    <input type="checkbox" style="vertical-align: middle;" name="on_off_plpopups" checked> 
    <?php } else {?>
    <input type="checkbox" style="vertical-align: middle;" name="on_off_plpopups">
    <?php }?>
    <?php echo $on_off_plpopups_text;?>
    </label>
  </td>
  <td>
    <label style="text-decoration: none; color: #FFF; display: inline-block; padding: 5px 10px 3px 10px; background: #f0ad4e;">
    <?php if ($dev_mode_plpopups == true) {?>
    <input type="checkbox" style="vertical-align: middle;" name="dev_mode_plpopups" checked> 
    <?php } else {?>
    <input type="checkbox" style="vertical-align: middle;" name="dev_mode_plpopups">
    <?php }?>
    <?php echo $dev_mode_plpopups_text;?>
    </label>
  </td>
  <td>
    <label style="text-decoration: none; color: #FFF; display: inline-block; padding: 5px 10px 3px 10px; background: #5cb85c;">
    <?php if ($config_customer_popup == true) {?>
    <input type="checkbox" style="vertical-align: middle;" name="config_customer_popup" checked> 
    <?php } else {?>
    <input type="checkbox" style="vertical-align: middle;" name="config_customer_popup">
    <?php }?>
    <?php echo $entry_config_customer_popup;?>
    </label>
  </td>
  </tr>
</table>

<br />

<div class="tabs">
    <ul class="tabNavigation">
        <li><a class="" href="#first"><?php echo $entry_plpopups_setting_text; ?></a></li>
        <li><a class="" href="#closebutton"><?php echo $entry_plpopups_close_font_text; ?></a></li>
        <li><a class="" href="#openbutton"><?php echo $entry_plpopups_open_text; ?></a></li>
        <li><a class="" href="#customcss"><?php echo $entry_plpopups_cuscss_text; ?></a></li>
        <!-- <li><a class="" href="#support"><?php echo $entry_plpopups_faq_text; ?></a></li> -->
    </ul>
 
    <div id="first">
<table>    
  <tr> 
  <td>
    <label style="text-decoration: none; color: #FFF; display: inline-block; padding: 5px 10px 3px 10px; background: #428bca;">
    <?php if ($esc_close_plpopups == true) {?>
    <input type="checkbox" style="vertical-align: middle;" name="esc_close_plpopups" checked> 
    <?php } else {?>
    <input type="checkbox" style="vertical-align: middle;" name="esc_close_plpopups">
    <?php }?>
    <?php echo $esc_close_plpopups_text;?>
    </label>

    <label style="text-decoration: none; color: #FFF; display: inline-block; padding: 5px 10px 3px 10px; background: #5cb85c;">
    <?php if ($click_close_plpopups == true) {?>
    <input type="checkbox" style="vertical-align: middle;" name="click_close_plpopups" checked> 
    <?php } else {?>
    <input type="checkbox" style="vertical-align: middle;" name="click_close_plpopups">
    <?php }?>
    <?php echo $click_close_plpopups_text;?>
    </label>

    <label style="text-decoration: none; color: #FFF; display: inline-block; padding: 5px 10px 3px 10px; background: #5bc0de;">
    <?php if ($plpopups_cookie_ip == true) {?>
    <input type="checkbox" style="vertical-align: middle;" name="plpopups_cookie_ip" checked> 
    <?php } else {?>
    <input type="checkbox" style="vertical-align: middle;" name="plpopups_cookie_ip">
    <?php }?>
    <?php echo $entry_plpopups_cookie_ip_text;?>
    </label>
  </td>
  </tr>
</table>

<table>
    <tr>
        <td><b><?php echo $entry_plpopups_cookie_name_text; ?></b></td>
        <td><input  name="config_plpopups_cookie_name" size="10" value="<?php echo $config_plpopups_cookie_name; ?>"/><?php echo $entry_plpopups_cookie_help_text; ?></td>
    </tr>
    <tr>
        <td><b><?php echo $entry_plpopups_cookie_text; ?></b></td>
        <td><input  name="config_plpopups_cookie" size="10" value="<?php echo $config_plpopups_cookie; ?>"/><?php echo $entry_plpopups_cookie_time_help_text; ?></td>
    </tr>
    <tr>
        <td><b><?php echo $entry_plpopups_screen_resolution_text; ?></b></td>
        <td><input name="config_plpopups_screen_resolution" size="10" value="<?php echo $config_plpopups_screen_resolution; ?>"/><b>px;</b><?php echo $entry_plpopups_screen_resolution_help_text; ?></td>
    </tr>
    <tr>
        <td><b><?php echo $entry_plpopups_timeout_text; ?></b></td>
        <td><input name="config_plpopups_timeout" size="10" value="<?php echo $config_plpopups_timeout; ?>"/><?php echo $entry_plpopups_timeout_help_text; ?></td>
    </tr>
    <tr>
        <td><b><?php echo $entry_plpopups_zindex_text; ?></b></td>
        <td><input name="config_plpopups_zindex" size="10" value="<?php echo $config_plpopups_zindex; ?>"/><?php echo $entry_plpopups_zindex_help_text; ?></td>
    </tr>
    <tr>
        <td><b><?php echo $entry_plpopups_margin_text; ?></b></td>
        <td><input name="config_plpopups_margin" size="10" value="<?php echo $config_plpopups_margin; ?>"/><b>(0 auto)</b><?php echo $entry_plpopups_margin_help_text; ?></td>
    </tr>
    <tr>
        <td><b><?php echo $entry_plpopups_background_color_text; ?></b></td>
        <td><input type="color" name="config_plpopups_background_color" size="10" value="<?php echo $config_plpopups_background_color; ?>"/><?php echo $entry_plpopups_background_color_help_text; ?></td>
    </tr>
    <tr>
        <td><b><?php echo $entry_plpopups_opacity_color_text; ?></b></td>
        <td><input type="color" name="config_plpopups_opacity_color" size="10" value="<?php echo $config_plpopups_opacity_color; ?>"/><?php echo $entry_plpopups_opacity_color_help_text; ?></td>
    </tr>
    <tr>
        <td><b><?php echo $entry_plpopups_opacity_text; ?></b></td>
        <td><input name="config_plpopups_opacity" size="10" value="<?php echo $config_plpopups_opacity; ?>"/><?php echo $entry_plpopups_opacity_help_text; ?></td>
    </tr>
    <tr>
        <td><b><?php echo $entry_plpopups_shadow_text; ?></b></td>
        <td><input name="config_plpopups_shadow" size="35" value="<?php echo $config_plpopups_shadow; ?>"/><b>0 0 0 6px rgba(153, 153, 153, .3)</b><?php echo $entry_plpopups_shadow_help_text; ?></td>
    </tr>
    <tr>
        <td><b><?php echo $entry_plpopups_borderradius_text; ?></b></td>
        <td><input name="config_plpopups_borderradius" size="10" value="<?php echo $config_plpopups_borderradius; ?>"/><b>px</b></td>
    </tr>
</table>
    </div>

    <div id="closebutton">
  <table>
    <tr>
        <td><?php echo $entry_plpopups_close_button_top; ?></td>
        <td><input name="config_plpopups_close_button_top" size="3" value="<?php echo $config_plpopups_close_button_top; ?>"/><b>px;</b><?php echo $entry_plpopups_close_button_top_help; ?></td>
    </tr>
    <tr>
        <td><?php echo $entry_plpopups_close_button_right; ?></td>
        <td><input name="config_plpopups_close_button_right" size="3" value="<?php echo $config_plpopups_close_button_right; ?>"/><b>px;</b><?php echo $entry_plpopups_close_button_right_help; ?></td>
    </tr>
    <tr>
        <td><?php echo $entry_plpopups_close_font_size_text; ?></td>
        <td><input name="config_plpopups_close_font_size" size="3" value="<?php echo $config_plpopups_close_font_size; ?>"/><b>px;</b></td>
    </tr>
    <tr>
        <td><?php echo $entry_plpopups_close_font_color_text; ?></td>
        <td><input type="color"  name="config_plpopups_close_font_color" size="10" value="<?php echo $config_plpopups_close_font_color; ?>"/></td>
    </tr>
    <tr>
        <td><?php echo $entry_plpopups_close_font_color_hover_text; ?></td>
        <td><input type="color"  name="config_plpopups_close_font_color_hover" size="10" value="<?php echo $config_plpopups_close_font_color_hover; ?>"/></td>
    </tr>
    <tr>
        <td><b><?php echo $entry_plpopups_close_font_weight_text; ?></b></td>
        <td><?php if ($plpopups_close_font_weight == true) {?>
    <input type="checkbox" style="vertical-align: middle;" name="plpopups_close_font_weight" checked> 
    <?php } else {?>
    <input type="checkbox" style="vertical-align: middle;" name="plpopups_close_font_weight">
    <?php }?>
        </td>
    </tr>
    <tr>
        <td><i><?php echo $entry_plpopups_close_font_italic_text; ?></i></td>
        <td><?php if ($plpopups_close_font_italic == true) {?>
    <input type="checkbox" style="vertical-align: middle;" name="plpopups_close_font_italic" checked> 
    <?php } else {?>
    <input type="checkbox" style="vertical-align: middle;" name="plpopups_close_font_italic">
    <?php }?>
        </td>
    </tr>
  </table>

    </div>

    <div id="openbutton">
       
    <label style="text-decoration: none; color: #FFF; display: inline-block; padding: 5px 10px 3px 10px; background: #428bca;">
    <?php if ($openbutton_on_off_plpopups == true) {?>
    <input type="checkbox" style="vertical-align: middle;" name="openbutton_on_off_plpopups" checked> 
    <?php } else {?>
    <input type="checkbox" style="vertical-align: middle;" name="openbutton_on_off_plpopups">
    <?php }?>
    <?php echo $openbutton_on_off_plpopups_text;?>
    </label> <?php echo $openbutton_on_off_plpopups_help_text;?>
<p></p>
        <h2><?php echo $entry_plpopups_open_head_text; ?></h2>
        <p><?php echo $entry_plpopups_open_head_2_text; ?></p>
        <div style="padding: 9px 14px; margin-bottom: 14px; background-color: #f7f7f9; border: 1px solid #e1e1e8; border-radius: 4px; width: 647px;">
          &lt;span class="plopenbutton<b>ID окна</b>" id="#boxUserFirstInfo<b>ID окна</b>" onclick="$('#boxUserFirstInfo<b>ID окна</b>').plpopup()"&gt;<b>Название кнопки</b>&lt;/span&gt;
        </div>
    </div>


    <div id="customcss">
      <table>
        <tr>
        <td><b><?php echo $entry_plpopups_css_global_text; ?></b></td>
        <td><textarea name="config_plpopups_css_global" cols="100" rows="10" ><?php echo $config_plpopups_css_global; ?></textarea> </td>
        </tr>
      </table>
    </div>

<!--
    <div id="support">
        блок под faq
    </div>-->
</div>

<!--  содержимое вкладок конец -->

          <div style="margin-top: 10px; padding-top: 10px; border-top: 1px solid #ddd;">
          <div class="vtabs">
          <?php $module_row = 1; ?>
          <?php foreach ($modules as $module) { ?>
          <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
          <?php $module_row++; ?>
          <?php } ?>
          <span id="module-add"><?php echo $button_add_module; ?>&nbsp;<img src="view/image/add.png" alt="" onclick="addModule();" /></span> </div>
        <?php $module_row = 1; ?>
        <?php foreach ($modules as $module) { ?>
        <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
          <div id="language-<?php echo $module_row; ?>" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>">

            <table class="form">
              <tr>
                <td><?php echo $entry_on_off_plpopups_pop_text; ?></td>
                <td><input type="hidden" name="plpopups_module[<?php echo $module_row; ?>][on_off_plpopups_pop][<?php echo $language['language_id']; ?>]" id="on_off_plpopups_pop-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" size="15" value="<?php echo isset($module['on_off_plpopups_pop'][$language['language_id']]) ? $module['on_off_plpopups_pop'][$language['language_id']] : ''; ?>"/>

                <select onchange="document.getElementById('on_off_plpopups_pop-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>').value= this.value">

                  <?php if ($module['on_off_plpopups_pop'][$language['language_id']] == 1) { ?>

                  <option value="1" selected="selected"><?php echo $entry_plpopups_yes; ?></option>
                  <option value=""><?php echo $entry_plpopups_no; ?></option>
                  
                  <?php } else if ($module['on_off_plpopups_pop'][$language['language_id']] != 1) { ?>
                  <option value="1"><?php echo $entry_plpopups_yes; ?></option>
                  <option value="" selected="selected"><?php echo $entry_plpopups_no; ?></option>

                  <?php } ?>
                </select>

                </td>

                <td><?php echo $entry_plpopups_timeout_one_text; ?></td>
                <td><input name="plpopups_module[<?php echo $module_row; ?>][plpopups_timeout_one][<?php echo $language['language_id']; ?>]" id="plpopups_timeout_one-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" size="15" value="<?php echo isset($module['plpopups_timeout_one'][$language['language_id']]) ? $module['plpopups_timeout_one'][$language['language_id']] : ''; ?>"/></td>

              </tr>
             </table>

            <table class="form">
              <tr>
                <td><?php echo $entry_plpopups_id_text; ?></td>
                <td><input name="plpopups_module[<?php echo $module_row; ?>][plpopups_id][<?php echo $language['language_id']; ?>]" id="plpopups_id-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" size="15" value="<?php echo isset($module['plpopups_id'][$language['language_id']]) ? $module['plpopups_id'][$language['language_id']] : ''; ?>"/></td>
                <td><?php echo $entry_plpopups_background_text; ?></td>
                <td><input name="plpopups_module[<?php echo $module_row; ?>][plpopups_background][<?php echo $language['language_id']; ?>]" id="plpopups_background-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" size="15" value="<?php echo isset($module['plpopups_background'][$language['language_id']]) ? $module['plpopups_background'][$language['language_id']] : ''; ?>"/></td>
                
                <td><?php echo $entry_plpopups_background_size_w_text; ?></td>
                <td><input name="plpopups_module[<?php echo $module_row; ?>][plpopups_background_size_w][<?php echo $language['language_id']; ?>]" id="plpopups_background_size_w-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" size="10" value="<?php echo isset($module['plpopups_background_size_w'][$language['language_id']]) ? $module['plpopups_background_size_w'][$language['language_id']] : ''; ?>"/>px</td>
              
                <td><?php echo $entry_plpopups_background_size_h_text; ?></td>
                <td><input name="plpopups_module[<?php echo $module_row; ?>][plpopups_background_size_h][<?php echo $language['language_id']; ?>]" id="plpopups_background_size_h-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" size="10" value="<?php echo isset($module['plpopups_background_size_h'][$language['language_id']]) ? $module['plpopups_background_size_h'][$language['language_id']] : ''; ?>"/>px</td>
            </tr>
            </table>
            <table class="form">
              <tr>
                <td><?php echo $entry_description; ?></td>
                <td><textarea name="plpopups_module[<?php echo $module_row; ?>][description][<?php echo $language['language_id']; ?>]" id="description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($module['description'][$language['language_id']]) ? $module['description'][$language['language_id']] : ''; ?></textarea></td>
              </tr>
            </table>
            <table class="form">    
                <td><?php echo $entry_plpopups_css_button_text; ?></td>
                <td><textarea cols="75" rows="10" name="plpopups_module[<?php echo $module_row; ?>][plpopups_css_button][<?php echo $language['language_id']; ?>]" id="plpopups_css_button-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($module['plpopups_css_button'][$language['language_id']]) ? $module['plpopups_css_button'][$language['language_id']] : ''; ?></textarea></td>
              </tr>
            </table>
            <table class="form">
              <tr>
                <td><?php echo $entry_plpopups_close_name_text; ?></td>
                <td><input name="plpopups_module[<?php echo $module_row; ?>][plpopups_close_name][<?php echo $language['language_id']; ?>]" id="plpopups_close_name-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" size="30" value="<?php echo isset($module['plpopups_close_name'][$language['language_id']]) ? $module['plpopups_close_name'][$language['language_id']] : ''; ?>"/></td>
            </table>

            <table class="form">
              <tr>
                <td><?php echo $entry_plpopups_close_link; ?></td>
                <td><input name="plpopups_module[<?php echo $module_row; ?>][plpopups_close_link][<?php echo $language['language_id']; ?>]" id="plpopups_close_link-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" size="30" value="<?php echo isset($module['plpopups_close_link'][$language['language_id']]) ? $module['plpopups_close_link'][$language['language_id']] : ''; ?>"/><?php echo $entry_plpopups_close_link_help ?></td>
            </table>
            <table class="form">    
                <td><?php echo $entry_plpopups_close_css_text; ?></td>
                <td><textarea cols="75" rows="10" name="plpopups_module[<?php echo $module_row; ?>][plpopups_close_css][<?php echo $language['language_id']; ?>]" id="plpopups_close_css-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($module['plpopups_close_css'][$language['language_id']]) ? $module['plpopups_close_css'][$language['language_id']] : ''; ?></textarea></td>
              </tr>
            </table>
            <table class="form">    
                <td><?php echo $entry_plpopups_close_css_a_text; ?></td>
                <td><textarea cols="75" rows="10" name="plpopups_module[<?php echo $module_row; ?>][plpopups_close_css_a][<?php echo $language['language_id']; ?>]" id="plpopups_close_css_a-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($module['plpopups_close_css_a'][$language['language_id']]) ? $module['plpopups_close_css_a'][$language['language_id']] : ''; ?></textarea></td>
              </tr>
            </table>
          </div>
          <?php } ?>
          <table class="form">
            <tr>
              <td><?php echo $entry_layout; ?></td>
              <td><select name="plpopups_module[<?php echo $module_row; ?>][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_position; ?></td>
              <td><select name="plpopups_module[<?php echo $module_row; ?>][position]">
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="plpopups_module[<?php echo $module_row; ?>][status]">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="plpopups_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            </tr>
          </table>
        </div>
        <?php $module_row++; ?>
        <?php } ?>
      </div>
      </form>
 <center>v3.1</center>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor_pl/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
<?php $module_row++; ?>
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {    
    html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';
    html += '  <div id="language-' + module_row + '" class="htabs">';
    <?php foreach ($languages as $language) { ?>
    html += '    <a href="#tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>';
    <?php } ?>
    html += '  </div>';
    <?php foreach ($languages as $language) { ?>
    html += '    <div id="tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>">';

    html += '      <table class="form">';
    html += '        <tr>';
    html += '          <td><?php $entry_on_off_plpopups_pop_text; ?></td>';
    html += '          <td><input type="hidden" name="plpopups_module[' + module_row + '][on_off_plpopups_pop][<?php echo $language['language_id']; ?>]" id="on_off_plpopups_pop-' + module_row + '-<?php echo $language['language_id']; ?>" value="" size="15"></td>';
    html += '          <td><?php echo $entry_plpopups_timeout_one_text; ?></td>';
    html += '          <td><input name="plpopups_module[' + module_row + '][plpopups_timeout_one][<?php echo $language['language_id']; ?>]" id="plpopups_timeout_one-' + module_row + '-<?php echo $language['language_id']; ?>" value="" size="15"></td>';
    html += '        </tr>';
    html += '      </table>';
    html += '      <table class="form">';
    html += '        <tr>';
    html += '          <td><?php echo $entry_plpopups_id_text; ?></td>';
    html += '          <td><input name="plpopups_module[' + module_row + '][plpopups_id][<?php echo $language['language_id']; ?>]" id="plpopups_id-' + module_row + '-<?php echo $language['language_id']; ?>" value="" size="15"></td>';
    html += '          <td><?php echo $entry_plpopups_background_size_w_text; ?></td>';
    html += '          <td><?php echo $entry_plpopups_background_text; ?></td>';
    html += '          <td><input name="plpopups_module[' + module_row + '][plpopups_background][<?php echo $language['language_id']; ?>]" id="plpopups_background-' + module_row + '-<?php echo $language['language_id']; ?>" value="" size="15"></td>';
    html += '          <td><?php echo $entry_plpopups_background_size_w_text; ?></td>';
    html += '          <td><input name="plpopups_module[' + module_row + '][plpopups_background_size_w][<?php echo $language['language_id']; ?>]" id="plpopups_background_size_w-' + module_row + '-<?php echo $language['language_id']; ?>" value="" size="10"></td>';
    html += '          <td><?php echo $entry_plpopups_background_size_h_text; ?></td>';
    html += '          <td><input name="plpopups_module[' + module_row + '][plpopups_background_size_h][<?php echo $language['language_id']; ?>]" id="plpopups_background_size_h-' + module_row + '-<?php echo $language['language_id']; ?>" value="" size="10"></td>';
    html += '        </tr>';
    html += '      </table>';
    html += '      <table class="form">';
    html += '        <tr>';
    html += '          <td><?php echo $entry_description; ?></td>';
    html += '          <td><textarea name="plpopups_module[' + module_row + '][description][<?php echo $language['language_id']; ?>]" id="description-' + module_row + '-<?php echo $language['language_id']; ?>"></textarea></td>';
    html += '        </tr>';
    html += '      </table>';
    html += '      <table class="form">';
    html += '        <tr>';
    html += '          <td><?php echo $entry_plpopups_css_button_text; ?></td>';
    html += '          <td><textarea name="plpopups_module[' + module_row + '][plpopups_css_button][<?php echo $language['language_id']; ?>]" id="plpopups_css_button-' + module_row + '-<?php echo $language['language_id']; ?>"></textarea></td>';
    html += '        </tr>';
    html += '      </table>';

        html += '      <table class="form">';
    html += '        <tr>';
    html += '          <td><?php echo $entry_plpopups_close_name_text; ?></td>';
    html += '          <td><input name="plpopups_module[' + module_row + '][plpopups_close_name][<?php echo $language['language_id']; ?>]" id="plpopups_close_name-' + module_row + '-<?php echo $language['language_id']; ?>" value="" size="30"></td>';
    html += '        </tr>';
    html += '      </table>';

    html += '      <table class="form">';
    html += '        <tr>';
    html += '          <td><?php echo $entry_plpopups_close_link; ?></td>';
    html += '          <td><input name="plpopups_module[' + module_row + '][plpopups_close_link][<?php echo $language['language_id']; ?>]" id="plpopups_close_link-' + module_row + '-<?php echo $language['language_id']; ?>" value="" size="30"></td>';
    html += '        </tr>';
    html += '      </table>';

    html += '      <table class="form">';
    html += '        <tr>';
    html += '          <td><?php echo $entry_plpopups_close_css_text; ?></td>';
    html += '          <td><textarea name="plpopups_module[' + module_row + '][plpopups_close_css][<?php echo $language['language_id']; ?>]" id="plpopups_close_css-' + module_row + '-<?php echo $language['language_id']; ?>"></textarea></td>';
    html += '        </tr>';
    html += '      </table>';
        html += '      <table class="form">';
    html += '        <tr>';
    html += '          <td><?php echo $entry_plpopups_close_css_a_text; ?></td>';
    html += '          <td><textarea name="plpopups_module[' + module_row + '][plpopups_close_css_a][<?php echo $language['language_id']; ?>]" id="plpopups_close_css_a-' + module_row + '-<?php echo $language['language_id']; ?>"></textarea></td>';
    html += '        </tr>';
    html += '      </table>';
    html += '    </div>';
    <?php } ?>

    html += '  <table class="form">';
    html += '    <tr>';
    html += '      <td><?php echo $entry_layout; ?></td>';
    html += '      <td><select name="plpopups_module[' + module_row + '][layout_id]">';
    <?php foreach ($layouts as $layout) { ?>
    html += '           <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
    <?php } ?>
    html += '      </select></td>';
    html += '    </tr>';
    html += '    <tr>';
    html += '      <td><?php echo $entry_position; ?></td>';
    html += '      <td><select name="plpopups_module[' + module_row + '][position]">';
    html += '        <option value="content_top"><?php echo $text_content_top; ?></option>';
    html += '        <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
    html += '        <option value="column_left"><?php echo $text_column_left; ?></option>';
    html += '        <option value="column_right"><?php echo $text_column_right; ?></option>';
    html += '      </select></td>';
    html += '    </tr>';
    html += '    <tr>';
    html += '      <td><?php echo $entry_status; ?></td>';
    html += '      <td><select name="plpopups_module[' + module_row + '][status]">';
    html += '        <option value="1"><?php echo $text_enabled; ?></option>';
    html += '        <option value="0"><?php echo $text_disabled; ?></option>';
    html += '      </select></td>';
    html += '    </tr>';
    html += '    <tr>';
    html += '      <td><?php echo $entry_sort_order; ?></td>';
    html += '      <td><input type="text" name="plpopups_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
    html += '    </tr>';
    html += '  </table>'; 
    html += '</div>';
    
    $('#form').append(html);
    
    <?php foreach ($languages as $language) { ?>
    CKEDITOR.replace('description-' + module_row + '-<?php echo $language['language_id']; ?>', {
        filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
        filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
    });  
    <?php } ?>
    
    $('#language-' + module_row + ' a').tabs();
    
    $('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
    
    $('.vtabs a').tabs();
    
    $('#module-' + module_row).trigger('click');
    
    module_row++;
}
//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
$('#language-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?> 
//--></script> 
<?php echo $footer; ?>
