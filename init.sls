include:
  # System Bits first
  ## Sysctl
  - .sysctl
  ## Limits
  - .limits
  ## Lockdown system files
  - .minimize_access

  # Configure IPTables
  - .firewall-base

  # Harden SSH
  - .ssh

  # Turn up logging
  - .base-hardening-formula