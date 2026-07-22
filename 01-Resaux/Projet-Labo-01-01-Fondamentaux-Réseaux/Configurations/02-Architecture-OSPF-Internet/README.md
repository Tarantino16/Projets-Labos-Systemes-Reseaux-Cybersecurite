# Architecture 02 — Simulation d'Internet avec OSPF

## Présentation

Cette deuxième architecture a pour objectif de simuler un réseau étendu (WAN) représentant Internet à l'aide de six routeurs Cisco interconnectés.

Contrairement à la première architecture, qui était principalement orientée vers la conception d'un réseau local (LAN), cette infrastructure met l'accent sur le routage dynamique grâce au protocole **OSPF (Open Shortest Path First)**.

Les six routeurs échangent automatiquement leurs routes afin de construire une table de routage commune et d'assurer la transmission des paquets entre les différents réseaux. Cette architecture permet également de comprendre le fonctionnement d'un protocole de routage dynamique, la sélection du meilleur chemin ainsi que la convergence du réseau lors d'une modification de la topologie.

Chaque liaison reliant deux routeurs est configurée avec une bande passante de **10 Mbit/s**, permettant d'illustrer le calcul des métriques OSPF et l'influence de la bande passante sur le choix des chemins.

Cette architecture constitue le cœur du réseau simulant Internet et sera utilisée par les architectures suivantes pour assurer leur connectivité vers l'extérieur.

---

# Topologie

Cette architecture est composée de :

- 6 routeurs Cisco
- 15 réseaux d'interconnexion
- 6 réseaux locaux raccordés aux routeurs
- 1 domaine OSPF (Area 1)

---

# Équipements

| Équipement | Fonction |
|------------|----------|
| R-2 | Routeur OSPF |
| R-3 | Routeur OSPF |
| R-4 | Routeur OSPF |
| R-5 | Routeur OSPF |
| R-6 | Routeur OSPF |
| R-7 | Routeur OSPF |

---

# Fonctionnalités mises en œuvre

- Configuration des interfaces réseau
- Attribution des adresses IPv4
- Configuration de la bande passante des interfaces
- Déploiement du protocole OSPF
- Échange dynamique des routes
- Calcul automatique des meilleurs chemins
- Construction des tables de routage
- Convergence du réseau
- Vérification de la connectivité entre les routeurs

---

# Protocoles utilisés

- IPv4
- OSPF
- ICMP
- SSH (administration)

---

# Objectifs pédagogiques

À l'issue de cette architecture, les compétences suivantes sont acquises :

- Comprendre le fonctionnement du routage dynamique.
- Configurer le protocole OSPF.
- Configurer les interfaces d'un routeur Cisco.
- Modifier la bande passante d'une interface.
- Vérifier les voisins OSPF.
- Analyser une table de routage.
- Tester la connectivité d'un réseau étendu.
- Comprendre la convergence d'un protocole de routage.

---

# Contenu du dossier

```text
02-Architecture-OSPF/
│
├── README.md
│
├── equipements-cisco/
│   └── R-2.txt
│   └── R-3.txt
│   └── R-4.txt
│   └── R-5.txt
│   └── R-6.txt
    └── R-7.txt
```

---

# Résultat attendu

À l'issue de la configuration, les six routeurs doivent être capables d'échanger automatiquement leurs routes via OSPF et de communiquer avec l'ensemble des réseaux de l'architecture.

Le protocole OSPF adapte automatiquement les tables de routage en cas de modification de la topologie, garantissant ainsi la continuité des communications.
