<?php
class ModelCatalogSupplier extends Model {
	public function addSupplier($data) {
      	$this->db->query("INSERT INTO " . DB_PREFIX . "supplier SET name = '" . $this->db->escape($data['name']) . "', webpage = '" . $this->db->escape($data['webpage']) . "', update_url = '" . $this->db->escape($data['update_url']) . "'");
		
		$this->cache->delete('supplier');
	}
	
	public function editSupplier($supplier_id, $data) {
      	$this->db->query("UPDATE " . DB_PREFIX . "supplier SET name = '" . $this->db->escape($data['name']) . "', webpage = '" . $this->db->escape($data['webpage']) . "', update_url = '" . $this->db->escape($data['update_url']) . "' WHERE supplier_id = '" . (int)$supplier_id . "'");
		
		$this->cache->delete('supplier');
	}
	
	public function deleteSupplier($supplier_id,$delete_products) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "supplier WHERE supplier_id = '" . (int)$supplier_id . "'");
		
		if ($delete_products == 1) {
			$sql = "SELECT product_id FROM " . DB_PREFIX . "product WHERE supplier_id = '" . (int)$supplier_id . "'";
			$query = $this->db->query($sql);
			if (isset($query->rows)) {
				$this->load->model('catalog/product');
				foreach ($query->rows as $product_id) {
					print_r($product_id['product_id']);
					$this->model_catalog_product->deleteProduct($product_id['product_id']);
				}
			}
		} else {
			$sql = "UPDATE " . DB_PREFIX . "product SET supplier_id = '0' WHERE supplier_id = '" . (int)$supplier_id . "';";
			$query = $this->db->query($sql);
		}
		
		$this->cache->delete('supplier');
	}
	
	public function getSupplier($supplier_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "supplier WHERE supplier_id = '" . (int)$supplier_id . "'");
		
		return $query->row;
	}
	
	public function getSuppliers($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "supplier";
		
		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
		
		$sql .= " GROUP BY supplier_id";
		
		$sort_data = array(
			'name',
			'webpage',
			'sort_order'
		);
		
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY name";
		}
		
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
	
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		
		$query = $this->db->query($sql);
	
		return $query->rows;
	}
	
	public function getTotalSuppliers($data = array()) {
		$sql = "SELECT COUNT(DISTINCT supplier_id) AS total FROM " . DB_PREFIX . "supplier";
		
		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
	public function getNumProducts($supplier_id) {
		$sql = "SELECT COUNT(DISTINCT product_id) AS total FROM " . DB_PREFIX . "product WHERE supplier_id = '".$supplier_id."'";
		
		$query = $this->db->query($sql);
		
		return $query->row['total'];
	}
	
	public function getSuppliersInProducts($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "supplier";
		$query = $this->db->query($sql);
		
		$data_supplier = array();
		foreach($query->rows as $row) {
			$data_supplier[$row['supplier_id']]['name'] = $row['name'];
			$data_supplier[$row['supplier_id']]['url'] = $row['webpage'];
			$data_supplier[$row['supplier_id']]['update_url'] = $row['update_url'];
		}
		return $data_supplier;
	}
	
}
?>