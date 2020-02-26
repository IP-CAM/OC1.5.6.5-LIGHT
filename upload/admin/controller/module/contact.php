<?php
class ControllerModuleContact extends Controller {	

   public function index(){
		$this->language->load('module/contact');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('contact/contact');
	
		$this->data['heading_title']        = $this->language->get('heading_title');
        $this->data['text_contact']         = $this->language->get('text_contact');
		$this->data['text_module']          = $this->language->get('text_module');
		$this->data['button_delete']        = $this->language->get('button_delete');
		$this->data['text_no_results']      = $this->language->get('text_no_results');
		$this->data['button_cancel']        = $this->language->get('button_cancel');
		$this->data['button_read']        = $this->language->get('button_read');
		
		
		$this->data['column_name']               = $this->language->get('column_name');
		$this->data['column_email']              = $this->language->get('column_email');
		$this->data['column_ip']              = $this->language->get('column_ip');
		$this->data['column_description']        = $this->language->get('column_description');
		$this->data['heading_title_contact']     = $this->language->get('heading_title_contact');
		$this->data['column_action']             = $this->language->get('column_action');
		$this->data['text_view']                 = $this->language->get('text_view');
		$this->data['button_view']               = $this->language->get('button_view');
		$this->data['button_reply']              = $this->language->get('button_reply');
		$this->data['button_csv']              = $this->language->get('button_csv');
		
		
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
            'text'      => $this->language->get('heading_title_contact_list'),
            'href'      => $this->url->link('module/contact', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
        );
		
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if(isset($this->session->data['error']))
        {
            $this->data['error'] = $this->session->data['error'];
            unset($this->session->data['error']);
        }else{
            $this->data['error'] = '';
        }
        
        if(isset($this->session->data['success']))
        {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }else{
            $this->data['success'] = '';
        }	
	
		$this->data['execute'] = $this->url->link('module/contact/operation', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['csvfile'] = $this->url->link('module/contact/csvoutput', 'token=' . $this->session->data['token'], 'SSL');
		
		 $contact_info = $this->model_contact_contact->getContactinfo();
		 foreach($contact_info as $index=>$contactus){
			 $id = $contactus['contact_id'];
			 $contact_info[$index]['view'] = $this->url->link('module/contact/contact_details', 'token=' . $this->session->data['token'] .'&id='.$id, 'SSL');
			 $contact_info[$index]['reply'] = $this->url->link('module/contact/contact_reply', 'token=' . $this->session->data['token'] .'&id='.$id, 'SSL');
			 
		 }

			$this->data['contact_info'] = $contact_info;
			$this->template = 'module/contact.tpl';
			$this->children = array(
			'common/header',
			'common/footer'
			);
			
			$this->response->setOutput($this->render());
		
		}
		
	public function operation(){
		if(isset($this->request->post['execute'])){
			if($this->request->post['execute']=='delete'){
				  $this->delete();
				}
		  if($this->request->post['execute']=='markasread'){
				  $this->markasread();
				}		
		}
		$this->redirect($this->url->link('module/contact', 'token=' . $this->session->data['token'] , 'SSL'));
	}
	
   private function delete(){
		$this->load->model('contact/contact');
		if(isset($this->request->post['execute'])){
		if(isset($this->request->post['selected'])){
			foreach($this->request->post['selected'] as $contact_id)
        $this->model_contact_contact->deletecontact($contact_id);
		}else {
			$contact_id = isset($this->request->get['id'])?$this->request->get['id']:'';
			if($contact_id){
			$this->model_contact_contact->deletecontact($contact_id);	
			}
		}
	  }
	}
   
   private function markasread(){
	   $this->load->model('contact/contact');
			if(isset($this->request->post['execute'])){
		if(isset($this->request->post['selected'])){
			foreach($this->request->post['selected'] as $view_id)
				$this->model_contact_contact->insertvalue($view_id);
			}
			$this->redirect($this->url->link('module/contact', 'token=' . $this->session->data['token'] , 'SSL'));
		}
	}
	
	
		public function csvoutput(){
			    
				$this->load->model('contact/contact');
			    $csv_output = $this->model_contact_contact->csvdata();
				$filename = 'file.csv';
			    $output = "";
                
				$csv_terminated = "\n";
				$csv_separator = ",";
				$csv_enclosed = '"';
				$csv_escaped = "\\";
			   
				foreach ($csv_output as $out) {
				  $output .= $csv_enclosed .str_replace($csv_enclosed, $csv_escaped . $csv_enclosed, $out["firstname"]) . $csv_enclosed.$csv_separator;	
				  $output .= $csv_enclosed .str_replace($csv_enclosed, $csv_escaped . $csv_enclosed, $out["email"]) . $csv_enclosed.$csv_separator;	
					
				  
				  $output .= $csv_terminated;
	          }
	
				
			header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
            header("Content-Length: " . strlen($output));
			header("Content-type: text/x-csv");
			header("Content-Disposition: attachment; filename=$filename");
			echo $output;

		}
		
		
	  public function contact_details(){
		 
		$this->language->load('module/contact');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('contact/contact');
	
		$this->data['heading_title']        = $this->language->get('heading_title');
        $this->data['text_contact']         = $this->language->get('text_contact');
		$this->data['button_save']          = $this->language->get('button_save');
		$this->data['button_delete']        = $this->language->get('button_delete');
		$this->data['text_no_results']      = $this->language->get('text_no_results');
		$this->data['button_cancel']        = $this->language->get('button_cancel');
	
        $this->data['column_select']             = $this->language->get('column_select');
		$this->data['column_name']               = $this->language->get('column_name');
		$this->data['column_email']              = $this->language->get('column_email');
		$this->data['column_ip']              = $this->language->get('column_ip');
		$this->data['column_description']        = $this->language->get('column_description');
		$this->data['heading_title_contact']     = $this->language->get('heading_title_contact');
		$this->data['column_action']             = $this->language->get('column_action');
		$this->data['text_view']                 = $this->language->get('text_view');
		$this->data['column_action']             = $this->language->get('column_action');
		$this->data['button_view']               = $this->language->get('button_view');
		$this->data['button_cancel']             = $this->language->get('button_cancel');
		$this->data['button_reply']              = $this->language->get('button_reply');
		
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
            'text'      => $this->language->get('heading_title_contact_list'),
            'href'      => $this->url->link('module/contact', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
        );
		
		$this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title_contact_details'),
            'href'      => $this->url->link('module/contact', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
        );
		
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if(isset($this->session->data['error']))
        {
            $this->data['error'] = $this->session->data['error'];
            unset($this->session->data['error']);
        }else{
            $this->data['error'] = '';
        }
        
        if(isset($this->session->data['success']))
        {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }else{
            $this->data['success'] = '';
        }

		
		
		
		  $this->data['cancel'] = $this->url->link('module/contact', 'token=' . $this->session->data['token'], 'SSL');	
		  	
		 	$view_id = $this->request->get['id'];
			if($view_id){
				$this->model_contact_contact->insertvalue($view_id);
			}
          
		   $single_data = $this->model_contact_contact->getSingledata($this->request->get['id']);
		   
		   foreach($single_data as $contact){
           $this->data['reply'] = $this->url->link('module/contact/contact_reply', 'token=' . $this->session->data['token']. '&id='.$contact['contact_id'], 'SSL');
		   $this->data['execute'] = $this->url->link('module/contact/operation', 'token=' . $this->session->data['token']. '&id='.$contact['contact_id'], 'SSL');
		   }
		   
			$this->data['single_data'] = $single_data;
			$this->template = 'module/contact_details.tpl';
			$this->children = array(
			'common/header',
			'common/footer'
			);
			
			$this->response->setOutput($this->render());
		
		}
		
	  public function contact_reply(){
		$this->language->load('module/contact');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('contact/contact');
	
		$this->data['heading_title']        = $this->language->get('heading_title');
        $this->data['text_contact']         = $this->language->get('text_contact');
		$this->data['button_save']          = $this->language->get('button_save');
		$this->data['button_delete']        = $this->language->get('button_delete');
		$this->data['text_no_results']      = $this->language->get('text_no_results');
		$this->data['button_cancel']        = $this->language->get('button_cancel');
		$this->data['heading_title_contact_reply']        = $this->language->get('heading_title_contact_reply');
	
        
		$this->data['column_name']               = $this->language->get('column_name');
		$this->data['column_email']              = $this->language->get('column_email');
		$this->data['column_description']        = $this->language->get('column_description');
		$this->data['heading_title_contact']     = $this->language->get('heading_title_contact');
		$this->data['column_action']             = $this->language->get('column_action');
		$this->data['text_view']                 = $this->language->get('text_view');
		$this->data['column_action']             = $this->language->get('column_action');
		$this->data['button_view']               = $this->language->get('button_view');
		$this->data['button_cancel']             = $this->language->get('button_cancel');
		$this->data['button_reply']              = $this->language->get('button_reply');
		$this->data['button_send']               = $this->language->get('button_send');
		
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
            'text'      => $this->language->get('heading_title_contact_list'),
            'href'      => $this->url->link('module/contact', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
        );
		
		$this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title_contact_reply'),
            'href'      => $this->url->link('module/contact', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
        );
		
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if(isset($this->session->data['error']))
        {
            $this->data['error'] = $this->session->data['error'];
            unset($this->session->data['error']);
        }else{
            $this->data['error'] = '';
        }
        
        if(isset($this->session->data['success']))
        {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }else{
            $this->data['success'] = '';
        }

		$view_id = $this->request->get['id'];
			if($view_id){
				$this->model_contact_contact->insertvalue($view_id);
			}
		
		$this->data['send'] = $this->url->link('module/contact/sendMail', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('module/contact', 'token=' . $this->session->data['token'], 'SSL');		
		
          
		   $single_data = $this->model_contact_contact->getSingledata($this->request->get['id']);

			$this->data['single_data'] = $single_data;
			$this->template = 'module/contact_reply.tpl';
			$this->children = array(
			'common/header',
			'common/footer'
			);
			
			$this->response->setOutput($this->render());
		}		

		public function sendMail() {
		
		$this->language->load('module/contact');
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');				
			$mail->setTo($this->request->post['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($this->config->get('config_name'));
			$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
			$mail->setHtml(html_entity_decode($this->request->post['enquiry']));
			$mail->setText(strip_tags(html_entity_decode($this->request->post['enquiry'], ENT_QUOTES, 'UTF-8')));
			$mail->send();
           $this->session->data['success']=$this->language->get('reply_message');
			$this->redirect($this->url->link('module/contact', 'token=' . $this->session->data['token'] , 'SSL'));
	  }
	}

    public function install(){
        $this->load->model('contact/contact');
        
        $this->model_contact_contact->install();
    }
    
    public function uninstall(){        
        $this->load->model('contact/contact');
        
        $this->model_contact_contact->uninstall();
    } 
}
?>