-- ============================================================================
-- Fichier          : produitClientsLR.sql
-- Auteur           : Tania OLIVIA
-- Date             : 27 Novembre 2019
-- Base             : Surgeles
-- Role             : Quels sont les produits commandés par tous les clients habitant à La Rochelle ?
-- ============================================================================

SELECT DISTINCT P.IDPRO
FROM PRODUIT P
WHERE NOT EXISTS (SELECT *
                 FROM CLIENT C
                 WHERE C.ADRCLI = 'La Rochelle'
                 AND NOT EXISTS (SELECT *
                                 FROM LIGNE_COMMANDE B, COMMANDE D
                                 WHERE C.IDCLI = D.IDCLI
                                 AND B.IDPRO = P.IDPRO
                                 AND B.IDCOM = D.IDCOM));