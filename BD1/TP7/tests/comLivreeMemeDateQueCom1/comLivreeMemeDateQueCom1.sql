-- ============================================================================
-- Fichier          : comLivreeMemeDateQueCom1.sql
-- Auteur           : Tania OLIVIA
-- Date             : 6 Decembre 2019
-- Base				: Surgeles
-- Role             : Quelles sont les commandes livrées à la même date que la commande de code 1 ?
-- ============================================================================

SELECT D.IDCLI, D.IDCOM
FROM COMMANDE D, LIVRAISON L, LIVRAISON I
WHERE I.IDCOM = 1
AND D.IDCOM = L.IDCOM
AND L.DATELIV = I.DATELIV;