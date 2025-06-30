#!/bin/zsh


echo "🔧 Starting MacOS dev environment setup..."

echo "💻 This script will install the following tools:"
echo "  - 🍻 Homebrew - Mac Package manager (May prompt for elevated credentials)"
echo "  - 🐙 Git"
echo "  - 🚀 GitHub CLI"
echo "  - ☁️  Azure CLI"
echo "  - 🔌 PowerShell"
echo "  - 🌳 NVM (Node Version Manager)"
echo "  - 🟢 Node.js (LTS)"

echo " There are some optional tools you can install if you want to utilize local dev as opposed to DevContainers:"
echo "  - 🎯 .NET SDK"
echo "  - 🐍 Python and pyenv"
echo " If you don't have VS Code or Docker installed yet, you can also opt in:"
echo "  - 💻 Visual Studio Code"
echo "  - 📦 Docker"

# Parse arguments
INSTALL_DOTNET=false
INSTALL_PYTHON=false
INSTALL_VSCODE=false
INSTALL_DOCKER=false

while [[ "$#" -gt 0 ]]; do
  case $1 in
    --dotnet) INSTALL_DOTNET=true ;;
    --python) INSTALL_PYTHON=true ;;
    --vscode) INSTALL_VSCODE=true ;;
    --docker) INSTALL_DOCKER=true ;;
    --all)
      INSTALL_DOTNET=true
      INSTALL_PYTHON=true
      INSTALL_VSCODE=true
      INSTALL_DOCKER=true
      ;;
    *)
      echo "Unknown parameter passed: $1"
      exit 1
      ;;
  esac
  shift
done

# If no arguments provided, prompt interactively
if [ "$INSTALL_DOTNET" = false ] && [ "$INSTALL_PYTHON" = false ] && [ "$INSTALL_VSCODE" = false ] && [ "$INSTALL_DOCKER" = false ]; then
  read -q "REPLY?Install 🎯 .NET SDK? (y/n) "
  echo
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then INSTALL_DOTNET=true; fi

  read -q "REPLY?Install 🐍 Python? (y/n) "
  echo
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then INSTALL_PYTHON=true; fi

  read -q "REPLY?Install 💻 Visual Studio Code? (y/n) "
  echo
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then INSTALL_VSCODE=true; fi

  read -q "REPLY?Install 📦 Docker? (y/n) "
  echo
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then INSTALL_DOCKER=true; fi
fi

#exit on errors
set -e

# Install Homebrew if not installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Ensure Homebrew is in PATH for current shell
if [[ -d "/opt/homebrew/bin" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
elif [[ -d "/usr/local/bin" ]]; then
  export PATH="/usr/local/bin:$PATH"
fi

# Add Homebrew to .zshrc if not already present
if ! grep -q 'eval "$(/usr/local/bin/brew shellenv)"' ~/.zshrc; then
  echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zshrc
fi

brew update
brew upgrade

# Install Git and GitHub CLI
brew install git gh

#Install Git Credential Manager
brew install --cask git-credential-manager

# Install Azure CLI
brew install azure-cli

# Install Powershell
brew install --cask powershell

# Install NVM
brew install nvm
mkdir -p ~/.nvm

# Add NVM initialization to .zshrc if not already present
if ! grep -q 'NVM_DIR' ~/.zshrc; then
  cat << 'EOF' >> ~/.zshrc

# NVM setup
export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  source "/opt/homebrew/opt/nvm/nvm.sh"
elif [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
  source "/usr/local/opt/nvm/nvm.sh"
fi
EOF
fi

# Source NVM for current shell
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  source "/opt/homebrew/opt/nvm/nvm.sh"
elif [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
  source "/usr/local/opt/nvm/nvm.sh"
fi

# Install Node LTS and set default
nvm install --lts
nvm use --lts
nvm alias default node

# Verify npm is available
npm --version

if [ "$INSTALL_VSCODE" = true ]; then
  echo "Installing Visual Studio Code..."
  brew install --cask visual-studio-code
fi

if [ "$INSTALL_DOCKER" = true ]; then
  echo "Installing Docker..."
  brew install --cask docker
fi

if [ "$INSTALL_PYTHON" = true ]; then
  echo "Installing Python and pyenv..."
  brew install python@3.11 pyenv
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  # Note: Python versions can be managed per project with pyenv. No global version is set here.
  echo "pyenv installed. You can now use 'pyenv install <version>' and 'pyenv local <version>' in your projects."
fi

if [ "$INSTALL_DOTNET" = true ]; then
  echo "Installing .NET SDK..."
  curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel LTS 
fi


echo -e "\n\033[1;32m✅ MacOS development environment setup complete.\033[0m"