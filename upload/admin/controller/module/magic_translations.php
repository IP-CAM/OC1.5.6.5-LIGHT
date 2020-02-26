<?php
error_reporting(E_ALL);
class ControllerModuleMagicTranslations extends Controller {
    private $error = array(); 
     
    public function index() {
        if (isset($this->request->request['action']) && $this->request->request['action']) {
            switch ($this->request->request['action']) {
                case 'load':
                    $this->load();
                    return;
                case 'save':
                    $this->save();
                    return;
            }
        }
        $this->language->load('module/magic_translations');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('setting/setting');
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['button_frontend'] = $this->language->get('button_frontend');
        $this->data['button_backend'] = $this->language->get('button_backend');
        $this->data['table_page'] = $this->language->get('table_page');
        $this->data['table_key'] = $this->language->get('table_key');
        $this->data['filter_any_page'] = $this->language->get('filter_any_page');
        $this->data['filter_by_key'] = $this->language->get('filter_by_key');
        $this->data['filter_by_text_of_translation'] = $this->language->get('filter_by_text_of_translation');
        $this->data['text_you_edit_now'] = $this->language->get('text_you_edit_now');
        $this->data['filter_show_only_not_translated'] = $this->language->get('filter_show_only_not_translated');
        $this->data['text_loading'] = $this->language->get('text_loading');
        $this->data['button_load_more'] = $this->language->get('button_load_more');
        $this->data['text_help'] = $this->language->get('text_help');
        $this->data['text_help_description'] = $this->language->get('text_help_description');
        $this->data['tab_module'] = $this->language->get('tab_module');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
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
            'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
        );
        
        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('module/magic_translations', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
        );
		
		$isBackend = isset($_GET['backend']) && $_GET['backend'] ? 1 : 0;
        
        $this->data['action'] = $this->url->link('module/magic_translations', 'token=' . $this->session->data['token'] . '&backend=' . $isBackend, 'SSL');
        $this->data['frontend'] = $this->url->link('module/magic_translations', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['backend'] = $this->url->link('module/magic_translations', 'token=' . $this->session->data['token'] . '&backend=1', 'SSL');
        $this->data['token'] = $this->session->data['token'];

        $this->load->model('localisation/language');
        $this->data['languages'] = $this->model_localisation_language->getLanguages();

        $this->template = 'module/magic_translations.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );
                
        $this->response->setOutput($this->render());
    }
    
    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/magic_translations')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        
        if (!$this->error) {
            return true;
        } else {
            return false;
        }	
    }

    protected function load() {
			ob_start(); //it will be our errors handler
		
			if (isset($this->request->request['backend']) && $this->request->request['backend']) {
				$dir = DIR_LANGUAGE;
			} else {
				$dir = DIR_CATALOG . 'language/';
			}
		
			//get languages from DB
			$this->load->model('localisation/language');
			$aLangsDB = array();
			foreach($this->model_localisation_language->getLanguages() as $lang) {
				$aLangDB[$lang['directory']] = realpath($dir . '/' . $lang['directory'] . '/' . $lang['filename'] . '.php');
			}
		
			//get translations
			$tr = array();
			foreach($aLangDB as $lang => $common_file) {

				$tr[$lang] = array();
				
				if (!is_dir($dir . '/' . $lang)) {
					continue;
				}
				
				$dir_ = new RecursiveDirectoryIterator($dir . '/' . $lang);

				foreach (new RecursiveIteratorIterator($dir_) as $filename => $file) {
					$filename = realpath($filename);
					
					if (!is_file($filename)) {
						continue;
					}
					
					if (strpos($filename, '.svn') !== false || strpos($filename, '/.') !== false) {
						continue;
					}
				
					$filename = str_replace(array('\\', '//'), '/', $filename);

					$_ = array();
					include($filename);
					
					$filename_prep = '';
					if (realpath($dir . '/' . $lang) != realpath(dirname($filename))) {
						$filename_prep .= basename(dirname($filename)) . '/';
					}
									
					$filename_prep .= basename($filename);
					
					foreach($_ as &$translation) {
						$translation = mb_check_encoding($translation, 'UTF-8') ? $translation : utf8_encode($translation);
					}
					
					if (realpath($filename) == realpath($aLangDB[$lang])) {
						$tr[$lang]['common'] = $_;
					} else {
						$tr[$lang][$filename_prep] = $_;
					}
				}
			}
			
			//sometimes it may return warning, but this is not critical
			$json = @json_encode($tr);

			$output = trim(ob_get_contents());
			
			$error_keywords = array('Warning', 'Notice', 'Error');
			
			if ($output) {
				foreach ($error_keywords as $keyword) {
					if (strpos($output, $keyword) !== false) {
						ob_end_flush();
						die();
					}
				}
			}
			
			ob_end_clean();
		
		echo $json;
        
        //echo '<br/>--------------<br/>';
        //echo memory_get_usage()/1024 / 1024 . ' MB of memory has been used';
        die();
    }
    
    protected function save() {
		if (isset($this->request->request['backend']) && $this->request->request['backend']) {
			$dir = DIR_LANGUAGE;
		} else {
			$dir = DIR_CATALOG . 'language/';
		}
	
        $filename = $dir . $this->request->post['lang'] . '/' . $this->request->post['page'];

        $_ = array();
        
        if ($this->request->post['page'] == 'common') {
            $this->load->model('localisation/language');
            foreach($this->model_localisation_language->getLanguages() as $lang) {
                if ($lang['directory'] == $this->request->post['lang']) {
                    $filename = $dir . $this->request->post['lang'] . '/' . $lang['filename'] . '.php';
                    require($filename);
                    break;
                }
            }
        } elseif (!file_exists($filename)) {
            //no file exists
        } else {
            require($filename);
        }
        $filecontent = "<?php" . PHP_EOL;
        
        //add/changes translation in the array of translations
        $_[$this->request->post['key']] = html_entity_decode($this->request->post['translation']);
 
        foreach($_ as $key => $translation) {
            $translation = addcslashes($translation, "'");
            
            $filecontent .= '$_[\'' . $key . '\'] = \'' . $translation . '\';' . PHP_EOL;
        }
        
        $filecontent .= '?>';
        
		$pathinfo = pathinfo($filename);
		
		$this->make_path($filename, true);
        file_put_contents($filename, $filecontent);
        
        die('ok');
    }
	
	/*Create  Directory Tree if Not Exists
	If you are passing a path with a filename on the end, pass true as the second parameter to snip it off */
	function make_path($pathname, $is_filename=false, $mode = 0777){
	 
		if($is_filename){
	 
			$pathname = substr($pathname, 0, strrpos($pathname, '/'));
	 
		}
	 
		// Check if directory already exists
	 
		if (is_dir($pathname) || empty($pathname)) {
	 
			return true;
	 
		} 
	 
		// Ensure a file does not already exist with the same name
	 
		$pathname = str_replace(array('/', '\\'), DIRECTORY_SEPARATOR, $pathname);
	 
		if (is_file($pathname)) {
	 
			trigger_error('mkdirr() File exists', E_USER_WARNING);
	 
			return false;
	 
		} 
	 
		// Crawl up the directory tree
	 
		$next_pathname = substr($pathname, 0, strrpos($pathname, DIRECTORY_SEPARATOR));
	 
		if ($this->make_path($next_pathname, false, $mode)) {
	 
			if (!file_exists($pathname)) {
	 
				return mkdir($pathname, $mode);
	 
			}
	 
		} 
	 
		return false;
	 
	}
}
?>