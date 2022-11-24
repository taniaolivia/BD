-- ============================================================================
-- Fichier : modele_insertion_gestionDT_DR.sql
-- Auteur  : Tania OLIVIA
-- Date    : 16/04/2020
-- Role    : Tester le ddl de la gestion DT
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
@vide_contenu_base_gestionDT.sql
@presentation_gestionDT.sql

-- ============================================================================
-- Debut de l'ecriture du fichier resultat du programme de test 
-- ============================================================================

SPOOL modele_insertion_gestionDT_DR.out

-- ============================================================================
-- Insertion des nuplets
-- ============================================================================

INSERT  INTO AGENCE (ID_AGENCE, NOMAGENCE)
VALUES ('FB', 'Facomegu');

INSERT  INTO EMPLOYE (ID_EMPLOYE, NOMEMPLOYE, TEL_BUREAU, MEL, ID_AGENCE)
VALUES ('M1', 'Michelle', '0780712182', 'michelleolivia10@yahoo.com', 'FB');

INSERT  INTO SERVICE (ID_SERVICE, NOMSERVICE, ID_RESPONSABLE)
VALUES ('SR', 'Service 1', 'M1');

INSERT  INTO TYPE_DEMANDE (ID_TYPEDEMANDE, LIB_TYPEDEMANDE)
VALUES ('NK', 'Demande 1');

INSERT  INTO DEMANDE_TRAVAUX (NUMDT, DATEDEMANDE, DESCRIPTION, ETAT_DEMANDE, DATECLOTURE, PRIORITE, TYPEDELADEMANDE, EMMETEUR)
VALUES ('DT', TO_DATE('16/04/2020', 'DD/MM/YYYY'), 'Demande du travaux 1', 'Cloturée', TO_DATE('25/04/2020', 'DD/MM/YYYY'), '1', 'NK', 'M1');

INSERT  INTO TECHNICIEN(ID_TECHNICIEN)
VALUES ('M1');

INSERT  INTO COMMENTAIRE(ID_COMMENTAIRE, DATECOMMENTAIRE, LIB_COMMENTAIRE, EMMETEUR_COMMENTAIRE, NUMDT)
VALUES ('COM1', TO_DATE('16/04/2020', 'DD/MM/YYYY'),'Commentaire du demande 1', 'M1', 'DT');

INSERT  INTO AFFECTATION(NUMDT, TECHNICIEN_AFFECTE, DATEAFFECTATION, DATEPRISEENCHARGE)
VALUES ('DT', 'M1', TO_DATE('17/04/2020', 'DD/MM/YYYY'), TO_DATE('24/04/2020', 'DD/MM/YYYY'));


SPOOL OFF

-- ============================================================================
-- Fin du programme de test
-- ============================================================================

@affiche_contenu_base_gestionDT.sql