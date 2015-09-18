#!/bin/bash

# ffrl-->vpn1
ip route add 185.66.194.32/29 via {{ vpn1-transportnet-ip4 }} table main

# vpn1-->ffrl, BGP schreibt default-Route in diese Table
ip rule from all iif vpn1 lookup ffrl
