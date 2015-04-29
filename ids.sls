# Install some NIDS/HIDS Stuffs
install-ids:
  pkg.installed:
    - pkgs:
      - fail2ban 
      - psad
      - aide
      - fwsnort

debconf-fwsnort:
  debconf.set:
    - name: fwsnort
    - data:
        'fwsnort/download': {'type': 'boolean', 'value': 'true'}
    - require_in:
      - pkg: install-ids
