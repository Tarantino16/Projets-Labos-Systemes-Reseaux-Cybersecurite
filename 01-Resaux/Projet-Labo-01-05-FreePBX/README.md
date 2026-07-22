# Projet-Labo-01-5-FreePBX

## Présentation

Ce projet a pour objectif de mettre en place une infrastructure de **téléphonie sur IP (VoIP)** reposant sur **FreePBX et Asterisk**.

Au travers de ce laboratoire réalisé dans un environnement virtualisé, j'ai appris à installer et configurer un serveur **FreePBX**, à configurer son interface réseau et à administrer la solution depuis son interface Web.

Le projet m'a également permis de découvrir les principes fondamentaux de la **VoIP et de la ToIP**, notamment la numérisation et le transport de la voix sur un réseau IP, l'utilisation des codecs ainsi que les différents protocoles intervenant dans les communications téléphoniques.

La mise en pratique repose sur la création de plusieurs extensions téléphoniques associées à des **softphones** afin de permettre les communications internes entre différents utilisateurs.

Le laboratoire comprend également la configuration de fonctionnalités complémentaires telles que la **messagerie vocale** et la création d'un **groupe d'appel (Ring Group)** permettant de faire sonner simultanément plusieurs extensions.

Ce projet m'a permis de mieux comprendre le fonctionnement d'une infrastructure de téléphonie sur IP ainsi que le rôle d'un **IPBX** dans la gestion centralisée des communications téléphoniques d'une organisation.

---

## Objectifs du projet

Au cours de ce laboratoire, j'ai appris à :

- Comprendre les principes fondamentaux de la VoIP et de la ToIP.
- Comprendre le rôle d'un IPBX.
- Installer et configurer un serveur FreePBX.
- Administrer FreePBX depuis son interface Web.
- Comprendre le fonctionnement d'Asterisk.
- Configurer l'interface réseau du serveur.
- Comprendre les protocoles utilisés pour les communications VoIP.
- Créer et administrer des extensions SIP/PJSIP.
- Configurer plusieurs softphones.
- Configurer les codecs utilisés pour le transport de la voix.
- Réaliser des appels internes entre plusieurs extensions.
- Configurer et utiliser une messagerie vocale.
- Créer et configurer un groupe d'appel.
- Vérifier le bon fonctionnement d'une infrastructure VoIP.

---

## Technologies utilisées

### Systèmes et solutions

- FreePBX 15
- Asterisk 16
- Linux
- VirtualBox

### VoIP

- VoIP
- ToIP
- SIP
- PJSIP
- RTP
- UDP
- IAX
- DTMF
- Codec G.711 / PCMA

### Réseau

- IPv4
- TCP/IP
- SSH
- DNS
- NTP

### Outils

- Interface Web FreePBX
- Softphones
- 3CXPhone
- Zoiper
- Nano
- Bash

---

## Contenu du projet

Ce laboratoire est composé de plusieurs parties complémentaires.

### 1️ Découverte de la VoIP

Étude des principes fondamentaux de la téléphonie sur IP :

- VoIP et ToIP.
- Convergence voix et données.
- Numérisation de la voix.
- Transport de la voix sur un réseau IP.
- Codecs audio.
- Protocole RTP.
- Transport UDP.
- Signalisation téléphonique.
- Fréquences DTMF.
- Contraintes liées à la latence.
- Gigue réseau.
- Perte de paquets.
- Qualité de service (QoS).

---

### 2️ Installation et configuration de FreePBX

Déploiement d'un serveur de téléphonie IP avec :

- Création d'une machine virtuelle.
- Installation de FreePBX 15.
- Utilisation d'Asterisk 16.
- Configuration de l'interface réseau.
- Attribution d'une adresse IPv4 statique.
- Accès distant au serveur.
- Administration depuis l'interface Web FreePBX.
- Configuration initiale du serveur.
- Vérification des services réseau.

---

### 3️ Configuration des extensions

Création de trois extensions téléphoniques :

| Extension | Utilisateur |
|---|---|
| 100 | Standard |
| 101 | Bob |
| 102 | Alice |

Chaque extension est créée et administrée depuis l'interface Web de FreePBX.

---

### 4️ Configuration des softphones

Configuration des postes téléphoniques logiciels avec :

- Création des comptes utilisateurs.
- Association des extensions aux softphones.
- Configuration de l'adresse du serveur FreePBX.
- Authentification des utilisateurs.
- Enregistrement des softphones auprès du serveur.
- Configuration des codecs.
- Utilisation du codec PCMA / G.711A.
- Vérification de l'enregistrement des extensions.

