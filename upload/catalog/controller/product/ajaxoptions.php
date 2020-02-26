<?php 

// Name: 		Live Price Update with Options
// Version: 	1.4
// Author: 		cmd
// Website: 	http://shop.workshop200.com/en/
// Email:		workshop200@yandex.ru
	
class ControllerProductAjaxoptions extends Controller {
	
	/* ====================================================================================

	SETTINGS

	Below you can find five variables that relate to DOM the structure of the template product/product.tpl. 
	The default values correspond to a default OpenCart theme. 
	If you use customized theme, these containers might have other class or id. In this case you need to clarify their value.

	==================================================================================== */
	
	public $options_container 			= '.product-info'; 			// in default them it is 			".product-info"
	public $special_price_container 	= '.price-new'; 			// in default them it is 			".price-new"
	public $old_price_container		 	= '.price-old'; 			// in default them it is 			".price-old"
	public $tax_price_container 		= '.price-tax'; 			// in default them it is 			".price-tax'"
	public $price_container				= '#price_container'; 		// by default this module sets 		"#price_container"
	public $use_cache					= true;						// set FALSE to disable caching (TRUE - enable)
	public $calculate_quantity			= true;						// calculate price with quantity
	
	private $error = array(); 
	
	public function index() { 
		
		$json = array();
		$update_cache = false;
		$options_makeup = 0;
		
		if (isset($this->request->get['pid'])) {
			$product_id = (int)$this->request->get['pid'];
		} else {
			$product_id = 0;
		}
		
		if ($this->calculate_quantity && isset($this->request->post['quantity'])) {
			$quantity = (int)$this->request->post['quantity'];
		} else {
			$quantity = 1;
		}
		
		$this->language->load('product/product');
		$this->load->model('catalog/product');
		
		// Cache name
		if (isset($this->request->post['option']) && is_array($this->request->post['option'])) {
			$options_hash = serialize($this->request->post['option']);
		} else {
			$options_hash = '';
		}
		
		$cache_key = 'ajax_options_'. md5($product_id . $quantity. $options_hash . $this->currency->getCode() . $this->session->data['language']);
		
		if (!$this->use_cache || (!$json = $this->cache->get($cache_key))) {
				
			$product_info = $this->model_catalog_product->getProduct($product_id);
			
			// Prepare data
			if ($product_info) {
			
				$update_cache = true;
							
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$this->data['price'] = $this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
				} else {
					$this->data['price'] = false;
				}
							
				if ((float)$product_info['special']) {
					$this->data['special'] = $this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'));
				} else {
					$this->data['special'] = false;
				}

				// If some options are selected
				if (isset($this->request->post['option']) && $this->request->post['option']) {
				
					foreach ($this->model_catalog_product->getProductOptions($product_id) as $option) { 
							
						foreach ($option['option_value'] as $option_value) {
							if (isset($this->request->post['option'][$option['product_option_id']]) && $this->request->post['option'][$option['product_option_id']] == $option_value['product_option_value_id']) {
								if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
									
									if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
										$price = $this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax'));
									} else {
										$price = false;
									}
									
									if ($price) {
										if ($option_value['price_prefix'] === '+') {
											$options_makeup = $options_makeup + (float)$price;
										} else {
											$options_makeup = $options_makeup - (float)$price;
										}
									}
								}
							}
						}
						unset($price);
					}
				
				}
				
				if ($this->data['price']) {
					$json['new_price']['price'] = $this->currency->format($this->tax->calculate(($this->data['price'] + $options_makeup), $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity);
				} else {
					$json['new_price']['price'] = false;
				}
				
				if ($this->data['special']) {
					$json['new_price']['special'] = $this->currency->format($this->tax->calculate(($this->data['special'] + $options_makeup), $product_info['tax_class_id'], $this->config->get('config_tax')) * $quantity);
				} else {
					$json['new_price']['special'] = false;
				}
		
				if ($this->config->get('config_tax')) {
					$json['new_price']['tax'] = $this->language->get('text_tax').' '.$this->currency->format(((float)$product_info['special'] ? ($product_info['special'] + $options_makeup) : ($product_info['price'] + $options_makeup)) * $quantity );
				} else {
					$json['new_price']['tax'] = false;
				}
				
				$json['success'] = true;
				
			} else {
				$json['success'] = false;
			}
		
		}
		
		if ($update_cache && $this->use_cache) {
			$this->cache->set($cache_key, $json);
		}
		
		echo json_encode($json);
		exit;
  	}
	
	function js() {
		
		header('Content-Type: application/javascript'); 
		
		if (isset($this->request->get['pid'])) {
			$product_id = (int)$this->request->get['pid'];
		} else {
			$product_id = 0;
		}
		
		if ($product_id == 0) {
			exit;
		}
		
		$js = <<<HTML
	
			
			var price_with_options_ajax_call = function() {
													$.ajax({
														type: 'POST',
														url: 'index.php?route=product/ajaxoptions/index&pid=$product_id',
														data: $('{$this->options_container} input[type=\'text\'], {$this->options_container} input[type=\'hidden\'], {$this->options_container} input[type=\'radio\']:checked, {$this->options_container} input[type=\'checkbox\']:checked, {$this->options_container} select, {$this->options_container} textarea'),
														dataType: 'json',
														beforeSend: function() {
															// you can add smth useful here
														},
														complete: function() {
															// you can add smth useful here
														},
														success: function(json) {
															if (json.success) {
																if ($('{$this->options_container} {$this->tax_price_container}').length > 0 && json.new_price.tax) {
																	animation_on_change_price_with_options('{$this->options_container} {$this->tax_price_container}', json.new_price.tax);
																}
																if ($('{$this->options_container} {$this->old_price_container}').length > 0 && json.new_price.price) {
																	animation_on_change_price_with_options('{$this->options_container} {$this->old_price_container}', json.new_price.price);
																}
																if ($('{$this->options_container} {$this->special_price_container}').length > 0 && json.new_price.special) {
																	animation_on_change_price_with_options('{$this->options_container} {$this->special_price_container}', json.new_price.special);
																}
																if ($('{$this->options_container} {$this->price_container}').length > 0 && json.new_price.price) {
																	animation_on_change_price_with_options('{$this->options_container} {$this->price_container}', json.new_price.price);
																}
															}
														},
														error: function(error) {
															console.log(error);
														}
													});
												}
			
			var animation_on_change_price_with_options = function(selector_class_or_id, new_html_content) {
				$(selector_class_or_id).fadeOut(150, function() {
					$(this).html(new_html_content).fadeIn(50);
				});
			}
			
			if ( jQuery.isFunction(jQuery.fn.on) ) 
				{
					$('{$this->options_container} input[type=\'text\'], {$this->options_container} input[type=\'hidden\'], {$this->options_container} input[type=\'radio\']:checked, {$this->options_container} input[type=\'checkbox\']:checked, {$this->options_container} select, {$this->options_container} textarea, .product-info input[name=\'quantity\']').live('change', function() {
						price_with_options_ajax_call();
					});
				} 
			else 
				{
					$('{$this->options_container} input[type=\'text\'], {$this->options_container} input[type=\'hidden\'], {$this->options_container} input[type=\'radio\']:checked, {$this->options_container} input[type=\'checkbox\']:checked, {$this->options_container} select, {$this->options_container} textarea, .product-info input[name=\'quantity\']').live('change', function() {
						price_with_options_ajax_call();
					});
				}	
HTML;

		echo $js;
		exit;
	}
}

?>