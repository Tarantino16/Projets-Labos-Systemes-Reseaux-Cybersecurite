# Configuration du serveur DHCP

## Présentation

Le serveur DHCP assure l'attribution automatique des paramètres réseau aux postes clients de l'architecture.

Les postes configurés en mode DHCP reçoivent automatiquement :

- Une adresse IPv4
- Un masque de sous-réseau
- Une passerelle par défaut

Le serveur DHCP dessert les quatre VLAN utilisateurs de l'infrastructure.

---

# Configuration générale

| Paramètre | Valeur |
|-----------|---------|
| Adresse IP | 192.168.0.250 |
| Masque | 255.255.255.0 |
| Passerelle | 192.168.0.254 |
| Service DHCP | Activé |

---

# Pool DHCP - VLAN 10

| Paramètre | Valeur |
|-----------|---------|
| Nom du pool | Server Pool |
| Réseau | 192.168.0.0/24 |
| Première adresse | 192.168.0.1 |
| Passerelle | 192.168.0.254 |
| Nombre maximum d'utilisateurs | 10 |

---

# Pool DHCP - VLAN 11

| Paramètre | Valeur |
|-----------|---------|
| Nom du pool | Server Pool 1 |
| Réseau | 192.168.1.0/24 |
| Première adresse | 192.168.1.1 |
| Passerelle | 192.168.1.254 |
| Nombre maximum d'utilisateurs | 10 |

---

# Pool DHCP - VLAN 12

| Paramètre | Valeur |
|-----------|---------|
| Nom du pool | Server Pool 2 |
| Réseau | 192.168.2.0/24 |
| Première adresse | 192.168.2.1 |
| Passerelle | 192.168.2.254 |
| Nombre maximum d'utilisateurs | 10 |

---

# Pool DHCP - VLAN 13

| Paramètre | Valeur |
|-----------|---------|
| Nom du pool | Server Pool 3 |
| Réseau | 192.168.3.0/24 |
| Première adresse | 192.168.3.1 |
| Passerelle | 192.168.3.254 |
| Nombre maximum d'utilisateurs | 10 |

---

# Fonctionnement

Les requêtes DHCP provenant des VLAN 11, 12 et 13 sont relayées par le commutateur multicouche **SW-R-1** grâce à la commande :

```cisco
ip helper-address 192.168.0.250
```

Les clients du VLAN 10 communiquent directement avec le serveur DHCP.

---

# Vérification

Une fois la configuration terminée, chaque poste configuré en DHCP doit recevoir automatiquement :

- une adresse IP ;
- un masque de sous-réseau ;
- une passerelle par défaut.

La vérification peut être effectuée depuis un poste client avec :

```text
ipconfig
```

ou en testant la connectivité :

```text
ping 192.168.0.250
ping 192.168.10.250
ping 192.168.30.254
```

---

# Résumé

| VLAN | Réseau | Passerelle |
|------|---------|------------|
| VLAN 10 | 192.168.0.0/24 | 192.168.0.254 |
| VLAN 11 | 192.168.1.0/24 | 192.168.1.254 |
| VLAN 12 | 192.168.2.0/24 | 192.168.2.254 |
| VLAN 13 | 192.168.3.0/24 | 192.168.3.254 |
