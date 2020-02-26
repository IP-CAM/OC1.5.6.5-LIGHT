<?php echo $header; ?>
<div class="row">

	<?php echo $column_left; ?>
<div class="col-sm-<?php $span = trim($column_left) ? 9 : 12; $span = trim($column_right) ? $span - 3 : $span; echo $span; ?>">
	<?php include(DIR_TEMPLATE . 'default/template/common/template-heading.tpl'); ?>

<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

    <h1><?php echo $heading_title; ?></h1>
<div class="table-responsive" style="text-align:center;">
    <table class="table table-bordered table-hover">
    <tr>
    <td class="text-center">
	<?php echo $text_account_verified; ?>
	<p><a href="<?php echo $login; ?>"><?php echo $login; ?></a></p>
	</td>
	</tr>
	</table>
	</div>
	</div>

<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
<?php echo $footer; ?>