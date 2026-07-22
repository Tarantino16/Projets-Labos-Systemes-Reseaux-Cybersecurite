###############################################################################
# Projet-Labo-02-1-Windows-Server-2022
# Script de création automatique des utilisateurs Active Directory
#
# Environnement :
# - Windows Server 2022
# - Active Directory Domain Services
# - PowerShell
#
# Domaine :
# - Tarantino.Mega
#
# Fichier source :
# - users.csv
#
# Objectifs :
# - Importer les utilisateurs depuis un fichier CSV
# - Générer automatiquement les identifiants
# - Créer les comptes Active Directory
# - Placer les utilisateurs dans les OU correspondantes
# - Ajouter les utilisateurs aux groupes de sécurité
###############################################################################


###############################################################################
# 1. IMPORTATION DU MODULE ACTIVE DIRECTORY
###############################################################################

Import-Module ActiveDirectory


###############################################################################
# 2. CONFIGURATION
###############################################################################

# Chemin vers le fichier CSV contenant les utilisateurs.
#
# Adapter le chemin si nécessaire.

$CsvPath = "C:\Users\Administrateur\Desktop\users.csv"


###############################################################################
# 3. VÉRIFICATION DU FICHIER CSV
###############################################################################

if (-not (Test-Path $CsvPath)) {

    Write-Error "Le fichier CSV est introuvable : $CsvPath"

    exit 1
}


###############################################################################
# 4. IMPORTATION DU FICHIER CSV
###############################################################################

$Utilisateurs = Import-Csv `
    -Path $CsvPath `
    -Delimiter ";"


###############################################################################
# 5. VÉRIFICATION DU CONTENU
###############################################################################

if (-not $Utilisateurs) {

    Write-Error "Le fichier CSV est vide ou ne contient aucune donnée."

    exit 1
}


###############################################################################
# 6. RÉCUPÉRATION DU DOMAINE ACTIVE DIRECTORY
###############################################################################

$Domaine = Get-ADDomain

$DomainDNS = $Domaine.DNSRoot

$DomainDN = $Domaine.DistinguishedName

Write-Host ""
Write-Host "Domaine détecté : $DomainDNS"
Write-Host "DistinguishedName : $DomainDN"
Write-Host ""


###############################################################################
# 7. PARCOURS DES UTILISATEURS
###############################################################################

