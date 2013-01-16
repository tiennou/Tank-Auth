<?php
$login = array(
	'name'	=> 'login',
	'id'	=> 'login',
	'value' => set_value('login'),
	'maxlength'	=> 80,
	'size'	=> 30,
);
if ($login_by_username AND $login_by_email) {
	$login_label = lang('auth_form_email_login');
} else if ($login_by_username) {
	$login_label = lang('auth_form_login');
} else {
	$login_label = lang('auth_form_email');
}
$password = array(
	'name'	=> 'password',
	'id'	=> 'password',
	'size'	=> 30,
);
$remember = array(
	'name'	=> 'remember',
	'id'	=> 'remember',
	'value'	=> 1,
	'checked'	=> set_value('remember'),
	'style' => 'margin:0;padding:0',
);
$captcha = array(
	'name'	=> 'captcha',
	'id'	=> 'captcha',
	'maxlength'	=> 8,
);
?>
<?php echo form_open($this->uri->uri_string()); ?>
<table>
	<tr>
		<td><?php echo form_label($login_label, $login['id']); ?></td>
		<td><?php echo form_input($login); ?></td>
		<td style="color: red;"><?php echo form_error($login['name']); ?><?php echo isset($errors[$login['name']])?$errors[$login['name']]:''; ?></td>
	</tr>
	<tr>
		<td><?php echo form_label(lang('auth_form_password'), $password['id']); ?></td>
		<td><?php echo form_password($password); ?></td>
		<td style="color: red;"><?php echo form_error($password['name']); ?><?php echo isset($errors[$password['name']])?$errors[$password['name']]:''; ?></td>
	</tr>

	<?php if($show_captcha) : if($use_recaptcha) : ?>
	<tr>
		<td colspan="2">
			<div id="recaptcha_image"></div>
		</td>
		<td>
			<a href="javascript:Recaptcha.reload()"><?php echo lang('auth_captcha_reload')?></a>
			<div class="recaptcha_only_if_image"><a href="javascript:Recaptcha.switch_type('audio')"><?php echo lang('auth_captcha_reload_audio')?></a></div>
			<div class="recaptcha_only_if_audio"><a href="javascript:Recaptcha.switch_type('image')"><?php echo lang('auth_captcha_reload_image')?></a></div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="recaptcha_only_if_image"><?php echo lang('auth_captcha_enter_image')?></div>
			<div class="recaptcha_only_if_audio"><?php echo lang('auth_captcha_enter_audio')?></div>
		</td>
		<td><input type="text" id="recaptcha_response_field" name="recaptcha_response_field" /></td>
		<td style="color: red;"><?php echo form_error('recaptcha_response_field'); ?></td>
		<?php echo $recaptcha_html; ?>
	</tr>
	<?php else : ?>
	<tr>
		<td>&nbsp;</td>
		<td>
			<p>
				<?php echo lang('auth_captcha_enter'); ?><br>
				<img src="<?php echo $captcha_html; ?>" id="captcha" /><br />
			<a class="small" href="javascript:void(0)" onclick="document.getElementById('captcha').src='<?php echo site_url(); ?>captcha/captcha.php?'+Math.random(); document.getElementById('captcha-form').focus();" id="change-image"><?php echo lang('auth_captcha_change'); ?></a><br/><br/><input type="text" name="captcha" id="captcha-form" autocomplete="off" /></p>
		</td>
		<td style="color: red;"><?php echo form_error('captcha'); ?><?php echo isset($errors['captcha']) ? $errors['captcha'] : ''; ?></td>
	</tr>
	<?php endif; endif; ?>

	<tr>
		<td colspan="3">
			<?php echo form_checkbox($remember); ?>
			<?php echo form_label(lang('auth_form_remember'), $remember['id']); ?>
			<?php echo anchor('/auth/forgot_password/', lang('auth_page_forgot_password')); ?>
			<?php if ($this->config->item('allow_registration', 'tank_auth')) echo anchor('/auth/register/', lang('auth_page_register')); ?>
		</td>
	</tr>
</table>
<?php echo form_submit('submit', lang('auth_form_login_submit')); ?>
<?php echo form_close(); ?>