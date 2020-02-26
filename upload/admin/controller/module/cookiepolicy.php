<?php
class ControllerModuleCookiePolicy extends Controller {
    private $error = array(); 
    public function index() {   
//Load the language file for this module
	$language = $this->load->language('module/cookiepolicy');
	$this->data = array_merge($this->data, $language);

//Set the title from the language file $_['heading_title'] string
	$this->document->setTitle($this->language->get('heading_title'));
	
//Load the settings model. You can also add any other models you want to load here.
	$this->load->model('setting/setting');
	
//Save the settings if the user has submitted the admin form (ie if someone has pressed save).
	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
	$this->model_setting_setting->editSetting('cookiepolicy', $this->request->post);    
	
	$this->session->data['success'] = $this->language->get('text_success');
	if(empty($this->request->get['continue'])) {
	$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
	}
	}
	
	$this->data['token'] = $this->session->data['token'];       

	$text_strings = array(
	'heading_title',
	'text_enabled',
	'text_disabled',
	'text_content_top',
	'text_content_bottom',
	'text_column_left',
	'text_column_right',
	'entry_status',
	'entry_sort_order',
	'button_save',
	'button_cancel',
	);
	
	foreach ($text_strings as $text) {
	$this->data[$text] = $this->language->get($text);
	}

// store config data
	$config_data = array(
	'cookiepolicy_status',
	'cookiepolicy_position',
	'accept_button_colour',
	'accept_button_hover',
	'accept_text_colour',
	'accept_text_hover',
	'cookie_text_colour',
	'cookie_background_colour',
	'cookie_opacity',
	'cookie_url',
	'rounded_corners',
	);
	
	foreach ($config_data as $conf) {
	if (isset($this->request->post[$conf])) {
	$this->data[$conf] = $this->request->post[$conf];
	} else {
	$this->data[$conf] = $this->config->get($conf);
	}
	}
    
//Create error and success messages
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
	
//Set up breadcrumb trail.
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
	'href'      => $this->url->link('module/cookiepolicy', 'token=' . $this->session->data['token'], 'SSL'),
	'separator' => ' :: '
	);
	
	$this->data['action'] = $this->url->link('module/cookiepolicy', 'token=' . $this->session->data['token'], 'SSL');
	$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
	$this->load->model('design/layout');
	$this->data['layouts'] = $this->model_design_layout->getLayouts();
	$this->load->model('localisation/language');
	$this->data['languages'] = $this->model_localisation_language->getLanguages();
	
	if (isset($this->request->post['cookiepolicy_module'])) {
	$this->data['cookiepolicy_module'] = $this->request->post['cookiepolicy_module'];
	} else {
	$this->data['cookiepolicy_module'] = $this->config->get('cookiepolicy_module');
	}

//Choose which template file will be used to display this request.
	$this->template = 'module/cookiepolicy.tpl';
	$this->children = array(
	'common/header',
	'common/footer',
	);

	//Send the output.
	$this->response->setOutput($this->render());
    }

    private function validate() {
	if (!$this->user->hasPermission('modify', 'module/cookiepolicy')) {
	$this->error['warning'] = $this->language->get('error_permission');
	}
	
	if (!$this->error) {
	return TRUE;
	} else {
	return FALSE;
	}   
    }
}
?>