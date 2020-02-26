<?php

$filePath = "../../../download/";
$packetSize = 512 * 512*2; // bytes, need to be same as in JavaScript
$storeFiles = true;


function throwError($error) {
    echo json_encode(array(
        "error" => $error
    ));
    exit;
}


if (isset($_POST)) {

    if (count($_GET) == 0) {

        if (isset($_POST['totalSize']) && isset($_POST['type']) && isset($_POST['fileName']) && is_numeric($_POST['totalSize'])) {

			
            $fileData = $_POST['totalSize'] . "|" . preg_replace('/[^A-Za-z0-9\/]/', '', $_POST['type']) . "|" . preg_replace('/[^A-Za-z0-9_\.]/', '', $_POST['fileName']);
		
            $fileid = time() . rand(1, 150000); //the probability of this being unique is good enough in most cases
			
            $token = md5($fileData);
			
            if (!$handle = fopen($filePath . $fileid . "-" . $token . ".info", 'w')) {
                throwError("Unable to create new file for metadata");
            }

            if (fwrite($handle, $fileData) === FALSE) {
                throwError("Unable to write metadata for file");
            }
            fclose($handle);
            $json = array(
                "action" => "new_upload",
                "fileid" => $fileid,
                "token" => $token
            );
        } elseif (isset($_POST['fileid']) && isset($_POST['token']) && is_numeric($_POST['fileid']) && preg_match('/[A-Za-z0-9]/', $_POST['token'])) {

            $contents = @file_get_contents($filePath . $_POST['fileid'] . "-" . $_POST['token'] . ".info");
            if (!$contents) {
                throwError("No file found for the provided ID / token");
            }

            unlink($filePath . $_POST['fileid'] . "-" . $_POST['token'] . ".info"); //MX
            $json = array(
                "action" => "complete",
                "file" => $_POST['fileid']
            );

        }
    } else {
        if (isset($_GET['fileid']) && isset($_GET['token']) && isset($_GET['packet']) && is_numeric($_GET['packet']) && is_numeric($_GET['fileid'])) {
            if (file_exists($filePath . $_GET['fileid'] . "-" . $_GET['token'] . ".info")) {
                if ($storeFiles) {
                    if (!$handle = fopen($filePath . $_GET['fileName'], 'a')) {
                        exit;
                    }

                    if (fwrite($handle, $GLOBALS['HTTP_RAW_POST_DATA']) === FALSE) {

                        throwError("Unable to write to package #" . $_GET['packet']);
                    }
                    fclose($handle);
                }
                
                $json = array(
                    "action" => "new_packet",
                    "result" => "success",
                    "packet" => $_GET['packet'],
                );
            }
        }
    }
} else {
    throwError("No post request");
}


if (isset($json)) {
    echo json_encode($json);
}

?>