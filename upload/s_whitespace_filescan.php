<?php
header('Content-Type: text/plain');
	$dir_iterator = new RecursiveDirectoryIterator("./");
	$iterator = new RecursiveIteratorIterator($dir_iterator, RecursiveIteratorIterator::SELF_FIRST);
	$count=0;
	foreach ($iterator as $file) {
	$count++;
	if (!preg_match('#\.php$#', $file)) continue;
	$contents = file_get_contents($file);
	if (preg_match('#^\s+<\?php#', $contents)) {
	echo $file .' (Whitespace before opening <?php at BOF)'. PHP_EOL;
	}
	if (preg_match('#\?>\s+$#', $contents)) {
	echo $file .' (Whitespace after closing ?> at EOF)'. PHP_EOL;
	}
	}
	echo "$count files scanned" . PHP_EOL;
?>