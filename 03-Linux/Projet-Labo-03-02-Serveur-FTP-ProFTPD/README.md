# Projet-Labo-03-02-Serveur-FTP-ProFTPD

## Présentation

Ce projet constitue mon premier laboratoire consacré à l'administration d'un système **GNU/Linux sous Debian**.

L'objectif est de mettre en pratique les fondamentaux nécessaires à l'administration d'un environnement Linux : installation du système, navigation dans l'arborescence, gestion des fichiers, administration des utilisateurs et des groupes ainsi que configuration des différents mécanismes de permissions.

Le laboratoire aborde progressivement trois niveaux de gestion des accès aux fichiers :

- les permissions classiques **UGO** ;
- les **attributs de fichiers** ;
- les **ACL (Access Control Lists)**.

L'ensemble des manipulations réalisées est documenté dans ce dépôt afin de conserver les procédures, configurations et commandes utilisées pendant le laboratoire.

---

# Objectifs du projet

Ce laboratoire a pour objectifs de :

- installer et prendre en main un système Debian ;
- découvrir l'environnement en ligne de commande Linux ;
- comprendre l'organisation du système de fichiers ;
- naviguer dans l'arborescence Linux ;
- créer et administrer des fichiers et des répertoires ;
- créer et administrer des utilisateurs ;
- créer et administrer des groupes ;
- affecter des utilisateurs à différents groupes ;
- comprendre les notions d'UID et de GID ;
- gérer les propriétaires et groupes propriétaires des fichiers ;
- comprendre et configurer les permissions **UGO** ;
- utiliser les commandes `chmod`, `chown` et `chgrp` ;
- comprendre la notation symbolique et numérique des permissions ;
- utiliser les attributs de fichiers avec `chattr` et `lsattr` ;
- comprendre et utiliser les **ACL** ;
- appliquer des permissions spécifiques avec `setfacl` ;
- contrôler les ACL avec `getfacl` ;
- vérifier et tester les configurations réalisées.

---

# Environnement du laboratoire

| Élément | Configuration |
|---|---|
| Système | Debian GNU/Linux |
| Type d'environnement | Machine virtuelle |
| Hyperviseur | VirtualBox |
| RAM | 1 Go |
| Stockage | 10 Go |
| Réseau | Accès par pont |
| Administration | Terminal Linux |
| Gestion des paquets | APT |

> Les caractéristiques de la machine virtuelle correspondent à l'environnement utilisé pour réaliser ce laboratoire et peuvent être adaptées selon les ressources disponibles.

---

# Organisation du projet

```text
Projet-Labo-03-1-Premiers-Pas-sur-Linux/
│
├── README.md
│
├── commandes/
│   ├── installation-debian.txt
│   ├── gestion-fichiers-repertoires.txt
│   ├── gestion-groupes.txt
│   ├── gestion-utilisateurs.txt
│   ├── permissions-ugo.txt
│   ├── permissions-acl.txt
│   ├── attributs-fichiers.txt
│   └── verification.txt
│
├── configurations/
│   ├── groupes.txt
│   └── utilisateurs.txt
│
└── permissions/
    ├── permissions-ugo.txt
    ├── attributs.txt
    └── acl.txt
```

---

# Description de l'organisation

## `commandes/`

Ce répertoire contient les procédures et commandes utilisées pendant le laboratoire.

Il permet de retrouver les différentes étapes nécessaires pour reproduire les manipulations réalisées.

### `installation-debian.txt`

Documentation de l'installation et des premières vérifications du système Debian.

### `gestion-fichiers-repertoires.txt`

Commandes permettant de naviguer dans l'arborescence et de manipuler les fichiers et répertoires.

Principales commandes étudiées :

```bash
pwd
ls
cd
mkdir
touch
cat
cp
mv
rm
```

### `gestion-utilisateurs.txt`

Administration des comptes utilisateurs Linux.

Principales commandes :

```bash
adduser
deluser
passwd
id
whoami
groups
```

### `gestion-groupes.txt`

Création et administration des groupes Linux ainsi que gestion de l'appartenance des utilisateurs.

### `permissions-ugo.txt`

Configuration et compréhension des permissions classiques Linux :

```text
User / Group / Other
```

avec :

```text
Read / Write / Execute
```

### `attributs-fichiers.txt`

Manipulation des attributs supplémentaires des fichiers avec :

```bash
chattr
lsattr
```

### `permissions-acl.txt`

Gestion des permissions avancées avec les **Access Control Lists**.

Principales commandes :

```bash
setfacl
getfacl
```

### `verification.txt`

Regroupe les principales commandes permettant de contrôler la configuration finale du laboratoire.

