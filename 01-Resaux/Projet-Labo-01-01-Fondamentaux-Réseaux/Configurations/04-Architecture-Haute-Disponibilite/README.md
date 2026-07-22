# Architecture 04 — Haute disponibilité avec HSRP

## Présentation

Cette quatrième architecture met en œuvre une infrastructure réseau d'entreprise hautement disponible reposant sur deux commutateurs d'accès, deux commutateurs multicouches Cisco et un routeur assurant la connectivité vers le réseau extérieur.

L'objectif principal est de garantir la continuité des communications grâce au protocole **HSRP (Hot Standby Router Protocol)**, qui permet la redondance des passerelles par défaut des différents VLAN.

Les commutateurs multicouches **SW-R-2** et **SW-R-3** assurent le routage inter-VLAN et partagent la responsabilité des passerelles virtuelles HSRP. Les commutateurs **SW-6** et **SW-7** assurent quant à eux la connexion des postes utilisateurs et le transport des VLAN au travers de liaisons Trunk et EtherChannel.

Le routeur **R-9** assure la connexion entre cette architecture et le réseau extérieur. Il permet l'acheminement du trafic vers les autres infrastructures et complète la redondance interne assurée par les commutateurs multicouches.

Cette architecture reproduit une infrastructure d'entreprise où la haute disponibilité est essentielle afin de garantir un accès permanent aux ressources réseau, même en cas de défaillance d'un équipement.

---

# Topologie

Cette architecture est composée de :

- 2 commutateurs Cisco de niveau 2
- 2 commutateurs multicouches (Layer 3)
- 1 routeur Cisco
- Plusieurs postes clients
- Plusieurs VLAN
- Une infrastructure redondante

---

# Équipements

| Équipement | Fonction |
|------------|----------|
| SW-6 | Commutateur d'accès |
| SW-7 | Commutateur d'accès |
| SW-R-2 | Commutateur multicouche (HSRP) |
| SW-R-3 | Commutateur multicouche (HSRP) |
| R-9 | Routeur d'interconnexion vers le réseau extérieur |

---

# Fonctionnalités mises en œuvre

- VLAN
- Trunk IEEE 802.1Q
- EtherChannel (LACP)
- Interfaces virtuelles (SVI)
- Routage inter-VLAN
- HSRP (Hot Standby Router Protocol)
- Redondance des passerelles
- DHCP Relay (`ip helper-address`)
- SSH
- ACL
- Routage statique
- Interconnexion avec le réseau extérieur via R-9

---

# Protocoles utilisés

- IPv4
- Ethernet
- IEEE 802.1Q
- HSRP
- EtherChannel (LACP)
- ICMP
- DHCP Relay
- SSH

---

# Objectifs pédagogiques

À l'issue de cette architecture, les compétences suivantes sont acquises :

- Configurer un commutateur multicouche Cisco.
- Mettre en œuvre HSRP.
- Configurer des interfaces virtuelles (SVI).
- Réaliser le routage inter-VLAN.
- Déployer des liaisons Trunk.
- Configurer un EtherChannel.
- Mettre en œuvre un relais DHCP (`ip helper-address`).
- Configurer un routeur d'interconnexion.
- Vérifier la redondance des passerelles.
- Tester la continuité de service lors d'une panne.

---

# Principe de fonctionnement

Les postes clients utilisent une **adresse IP virtuelle HSRP** comme passerelle par défaut.

Les commutateurs **SW-R-2** et **SW-R-3** participent aux groupes HSRP :

- un équipement est **Actif** ;
- l'autre est **Standby**.

En cas de défaillance du commutateur actif, le second prend automatiquement le relais sans interruption perceptible pour les utilisateurs.

Le trafic destiné aux réseaux externes est ensuite transmis au routeur **R-9**, qui assure l'interconnexion avec le reste de l'infrastructure réseau.

---

# Contenu du dossier

```text
04-Architecture-Haute-Disponibilite/
│
├── README.md
│
├── equipements-cisco/
│   └── SW-6.txt
│   └── SW-7.txt
│   └── SW-R-2.txt
│   └── SW-R-3.txt
│   └── R-9.txt
│
├── Serveurs/
│   └── README.md
│
└── Configuration-PC/
    └── configuration-pc-dhcp.md
```

---

# Résultat attendu

À l'issue de la configuration :

- les postes clients utilisent une passerelle virtuelle HSRP ;
- le routage inter-VLAN est assuré par les commutateurs multicouches ;
- la redondance garantit la continuité de service en cas de panne ;
- les liaisons Trunk et EtherChannel assurent le transport des VLAN ;
- **R-9** assure la connectivité entre cette architecture et le réseau extérieur.
