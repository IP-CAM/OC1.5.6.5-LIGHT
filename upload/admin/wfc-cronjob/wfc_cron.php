<?php
/*
 *
 * @category   OOA
 * @package    OOA_WebFileChecker OpenCart
 * @copyright  Open Software (2016)
 *
 */

ini_set("memory_limit","1024M");
ini_set("max_execution_time","1800"); // 30 minutes

// email variables
define('ENTRY_EMAIL_ADDRESS_CHECK', 'false');
define('SEND_EMAILS', 'true');
define('EMAIL_LINEFEED', 'LF');
define('EMAIL_TRANSPORT', 'sendmail');
define('EMAIL_USE_HTML', 'true');
define('CHARSET', 'iso-8859-1');

// email classes
require('includes/classes/' . 'mime.php');
require('includes/classes/' . 'email.php');
require('../' . 'config.php');

// database settings
define('CHECK_CONFIGURATION', 'Y'); // N = NO, Y = Yes (DB settings used)
define('CHECK_CONFIGURATION_FILE', 'setting'); // configuration table read 

// module settings
define('MODULE_OOA_WEBFILECHECKER_EMAIL_ADDRESS', ''); // email adresses ; separated (or empty)
define('MODULE_OOA_WEBFILECHECKER_FILE_TYPES', 'php,sh,htm,html,phtml,js,xml,htaccess,ini,css,swf,json'); // type of file to check
define('MODULE_OOA_WEBFILECHECKER_LOG_SIZE', '10'); // max. size log file 

// language variables
define('MODULE_OOA_WEBFILECHECKER_EMAIL_SUBJECT1', 'WebFileChecker, no modifications found!');
define('MODULE_OOA_WEBFILECHECKER_EMAIL_SUBJECT21', 'WebFileChecker, modifications found, see context and attached list in next email!');
define('MODULE_OOA_WEBFILECHECKER_EMAIL_SUBJECT22', 'WebFileChecker, modifications found, see context and attached list!');
define('MODULE_OOA_WEBFILECHECKER_EMAIL_SUBJECT3', 'WebFileChecker, all new, email for the first run too long (see log)!');
define('MODULE_OOA_WEBFILECHECKER_TITLE', 'Checked at');
define('MODULE_OOA_WEBFILECHECKER_ADDED_FILES', 'Added files');
define('MODULE_OOA_WEBFILECHECKER_REMOVED_FILES', 'Removed files');
define('MODULE_OOA_WEBFILECHECKER_CHANGED_FILES', 'Changed files');
define('MODULE_OOA_WEBFILECHECKER_ADDED_CONF', 'Added configuration settings');
define('MODULE_OOA_WEBFILECHECKER_REMOVED_CONF', 'Removed configuration settings');
define('MODULE_OOA_WEBFILECHECKER_CHANGED_CONF', 'Changed configuration settings');

// time zone
define('TIME_ZONE', 'Europe/Amsterdam');

$wfc = new wfc();

$wfc->execute();

class wfc {

	public $chgdir;
	public $email_subject1;
	public $email_subject2;
	public $email_address_list;
	public $modifications_list;
	public $modifications_email;
	public $file_types;
	public $log_size;
	public $title;

	public $handle_r;
	public $handle_m;

	public $ooa_webfilechecker_modifications_log;
	public $ooa_webfilechecker_modifications_log_name;
	public $ooa_webfilechecker_reference_log;
	public $ooa_webfilechecker_reference_conf_log;
	
	// New wrapper around email class to handle string attachments.
	// Additional parameters:
	// $string = string data (ascii or binary)
	// $filename = target filename for attached data
	public function tep_mail_string_attachment($to_name, $to_email_address, $email_subject, $email_text, $from_email_name, $from_email_address, $string, $filename) {
		if (SEND_EMAILS != 'true') return false;
	
		// Instantiate a new mail object
		$message = new email(array('X-Mailer: osCommerce'));
	
		// Build the text version
		$text = strip_tags($email_text);
		if (EMAIL_USE_HTML == 'true') {
			$message->add_text($text);
		} else {
			$message->add_text($text);
		}
	
		if ($string != '') {
			$message->add_attachment($string, $filename);
		}	
	
		// Send message
		$message->build_message();
		$message->send($to_name, $to_email_address, $from_email_name, $from_email_address, $email_subject);
	}
	
