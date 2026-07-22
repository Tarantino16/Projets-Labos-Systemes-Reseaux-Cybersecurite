# Projet-Labo-01-01 — Fondamentaux Réseaux

## Présentation

Ce projet a pour objectif de mettre en pratique les **fondamentaux des réseaux informatiques** à travers la conception et la configuration de plusieurs architectures réseau réalisées sous **Cisco Packet Tracer**.

Le laboratoire est organisé autour de **quatre architectures progressives**, permettant d'aborder différentes problématiques rencontrées dans la conception et l'administration d'une infrastructure réseau : segmentation LAN/VLAN, DMZ, routage dynamique OSPF, accès Internet, EtherChannel et haute disponibilité.

Chaque architecture possède ses propres configurations d'équipements Cisco, postes clients et serveurs. Les configurations sont conservées individuellement afin de documenter précisément le rôle et le paramétrage de chaque équipement.

Le projet comprend également les fichiers de laboratoire **Packet Tracer** ainsi que les schémas des différentes architectures afin de conserver une représentation visuelle de l'infrastructure réalisée.

---

# Objectifs du projet

Au cours de ce laboratoire, j'ai appris à :

- Concevoir plusieurs architectures réseau.
- Configurer des routeurs Cisco.
- Configurer des switches Cisco.
- Configurer l'adressage IPv4.
- Mettre en place plusieurs réseaux et sous-réseaux.
- Configurer des VLAN.
- Segmenter une infrastructure réseau.
- Mettre en place une DMZ.
- Configurer le routage entre différents réseaux.
- Mettre en œuvre le routage dynamique OSPF.
- Mettre en place une architecture disposant d'un accès Internet.
- Configurer des liaisons EtherChannel.
- Étudier les principes de haute disponibilité.
- Configurer des postes clients en DHCP.
- Intégrer des serveurs dans différentes architectures.
- Tester et valider la communication entre les équipements.
- Documenter les configurations des équipements réseau.

---

# Technologies utilisées

## Réseau

- IPv4
- TCP/IP
- Ethernet
- Routage
- OSPF
- VLAN
- Trunk
- DMZ
- DHCP
- EtherChannel
- Haute disponibilité

## Équipements

- Routeurs Cisco
- Switches Cisco
- Postes clients
- Serveurs

## Outils

- Cisco Packet Tracer
- Cisco IOS
- Terminal Cisco
- Fichiers de configuration
- Schémas réseau

---

# Contenu du projet

Le laboratoire est composé de **quatre architectures réseau complémentaires**, chacune permettant de travailler sur une infrastructure différente.

## 1️ Architecture LAN / VLAN / DMZ

Cette première architecture permet de travailler sur la segmentation d'un réseau local avec :

- Configuration d'un routeur Cisco.
- Configuration de plusieurs switches.
- Configuration des postes clients.
- Attribution dynamique des paramètres réseau par DHCP.
- Mise en place de VLAN.
- Segmentation du réseau.
- Mise en place d'une DMZ.
- Intégration d'un serveur DHCP.
- Intégration d'un serveur Web.
- Vérification des communications entre les différents équipements.

Les configurations des équipements sont conservées individuellement :

- `r-1.txt`
- `sw-1.txt`
- `sw-2.txt`
- `sw-r-1.txt`

---

## 2️ Architecture OSPF / Internet

Cette deuxième architecture permet d'approfondir le **routage entre plusieurs équipements Cisco**.

Elle comprend notamment :

- Plusieurs routeurs Cisco.
- Configuration du routage dynamique OSPF.
- Échange automatique des routes.
- Interconnexion de plusieurs réseaux.
- Simulation d'une infrastructure disposant d'un accès Internet.
- Vérification des tables de routage.
- Tests de communication entre les différents réseaux.

Les configurations des routeurs sont documentées séparément :

- `r-2.txt`
- `r-3.txt`
- `r-4.txt`
- `r-5.txt`
- `r-6.txt`
- `r-7.txt`

---

## 3️ Architecture VLAN / EtherChannel

Cette troisième architecture permet d'étudier la **segmentation réseau et l'agrégation de liens**.

Elle comprend :

- Configuration d'un routeur Cisco.
- Configuration de plusieurs switches.
- Création et utilisation de VLAN.
- Configuration des postes clients en DHCP.
- Mise en place d'EtherChannel.
- Agrégation de plusieurs liens physiques.
- Communication entre les différents segments.
- Intégration d'un serveur Web.
- Vérification de la connectivité.

Les équipements Cisco documentés sont notamment :

- `r-8.txt`
- `sw-3.txt`
- `sw-4.txt`
- `sw-5.txt`

---

## 4️ Architecture Haute Disponibilité

Cette quatrième architecture constitue l'infrastructure la plus importante du laboratoire.

Elle permet d'étudier une architecture réseau comprenant :

- Plusieurs équipements Cisco.
- Plusieurs switches.
- Segmentation par VLAN.
- Postes clients configurés en DHCP.
- Plusieurs serveurs Web.
- Répartition des serveurs dans différents VLAN.
- Mise en place d'une infrastructure redondante.
- Étude des principes de haute disponibilité.
- Vérification des communications entre les différents réseaux.

Les configurations Cisco comprennent notamment :

- `r-9.txt`
- `sw-6.txt`
- `sw-7.txt`
- `sw-r-2.txt`
- `sw-r-3.txt`

L'architecture utilise également plusieurs serveurs Web répartis dans différents VLAN, documentés individuellement dans le projet.

---

# Organisation du projet

