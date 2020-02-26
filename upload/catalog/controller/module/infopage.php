<?php  
class ControllerModuleInfopage extends Controller {
	protected function index($setting) {

		$this->data['heading_title'] = '';
		$this->data['message'] = '';

		$this->load->model('catalog/information');
		$information_info = $this->model_catalog_information->getInformation($setting['information_id']);
		if($information_info)
		{
			if(!empty($setting['display_title']))
				$this->data['heading_title'] = html_entity_decode($information_info['title'], ENT_QUOTES, 'UTF-8');
			$this->data['message'] = html_entity_decode($information_info['description'], ENT_QUOTES, 'UTF-8');
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/infopage.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/infopage.tpl';
		} else {
			$this->template = 'default/template/module/infopage.tpl';
		}
		
		$this->render();
	}
}
?>