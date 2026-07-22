#  Projet-Labo 01-02 — Routeur Debian & pfSense

##  Présentation

Ce projet a pour objectif de concevoir, configurer et sécuriser une infrastructure réseau reposant sur deux solutions de routage distinctes : **Debian Linux** et **pfSense**.

Au travers de deux laboratoires complets réalisés dans un environnement virtualisé, j'ai appris à transformer un système Debian en routeur logiciel puis à déployer un pare-feu/routeur professionnel sous **pfSense**. Les travaux réalisés couvrent la configuration des interfaces réseau, l'activation du routage IPv4, la mise en œuvre du **NAT**, du **PAT**, des règles de pare-feu ainsi que la configuration des principaux services réseau nécessaires au bon fonctionnement d'une infrastructure d'entreprise.

Ce projet m'a permis d'approfondir le fonctionnement du routage, de la traduction d'adresses, du filtrage réseau et de la sécurisation des communications, tout en comparant une solution Open Source administrée en ligne de commande (**Debian**) à une solution dédiée administrée via une interface Web (**pfSense**).

---

#  Objectifs du projet

Au cours de ce laboratoire, j'ai appris à :

- Installer et configurer un routeur sous Debian Linux.
- Déployer et administrer un pare-feu/routeur pfSense.
- Configurer plusieurs interfaces réseau.
- Activer le routage IPv4.
- Mettre en œuvre le NAT (Network Address Translation).
- Configurer le PAT (Port Address Translation).
- Créer des règles de pare-feu avec **nftables**.
- Configurer le pare-feu de **pfSense**.
- Mettre en place un serveur DHCP.
- Vérifier la connectivité entre plusieurs réseaux.
- Sécuriser les échanges entre les différents segments du réseau.

---

#  Technologies utilisées

## Systèmes

- Debian Linux
- pfSense

## Réseau

- IPv4
- Routage IPv4
- NAT
- PAT
- DHCP
- Pare-feu
- Filtrage réseau

## Outils

- VirtualBox
- nftables
- Nano
- Bash

---

#  Contenu du projet

Ce laboratoire est composé de deux parties complémentaires :

## 1️ Routeur Debian

Déploiement d'un routeur logiciel sous Debian avec :

- Configuration des interfaces réseau.
- Activation du routage IPv4.
- Configuration de **nftables**.
- Mise en œuvre du NAT.
- Mise en œuvre du PAT.
- Création de règles de pare-feu.
- Validation de la connectivité réseau.

---

## 2️ Routeur pfSense

Déploiement d'un routeur professionnel sous **pfSense** avec :

- Installation de pfSense.
- Configuration des interfaces WAN et LAN.
- Configuration du DHCP.
- Configuration du NAT.
- Création des règles de pare-feu.
- Vérification du fonctionnement de l'infrastructure.

---

#  Organisation du projet

```text
Projet-Labo-02-Routeur-Debian-pfSense/
│
├── README.md
│
├── documentation/
│   └── Projet-Labo-02-Routeur-Debian-pfSense.pdf
│
├── configurations/
│   ├── debian/
│   │   ├── interfaces
│   │   ├── sysctl.conf
│   │   ├── nftables.conf
│   │   ├── scripts-activation-routage.sh
│   │   ├── scripts-installation-nftables.sh
│   │   └── scripts-verification.sh
│   │
│   └── pfsense/
│       ├── interfaces
│       ├── routage-nat&pat
│       └──  regles-firewall      
│
└── schemas/
    ├── architecture-debian.png
    └── architecture-pfsense.png

```

---

#  Compétences développées

- Administration d'un routeur Linux.
- Administration d'un pare-feu **pfSense**.
- Configuration des interfaces réseau.
- Routage entre plusieurs réseaux.
- Traduction d'adresses (**NAT/PAT**).
- Sécurisation des flux réseau.
- Mise en œuvre de règles de filtrage.
- Déploiement de services réseau.
- Diagnostic et validation d'une infrastructure.

---

##  Informations

**Difficulté :** Intermédiaire

**Environnement :** VirtualBox • Debian • pfSense

**Compétences validées :** Routage • NAT/PAT • Pare-feu • DHCP • Administration Linux
