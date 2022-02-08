
# Getting started with Ansible

## Getting started with Ansible 02 - SSH Overview & Setup

1. create an ssh key pair
    * ssh-keygen -t ed25519 -C "sezar default"
    * without prompt:
        * ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/id_ed25519 -C "root default" <<\<y > /dev/null 2>&1

2. copy that key to each server
    * ssh-copy-id -i ~/.ssh/id_ed25519.pub "IP-Address"
       * for specific port:
            * ssh-copy-id "-p 8129 user@host"
            * ssh-copy-id -i ~/.ssh/id_ed25519.pub -p 9500 root@localhost
       * test: sh root@localhost -p 9500

3. Create an ssh key that is specific to Ansible
    * ssh-keygen -t ed25519 -C "Ansible" -> without password

4. copy that key to each server
    * ssh-copy-id -i ~/.ssh/id_ed25519.pub -p 9500 root@localhost

5. connect test
    * ssh -i ~/.ssh/ansible root@localhost -p 9500
    to connect without geving the **.pub file:
        * eval $(ssh-agent)
        * ssh-add

## Getting started with Ansible 03 - Setting up the Git Repository

* install git and ansible

## Getting started with Ansible 04 - Running ad-hoc Commands

* check connection to servers
        * ansible all --key-file  ~/.ssh/id_ed25519 -i inventory -m ping
        inventory file contains server-IPs
* ansible.cfg contains setting as inventory path, private_key_file 

``` ansible
        [defaults]
        inventory = /hero/playbooks/inventory
        private_key_file = /root/.ssh/id_ed25519
```

* short command:  ansible all -m ping
* list of all hosts: ansible all --list-hosts
* meta data hosts: ansible all -m gather_facts / ansible all -m gather_facts --limit IP

## Getting started with Ansible 05 - Running elevated ad-hoc Commands

* run command in all remotes: $ ansible all -m apt -a update_cache=true
* as sudo: $ ansible all -m apt -a update_cache=true --become --ask-become-pass
* [ansible.apt module Docs](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html)
* example to install vim-nox: $ ansible all -m apt -a name=vim-nox
* if exists update to latest version: $ ansible all -m apt -a "name=snapd state=latest"
* to upgrade all packages: $ ansible all -m apt -a "upgrade=dist" 

## Getting started with Ansible 06 - Writing our first Playbook

### write first playbook: install_apache.yml

* Run the playbook: $ ansible-playbook /hero/playbooks/install_apache.yml
* to remove packages (absent): $ ansible-playbook /hero/playbooks/remove_apache.yml

## Getting started with Ansible 07 - The 'when' Conditional

``` ansible
    - name: install apache2 package
      apt:
        name: apache2
        state: latest
        # Conditional
      when: ansible_distribution == "Ubuntu"
```
