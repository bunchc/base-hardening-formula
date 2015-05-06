openssh-client:
  pkg.installed

/etc/ssh/ssh_config:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://ssh/ssh_config.jinja
    - template: jinja
    - require:
      - pkg: openssh-client

openssh-server:
  pkg.installed

ssh:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
    - require:
      - pkg: openssh-client
      - pkg: openssh-server
      - file: /etc/ssh/banner
      - file: /etc/ssh/sshd_config

/etc/ssh/sshd_config:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://ssh/sshd_config.jinja
    - template: jinja
    - require:
      - pkg: openssh-server

/etc/ssh/banner:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://ssh/banner.jinja
    - template: jinja
    - require:
      - pkg: openssh-server
