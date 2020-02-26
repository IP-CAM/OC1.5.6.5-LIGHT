<?php
class ModelReportShipays extends Model {

	// zjisti kraje registrovanych zakazniku
  public function getShipays( $data = array() ) {
    
    // definice soupce dat
    switch ( $data['column'] ) {
      case "shipping":     $column = "shipping_method"; break;
      case "payment":      $column = "payment_method"; break;
      case "payment_zone": $column = "payment_zone"; break;
      default:             $column = false; break;
    } // switch

    // SQL - zacatek dotazu
    $sql = "SELECT COUNT(order_id) AS value " .
            ( $column ? ", " . $column . " AS label " : "" ) . " 
            FROM `" . DB_PREFIX . "order` o 
            ";

    // parametry WHERE

		if (isset($data['filter_order_status_id']) && $data['filter_order_status_id']) {
			$sql .= " WHERE order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE order_status_id > '0'";
		}
		
		if (isset($data['filter_date_start'])) {
			$date_start = $data['filter_date_start'];
		} else {
			$date_start = date('Y-m-d', strtotime('-1 month'));
		}

		if (isset($data['filter_date_end'])) {
			$date_end = $data['filter_date_end'];
		} else {
			$date_end = date('Y-m-d', time());
		}
		
		$sql .= " AND (DATE(date_added) >= '" . $this->db->escape($date_start) . "' AND DATE(date_added) <= '" . $this->db->escape($date_end) . "')";
    
    $sql .= ( $column ? " GROUP BY " . $column : "" ) . " ORDER BY value "; 
        
    $query = $this->db->query($sql);

		return $query->rows;
  } // getShipays



  /*
  column
  sorting order: SORT_ASC | SORT_DESC (optional)
  sorting type: SORT_NUMERIC | SORT_STRING (optional) 
  */
  // Seradi multi-pole = Sorting MultiArray + ORDER BY
  // $sorted_data = array_orderby('city', SORT_ASC, SORT_STRING, 'zip', SORT_DESC, SORT_NUMERIC, $data) // array_orderby (nova funkce 2014)
  public function array_orderby() {
    $params = func_get_args();
    $array = array_pop($params);
    
    if (!is_array($array)) {return false;}
  
    $multisort_params = array();
    foreach ($params as $i => $param) {
      if (is_string($param)) {
        ${"param_$i"} = array();
        foreach ($array as $index => $row) {
          ${"param_$i"}[$index] = $row[$param];
        } // foreach array
      } else { 
        ${"param_$i"} = $params[$i];
      }  
      $multisort_params[] = &${"param_$i"};
    } // forerach params
    
    $multisort_params[] = &$array; 
  
    call_user_func_array("array_multisort", $multisort_params);
    return $array;
  } // array_orderby

}

?>