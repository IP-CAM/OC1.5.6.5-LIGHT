<?php
## Function to set file permissions to 0644 and folder permissions to 0755
function AllDirChmod( $dir = "./", $dirModes = 0755, $fileModes = 0644 ){
	$d = new RecursiveDirectoryIterator( $dir );
	foreach( new RecursiveIteratorIterator( $d, 1 ) as $path ){
	if( $path->isDir() ) chmod( $path, $dirModes );
	else if( is_file( $path ) ) chmod( $path, $fileModes );
	}
}

## Function to clean out the contents of specified directory
function cleandir($dir) {
	if ($handle = opendir($dir)) {
	while (false !== ($file = readdir($handle))) {
	if ($file != '.' && $file != '..' && is_file($dir.'/'.$file)) {
	if (unlink($dir.'/'.$file)) { }
	else { echo $dir . '/' . $file . ' (file) NOT deleted!<br />'; }
	}
	else if ($file != '.' && $file != '..' && is_dir($dir.'/'.$file)) {
	cleandir($dir.'/'.$file);
	if (rmdir($dir.'/'.$file)) { }
	else { echo $dir . '/' . $file . ' (directory) NOT deleted!<br />'; }
	}
	}
	closedir($handle);
	}
}

function isDirEmpty($dir){
	 return (($files = @scandir($dir)) && count($files) <= 2);
	}
	echo "----------------------- CLEANUP START -------------------------<br/>";
	$start = (float) array_sum(explode(' ',microtime()));
	echo "<br/>*************** SETTING PERMISSIONS ***************<br/>";
	echo "Setting all folder permissions to 755<br/>";
	echo "Setting all file permissions to 644<br/>";
	AllDirChmod( "." );
	echo "<br/>****************** CLEARING CACHE ******************<br/>";


if (file_exists("system/cache")) {
	echo "Clearing system/cache<br/>";
	cleandir("system/cache");
}

if (file_exists("system/storage/cache")) {
	echo "Clearing system/storage/cache<br/>";
	cleandir("system/storage/cache");
}

if (file_exists("system/storage/modification")) {
	echo "Clearing system/storage/modification<br/>";
	cleandir("system/storage/modification");
}

if (file_exists("image/cache/data")) {
	echo "Clearing image/cache/data<br/>";
	cleandir("image/cache/data");
}

if (file_exists("image/cache/catalog/demo")) {
	echo "Clearing image/cache/catalog/demo<br/>";
	cleandir("image/cache/catalog/demo");
}

if (file_exists("vqmod/vqcache")) {
	echo "Clearing vqmod/vqcache<br/>";
	cleandir("vqmod/vqcache");
}

if (file_exists("vqmod/checked.cache")) {
	echo "Clearing vqmod/checked.cache<br/>";
	unlink("vqmod/checked.cache");
}

if (file_exists("vqmod/mods.cache")) {
	echo "Clearing vqmod/mods.cache<br/>";
	unlink("vqmod/mods.cache");
}

if (file_exists("vqmod/pro.cache")) {
	echo "Clearing vqmod/pro.cache<br/>";
	unlink("vqmod/pro.cache");
}
	$end = (float) array_sum(explode(' ',microtime()));
	echo "<br/>------------------- CLEANUP COMPLETED in:". sprintf("%.4f", ($end-$start))." seconds ------------------<br/>";
?>