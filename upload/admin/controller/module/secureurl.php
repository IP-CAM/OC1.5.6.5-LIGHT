<?php
class ControllerModuleSecureurl extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('module/secureurl');
		$this->load->model('tool/ip_admin');
		$this->getList();
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST')   && $this->validate() ) {
			$this->model_setting_setting->editSetting('secureurl', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			//$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');

		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		/*
		if (isset($this->error['image'])) {
			$this->data['error_image'] = $this->error['image'];
		} else {
			$this->data['error_image'] = array();
		}
		*/
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/secureurl', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
   		);

		$this->data['action'] = $this->url->link('module/secureurl', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');


		$this->data['modules'] = $this->model_setting_setting->getSetting('secureurl');
		$t = $this->model_setting_setting->getSetting('secureurl');

		if (isset($this->request->post['secureurl_module'])) {
			$this->data['modules'] = $t ;
		} elseif ($this->config->get('secureurl_module')) {
			$this->data['modules'] = $t;
		}


		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/secureurl.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/secureurl')) {

			$this->error['warning'] = $this->language->get('error_permission');
		}

		// validate it only when the status is enabled.
		if ($this->request->post['secure_status'] == 1 ) {


			if (isset($this->request->post['secure_key'])) {

				if(strlen(trim($this->request->post['secure_key'])) <= 0 ) {
					$this->error['warning'] = " The Secure Key is empty ";
				}else{

					if(preg_match('/[^a-zA-Z0-9]/', $this->request->post['secure_key'])){

						$this->error['warning'] = " The Secure Key cant contain symbols";
					}
				}


			}


			if (isset($this->request->post['secure_value'])) {
				if(strlen(trim($this->request->post['secure_value'])) <= 0 ) {
					$this->error['warning'] = " The Secure value is empty " ;
				}else{

					if(preg_match('/[^a-zA-Z0-9]/', $this->request->post['secure_value'])){

						$this->error['warning'] = " The Secure value cant contain symbols";
					}
				}
			}

		}



		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}


// ip login base
	public function insert() {
		$this->load->language('module/secureurl');

    		$this->document->setTitle($this->language->get('heading_title_ip'));

		$this->load->model('tool/ip_admin');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
      	  	$this->model_tool_ip_admin->addAdminWhitelist($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success_ip');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect('http://www.openshop.li/light/admin/?N51BoTEtIR=AnPiNKe21V');
		}

    	$this->getForm();
  	}

  	public function update() {
		$this->load->language('module/secureurl');

    		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('tool/ip_admin');

    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_tool_ip_admin->editAdminWhitelist($this->request->get['admin_ip_whitelist_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success_ip');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect('http://www.openshop.li/light/admin/?N51BoTEtIR=AnPiNKe21V');
		}

    	$this->getForm();
  	}

  	public function delete() {
		$this->load->language('module/secureurl');

    		$this->document->setTitle($this->language->get('heading_title_ip'));

		$this->load->model('tool/ip_admin');

    	if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $admin_ip_whitelist_id) {
				$this->model_tool_ip_admin->deleteAdminWhitelist($admin_ip_whitelist_id);
			}

			$this->session->data['success'] = $this->language->get('text_success_ip');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

		$this->redirect('http://www.openshop.li/light/admin/?N51BoTEtIR=AnPiNKe21V');
    	}

    	$this->getList();
  	}

  	private function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'ip';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = (int)$this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/secureurl', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
   		);

		$this->data['insert'] = $this->url->link('module/secureurl/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('module/secureurl/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['admin_whitelists'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$admin_whitelist_total = $this->model_tool_ip_admin->getTotalAdminWhitelists($data);

		$results = $this->model_tool_ip_admin->getAdminWhitelists($data);

    	foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('module/secureurl/update', 'token=' . $this->session->data['token'] . '&admin_ip_whitelist_id=' . $result['admin_ip_whitelist_id'] . $url, 'SSL')
			);

			$this->data['admin_whitelists'][] = array(
				'admin_ip_whitelist_id' => $result['admin_ip_whitelist_id'],
				'ip'                       => $result['ip'],
				'selected'                 => isset($this->request->post['selected']) && in_array($result['admin_ip_whitelist_id'], $this->request->post['selected']),
				'action'                   => $action
			);
		}

		$this->data['heading_title_ip'] = $this->language->get('heading_title_ip');

		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['entry_ip_admin'] = $this->language->get('entry_ip_admin');
		$this->data['column_ip'] = $this->language->get('column_ip');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_ip'] = $this->url->link('module/secureurl', 'token=' . $this->session->data['token'] . '&sort=ip' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $admin_whitelist_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('module/secureurl', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'tool/ip_admin_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
  	}

  	private function getForm() {
    		$this->data['heading_title'] = $this->language->get('heading_title_ip');

    		$this->data['entry_ip'] = $this->language->get('entry_ip');

		$this->data['button_save'] = $this->language->get('button_save');
    		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['ip'])) {
			$this->data['error_ip'] = $this->error['ip'];
		} else {
			$this->data['error_ip'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
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
      		'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
   		);
// titlu 2
   		$this->data['breadcrumbs'][] = array(
       				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('module/secureurl', 'token=' . $this->session->data['token'] . $url, 'SSL'),
		      		'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
   		);

		if (!isset($this->request->get['admin_ip_whitelist_id'])) {
			$this->data['action'] = $this->url->link('module/secureurl/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('module/secureurl/update', 'token=' . $this->session->data['token'] . '&admin_ip_whitelist_id=' . $this->request->get['admin_ip_whitelist_id'] . $url, 'SSL');
		}

    	$this->data['cancel'] = $this->url->link('module/secureurl', 'token=' . $this->session->data['token'] . $url, 'SSL');

    	if (isset($this->request->get['admin_ip_whitelist_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$admin_whitelist_info = $this->model_tool_ip_admin->getAdminWhitelist($this->request->get['admin_ip_whitelist_id']);
    	}

    	if (isset($this->request->post['ip'])) {
      		$this->data['ip'] = $this->request->post['ip'];
		} elseif (!empty($admin_whitelist_info)) {
			$this->data['ip'] = $admin_whitelist_info['ip'];
		} else {
      		$this->data['ip'] = '';
    	}

		$this->template = 'tool/ip_admin_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

  	private function validateForm() {
    	if (!$this->user->hasPermission('modify', 'module/secureurl')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

    	if ((utf8_strlen($this->request->post['ip']) < 1) || (utf8_strlen($this->request->post['ip']) > 15)) {
      		$this->error['ip'] = $this->language->get('error_ip');
    	}

		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}

  	private function validateDelete() {
    	if (!$this->user->hasPermission('modify', 'module/secureurl')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}
}
?>
