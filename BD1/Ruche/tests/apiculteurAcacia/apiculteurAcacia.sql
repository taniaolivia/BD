-- ============================================================================
-- Fichier          : apiculteurAcacia.sql
-- Auteur           : Tania OLIVIA
-- Date             : 11 Decembre 2019
-- Base				: Ruche
-- Role             : Quels sont les apiculteurs qui produisent du miel de type « acacia » ?
-- ============================================================================

SELECT A.IDAPI
FROM APICULTEUR A, RUCHE R
WHERE EXISTS (SELECT U.IDRUCHER
              FROM RUCHE R1, RUCHER U
              WHERE U.TYPEMIEL = 'acacia'
              AND R1.IDRUCHER = U.IDRUCHER
              AND R.IDAPI = A.IDAPI
              AND R.IDRU = R1.IDRU
);