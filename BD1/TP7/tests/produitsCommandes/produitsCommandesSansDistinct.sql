-- ============================================================================
-- Fichier          : produitsCommandesSansDistinct.sql
-- Auteur           : Tania OLIVIA
-- Date             : 6 Decembre 2019
-- Base				: Surgeles
-- Role             : La rêquete sans DISTINCT
-- ============================================================================

SELECT L.IDPRO, P.NOMPRO
FROM LIGNE_COMMANDE L, PRODUIT P
WHERE L.IDPRO = P.IDPRO;