install-iptables:
  pkg.installed:
    - pkgs:
      - iptables

### INPUT RULES ###
# Stateful handling. Log & Drop the broken ones, allow established 
log invalid:
  iptables.append:
    - table: filter
    - chain: INPUT
    - match: state
    - connstate: INVALID
    - jump: LOG
    - save: True

drop invalid:
  iptables.append:
    - table: filter
    - chain: INPUT
    - match: state
    - connstate: INVALID
    - jump: DROP
    - save: True

allow established:
  iptables.append:
    - table: filter
    - chain: INPUT
    - match: state
    - connstate: ESTABLISHED
    - jump: ACCEPT
    - save: True

allow related:
  iptables.append:
    - table: filter
    - chain: INPUT
    - match: state
    - connstate: RELATED
    - jump: ACCEPT
    - save: True

#User Rules
{% for key,rule in salt['pillar.get']('user-ports',{}).items() %}
user-ports-{{key}}:
  iptables.append:
    - table: filter
    - chain: {{rule.get('chain', 'INPUT')}}
    - jump: ACCEPT
    - match: state
    - connstate: NEW
{% if rule.get('source') %}
    - source: {{rule.get('source')}}
{% endif %}
    - dport: {{rule.get('dport')}}
    - proto: {{rule.get('proto', 'tcp')}}
    - sport: 1025:65535
    - save: True
{% endfor %}

# Turn up logging, set default to drop
add logging:
  iptables.append:
    - table: filter
    - chain: INPUT
    - jump: LOG
    - save: True

default to drop:
  iptables.set_policy:
    - table: filter
    - chain: INPUT
    - policy: DROP

### OUTPUT RULES ###
log invalid output:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - match: state
    - connstate: INVALID
    - jump: LOG
    - save: True

drop invalid output:
  iptables.append:
    - table: filter
    - chain: OUTPUT
    - match: state
    - connstate: INVALID
    - jump: DROP
    - save: True