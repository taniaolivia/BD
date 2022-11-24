-- ============================================================================
-- Fichier          : afficher_base_billetterie.sql
-- Auteur           : Brouillé Théo
-- Date             : janvier 2019
-- Base				: Billetterie
-- Role             : Affiche le contenu de l'ensemble des relations de la base de données
-- ============================================================================

SELECT DISTINCT IDCLI, NOMCLI, PRENOMCLI, TELCLI, MAILCLI, ADRCLI
FROM CLIENT;

SELECT DISTINCT IDBILLET, CODEBILLET, IDEVT, IDCLI, IDTARIF, IDSITERESA
FROM BILLET;

SELECT DISTINCT IDEVT, TITREEVT, DATEEVT, TYPEEVT, IDSALLE
FROM EVENEMENT;

SELECT DISTINCT IDSALLE, NOMSALLE, ADRSALLE
FROM SALLE;

SELECT DISTINCT IDTARIF, PRIX, TYPETARIF
FROM TARIF;

SELECT DISTINCT IDSITERESA, NOMSITERESA, URLSITERESA
FROM SITERESA;

SELECT DISTINCT IDPART, NOMPART, NATIONALITE
FROM PARTENAIRE;

SELECT DISTINCT IDEVT, IDPART, PRIME
FROM SPONSORING;
