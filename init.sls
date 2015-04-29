include:
  # Set sane sysctl defaults
  - .sysctl
  # Configure IPTables
  - base-hardening-formula.firewall-base
  # Turn up logging
  - .base-hardening-formula
