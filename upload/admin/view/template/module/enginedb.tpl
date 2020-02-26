<?php echo $header; ?>
<div id="content">

  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } if($success != '') {  ?>
	<div class="success"><?=$success?></div>
  <?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
      	<a href="../../light/xturbo.php" class="reds-btn3" " target="_blank" onclick="return confirm('You are opening a new Page now!');"><span style="color:#FFFFFF"> Full Database Indexer</span></a> 
      	<input name="button_innodb" type="submit" class="reds-btn2" value="<?=$button_myisam?>" /> 
      	<input name="button_myisam" type="submit" class="reds-btn" value="<?=$button_innodb?>" />
      </div>
    </div>
    <div class="content">
      		<div class="engine">
      		<h3>Engine : Myisam</h3>
      		<div class="myisam">
      		<?php foreach ($myisam as $key => $value) { ?>
      			
      			<div class="even"><label><input type="checkbox" name="myisam[]" value="<?=$value?>" >
      			<?=$value?></label></div>

      		<?php } ?>

      		</div>
      		<div class="check_all">
       			<label><input id="check_all_myisam" type="checkbox" name="check_all_myisam" ><a>Check ALL</a></label>
       		</div>
      		</div>
      		<div class="engine">
      		<h3>Engine : InnoDB</h3>
      		<div class="innodb">
      		<?php foreach ($innodb as $value) { ?>
 				<div class="even"><label><input type="checkbox" name="innodb[]" value="<?=$value?>" >
      			<?=$value?></label></div>

      		<?php } ?>


      		</div>
       		<div class="check_all">
       			<label><input id="check_all_innodb" type="checkbox" name="check_all_innodb" ><a>Check ALL</a></label>
       		</div>
			</div>
  	</div>
  </div>
  </form>
</div>
<script type="text/javascript">
	$('#check_all_myisam').click (function () {
     	var checkedStatus = this.checked;
	    $('.myisam .even').find(':checkbox').each(function () {
	        $(this).prop('checked', checkedStatus);
	     });
	});
	$('#check_all_innodb').click (function () {
     	var checkedStatus = this.checked;
	    $('.innodb .even').find(':checkbox').each(function () {
	        $(this).prop('checked', checkedStatus);
	     });
	});
</script>

<style>
.engine{
  width: 350px;
  float: left;
  margin: 20px;
}
.myisam ,.innodb{
  border: 1px solid #CCCCCC;
  width: 350px;
  height: 250px;
  background: #FFFFFF;
  overflow-y: scroll;
}
.even:nth-child(2n){
  background:#E4EEF4;
}
.check_all{padding: 5px 0px;}
.engine input{vertical-align: -11%;}
.engine label{line-height: 2}

input.button{
  text-decoration: none;
  color: #FFF;
  display: inline-block;
  padding: 5px 15px;
  background: #003A88;
  border-radius: 10px 10px 10px 10px;
  outline: none;
  border:none;
}
.butt{
  text-decoration: none;
  color: #FFF;
  display: inline-block;
  padding: 5px 15px;
  background: #003A88;
  border-radius: 10px 10px 10px 10px;
  outline: none;
  border:none;
}
</style>
<?php echo $footer; ?>