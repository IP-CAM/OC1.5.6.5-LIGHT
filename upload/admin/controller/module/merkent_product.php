<?php class ControllerModuleMerkentProduct extends Controller {
	private $error = array();
	
	public function index() {   
		$this->language->load('module/merkent_product');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('merkent_product', $this->request->post);
			
			$this->cache->delete('product');
			
			$this->session->data['success'] = $this->language->get('text_success');

			if (!empty($this->request->get['continue'])) {
				$this->redirect($this->url->link('module/merkent_product', 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_auto'] = $this->language->get('text_auto');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_button'] = $this->language->get('entry_button');
		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_span'] = $this->language->get('entry_span');
		$this->data['entry_height'] = $this->language->get('entry_height');
		$this->data['entry_product'] = $this->language->get('entry_product');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_save_continue'] = $this->language->get('button_save_continue');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['asterisk'])) {
			$this->data['error_asterisk'] = $this->error['asterisk'];
		} else {
			$this->data['error_asterisk'] = array();
		}

  		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
	
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/merkent_product', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => $this->language->get('text_separator')
		);
	
		$this->data['action'] = $this->url->link('module/merkent_product', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['merkent_product_cart'])) {
			$this->data['merkent_product_cart'] = $this->request->post['merkent_product_cart'];
		} else {
			$this->data['merkent_product_cart'] = $this->config->get('merkent_product_cart');
		}

		$this->data['modules'] = array();
		
		if (isset($this->request->post['merkent_product_module'])) {
			$this->data['modules'] = $this->request->post['merkent_product_module'];
		} elseif ($this->config->get('merkent_product_module')) { 
			$this->data['modules'] = $this->config->get('merkent_product_module');
		}				

		$this->data['product_types'] = array(
			'latest'	 	 => $this->language->get('text_latest'),
			'featured'	 => $this->language->get('text_featured'),
			'special'    => $this->language->get('text_special'),
			'bestseller' => $this->language->get('text_bestseller')
		);

		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/merkent_product.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/merkent_product')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['merkent_product_module'])) {
			foreach ($this->request->post['merkent_product_module'] as $key => $value) {
				if ($value['span'] == 1 && $value['description']) {
					$this->error['asterisk'][$key]['description'] = $this->language->get('error_asterisk');
				}

				if ($value['span'] == 1 && $value['button']) {
					$this->error['asterisk'][$key]['button'] = $this->language->get('error_asterisk');
				}
			}
		}
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		return !$this->error;
	}
}
?>