---

# `configurations/`

Ce répertoire documente les éléments effectivement configurés pendant le laboratoire.

Il est volontairement séparé du dossier `commandes/`.

```text
commandes/
        ↓
Comment réaliser la configuration

configurations/
        ↓
Configuration mise en place dans le laboratoire
```

Il contient notamment :

```text
groupes.txt
utilisateurs.txt
```

---

# `permissions/`

Ce répertoire documente les différentes configurations de permissions étudiées.

```text
permissions/
│
├── permissions-ugo.txt
├── attributs.txt
└── acl.txt
```

Cette organisation permet de distinguer les trois mécanismes étudiés dans le laboratoire.

---

# Gestion des utilisateurs

Linux étant un système multi-utilisateur, une partie du laboratoire est consacrée à la création et à l'administration des comptes.

Plusieurs utilisateurs sont manipulés pendant les exercices, notamment :

```text
giosue
bob
alice
marc
jenny
```

Les comptes peuvent être contrôlés avec :

```bash
id utilisateur
```

ou :

```bash
getent passwd utilisateur
```

La commande :

```bash
groups utilisateur
```

permet de vérifier les groupes auxquels appartient un utilisateur.

---

# Gestion des groupes

Plusieurs groupes sont utilisés dans le laboratoire :

```text
travail
direction
compta
rh
marketing
manutentionnaires
```

Exemple de création :

```bash
addgroup direction
```

Exemple d'affectation d'un utilisateur :

```bash
adduser giosue direction
```

Vérification :

```bash
groups giosue
```

---

# Gestion des fichiers et répertoires

Le laboratoire permet également de prendre en main les commandes fondamentales de manipulation du système de fichiers.

Exemples :

```bash
pwd
ls
cd
mkdir
touch
cat
cp
mv
rm
```

Un répertoire de travail est notamment utilisé pour les exercices :

```text
/var/exos
```

---

# Permissions Linux UGO

Linux utilise traditionnellement trois catégories de permissions :

```text
U = User
G = Group
O = Other
```

Chaque catégorie peut disposer des droits :

```text
r = Read
w = Write
x = Execute
```

---

## Notation numérique

Les permissions peuvent également être représentées numériquement :

| Permission | Valeur |
|---|---:|
| Read (`r`) | 4 |
| Write (`w`) | 2 |
| Execute (`x`) | 1 |

Par exemple :

```text
7 = rwx
6 = rw-
5 = r-x
4 = r--
```

---

## Exemple : permission `775`

```text
775
 │││
 ││└── Other = 5 = r-x
 │└─── Group = 7 = rwx
 └──── User  = 7 = rwx
```

Ce qui correspond à :

```text
rwxrwxr-x
```

Exemple :

```bash
chmod 775 giosue.txt
```

---

# Propriétaire et groupe propriétaire

Le propriétaire d'un fichier peut être défini avec :

```bash
chown giosue giosue.txt
```

Le groupe propriétaire peut être défini avec :

```bash
chgrp direction giosue.txt
```

Les deux opérations peuvent également être réalisées simultanément :

```bash
chown giosue:direction giosue.txt
```

La configuration peut ensuite être vérifiée avec :

```bash
ls -l giosue.txt
```

---

# Attributs de fichiers

Linux permet d'ajouter certains attributs supplémentaires aux fichiers.

Le laboratoire étudie notamment l'attribut :

```text
i = immutable
```

Application :

```bash
chattr +i bob.txt
```

Vérification :

```bash
lsattr bob.txt
```

Lorsque l'attribut `immutable` est actif, le fichier bénéficie d'une protection supplémentaire contre certaines modifications.

L'attribut peut ensuite être retiré avec :

```bash
chattr -i bob.txt
```

---

# ACL – Access Control Lists

Les permissions UGO peuvent être complétées par les **ACL**.

Elles permettent d'attribuer une règle particulière à un utilisateur ou à un groupe sans changer nécessairement le propriétaire ou le groupe propriétaire du fichier.

Exemple étudié :

```bash
setfacl -m u:bob:--- giosue.txt
```

Cette règle ajoute une entrée ACL spécifique pour l'utilisateur `bob`.

La configuration peut être contrôlée avec :

```bash
getfacl giosue.txt
```

---

# Les trois mécanismes étudiés

```text
                         Fichier Linux
                              │
              ┌───────────────┼───────────────┐
              │               │               │
              ▼               ▼               ▼
             UGO          Attributs          ACL
              │               │               │
              ▼               ▼               ▼
           chmod           chattr          setfacl
           chown           lsattr          getfacl
           chgrp
```

### UGO

Gestion classique des permissions :

