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
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/backup.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="location = '<?php echo $refresh; ?>';" class="button"><?php echo $button_refresh; ?></a>
      </div>
    </div>
    <div class="content">
      <?php if ($success_optimize) { ?>
        <div class="success" style="margin-top:10px;"><?php echo $success_optimize; ?></div>
      <?php } ?>
      <?php if ($success_repair) { ?>
        <div class="success" style="margin-top:10px;"><?php echo $success_repair; ?></div>
      <?php } ?>
      <?php if ($success_innodb) { ?>
        <div class="success" style="margin-top:10px;"><?php echo $success_innodb; ?></div>
      <?php } ?>
      <?php if ($success_myisam) { ?>
        <div class="success" style="margin-top:10px;"><?php echo $success_myisam; ?></div>
      <?php } ?>
	  
      <form action="<?php echo $database; ?>" method="post" enctype="multipart/form-data" id="form" name="database">
        <h2><?php echo $text_optimize; ?></h2>
        <table class="form">
          <tr style="text-align:left;">
            <td width="20%"><b><?php echo $text_optimize; ?></b></td>
            <td width="55%"><?php echo $text_help_optimize; ?></td>
            <td width="25%"><a onclick="Optimize();" class="button"><?php echo $button_optimize; ?> DB</a>
            </td>
          </tr>
        </table>

        <h2><?php echo $text_repair; ?></h2>
   		<table class="form">
          <tr style="text-align:left;">
            <td width="20%"><b><?php echo $text_repair; ?></b></td>
            <td width="55%"><?php echo $text_help_repair; ?></td>
            <td width="25%">
              <a onclick="Repair();" class="button"><?php echo $button_repair; ?> DB</a>
            </td>
          </tr>
        </table>
		
		<h2><?php echo $text_engine; ?></h2>
        <table class="form">
          <tr style="text-align:left;">
            <td width="20%"><b><?php echo $text_table_engine; ?></b></td>
		  <?php if (!$engine) { ?>
			<td width="55%"><?php echo $text_help_myisam; ?></td>
			<td width="25%"><a onclick="Innodb();" class="button"><?php echo $button_innodb; ?> DB</a></td>
		  <?php } else { ?>
			<td width="55%"><?php echo $text_help_innodb; ?></td>
			<td width="25%"><a onclick="Myisam();" class="button"><?php echo $button_myisam; ?> DB</a></td>
		  <?php } ?>
          </tr>
        </table>
        <input type="hidden" name="buttonForm" value="" />
      </form>

	  <h2>Add Indexes to Database</h2>
	<table class="form">
	<tr style="text-align:left;">
	<td width="20%"><b>Add DB Indexes</b></td>
	<td width="55%">OpenCart DB-Turbo - by <a title="Opencart Turbo by Atomix" href="http://www.atomix.com.au" target="_blank">Atomix</a></td>
	<td width="25%"><a class="button" href="turbo.php?action=indexes" onclick="return confirm('Are you sure you want to add Indexes to your Opencart database tables?');">Indexes DB</a>
	</td></tr>
	</table>
	</div>
	</div>
	
	<script type="text/javascript"><!--
function Optimize() {
	document.database.buttonForm.value='optimize';
	$('#form').submit();
}
function Repair() {
	document.database.buttonForm.value='repair';
	$('#form').submit();
}
function Innodb() {
	document.database.buttonForm.value='innodb';
	$('#form').submit();
}
function Myisam() {
	document.database.buttonForm.value='myisam';
	$('#form').submit();
}
//--></script>

<?php echo $footer; ?>