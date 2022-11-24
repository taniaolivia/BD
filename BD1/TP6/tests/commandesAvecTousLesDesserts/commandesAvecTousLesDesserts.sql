-- ============================================================================
-- Fichier          : commandesAvecTousLesDesserts.sql
-- Auteur           : Tania OLIVIA
-- Date             : 27 Novembre 2019
-- Base             : Surgeles
-- Role             : Quelles sont les commandes qui possèdent tous les produits de type « dessert » ?
-- ============================================================================

SELECT DISTINCT L.IDCOM
FROM LIGNE_COMMANDE L
WHERE NOT EXISTS (SELECT *
                 FROM PRODUIT P
                 WHERE P.TYPEPRO = 'DESSERT'
                 AND NOT EXISTS (SELECT *
                                 FROM LIGNE_COMMANDE B
                                 WHERE B.IDPRO = P.IDPRO
                                 AND B.IDCOM = L.IDCOM));