foreach ($Element in $Utilisateurs) {


    ###########################################################################
    # 7.1 RÉCUPÉRATION DES INFORMATIONS
    ###########################################################################

    $Prenom = $Element.prenom.Trim()

    $Nom = $Element.nom.Trim()

    $Service = $Element.service.Trim()


    ###########################################################################
    # 7.2 CRÉATION DU NOM COMPLET
    ###########################################################################

    $NomComplet = "$Prenom $Nom"


    ###########################################################################
    # 7.3 GÉNÉRATION DU LOGIN
    ###########################################################################

    # Convention :
    #
    # Première lettre du prénom
    # +
    # "."
    # +
    # nom
    #
    # Exemple :
    #
    # Bob Dylan
    #
    # devient :
    #
    # b.dylan

    $Login = (
        $Prenom.Substring(0,1) +
        "." +
        $Nom
    ).ToLower()


    ###########################################################################
    # 7.4 GÉNÉRATION DU USER PRINCIPAL NAME
    ###########################################################################

    $UPN = "$Login@$DomainDNS"


    ###########################################################################
    # 7.5 AFFICHAGE DE L'UTILISATEUR EN COURS
    ###########################################################################

    Write-Host "---------------------------------------------"
    Write-Host "Utilisateur : $NomComplet"
    Write-Host "Login       : $Login"
    Write-Host "UPN         : $UPN"
    Write-Host "Service     : $Service"
    Write-Host "---------------------------------------------"


    ###########################################################################
    # 7.6 VÉRIFICATION DU MOT DE PASSE
    ###########################################################################

    if ([string]::IsNullOrWhiteSpace($Element.pass)) {

        Write-Warning "Aucun mot de passe défini pour $NomComplet."

        continue
    }


    ###########################################################################
    # 7.7 CONVERSION DU MOT DE PASSE
    ###########################################################################

    $MotDePasse = ConvertTo-SecureString `
        $Element.pass `
        -AsPlainText `
        -Force


    ###########################################################################
    # 7.8 RECHERCHE DE L'OU DU SERVICE
    ###########################################################################

    $OUService = Get-ADOrganizationalUnit `
        -Filter "Name -eq '$Service'" `
        -ErrorAction SilentlyContinue |
    Select-Object -First 1


    ###########################################################################
    # 7.9 VÉRIFICATION DE L'OU DU SERVICE
    ###########################################################################

    if ($null -eq $OUService) {

        Write-Warning "L'OU correspondant au service '$Service' est introuvable."

        continue
    }


    ###########################################################################
    # 7.10 RECHERCHE DE L'OU UTILISATEURS
    ###########################################################################

    $OUUtilisateurs = Get-ADOrganizationalUnit `
        -Filter "Name -eq 'utilisateurs'" `
        -SearchBase $OUService.DistinguishedName `
        -SearchScope OneLevel `
        -ErrorAction SilentlyContinue |
    Select-Object -First 1


    ###########################################################################
    # 7.11 VÉRIFICATION DE L'OU UTILISATEURS
    ###########################################################################

    if ($null -eq $OUUtilisateurs) {

        Write-Warning "L'OU utilisateurs est introuvable dans le service '$Service'."

        continue
    }


    ###########################################################################
    # 7.12 VÉRIFICATION DE L'EXISTENCE DU COMPTE
    ###########################################################################

    $UtilisateurExistant = Get-ADUser `
        -Filter "SamAccountName -eq '$Login'" `
        -ErrorAction SilentlyContinue


    ###########################################################################
    # 7.13 CRÉATION DU COMPTE UTILISATEUR
    ###########################################################################

    if ($null -eq $UtilisateurExistant) {

        Write-Host "Création de l'utilisateur : $NomComplet"

        New-ADUser `
            -Name $NomComplet `
            -DisplayName $NomComplet `
            -GivenName $Prenom `
            -Surname $Nom `
            -SamAccountName $Login `
            -UserPrincipalName $UPN `
            -AccountPassword $MotDePasse `
            -Path $OUUtilisateurs.DistinguishedName `
            -Enabled $true `
            -ChangePasswordAtLogon $true

        Write-Host "Utilisateur créé : $Login"

    }
    else {

        Write-Host "L'utilisateur existe déjà : $Login"
    }


    ###########################################################################
    # 7.14 GROUPE DE SÉCURITÉ DU SERVICE
    ###########################################################################

    # Convention :
    #
    # gg_<NomDuService>
    #
    # Exemple :
    #
    # Service :
    # Informatique
    #
    # Groupe :
    # gg_Informatique

    $NomGroupe = "gg_$Service"


    ###########################################################################
    # 7.15 VÉRIFICATION DU GROUPE
    ###########################################################################

    $Groupe = Get-ADGroup `
        -Filter "Name -eq '$NomGroupe'" `
        -ErrorAction SilentlyContinue


    ###########################################################################
    # 7.16 AJOUT DE L'UTILISATEUR AU GROUPE
    ###########################################################################

    if ($null -ne $Groupe) {

        $EstMembre = Get-ADGroupMember `
            -Identity $Groupe `
            -ErrorAction SilentlyContinue |
        Where-Object {
            $_.SamAccountName -eq $Login
        }

        if ($null -eq $EstMembre) {

            Write-Host "Ajout de $Login au groupe $NomGroupe"

            Add-ADGroupMember `
                -Identity $Groupe `
                -Members $Login

        }
        else {

            Write-Host "$Login est déjà membre du groupe $NomGroupe"
        }

    }
    else {

        Write-Warning "Le groupe $NomGroupe est introuvable."
    }


    ###########################################################################
    # 7.17 FIN DU TRAITEMENT DE L'UTILISATEUR
    ###########################################################################

    Write-Host "Traitement terminé pour : $NomComplet"
    Write-Host ""

}


###############################################################################
# 8. AFFICHAGE DES UTILISATEURS CRÉÉS
###############################################################################

Write-Host ""
Write-Host "Utilisateurs Active Directory :"
Write-Host ""

Get-ADUser `
    -Filter * |
Sort-Object Name |
Select-Object Name, SamAccountName, UserPrincipalName, DistinguishedName


###############################################################################
# 9. AFFICHAGE DES GROUPES
###############################################################################

Write-Host ""
Write-Host "Groupes de sécurité du laboratoire :"
Write-Host ""

Get-ADGroup `
    -Filter "Name -like 'gg_*'" |
Sort-Object Name |
Select-Object Name, GroupScope, GroupCategory


###############################################################################
# 10. VÉRIFICATION DES UTILISATEURS ET GROUPES
###############################################################################

foreach ($Element in $Utilisateurs) {

    $Login = (
        $Element.prenom.Substring(0,1) +
        "." +
        $Element.nom
    ).ToLower()

    $NomGroupe = "gg_$($Element.service)"

    $Utilisateur = Get-ADUser `
        -Filter "SamAccountName -eq '$Login'" `
        -ErrorAction SilentlyContinue

    if ($null -ne $Utilisateur) {

        Write-Host ""
        Write-Host "Utilisateur : $Login"

        Get-ADPrincipalGroupMembership `
            -Identity $Login |
        Select-Object Name

    }
}


###############################################################################
# 11. RÉSUMÉ
###############################################################################

Write-Host ""
Write-Host "============================================="
Write-Host "Création des utilisateurs terminée."
Write-Host "============================================="
Write-Host ""
Write-Host "Domaine : $DomainDNS"
Write-Host ""
Write-Host "Les utilisateurs ont été :"
Write-Host "- importés depuis users.csv"
Write-Host "- créés dans Active Directory"
Write-Host "- placés dans leur OU utilisateurs"
Write-Host "- ajoutés au groupe global de leur service"
Write-Host ""
Write-Host "============================================="


###############################################################################
# 12. SÉCURITÉ
###############################################################################

# ATTENTION :
#
# Le fichier users.csv utilisé par ce script contient
# un champ permettant de définir le mot de passe initial.
#
# Dans un environnement de laboratoire :
#
# - utiliser uniquement des mots de passe fictifs ;
# - ne jamais réutiliser un véritable mot de passe ;
# - ne jamais stocker d'identifiants sensibles sur GitHub.
#
# Dans un environnement de production, privilégier
# une méthode sécurisée de gestion des secrets.
###############################################################################
