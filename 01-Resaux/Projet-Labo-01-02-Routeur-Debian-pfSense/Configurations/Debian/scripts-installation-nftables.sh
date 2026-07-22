#!/bin/bash

###########################################################
# Projet-Labo 02 - Routeur Debian & pfSense
# Script : installation-nftables.sh
#
# Description :
# Active le service nftables, recharge la configuration
# présente dans /etc/nftables.conf et vérifie son état.
#
# Ce script reprend les commandes utilisées dans le PDF.
###########################################################

echo "======================================="
echo " Préparation du service nftables"
echo "======================================="

# Vérification des privilèges administrateur
if [ "$EUID" -ne 0 ]; then
    echo "Erreur : ce script doit être exécuté avec sudo."
    exit 1
fi

# Vérification de la présence de nftables
if ! command -v nft >/dev/null 2>&1; then
    echo "Erreur : nftables n'est pas installé sur cette machine."
    echo "Le PDF ne précise pas la commande d'installation du paquet."
    exit 1
fi

# Vérification de la présence du fichier de configuration
if [ ! -f /etc/nftables.conf ]; then
    echo "Erreur : le fichier /etc/nftables.conf est introuvable."
    exit 1
fi

echo "Activation de nftables au démarrage..."
systemctl enable nftables

echo "Redémarrage du service nftables..."
systemctl restart nftables

echo "Vérification de l'état du service..."
systemctl --no-pager --full status nftables

echo ""
echo "Vérification des règles chargées..."
nft list ruleset
