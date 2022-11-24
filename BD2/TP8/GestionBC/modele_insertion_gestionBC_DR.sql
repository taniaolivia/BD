-- ============================================================================
-- Fichier : modele_insertion_gestionBC_DR.sql
-- Auteur  : Tania OLIVIA
-- Date    : 16/04/2020
-- Role    : Tester le ddl de la gestion BC
-- ============================================================================
-- ============================================================================
-- Modification du format de la date pour se conformer aux donnees du programme de test
-- ============================================================================
alter session set NLS_DATE_FORMAT='dd/mm/yyyy';

-- ============================================================================
-- Suppression des nuplets de la base de donnees
-- NB : Le test est effectué sur une base vide, il est nécessaire 
--      de supprimer tous les nuplets de toutes les relations
-- ============================================================================
@vide_contenu_base_gestionBC.sql
@presentation_gestionBC.sql

-- ============================================================================
-- Debut de l'ecriture du fichier resultat du programme de test 
-- ============================================================================

SPOOL modele_insertion_gestionBC_DR.out

-- ============================================================================
-- Insertion des nuplets
-- ============================================================================

INSERT  INTO CLIENT (NUMCLIENT, NOMCLIENT, ADRESSE, TEL)
VALUES ('MAT', 'Matthew', '28 Rue du Cordouan', '0780712132');

INSERT  INTO EMPLOYE (NUMEMP, NOMEMP)
VALUES ('TAN', 'Tania');

INSERT  INTO COMPTE (NUMCOMPTE, SOLDE, DATE_OUVERTURE, PROPRIETAIRE)
VALUES ('COMP1', '1000', TO_DATE('16/04/2020', 'DD/MM/YYYY'), 'MAT');

INSERT  INTO COMPTE_COURANT (NUMCOMPTE_COURANT, NB_OP_CB)
VALUES ('COMP1', '3578924321');

INSERT  INTO COMPTE_EPARGNE (NUMCOMPTE_EPARGNE, TX_INTERNET)
VALUES ('COMP1', '9,24');

INSERT  INTO DROIT_SIGNATURE (NUMCLIENT, NUMCOMPTE_COURANT, EMPLOYE, DROIT)
VALUES ('MAT', 'COMP1', 'TAN', 'Droit complet 1');

INSERT  INTO MOUVEMENT (ID_MOUVEMENT, MONTANT, NUMCLIENT, NUMCOMPTE_COURANT, DATEOP)
VALUES ('MOUV1', '5,56', 'MAT', 'COMP1', TO_DATE('18/04/2020', 'DD/MM/YYYY'));


SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

@affiche_contenu_base_gestionBC.sql