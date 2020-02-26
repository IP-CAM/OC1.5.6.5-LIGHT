<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

// JTI MOD Adding canonical URLs to your OpenCart 
		$can_url=$this->url->link('common/home');
		$can_url=str_replace('index.php?route=common/home', '', $can_url); 
		$this->document->addLink($can_url,'canonical');
// END JTI MOD

		$this->data['heading_title'] = $this->config->get('config_title');
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
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