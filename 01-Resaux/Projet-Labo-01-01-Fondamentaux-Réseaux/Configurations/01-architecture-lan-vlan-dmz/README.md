# Architecture 01 — Réseau local d'entreprise

## Présentation

Cette première architecture constitue la base du projet réseau. Elle met en œuvre une infrastructure LAN complète intégrant plusieurs VLAN, un commutateur multicouche, un routeur d'accès, un serveur DHCP ainsi qu'un serveur Web.

L'objectif est de construire un réseau d'entreprise fonctionnel permettant :

- la segmentation des utilisateurs grâce aux VLAN ;
- le routage inter-VLAN ;
- l'attribution automatique des adresses IP via DHCP ;
- la publication d'un serveur Web ;
- la sécurisation des accès d'administration par SSH et ACL ;
- la connexion vers un réseau externe au moyen d'un routeur.

Cette architecture sert de fondation aux architectures suivantes du projet.

---

# Topologie

Cette architecture est composée de :

- 5 postes clients configurés en DHCP
- 2 commutateurs de niveau 2
- 1 commutateur multicouche (Layer 3)
- 1 routeur
- 1 serveur DHCP
- 1 serveur Web
- 6 VLAN

---

# Équipements Cisco

| Équipement | Rôle |
|------------|------|
| sw-1 | Commutateur de niveau 2 |
| sw-2 | Commutateur de niveau 2 |
| sw-r-1 | Commutateur multicouche (Layer 3) |
| r-1 | Routeur de sortie |

---

# Serveurs

| Équipement | Fonction |
|------------|----------|
| Serveur DHCP | Attribution automatique des adresses IP |
| Serveur Web | Hébergement du site **www.Architecture-1.fr** |

---

# Fonctionnalités mises en œuvre

- Configuration des interfaces
- VLAN
- Trunk 802.1Q
- Routage inter-VLAN
- Interfaces virtuelles (SVI)
- DHCP
- NAT
- PAT
- EtherChannel
- SSH
- ACL
- Route par défaut
- IP Routing
- Sauvegarde des configurations

---

# VLAN utilisés

| VLAN | Nom |
|------|------|
| 10 | Bleu |
| 11 | Rouge |
| 12 | Orange |
| 13 | Vert |
| 100 | Blanc |
| 200 | Noir |

---

# Adressage des serveurs

### Serveur DHCP

- Adresse IP : **192.168.0.250**
- Masque : **255.255.255.0**
- Passerelle : **192.168.0.254**

---

### Serveur Web

- Nom du site :
  **www.Architecture-1.fr**

- Adresse IP :
  **192.168.10.250**

- Masque :
  **255.255.255.0**

- Passerelle :
  **192.168.10.254**

---

# Contenu du dossier

```text
01-architecture-lan-vlan-dmz/
│
├── README.md
│
├── equipements-cisco/
│   ├── sw-1.txt
│   ├── sw-2.txt
│   ├── sw-r-1.txt
│   └── r-1.txt
│
├── serveurs/
│   ├── serveur-dhcp.md
│   └── serveur-web.md
│
└── postes-clients/
    └── configuration-pc.md
```

---

# Objectifs pédagogiques

À l'issue de cette architecture, les compétences suivantes sont maîtrisées :

- Comprendre le fonctionnement des VLAN.
- Configurer un commutateur Cisco.
- Configurer un commutateur multicouche.
- Réaliser un routage inter-VLAN.
- Déployer un serveur DHCP.
- Déployer un serveur Web.
- Sécuriser les accès via SSH.
- Mettre en œuvre des ACL.
- Configurer NAT et PAT.
- Administrer un réseau local Cisco.

---

# Équipements configurés

- sw-1
- sw-2
- sw-r-1
- r-1

Les fichiers de configuration présents dans ce dossier reprennent exactement les configurations IOS appliquées à chacun de ces équipements.
