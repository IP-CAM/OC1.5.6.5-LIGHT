<?php 
//-----------------------------------------------------
// Database for Opencart v1.5.6   						
// Developed by villagedefrance                          		
// contact@villagedefrance.net                         		
//-----------------------------------------------------

class ModelToolDatabase extends Model {

	public function getTables() {
		$table_data = array();
		
		$query = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "`");
		
		foreach ($query->rows as $result) {
			if (utf8_substr($result['Tables_in_' . DB_DATABASE], 0, strlen(DB_PREFIX)) == DB_PREFIX) {
				if (isset($result['Tables_in_' . DB_DATABASE])) {
					$table_data[] = $result['Tables_in_' . DB_DATABASE];
				}
			}
		}
	
		return $table_data;
	}

	public function tableOptimize() { 
		$query = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "`");
		
		foreach ($query->rows as $result) {
			if (utf8_substr($result['Tables_in_' . DB_DATABASE], 0, strlen(DB_PREFIX)) == DB_PREFIX) {
				if (isset($result['Tables_in_' . DB_DATABASE])) {
					$this->db->query("OPTIMIZE TABLE " . $result['Tables_in_' . DB_DATABASE]);
				}
			}
		}
	}
	
	public function tableRepair() { 
		$query = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "`");
		
		foreach ($query->rows as $result) {
			if (utf8_substr($result['Tables_in_' . DB_DATABASE], 0, strlen(DB_PREFIX)) == DB_PREFIX) {
				if (isset($result['Tables_in_' . DB_DATABASE])) {
					$this->db->query("REPAIR TABLE " . $result['Tables_in_' . DB_DATABASE]);
				}
			}
		}
	}
}
?>