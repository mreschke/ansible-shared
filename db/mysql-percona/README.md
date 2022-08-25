This is the new role for MySQL percona.

Do not use the deprecated mysql-percona-5.7 for new installations.

This role is more advanced with tons of customizable variables.

Example usage:

- role: mysql-percona
    vars:
    mysql_version_major: 8
    mysql_version_minor: 0
    mysql_datadir: "/opt/mysql"
    mysql_default_authentication_plugin: "mysql_native_password"
    mysql_innodb_buffer_pool_size: "3G"
    mysql_users:
        - name: mreschke
          pass: 'passhere'
          host: '%'
        - name: squaethem
        - name: tableau

See `defaults` for all variables.  See `tasks/users.yml` for all user options


~mReschke 2022-03-09
