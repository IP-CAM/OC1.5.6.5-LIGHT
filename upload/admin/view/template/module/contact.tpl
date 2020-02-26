<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error) { ?>
  <div class="warning"><?php echo $error; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
    <div class="buttons">
    <a href="<?php echo $csvfile; ?>" class="button"><?php echo $button_csv; ?> </a> 
    <a onclick="$('#execute').val('markasread');$('#form').submit();" class="button"><?php echo $button_read; ?></a> 
    <a onclick="$('#execute').val('delete');$('#form').submit();" class="button"><?php echo $button_delete; ?> </a>
    </div>
     <h1><img alt="" src="view/image/shipping.png"><?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
    <form action="<?php echo $execute; ?>" method="post" enctype="multipart/form-data" id="form">
    <input type="hidden" name="execute" id="execute" />

      <table class="list">
        <thead>
          <tr>
           <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            <td class="left"><?php echo $column_name; ?></td>
            <td class="left"><?php echo $column_email; ?></td>
            <td class="left"><?php echo $column_ip; ?></td>
            <td class="left"><?php echo $column_description; ?></td>
           <td class="center"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($contact_info) { ?>
          <?php foreach ($contact_info as $contact) { ?>
            <tr>
            <td class="left"> <input type="checkbox" name="selected[]" value="<?php echo $contact['contact_id']; ?>" /></td>
            <td class="left" <?php if ($contact['is_read'] == 0){echo 'style="font-size:16px;"';}else{'style="font-size:14px"';} ?>> <?php echo $contact['firstname']; ?></td>
            <td class="left" <?php if ($contact['is_read'] == 0){echo 'style="font-size:16px;"';}else{'style="font-size:14px"';} ?>> <?php echo $contact['email'] ?></td>
            <td class="left" <?php if ($contact['is_read'] == 0){echo 'style="font-size:16px;"';}else{'style="font-size:14px"';} ?>> <?php echo $contact['ipaddress'] ?></td>
            <td class="left"><?php $contact_message = $contact['enquiry']; $message = substr($contact_message, 0,'54');  echo $message; ?>...</td>
               <td class="center">  
              <a class="reds-btn2" href="<?php echo $contact['view'] ?>"> <?php echo $button_view; ?></a> 
              <a class="reds-btn2" href="<?php echo $contact['reply'] ?>"> <?php echo $button_reply; ?></a>
              </td> 
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>