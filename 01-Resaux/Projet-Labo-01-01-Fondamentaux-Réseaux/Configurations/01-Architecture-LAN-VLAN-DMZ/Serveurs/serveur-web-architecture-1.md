# Serveur Web

## Présentation

Le serveur Web héberge le site Internet de la première architecture réseau.

Il est placé dans le **VLAN 100**, qui joue le rôle de **DMZ (Demilitarized Zone)**. Cette architecture permet de rendre le serveur accessible depuis l'extérieur tout en protégeant le reste du réseau interne.

L'accès au serveur est limité au protocole HTTP (port 80) grâce à une liste de contrôle d'accès (ACL) configurée sur le routeur **R-1**.

---

# Configuration générale

| Paramètre | Valeur |
|-----------|---------|
| Nom | Serveur Web |
| Adresse IP | 192.168.10.250 |
| Masque | 255.255.255.0 |
| Passerelle | 192.168.10.254 |
| VLAN | 100 |
| Service | HTTP |

---

# Configuration HTTP

Le service HTTP est activé.

La page d'accueil du serveur est configurée avec le site :

**www.Architecture-1.fr**

La page est personnalisée avec un thème de couleur **bleu**.

---

# Emplacement dans l'architecture

Le serveur est connecté au commutateur multicouche **SW-R-1**.

Il appartient au réseau :

```
192.168.10.0/24
```

Sa passerelle par défaut est :

```
192.168.10.254
```

---

# Publication vers Internet

Le routeur **R-1** publie le serveur Web grâce à une règle de PAT statique.

Correspondance :

| Adresse publique | Adresse privée | Service |
|------------------|----------------|----------|
| 100.0.1.253 | 192.168.10.250 | HTTP (TCP/80) |

Configuration utilisée :

```cisco
ip nat inside source static tcp 192.168.10.250 80 100.0.1.253 80
```

---

# Sécurisation

Le serveur est protégé par une ACL appliquée sur le routeur **R-1**.

Cette ACL :

- autorise uniquement le protocole HTTP (TCP/80) ;
- autorise les connexions déjà établies ;
- bloque tout autre trafic entrant.

Configuration :

```cisco
ip access-list extended 103

permit tcp any 192.168.10.0 0.0.0.255 eq 80
permit tcp 192.168.10.0 0.0.0.255 any established
deny ip any any
```

---

# Vérification

Depuis un poste client :

```
ping 192.168.10.250
```

Depuis un navigateur Web :

```
http://192.168.10.250
```

Depuis l'extérieur :

```
http://100.0.1.253
```

La page **www.Architecture-1.fr** doit s'afficher correctement.

---

# Résumé

| Élément | Valeur |
|----------|---------|
| VLAN | 100 |
| Adresse IP | 192.168.10.250 |
| Passerelle | 192.168.10.254 |
| Service | HTTP |
| Publication | NAT/PAT |
| Port publié | TCP 80 |
| Protection | ACL 103 |
