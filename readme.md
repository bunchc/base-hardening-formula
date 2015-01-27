## Description

This is a SaltStack formula to provide basic 'first step' server hardening.

Specifically it:
- Installs:
    + fail2ban
    + psad
    + aide
    + logwatch
- Sets a number of ```net.ipv4.*``` values to sane defaults
- Configures IPTables to:
    + Permit SSH
    + Permit Salt traffic
    + Permit User defined ports
    + Deny all other inbound traffic

## Pillar

Pillar is used to configure the email address to send logwatch reports to. Additionally to specify the ports & protocols for IPTables.

```
logwatch:
  mailto: email@address.com

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
```
