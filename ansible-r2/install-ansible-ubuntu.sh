#!/bin/bash
# install-ansible-ubuntu.sh
# Installs Ansible on Ubuntu/Debian via apt

set -e

echo "🔄 Updating package cache..."
apt update

echo "📦 Installing software-properties-common..."
apt install -y software-properties-common

echo "➕ Adding Ansible PPA..."
add-apt-repository --yes --update ppa:ansible/ansible

echo "📦 Installing Ansible..."
apt install -y ansible

echo "✅ Ansible installation complete."

# Install community.general collection for homebrew module
echo "📦 Installing community.general collection..."
ansible-galaxy collection install community.general

echo "🎉 Setup complete! You can now run:"
echo "  ansible-playbook dev-setup.yml -K"
