<?php
class ControllerModuleShowStoreCredit extends Controller {

	protected function index($setting) {
		$classname = str_replace('vq2-catalog_controller_module_', '', basename(__FILE__, '.php'));

		if ($this->customer->isLogged() && $setting['store_id'] == $this->config->get('config_store_id')) {

			$this->data = array_merge($this->data, $this->load->language('module/' . $classname));

      		$this->data['heading_title'] = $setting['language_id'][$this->config->get('config_language_id')];

			$this->data['hide_zero'] = $setting['hide_zero'];

			$balance = 0;
			$credit_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$this->customer->getId() . "'");
			if ($credit_query->num_rows) {
				foreach ($credit_query->rows as $row) {
					if ($row['order_id'] && $row['amount'] > 0 ) {
						$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$row['order_id'] . "' AND order_status_id = '" . (int)$this->config->get('config_complete_status_id') . "'");
						if ($order_query->num_rows) {
							$balance += (float)$row['amount'];
						}
					} else {
						$balance += (float)$row['amount'];
					}
				}
			}

			//$this->data['balance'] = $this->currency->format($this->customer->getBalance(), $this->currency->getCode());
			$this->data['balance'] = $this->currency->format($balance, $this->currency->getCode());

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/'.$classname.'.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/'.$classname.'.tpl';
			} else {
				$this->template = 'default/template/module/'.$classname.'.tpl';
			}

			$this->render();
		}
  	}

}
?>