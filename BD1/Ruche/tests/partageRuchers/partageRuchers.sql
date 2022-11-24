-- ============================================================================
-- Fichier          : moins5euros.sql
-- Auteur           : Tania OLIVIA
-- Date             : 18 Novembre 2019
-- Base				: Surgeles
-- Role             : La requête avec IN pour connaître les commandes qui ne possèdent que des lignes 
--                    de commande dont les prix unitaires des produits sont inférieurs à 5
-- ============================================================================


SELECT A2.IDAPI, A2.NOMAPI, A2.PRENOMAPI, R2.IDRUCHER
FROM APICULTEUR A1, APICULTEUR A2, RUCHE R1, RUCHE R2, RUCHER RU1, RUCHER RU2
WHERE A1.NOMAPI = 'DUPONT' 
AND A1.PRENOMAPI = 'Jean'
AND A2.NOMAPI != 'DUPONT'
AND A1.IDAPI = R1.IDAPI
AND R2.IDRUCHER = RU2.IDRUCHER
AND R1.IDRUCHER = RU1.IDRUCHER
AND RU1.IDRUCHER = RU2.IDRUCHER
AND R2.IDAPI = A2.IDAPI;