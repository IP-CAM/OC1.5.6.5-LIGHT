<?php
class ModelAccountContact extends Model {
	public function get_client_ip() {
	$ipaddress = '';
	if (getenv('HTTP_CLIENT_IP'))
	$ipaddress = getenv('HTTP_CLIENT_IP');
	else if(getenv('HTTP_X_FORWARDED_FOR'))
	$ipaddress = getenv('HTTP_X_FORWARDED_FOR');
	else if(getenv('HTTP_X_FORWARDED'))
	$ipaddress = getenv('HTTP_X_FORWARDED');
	else if(getenv('HTTP_FORWARDED_FOR'))
	$ipaddress = getenv('HTTP_FORWARDED_FOR');
	else if(getenv('HTTP_FORWARDED'))
	$ipaddress = getenv('HTTP_FORWARDED');
	else if(getenv('REMOTE_ADDR'))
	$ipaddress = getenv('REMOTE_ADDR');
	else
	$ipaddress = 'UNKNOWN';
	return $ipaddress;
	}
	public function addContact($data) {
	$ip = $this->get_client_ip();
	$this->db->query("INSERT INTO " . DB_PREFIX . "contact SET firstname = '" . $this->db->escape($data['name']) . "', email = '" . $this->db->escape($data['email']) . "', enquiry = '" . $this->db->escape($data['enquiry']) . "', ipaddress = '$ip'");
	}
}
?>