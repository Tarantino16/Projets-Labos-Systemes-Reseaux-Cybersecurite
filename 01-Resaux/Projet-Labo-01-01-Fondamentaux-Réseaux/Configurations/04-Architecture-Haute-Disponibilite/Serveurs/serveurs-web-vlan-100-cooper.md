# Serveur Web - VLAN 100 (Copper)

## Présentation

Ce serveur Web est hébergé sur le **VLAN 100 (Copper)** et met à disposition un site Internet accessible depuis le réseau interne ainsi que depuis le réseau extérieur grâce aux règles de traduction d'adresses (NAT/PAT) configurées sur le routeur **R-9**.

Il fait partie de l'architecture de haute disponibilité et bénéficie de la redondance des passerelles assurée par le protocole **HSRP**.

---

# Configuration générale

| Paramètre | Valeur |
|-----------|---------|
| Nom | Serveur Web VLAN 100 |
| VLAN | 100 (Copper) |
| Adresse IP | 192.168.10.250 |
| Masque | 255.255.255.0 |
| Passerelle | 192.168.10.254 (HSRP) |
| Service | HTTP |

---

# Configuration IP

```text
Adresse IP : 192.168.10.250
Masque      : 255.255.255.0
Passerelle  : 192.168.10.254
DNS         : Non configuré
```

---

# Configuration HTTP

Le service **HTTP** est activé.

Le serveur héberge le site :

**www.Architecture-4-VLAN100.fr**

---

# Publication vers Internet

Le serveur est publié par le routeur **R-9** grâce à une règle de NAT statique.

| Adresse publique | Adresse privée | Port |
|------------------|----------------|------|
| 100.0.18.253 | 192.168.10.250 | TCP/8088 |

Configuration Cisco utilisée :

```cisco
ip nat inside source static tcp 192.168.10.250 80 100.0.18.253 8088
```

---

# Haute disponibilité

La passerelle utilisée est l'adresse virtuelle **HSRP** :

```text
192.168.10.254
```

Cette adresse est partagée entre **SW-R-2** et **SW-R-3**.

En cas de défaillance du commutateur actif, le trafic est automatiquement redirigé vers le commutateur de secours sans interruption de service.

---

# Vérification

Depuis un poste du VLAN 100 :

```text
ping 192.168.10.250
```

Accès au site :

```text
http://192.168.10.250
```

Depuis le réseau extérieur :

```text
http://100.0.18.253:8088
```

---

# Résultat attendu

- Le serveur répond aux requêtes HTTP.
- Les postes du VLAN 100 accèdent au serveur.
- Le serveur reste accessible lors d'un basculement HSRP.
- La publication Internet fonctionne grâce au NAT configuré sur **R-9**.
