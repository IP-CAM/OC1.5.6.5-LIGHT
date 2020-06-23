<?php class ControllerModuleMerkentProduct extends Controller {
	protected function index($setting) {
		static $module = 0;

		$this->language->load('module/merkent_product');
		
		if (file_exists(DIR_TEMPLATE . 'default/template/module/merkent_product.tpl')) {
			$this->data['heading_title'] = $this->language->get('heading_' . $setting['product_type']);
		
			$this->data['text_empty'] = sprintf($this->language->get('text_empty'), $setting['product_type']);

			$this->data['button_add_cart'] = $this->language->get('button_add_cart');

			if (file_exists('catalog/view/theme/default/js/masonry.js')) {
				$this->document->addScript('catalog/view/theme/default/js/masonry.js');
				if (file_exists('catalog/view/theme/default/js/imagesloaded.js')) {
					$this->document->addScript('catalog/view/theme/default/js/imagesloaded.js');
				}
			}

			$this->load->model('catalog/product');
			$this->load->model('tool/image');

			$this->data['button'] = $setting['button'];
			
			$this->data['class_row'] = ($setting['span'] == 1) ? 'slim-row' : 'row';
			
			$class_col = array(
				1 => 'slim-col-xs-4 slim-col-sm-2 slim-col-md-1',
				2 => 'col-xs-12 col-sm-3 col-md-2',
				3 => 'col-xs-12 col-sm-4 col-md-3',
				4 => 'col-xs-12 col-sm-6 col-md-4',
				6 => 'col-xs-12 col-sm-6'
			);
			
			$this->data['class_col'] = $class_col[$setting['span']];
		
			if (!$setting['height']) {
				$this->data['class_1'] = 'masonry';
				$this->data['class_2'] = 'thumbnail';
				$this->data['class_3'] = '';
			} else {
				$this->data['class_1'] = 'block';
				$this->data['class_2'] = 'spacer';
				$this->data['class_3'] = 'thumbnail';
			}

			$merkent_products = $this->cache->get('product.merkent.' . md5(serialize($setting)) . '.' . (int)$module);

			if (!$merkent_products) { 
				$image_width = 60 + (($setting['span'] - 1) * 100);

				$merkent_products = array();

				if ($setting['product_type'] == 'featured') {
					$results = array();
					
					$products = explode(',', $this->config->get('featured_product'));		

					if (empty($setting['limit'])) {
						$setting['limit'] = 5;
					}
					
					$products = array_slice($products, 0, (int)$setting['limit']);
					
					foreach ($products as $product_id) {
						$product_info = $this->model_catalog_product->getProduct($product_id);
						
						if ($product_info) {
							$results[] = $product_info;
						}
					}
				} elseif ($setting['product_type'] == 'special') {
					$results = $this->model_catalog_product->getProductSpecials(array(
						'sort'  => 'pd.name',
						'order' => 'ASC',
						'start' => 0,
						'limit' => $setting['limit']
					));
				} elseif ($setting['product_type'] == 'bestseller') {
					$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
				} else {
					$results = $this->model_catalog_product->getProducts(array(
						'sort'  => 'p.date_added',
						'order' => 'DESC',
						'start' => 0,
						'limit' => $setting['limit']
					));
				}
				
				$display_price = $this->config->get('config_customer_price') && $this->customer->isLogged() || !$this->config->get('config_customer_price');

				foreach ($results as $result) {
					if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
						if ($setting['height'] != false) {
							$height = $setting['height'];
						} else {
							$size = getimagesize(DIR_IMAGE . $result['image']);
							
							$height = ceil(((int)$image_width / $size[0]) * $size[1]);
						}

						$image = $this->model_tool_image->resize($result['image'], (int)$image_width, $height);
					} else {
						$image = '';
					}
					
					if ($setting['description'] && $result['description']) {
						$description = $this->format_description($result['description']);
					} else {
						$description = false;
					}

					if ($display_price && !number_format($result['price'])) {
						$price = $this->language->get('text_free');
					} elseif ($display_price) {
						$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ($display_price && (float)$result['special']) {
						$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}
					
					if ($this->config->get('config_review_status') && $setting['span'] > 1) {
						$rating = $result['rating'];
					} else {
						$rating = false;
					}
					
					$merkent_products[] = array(
						'product_id' 	=> $result['product_id'],
						'thumb'   	 	=> $image,
						'name'    	 	=> $result['name'],
						'description' 	=> $description,
						'price'   	 	=> $price,
						'special' 	 	=> $special,
						'rating'     	=> $rating,
						'reviews'    	=> sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
						'href'    	 	=> $this->url->link('product/product', 'product_id=' . $result['product_id']),
					);
				}
				
				$this->cache->set('product.merkent.' . md5(serialize($setting)) . '.' . (int)$module, $merkent_products);
			}

			$this->data['products'] = $merkent_products;

			$this->data['module'] = $module++;

			$this->template = 'default/template/module/merkent_product.tpl';
		} else {
			$this->data['heading_title'] = false;
			
			$this->data['message'] = $this->language->get('text_message');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/welcome.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/welcome.tpl';
			} else {
				$this->template = 'default/template/module/welcome.tpl';
			}
		}
		
		$this->render();
	}

	protected function format_description($description) {
		$description = preg_replace('/<[^>]+>/i', ' ', html_entity_decode($description, ENT_QUOTES, 'UTF-8'));

		return trim(utf8_substr($description, 0, 600));
	}
}
?>
