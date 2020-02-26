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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_purge; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
	<div class="content">
	  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
          <table class="form">
            <tr>
              <td><div class="warning"><?php echo $text_warning; ?></div></td>
            </tr>
            <tr>
              <td>
			    <?php echo $entry_mode; ?>
	            <input type="radio" name="mode" value="simple" checked="checked" onclick="document.getElementById('tab-pro').style.display = 'none'; document.getElementById('tab-simple').style.display = 'inline';"/><?php echo $entry_mode_simple; ?>
	            <input type="radio" name="mode" value="pro" onclick="document.getElementById('tab-pro').style.display = 'inline'; document.getElementById('tab-simple').style.display = 'none';" /><?php echo $entry_mode_pro; ?>
              </td>
            </tr>
          </table>
	    <div id="tab-simple" class="htab">
          <table name="form-simple">
            <tr>
              <td><?php echo $entry_models; ?></td>
			  <td>
			    <div class="scrollbox" style="height: 300pt; margin-bottom: 5px;"><?php $class = 'odd'; ?>
                  <?php foreach ($tables_simple as $table) { ?>
                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                    <div class="<?php echo $class; ?>">
                      <input type="checkbox" name="table_simple[]" value="<?php echo $table["package"] . '/' . $table["module"]; ?>" />
                      <?php echo $table["value"]; ?>
			        </div>
                  <?php } ?>
                </div>
			    <a class="reds-btn" onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a><a class="reds-btn2" onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
			  </td>
            </tr>
          </table>
        </div>
        <div id="tab-pro" class="htab" style="display: none;">
          <table name="form-pro">
            <tr>
              <td><?php echo $entry_tables; ?></td>
			  <td>
			    <div class="scrollbox" style="height: 300pt; margin-bottom: 5px;"><?php $class = 'odd'; ?>
				  <?php foreach ($tables_pro as $table) { ?>
					<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
					<div class="<?php echo $class; ?>">
					  <input type="checkbox" name="table_pro[]" value="<?php echo $table; ?>" />
					  <?php echo $table; ?>
					</div>
				  <?php } ?>
                </div>
			    <a class="reds-btn" onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> <a class="reds-btn2" onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
			  </td>
            </tr>
          </table>
        </div>
      </form>
    </div>
  </div>
<?php echo $footer; ?>
