# Configuration des postes clients

## Mode d’adressage

Les huit postes clients de l’architecture sont configurés pour obtenir automatiquement leur configuration réseau grâce au protocole DHCP.

## Postes concernés

| Poste | Configuration IPv4 |
|---|---|
| PC0 | DHCP |
| PC1 | DHCP |
| PC2 | DHCP |
| PC3 | DHCP |
| PC4 | DHCP |
| PC5 | DHCP |
| PC6 | DHCP |
| PC7 | DHCP |

## Paramétrage dans Cisco Packet Tracer

Pour chaque poste :

1. Ouvrir le poste.
2. Sélectionner l’onglet `Desktop`.
3. Ouvrir `IP Configuration`.
4. Sélectionner `DHCP`.

Le poste reçoit automatiquement :

- une adresse IPv4 ;
- un masque de sous-réseau ;
- une passerelle par défaut ;
- les paramètres réseau fournis par le serveur DHCP.

## Répartition des postes

| Postes | VLAN | Réseau | Passerelle |
|---|---:|---|---|
| PC0 à PC2 | VLAN 10 — bleu | 192.168.0.0/24 | 192.168.0.254 |
| PC3 | VLAN 11 — rouge | 192.168.1.0/24 | 192.168.1.254 |
| PC4 et PC5 | VLAN 12 — orange | 192.168.2.0/24 | 192.168.2.254 |
| PC6 et PC7 | VLAN 13 — vert | 192.168.3.0/24 | 192.168.3.254 |

## Vérifications

Sur chaque poste, ouvrir `Command Prompt` puis exécuter :

```text
ipconfig
ping 192.168.0.254
ping 192.168.10.250
