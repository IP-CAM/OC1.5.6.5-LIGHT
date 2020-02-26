<?php

// VQMOD PRO Install
if (!file_exists(substr(DIR_SYSTEM,0,-7).'vqmod/pro.cache') || filemtime(substr(DIR_SYSTEM,0,-7).'vqmod/pro.cache') < time() - 180) {

    $root = substr(DIR_SYSTEM,0,-7);
    // Find admin folder
    $admin_folder = 'admin';
    if (!file_exists($admin_folder.'/config.php') or !file_exists($admin_folder.'/index.php')) {
        // Find admin folder
        $admin_folder = false;
        $folders = glob($root.'*', GLOB_ONLYDIR);
        foreach ($folders as $folder)
            if (file_exists($folder.'/config.php') && file_exists($folder.'/index.php') && file_exists($folder.'/php.ini')) {
                $admin_folder = substr($folder, strlen($root));
                break;
            }
        if (!$admin_folder) vqmod_install_result("* No Admin Folder", "<b>vQmod Pro</b> has scanned your root folders and there is no <b>admin</b> folder there. <br/>Please make sure that your admin folder has <b>config.php</b> file.");
    }

    if (!is_writable($root.'vqmod')) vqmod_install_result("* vqmod Folder not Writable", "Set <b>vqmod</b> folder and all it contents writable (<b>755</b>) permission.");
    if (!is_writable($root.'vqmod/xml')) vqmod_install_result("* vqmod/xml Folder not Writable", "Set <b>vqmod/xml</b> folder and all it contents writable (<b>755</b>) permission.");
    if (!is_writable($root.'vqmod/vqcache')) vqmod_install_result("* vqmod/vqcache Folder not Writable", "Set <b>vqmod/vqcache</b> folder and all it contents writable (<b>755</b>) permission.");
    if (!is_writable($root.'vqmod/logs')) vqmod_install_result("* vqmod/logs Folder not Writable", "Set <b>vqmod/logs</b> folder and all it contents writable (<b>755</b>) permission.");

    // INDEX.PHP
    $index_file = $root.'index.php';
    $index = file_get_contents($index_file);
    if ((!strpos($index, 'vqmod.php') or strpos($index, '$vqmod->'))) {
        if (!is_writable($index_file)) vqmod_install_result("* Root index.php File not Writable", "Set root <b>index.php</b> file writable (<b>644</b>) permission.");
        if (strpos($index, '$vqmod->')) {
            $index = str_replace('$vqmod->', 'VQMod::', $index);
            $index = str_replace('$vqmod = new VQMod()', 'VQMod::bootup()', $index);
        }
        elseif (!strpos($index, 'vqmod.php')) {
            $index = preg_replace('~// Startup~', '//VirtualQMOD
require_once(\'./vqmod/vqmod.php\');
VQMod::bootup();

// VQMODDED Startup', $index);
            $index = preg_replace('/require_once\(DIR_SYSTEM \. \'([^\']+)\'\);/', 'require_once(VQMod::modCheck(DIR_SYSTEM . \'$1\'));', $index);
        }
        file_put_contents($index_file, $index);
    }

    // ADMIN/INDEX.PHP
    $index_file = $root.'/'.$admin_folder.'/index.php';
    $index = file_get_contents($index_file);
    if ((!strpos($index, 'vqmod.php') or strpos($index, '$vqmod->'))) {
        if (!is_writable($index_file)) vqmod_install_result("* $admin_folder/index.php File not Writable", "Set <b>$admin_folder/index.php</b> file writable (<b>644</b>) permission.");
        if (strpos($index, '$vqmod->')) {
            $index = str_replace('$vqmod->', 'VQMod::', $index);
            $index = str_replace('$vqmod = new VQMod()', 'VQMod::bootup()', $index);
        }
        elseif (!strpos($index, 'vqmod.php')) {
            $index = preg_replace('~// Startup~', '//VirtualQMOD
require_once(\'../vqmod/vqmod.php\');
VQMod::bootup();

// VQMODDED Startup', $index);
            $index = preg_replace('/require_once\(DIR_SYSTEM \. \'([^\']+)\'\);/', 'require_once(VQMod::modCheck(DIR_SYSTEM . \'$1\'));', $index);
        }
        file_put_contents($index_file, $index);
    }

    if (!file_exists($root.'/vqmod/pro.cache')) {
        $replaces_file = $root.'vqmod/pathReplaces.php';
        if ($admin_folder != 'admin' && file_exists($replaces_file)) { // Write replaces
            $replaces = file_get_contents($replaces_file);
            $p = strpos($replaces, '**/');
            if (!strpos($replaces, "'$admin_folder", $p)) {
                $replaces = str_replace('START REPLACES //', "START REPLACES //\n$"."replaces[] = array('~^admin\\b~', '$admin_folder'); // Added by vQmod Pro", $replaces);
                file_put_contents($replaces_file, $replaces);
            }
        }
        file_put_contents($root.'/vqmod/pro.cache','');
        vqmod_install_result('vQmod Pro Installed', 'Congratulations! <b>vQmod Pro</b> has been installed successfully. <br/> Now you have optimal performance with vQmod extensions.');
    }
    touch($root.'/vqmod/pro.cache', time()-60);
}

function vqmod_install_result($title, $message) {
    $error = ($title[0] == '*');
    if ($error) $title = substr($title,2);
    echo '<!DOCTYPE html><head><title>vQmod Pro</title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    </head><body><div class="container"><div class="header clearfix"><h3 class="text-muted">vQmod Pro <span class="label label-default">2.6.4</span></h3></div>
	<div class="jumbotron">';
    if ($error) echo '<h1 style="color:#be0101">'; else echo '<h1 class="text-primary">';
    echo $title.'</h1><p>'.$message.'</p><a class="btn btn-lg ';
    if ($error) echo 'btn-danger'; else echo 'btn-success';
    echo '" role="button" onclick="location.reload();"><span class="glyphicon ';
    if ($error) echo 'glyphicon-repeat'; else echo 'glyphicon-ok';
    echo '"></span>&nbsp;&nbsp; ';
    if ($error) echo 'Fixed, check again!'; else echo 'Continue';
    echo '</a></div><footer class="footer"><p>&copy; MaxD 2016</p></footer></div></body></html>';
    exit;
}

// end VQMOD PRO


if (!function_exists('json_encode')) {
	function json_encode($data) {
		switch (gettype($data)) {
			case 'boolean':
				return $data ? 'true' : 'false';
			case 'integer':
			case 'double':
				return $data;
			case 'resource':
			case 'string':
				# Escape non-printable or Non-ASCII characters.
				# I also put the \\ character first, as suggested in comments on the 'addclashes' page.
				$json = '';

				$string = '"' . addcslashes($data, "\\\"\n\r\t/" . chr(8) . chr(12)) . '"';

				# Convert UTF-8 to Hexadecimal Codepoints.
				for ($i = 0; $i < strlen($string); $i++) {
					$char = $string[$i];
					$c1 = ord($char);

					# Single byte;
					if ($c1 < 128) {
						$json .= ($c1 > 31) ? $char : sprintf("\\u%04x", $c1);

						continue;
					}

					# Double byte
					$c2 = ord($string[++$i]);

					if (($c1 & 32) === 0) {
						$json .= sprintf("\\u%04x", ($c1 - 192) * 64 + $c2 - 128);

						continue;
					}

					# Triple
					$c3 = ord($string[++$i]);

					if (($c1 & 16) === 0) {
						$json .= sprintf("\\u%04x", (($c1 - 224) <<12) + (($c2 - 128) << 6) + ($c3 - 128));

						continue;
					}

					# Quadruple
					$c4 = ord($string[++$i]);

					if (($c1 & 8 ) === 0) {
						$u = (($c1 & 15) << 2) + (($c2 >> 4) & 3) - 1;

						$w1 = (54 << 10) + ($u << 6) + (($c2 & 15) << 2) + (($c3 >> 4) & 3);
						$w2 = (55 << 10) + (($c3 & 15) << 6) + ($c4 - 128);

						$json .= sprintf("\\u%04x\\u%04x", $w1, $w2);
					}
				}

				return $json;
			case 'array':
				if (empty($data) || array_keys($data) === range(0, sizeof($data) - 1)) {
					$output = array();

					foreach ($data as $value) {
						$output[] = json_encode($value);
					}

					return '[' . implode(',', $output) . ']';
				}
			case 'object':
				$output = array();

				foreach ($data as $key => $value) {
					$output[] = json_encode(strval($key)) . ':' . json_encode($value);
				}

				return '{' . implode(',', $output) . '}';
			default:
				return 'null';
		}
	}
}

if (!function_exists('json_decode')) {
	function json_decode($json, $assoc = false) {
		$match = '/".*?(?<!\\\\)"/';

		$string = preg_replace($match, '', $json);
		$string = preg_replace('/[,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t]/', '', $string);

		if ($string != '') {
			return null;
		}

		$s2m = array();
		$m2s = array();

		preg_match_all($match, $json, $m);

		foreach ($m[0] as $s) {
			$hash = '"' . md5($s) . '"';
			$s2m[$s] = $hash;
			$m2s[$hash] = str_replace('$', '\$', $s);
		}

		$json = strtr($json, $s2m);

		$a = ($assoc) ? '' : '(object) ';

		$data = array(
			':' => '=>',
			'[' => 'array(',
			'{' => "{$a}array(",
			']' => ')',
			'}' => ')'
		);

		$json = strtr($json, $data);

		$json = preg_replace('~([\s\(,>])(-?)0~', '$1$2', $json);

		$json = strtr($json, $m2s);

		$function = @create_function('', "return {$json};");
		$return = ($function) ? $function() : null;

		unset($s2m);
		unset($m2s);
		unset($function);

		return $return;
	}
}
?>