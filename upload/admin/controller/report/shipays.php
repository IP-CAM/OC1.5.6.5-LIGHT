<?php
class ControllerReportShipays extends Controller { 
	public function index() {   
		$this->load->language('report/shipays');

		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['heading_title'] = $this->language->get('heading_title');
    
		$this->data['text_all_status'] = $this->language->get('text_all_status');
    $this->data['text_shipays_shipping'] = $this->language->get('text_shipays_shipping');
    $this->data['text_shipays_payment'] = $this->language->get('text_shipays_payment');
    $this->data['text_shipays_zone'] = $this->language->get('text_shipays_zone');
    
		$this->data['entry_date_start'] = $this->language->get('entry_date_start');
		$this->data['entry_date_end'] = $this->language->get('entry_date_end');	
		$this->data['entry_status'] = $this->language->get('entry_status');
    
		$this->data['button_filter'] = $this->language->get('button_filter');
    
		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			$filter_date_start = date('Y-m-d', strtotime('-1 month'));
		}

		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$filter_date_end = date('Y-m-d', time());
		}
		
		if (isset($this->request->get['filter_order_status_id'])) {
			$filter_order_status_id = $this->request->get['filter_order_status_id'];
		} else {
			$filter_order_status_id = 0;
		}

		$url = '';
						
		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}
		
		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}
		
		if (isset($this->request->get['filter_group'])) {
			$url .= '&filter_group=' . $this->request->get['filter_group'];
		}		

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),       		
			'separator' => false
		);

		$this->data['token'] = $this->session->data['token'];
    
    $this->load->model('report/shipays');
		
    $columns = array(
      'shipping'     => $this->data['text_shipays_shipping'],
      'payment'      => $this->data['text_shipays_payment'],
      'payment_zone' => $this->data['text_shipays_zone']
    );
    
    $labels = array();
    $values = array();
    
    foreach($columns as $col => $column) {

		  $data = array(
		    'column'                 => $col,
		    'filter_date_start'	     => $filter_date_start, 
		    'filter_date_end'	       => $filter_date_end, 
		    'filter_order_status_id' => $filter_order_status_id
		  );
    
      // nacteni dat
      $results = $this->model_report_shipays->getShipays($data);

      // filtr nazvu dopravy (formou GROUP BY) 
      $results_new  = array(); // nove pole
      foreach ( $results as $key => $result ) {
        $findme = " ("; // odstrani info o cene dopravy 
        $pos = strpos($result['label'], $findme);
        if ($pos === false) {
          // not found
          $label = $result['label']; // = puvodni nazev 
        } else {
          $label = substr($result['label'], 0, $pos); // = zacatek nazvu
        }
        // existuje uz polozka?
        if ( isset($results_new[$label]) ) {
          // aktualizuje polozku
          $results_new[$label]['value'] += $result['value'];
        } else {
          // vytvori polozku
          $results_new[$label] = array(
            'label' => $label,
            'value' => $result['value']
          );
        } 
      } // foreach
      // nastavi nove pole dat 
      $results = $results_new;
      
      //var_dump($results);
      //echo "<p></p>";
      
      // prirazeni dat
      $order_max = 0; $order_sum = 0;    
      foreach ($results as $key => $result) {
        $labels[$col][$key] = str_replace(array('='), array(''), $result['label']);
        $values[$col][$key] = $result['value'];
        if ( $result['value'] > $order_max ) { $order_max = $result['value']; }
        $order_sum += $result['value'];
  		}
  	   
      // doplneni %
      foreach ($results as $key => $result) {
        $labels[$col][$key] = $result['label'] . " (" .$result['value'] . " = " . number_format((100* ($result['value'] / $order_sum )), 2) . "%)";
  		}
      
      // sorting array
      /*
      switch ($this->data['sort']) {
        case "customers":
          $regions = array_orderby('customers', SORT_DESC, SORT_NUMERIC, 'zone', SORT_ASC, SORT_STRING, $regions);
          break;
        case "zone":
          $regions = array_orderby('zone', SORT_ASC, SORT_STRING, $regions);
          break;
      } // switch
      $this->data['regions'] = $regions;
      */

      //$countrys = array_orderby('customers_total', SORT_DESC, SORT_NUMERIC, 'country', SORT_ASC, SORT_STRING, $countrys);
    
    } // columns
    
		$this->data['columns'] = $columns;
		$this->data['labels']  = $labels;		
		$this->data['values']  = $values;
    
		$this->data['filter_date_start'] = $filter_date_start;
		$this->data['filter_date_end']   = $filter_date_end;		
		$this->data['filter_order_status_id'] = $filter_order_status_id;
    
		$this->load->model('localisation/order_status');
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		$this->template = 'report/shipays.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE));
	}	
    
}
?>