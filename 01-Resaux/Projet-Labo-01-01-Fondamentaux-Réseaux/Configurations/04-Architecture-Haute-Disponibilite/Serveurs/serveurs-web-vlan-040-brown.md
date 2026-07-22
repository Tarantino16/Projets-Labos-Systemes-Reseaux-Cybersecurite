# Serveur Web - VLAN 40 (Brown)

## Présentation

Ce serveur Web est hébergé sur le **VLAN 40 (Brown)** et met à disposition un site Internet accessible depuis le réseau interne ainsi que depuis le réseau extérieur grâce aux règles de traduction d'adresses (NAT/PAT) configurées sur le routeur **R-9**.

Il fait partie de l'architecture de haute disponibilité et bénéficie de la redondance des passerelles assurée par le protocole **HSRP**.

---

# Configuration générale

| Paramètre | Valeur |
|-----------|---------|
| Nom | Serveur Web VLAN 40 |
| VLAN | 40 (Brown) |
| Adresse IP | 192.168.4.250 |
| Masque | 255.255.255.0 |
| Passerelle | 192.168.4.254 (HSRP) |
| Service | HTTP |

---

# Configuration IP

```text
Adresse IP : 192.168.4.250
Masque      : 255.255.255.0
Passerelle  : 192.168.4.254
DNS         : Non configuré
```

---

# Configuration HTTP

Le service **HTTP** est activé.

Le serveur héberge le site :

**www.Architecture-4-VLAN40.fr**

---

# Publication vers Internet

Le serveur est publié par le routeur **R-9** grâce à une règle de NAT statique.

| Adresse publique | Adresse privée | Port |
|------------------|----------------|------|
| 100.0.18.253 | 192.168.4.250 | TCP/808 |

Configuration Cisco utilisée :

```cisco
ip nat inside source static tcp 192.168.4.250 80 100.0.18.253 808
```

---

# Haute disponibilité

La passerelle utilisée est l'adresse virtuelle **HSRP** :

```text
192.168.4.254
```

Cette adresse est partagée entre **SW-R-2** et **SW-R-3**.

En cas de défaillance du commutateur multicouche actif, le second équipement prend automatiquement le relais afin d'assurer la continuité du service.

---

# Vérification

Depuis un poste du VLAN 40 :

```text
ping 192.168.4.250
```

Accès au site :

```text
http://192.168.4.250
```

Depuis le réseau extérieur :

```text
http://100.0.18.253:808
```

---

# Résultat attendu

- Le serveur répond aux requêtes HTTP.
- Les postes du VLAN 40 accèdent au serveur.
- Le serveur reste accessible lors d'un basculement HSRP.
- La publication Internet fonctionne grâce au NAT configuré sur **R-9**.
