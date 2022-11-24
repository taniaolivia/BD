-- ============================================================================
-- Fichier          : moins5euros.sql
-- Auteur           : Tania OLIVIA
-- Date             : 18 Novembre 2019
-- Base				: Surgeles
-- Role             : La requête avec IN pour connaître les commandes qui ne possèdent que des lignes 
--                    de commande dont les prix unitaires des produits sont inférieurs à 5
-- ============================================================================

SELECT RU.IDRUCHER
FROM RUCHER RU
WHERE NOT EXISTS (SELECT *
                  FROM RUCHE R  
                  WHERE R.NBCADRE > 10
                  AND NOT EXISTS (SELECT *
                                  FROM RUCHER RU2
                                  WHERE RU2.IDRUCHER = RU.IDRUCHER
                                  AND R.IDRUCHER = RU.IDRUCHER))           
GROUP BY RU.IDRUCHER;      

