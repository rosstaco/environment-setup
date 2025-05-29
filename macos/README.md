# Mac Dev Environment Setup Script

This script automates the setup of a modern development environment on macOS. It installs essential tools and offers optional installation of .NET SDK, Python, Visual Studio Code, and Docker.

## Features
- 🍻 Homebrew (Mac package manager)
- 🐙 Git
- 🚀 GitHub CLI
- ☁️ Azure CLI
- 🔌 PowerShell
- 🌳 NVM (Node Version Manager)
- 🟢 Node.js (LTS)
- 🎯 .NET SDK (optional)
- 🐍 Python and pyenv (optional)
- 💻 Visual Studio Code (optional)
- 📦 Docker (optional)

## Usage

### 1. Download the Script
Clone this repo or copy `mac-setup.zsh` to your Mac.

### 2. Make the Script Executable
```zsh
chmod +x mac-setup.zsh
```

### 3. Run the Script
You can run the script with or without arguments:

#### Interactive Mode (no arguments)
```zsh
./mac-setup.zsh
# or
zsh mac-setup.zsh
```
You will be prompted to choose whether to install optional tools.

#### Non-Interactive Mode (with arguments)
```zsh
./mac-setup.zsh [--dotnet] [--python] [--vscode] [--docker] [--all]
# or
zsh mac-setup.zsh [--dotnet] [--python] [--vscode] [--docker] [--all]
```
- `--dotnet` : Install .NET SDK
- `--python` : Install Python and pyenv
- `--vscode` : Install Visual Studio Code
- `--docker` : Install Docker
- `--all`    : Install all optional tools

### 4. What the Script Does
- Installs Homebrew if not present and ensures it is in your PATH
- Installs core tools: Git, GitHub CLI, Azure CLI, PowerShell, NVM, Node.js (LTS)
- Optionally installs: .NET SDK, Python/pyenv, VS Code, Docker
- Updates your `.zshrc` to ensure Homebrew, NVM, and Node are available in all new shells

## Notes
- The script uses emojis for a friendly CLI experience. If your terminal does not display them correctly, functionality is unaffected.
- You may be prompted for your password during Homebrew or other installations.
- After running, restart your terminal or run `source ~/.zshrc` to ensure all tools are available.

## Troubleshooting
- If you encounter issues, ensure you are running the script with zsh: `zsh ./mac-setup.zsh`
- For permission errors, try running with `sudo` (not usually required for Homebrew installs).

## License
MIT
