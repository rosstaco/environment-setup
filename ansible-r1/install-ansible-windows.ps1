# Install Ansible on Windows (native)
# This script installs Python (via winget) and Ansible (via pip)

# Install Python if not installed
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    winget install -e --id Python.Python.3 --accept-package-agreements --accept-source-agreements
}

# Ensure pip is available and up to date
python -m ensurepip --upgrade
python -m pip install --upgrade pip

# Install Ansible via pip
python -m pip install --user ansible

Write-Host "Ansible installation complete. You may need to restart your shell for 'ansible' to be available in PATH."
