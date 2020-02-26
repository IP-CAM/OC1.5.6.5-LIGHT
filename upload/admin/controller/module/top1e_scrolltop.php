<?php
class ControllerModuleTop1eScrollTop extends Controller {
	private $error = array(); 
	
	public function index() {   
		
		$this->language->load('module/top1e_scrolltop');
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('top1e_scrolltop', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['title_option_icon'] = $this->language->get('title_option_icon');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_code'] = $this->language->get('entry_code');				
		$this->data['intro'] = $this->language->get('intro');			
		$this->data['weblink'] = $this->language->get('weblink');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['text_scrollspeed'] = $this->language->get('text_scrollspeed');
		$this->data['text_indelay'] = $this->language->get('text_indelay');
		$this->data['text_outdelay'] = $this->language->get('text_outdelay');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
 		if (isset($this->error['code'])) {
			$this->data['error_code'] = $this->error['code'];
		} else {
			$this->data['error_code'] = '';
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
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/top1e_scrolltop', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/top1e_scrolltop', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['top1e_scrolltop_scrollspeed'])) {
			$this->data['scrollspeed'] = $this->request->post['top1e_scrolltop_scrollspeed'];
		} else {
			$this->data['scrollspeed'] = $this->config->get('top1e_scrolltop_scrollspeed');
		}
		
		if (isset($this->request->post['top1e_scrolltop_indelay'])) {
			$this->data['indelay'] = $this->request->post['top1e_scrolltop_indelay'];
		} else {
			$this->data['indelay'] = $this->config->get('top1e_scrolltop_indelay');
		}
		
		if (isset($this->request->post['top1e_scrolltop_outdelay'])) {
			$this->data['outdelay'] = $this->request->post['top1e_scrolltop_outdelay'];
		} else {
			$this->data['outdelay'] = $this->config->get('top1e_scrolltop_outdelay');
		}
		
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['top1e_scrolltop_module'])) {
			$this->data['modules'] = $this->request->post['top1e_scrolltop_module'];
		} elseif ($this->config->get('top1e_scrolltop_module')) { 
			$this->data['modules'] = $this->config->get('top1e_scrolltop_module');
		}	
		
		
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/top1e_scrolltop.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/top1e_scrolltop')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
			
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	 private function getIdLayout($layout_name) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "layout WHERE LOWER(name) = LOWER('".$layout_name."')");
		return (int)$query->row['layout_id'];
	}
	public function install() 
	{
	$this->load->model('setting/setting');
			
		$this->load->model('localisation/language');
	
	$top1e_scrolltop = array(
			'top1e_scrolltop_module' => array ( 
             0 => array ('layout_id' => $this->getIdLayout("product"), 'position' => 'content_bottom', 'status' => 1, 'sort_order' => 2),
			 1 => array ('layout_id' => $this->getIdLayout("category"), 'position' => 'content_bottom', 'status' => 1, 'sort_order' => 2),
			 2 => array ('layout_id' => $this->getIdLayout("home"), 'position' => 'content_bottom', 'status' => 1, 'sort_order' => 2)
			 ),
			 'top1e_scrolltop_scrollspeed' => 1200,
			 'top1e_scrolltop_indelay' => 600,
			 'top1e_scrolltop_outdelay' => 400
		);
		$this->model_setting_setting->editSetting('top1e_scrolltop', $top1e_scrolltop);
     }	


}
?>