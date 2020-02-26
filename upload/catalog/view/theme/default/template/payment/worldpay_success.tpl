<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<meta http-equiv="refresh" content="5;url=<?php echo $continue; ?>">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>">
</head>
<body>
<div class="text-center">
	<div class="page-header"><h2><?php echo $heading_title; ?></h2></div>
	<div class="alert alert-warning"><?php echo $text_response; ?></div>
	<p><WPDISPLAY ITEM=banner></p>
	<div style="alert"><?php echo $text_success; ?></div>
	<p><?php echo $text_success_wait; ?></p>
</div>
</body>
</html>