	public function execute() { // called by cron schedule

		$this->chgdir = dirname(dirname(dirname(__FILE__))); // main directory
		chdir($this->chgdir);
	
		date_default_timezone_set(TIME_ZONE);
		
		$this->email_subject1 = MODULE_OOA_WEBFILECHECKER_EMAIL_SUBJECT1;
		$this->email_subject21 = MODULE_OOA_WEBFILECHECKER_EMAIL_SUBJECT21;
		$this->email_subject22 = MODULE_OOA_WEBFILECHECKER_EMAIL_SUBJECT22;
		$this->email_subject3 = MODULE_OOA_WEBFILECHECKER_EMAIL_SUBJECT3;
		$this->email_address_list = MODULE_OOA_WEBFILECHECKER_EMAIL_ADDRESS;

		$this->file_types = MODULE_OOA_WEBFILECHECKER_FILE_TYPES;
		$this->log_size = (float)MODULE_OOA_WEBFILECHECKER_LOG_SIZE;

		$this->ooa_webfilechecker_modifications_log = dirname(__FILE__) . "/ooa_wfc_mod.log";
		$this->ooa_webfilechecker_modifications_log_name = dirname(__FILE__) . "/ooa_wfc_mod";
		$this->ooa_webfilechecker_reference_log = dirname(__FILE__) . "/ooa_wfc_ref.log";
		$this->ooa_webfilechecker_reference_conf_log = dirname(__FILE__) . "/ooa_wfc_ref_conf.log";

		$this->Scan();
		
		try {
			if ($this->email_address_list) {
				$addresses = preg_split('/[,;]/', $this->email_address_list);
				for ($i=0; $i<sizeof($addresses); $i+=1) {
					$subject = "";
					if ($this->modifications_list == '') {
						$subject = $this->email_subject1 . "(" . $this->title . ")";
						$this->tep_mail_string_attachment('', $addresses[$i], $subject, '', '', '', '', '');
					} elseif ($this->modifications_list == 'first_run') {
						$subject = $this->email_subject3 . "(" . $this->title . ")";
						$this->tep_mail_string_attachment('', $addresses[$i], $subject, '', '', '', '', '');
					} else {
						$subject1 = $this->email_subject21 . "(" . $this->title . ")";
						$subject2 = $this->email_subject22 . "(" . $this->title . ")";
						$this->tep_mail_string_attachment('', $addresses[$i], $subject1, $this->modifications_email, '', '', '', '');
						$this->tep_mail_string_attachment('', $addresses[$i], $subject2, $this->modifications_email, '', '', $this->modifications_list, 'modifications.txt');
					}
				}	
			}
		} catch(Exception $e) {
			throw $e;
		}
		
		// free memory
		unset($this->modifications_list);
		unset($this->modifications_email);
		
		exit();
	}

