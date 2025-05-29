#!/bin/zsh
# install-ansible-macos.sh
# Installs Homebrew (if needed) and Ansible on macOS

set -e

if ! command -v brew >/dev/null 2>&1; then
  echo "🍻 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "🍻 Homebrew already installed."
fi

echo "🔄 Updating Homebrew..."
brew update

echo "📦 Installing Ansible..."
brew install ansible

echo "📦 Installing community.general collection..."
ansible-galaxy collection install community.general

echo "✅ Ansible installation complete."
echo "🎉 You can now run:"
echo "  ansible-playbook dev-setup.yml -K"
