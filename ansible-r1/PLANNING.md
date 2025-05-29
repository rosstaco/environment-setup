# Planning: Multi-OS Dev Environment Automation

**Goal:**  
Automate the setup of a modern development environment for macOS, Ubuntu, and Windows, supporting both interactive and non-interactive installs, and ensuring all tools are available in the user’s shell.

## Requirements

1. **Supported OSes:**
   - macOS (zsh, Homebrew)
   - Ubuntu/Debian (bash/zsh, apt)
   - Windows (native, PowerShell, winget)

2. **Core Tools to Install (with emoji icons for clarity):**
   - 🍻 Homebrew (macOS)
   - 🐙 Git
   - 🚀 GitHub CLI (`gh`)
   - ☁️ Azure CLI
   - ⚡️ PowerShell
   - 🌿 NVM (Node Version Manager, macOS/Linux, via official script)
   - 🟢 Node.js (LTS, via NVM)
   - 🎯 .NET SDK (optional)
   - 🐍 Python and pyenv (optional, macOS/Linux)
   - 📝 Visual Studio Code (optional)
   - 📦 Docker (optional)

3. **Features:**
   - Interactive prompts for optional tools (dotnet, python, vscode, docker)
   - Command-line arguments for non-interactive installs
   - Idempotent: safe to run multiple times
   - Ensures tools are available in all new shells (e.g., NVM in .bashrc/.zshrc)
   - Clear, emoji-enhanced output and documentation

4. **Implementation:**
   - Use Ansible for cross-platform automation
   - Use the appropriate package manager/module for each OS:
     - `ansible.builtin.package` for Linux/macOS where possible
     - `homebrew` for macOS-specific tasks
     - `win_shell` with `winget` for Windows
     - Official install scripts for tools like NVM
   - Group Windows tasks for clarity
   - Add shell initialization for NVM after install

5. **Documentation:**
   - Root README.md: Overview, tool list with icons, usage instructions
   - ansible/README.md: Ansible-specific instructions, tool list with icons
   - README-legacy-mac-setup.md: For the old macOS-only script

6. **Install Scripts:**
   - install-ansible-macos.sh: Installs Homebrew (if needed) and Ansible
   - install-ansible-ubuntu.sh: Installs Ansible via apt
   - install-ansible-windows.ps1: Installs Python (via winget) and Ansible (via pip)

## Notes on Package Installation Differences

- **Homebrew**: Only available on macOS. Use `homebrew` Ansible module or shell commands. Not available on Linux/Windows.
- **apt**: Only available on Ubuntu/Debian. Use `ansible.builtin.apt` for package installs. Not available on macOS/Windows.
- **winget**: Only available on Windows 10/11. Use `win_shell` or `community.windows.win_package` for package installs. Not available on macOS/Linux.
- **NVM**: Install via official script on macOS and Linux. Not available natively on Windows (use nvm-windows or skip).
- **pyenv**: Available on macOS (via Homebrew) and Linux (via git or package manager). Not available on Windows.
- **PowerShell**: Use Homebrew on macOS, apt on Ubuntu, and winget on Windows.
- **Docker**: Use Homebrew cask on macOS, apt on Ubuntu, and winget on Windows.
- **VS Code**: Use Homebrew cask on macOS, apt or snap on Ubuntu, and winget on Windows.
- **.NET SDK**: Use official install script or Microsoft package for each OS.

### Handling Package Name Differences
- Use `ansible.builtin.package` for cross-platform installs where possible.
- Define package names for each tool as variables, mapping the correct name for each OS (e.g., `python3` for Ubuntu, `python@3.11` for macOS, etc.).
- Use Ansible facts (like `ansible_os_family` or `ansible_distribution`) to select the correct package name in tasks.
- For Windows, use `win_shell`, `win_command`, or `community.windows.win_package` with the appropriate package name.
- Example:
  ```yaml
  vars:
    python_package:
      Debian: python3
      Ubuntu: python3
      RedHat: python3
      MacOSX: python@3.11
  
  tasks:
    - name: Install Python
      ansible.builtin.package:
        name: "{{ python_package[ansible_os_family] | default('python3') }}"
        state: present
      when: ansible_os_family in python_package
  ```
- Document and comment on any tool or package with significant naming or installation differences.

### Implementation Guidance
- Use conditionals in Ansible playbooks to select the correct package manager/module for each OS.
- Document any tool that is not available or not recommended for a specific OS.
- For tools with different install methods, add comments or tasks explaining the OS-specific approach.

### Adding Custom apt Package Sources
- Use `ansible.builtin.apt_repository` to add new APT repositories (PPAs or custom sources) on Ubuntu/Debian.
- Use `ansible.builtin.apt_key` to add GPG keys for those repositories if required.
- Example for adding Microsoft package source for .NET SDK:
  ```yaml
  - name: Add Microsoft GPG key
    ansible.builtin.apt_key:
      url: https://packages.microsoft.com/keys/microsoft.asc
      state: present

  - name: Add Microsoft package repository
    ansible.builtin.apt_repository:
      repo: "deb [arch=amd64] https://packages.microsoft.com/ubuntu/{{ ansible_distribution_release }}/prod {{ ansible_distribution_release }} main"
      state: present
      filename: 'microsoft-prod'
  ```
- After adding the repository and key, use `ansible.builtin.apt` or `ansible.builtin.package` to install the desired package.
- This approach is idempotent and recommended for managing third-party or custom package sources in Ansible.

## Deliverables

- Ansible playbook (`dev-setup.yml`) supporting all above requirements
- Install scripts for each OS
- Updated documentation with tool list and usage
- Legacy macOS shell script and documentation preserved
