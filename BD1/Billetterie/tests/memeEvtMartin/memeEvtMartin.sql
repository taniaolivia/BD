-- ____________________________________________________________________________
-- Fichier          : memeEvtMartin.sql
-- Auteur           : Brouillé Théo
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Q7. Jean MARTIN a acheté des billets pour un événement qui a lieu le 15/12/2013,
--                    quels sont les autres clients qui ont acheté des billets pour ce même événement ?
-- ____________________________________________________________________________
-- Hypothèses si nécessaire :
-- ____________________________________________________________________________
-- Résultat attendu :
--      IDCLI NOMCLI     PRENOMCLI       IDEVT
------------ ---------- ---------- ----------
--         5 DELUC      Romain              1
--         6 MAUREAU    Samuel              1
--         2 DUPONT     Charles             1
--         3 CAVIN      Pauline             1
--         4 DIDOT      Ingrid              1
--____________________________________________________________________________
-- Requête SQL :
SELECT DISTINCT C1.idcli, C1.nomcli, C1.prenomcli, B1.idevt
FROM CLIENT C1, CLIENT C2, BILLET B1, BILLET B2
WHERE C2.idcli = B2.idcli
AND upper(C2.prenomcli) = upper('Jean')
AND upper(C2.nomcli) = upper('MARTIN')
AND B1.idevt = B2.idevt
AND C1.idcli = B1.idcli
AND C1.idcli <> C2.idcli;
