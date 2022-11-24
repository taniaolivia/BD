-- ============================================================================
-- Fichier          : apiculteurAcacia.sql
-- Auteur           : Tania OLIVIA
-- Date             : 11 Decembre 2019
-- Base				: Ruche
-- Role             : Quels sont les apiculteurs qui produisent du miel de type « acacia » ?
-- ============================================================================

SELECT DISTINCT A.IDAPI
FROM APICULTEUR A
WHERE EXISTS (SELECT *
                 FROM RUCHER RU, RUCHE R
                 WHERE RU.TYPEMIEL = 'sapin'
                 AND RU.IDRUCHER = R.IDRUCHER
                 AND R.IDAPI = A.IDAPI);