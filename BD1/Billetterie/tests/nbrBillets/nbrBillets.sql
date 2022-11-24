-- ____________________________________________________________________________
-- Fichier          : nbrBillets.sql
-- Auteur           : Brouillé Théo
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Q3. Pour chaque événement, quel est le nombre de billets vendus,
--                    listez par ordre décroissant (nombre de billets) ?
-- ____________________________________________________________________________
-- Hypothèses si nécessaire :
-- ____________________________________________________________________________
-- Résultat attendu :
--     IDEVT TITREEVT        NBRBILLETS
------------ --------------- ----------
--         3 Evt C                    3
--         2 Evt B                    2
--         1 Evt A                    1
--____________________________________________________________________________
-- Requête SQL :
SELECT E.IDEVT, E.TITREEVT, COUNT(B.IDBILLET) as nbrBillets
FROM EVENEMENT E, BILLET B
WHERE E.IDEVT = B.IDEVT
GROUP BY E.IDEVT, E.TITREEVT
ORDER BY E.IDEVT DESC;
