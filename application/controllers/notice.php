<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Notice extends CI_Controller {
	
	public function index(){
		redirect('auth/login');
	}
	
	public function view($page){

		if($this->session->flashdata('tankauth_allow_notice', 'tank_auth')){
			// Check for $data
			if($this->session->flashdata('tankauth_notice_data')) extract($this->session->flashdata('tankauth_notice_data'));
			
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
				
				
				case 'logout-success':
					$data['page_title'] = 'Logged Out';
					break;
					
				// Activation
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
					
				// Password
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
					
				// Email
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
					
				// User
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