---

### 5️ Tests des communications

Validation du fonctionnement de la téléphonie interne avec :

- Appels entre les différentes extensions.
- Appel de Bob (101) vers Alice (102).
- Appel d'Alice (102) vers Bob (101).
- Vérification de l'établissement des communications.
- Vérification de la transmission de la voix.

---

### 6️ Configuration de la messagerie vocale

Mise en place du service de messagerie avec :

- Activation de la boîte vocale.
- Configuration du mot de passe.
- Configuration du message en cas de non-réponse.
- Consultation des messages vocaux.
- Accès à la messagerie via le numéro `*97`.

---

### 7️ Configuration du Ring Group

Création d'un groupe d'appel permettant de joindre plusieurs utilisateurs simultanément.

Configuration mise en place :

```text
Numéro du groupe : 6000

Stratégie : Ring All

Extensions membres :
├── 101 - Bob
└── 102 - Alice
```

Lorsqu'un utilisateur compose le **6000**, les téléphones de **Bob (101)** et **Alice (102)** sonnent simultanément.

Le premier utilisateur qui décroche prend en charge l'appel.

---

## Architecture VoIP

Le fonctionnement général de l'infrastructure peut être représenté de la manière suivante :

```text
                    ┌─────────────────────┐
                    │                     │
                    │   Serveur FreePBX   │
                    │      Asterisk       │
                    │                     │
                    └──────────┬──────────┘
                               │
                     Réseau IP / VoIP
                               │
            ┌──────────────────┼──────────────────┐
            │                  │                  │
            │                  │                  │
      ┌─────▼─────┐      ┌─────▼─────┐      ┌─────▼─────┐
      │ Softphone │      │ Softphone │      │ Softphone │
      │           │      │           │      │           │
      │ Standard  │      │    Bob    │      │   Alice   │
      │    100    │      │    101    │      │    102    │
      └───────────┘      └───────────┘      └───────────┘
                               │                  │
                               └────────┬─────────┘
                                        │
                                  Ring Group
                                     6000
```

---

## Organisation du projet

```text
Projet-Labo-01-5-FreePBX/
│
├── README.md
│
├── documentation/
│   └── Projet-Labo-01-5-FreePBX.pdf
│
├── configurations/
│   ├── freepbx/
│   │   ├── ifcfg-eth0
│   │   ├── extensions.txt
│   │   ├── voicemail.txt
│   │   └── ring-group.txt
│   │
│   └── softphones/
│       ├── standard-100.txt
│       ├── bob-101.txt
│       └── alice-102.txt
│
├── commandes/
│   ├── installation.txt
│   ├── configuration-reseau.txt
│   ├── configuration-freepbx.txt
│   ├── configuration-softphones.txt
│   └── verification.txt
│
└── schemas/
    └── architecture-voip.png
    
```

---

## Compétences développées

- Administration d'un serveur FreePBX.
- Utilisation et administration d'Asterisk.
- Compréhension d'une architecture VoIP.
- Compréhension des principes de la ToIP.
- Configuration réseau d'un serveur de téléphonie.
- Administration d'un IPBX.
- Création et gestion d'extensions SIP/PJSIP.
- Configuration de softphones.
- Gestion des codecs VoIP.
- Compréhension des protocoles SIP, PJSIP, RTP et UDP.
- Mise en place de communications téléphoniques internes.
- Configuration d'une messagerie vocale.
- Création et administration de groupes d'appel.
- Diagnostic d'une infrastructure VoIP.
- Tests et validation du fonctionnement d'un système de téléphonie IP.

---

## Résultat

À l'issue de ce laboratoire, l'infrastructure permet :

- L'enregistrement de plusieurs extensions auprès du serveur FreePBX.
- La gestion centralisée des utilisateurs depuis l'interface Web.
- Les appels internes entre les différentes extensions.
- L'utilisation de softphones comme postes téléphoniques.
- L'utilisation d'une messagerie vocale.
- La consultation des messages vocaux.
- L'appel simultané de plusieurs utilisateurs grâce au Ring Group `6000`.

Le laboratoire permet ainsi de reproduire le fonctionnement de base d'une **infrastructure de téléphonie IP d'entreprise** administrée depuis un serveur FreePBX.

---

## Niveau

**Intermédiaire**
