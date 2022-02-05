
# Getting started with Ansible

## Getting started with Ansible 02 - SSH Overview & Setup

1. create an ssh key pair
    $ ssh-keygen -t ed25519 -C "sezar default"

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

