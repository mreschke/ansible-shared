# Ansible Shared Roles

Generic shared ansible roles for use in multiple ansible projects.

This is meant to be separate from your main ansible repo and symlinked into your roles folder

For example:

Main ansible is ~/Code/ansible
Clone this repo into ~/Code/ansible-shared
ln -s ~/Code/ansible-shared ~/Code/ansible/playbooks/roles/shared
