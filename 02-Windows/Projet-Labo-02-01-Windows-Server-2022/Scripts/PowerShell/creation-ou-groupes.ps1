###############################################################################
# Projet-Labo-02-1-Windows-Server-2022
# Script de création des unités d'organisation et groupes de sécurité
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
# - OU.csv
###############################################################################


###############################################################################
# 1. IMPORTATION DU MODULE ACTIVE DIRECTORY
###############################################################################

Import-Module ActiveDirectory


###############################################################################
# 2. CONFIGURATION
###############################################################################

# Chemin vers le fichier CSV contenant la structure des OU.
#
# Adapter ce chemin si nécessaire.

$CsvPath = "C:\Users\Administrateur\Desktop\OU.csv"


###############################################################################
# 3. RÉCUPÉRATION DU DOMAINE
###############################################################################

$Domain = Get-ADDomain

$DomainDN = $Domain.DistinguishedName

Write-Host "Domaine détecté : $($Domain.DNSRoot)"
Write-Host "DistinguishedName : $DomainDN"


###############################################################################
# 4. IMPORTATION DU FICHIER CSV
###############################################################################

if (-not (Test-Path $CsvPath)) {

    Write-Error "Le fichier CSV est introuvable : $CsvPath"

    exit 1
}

$Unites = Import-Csv `
    -Path $CsvPath `
    -Delimiter ";"


###############################################################################
# 5. VÉRIFICATION DU CONTENU
###############################################################################

if (-not $Unites) {

    Write-Error "Le fichier CSV est vide ou ne contient aucune donnée exploitable."

    exit 1
}


###############################################################################
# 6. FONCTION DE RECHERCHE D'UNE OU
###############################################################################

function Get-OUByName {

    param (
        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    Get-ADOrganizationalUnit `
        -Filter "Name -eq '$Name'" `
        -ErrorAction SilentlyContinue |
    Select-Object -First 1
}


###############################################################################
# 7. CRÉATION DES OU RACINES
###############################################################################

foreach ($Element in $Unites) {

    if ([string]::IsNullOrWhiteSpace($Element.parent)) {

        $OUExistante = Get-OUByName -Name $Element.enfant

        if ($null -eq $OUExistante) {

            Write-Host "Création de l'OU racine : $($Element.enfant)"

            New-ADOrganizationalUnit `
                -Name $Element.enfant `
                -Path $DomainDN `
                -ProtectedFromAccidentalDeletion $true

        }
        else {

            Write-Host "OU déjà existante : $($Element.enfant)"
        }
    }
}


###############################################################################
# 8. CRÉATION DES OU ENFANTS
###############################################################################

# Plusieurs passages peuvent être nécessaires si la structure
# contient plusieurs niveaux de profondeur.

$MaximumPasses = 10

for ($Pass = 1; $Pass -le $MaximumPasses; $Pass++) {

    $Modification = $false

    foreach ($Element in $Unites) {

        if (-not [string]::IsNullOrWhiteSpace($Element.parent)) {

            $OUExistante = Get-OUByName -Name $Element.enfant

            if ($null -eq $OUExistante) {

                $OUParent = Get-OUByName -Name $Element.parent

                if ($null -ne $OUParent) {

                    Write-Host "Création de l'OU $($Element.enfant) dans $($Element.parent)"

                    New-ADOrganizationalUnit `
                        -Name $Element.enfant `
                        -Path $OUParent.DistinguishedName `
                        -ProtectedFromAccidentalDeletion $true

                    $Modification = $true
                }
            }
        }
    }

    if (-not $Modification) {

        break
    }
}


###############################################################################
# 9. VÉRIFICATION DES OU NON CRÉÉES
###############################################################################

foreach ($Element in $Unites) {

    $OUExistante = Get-OUByName -Name $Element.enfant

    if ($null -eq $OUExistante) {

        Write-Warning "Impossible de créer ou trouver l'OU : $($Element.enfant)"
    }
}


###############################################################################
# 10. CRÉATION DES GROUPES GLOBAUX DE SÉCURITÉ
###############################################################################

# Les OU techniques suivantes sont exclues :
#
# - utilisateurs
# - ordinateurs
#
# Aucun groupe gg_utilisateurs ou gg_ordinateurs
# n'est créé.

$OUExclues = @(
    "utilisateurs",
    "ordinateurs"
)


foreach ($Element in $Unites) {

    if ($OUExclues -contains $Element.enfant.ToLower()) {

        continue
    }

    $NomGroupe = "gg_$($Element.enfant)"

    $GroupeExistant = Get-ADGroup `
        -Filter "Name -eq '$NomGroupe'" `
        -ErrorAction SilentlyContinue

    if ($null -eq $GroupeExistant) {

        $OU = Get-OUByName -Name $Element.enfant

        if ($null -ne $OU) {

            Write-Host "Création du groupe : $NomGroupe"

            New-ADGroup `
                -Name $NomGroupe `
                -SamAccountName $NomGroupe `
                -GroupCategory Security `
                -GroupScope Global `
                -Path $OU.DistinguishedName

        }
        else {

            Write-Warning "OU introuvable pour le groupe : $NomGroupe"
        }

    }
    else {

        Write-Host "Groupe déjà existant : $NomGroupe"
    }
}


###############################################################################
# 11. IMBRICATION DES GROUPES ENFANTS DANS LES GROUPES PARENTS
###############################################################################

foreach ($Element in $Unites) {

    if ([string]::IsNullOrWhiteSpace($Element.parent)) {

        continue
    }

    if (
        ($OUExclues -contains $Element.enfant.ToLower()) -or
        ($OUExclues -contains $Element.parent.ToLower())
    ) {

        continue
    }

    $GroupeParent = "gg_$($Element.parent)"

    $GroupeEnfant = "gg_$($Element.enfant)"

    $ParentExiste = Get-ADGroup `
        -Filter "Name -eq '$GroupeParent'" `
        -ErrorAction SilentlyContinue

    $EnfantExiste = Get-ADGroup `
        -Filter "Name -eq '$GroupeEnfant'" `
        -ErrorAction SilentlyContinue

    if (($null -ne $ParentExiste) -and ($null -ne $EnfantExiste)) {

        $EstDejaMembre = Get-ADGroupMember `
            -Identity $GroupeParent `
            -ErrorAction SilentlyContinue |
        Where-Object {
            $_.DistinguishedName -eq $EnfantExiste.DistinguishedName
        }

        if ($null -eq $EstDejaMembre) {

            Write-Host "Ajout de $GroupeEnfant dans $GroupeParent"

            Add-ADGroupMember `
                -Identity $GroupeParent `
                -Members $GroupeEnfant

        }
        else {

            Write-Host "$GroupeEnfant est déjà membre de $GroupeParent"
        }
    }
}


###############################################################################
# 12. AFFICHAGE DES UNITÉS D'ORGANISATION
###############################################################################

Write-Host ""
Write-Host "Unités d'organisation créées :"
Write-Host ""

Get-ADOrganizationalUnit `
    -Filter * |
Sort-Object Name |
Select-Object Name, DistinguishedName


###############################################################################
# 13. AFFICHAGE DES GROUPES CRÉÉS
###############################################################################

Write-Host ""
Write-Host "Groupes globaux de sécurité :"
Write-Host ""

Get-ADGroup `
    -Filter "Name -like 'gg_*'" |
Sort-Object Name |
Select-Object Name, GroupScope, GroupCategory


###############################################################################
# 14. FIN DU SCRIPT
###############################################################################

Write-Host ""
Write-Host "Création des OU et groupes terminée."
Write-Host ""
