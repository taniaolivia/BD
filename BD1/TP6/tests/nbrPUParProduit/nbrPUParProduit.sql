-- ============================================================================
-- Fichier          : nbrPUParProduit.sql
-- Auteur           : Tania OLIVIA
-- Date             : 27 Novembre 2019
-- Base             : Surgeles
-- Role             : Quel est le nombre de prix unitaire par produit ? (Un prix peut varier selon la saison et la quantité commandée)
-- ============================================================================

SELECT P.IDPRO, COUNT(DISTINCT L.PRIXUNIT) AS NBRPRIXUNIT
FROM LIGNE_COMMANDE L, PRODUIT P
WHERE L.IDPRO = P.IDPRO
GROUP BY P.IDPRO;