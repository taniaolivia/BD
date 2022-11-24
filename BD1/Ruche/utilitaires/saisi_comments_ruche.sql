-- ============================================================================
-- Fichier          : saisi_comments_ruche.sql 
-- Auteur           : Tania OLIVIA
-- Date             : 13 Decembre 2019
-- Role             : Exécuter les ordres COMMENT pour la table et les colonnes de la relation RUCHE
-- Fichier resultat : 
-- ============================================================================

-- ============================================================================
-- TABLE APICULTEUR
-- ============================================================================

COMMENT on TABLE APICULTEUR IS 'Personne qui élève des abeilles dans le but de récolter du miel';

-- ============================================================================
-- TABLE RUCHER
-- ============================================================================

COMMENT on TABLE RUCHER IS 'Entité qui rassemble des ruches se trouvant au même endroit';

-- ============================================================================
-- TABLE RUCHE
-- ============================================================================

COMMENT on TABLE RUCHE IS 'Boite contenant des cadres sur lesquels les abeilles viennent y dépose le miel';

-- ============================================================================
-- TABLE RECOLTE
-- ============================================================================

COMMENT on TABLE RECOLTE IS 'Récolte d’une ruche';





-- ============================================================================
-- COLONNES DE LA TABLE APICULTEUR
-- ============================================================================

COMMENT on COLUMN APICULTEUR.IDAPI IS 'identifiant d’un apiculteur (entier avec 4 chiffres)' ;
COMMENT on COLUMN APICULTEUR.NOMAPI IS 'nom d’un apiculteur (max 40 caractères)' ;
COMMENT on COLUMN APICULTEUR.PRENOMAPI IS 'prénom d’un apiculteur (max 40 caractères)' ;
COMMENT on COLUMN APICULTEUR.TELAPI IS 'numéro de téléphone d’un apiculteur (max 10 caractères)' ;
COMMENT on COLUMN APICULTEUR.MAILAPI IS 'adresse email d’un apiculteur (max 80 caractères), non obligatoire' ;
COMMENT on COLUMN APICULTEUR.ADRAPI IS 'adresse d’un apiculteur (max 255 caractères)' ;

-- ============================================================================
-- COLONNES DE LA TABLE RUCHER
-- ============================================================================

COMMENT on COLUMN RUCHER.IDRUCHER IS 'identifiant d’un rucher (entier avec 4 chiffres)' ;
COMMENT on COLUMN RUCHER.TYPEMIEL IS 'Type de miel pour ce rucher, valeurs énumérées : « acacia »,
« colza », « sapin », « thym » (chaine de taille fixe de 6 caractères)' ;

-- ============================================================================

COMMENT on COLUMN RUCHE.IDRU IS 'identifiant d’une ruche (entier avec 4 chiffres)' ;
COMMENT on COLUMN RUCHE.NBCADRE IS 'Nombre de cadres à l’intérieur de la ruche (entier avec 2 chiffres). Ce
nombre est nécessairement supérieur à 0.' ;
COMMENT on COLUMN RUCHE.IDAPI IS 'identifiant de l’apiculteur propriétaire de la ruche (entier avec 4
chiffres)' ;
COMMENT on COLUMN RUCHE.IDRUCHER IS 'identifiant du rucher où se trouve la ruche (entier avec 4 chiffres)' ;

-- ============================================================================
-- COLONNES DE LA TABLE RECOLTE
-- ============================================================================

COMMENT on COLUMN RECOLTE.IDRU IS 'Identifiant de la ruche récoltée (entier avec 4 chiffres)' ;
COMMENT on COLUMN RECOLTE.DATEREC IS 'Date de la récolte' ;
COMMENT on COLUMN RECOLTE.MASSE IS 'Masse de miel récolté pour la ruche en kg (nombre avec 1 chiffre
avant la virgule et 3 après la virgule). Cette masse est nécessairement
supérieure à 0.' ;