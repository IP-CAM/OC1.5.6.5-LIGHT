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

    <div class="buttons"><a onclick="$('#form').submit();" ></a>
    <a href="<?php echo $reply; ?>" class="button"><?php echo $button_reply; ?></a> 
    <a onclick="$('#execute').val('delete');$('#form').submit();" class="button"><?php echo $button_delete; ?></a> 
    <a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
    </div>
      <h1><img src="view/image/shipping.png" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
     <form action="<?php echo $execute; ?>" method="post" enctype="multipart/form-data" id="form">
     <input type="hidden" name="execute" id="execute" />
           <?php if ($single_data) { ?>
          <?php foreach ($single_data as $contact) { ?>
             <p>
                <label><?php echo $column_name; ?></label>
          <span class="field"><input type="text" name="bannerTitle" id="bannerTitle" value="<?php echo $contact['firstname']; ?>" class="input-large" readonly /></span>
                     </p>
                         <p>
                <label><?php echo $column_email; ?></label>
          <span class="field"><input type="text" name="bannerTitle" id="bannerTitle" value="<?php echo $contact['email'] ?>" class="input-large" readonly /></span>
                     </p>
                        <p>
                <label><?php echo $column_ip; ?></label>
          <span class="field"><input type="text" name="bannerTitle" id="bannerTitle" value="<?php echo $contact['ipaddress'] ?>" class="input-large" readonly /></span>
                     </p>
                         <p>
                <label><?php echo $column_description; ?></label>
          <span class="field">
          <textarea name="enquiry" class="input-large" style="width:71%;height:150px;" readonly > <?php echo $contact['enquiry']; ?>  </textarea>
          </span>
                     </p>
          <p class="center">
          <a  href="<?php $reply = $this->url->link('module/contact/contact_reply', 'token=' . $this->session->data['token'].'&id='.$contact['contact_id'], 'SSL') ?>">
              </a> 
                  </p>
                      <?php } ?>
          <?php } else { ?>
          <?php echo $text_no_results; ?>
    <?php } ?>
    </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>
<style type="text/css">

.content p label {
    background: none repeat scroll 0 0 #F4F4F4;
    clear: both;
    display: inline-block;
    float: left;
    margin-bottom: 5px;
    margin-right: 10px;
    padding: 10px;
    text-align: left;
    width: 150px;
}

 input[type="text"] {
   background: none repeat scroll 0 0 #F4F4F4;
    border: medium none;
    box-shadow: none;
    height: 30px;
    padding-left: 5px;
    width: 300px;
}
textarea{
background: none repeat scroll 0 0 #F4F4F4;	
border: medium none;
 box-shadow: none;
}
.right {
    display: block;
    margin-left: 751px;

}
</style>