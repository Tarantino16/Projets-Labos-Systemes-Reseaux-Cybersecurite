# Architecture 03 — VLAN, EtherChannel et Router-on-a-Stick

## Présentation

Cette troisième architecture met en œuvre une infrastructure réseau d'entreprise basée sur la segmentation des utilisateurs à l'aide de VLAN, l'agrégation de liens avec EtherChannel et le routage inter-VLAN assuré par un routeur Cisco selon le principe du **Router-on-a-Stick**.

Contrairement à la première architecture, où le routage inter-VLAN était réalisé par un commutateur multicouche, cette infrastructure utilise un routeur équipé de sous-interfaces IEEE 802.1Q. Celui-ci assure également le rôle de serveur DHCP, de passerelle par défaut pour chaque VLAN, ainsi que la traduction d'adresses (NAT/PAT) vers le réseau extérieur.

Cette architecture permet de comprendre l'interconnexion de plusieurs VLAN au travers de liaisons Trunk, le fonctionnement des sous-interfaces, l'agrégation de liens et la sécurisation des accès grâce aux ACL et au protocole SSH.

---

# Topologie

Cette architecture est composée de :

- 5 postes clients
- 3 commutateurs Cisco de niveau 2
- 1 routeur Cisco
- 1 serveur Web
- 5 VLAN

---

# Équipements

| Équipement | Fonction |
|------------|----------|
| SW-3 | Commutateur de niveau 2 |
| SW-4 | Commutateur de niveau 2 |
| SW-5 | Commutateur de niveau 2 |
| R-8 | Routeur (Router-on-a-Stick, DHCP, NAT/PAT) |
| Serveur Web | Hébergement du site Architecture-3 |

---

# Fonctionnalités mises en œuvre

- Configuration des interfaces
- VLAN
- Trunk IEEE 802.1Q
- EtherChannel (LACP)
- Router-on-a-Stick
- Sous-interfaces
- DHCP
- NAT
- PAT
- SSH
- ACL
- Route par défaut

---

# VLAN utilisés

| VLAN | Nom |
|------|------|
| 10 | Jaune |
| 11 | Marron |
| 12 | Violet |
| 13 | Pêche |
| 14 | Beige |

---

# Plan d'adressage

| VLAN | Réseau | Passerelle |
|------|---------|------------|
| VLAN 10 | 192.168.4.0/24 | 192.168.4.254 |
| VLAN 11 | 192.168.5.0/24 | 192.168.5.254 |
| VLAN 12 | 192.168.6.0/24 | 192.168.6.254 |
| VLAN 13 | 192.168.7.0/24 | 192.168.7.254 |
| VLAN 14 | 192.168.14.0/24 | 192.168.14.254 |

---

# Serveur Web

Le serveur Web est hébergé dans le réseau **192.168.4.0/24**.

| Paramètre | Valeur |
|-----------|---------|
| Adresse IP | 192.168.4.250 |
| Masque | 255.255.255.0 |
| Passerelle | 192.168.4.254 |
| Site Web | www.Architecture-3.fr |

---

# Services réseau

Le routeur **R-8** assure les services suivants :

- Routage inter-VLAN
- Serveur DHCP
- NAT
- PAT
- Passerelles des VLAN
- Publication du serveur Web
- Filtrage par ACL

---

# Protocoles utilisés

- IPv4
- Ethernet
- IEEE 802.1Q
- EtherChannel (LACP)
- DHCP
- NAT
- PAT
- SSH
- ICMP

---

# Objectifs pédagogiques

À l'issue de cette architecture, les compétences suivantes sont acquises :

- Configurer des VLAN sur plusieurs commutateurs.
- Déployer des liaisons Trunk.
- Configurer un EtherChannel.
- Mettre en œuvre un Router-on-a-Stick.
- Configurer des sous-interfaces 802.1Q.
- Déployer un serveur DHCP sur un routeur Cisco.
- Configurer NAT et PAT.
- Sécuriser les accès par SSH.
- Créer et appliquer des ACL.
- Vérifier la connectivité entre plusieurs VLAN.

---

# Contenu du dossier

```text
03-Architecture-VLAN-EtherChannel/
│
├── README.md
│
├── Equipements-cisco/
│   └── SW-3.txt
│   └── SW-4.txt
│   └── SW-5.txt
│   └── R-8.txt
│
├── Serveur-Web/
│   └── serveur-web.md
│
└── Configuration-PC/
    └── configuration-pc-dhcp.md
```

---

# Résultat attendu

À l'issue de la configuration :

- les postes clients obtiennent automatiquement leur configuration réseau grâce au serveur DHCP du routeur ;
- les différents VLAN communiquent entre eux via le routage inter-VLAN assuré par R-8 ;
- les liaisons Trunk et EtherChannel assurent la circulation des VLAN entre les commutateurs ;
- le serveur Web est accessible depuis les réseaux autorisés ;
- les règles NAT, PAT et ACL garantissent l'accès aux ressources tout en renforçant la sécurité de l'infrastructure.
