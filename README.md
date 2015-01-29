Freifunk Rheinland Uplink
=========================

A role to connect a server to the Freifunk Rheinland Backbone.
You find further information at [Freifunk Hamburg IPv4-Uplink](http://wiki.freifunk.net/Freifunk_Hamburg/IPv4Uplink)
and [Freifunk KBU](https://kbu.freifunk.net/wiki/index.php?title=FFRL-Uplink).

Requirements
------------

You need a Freifunk Gateway and peering information from Freifunk Rheinland.

Role Variables
--------------

Default variables:
```
ffrl_kernel_table: 203
```

Group-specific variables:
```
ffrl_ipv4_net: 185.66.194.32/29
ffrl_ipv6_net: 2a03:2260:1004::/48

ffrl_ownas:  65528
ffrl_as   : 201701
```

Host-specific variables:
```
router_id: 10.207.0.57

ffrl_peers:
  -
    name: "ffrl_fra3_a"
    #gre tunnel config
    local_ipv4 : 176.9.41.253
    remote_ipv4: 185.66.194.0
    #bgp peer config
    own_transport_ipv4 : 100.64.0.61
    peer_transport_ipv4: 100.64.0.60
    own_transport_ipv6 : 2a03:2260:0:24::2
    peer_transport_ipv6: 2a03:2260:0:24::1
    bgp_password: "***"
    bgp_local_pref: 200

  -
    name: "ffrl_fra3_b"
    local_ipv4 : 176.9.41.253
    remote_ipv4: 185.66.194.1
    own_transport_ipv4 : 100.64.0.63
    peer_transport_ipv4: 100.64.0.62
    own_transport_ipv6 : 2a03:2260:0:25::2
    peer_transport_ipv6: 2a03:2260:0:25::1
    bgp_password: "***"
    bgp_local_pref: 200
```

see also: defaults/main.yml

Example Playbook
----------------

    - hosts: supernodes
      roles:
        - { role freifunk.ffrl_uplink }

License
-------

BSD
