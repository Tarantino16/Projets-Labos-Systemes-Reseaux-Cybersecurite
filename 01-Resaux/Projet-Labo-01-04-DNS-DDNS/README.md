#  Projet-Labo-01-4-DNS-DDNS

##  Présentation

Ce projet a pour objectif de concevoir, configurer et valider une infrastructure **DNS primaire, DNS secondaire et DDNS (Dynamic Domain Name System)** sous **Debian Linux**.

Au travers de ce laboratoire réalisé dans un environnement virtualisé, j'ai appris à déployer une architecture DNS redondante composée d'un serveur DNS maître (DNS-1) et d'un serveur DNS secondaire (DNS-2), capables de gérer les zones de recherche directe et inversée tout en assurant leur synchronisation grâce au transfert de zones.

Le projet couvre également la mise en œuvre du **DDNS**, permettant au serveur DHCP de mettre automatiquement à jour les enregistrements DNS lors de l'attribution d'une adresse IP à un poste client. Afin de sécuriser ces mises à jour dynamiques, une authentification par **clé TSIG** est mise en place entre les services DHCP et DNS.

Enfin, ce laboratoire se termine par différentes vérifications permettant de contrôler le bon fonctionnement de l'infrastructure, la mise à jour automatique des zones DNS ainsi que l'analyse des journaux du service **Bind9**. :contentReference[oaicite:0]{index=0}

---

#  Objectifs du projet

Au cours de ce laboratoire, j'ai appris à :

- Comprendre le fonctionnement d'un serveur DNS.
- Déployer un serveur DNS primaire (DNS-1).
- Déployer un serveur DNS secondaire (DNS-2).
- Configurer le service **Bind9**.
- Configurer les fichiers **named.conf**, **named.conf.options** et **named.conf.local**.
- Créer une zone de recherche directe.
- Créer une zone de recherche inversée.
- Mettre en œuvre un transfert de zones entre deux serveurs DNS.
- Générer et utiliser une clé TSIG afin de sécuriser les échanges entre DHCP et DNS.
- Configurer un serveur DHCP pour mettre à jour automatiquement les enregistrements DNS.
- Mettre en œuvre le **DDNS (Dynamic DNS)**.
- Vérifier le bon fonctionnement des mises à jour dynamiques.
- Contrôler les journaux du service Bind9.

---

#  Technologies utilisées

## Systèmes

- Debian Linux
- Windows Client

## Services

- Bind9
- ISC DHCP Server
- DDNS

## Protocoles réseau

- DNS
- DDNS
- DHCP
- IPv4
- TSIG
- Transfert de zones DNS

## Outils

- VirtualBox
- Nano
- Bash

---

#  Contenu du projet

Ce laboratoire est composé de plusieurs parties complémentaires.

## 1. Rappel de la configuration du routeur Debian

- Configuration des interfaces réseau.
- Configuration du routage IPv4.
- Configuration du NAT.
- Vérification de la connectivité.

---

## 2. Configuration du serveur DNS primaire (DNS-1)

- Configuration réseau.
- Configuration de `resolv.conf`.
- Configuration de `named.conf`.
- Configuration de `named.conf.options`.
- Configuration de `named.conf.local`.
- Création des zones DNS.
- Génération de la clé TSIG.

---

## 3. Configuration du serveur DNS secondaire (DNS-2)

- Configuration réseau.
- Configuration de `resolv.conf`.
- Configuration de `named.conf.options`.
- Configuration de `named.conf.local`.
- Mise en œuvre du transfert de zones.

---

## 4. Configuration du serveur DHCP et du DDNS

- Configuration du serveur DHCP.
- Configuration du pool d'adresses.
- Définition des serveurs DNS distribués aux clients.
- Configuration des mises à jour dynamiques.
- Liaison sécurisée entre DHCP et DNS grâce à une clé TSIG.

---

## 5. Vérification et validation

- Vérification du fonctionnement du DHCP.
- Vérification des mises à jour automatiques du DNS.
- Contrôle des journaux Bind9.
- Vérification des zones DNS primaire et secondaire.
- Validation du transfert des zones.

---

#  Organisation du projet

```text
Projet-Labo-01-4-DNS-DDNS/
│
├── README.md
│
├── Documentation/
│   └── Projet-Labo-01-4-DNS-DDNS.pdf
│
├── Machines-Virtuelles/
│   └── README.md
│
├── Configurations/
│   ├── Routeur-Debian/
│   │   ├── interfaces
│   │   ├── nftables.conf
│   │   └── sysctl.conf
│   │
│   ├── DNS-1/
│   │   ├── interfaces
│   │   ├── resolv.conf
│   │   ├── named.conf
│   │   ├── named.conf.options
│   │   ├── named.conf.local
│   │   ├── named
│   │   ├── tarantino.family.dns
│   │   ├── 11.168.192.in-addr.arpa.dns
│   │   └── cle.txt
│   │
│   ├── DNS-2/
│   │   ├── interfaces
│   │   ├── resolv.conf
│   │   ├── named.conf.options
│   │   └── named.conf.local
│   │
│   └── DHCP/
│       ├── interfaces
│       ├── isc-dhcp-server
│       └── dhcpd.conf
│
├── Commandes/
│   ├── installation.txt
│   ├── configuration-routeur.txt
│   ├── configuration-dns-1.txt
│   ├── configuration-dns-2.txt
│   ├── configuration-dhcp-ddns.txt
│   ├── verification.txt
│   └── journal-bind9.txt
│
└── Schemas/
    └── schemas.png
```

---

#  Compétences développées

- Administration d'un serveur DNS sous Linux.
- Installation et configuration de Bind9.
- Création de zones DNS directes et inversées.
- Déploiement d'un serveur DNS primaire et secondaire.
- Configuration du transfert de zones DNS.
- Mise en œuvre d'un serveur DHCP avec mises à jour DNS dynamiques.
- Configuration et utilisation d'une clé TSIG.
- Sécurisation des échanges entre DHCP et DNS.
- Analyse des journaux Bind9.
- Validation d'une infrastructure DNS redondante.

---

#  Niveau

**Intermédiaire / Avancé**
