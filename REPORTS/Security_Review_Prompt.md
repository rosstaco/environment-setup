# Security Review Prompt for Environment Setup Repository

## Context
This prompt is designed for Large Language Models to conduct comprehensive security reviews of infrastructure automation scripts and playbooks.

**Target LLM**: Claude 3.5 Sonnet (Anthropic) - Optimized for code analysis and security assessment
**Review Type**: Infrastructure Automation Security Analysis
**Scope**: Shell scripts (zsh/bash), Ansible playbooks, PowerShell scripts

## Prompt Template

```
You are a cybersecurity expert conducting a comprehensive security review of an infrastructure automation repository. 

## Repository Overview
This repository contains multiple approaches to automating development environment setup:
- **macOS**: Pure zsh scripts using Homebrew
- **Ansible R1**: Cross-platform Ansible playbooks (script-to-ansible conversion)
- **Ansible R2**: Enhanced Ansible playbooks (planning-driven with AI assistance)

## Review Requirements

### 1. Script Security Analysis
Analyze each script/playbook for:
- **Remote Code Execution**: Downloads and executes remote scripts
- **Privilege Escalation**: sudo usage, administrator requirements
- **Input Validation**: User input handling, argument parsing
- **Path Injection**: Environment variable manipulation
- **Shell Injection**: Command construction vulnerabilities
- **File System Security**: File permissions, directory creation
- **Network Security**: HTTPS usage, certificate validation

### 2. Tool Security Assessment
For each installed tool, evaluate:
- **Known Vulnerabilities**: CVE database check
- **Supply Chain Risk**: Official sources, package integrity
- **Privilege Requirements**: Installation permissions needed
- **Update Mechanisms**: How tools are maintained/updated

### 3. Platform-Specific Risks
- **macOS**: Homebrew security, code signing, Gatekeeper bypass
- **Ubuntu/Debian**: APT repository security, GPG key validation
- **Windows**: PowerShell execution policy, winget security

### 4. Risk Classification
Use this matrix:
- **Critical (🔴)**: Remote code execution, privilege escalation without validation
- **High (🟠)**: Integrity bypass, credential exposure
- **Medium (🟡)**: Input validation issues, insecure defaults
- **Low (🟢)**: Information disclosure, minor configuration issues

### 5. Compliance Considerations
- **Enterprise Security**: Corporate policy compliance
- **Regulatory**: SOX, GDPR, HIPAA implications for data handling
- **Industry Standards**: NIST, CIS benchmarks alignment

## Output Format

Generate a comprehensive security report including:

1. **Executive Summary** with risk overview
2. **Critical Issues** requiring immediate attention
3. **Detailed Findings** by file/component
4. **Tool Security Matrix** with vulnerability status
5. **Remediation Recommendations** with code examples
6. **Compliance Assessment**
7. **Risk Matrix** with prioritized actions

## Review Focus Areas

### High Priority
- Remote script execution without verification
- Privilege escalation patterns
- Input sanitization
- Certificate validation

### Medium Priority
- Version pinning
- Error handling
- Logging security
- Configuration management

### Low Priority
- Code quality
- Documentation completeness
- Best practices alignment

## Success Criteria
A successful review should:
- Identify all security vulnerabilities with risk ratings
- Provide actionable remediation steps
- Include specific code examples for fixes
- Consider real-world deployment scenarios
- Balance security with usability

---

**Note**: This prompt should be updated as the repository evolves and new security considerations emerge.
```

## Usage Instructions

1. **Preparation**: Ensure LLM has access to all repository files
2. **Context**: Provide current repository structure and any recent changes
3. **Execution**: Run full prompt with repository contents
4. **Review**: Validate findings against current security standards
5. **Action**: Implement recommended fixes and update documentation

## Maintenance

- **Quarterly Reviews**: Regular security assessments
- **Post-Change Reviews**: After significant script modifications
- **Tool Updates**: When new tools are added to installation list
- **Vulnerability Alerts**: When new CVEs affect installed tools

## Version History

- **v1.0** (2025-05-29): Initial prompt creation - Claude 3.5 Sonnet optimized
- **v1.1** (TBD): Next iteration based on review outcomes
