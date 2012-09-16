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
			// Check for $data
			if($this->session->flashdata('notice_data')) extract($this->session->flashdata('notice_data'));
			
			switch($page){
				case 'registration-success':
					$data['page_title'] = 'Successful Registration';
					break;
				case 'registration-disabled':
					$data['page_title'] = 'Registration Disabled';
					break;	

					
				case 'acct-unapproved':
					$data['page_title'] = 'Account not yet Approved';
					break;
				
				
				case 'logged-out':
					$data['page_title'] = 'Logged Out';
					break;
					
					
				case 'activation-sent':
					$data['email'] = $email;
					$data['page_title'] = 'Activation Email Sent';
					break;	
				case 'activation-completed':
					$data['page_title'] = 'Activation Completed';
					break;	
					
					
				case 'activation-failed':
					$data['page_title'] = 'Activation Failed';
					break;	
				case 'password-changed':
					$data['page_title'] = 'Password Changed';
					break;	
				case 'password-sent':
					$data['page_title'] = 'New Password Sent';
					break;	
				case 'password-reset':
					$data['page_title'] = 'Password Reset';
					break;	
				case 'password-failed':
					$data['page_title'] = 'Password Failed';
					break;	
					
					
				case 'email-sent':
					$data['email'] = $new_email;
					$data['page_title'] = 'Confirmation Email Sent';
					break;	
				case 'email-activated':
					$data['page_title'] = 'Your Email has been Activated';
					break;	
				case 'email-failed':
					$data['page_title'] = 'Email Sending Failed';
					break;	
					
											
				case 'user-banned':
					$data['page_title'] = 'You have been Banned.';
					break;
				case 'user-deleted':
					$data['page_title'] = 'Your account has been Deleted.';
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