# Ansible Multi-OS Dev Environment Setup

This directory contains an Ansible playbook and install scripts to automate the setup of a development environment on macOS, Ubuntu, and Windows (via WSL or native).

## Tools Installed

- 🍻 **Homebrew** (macOS)
- 🐙 **Git**
- 🚀 **GitHub CLI** (`gh`)
- ☁️ **Azure CLI**
- ⚡️ **PowerShell**
- 🌿 **NVM** (Node Version Manager, macOS/Linux)
- 🟢 **Node.js (LTS)**
- 🎯 **.NET SDK** (optional)
- 🐍 **Python** and **pyenv** (optional, macOS/Linux)
- 📝 **Visual Studio Code** (optional)
- 📦 **Docker** (optional)

## Usage

### 1. Install Ansible
Run the appropriate script for your OS:

- **macOS:**
  ```zsh
  ./install-ansible-macos.sh
  ```
- **Ubuntu/Debian:** (requires sudo privileges)
  ```bash
  sudo ./install-ansible-ubuntu.sh
  ```
- **Windows (native):** (requires Administrator privileges)
  ```powershell
  ./install-ansible-windows.ps1
  ```

### 2. Run the Playbook
```sh
ansible-playbook dev-setup.yml
```
You will be prompted for which optional tools to install.

## Extending
Add more tasks to `dev-setup.yml` to support additional tools or OSes.