	public function Scan() {

		$file_types_array = explode(",", preg_replace("/\s+/", "", $this->file_types));

		$ref_array = array();
		$dir_array = array();
		$files_array = array();
		$files_date_array = array();

		$first_run = false;

		try {
			if (!file_exists($this->ooa_webfilechecker_modifications_log)) {
				$first_run = true;
			}
			if (file_exists($this->ooa_webfilechecker_modifications_log) and ((filesize($this->ooa_webfilechecker_modifications_log) / (1024*1024)) >= $this->log_size)) {
				rename($this->ooa_webfilechecker_modifications_log, $this->ooa_webfilechecker_modifications_log_name . "_" . date("Ymd") . "_" . date("His") . ".log");
			}

			$this->handle_r = fopen($this->ooa_webfilechecker_reference_log, "a"); // create file first time
			fclose($this->handle_r);
			$this->handle_m = fopen($this->ooa_webfilechecker_modifications_log, "a");
			$this->handle_r = fopen($this->ooa_webfilechecker_reference_log, "r");
			$dir_handle = opendir($this->chgdir);
		} catch(Exception $e) {
			throw $e;
		}

		$dir_string = $this->chgdir;
		while (($entry = readdir($dir_handle)) !== false) {
			if ($entry != '.' and $entry != '..') {
				if (is_dir($dir_string . "/" . $entry)) {
					if (!in_array($dir_string . "/" . $entry, $dir_array)) {
						array_push($dir_array, $dir_string . "/" . $entry);
					}
				} else {
					if (in_array(substr(strrchr($entry, '.'), 1), $file_types_array, true) == true){
						if (!in_array($dir_string . "/" . $entry, $files_array)) {
							array_push($files_array, $dir_string . "/" . $entry);
							array_push($files_date_array, " ( " . date("Y-m-d H:i:s", filemtime($dir_string . "/" . $entry)) . " )");
						}
					}
				}
			}
		}
		closedir($dir_handle);

		if (count($dir_array) == 1 and (!isset($dir_array[0]) or $dir_array[0] == '')) {
			$dir_array = array();
		}
		if (count($files_array) == 1 and (!isset($files_array[0]) or $files_array[0] == '')) {
			$files_array = array();
		}

		for ($i=0; $i<count($dir_array); $i++) {
			try {
				$dir_handle = opendir($dir_array[$i]);
			} catch(Exception $e) {
				throw $e;
			}

			$dir_string = $dir_array[$i];
			while (($entry = readdir($dir_handle)) !== false) {
				if ($entry != '.' and $entry != '..') {
					if (is_dir($dir_string . "/" . $entry)) {
						if (!in_array($dir_string . "/" . $entry, $dir_array)) {
							array_push($dir_array, $dir_string . "/" . $entry);
						}
					} else {
						if (in_array(substr(strrchr($entry, '.'), 1), $file_types_array, true) == true){
							if (!in_array($dir_string . "/" . $entry, $files_array)){
								array_push($files_array, $dir_string . "/" . $entry);
								array_push($files_date_array, " (" . date("Y-m-d H:i:s", filemtime($dir_string . "/" . $entry)) . ")");
							}
						}
					}
				}
			}
			closedir($dir_handle);
		}

		if (count($dir_array) == 1 and (!isset($dir_array[0]) or $dir_array[0] == '')) {
			$dir_array = array();
		}
		if (count($files_array) == 1 and (!isset($files_array[0]) or $files_array[0] == '')) {
			$files_array = array();
		}

		for ($i=0; $i<count($files_array); $i++) {
			array_push($ref_array, md5_file($files_array[$i]));
		}

		$added_array = array();
		$removed_array = array();
		$changed_array = array();
		$files_array2 = array();
		$ref_array2 = array();

		$i = 0;
		while (!feof($this->handle_r)) {
			$files_array2[$i] = trim(fgets($this->handle_r));
			$ref_array2[$i] = trim(fgets($this->handle_r));
			$i++;
		}
		fclose($this->handle_r);

		if (count($files_array2) == 1 and (!isset($files_array2[0]) or $files_array2[0] == '')) {
			$files_array2 = array();
		}
		if (count($ref_array2) == 1 and (!isset($ref_array2[0]) or $ref_array2[0] == '')) {
			$ref_array2 = array();
		}

		if (count($files_array) > count($files_array2)) {
			do {
				array_push($files_array2, "");
				array_push($ref_array2, "");
			} while (count($files_array) > count($files_array2));
		} elseif (count($files_array2) > count($files_array)) {
			do {
				array_push($files_array, "");
				array_push($ref_array, "");
			} while (count($files_array2) > count($files_array));
		}

		for ($i=0; $i<count($files_array); $i++) {
			if ($files_array[$i] != '') {
				if (!in_array($files_array[$i], $files_array2)) {
					array_push($added_array, $files_array[$i] . $files_date_array[$i]);
				}
			}
			if ($files_array2[$i] != '') {
				if (!in_array($files_array2[$i], $files_array)) {
					array_push($removed_array, $files_array2[$i] . " (" . date("Y-m-d H:i:s") . ")");
				}
			}
			if ($ref_array[$i] != '') {
				$indexs = array_search($files_array[$i], $files_array2);
				if ($indexs != false) {
					if ($ref_array[$i] != $ref_array2[$indexs]) {
						array_push($changed_array, $files_array[$i] . $files_date_array[$i]);
					}
				}
			}
		}

		if (count($added_array) == 1 and (!isset($added_array[0]) or $added_array[0] == '')) {
			$added_array = array();
		}
		if (count($removed_array) == 1 and (!isset($removed_array[0]) or $removed_array[0] == '')) {
			$removed_array = array();
		}
		if (count($changed_array) == 1 and (!isset($changed_array[0]) or $changed_array[0] == '')) {
			$changed_array = array();
		}

		$this->title = MODULE_OOA_WEBFILECHECKER_TITLE . " " . date("d F Y") . " " . date("H:i:s");

		$this->modifications_list = $this->title . "\r\n\r\n";
		$this->modifications_email = $this->title . "<br><br>";
		$mods = 0;
		if (count($added_array) > 0) {
			$mods++;
			$this->modifications_list .= MODULE_OOA_WEBFILECHECKER_ADDED_FILES . ":" . "\r\n" . implode("\r\n", $added_array) . "\r\n\r\n";
			$this->modifications_email .= MODULE_OOA_WEBFILECHECKER_ADDED_FILES . ":" . "<br>" . implode("<br>", $added_array) . "<br><br>";
		}
		if (count($removed_array) > 0) {
			$mods++;
			$this->modifications_list .= MODULE_OOA_WEBFILECHECKER_REMOVED_FILES . ":" . "\r\n" . implode("\r\n", $removed_array) . "\r\n\r\n";
			$this->modifications_email .= MODULE_OOA_WEBFILECHECKER_REMOVED_FILES . ":" . "<br>" . implode("<br>", $removed_array) . "<br><br>";
		}
		if (count($changed_array) > 0) {
			$mods++;
			$this->modifications_list .= MODULE_OOA_WEBFILECHECKER_CHANGED_FILES . ":" . "\r\n" . implode("\r\n", $changed_array) . "\r\n\r\n";
			$this->modifications_email .= MODULE_OOA_WEBFILECHECKER_CHANGED_FILES . ":" . "<br>" . implode("<br>", $changed_array) . "<br><br>";
		}

		$ref_list_new = "";
		for ($i=0; $i<count($files_array); $i++) {
			$ref_list_new .= $files_array[$i] . "\r\n" . $ref_array[$i] . "\r\n";
		}
		try {
			$this->handle_r = fopen($this->ooa_webfilechecker_reference_log, "w");
			fwrite($this->handle_r, trim($ref_list_new));
			fclose($this->handle_r);
		} catch(Exception $e) {
			throw $e;
		}

		// free memory
		unset($ref_array) ;
		unset($dir_array);
		unset($files_array);
		unset($files_date_array);
		unset($added_array);
		unset($removed_array);
		unset($changed_array);
		unset($files_array2);
		unset($ref_array2);
		unset($ref_list_new);

		// check configuration

		$conf_p_array = array();
		$conf_v_array = array();
		$ref_array = array();

		try {
			$this->handle_r = fopen($this->ooa_webfilechecker_reference_conf_log, "a"); // create file first time
			fclose($this->handle_r);
			$this->handle_m = fopen($this->ooa_webfilechecker_modifications_log, "a");
			$this->handle_r = fopen($this->ooa_webfilechecker_reference_conf_log, "r");
		} catch(Exception $e) {
			throw $e;
		}
		
		if (CHECK_CONFIGURATION == 'Y') {
			$connection = mysqli_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD);
			if (mysqli_error($connection)) die(mysqli_error($connection));
			mysqli_select_db($connection, DB_DATABASE);
			if (mysqli_error($connection)) die(mysqli_error($connection));

			$query = "select * from " . DB_PREFIX . CHECK_CONFIGURATION_FILE . " order by store_id, 'group', 'key'";
			$qry_c = mysqli_query($connection, $query);
			if (mysqli_error($connection)) die(mysqli_error($connection));
			$i = 0;
			while ($row = mysqli_fetch_array($qry_c)) { // read configuration
				$conf_p_array[$i] = $row['store_id'] . "\t" . $row['group'] . "\t" . $row['key'];
				$conf_v_array[$i] = $row['value'];
				$ref_array[$i] = md5($row['store_id'] . "\t" . $row['group'] . "\t" . $row['key'] . "\t" . $row['value']);
				$i++;
			}	
		}
		
