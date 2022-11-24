-- ____________________________________________________________________________
-- Fichier          : nbrBilletsEvt1.sql
-- Auteur           : Brouillé Théo
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Q2. Pour l'événement identifié par le numéro 1,
--                    quel est le nombre de billets vendus ?
-- ____________________________________________________________________________
-- Hypothèses si nécessaire :
-- ____________________________________________________________________________
-- Résultat attendu :
--     IDEVT TITREEVT        NBRBILLETS
------------ --------------- ----------
--         1 Evt A                    3
--____________________________________________________________________________
-- Requête SQL :
SELECT E.IDEVT, E.TITREEVT, COUNT(B.IDBILLET) as nbrBillets
FROM EVENEMENT E, BILLET B
WHERE E.IDEVT = B.IDEVT
AND E.IDEVT = 1
GROUP BY E.IDEVT, E.TITREEVT;
