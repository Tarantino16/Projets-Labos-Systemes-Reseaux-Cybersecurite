#!/bin/bash

###########################################################
# Projet-Labo 02 - Routeur Debian & pfSense
# Script : activation-routage.sh
#
# Description :
# Active le routage IPv4 sur Debian en modifiant
# le fichier /etc/sysctl.conf puis recharge la
# configuration avec sysctl -p.
###########################################################

echo "======================================="
echo " Activation du routage IPv4"
echo "======================================="

# Vérification des privilèges
if [ "$EUID" -ne 0 ]; then
    echo "Veuillez exécuter ce script avec sudo."
    exit 1
fi

# Activation du routage IPv4
sed -i 's/^#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf

# Recharge la configuration
sysctl -p

echo ""
echo "Etat du routage :"
cat /proc/sys/net/ipv4/ip_forward

echo ""
echo "Le routage IPv4 est désormais activé."
