# Projet-Labo-01-3-DHCP-Linux

## Présentation

Ce projet a pour objectif d'installer, configurer et valider un **serveur DHCP (Dynamic Host Configuration Protocol)** sous **Debian Linux**.

Réalisé dans un environnement virtualisé, ce laboratoire permet de comprendre le fonctionnement du protocole DHCP ainsi que son déploiement dans une infrastructure réseau. Le serveur Debian est configuré afin de distribuer automatiquement les paramètres réseau (adresse IP, masque, passerelle, serveur DNS et nom de domaine) aux postes clients connectés au réseau local.

Au cours de ce projet, j'ai étudié le fonctionnement du protocole DHCP, mis en place un serveur **isc-dhcp-server**, configuré un pool d'adresses IP, puis vérifié son bon fonctionnement à l'aide d'un poste client Windows configuré en attribution automatique d'adresse IP.

Ce laboratoire m'a également permis d'approfondir le fonctionnement de la méthode **DORA (Discover – Offer – Request – Acknowledge)**, mécanisme fondamental utilisé par le protocole DHCP pour attribuer dynamiquement une configuration réseau aux clients. :contentReference[oaicite:0]{index=0}

---

# Objectifs du projet

Au cours de ce laboratoire, j'ai appris à :

- Comprendre le fonctionnement du protocole DHCP.
- Comprendre le processus DORA (Discover, Offer, Request, Acknowledge).
- Installer le rôle **isc-dhcp-server** sous Debian.
- Configurer l'adresse IP statique d'un serveur Debian.
- Configurer l'interface réseau utilisée par le serveur DHCP.
- Configurer un pool d'adresses IP.
- Définir un nom de domaine distribué par le serveur DHCP.
- Configurer le serveur DNS distribué aux clients.
- Définir la passerelle par défaut.
- Configurer les durées de bail DHCP.
- Distribuer automatiquement une configuration réseau aux postes clients.
- Vérifier le bon fonctionnement du serveur DHCP à l'aide d'un poste client Windows.

---

# Technologies utilisées

## Systèmes

- Debian Linux
- Windows Client

## Protocoles réseau

- DHCP
- IPv4
- UDP
- DORA

## Services

- isc-dhcp-server

## Outils

- VirtualBox
- Nano
- Bash

---

# Contenu du projet

Ce laboratoire est composé de plusieurs étapes :

## 1. Étude du protocole DHCP

- Présentation du protocole DHCP.
- Fonctionnement de la méthode DORA.
- Utilisation des ports UDP 67 (serveur) et 68 (client).

---

## 2. Mise en place de l'infrastructure

- Configuration du serveur Debian.
- Configuration du routeur.
- Mise en place d'un poste client Windows.
- Présentation de la topologie réseau.

---

## 3. Installation du serveur DHCP

- Installation du paquet **isc-dhcp-server**.
- Configuration de l'interface réseau.
- Activation du service DHCP.

---

## 4. Configuration du serveur DHCP

- Configuration du domaine **tarantino.family**.
- Configuration du serveur DNS.
- Définition de la passerelle par défaut.
- Configuration du pool d'adresses IP.
- Définition des durées de bail.

---

## 5. Vérification du fonctionnement

- Configuration du client en DHCP.
- Attribution automatique des paramètres réseau.
- Vérification avec la commande **ipconfig /all**.

---

# Organisation du projet

```text
Projet-Labo-01-3-DHCP-Linux/
│
├── README.md
│
├── documentation/
│   └── Projet-Labo-01-3-DHCP-Linux.pdf
│
├── machines-virtuelles/
│   └── README.md
│
├── configurations/
│   ├── interfaces
│   ├── isc-dhcp-server
│   └── dhcpd.conf
│
├── commandes/
│   ├── installation.txt
│   ├── configuration.txt
│   └── verification.txt
│
└── schemas/
    └── topologie-reseau.png
```

---

# Compétences développées

- Administration d'un serveur Debian.
- Installation et configuration d'un serveur DHCP.
- Compréhension du protocole DHCP.
- Mise en œuvre de la méthode DORA.
- Configuration d'un service réseau sous Linux.
- Gestion d'un pool d'adresses IP.
- Configuration des paramètres réseau distribués aux clients.
- Déploiement d'un service d'infrastructure réseau.
- Vérification et validation d'un service DHCP.
- Diagnostic d'une configuration réseau.

---

# Niveau

**Débutant / Intermédiaire**
