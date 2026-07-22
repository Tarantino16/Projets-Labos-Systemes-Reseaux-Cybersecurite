# Projet-Labo-02-1-Windows-Server-2022

## Présentation

Ce projet a pour objectif de déployer et d'administrer une infrastructure basée sur **Windows Server 2022** dans un environnement virtualisé.

Le laboratoire repose sur l'installation de **Windows Server 2022 en mode Core**, c'est-à-dire sans interface graphique, afin de découvrir l'administration d'un serveur principalement depuis la ligne de commande et PowerShell.

Le projet comprend la configuration réseau du serveur ainsi que l'installation et la configuration de plusieurs rôles essentiels d'une infrastructure Windows d'entreprise :

- **DHCP** pour l'attribution automatique des configurations réseau.
- **DNS** pour la résolution des noms et des adresses IP.
- **AD DS (Active Directory Domain Services)** pour la gestion centralisée du domaine, des utilisateurs, des groupes et des unités d'organisation.

Le laboratoire permet également d'aborder l'administration distante d'un serveur Windows ainsi que l'automatisation de tâches d'administration avec **PowerShell**.

Des scripts associés à des fichiers CSV sont utilisés afin d'automatiser la création d'unités d'organisation, de groupes de sécurité et de comptes utilisateurs dans Active Directory.

Ce projet m'a permis de mettre en pratique le déploiement et l'administration d'une infrastructure Windows Server tout en développant mes compétences en administration système, Active Directory, services réseau et automatisation PowerShell.

---

## Objectifs du projet

Au cours de ce laboratoire, j'ai appris à :

- Installer Windows Server 2022 en mode Core.
- Configurer les paramètres réseau d'un serveur Windows.
- Administrer Windows Server depuis SConfig.
- Utiliser PowerShell pour administrer un serveur.
- Installer et configurer le rôle DHCP.
- Créer et administrer une étendue DHCP.
- Configurer les options distribuées aux clients DHCP.
- Mettre en place des classes utilisateurs et des stratégies DHCP.
- Installer et configurer le rôle DNS.
- Créer et administrer des zones DNS.
- Configurer une zone de recherche directe.
- Configurer une zone de recherche inversée.
- Créer et gérer des enregistrements DNS.
- Installer et configurer Active Directory Domain Services.
- Mettre en place un domaine Active Directory.
- Administrer Active Directory à distance.
- Installer et utiliser les outils RSAT.
- Créer des unités d'organisation (OU).
- Créer et administrer des groupes de sécurité.
- Créer et administrer des comptes utilisateurs.
- Comprendre l'organisation logique d'un domaine Active Directory.
- Automatiser des tâches d'administration avec PowerShell.
- Importer des données depuis des fichiers CSV.
- Automatiser la création d'OU, de groupes et d'utilisateurs.

---

# Architecture du laboratoire

L'infrastructure du laboratoire repose sur plusieurs composants :

```text
                        Réseau
                          │
                          │
                    ┌─────▼─────┐
                    │  Routeur  │
                    └─────┬─────┘
                          │
                          │
             Réseau interne 192.168.11.0/24
                          │
             ┌────────────┴────────────┐
             │                         │
             ▼                         ▼
┌────────────────────────┐   ┌─────────────────────┐
│ Windows Server 2022    │   │ Client Windows 10  │
│                        │   │                     │
│ Mode Core              │   │ Poste client /     │
│                        │   │ Administration      │
│ ├── DHCP               │   │                     │
│ ├── DNS                │   │ ├── RSAT            │
│ └── AD DS              │   │ └── PowerShell      │
│                        │   │                     │
└────────────────────────┘   └─────────────────────┘
```

---

# Technologies utilisées

## Systèmes d'exploitation

- Windows Server 2022 Core
- Windows 10

## Services Windows Server

- Active Directory Domain Services (AD DS)
- DHCP Server
- DNS Server

## Administration

- PowerShell
- SConfig
- RSAT
- Server Manager
- Active Directory Users and Computers
- DHCP Management
- DNS Manager

## Automatisation

- PowerShell
- Scripts `.ps1`
- Importation CSV
- Fichiers `.csv`

## Réseau

- IPv4
- TCP/IP
- DHCP
- DNS
- Active Directory
- Réseau `192.168.11.0/24`

## Virtualisation

- VirtualBox
- Machines virtuelles

---

# Contenu du projet

## 1️ Installation de Windows Server 2022 Core

Le laboratoire commence par la création d'une machine virtuelle destinée à héberger Windows Server 2022.

Le serveur est installé en mode **Core**, sans environnement graphique.

Cette approche permet de découvrir l'administration d'un serveur Windows depuis :

