{% for file in salt['pillar.get']('user-paths',[]) %}

{{file}}:
  file.directory:
    - user: root
    - group: root
    - mode: 644

{% endfor %}


# shadow must only be accessible to user root
/etc/shadow:
  file.managed:
    - owner: root
    - group: root
    - mode: 0600

# su must only be accessible to user and group root
/bin/su:
  file.managed:
    - owner: root
    - group: root
    - mode: 0750