<?php class ControllerModuleMerkentSearch extends Controller {
	protected function index($setting) {
	static $module = 0;
	$this->language->load('module/merkent_search');	
	$this->data['heading_title'] = $this->language->get('heading_title');
	$this->data['text_search'] = $this->language->get('text_search');
	$this->data['text_category'] = $this->language->get('text_category');
	$this->data['text_sub_category'] = $this->language->get('text_sub_category');
	$this->data['text_description'] = $this->language->get('text_description');
	$this->data['button_search'] = $this->language->get('button_search');
	$this->data['option'] = $setting['option'];
	$this->data['categories'] = array();
	if ($setting['category']) {
	$this->load->model('catalog/category');
	$categories_1 = $this->model_catalog_category->getCategories(0);
	foreach ($categories_1 as $category_1) {
	$level_2_data = array();
	$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);
	foreach ($categories_2 as $category_2) {
	$level_3_data = array();
	$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);
	foreach ($categories_3 as $category_3) {
	$level_3_data[] = array(
	'category_id' => $category_3['category_id'],
	'name'        => $category_3['name'],
	);
	}
	$level_2_data[] = array(
	'category_id' => $category_2['category_id'],	
	'name'        => $category_2['name'],
	'children'    => $level_3_data
	);	
	}
	$this->data['categories'][] = array(
	'category_id' => $category_1['category_id'],
	'name'        => $category_1['name'],
	'children'    => $level_2_data
	);
	}
	}
	$this->data['search'] = array();
	$this->data['module'] = $module++; 
	if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/merkent_search.tpl')) {
	$this->template = $this->config->get('config_template') . '/template/module/merkent_search.tpl';
	} else {
	$this->template = 'default/template/module/merkent_search.tpl';
	}
	$this->render();
  	}
}
?>