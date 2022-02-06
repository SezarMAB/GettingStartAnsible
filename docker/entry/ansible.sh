ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/id_ed25519 -C "root ansible"

echo 'eval $(ssh-agent) && ssh-add' >>/root/.bashrc

source /root/.bashrc

# ssh-copy-id -i ~/.ssh/id_ed25519.pub linux_ansible_01
# ssh-copy-id -i ~/.ssh/id_ed25519.pub linux_ansible_02
# ssh-copy-id -i ~/.ssh/id_ed25519.pub linux_ansible_03
