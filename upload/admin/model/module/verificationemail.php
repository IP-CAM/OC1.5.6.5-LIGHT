<?php
class ModelModuleVerificationEmail extends Model {
	
	public function createModuleTables() {
            $query = $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "customer_verification ( customer_id INT(11) NOT NULL, verification_code VARCHAR(32) NOT NULL COLLATE utf8_bin, UNIQUE(`customer_id`) )");
	}	
}
?>