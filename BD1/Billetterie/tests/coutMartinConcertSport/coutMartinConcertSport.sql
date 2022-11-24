-- ____________________________________________________________________________
-- Fichier          : coutMartinConcertSport.sql
-- Auteur           : Brouillé Théo
-- Date             : Janvier 2019
-- Base				: Billetterie
-- Role             : Q5. Pour chacun des événements de type "concert" ou "sport",
--                    quel est le montant dépensé par Jean MARTIN ?
-- ____________________________________________________________________________
-- Hypothèses si nécessaire :
-- ____________________________________________________________________________
-- Résultat attendu :
--     IDCLI      IDEVT TITREEVT        TYPEEVT               MONTANTDEPENSE
------------ ---------- --------------- --------------------- --------------
--         1          2 Evt B           concert                           20
--         1          3 Evt C           sport                             20
--         1          1 Evt A           concert                           40
--____________________________________________________________________________
-- Requête SQL :
SELECT B.idcli, E.idevt, E.titreevt, E.typeevt, as MONTANTDEPENSE
FROM EVENEMENT E, BILLET B, TARIF T
WHERE E.idevt = B.idevt
AND B.idtarif = T.idtarif
AND 
