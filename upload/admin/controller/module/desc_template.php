<?php
/**
 * Description templates module
 * 
 * @author AnRe //developer.lt//
 *
 */
class ControllerModuleDescTemplate extends Controller {

	private $error = array();

	public function index() {
		$this->load->language('module/desc_template');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('desc_template', $this->request->post);
				
			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->addLabels();
		$this->addErrors();
		$this->addBreadcrumbs();
		
		if (isset($this->request->post['desc_template_status'])) {
			$this->data['desc_template_status'] = $this->request->post['desc_template_status'];
		} else {
			$this->data['desc_template_status'] = $this->config->get('desc_template_status');
		}
		
		$this->load->model('module/desc_template');
		$this->data['templates'] = array();
		
		$templates = $this->model_module_desc_template->getTemplates();
		if ($templates->rows) {
			foreach ($templates->rows as $tr) {
				$this->data['templates'][] = array(
					'id'	=> $tr['template_id'],
					'name'	=> $tr['template_name'],
					'status'=> $tr['template_status']
				);
			}
		}

		$this->data['token'] = $this->session->data['token'];
      	$this->data['action'] = $this->url->link('module/desc_template', 'token=' . $this->session->data['token'], 'SSL');
      	$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

      	$this->template = 'module/desc_template.tpl';
      	$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}
	
	public function create() {
		$json = array();
		
		$this->load->language('module/desc_template');
		
		if (!$this->user->hasPermission('modify', 'module/desc_template')) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			if ($this->request->server['REQUEST_METHOD'] == 'POST') {
				if ($this->validateForm()) {
					$this->load->model('module/desc_template');
					$template_id = $this->model_module_desc_template->createTemplate($this->request->post);
					
					$tpl = $this->model_module_desc_template->getTemplateById($template_id);
					
					if ($tpl) {
						$json['tpl_id'] = $template_id;
						$json['tpl_status'] = $tpl['template_status'] ? true : false;
						$json['tpl_name'] = $tpl['template_name'];
					} else {
						$json['tpl_id'] = $template_id;
						$json['tpl_status'] = false;
						$json['tpl_name'] = '<i>???template_name???</i>';
					}
					
					$json['success'] = 'Success';
				} else {
					$json['error'] = array_pop($this->error);
				}
			} else {
				$this->data['entry_name'] = $this->language->get('entry_name');
				$this->data['entry_status'] = $this->language->get('entry_status');
				$this->data['entry_body'] = $this->language->get('entry_body');
				$this->data['text_enabled'] = $this->language->get('text_enabled');
				$this->data['text_disabled'] = $this->language->get('text_disabled');
				$this->data['text_template'] = $this->language->get('text_template');
				$this->data['button_save'] = $this->language->get('button_save');
				$this->data['button_cancel'] = $this->language->get('button_cancel');
				$this->data['ajax_action'] = 'create';
				
				$this->data['template_name'] = '';
				$this->data['template_body'] = '';
				$this->data['template_status'] = 1;
				$this->data['template_id'] = '';
				
				$this->data['token'] = $this->session->data['token'];
				$this->data['action'] = $this->url->link('module/desc_template/create', 'token=' . $this->session->data['token'], 'SSL');
				
				$this->template = 'module/desc_template_form.tpl';
				$json['success'] = 'Success';
				$json['form_data'] = $this->render();
			}
		}
		
