# Serveur Web

## Présentation

Le serveur Web héberge le site Internet de la troisième architecture réseau.

Il est connecté au **VLAN 10** et permet de mettre en œuvre la publication d'un service HTTP accessible depuis le réseau interne ainsi que depuis le réseau extérieur grâce à une règle de traduction d'adresses (NAT/PAT) configurée sur le routeur **R-8**.

Cette architecture illustre le fonctionnement d'un serveur publié sur Internet tout en maintenant une séparation entre les différents VLAN de l'infrastructure.

---

# Configuration générale

| Paramètre | Valeur |
|-----------|---------|
| Nom | Serveur Web |
| Adresse IP | 192.168.4.250 |
| Masque | 255.255.255.0 |
| Passerelle | 192.168.4.254 |
| VLAN | 10 |
| Service | HTTP |

---

# Configuration HTTP

Le service HTTP est activé.

Le site hébergé est accessible à l'adresse :

**www.Architecture-3.fr**

---

# Emplacement dans l'architecture

Le serveur est connecté au réseau :

```
192.168.4.0/24
```

Sa passerelle par défaut est :

```
192.168.4.254
```

Le routage entre les différents VLAN est assuré par le routeur **R-8** grâce au mécanisme **Router-on-a-Stick**.

---

# Publication vers Internet

Le routeur **R-8** publie le serveur Web grâce à une règle de NAT statique.

| Adresse publique | Adresse privée | Service |
|------------------|----------------|----------|
| 100.0.17.253 | 192.168.4.250 | HTTP (TCP/80) |

Configuration utilisée :

```cisco
ip nat inside source static tcp 192.168.4.250 80 100.0.17.253 80
```

---

# Sécurisation

L'accès au serveur est contrôlé par des listes de contrôle d'accès (ACL) configurées sur le routeur **R-8**.

Seul le trafic autorisé peut atteindre le serveur Web depuis le réseau extérieur.

---

# Vérification

Depuis un poste du réseau :

```
ping 192.168.4.250
```

Puis ouvrir un navigateur Web :

```
http://192.168.4.250
```

Depuis le réseau extérieur :

```
http://100.0.17.253
```

Le site **www.Architecture-3.fr** doit s'afficher correctement.

---

# Résumé

| Élément | Valeur |
|----------|---------|
| VLAN | 10 |
| Adresse IP | 192.168.4.250 |
| Passerelle | 192.168.4.254 |
| Service | HTTP |
| Publication | NAT statique |
| Port publié | TCP 80 |
| Routeur de publication | R-8 |
