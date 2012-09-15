<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Notice extends CI_Controller {
	
	private $ci;
	private $flashdata_key;
	
	public function __construct(){
		parent::__construct();
		
		$this->flashdata_key = $this->config->item('flashdata_key', 'tank_auth');
	}
	
	public function index(){
		redirect('auth/login');
	}
	
	public function open($page){

		if($this->session->flashdata($this->flashdata_key)){
			
			switch($page){
				case 'successful-registration':
					$data['page_title'] = 'Successful Registration';
					break;
					
				case 'acct-unapproved':
					$data['page_title'] = 'Account not yet Approved';
					break;
				
				default:
					redirect('auth/login');
			}
			
			$data['body_class'] = $page;
			$this->load->view('landing/'.$page, $data);
		}
		else {
			redirect('auth/login');
		}

	}
	
}


/* End of file notice.php */
/* Location: ./application/controllers/notice.php */