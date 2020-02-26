<?php if (count($languages) > 1) { ?>
<div class="btn-group">
	<a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#"><?php echo $text_language; ?> <span class="caret"></span></a>
	<ul class="dropdown-menu dropdown-menu-right">
		<?php foreach ($languages as $language) { ?>
			<?php if ($language['code'] == $language_code) { ?>
				<li><a><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>"> <b><?php echo $language['name']; ?></b></a></li>
			<?php } else { ?>
				<li><a onclick="$('input[name=\'language_code\']').val('<?php echo $language['code']; ?>');$('#language').submit();"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>"> <?php echo $language['name']; ?></a></li>
			<?php } ?>
		<?php } ?>
	</ul>
	<form class="hide" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
		<input type="hidden" name="language_code" value="">
		<input type="hidden" name="redirect" value="<?php echo $redirect; ?>">
	</form>
</div>
<?php } ?>