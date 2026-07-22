# Configuration des postes clients

## Présentation

Les postes clients de cette architecture sont configurés pour obtenir automatiquement leur configuration réseau via le protocole **DHCP**.

La distribution des adresses IP est assurée par le serveur DHCP, tandis que les requêtes sont relayées par les commutateurs multicouches **SW-R-2** et **SW-R-3** grâce à la commande `ip helper-address`.

Les postes utilisent les **adresses IP virtuelles HSRP** comme passerelles par défaut. Ainsi, en cas de défaillance d'un commutateur multicouche, la continuité de service est assurée automatiquement.

---

# Configuration des postes

Pour chaque poste :

1. Ouvrir **Desktop**.
2. Sélectionner **IP Configuration**.
3. Cocher **DHCP**.

Aucune adresse IP n'est configurée manuellement.

---

# Répartition des VLAN

| VLAN | Réseau | Passerelle virtuelle HSRP |
|------|----------------|----------------|
| VLAN 10 | 192.168.1.0/24 | 192.168.1.254 |
| VLAN 20 | 192.168.2.0/24 | 192.168.2.254 |
| VLAN 30 | 192.168.3.0/24 | 192.168.3.254 |
| VLAN 40 | 192.168.4.0/24 | 192.168.4.254 |
| VLAN 50 | 192.168.5.0/24 | 192.168.5.254 |
| VLAN 60 | 192.168.6.0/24 | 192.168.6.254 |
| VLAN 70 | 192.168.7.0/24 | 192.168.7.254 |
| VLAN 80 | 192.168.8.0/24 | 192.168.8.254 |
| VLAN 90 | 192.168.9.0/24 | 192.168.9.254 |
| VLAN 100 | 192.168.10.0/24 | 192.168.10.254 |
| VLAN 110 | 192.168.11.0/24 | 192.168.11.254 |
| VLAN 120 | 192.168.12.0/24 | 192.168.12.254 |

---

# Fonctionnement

Les postes reçoivent automatiquement :

- une adresse IPv4 ;
- un masque de sous-réseau ;
- une passerelle par défaut (adresse virtuelle HSRP) ;
- les autres paramètres réseau distribués par le serveur DHCP.

Les communications entre les différents VLAN sont assurées par **SW-R-2** et **SW-R-3**, tandis que **R-9** assure la connectivité avec le réseau extérieur.

---

# Vérification

Depuis un poste client :

```text
ipconfig
```

Le poste doit recevoir automatiquement une adresse appartenant à son VLAN.

Vérifier ensuite la connectivité :

```text
ping 192.168.1.254
ping 192.168.2.254
ping 192.168.15.254
```

Puis tester l'accès à un autre VLAN :

```text
ping 192.168.10.250
```

Enfin, vérifier l'accès au réseau extérieur via **R-9**.

---

# Résultat attendu

À l'issue de la configuration :

- les postes obtiennent automatiquement leur configuration réseau ;
- la passerelle utilisée est l'adresse virtuelle HSRP ;
- la communication inter-VLAN fonctionne normalement ;
- un basculement HSRP est transparent pour les utilisateurs ;
- l'accès au réseau extérieur est assuré par **R-9**.
