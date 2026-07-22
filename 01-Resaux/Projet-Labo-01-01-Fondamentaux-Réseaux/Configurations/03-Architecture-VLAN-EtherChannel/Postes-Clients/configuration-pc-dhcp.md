# Configuration des postes clients

## Présentation

Les postes clients de cette architecture sont configurés pour obtenir automatiquement leurs paramètres réseau grâce au serveur DHCP intégré au routeur **R-8**.

Chaque poste reçoit automatiquement :

- une adresse IPv4 ;
- un masque de sous-réseau ;
- une passerelle par défaut.

Le serveur DHCP distribue les adresses aux quatre VLAN utilisateurs de l'infrastructure.

---

# Configuration des postes

Pour chaque poste client :

1. Ouvrir **Desktop**.
2. Sélectionner **IP Configuration**.
3. Cocher **DHCP**.

Aucune configuration IPv4 manuelle n'est nécessaire.

---

# Répartition des postes

| Poste | VLAN | Réseau | Passerelle |
|-------|------|----------------|----------------|
| PC0 | VLAN 10 (Jaune) | 192.168.4.0/24 | 192.168.4.254 |
| PC1 | VLAN 10 (Jaune) | 192.168.4.0/24 | 192.168.4.254 |
| PC2 | VLAN 11 (Marron) | 192.168.5.0/24 | 192.168.5.254 |
| PC3 | VLAN 12 (Violet) | 192.168.6.0/24 | 192.168.6.254 |
| PC4 | VLAN 13 (Pêche) | 192.168.7.0/24 | 192.168.7.254 |

---

# Paramètres distribués par DHCP

Le routeur **R-8** fournit automatiquement :

- Adresse IPv4
- Masque de sous-réseau
- Passerelle par défaut

---

# Vérifications

Depuis chaque poste :

```text
ipconfig
```

Le poste doit recevoir automatiquement une adresse appartenant à son VLAN.

Tester ensuite la connectivité :

```text
ping 192.168.4.254
ping 192.168.5.254
ping 192.168.6.254
ping 192.168.7.254
```

Puis vérifier le routage inter-VLAN :

```text
ping 192.168.4.250
```

Le serveur Web doit répondre.

---

# Résultat attendu

À l'issue de la configuration :

- les postes obtiennent automatiquement leur configuration réseau ;
- les postes d'un VLAN peuvent communiquer avec leur passerelle ;
- le routage inter-VLAN est assuré par **R-8** ;
- le serveur Web est accessible ;
- l'accès au réseau extérieur est assuré par la traduction d'adresses (NAT/PAT).
