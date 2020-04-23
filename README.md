# Ansible Shared Roles

Generic shared ansible roles for use in multiple ansible projects.

This is meant to be separate from your main ansible repo and symlinked into your roles folder

For example:

Main ansible is ~/Code/ansible
Clone this repo into ~/Code/ansible-shared
ln -s ~/Code/ansible-shared ~/Code/ansible/playbooks/roles/shared


# Requirements

These shared roles are geared toward Debian 9 and 10 with a few compatible with Ubuntu.

These shared roles assume a fresh stock Debian base with the main user being `toor`.


# Snippets

Quick helpers to remember common tasks


```yaml
# Detect Manjaro
- name: Configure Manjaro mirrorlist for linstore nginx proxy
  include_tasks: manjaro.yml
  when: ansible_os_family == "Archlinux" and ansible_lsb.id == "ManjaroLinux"

# Copy profiles to /etc/profile.d/
- include_tasks: ../../../functions/copy_etc-profile.d.yml

# Copy scripts to /usr/local/bin
- include_tasks: ../../../functions/copy_usr-local-bin.yml

# Copy nginx.conf
- name: Copying /etc/nginx/nginx.conf
  copy:
    src: nginx/nginx.conf
    dest: /etc/nginx/nginx.conf
    owner: root
    group: root
    mode: '0644'
  notify: restart nginx

# Install common apps for all debian machines
- name: Installing Debian common applications
  apt:
    update_cache: yes
    state: present
    name:
      - apt-transport-https
      - openssh-server

# Creat directory /etc/nginx
- name: Create a directory if it does not exist
  file:
    path: /etc/nginx
    state: directory
    owner: toor
    group: toor
    mode: '0755'

# Set chown toor:toor -R /etc/nginx
- name: Applying ownership of /etc/nginx
  file:
    path: /etc/nginx
    state: directory
    recurse: yes
    owner: toor
    group: toor

```
