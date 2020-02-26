<form action="<?php echo $action; ?>" method="post">
	<input type="hidden" name="operation_xml" value="<?php echo $xml; ?>">
	<input type="hidden" name="signature" value="<?php echo $signature; ?>">
	<input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary btn-lg btn-block">
</form>