- SConfig.
- PowerShell.
- La ligne de commande.
- Les outils d'administration distante.

La machine virtuelle utilisée dans le laboratoire dispose notamment de :

- 2 Go de mémoire vive.
- 50 Go de stockage.
- Une interface réseau connectée au réseau du laboratoire.

---

## 2️ Configuration réseau du serveur

Après l'installation, la configuration réseau du serveur est réalisée afin de permettre son intégration dans l'infrastructure.

La configuration comprend notamment :

- L'identification de l'interface réseau.
- La configuration de l'adresse IPv4.
- La configuration du masque de sous-réseau.
- La configuration de la passerelle.
- La configuration du serveur DNS.
- La vérification de la connectivité réseau.

La configuration peut être réalisée depuis **SConfig** ou directement avec **PowerShell**.

---

## 3️ Installation et configuration du rôle DHCP

Le rôle **DHCP (Dynamic Host Configuration Protocol)** est installé sur Windows Server 2022.

Le serveur DHCP permet de distribuer automatiquement les paramètres réseau aux postes clients.

La configuration comprend notamment :

- L'installation du rôle DHCP.
- La création d'une étendue IPv4.
- La définition d'une plage d'adresses IP.
- La configuration de la passerelle par défaut.
- La configuration du serveur DNS.
- La configuration du suffixe DNS.
- L'attribution automatique des paramètres réseau aux clients.

Le fonctionnement du DHCP repose sur le mécanisme **DORA** :

```text
Client                     Serveur DHCP
  │                              │
  │ -------- DISCOVER ---------> │
  │                              │
  │ <--------- OFFER ----------- │
  │                              │
  │ -------- REQUEST ----------> │
  │                              │
  │ <---------- ACK ------------ │
  │                              │
```

---

## 4️ Classes utilisateurs et stratégies DHCP

Le laboratoire va au-delà d'une configuration DHCP classique avec la création de classes utilisateurs.

Ces classes permettent d'appliquer des paramètres DHCP spécifiques à certains groupes de postes clients.

Cette partie permet d'aborder :

- La création de classes utilisateurs DHCP.
- L'association d'un client à une classe.
- La création de stratégies DHCP.
- L'application de paramètres réseau différents selon les clients.

---

## 5️ Installation et configuration du rôle DNS

Le rôle **DNS (Domain Name System)** est installé afin de permettre la résolution des noms au sein du réseau.

Le laboratoire comprend :

- L'installation du rôle DNS.
- La configuration du serveur DNS.
- La création d'une zone de recherche directe.
- La création d'une zone de recherche inversée.
- La création d'enregistrements DNS.
- La création d'enregistrements de type A.
- La création d'enregistrements PTR.

La zone de recherche directe permet de résoudre :

```text
Nom de machine
      │
      ▼
Adresse IPv4
```

La zone de recherche inversée permet d'effectuer l'opération inverse :

```text
Adresse IPv4
      │
      ▼
Nom de machine
```

---

## 6️ Installation d'Active Directory Domain Services

Le rôle **Active Directory Domain Services (AD DS)** est installé afin de mettre en place une infrastructure de domaine.

Active Directory permet de centraliser l'administration :

- Des utilisateurs.
- Des ordinateurs.
- Des groupes.
- Des unités d'organisation.
- Des ressources du domaine.

Le serveur devient ainsi un élément central de l'administration de l'infrastructure Windows.

---

## 7️ Administration d'Active Directory

Une fois Active Directory installé et configuré, le laboratoire permet de mettre en pratique l'administration d'un domaine.

Les opérations réalisées comprennent notamment :

- La création d'unités d'organisation.
- La création de groupes globaux de sécurité.
- La création de comptes utilisateurs.
- L'organisation des utilisateurs dans les différentes OU.
- L'intégration des utilisateurs dans les groupes correspondants.

Cette organisation permet de structurer Active Directory en fonction des besoins de l'organisation.

---

## 8️ Administration distante avec RSAT

Les outils **RSAT (Remote Server Administration Tools)** sont utilisés afin d'administrer les différents rôles Windows Server depuis un poste client.

Ils permettent notamment d'accéder aux consoles de gestion :

- Active Directory.
- DHCP.
- DNS.

Cette architecture permet d'administrer un serveur Windows Server Core sans nécessiter d'environnement graphique directement installé sur le serveur.

---

## 9️ Automatisation avec PowerShell

Une partie importante du projet est consacrée à l'automatisation de l'administration Active Directory avec PowerShell.

Les scripts permettent notamment d'automatiser :

- La création des unités d'organisation.
- La création des groupes globaux de sécurité.
- L'organisation hiérarchique des groupes.
- La création des comptes utilisateurs.
- L'affectation des utilisateurs aux groupes correspondants.

