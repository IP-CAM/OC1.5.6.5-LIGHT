<?php
/**
 * ControllerModulePurge
 *
 * Controller for module Purge
 *
 * PHP VERSION 5.3
 *
 * @category File
 * @package  Admin
 * @author   Andreas Tangemann <a.tangemann@web.de>
 * @license  http://opensource.org/licenses/gpl-3.0.html GNU Public License V3
 * @link     http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4900
 */
/**
 * ControllerModulePurge
 *
 * Controller for module Purge
 *
 * @category Controller
 * @package  Admin
 * @author   Andreas Tangemann <a.tangemann@web.de>
 * @license  http://opensource.org/licenses/gpl-3.0.html GNU Public License V3
 * @link     http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4900
 */
class ControllerModulePurge extends Controller
{
    /**
     * Array of all error messages
     */
    private $_error = array(); 
    
    /**
     * Display the index page for Controller Module Purge
	 * 
     * @return void
     */
    public function index() 
    {
        $this->load->language('module/purge');

        $this->document->setTitle($this->language->get('heading_title'));
		$this->data['success'] = "";

        if (($this->request->server['REQUEST_METHOD'] == 'POST') 
            && $this->_validate()
        ) {
            if ($this->_purge()===true) {
                $this->data['success'] 
                    = $this->language->get('text_success');
            } else {
				$this->data['error_warning'] 
					= $this->language->get('text_success');
            }
		}
                
        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['entry_models'] = $this->language->get('entry_models');
        $this->data['entry_mode'] = $this->language->get('entry_mode');
        $this->data['entry_mode_pro'] = $this->language->get('entry_mode_pro');
        $this->data['entry_mode_simple'] = $this->language->get('entry_mode_simple');
        $this->data['entry_tables'] = $this->language->get('entry_tables');
        $this->data['text_warning'] = $this->language->get('text_warning');
        $this->data['tab_simple'] = $this->language->get('tab_simple');
        $this->data['tab_pro'] = $this->language->get('tab_pro');
        $this->data['text_select_all'] = $this->language->get('text_select_all');
        $this->data['text_unselect_all'] 
            = $this->language->get('text_unselect_all');
        $this->data['button_purge'] = $this->language->get('button_purge');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        
        if (isset($this->_error['warning'])) {
            $this->data['error_warning'] = $this->_error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link(
                'common/home',
                'token=' . $this->session->data['token'],
                'SSL'
            ),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link(
                'extension/module',
                'token=' . $this->session->data['token'],
                'SSL'
            ),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link(
                'module/purge',
                'token=' . $this->session->data['token'],
                'SSL'
            ),
            'separator' => ' :: '
        );
        
        $this->data['action'] = $this->url->link(
            'module/purge',
            'token=' . $this->session->data['token'],
            'SSL'
        ) . '&delete'; // then safety question is done
        
        $this->data['cancel'] = $this->url->link(
            'extension/module',
            'token=' . $this->session->data['token'],
            'SSL'
        );

        $this->data['tables_simple'] = array();
        $this->load->language('catalog/attribute');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'catalog'
            , "module" => 'attribute'
        );
        $this->load->language('catalog/attribute_group');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'catalog'
            , "module" => 'attribute_group'
        );
        $this->load->language('catalog/category');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'catalog'
            , "module" => 'category'
        );
        $this->load->language('catalog/download');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'catalog'
            , "module" => 'download'
        );
        $this->load->language('catalog/manufacturer');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'catalog'
            , "module" => 'manufacturer'
        );
        $this->load->language('catalog/option');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'catalog'
            , "module" => 'option'
        );
        $this->load->language('catalog/product');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'catalog'
            , "module" => 'product'
        );
        $this->load->language('catalog/review');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'catalog'
            , "module" => 'review'
        );
        $this->load->language('design/banner');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'design'
            ,  "module" => 'banner'
        );
        $this->load->language('localisation/geo_zone');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'localisation'
            ,    "module" => 'geo_zone'
        );
        $this->load->language('localisation/tax_rate');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'localisation'
            ,    "module" => 'tax_rate'
        );
        $this->load->language('localisation/tax_class');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'localisation'
            , "module" => 'tax_class'
        );
        $this->load->language('sale/affiliate');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'sale'
            , "module" => 'affiliate'
        );
        $this->load->language('sale/coupon');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'sale'
            , "module" => 'coupon'
        );
        $this->load->language('sale/customer');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'sale'
            , "module" => 'customer'
        );
        $this->load->language('sale/customer_group');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'sale'
            , "module" => 'customer_group'
        );
        $this->load->language('sale/order');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'sale'
            , "module" => 'order'
        );
        $this->load->language('sale/return');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'sale'
            , "module" => 'return'
        );
        $this->load->language('sale/voucher');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'sale'
            , "module" => 'voucher'
        );
        $this->load->language('sale/voucher_theme');
        $this->data['tables_simple'][] = array(
            "value" => $this->language->get('heading_title')
            , "package" => 'sale'
            , "module" => 'voucher_theme'
        );
        sort($this->data['tables_simple']);

        // Get all the tables
        $sql = "show tables;";
        $query = $this->db->query($sql);
        
        // Filter tables
        $table_block = array(
			'currency',
			'extension',
			'information',
			'information_description',
			'information_to_layout',
			'information_to_store',
            'setting',
            'language',
            'store',
            'user',
            'user_group'
        );
        
        $this->data['tables_pro'] = array();
        foreach ($query->rows as $table) {
            $table = array_values($table);
            $filtertable = str_replace(DB_PREFIX, '', $table[0]);
            if (array_search($filtertable, $table_block)===false) {
                $this->data['tables_pro'][] = $table[0];
            }
        }
        
        $this->template = 'module/purge.tpl';
        $this->children = array(
            'common/header',
            'common/footer',
        );
                
        $this->response->setOutput($this->render());
    }
    
    /**
     * Constructor for class ControllerModuleTranslator
     * 
     * @return void
     */
    private function _purge() 
    {
        // Is the interface called with simple mode?
        $simple = $this->_isSimpleMode();
        
        // Retrieve selected tables
        $tables = $this->_retrieveTables($simple);
        
        // Processing
        if ($simple===true) {
            foreach ($tables as $table) {
				$tablearray = explode('/', $table);
                if (isset($tablearray[0]) && isset($tablearray[1])) {
                    $this->load->model($tablearray[0] . '/' . $tablearray[1]);
                    // Replace spaces with underscores
                    // Make first character uppercase
                    $model = str_replace(
                        " ", "", 'Model' 
                        . ucwords(str_replace("_", " ", $tablearray[0])) 
                        . ucwords(str_replace("_", " ", $tablearray[1]))
                    );
					
                    // Instantiate model class
                    $modelvar = new $model($this->registry);
					
                    // Build function name to get all records
                    // Functionname is different if model ends with y
                    // i.e. Currency -> getCurrencies
                    if (substr($tablearray[1], strlen($tablearray[1])-1, 1)==='y') {
                        $func = 'get' 
                            . ucwords(
                                str_replace(
                                    "_", 
                                    " ", 
                                    substr(
										$tablearray[1], 
										0, 
										strlen($tablearray[1])-1
									)
                                    . 'ie'
                                )
                            ) . 's';
                    } else {
                        $func = 'get' 
                            . ucwords(str_replace("_", " ", $tablearray[1])) . 's';
                    }
					
                    // Remove spaces
                    $func = str_replace(" ", "", $func);
					
                    // Functionname differs, if three 's' are found
                    $func = str_replace("sss", "sses", $func);
					
                    // Call function to get all records
                    $data = $modelvar->$func();
					
                    // Process all records
                    foreach ($data as $record) {
                        // Build function name to delete record
                        $func = str_replace(
                            " ", "", 'delete' 
                            . ucwords(str_replace("_", " ", $tablearray[1]))
                        );
                        // Build field name for id
                        $modelvar_id = $tablearray[1]."_id";
						
                        // Call delete function with id
                        $modelvar->$func($record[$modelvar_id]);
                    }
                }
            }
        } else {
            foreach ($tables as $table) {
                // Just build a sql statement to truncate table
                $sql = "TRUNCATE TABLE `" . $table . "`";
                $this->db->query($sql);
            }
        }

        return true;
    }

    /**
     * Is this module called with simple mode?
     *
     * @return boolean
     */
    private function _isSimpleMode() 
    {
        if ($this->request->post['mode']==='simple') {
            return true;
        }
        return false;
    }
    
    /**
     * Retrieve selected tables from POST variable
     *
     * @param String $simple Parameter from form
     * 
     * @return Array
     */
    private function _retrieveTables($simple) 
    {
        $tables = array();
        if ($simple===true) {
			if (isset($this->request->post['table_simple'])) {
				foreach ($this->request->post['table_simple'] as $table) {
					$tables[] = $table;
				}
            }
        } else {
			if (isset($this->request->post['table_pro'])) {
				foreach ($this->request->post['table_pro'] as $table) {
					$tables[] = $table;
				}
			}
        }
        return $tables;
    }
    
    /**
     * Validate access to this module
     *
     * @return  boolean
     */
    private function _validate() 
    {
        if (!$this->user->hasPermission('modify', 'module/purge')) {
            $this->_error['warning'] = $this->language->get('error_permission');
        }
        
        if (!$this->_error) {
            return true;
        } else {
            return false;
        }    
    }
}
?>