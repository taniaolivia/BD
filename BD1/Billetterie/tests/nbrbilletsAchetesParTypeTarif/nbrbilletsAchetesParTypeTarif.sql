-- ____________________________________________________________________________
-- Fichier          : nbrbilletsAchetesParTypeTarif.sql
-- Auteur           : Brouillé Théo
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Q1. Quel est le nombre de billets achetés par type de tarif ?
--					  On souhaite afficher l’ensemble des types de tarif existants.
-- ____________________________________________________________________________
-- Hypothèses si nécessaire :
-- ____________________________________________________________________________
-- Résultat attendu :
--TYPETARIF                NBRBILLETS
-------------------------- ----------
--etudiant                          3
--enfant                            2
--plein                             0
--____________________________________________________________________________
-- Requête SQL :

SELECT T.TYPETARIF, COUNT(B.IDBILLET) as NBRBILLETS
FROM TARIF T, BILLET B
WHERE T.IDTARIF = B.IDTARIF(+)
GROUP BY T.TYPETARIF;
