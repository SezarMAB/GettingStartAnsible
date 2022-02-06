#!/bin/bash
# ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/id_ed25519 -C "root ansible"

# echo 'eval $(ssh-agent) && ssh-add' >>/root/.bashrc

# source /root/.bashrc

sshpass -p root ssh-copy-id -i /root/.ssh/id_ed25519.pub -o StrictHostKeyChecking=no 10.5.0.2
sshpass -p root ssh-copy-id -i /root/.ssh/id_ed25519.pub -o StrictHostKeyChecking=no 10.5.0.3
sshpass -p root ssh-copy-id -i /root/.ssh/id_ed25519.pub -o StrictHostKeyChecking=no 10.5.0.4
