include:
  # Set sane sysctl defaults
  - .sysctl

  # Configure IPTables
  - .firewall-base

  # Harden SSH
  - .ssh

  # Turn up logging
  - .base-hardening-formula
