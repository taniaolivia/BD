-- ____________________________________________________________________________
-- Fichier          : nbrDiffEvtMartin.sql
-- Auteur           : Brouillé Théo
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Q4. Quel est le nombre d'événements différents
--                    pour lesquels Jean MARTIN a acheté des billets ?
-- ____________________________________________________________________________
-- Hypothèses si nécessaire :
-- ____________________________________________________________________________
-- Résultat attendu :
--     IDCLI    NBREVTS
------------ ----------
--         1          2
--____________________________________________________________________________
-- Requête SQL :
SELECT B.idcli, COUNT(DISTINCT B.idevt) AS NBREVTS
FROM BILLET B, CLIENT C
WHERE B.idcli = C.idcli
AND upper(C.nomcli) = upper('MARTIN')
AND upper(C.prenomcli) = upper('Jean')
GROUP BY B.idcli;
