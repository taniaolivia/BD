-- ============================================================================
-- Fichier          : maxProCom.sql
-- Auteur           : Tania OLIVIA
-- Date             : 27 Novembre 2019
-- Base             : Surgeles
-- Role             : Quel est le nombre maximum de produit commandés par commande ?
-- ============================================================================

SELECT DISTINCT MAX(SUM(QTECOM)) AS MAXPROCOM
FROM LIGNE_COMMANDE S, COMMANDE C
WHERE S.IDCOM = C.IDCOM 
GROUP BY C.IDCOM;