---

## 10 Utilisation de fichiers CSV

Les scripts PowerShell utilisent des fichiers CSV contenant les informations nécessaires à la création des objets Active Directory.

Deux fichiers sont notamment utilisés :

```text
OU.csv
users.csv
```

### `OU.csv`

Ce fichier contient les informations permettant de créer et d'organiser :

- Les unités d'organisation.
- Les groupes.
- Les relations entre les éléments parents et enfants.

### `users.csv`

Ce fichier contient les informations utilisées pour automatiser la création des comptes utilisateurs.

Le fonctionnement général peut être représenté ainsi :

```text
OU.csv
   │
   ▼
Script PowerShell
   │
   ├──> Création des OU
   │
   └──> Création des groupes


users.csv
   │
   ▼
Script PowerShell
   │
   ├──> Création des utilisateurs
   │
   └──> Affectation aux groupes
```

---

# Organisation du projet

```text
Projet-Labo-02-1-Windows-Server-2022/
│
├── README.md
│
├── documentation/
│   └── Projet-Labo-02-1-Windows-Server-2022.pdf
│
├── machines-virtuelles/
│   ├── windows-server-2022-core.txt
│   └── client-windows-10.txt
│
├── configurations/
│   ├── windows-server/
│   │   └── reseau.txt
│   │
│   ├── dhcp/
│   │   ├── etendue.txt
│   │   ├── options-dhcp.txt
│   │   ├── classes-utilisateurs.txt
│   │   └── strategies-dhcp.txt
│   │
│   ├── dns/
│   │   ├── zone-directe.txt
│   │   ├── zone-inversee.txt
│   │   └── enregistrements-dns.txt
│   │
│   └── active-directory/
│       ├── domaine.txt
│       ├── unites-organisation.txt
│       ├── groupes-securite.txt
│       └── utilisateurs.txt
│
├── commandes/
│   ├── installation-windows-server.txt
│   ├── configuration-reseau.txt
│   ├── installation-dhcp.txt
│   ├── configuration-dhcp.txt
│   ├── installation-dns.txt
│   ├── configuration-dns.txt
│   ├── installation-adds.txt
│   ├── configuration-active-directory.txt
│   ├── installation-rsat.txt
│   └── verification.txt
│
├── scripts/
│   ├── powershell/
│   │   ├── creation-ou-groupes.ps1
│   │   └── creation-utilisateurs.ps1
│   │
│   └── csv/
│       ├── OU.csv
│       └── users.csv
│
└── schemas/
    ├── topologie-reseau.png
    ├── architecture-active-directory.png
    ├── fonctionnement-dhcp.png
    └── architecture-dns-ad-ds.png
```

---

# Compétences développées

La réalisation de ce projet m'a permis de développer des compétences dans les domaines suivants :

### Administration Windows Server

- Installation de Windows Server 2022 Core.
- Administration d'un serveur sans interface graphique.
- Utilisation de SConfig.
- Administration avec PowerShell.
- Administration distante avec RSAT.

### Active Directory

- Installation d'AD DS.
- Administration d'un domaine.
- Gestion des unités d'organisation.
- Gestion des groupes de sécurité.
- Gestion des comptes utilisateurs.
- Organisation d'une structure Active Directory.

### Services réseau

- Installation et configuration d'un serveur DHCP.
- Administration des étendues DHCP.
- Configuration des options DHCP.
- Utilisation des classes et stratégies DHCP.
- Installation et configuration d'un serveur DNS.
- Gestion des zones DNS directes et inversées.
- Gestion des enregistrements DNS.

### PowerShell et automatisation

- Création de scripts PowerShell.
- Manipulation des objets Active Directory.
- Importation de données CSV.
- Utilisation de boucles et de conditions.
- Automatisation de la création d'OU.
- Automatisation de la création de groupes.
- Automatisation de la création de comptes utilisateurs.

---

# Résultat

À l'issue de ce laboratoire, l'infrastructure permet :

- Le fonctionnement d'un serveur Windows Server 2022 Core.
- La distribution automatique des configurations réseau avec DHCP.
- La résolution des noms avec DNS.
- La gestion centralisée des ressources avec Active Directory.
- L'administration distante du serveur.
- La gestion des utilisateurs et des groupes.
- L'organisation des ressources dans des unités d'organisation.
- L'automatisation de tâches Active Directory avec PowerShell et CSV.

Ce laboratoire reproduit ainsi plusieurs fonctions essentielles que l'on retrouve dans une **infrastructure Windows Server d'entreprise**.

---

## Niveau

**Intermédiaire**
