<?php  
class ControllermoduleFullSlider extends Controller {
	protected function index( $setting ) {
	
		static $module = 0;
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');	
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/fullslider.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/fullslider.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/fullslider.css');
		}
		
		$this->data['banners'] = array();
		$this->data['setting'] = $setting;
		if( isset($setting['banner_image'])){
			foreach( $setting['banner_image'] as $banner ){
				$banner['thumb'] = $this->model_tool_image->resize($banner['image'], $setting['width'], $setting['height']);
			
				
				$title = isset( $banner['title'][$this->config->get('config_language_id')] ) ? $banner['title'][$this->config->get('config_language_id')]:"";
				$description = isset( $banner['description'][$this->config->get('config_language_id')] ) ? $banner['description'][$this->config->get('config_language_id')]:"";
				$banner['title'] =  html_entity_decode( $title, ENT_QUOTES, 'UTF-8');
				$banner['description'] =  html_entity_decode( $description, ENT_QUOTES, 'UTF-8');
				
				if( isset($setting['image_navigator']) && $setting['image_navigator'] ){ 
					$banner['image_navigator'] =  $this->model_tool_image->resize($banner['image'], $setting['navimg_weight'], $setting['navimg_height'], 'w' );
				}else {
					$banner['image_navigator'] = '';
				}
				$this->data['banners'][] = $banner;
			}
		}
		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/fullslider.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/fullslider.tpl';
		} else {
			$this->template = 'default/template/module/fullslider.tpl';
		}
		
		$this->render();
	}
}
?>