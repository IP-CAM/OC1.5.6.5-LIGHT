<?php
class ControllerModuleVerificationEmail extends Controller {
	
	private $error = array(); 

        public function install() {
            $query = $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "customer_verification ( customer_id INT(11) NOT NULL, verification_code VARCHAR(32) NOT NULL COLLATE utf8_bin, UNIQUE(`customer_id`) )");
        }

	
	public function index() {   
		//Load the language file for this module
		$this->load->language('module/verificationemail');

		//Set the title from the language file $_['heading_title'] string
		$this->document->setTitle($this->language->get('heading_title'));
		
		//Load the settings model. You can also add any other models you want to load here.
		$this->load->model('setting/setting');
		
		$this->template = 'module/verificationemail.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		//Send the output.
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/verificationemail')) {
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