# Ansible Shared Roles

Generic shared ansible roles for use in multiple ansible projects.

This is meant to be separate from your main ansible repo and symlinked into your roles folder

For example:

Main ansible is ~/Code/ansible
Clone this repo into ~/Code/ansible-shared
ln -s ~/Code/ansible-shared ~/Code/ansible/playbooks/roles/shared


# Requirements

These shared roles are geared toward Debian 9 and 10 with a few compatible with Ubuntu.

File `playbooks/group_vars/all` has user directory like so...add all your users here
```
users:
  # Root and toor
  root:
    id: 0
    gid: 0
    password: '{{ root_linux_password }}'
  toor:
    id: 1000
    gid: 1000
    password: '{{ toor_linux_password }}'
    groups: '{{ superuser_groups }}'
```

File `playbooks/group_vars/Debian.yml` like so
```
# ------------------------------------------------------------------------------
# Debian specific variables
# ------------------------------------------------------------------------------
superuser: toor
supergroup: staff
sudogroup: sudo
superuser_groups: [sudo,users,staff,adm,cdrom,floppy,audio,dip,video,plugdev,netdev]
```

Make one for each of your OS types, a `ManjroLinux.yml` may look like so
```
# ------------------------------------------------------------------------------
# Manjaro specific variables
# ------------------------------------------------------------------------------
superuser: toor
supergroup: staff
sudogroup: wheel
superuser_groups: [wheel,users,staff,adm,sys,network,power,video,storage,lp,input,audio]
```

Your `ansible.cfg` should look about like so.
```
# Ansible configuration for defaults and path modifications
# mReschke 2020-04-02

[defaults]
remote_user = root
remote_tmp = /tmp/ansible-$USER
roles_path = ./roles
private_key_file = ~/.ssh/mreschke-root.key
vault_password_file = ~/.files/configs/ansible/vault.passwd
retry_files_enabled = False
display_skipped_hosts = False
force_color = 1
nocows = 1
```



# Snippets

Quick helpers to remember common tasks


```yaml
# Detect OS
when: ansible_os_family == "Debian" and ansible_distribution_major_version == "10"
when: ansible_distribution == "Ubuntu" and ansible_distribution_version == "16.04"
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

# Template in a loop
- name: Templating ~/.getmail/config
  template:
    src: getmail
    dest: '{{ "~" + item.username | expanduser }}/.getmail/config'
    owner: '{{ item.username }}'
    group: 'users'
    mode: '0644'
  with_items: "{{ getmail_users }}"

# Symlink in a loop
- name: Symlinking /store/apps/getmail to ~/Mail
  file:
    src: '/store/apps/getmail/{ item.email }'
    dest: '{{ "~" + item.username | expanduser }}/Mail'
    state: link
    owner: '{{ item.username }}'
    group: 'users'
  with_items: "{{ getmail_users }}"

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
    owner: '{{ superuser }}'
    group: '{{ superuser }}'
    mode: '0755'

# Set chown toor:toor -R /etc/nginx
- name: Applying ownership of /etc/nginx
  file:
    path: /etc/nginx
    state: directory
    recurse: yes
    owner: '{{ superuser }}'
    group: '{{ superuser }}'

```
