<?php if ($message): ?>
	<p><?php echo $message; ?></p>
<?php endif;?>
<?php if ($user_id): ?>
Hi, <strong><?php echo $username; ?></strong>! You are logged in now. <?php echo anchor('/auth/logout/', 'Logout'); ?>
<?php else: ?>
Hi, stranger! You should try to log in. <?php echo anchor('/auth/login/', 'Login'); ?>
<?php endif;?>