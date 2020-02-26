<?php    
class ControllerErrorNotFound extends Controller {    
	public function index() { 
		$this->language->load('error/not_found');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_not_found'] = $this->language->get('text_not_found');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => '&nbsp;<i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i><i class="fa fa-angle-right" style="font-size:16px;color:#2a6495"></i>&nbsp; '
		);

		$this->template = 'error/not_found.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());	
	}
}
?>