<?php 
class ControllerToolClearcache extends Controller { 
	
	public function index() {		
		$this->load->language('tool/clearcache');
		
		$this->vqmod(false);
		$this->system(false);
		$this->image(false);
		$this->minify(false);
		$this->seo(false);
		if (file_exists(DIR_SYSTEM . '../pagecache/caching.php')) { 
			$this->page(false);
		} 
		$this->session->data['success'] = $this->language->get('text_success_all');
		$this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'));
	}

	public function butimage() {		
		$this->load->language('tool/clearcache');
		
		$this->vqmod(false);
		$this->system(false);
		$this->minify(false);
		$this->seo(false);
		if (file_exists(DIR_SYSTEM . '../pagecache/caching.php')) { 
			$this->page(false);
		} 
		$this->session->data['success'] = $this->language->get('text_success_all');
		$this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'));
	}
	
	public function vqmod($redirect = true) {
		$this->load->language('tool/clearcache');
		$files = glob(DIR_SYSTEM . '../vqmod/vqcache/*');
		foreach($files as $file){
			$this->deldir($file);
		}
		
		if (file_exists(DIR_SYSTEM . '../vqmod/mods.cache')) {
			@unlink(DIR_SYSTEM . '../vqmod/mods.cache');
		}
		
		if ($redirect) {
			$this->session->data['success'] = $this->language->get('text_success_vqmod');
			$this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'));
		}
	}
	
	public function system($redirect = true) {
		$this->load->language('tool/clearcache');
		$files = glob(DIR_CACHE . 'cache.*');
		foreach($files as $file){
			$this->deldir($file);
		}
		if ($redirect) {
			$this->session->data['success'] = $this->language->get('text_success_system');
			$this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'));
		}	
	}
	
	public function image($redirect = true) {
		$this->load->language('tool/clearcache');

                $imgfiles = glob(DIR_IMAGE . 'cache/data/demo/*');
		foreach($imgfiles as $imgfile){
		     $this->deldir($imgfile);
		}
		if ($redirect) {
			$this->session->data['success'] = $this->language->get('text_success_image');
			$this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'));
		}	
	}
	
	public function minify($redirect = true) {
		$this->load->language('tool/clearcache');

        if ($minfiles = glob(DIR_CACHE . 'min/minify*')) {
			foreach($minfiles as $minfile){
		    	$this->deldir($minfile);
			}
		}
		if ($redirect) {
			$this->session->data['success'] = $this->language->get('text_success_minify');
			$this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'));
		}	
	}

	public function seo($redirect = true) {
		$this->load->language('tool/clearcache');

        if ($minfiles = glob(DIR_CACHE . 'seo/seo*')) {
			foreach($minfiles as $minfile){
		    	$this->deldir($minfile);
			}
		}
		if ($redirect) {
			$this->session->data['success'] = $this->language->get('text_success_seo');
			$this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'));
		}	
	}
	
	public function page($redirect = true) {
		$this->load->language('tool/clearcache');

                $pagefiles = glob(DIR_SYSTEM . '../pagecache/cachefiles/*');
		foreach($pagefiles as $pagefile){
		     $this->deldir($pagefile);
		}
		
		if ($redirect) {
			$this->session->data['success'] = $this->language->get('text_success_page');
			$this->redirect($this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'));
		}	
	}
	
        private function deldir($dirname) {         
		if(file_exists($dirname)) {
			if(is_dir($dirname)) {
				$dir=opendir($dirname);
				while($filename=readdir($dir)) {
					if($filename!="." && $filename!="..") {
						$file=$dirname."/".$filename;
						$this->deldir($file); 
					}
				}
				closedir($dir);  
				rmdir($dirname);
                        } else {
				@unlink($dirname);
			}			
		}
	}
}
?>