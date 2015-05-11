include:
  # System Bits first
  ## Sysctl
  - .sysctl
  ## Limits
  - .limits

  # Configure IPTables
  - .firewall-base

  # Harden SSH
  - .ssh

  # Turn up logging
  - .base-hardening-formula