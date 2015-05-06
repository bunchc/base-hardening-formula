# Disable Coredumps
/etc/security/limits.d/10.hardcore.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0400
    - source: salt://hardcore.jinja