		$added_array = array();
		$removed_array = array();
		$changed_array = array();
		$conf_p_array2 = array();
		$ref_array2 = array();

		$i = 0;
		while (!feof($this->handle_r)) {
			$ref = preg_split('/\t/', trim(fgets($this->handle_r)));
			if (sizeof($ref) < 3) {
				continue;
			}
			$conf_p_array2[$i] = $ref[0] . "\t" . $ref[1] . "\t" . $ref[2];
			$ref_array2[$i] = trim(fgets($this->handle_r));
			$i++;
		}
		fclose($this->handle_r);

		if (count($conf_p_array) > count($conf_p_array2)) {
			do {
				array_push($conf_p_array2, "");
				array_push($ref_array2, "");
			} while (count($conf_p_array) > count($conf_p_array2));
		} elseif (count($conf_p_array2) > count($conf_p_array)) {
			do {
				array_push($conf_p_array, "");
				array_push($ref_array, "");
			} while (count($conf_p_array2) > count($conf_p_array));
		}

		for ($i=0; $i<count($conf_p_array); $i++) {
			if ($conf_p_array[$i] != '') {
				if (!in_array($conf_p_array[$i], $conf_p_array2)) {
					array_push($added_array, $conf_p_array[$i] . "\t" . $conf_v_array[$i]);
				}
			}
			if ($conf_p_array2[$i] != '') {
				if (!in_array($conf_p_array2[$i], $conf_p_array)) {
					array_push($removed_array, $conf_p_array2[$i]);
				}
			}
			if ($ref_array[$i] != '') {
				$indexs = array_search($conf_p_array[$i], $conf_p_array2);
				if ($indexs != false) {
					if ($ref_array[$i] != $ref_array2[$indexs]) {
						array_push($changed_array, $conf_p_array[$i] . "\t" . $conf_v_array[$i]);
					}
				}
			}
		}

