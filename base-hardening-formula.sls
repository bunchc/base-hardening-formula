include:
  - base-hardening-formula.firewall-base

software-requirements:
  pkg.installed:
    - pkgs:
      - fail2ban 
      - psad
      - aide
      - fwsnort
      - logwatch

debconf-postfix:
  debconf.set:
    - name: postfix
    - data:
        'postfix/main_mailer_type': {'type': 'select', 'value': 'No configuration'}
        'postfix/mailname': {'type': 'string', 'value': '{{ salt['grains.get']('hostname') }}'}
    - require_in:
      - pkg: software-requirements

debconf-fwsnort:
  debconf.set:
    - name: fwsnort
    - data:
      'fwsnort/download': {'type': 'boolean', 'value': 'true'}
    - require_in:
      - pkg software-requirements


/etc/cron.daily/00logwatch:
  file:
    - managed
    - template: jinja
    - source: salt://base-hardening-formula/cron.daily/00logwatch
    - require:
      - pkg: software-requirements
