Tank Auth w/ Role-Based Access Control (RBAC)
==============================================

> **This is Under Development and is not usable in its current form**. If you're fine using my previous fork of Tank Auth which features a basic role system then please use that for now.

This new fork implements a **Role-Based Access Control** method popular in multiuser sites. This new release is bursting with so much vitamins and minderals it's practically it's own food group! Okay, maybe not. For more info on RBAC, refer to [this post](http://www.tonymarston.net/php-mysql/role-based-access-control.html 'Role-Based Access Control').

To do:
------
1. **Completed** - *Replace default captcha with [Cool Captcha](http://code.google.com/p/cool-php-captcha/)*
1. **Completed** - *Add custom fields to the registration page*
1. **Ready for testing** - *Role-Based Access Controle (RBAC) w/ user-level overrides*
1. Activation, Autoloading, and Acct Approval options
1. Buy myself an ice cream

Methods
-------
### Role-Based Access Control

All arguments for the following methods can be found by searching through the *Tank_auth* library and *Users* model. Lift those sticky fingers and *Ctrl-F* like your project depended on it!

- `permit()`: Used for checking if the user can do the permission you specify. All permissions are listed in the `permissions.permission` table. This is the most important method of all.
- `add_permission()` and `remove_permission()`: Add/Remove permissions to roles.
- `new_permission()`, `clear_permission()`, and `save_permission()`: Insert data in the `permissions` table.
- `add_override()`, `remove_override()`, and `flip_override()`: Override permissions on a per-user basis. This allows you to give/take away permissions to users outside of their active role/s.
- `add_role()`, `remove_role()`, `change_role()`: Basic role management. If you'll be using any of these, be sure to create a role which allows it (preferably the *Admin* role).

More methods may have been added but those above are the ones you'll most likely be using.

### Custom Registration Fields
Add extra fields to your registration page. Always assign custom fields to the `$config['registration_fields']` array in the *tank_auth.php* config file or else the sky will fall on your head.

> **How it works:** Field data is serialized in the `users.meta` table until the account is activated. After that, all data is transferred to the `profiles` table where it stays for the duration of the account.

**1. Text input format:** *`array(Name, Label, Rules, 'text', Attributes)`*

How to use:

	// Sample 1
	$config['registration_fields'][] = array('name', 'Full name', 'trim|required', 'text');
	
	// Sample 2 w/ optional attribute
	$attr = array('class'=>'bigfont');
	$config['registration_fields'][] = array('name', 'Full name', 'trim|required', 'text', $attr);

**2. Radio format:** *`array(Name, Label, Rules, 'radio', Selection, Opening tag, Closing tag)`*

How to use:

	$selection = array(
		'm'=>'Male',
		'f'=>'Female'
	);
	
	// Sample 1
	$config['registration_fields'][] = array('gender', 'Gender', 'trim|required|alpha|max_length[1]', 'radio', $selection);
	
	// Sample 2 w/ <p> tags separating each radio item
	$config['registration_fields'][] = array('gender', 'Gender', 'trim|required|alpha|max_length[1]', 'radio', $selection, '<p>', '</p>');

Radio fields do not have any assigned default value (unlike checkbox fields).


**3. Dropdown format:** *`array(Name, Label, Rules, 'dropdown', Selection)`*

How to use:

	// Make the initial value '0' so the field will fail if selected
	$selection = array(
		'0'=>'- choose -',
		'US'=>'USA',
		'PH'=>'Philippines',
		'JP'=>'Japan'
	);
	$config['registration_fields'][] = array('country', 'Country', 'trim|required|callback__not_zero', 'dropdown', $selection);

The callback `_not_zero` simply returns `FALSE` if the value is `0`.

**4. Checkbox format:** *`array(Name, Label, Rules, 'checkbox', Checkbox Label, Default Checked)`*

How to use:

	// Sample 1
	$config['registration_fields'][] = array('money', 'Money', 'trim|numeric', 'checkbox', 'I want money');
	
	// Sample 2: checkbox is checked by default
	$config['registration_fields'][] = array('money', 'Money', 'trim|numeric', 'checkbox', 'I want money', TRUE);

Examples
--------
Coming soon.

Changelog
---------
1. Initial RBAC functionality achieved: Add/Remove/Change roles - *Sep 12, 2012*
1. Check permissions with the `permit()` method which allows you to override permissions on a user-level scope - *Sep 11, 2012*
1. Add custom fields to the registration page - *Sep 10, 2012*
1. Implement Cool Captcha instead of the default captcha - *Aug 29, 2012*
