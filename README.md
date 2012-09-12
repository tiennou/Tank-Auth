Tank Auth w/ Role-Based Access Control (RBAC)
==============================================

> **This is Under Development and is not usable in its current form**. If you're fine using my previous fork of Tank Auth which features a basic role system then please use that for now.

This new version of Tank Auth implements the **Role-Based Access Control** method. This makes it more flexible than any of my previous commits. For more info on RBAC, refer to [this RBAC post](http://www.tonymarston.net/php-mysql/role-based-access-control.html 'Role-Based Access Control').

To do:
------
1. **Completed** - *Replace default captcha with [Cool Captcha](http://code.google.com/p/cool-php-captcha/)*
1. **Completed** - *Add custom fields to the registration page*
1. **Ready for testing** - *Role-Based Access Controle (RBAC) w/ user-level overrides*
1. Buy myself an ice cream

Methods
-------
### Role-Based Access Control
- `permit()`: Used for checking if the user can do the permision you specify. All permissions are listed in the `permissions.permission` table.
- `get_roles()`: Returns a multidimensional array of a user's role/s.
- `add_override()` and `remove_override()`: Override permissions on a per-user basis. This allows you to give/take away permissions to users outside of their active role/s.
- `add_role()`, `remove_role()`, `change_role()`: Basic role management. If you'll be using any of these, be sure to create a role which allows it (preferably the *Admin* role).

More methods may have been added but those above are the ones you'll most likely be using.

### Custom Registration Fields
Always assign custom fields to the `$config['registration_fields']` array.

###### 1. Text input format: *`array(Name, Label, Rules, 'text', Attributes)`*
Usage:

	// Sample 1
	$config['registration_fields'][] = array('name', 'Full name', 'trim|required', 'text');
	
	// Sample 2 w/ optional attribute
	$attr = array('class'=>'bigfont');
	$config['registration_fields'][] = array('name', 'Full name', 'trim|required', 'text', $attr);

###### 2. Radio format: *`array(Name, Label, Rules, 'radio', Selection, Opening tag, Closing tag)`*
Usage:

	$selection = array(
		'm'=>'Male',
		'f'=>'Female'
	);
	
	// Sample 1
	$config['registration_fields'][] = array('gender', 'Gender', 'trim|required|alpha|max_length[1]', 'radio', $selection);
	
	// Sample 2 w/ <p> tags separating each radio item
	$config['registration_fields'][] = array('gender', 'Gender', 'trim|required|alpha|max_length[1]', 'radio', $selection, '<p>', '</p>');

Radio fields do not have any assigned default value (unlike checkbox fields).


###### 3. Select format: *`array(Name, Label, Rules, 'dropdown', Selection)`*
Usage:

	// Make the initial value '0' so the field will fail if selected
	$selection = array(
		'0'=>'- choose -',
		'US'=>'USA',
		'PH'=>'Philippines',
		'JP'=>'Japan'
	);
	$config['registration_fields'][] = array('country', 'Country', 'trim|required|callback__not_zero', 'dropdown', $selection);

The callback `_not_zero` simply returns `FALSE` only if the value is 0.

###### 4. Checkbox format: *`array(Name, Label, Rules, 'checkbox', Checkbox Label, Default Checked)`*
Usage:

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
