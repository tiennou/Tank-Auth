Tank Auth w/ Role-Based Access Control (RBAC)
==============================================

> **This Under Development and is not usable in its current form**. If you're fine using my previous fork of Tank Auth which features a basic role system then please use that instead.

This new version of Tank Auth implements the **Role-Based Access Control** method. This makes it more flexible than any of my previous commits. For more info on RBAC, refer to [this RBAC post](http://www.tonymarston.net/php-mysql/role-based-access-control.html 'Role-Based Access Control').

To do:
------
1. **Completed** - *Replace default captcha with [Cool Captcha](http://code.google.com/p/cool-php-captcha/)*
1. **Completed** - *Add custom fields to the registration page*
1. **For testing** - *RBAC integration*
1. Buy myself an ice cream
1. CI authentication for AJAX fields

This is a fork of [Tank Auth](http://www.konyukhov.com/soft/tank_auth/) by Ilya Konyukhov.

Methods
-------
- `permit()`: Used for checking if the user can do the permision you specify. All permissions are listed in the `permissions.permission` table.
- `get_roles()`: Returns a multidimensional array of a user's role/s.
- `add_override()` and `remove_override()`: Override permissions on a per-user basis. This allows you to give/take away permissions to users outside of their active role/s.
- `add_role()`, `remove_role()`, `change_role()`: Basic role management. If you'll be using any of these, be sure to create a role which allows it (preferably the *Admin* role).

More methods were added but those above are the ones you'll most likely be using.

Changelog
---------
1. Initial RBAC functionality achieved: Add/Remove/Change roles - *Sep 12, 2012*
1. Check permissions with the `permit()` method which allows you to override permissions on a user-level scope - *Sep 11, 2012*
1. Add custom fields to the registration page - *Sep 10, 2012*
1. Implement Cool Captcha instead of the default captcha - *Aug 29, 2012*
