# Ansible Dev Environment Setup (R2)

This is the second iteration of Ansible-based dev environment automation, built from planning documents using AI assistance with Context7 MCP for enhanced structure and best practices.

## Overview
Automates dev environment setup for macOS, Ubuntu, and Windows using Ansible with modern practices and improved structure compared to R1.

## Tools Installed
- 🍻 Homebrew (macOS)
- 🐙 Git
- 🚀 GitHub CLI (`gh`)
- ☁️ Azure CLI
- ⚡️ PowerShell
- 🌿 NVM (Node Version Manager)
- 🟢 Node.js (LTS)
- 🎯 .NET SDK (optional)
- 🐍 Python & pyenv (optional)
- 📝 Visual Studio Code (optional)
- 📦 Docker (optional)

## Quick Start

### 1. Install Ansible

**macOS:**
```bash
./install-ansible-macos.sh
```

**Ubuntu/Debian:** (requires sudo privileges)
```bash
chmod +x install-ansible-ubuntu.sh
sudo ./install-ansible-ubuntu.sh
```

**Windows (PowerShell as Administrator):**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\install-ansible-windows.ps1
```

### 2. Run the Ansible Playbook

**All Platforms:**
```bash
ansible-playbook dev-setup.yml
```

## Ansible Implementation Details

### Usage Notes
- **Interactive prompts** for optional tools during playbook execution
- **Idempotent**: Safe to run multiple times without issues
- **OS Detection**: Automatically detects platform and uses appropriate package managers
- **Cross-platform logic**: See playbook comments for OS-specific implementation details

### Playbook Structure
The `dev-setup.yml` playbook is organized with modern Ansible best practices:
- Platform-specific task organization
- Proper error handling and validation
- Idempotent task design
- Clear variable management

## Features
- ✅ Interactive prompts for optional tools
- ✅ Idempotent: safe to run multiple times
- ✅ Cross-platform support (macOS, Ubuntu, Windows)
- ✅ Uses appropriate package managers for each OS
- ✅ Enhanced structure compared to R1 iteration
