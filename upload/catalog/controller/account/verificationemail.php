<?php 
class ControllerAccountVerificationEmail extends Controller { 
	public function index() {
		if ($this->customer->isLogged()) {  
      		$this->redirect($this->url->link('account/logout', '', 'SSL'));die();
    	}
		if (strlen($this->request->get['v']) != 32 ||
			intval($this->request->get['u']) <= 0) {
			header('Location: '.HTTP_SERVER);die();
		}
		
		$customer_id = $this->request->get['u'];
		$verification_code = $this->request->get['v'];
		
		$customer = $this->db->query("SELECT verification_code FROM " . DB_PREFIX . "customer_verification WHERE customer_id='" . $customer_id . "'");
		
		if ($customer->row['verification_code'] != $verification_code) {
			header('Location: '.HTTP_SERVER);die();
		}
		
		// $this->db->query("UPDATE " . DB_PREFIX . "customer SET approved = '1'"); 
		// http://dapur-uang.com/opencart-extension-a-bug-in-a-free-customer-email-verification
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET approved = '1' WHERE customer_id='" . (int)$customer_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_verification WHERE customer_id='" . $customer_id . "'");

		
		$this->language->load('account/verificationemail');

		$this->document->setTitle($this->language->get('heading_title'));

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	); 

      	$this->data['breadcrumbs'][] = array(       	
        	'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);
		
      	$this->data['breadcrumbs'][] = array(       	
        	'text'      => $this->language->get('text_verification'),
			'href'      => $this->url->link('account/verification', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);
		
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_account_verificaiton'] = $this->language->get('text_account_verificaiton');
    	$this->data['text_account_verified'] = $this->language->get('text_account_verified');
		
		$this->data['login'] = $this->url->link('account/login', '', 'SSL');
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/verificationemail.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/verificationemail.tpl';
		} else {
			$this->template = 'default/template/account/verificationemail.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'		
		);
				
		$this->response->setOutput($this->render());
  	}
}
?>