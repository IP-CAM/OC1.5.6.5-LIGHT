<?php echo $header;
$secKey = ((isset($modules['secure_key'])) ? $modules['secure_key'] : 'secureKey' );
$secVal = ((isset($modules['secure_value'])) ? $modules['secure_value'] : '' );
?>

<script type="text/javascript">

function randomString() {
var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
var string_length = 10;
var randomstring = '';
for (var i=0; i<string_length; i++) {
	var rnum = Math.floor(Math.random() * chars.length);
	randomstring += chars.substring(rnum,rnum+1);
}
return randomstring;	
}

function ChangeUrl() {
if ($('[name="secure_value"]').val() == "") {GenerateVal()}
var url = document.URL.substring(0, document.URL.indexOf("index"))
url += "?" + $('[name="secure_key"]').val()
url += "=" + $('[name="secure_value"]').val()
$('#finalURL').html(url);
}

function GenerateKey(){
document.getElementById("secure_key").value=randomString();
ChangeUrl();
}

function GenerateVal(){
document.getElementById("secure_value").value=randomString();
ChangeUrl();
}

function insertip(){
var ipaddress = prompt("Please enter the IP address", "");
if (ipaddress != null) {
	$.ajax({
		url: 'index.php?route=module/secureurl/insert&token=<?php echo $token; ?>',
		type: 'post',
		data: 'ip=' + ipaddress,
		dataType: 'text',
		beforeSend: function() {
			$('#btnInsert').before('<span class="wait" style="float: right;">&nbsp;<img src="view/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},
		success: function(date) {
			location.reload();
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
}
}

</script>


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
      <h1><img src="view/image/logo_secure.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a  class="button" id="submit"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table id="module" class="list">
         <h3>Administrator Key</h3>
            <tr>          
				<td class="left">Status</td>
				<td>
				<select name="secure_status">
                  <?php $secure_status = false;
					if (isset($modules['secure_status'])) { 
						$secure_status = $modules['secure_status'];
					}
				  ?>
				  <?php if ($secure_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				</td>
	
            </tr>
			<tr>
              <td class="left">Secure Key</td><td>
               <input type="text" name="secure_key" id="secure_key" onchange="ChangeUrl();" value="<?php  echo $secKey;   ?>"  />
				<button type="button" class="reds-btn2" onclick="GenerateKey()">Generate Me!</button></td>
              </tr>
           <tr>
              <td class="left">Secure Value</td><td>
               <input type="text" name="secure_value" id="secure_value" onchange="ChangeUrl();" value="<?php  echo $secVal;  ?>"  />
		<button type="button" class="reds-btn2" onclick="GenerateVal()">Generate Me!</button>
		</td>
		
              </tr>
			   
        </table>
		
	  <h3>Your Secure URL Link</h3>	
		<h3 id="finalURL" style="color: darkred;"></h3>
		<br/>
		<h3 id="warning_msg"  style="color: darkred;">**Please Record down your secure URL Link before saving.</h3>
      </form>
	  <br><br>


  <div class="box" style="width: 90%; margin: 0 auto;">
    <div class="heading">
      <h1><img src="view/image/customer.png" alt="" /> <?php echo $heading_title_ip; ?></h1>
      <div class="buttons">
		<a onclick="insertip()" class="reds-btn2" id="btnInsert"><?php echo $button_insert; ?></a>
		<a onclick="$('form').submit();" class="reds-btn"><?php echo $button_delete; ?></a>
	  </div>
    </div>
    <div class="content" style="min-height: 100px;">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'ip') { ?>
                <a href="<?php echo $sort_ip; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_ip; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_ip; ?>"><?php echo $column_ip; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($admin_whitelists) { ?>
            <?php foreach ($admin_whitelists as $admin_whitelist) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($admin_whitelist['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $admin_whitelist['admin_ip_whitelist_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $admin_whitelist['admin_ip_whitelist_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $admin_whitelist['ip']; ?></td>
              <td class="right"><?php foreach ($admin_whitelist['action'] as $action) { ?>
               <a class="reds-btn2" href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> 
               <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="10"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
	  <div style="text-align:center; margin-top:10px;"><h5>version 1.0.5</h5></div>
    </div>
  </div>
<script type="text/javascript">
$(function(){
	$('#submit').click(function(){
		if ($('select').val() == "1") {
			if(confirm("Have you saved the secure url yet?")) {
			  $('#form').submit();
			}
  		} else {
		  $('#form').submit();
		}
	});
	$('select').change(function(){
		if ($('select').val() == "1") {
			$('#warning_msg').show();
		} else {
			$('#warning_msg').hide();
		}
	});
});

$(document).ready(function() { ChangeUrl() });
</script>

  
</div>
<?php echo $footer; ?>