		if (count($added_array) == 1 and (!isset($added_array[0]) or $added_array[0] == '')) {
			$added_array = array();
		}
		if (count($removed_array) == 1 and (!isset($removed_array[0]) or $removed_array[0] == '')) {
			$removed_array = array();
		}
		if (count($changed_array) == 1 and (!isset($changed_array[0]) or $changed_array[0] == '')) {
			$changed_array = array();
		}

		if (count($added_array) > 0) {
			$mods++;
			$this->modifications_list .= MODULE_OOA_WEBFILECHECKER_ADDED_CONF . ":" . "\r\n" . implode("\r\n", $added_array) . "\r\n\r\n";
			$this->modifications_email .= MODULE_OOA_WEBFILECHECKER_ADDED_CONF . ":" . "<br>" . implode("<br>", $added_array) . "<br><br>";
		}
		if (count($removed_array) > 0) {
			$mods++;
			$this->modifications_list .= MODULE_OOA_WEBFILECHECKER_REMOVED_CONF . ":" . "\r\n" . implode("\r\n", $removed_array) . "\r\n\r\n";
			$this->modifications_email .= MODULE_OOA_WEBFILECHECKER_REMOVED_CONF . ":" . "<br>" . implode("<br>", $removed_array) . "<br><br>";
		}
		if (count($changed_array) > 0) {
			$mods++;
			$this->modifications_list .= MODULE_OOA_WEBFILECHECKER_CHANGED_CONF . ":" . "\r\n" . implode("\r\n", $changed_array) . "\r\n\r\n";
			$this->modifications_email .= MODULE_OOA_WEBFILECHECKER_CHANGED_CONF . ":" . "<br>" . implode("<br>", $changed_array) . "<br><br>";
		}

		$ref_list_new = "";
		for ($i=0; $i<count($conf_p_array); $i++) {
			$ref_list_new .= $conf_p_array[$i] . "\r\n" . $ref_array[$i] . "\r\n";
		}
		try {
			$this->handle_r = fopen($this->ooa_webfilechecker_reference_conf_log, "w");
			fwrite($this->handle_r, trim($ref_list_new));
			fclose($this->handle_r);
		} catch(Exception $e) {
			throw $e;
		}

		if ($mods == 0) {
			$this->modifications_list = "";
			$this->modifications_email = "";
		}

		try {
			fwrite($this->handle_m, $this->modifications_list);
			fclose($this->handle_m);
		} catch(Exception $e) {
			throw $e;
		}

		// free memory
		unset($ref_array) ;
		unset($conf_p_array);
		unset($conf_v_array);
		unset($added_array);
		unset($removed_array);
		unset($changed_array);
		unset($conf_p_array2);
		unset($conf_v_array2);
		unset($ref_array2);
		unset($ref_list_new);

		if ($first_run) {
			$this->modifications_list = "first_run";
		}
	}

}
?>