		$this->response->setOutput(json_encode($json));
	}
	
	public function edit() {
		$json = array();
		
		$this->load->language('module/desc_template');
		
		if (!$this->user->hasPermission('modify', 'module/desc_template')) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			if ($this->request->server['REQUEST_METHOD'] == 'POST') {
				if ($this->validateForm()) {
					$this->load->model('module/desc_template');
					$this->model_module_desc_template->updateTemplate((int)$this->request->post['template_id'], $this->request->post);
					
					$json['success'] = 'Success';
				} else {
					$json['error'] = array_pop($this->error);
				}
			} else {
				$this->data['entry_name'] = $this->language->get('entry_name');
				$this->data['entry_status'] = $this->language->get('entry_status');
				$this->data['entry_body'] = $this->language->get('entry_body');
				$this->data['text_enabled'] = $this->language->get('text_enabled');
				$this->data['text_disabled'] = $this->language->get('text_disabled');
				$this->data['text_template'] = $this->language->get('text_template');
				$this->data['button_save'] = $this->language->get('button_save');
				$this->data['button_cancel'] = $this->language->get('button_cancel');
				$this->data['ajax_action'] = 'edit';
				
				if (isset($this->request->get['template_id'])) {
					$this->load->model('module/desc_template');
					$tpl = $this->model_module_desc_template->getTemplateById($this->request->get['template_id']);
					if ($tpl) {
						$this->data['template_name'] = $tpl['template_name'];
						$this->data['template_body'] = $tpl['template_body'];
						$this->data['template_status'] = $tpl['template_status'];
						$this->data['template_id'] = $tpl['template_id'];
					} else {
						$json['error'] = $this->language->get('error_not_found');
					}
				} else {
					$json['error'] = $this->language->get('error_missing_id');
				}
				
				if (empty($json)) {
					$this->data['token'] = $this->session->data['token'];
					$this->data['action'] = $this->url->link('module/desc_template/edit', 'token=' . $this->session->data['token'], 'SSL');
					
					$this->template = 'module/desc_template_form.tpl';
					$json['success'] = 'Success';
					$json['form_data'] = $this->render();
				}
			}
		}
		
		$this->response->setOutput(json_encode($json));
	}
	
	public function remove() {
		$json = array();
		
		$this->load->language('module/desc_template');
		
		if (!$this->user->hasPermission('modify', 'module/desc_template')) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			$template_id = isset($this->request->get['template_id']) ? (int)$this->request->get['template_id'] : 0;
			
			if ((int)$template_id <= 0) {
				$json['error'] = $this->language->get('error_not_found');
			} else {
				$this->load->model('module/desc_template');
				$this->model_module_desc_template->deleteTemplate($template_id);
				
				$json['success'] = $this->language->get('text_success_delete');
			}
		}
		
		$this->response->setOutput(json_encode($json));
	}
	
	public function body() {
		$json = array();
		
		$this->load->language('module/desc_template');
		
		if (!$this->user->hasPermission('modify', 'module/desc_template')) {
			$json['error'] = $this->language->get('error_permission');
		} else {
			$template_id = isset($this->request->get['template_id']) ? (int)$this->request->get['template_id'] : 0;
			
			if ((int)$template_id <= 0) {
				$json['error'] = $this->language->get('error_not_found');
			} else {
				$this->load->model('module/desc_template');
				$tpl = $this->model_module_desc_template->getTemplateById($template_id);
				
				if ($tpl) {
					$json['body'] = $tpl['template_body'];
				} else {
					$json['error'] = $this->language->get('error_not_found');
				}
			}
		}
		
		$this->response->setOutput(json_encode($json));
	}
	
	public function install() {
		if (!$this->user->hasPermission('modify', 'module/desc_template')) {
			die('No permission');
		}
		$this->load->model('module/desc_template');
		$this->model_module_desc_template->install();
		
		$this->load->model('setting/setting');
		$params = array('desc_template_status' => 1);
		$this->model_setting_setting->editSetting('desc_template', $params);
	}
	
	public function uninstall() {
		if (!$this->user->hasPermission('modify', 'module/desc_template')) {
			die('No permission');
		}
		$this->load->model('module/desc_template');
		$this->model_module_desc_template->uninstall();
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/desc_template')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	private function validateForm() {
		if (!$this->user->hasPermission('modify', 'module/desc_template')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['template_name'])) {
			$namelen = strlen(utf8_decode($this->request->post['template_name']));
			if ($namelen < 3 || $namelen > 100) {
				$this->error['invalid_name'] = $this->language->get('error_invalid_name');
			}
		} else {
			$this->error['missing_name'] = $this->language->get('error_missing_name');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	private function addLabels() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_confirm_delete'] = $this->language->get('text_confirm_delete');

		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_templates'] = $this->language->get('entry_templates');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_add'] = $this->language->get('button_add');
		$this->data['button_edit'] = $this->language->get('button_edit');
		$this->data['button_delete'] = $this->language->get('button_delete');
	}
	
	private function addBreadcrumbs() {
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
      	);

      	$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/desc_template', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
      	);
	}
	
	private function addErrors() {
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
	}
}
?>