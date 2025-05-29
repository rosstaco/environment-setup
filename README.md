# Environment Setup Automation

This repository contains multiple approaches to automating the setup of a modern development environment across different operating systems. Each approach offers different trade-offs between simplicity, functionality, and cross-platform support.

## 🚀 Quick Start (Recommended)

For the fastest setup on macOS, use the **macOS zsh script**:

```zsh
cd macos
chmod +x mac-setup.zsh
./mac-setup.zsh
```

This is the quickest way to get a working development environment on macOS.

## 🧠 Learnings from AI-Assisted Development Iterations

This repo shows the evolution of infrastructure automation through AI-assisted development, demonstrating how different AI approaches yield different results and learnings.

### 📁 What's Inside

- **`/macos/`** - Original AI itteration: building a zsh script (baseline/foundation)
- **`/ansible-r1/`** - Second AI iteration: Converting existing script to Ansible
- **`/ansible-r2/`** - Thirs AI iteration: Building from planning docs with Context7 MCP


## 🛠️ Core Development Environment

All iterations install the same essential development tools:

- **Package Managers**: Homebrew (macOS), apt (Ubuntu), winget (Windows)
- **Version Control**: Git, GitHub CLI
- **Cloud Tools**: Azure CLI
- **Shells**: PowerShell
- **Node.js Ecosystem**: NVM, Node.js LTS
- **Optional Tools**: .NET SDK, Python/pyenv, VS Code, Docker

## 📚 Getting Started

### For Quick Setup (macOS)
```zsh
cd macos
chmod +x mac-setup.zsh
./mac-setup.zsh
```

### For Cross-Platform Ansible Setup

#### Prerequisites
- **Ubuntu/Linux**: Requires `sudo` privileges for package installation
- **Windows**: Requires Administrator privileges for PowerShell execution
- **macOS**: No special privileges required (uses Homebrew)

#### 1. Install Ansible
```bash
# macOS
cd ansible-r2  # or ansible-r1
./install-ansible-macos.sh

# Ubuntu/Linux (requires sudo)
cd ansible-r2  # or ansible-r1
sudo ./install-ansible-ubuntu.sh

# Windows (as Administrator)
cd ansible-r2  # or ansible-r1
.\install-ansible-windows.ps1
```

#### 2. Run Setup
```bash
ansible-playbook dev-setup.yml
```

### Security Note
⚠️ **Important**: These scripts download and execute code from remote sources. Review the scripts before running in production environments.


## 📄 License

MIT License - Feel free to use, modify, and distribute as needed.
