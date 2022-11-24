-- ============================================================================
-- Fichier          : moyNbrRecoltes.sql
-- Auteur           : Tania OLIVIA
-- Date             : 13 Janvier 2020
-- Base				: Ruche
-- Role             : Quelle est la moyenne du nombre de récoltes par rucher ?
-- ============================================================================

SELECT AVG(COUNT(*)) AS MoyNbrRecoltes
FROM RUCHE R, RECOLTE RE, RUCHER RU
WHERE R.IDRU = RE.IDRU
AND RU.IDRUCHER = R.IDRUCHER
GROUP BY R.IDRUCHER; 