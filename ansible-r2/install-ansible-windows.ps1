# install-ansible-windows.ps1
# Installs Python (via winget) and Ansible (via pip) on Windows

# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "This script must be run as Administrator. Right-click PowerShell and select 'Run as Administrator'."
    exit 1
}

Write-Host "🐍 Installing Python via winget..." -ForegroundColor Green
try {
    winget install --id Python.Python.3.11 --accept-source-agreements --accept-package-agreements -e
} catch {
    Write-Warning "Python installation may have failed or Python is already installed."
}

# Refresh PATH to pick up Python
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")

Write-Host "🔄 Upgrading pip..." -ForegroundColor Green
python -m pip install --upgrade pip

Write-Host "📦 Installing Ansible via pip..." -ForegroundColor Green
pip install ansible

Write-Host "📦 Installing community.general collection..." -ForegroundColor Green
ansible-galaxy collection install community.general

Write-Host "✅ Ansible installation complete!" -ForegroundColor Green
Write-Host "🎉 You can now run:" -ForegroundColor Cyan
Write-Host "  ansible-playbook dev-setup.yml" -ForegroundColor White

Write-Host ""
Write-Host "Note: Windows support is now included in the dev-setup.yml playbook!" -ForegroundColor Green
Write-Host "The playbook will use winget to install tools on Windows." -ForegroundColor Yellow
