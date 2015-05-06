## Description

This is a SaltStack formula to provide basic 'first step' server hardening.

Specifically it:
- Removes write access from system folders and commands
- Disables coredumps via limits
- Sets a number of ```net.ipv4.*``` values to sane defaults
- Hardens SSH
- Installs & configures:
    + logwatch
- Configures IPTables to:
    + Permit SSH
    + Permit Salt traffic
    + Permit User defined ports
    + Deny all other inbound traffic

## Pillar

Pillar is used to add allowed ports to iptables as well as configure the system folders & ssh settings.

```
logwatch:
  mailto: email@address.com

# iptables allowed ports
user-ports:
  ssh:
    chain: INPUT
    proto: tcp
    dport: 22
  salt-master:
    chain: INPUT
    proto: tcp
    dport: 4505
  salt-minion:
    chain: INPUT
    proto: tcp
    dport: 4506

# system paths to remobe write access from
user-paths:
  - /usr/local/sbin
  - /usr/local/bin
  - /usr/sbin
  - /usr/bin
  - /sbin
  - /bin

# SSH Settings
company: "Amazing Smoothies"
ssh_port: 2222
ssh_prot: 2
ssh_rootlogin: no
ssh_PasswordAuthentication: yes
```
