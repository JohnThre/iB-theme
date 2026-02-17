# Security Policy

## Supported Versions

We actively support the following versions of iB-theme with security updates:

| Version | Supported          |
| ------- | ------------------ |
| 1.2.x   | :white_check_mark: |
| 1.1.x   | :white_check_mark: |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability in iB-theme, please report it responsibly:

### How to Report

1. **Email**: Send details to `jnc@freew.org` with subject "Security Vulnerability - iB-theme"
2. **GitHub**: Create a private security advisory on our [GitHub repository](https://github.com/JohnThre/iB-theme/security/advisories)

### What to Include

Please include the following information in your report:

- Description of the vulnerability
- Steps to reproduce the issue
- Potential impact assessment
- Suggested fix (if available)
- Your contact information for follow-up

### Response Timeline

- **Initial Response**: Within 48 hours
- **Assessment**: Within 1 week
- **Fix Development**: Within 2 weeks (depending on severity)
- **Public Disclosure**: After fix is released and users have time to update

### Security Best Practices

When using iB-theme:

1. **Download from Official Sources**: Only download from:
   - GitHub releases: https://github.com/JohnThre/iB-theme/releases
   - VS Code Marketplace (when available)
   - GNU ELPA (when available)

2. **Verify Checksums**: Check file integrity when downloading releases

3. **Keep Updated**: Use the latest version to ensure you have security fixes

4. **Installation Scripts**: Review installation scripts before execution

### Scope

This security policy covers:

- Theme files (JSON, Emacs Lisp, VIM script)
- Installation scripts
- Documentation and configuration files
- Build and CI/CD processes

### Out of Scope

The following are outside our security scope:

- Third-party editors and their security
- User system configuration issues
- Network-related vulnerabilities in editors
- Issues in dependencies we don't control

## Security Features

iB-theme implements several security measures:

- **No Network Access**: Theme files don't make network requests
- **No Code Execution**: Pure configuration files without executable code
- **Minimal Permissions**: Installation scripts use minimal required permissions
- **Input Validation**: Installation scripts validate inputs and file paths
- **Error Handling**: Proper error handling prevents information disclosure

## Contact

For security-related questions or concerns:

- **Security Email**: jnc@freew.org
- **General Issues**: https://github.com/JohnThre/iB-theme/issues
- **Project Maintainer**: [@JohnThre](https://github.com/JohnThre)

---

**Note**: This security policy is effective as of August 29, 2025, and applies to iB-theme version 1.2.0 and later.