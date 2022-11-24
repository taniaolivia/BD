-- ============================================================================
-- Fichier          : clientMemeTourneeQueCom1.sql
-- Auteur           : Tania OLIVIA
-- Date             : 10 Decembre 2019
-- Base				: Surgeles
-- Role             : Quelles sont les autres commandes livrées lors de la même tournée qui a permis de livrer la commande de code 1 ?
-- ============================================================================


SELECT D.IDCLI, I.IDCOM
FROM COMMANDE D, LIVRAISON  L, LIVRAISON I
WHERE D.IDCOM = I.IDCOM
AND L.IDCOM = 1
AND I.IDCOM != 1
AND L.IDLIV = I.IDLIV
AND L.DATELIV = I.DATELIV
ORDER BY 1 DESC;