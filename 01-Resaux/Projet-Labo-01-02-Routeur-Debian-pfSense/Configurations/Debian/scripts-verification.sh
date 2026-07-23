#!/bin/bash

###########################################################
# Projet-Labo-01-02-Routeur-Debian-pfSense
# Script : verification.sh
#
# Description :
# Vérifie le bon fonctionnement du routeur Debian
# après la configuration du NAT/PAT et du réseau.
#
# Vérifications :
# - Service nftables
# - Service networking
# - Accès Internet
###########################################################

echo "========================================"
echo " Vérification de la configuration"
echo "========================================"

echo ""
echo "===== Etat du service nftables ====="
systemctl status nftables --no-pager

echo ""
echo "===== Etat du service networking ====="
systemctl status networking --no-pager

echo ""
echo "===== Test de connectivité Internet ====="
ping -c 4 8.8.8.8

echo ""
echo "===== Vérification terminée ====="