```text
Projet-Labo-01-01-Fondamentaux-Réseaux/
│
├── README.md
│
├── Configurations/
│   │
│   ├── 01-Architecture-LAN-VLAN-DMZ/
│   │   │
│   │   ├── Equipements-Cisco/
│   │   │   ├── r-1.txt
│   │   │   ├── sw-1.txt
│   │   │   ├── sw-2.txt
│   │   │   └── sw-r-1.txt
│   │   │
│   │   ├── Postes-Clients/
│   │   │   └── configuration-pc-dhcp.md
│   │   │
│   │   ├── Serveurs/
│   │   │   ├── serveur-dhcp.md
│   │   │   └── serveur-web-architecture-1.md
│   │   │
│   │   └── README.md
│   │
│   ├── 02-Architecture-OSPF-Internet/
│   │   │
│   │   ├── Equipements-Cisco/
│   │   │   ├── r-2.txt
│   │   │   ├── r-3.txt
│   │   │   ├── r-4.txt
│   │   │   ├── r-5.txt
│   │   │   ├── r-6.txt
│   │   │   └── r-7.txt
│   │   │
│   │   └── README.md
│   │
│   ├── 03-Architecture-VLAN-EtherChannel/
│   │   │
│   │   ├── Equipements-Cisco/
│   │   │   ├── r-8.txt
│   │   │   ├── sw-3.txt
│   │   │   ├── sw-4.txt
│   │   │   └── sw-5.txt
│   │   │
│   │   ├── Postes-Clients/
│   │   │   └── configuration-pc-dhcp.md
│   │   │
│   │   ├── Serveurs/
│   │   │   └── serveur-web-architecture-3.md
│   │   │
│   │   └── README.md
│   │
│   └── 04-Architecture-Haute-Disponibilite/
│       │
│       ├── Equipements-Cisco/
│       │   ├── r-9.txt
│       │   ├── sw-6.txt
│       │   ├── sw-7.txt
│       │   ├── sw-r-2.txt
│       │   └── sw-r-3.txt
│       │
│       ├── Postes-Clients/
│       │   └── configuration-pc-dhcp.md
│       │
│       ├── Serveurs/
│       │   ├── serveurs-web-vlan-010-red.md
│       │   ├── serveurs-web-vlan-020-orange.md
│       │   ├── serveurs-web-vlan-030-grey.md
│       │   ├── serveurs-web-vlan-040-brown.md
│       │   ├── serveurs-web-vlan-050-black.md
│       │   ├── serveurs-web-vlan-060-yellow.md
│       │   ├── serveurs-web-vlan-070-gold.md
│       │   ├── serveurs-web-vlan-080-green.md
│       │   ├── serveurs-web-vlan-090-cyan.md
│       │   ├── serveurs-web-vlan-100-cooper.md
│       │   ├── serveurs-web-vlan-110-silver.md
│       │   └── serveurs-web-vlan-120-salmon.md
│       │
│       └── README.md
│
├── Laboratoire-Packet-Tracer/
│   └── projet de conception d'architecture réseau.pkt
│
├── Documentation/
│   └── Projet-Labo-01-01-Fondamentaux-Réseaux.pdf
│
└── Schemas/
    ├── Topologie-Reseau-Architecture-1.png
    ├── Topologie-Reseau-Architecture-2.png
    ├── Topologie-Reseau-Architecture-3.png
    ├── Topologie-Reseau-Architecture-4.png
    └── Topologie-Reseau-Architecture-Globale.png
```

---

# Progression des architectures

Le projet a été construit de manière progressive :

```text
Architecture 01
LAN / VLAN / DMZ
       │
       ▼
Architecture 02
OSPF / Internet
       │
       ▼
Architecture 03
VLAN / EtherChannel
       │
       ▼
Architecture 04
Haute Disponibilité
```

Chaque architecture permet ainsi d'introduire de nouvelles notions tout en réutilisant les compétences acquises dans les précédentes.

---

# Compétences développées

- Conception d'architectures réseau.
- Configuration de routeurs Cisco.
- Configuration de switches Cisco.
- Administration via Cisco IOS.
- Configuration de l'adressage IPv4.
- Segmentation réseau.
- Configuration de VLAN.
- Configuration de liaisons Trunk.
- Mise en place d'une DMZ.
- Configuration du routage.
- Mise en œuvre du routage dynamique OSPF.
- Configuration d'EtherChannel.
- Configuration de postes clients en DHCP.
- Intégration de serveurs dans une infrastructure réseau.
- Conception d'une architecture à haute disponibilité.
- Diagnostic et validation de la connectivité.
- Documentation des configurations réseau.
- Création de schémas d'architecture.
- Utilisation de Cisco Packet Tracer pour la simulation d'infrastructures.

---

# Résultat

À l'issue de ce projet, j'ai conçu et configuré **quatre architectures réseau distinctes**, allant d'un réseau LAN segmenté jusqu'à une infrastructure intégrant routage dynamique, VLAN, EtherChannel et mécanismes de haute disponibilité.

L'ensemble des configurations des équipements, des postes clients et des serveurs est documenté individuellement afin de permettre l'analyse et la reproduction des différentes architectures.

Les fichiers Packet Tracer et les schémas associés permettent également de conserver une représentation complète des infrastructures réalisées.

---

## Informations

**Difficulté :** Débutant → Intermédiaire

**Environnement :** Cisco Packet Tracer • Cisco IOS • Routeurs • Switches • Postes clients • Serveurs

**Architectures réalisées :** LAN/VLAN/DMZ • OSPF/Internet • VLAN/EtherChannel • Haute Disponibilité

**Compétences validées :** IPv4 • Switching • Routage • OSPF • VLAN • Trunk • DMZ • DHCP • EtherChannel • Haute Disponibilité • Diagnostic réseau