```text
User / Group / Other
```

### Attributs

Ajout de comportements particuliers au niveau du fichier.

Exemple :

```bash
chattr +i fichier.txt
```

### ACL

Ajout de permissions spécifiques pour certains utilisateurs ou groupes.

Exemple :

```bash
setfacl -m u:bob:r-- fichier.txt
```

---

# Vérification de la configuration

Plusieurs commandes permettent de contrôler rapidement l'état du laboratoire.

### Système

```bash
cat /etc/os-release
uname -a
hostname
```

### Utilisateur

```bash
whoami
id
```

### Réseau

```bash
ip a
ip route
```

### Utilisateurs

```bash
getent passwd
```

### Groupes

```bash
getent group
```

### Permissions

```bash
ls -l
```

### Attributs

```bash
lsattr
```

### ACL

```bash
getfacl
```

---

# Exemple de configuration étudiée

Une partie du laboratoire repose sur le fichier :

```text
giosue.txt
```

avec la configuration suivante :

```text
Propriétaire     : giosue
Groupe           : direction
Permissions UGO  : 775
```

Configuration :

```bash
chown giosue giosue.txt
chgrp direction giosue.txt
chmod 775 giosue.txt
```

Puis une règle ACL spécifique peut être ajoutée pour `bob` :

```bash
setfacl -m u:bob:--- giosue.txt
```

Vérification :

```bash
ls -l giosue.txt
getfacl giosue.txt
```

Cet exercice permet de comprendre la relation entre :

```text
Utilisateur
     │
     ▼
Propriétaire
     │
     ▼
Groupe
     │
     ▼
Permissions UGO
     │
     ▼
ACL supplémentaires
```

---

# Compétences travaillées

Ce laboratoire m'a permis de travailler les compétences suivantes :

### Administration Linux

- installation d'un système Debian ;
- utilisation du terminal Linux ;
- navigation dans l'arborescence ;
- compréhension de l'organisation du système de fichiers.

### Gestion des fichiers

- création de fichiers et répertoires ;
- copie et déplacement ;
- renommage ;
- suppression ;
- consultation des propriétés.

### Administration des utilisateurs

- création de comptes ;
- gestion des mots de passe ;
- identification des UID et GID ;
- utilisation des répertoires personnels ;
- vérification des comptes.

### Administration des groupes

- création de groupes ;
- ajout d'utilisateurs aux groupes ;
- contrôle de l'appartenance ;
- utilisation des groupes dans la gestion des permissions.

### Sécurité et permissions

- permissions UGO ;
- notation symbolique ;
- notation numérique ;
- `chmod` ;
- `chown` ;
- `chgrp` ;
- attributs Linux ;
- `chattr` / `lsattr` ;
- ACL ;
- `setfacl` / `getfacl`.

---

# Commandes principales étudiées

```bash
# Navigation
pwd
ls
cd

# Fichiers et répertoires
mkdir
touch
cat
cp
mv
rm

# Utilisateurs
adduser
deluser
passwd
whoami
id

# Groupes
addgroup
delgroup
groups
getent

# Permissions UGO
chmod
chown
chgrp

# Attributs
chattr
lsattr

# ACL
setfacl
getfacl

# Système / réseau
uname
hostname
ip
ping
systemctl
```

---

# Résultat du laboratoire

À l'issue de ce projet, l'environnement permet de mettre en pratique les bases de l'administration d'un système Linux Debian :

- système Debian installé et opérationnel ;
- utilisation des principales commandes Linux ;
- manipulation de l'arborescence ;
- gestion des fichiers et répertoires ;
- création et administration des utilisateurs ;
- création et administration des groupes ;
- gestion des propriétaires ;
- configuration des permissions UGO ;
- utilisation des attributs de fichiers ;
- mise en œuvre de permissions ACL ;
- vérification et diagnostic de la configuration.

---

# Suite du parcours

Ce premier laboratoire constitue une base pour poursuivre vers des sujets Linux plus avancés, notamment :

- administration système ;
- gestion des services ;
- gestion des processus ;
- administration réseau Linux ;
- SSH ;
- gestion avancée des paquets ;
- stockage et systèmes de fichiers ;
- automatisation avec Bash ;
- sécurité et durcissement Linux ;
- déploiement de services réseau.

---

## Projet personnel – Systèmes & Réseaux

Ce laboratoire fait partie de mon dépôt :

```text
projets-labos-systemes-reseaux
```

et du chapitre :

```text
03-Linux
```

Il documente ma progression pratique dans l'apprentissage de l'administration **Systèmes et Réseaux**.

## Niveau

**Débutant → Débutant avancé**
