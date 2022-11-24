-- ============================================================================
-- Fichier          : nbrTotalProCom.sql
-- Auteur           : Tania OLIVIA
-- Date             : 27 Novembre 2019
-- Base             : Surgeles
-- Role             : Quel est le nombre total de produits commandés par commande, le
--                    résultat doit comporter le numéro du client, le numéro de la commande et il
--                    est ordonné du plus grand nombre total vers le plus petit ?
-- ============================================================================

SELECT DISTINCT D.IDCLI, D.IDCOM, SUM(QTECOM) AS NBRTOTAL
FROM COMMANDE D, LIGNE_COMMANDE L
WHERE L.IDCOM = D.IDCOM
GROUP BY D.IDCLI, D.IDCOM
ORDER BY 3 DESC, 2 ASC;